#ifndef __EMSCRIPTEN__

#include <framework/stdext/uri.h>
#include <chrono>

#include "session.h"
#include <string_view>

void HttpSession::start() {
    if (m_result->redirects >= 10) {
        auto self(shared_from_this());
        boost::asio::post(m_service, [self] {
            self->onError("Too many redirects");
        });
        return;
    }
    auto parsedUrl = parseURI(m_url);
    if (parsedUrl.domain.empty()) {
        auto self(shared_from_this());
        boost::asio::post(m_service, [self] {
            self->onError("Invalid url", self->m_url);
        });
        return;
    }

    m_domain = parsedUrl.domain;
    try {
        m_port = parsedUrl.port.empty() ? 0 : std::stoi(parsedUrl.port);
    } catch (std::exception&) {
    }
    if (!m_port) {
        m_port = parsedUrl.protocol == "https" ? 443 : 80;
    }

    m_timer.expires_after(std::chrono::seconds(m_timeout));
    m_timer.async_wait(std::bind(&HttpSession::onTimeout, shared_from_this(), std::placeholders::_1));

    m_request.version(11);
    m_request.method(boost::beast::http::verb::get);
    m_request.keep_alive(false);
    m_request.target(parsedUrl.query);
    m_request.set(boost::beast::http::field::host, parsedUrl.domain);
    m_request.set(boost::beast::http::field::user_agent, m_agent);
    if (!m_result->postData.empty()) {
        m_request.method(boost::beast::http::verb::post);
        m_request.body().assign(m_result->postData);
        m_request.content_length(m_result->postData.size());
        if (m_isJson)
            m_request.set(boost::beast::http::field::content_type, "application/json");
    }

    m_result->session = weak_from_this();
    m_resolver.async_resolve(m_domain, std::to_string(m_port), std::bind(&HttpSession::on_resolve, shared_from_this(), std::placeholders::_1, std::placeholders::_2));
}

void HttpSession::on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator) {
    if (ec)
        return onError("resolve error", ec.message());
    iterator->endpoint().port(m_port);
    m_socket.async_connect(*iterator, std::bind(&HttpSession::on_connect, shared_from_this(), std::placeholders::_1));
}

void HttpSession::on_connect(const boost::system::error_code& ec) {
    if (ec)
        return onError("connection error", ec.message());

    if (m_url.find("https") == 0 || m_url.find("HTTPS") == 0)
    {
        //m_context.set_options(boost::asio::ssl::context::default_workarounds | boost::asio::ssl::context::tlsv12_client);
        m_context = std::make_shared< boost::asio::ssl::context >(boost::asio::ssl::context::tlsv12_client);
        m_ssl = std::make_shared<boost::asio::ssl::stream<boost::asio::ip::tcp::socket&>>(m_socket, *m_context);
        m_ssl->set_verify_mode(boost::asio::ssl::verify_peer);
        m_ssl->set_verify_callback([](bool, boost::asio::ssl::verify_context&) { return true; });         

        if(!SSL_set_tlsext_host_name(m_ssl->native_handle(), m_domain.c_str()))
        {
            boost::beast::error_code ec2(static_cast<int>(::ERR_get_error()), boost::asio::error::get_ssl_category());
            return onError("HTTPS error", ec2.message());
        }

        auto self(shared_from_this());
        m_ssl->async_handshake(boost::asio::ssl::stream_base::client, [&, self] (const boost::system::error_code& ec) {
            if (ec)
                return onError("HTTPS handshake error", ec.message());

            boost::beast::http::async_write(*m_ssl, m_request, 
                                     std::bind(&HttpSession::on_request_sent, shared_from_this(), std::placeholders::_1));
        });
    }
    else
    {
        boost::beast::http::async_write(m_socket, m_request, 
                                        std::bind(&HttpSession::on_request_sent, shared_from_this(), std::placeholders::_1));
    }
}

void HttpSession::on_request_sent(const boost::system::error_code& ec) {
    if (ec)
        return onError("request sending error", ec.message());
    if(m_result->canceled)
        return onError("canceled");

    m_response.body_limit(512 * 1024 * 1024);
    m_response.header_limit(4 * 1024 * 1024);

    if (m_ssl) {
        boost::beast::http::async_read_header(*m_ssl, m_streambuf, m_response, 
                                              std::bind(&HttpSession::on_read_header, shared_from_this(),
                                                        std::placeholders::_1, std::placeholders::_2));
    } else {
        boost::beast::http::async_read_header(m_socket, m_streambuf, m_response, 
                                              std::bind(&HttpSession::on_read_header, shared_from_this(),
                                                        std::placeholders::_1, std::placeholders::_2));
    }
}

void HttpSession::on_read_header(const boost::system::error_code& ec, size_t bytes_transferred) {
    if (ec)
        return onError("read header error", ec.message());
    if(m_result->canceled)
        return onError("canceled", ec.message());

    auto msg = m_response.get();
    m_result->status = msg.result_int();
    m_result->size = atoi(std::string(msg["Content-Length"]).c_str());
    auto location = msg["Location"];

    if (!location.empty()) {        
        auto session = std::make_shared<HttpSession>(m_service, std::string(location), m_agent, m_timeout, m_isJson, m_result, m_callback);
        session->start();
        return close();
    }

    if (msg.result_int() < 200 || msg.result_int() >= 300)
        return onError("Invalid http status code", std::to_string(msg.result_int()));

    if (m_response.is_done()) { // there's nothing more to read
        return on_read(ec, 0);
    }

    if (m_ssl) {
        boost::beast::http::async_read_some(*m_ssl, m_streambuf, m_response, 
                                              std::bind(&HttpSession::on_read, shared_from_this(),
                                                        std::placeholders::_1, std::placeholders::_2));
    } else {
        boost::beast::http::async_read_some(m_socket, m_streambuf, m_response, 
                                              std::bind(&HttpSession::on_read, shared_from_this(),
                                                        std::placeholders::_1, std::placeholders::_2));
    }
}

void HttpSession::on_read(const boost::system::error_code& ec, size_t bytes_transferred) {
    if(m_result->canceled)
        return onError("canceled", ec.message());
    if (ec && ec != boost::beast::http::error::end_of_stream)
        return onError("read error", ec.message());
    else if (ec == boost::beast::http::error::end_of_stream || m_response.is_done()) {
        if (!m_result->finished) {
            m_result->finished = true;
            m_result->progress = 100;
            auto buffer = m_response.get().body();
            m_result->response.reserve(buffer.size());
            auto buffers = buffer.data();
            for (auto b : buffers) {
                m_result->response.insert(m_result->response.end(), static_cast<const uint8_t*>(b.data()), static_cast<const uint8_t*>(b.data()) + b.size());
            }
            m_callback(m_result);
        }
        return close();
    }

    if (m_result->size > 0) {
        //m_callback
        int new_progress = (int)std::min<int64_t>(100ll, (100ll * (int64_t)m_response.get().payload_size().get_value_or(0)) / (int64_t)m_result->size);
        if (!m_result->finished && new_progress != m_result->progress) // update progress
            m_callback(m_result);
        m_result->progress = new_progress;
    }
    m_timer.expires_after(std::chrono::seconds(m_timeout));

    if (m_ssl) {
        boost::beast::http::async_read_some(*m_ssl, m_streambuf, m_response, 
                                            std::bind(&HttpSession::on_read, shared_from_this(),
                                                      std::placeholders::_1, std::placeholders::_2));
    } else {
        boost::beast::http::async_read_some(m_socket, m_streambuf, m_response, 
                                            std::bind(&HttpSession::on_read, shared_from_this(),
                                                      std::placeholders::_1, std::placeholders::_2));
    }
}

void HttpSession::close() {
    m_timer.cancel();
    if (m_ssl) {
        auto self(shared_from_this());
        m_ssl->async_shutdown([&, self](const boost::system::error_code& error) {
            boost::system::error_code ec;
            m_socket.close(ec);        
        });
    } else {
        boost::system::error_code ec;
        m_socket.close(ec);
    }
}


void HttpSession::onTimeout(const boost::system::error_code& error)
{
    if(error)
        return;

    return onError("timeout");
}

void HttpSession::onError(const std::string& error, const std::string& details) {
    boost::system::error_code ec;
    m_socket.close(ec);
    m_timer.cancel(ec);
    if (!m_result->finished) {
        m_result->finished = true;
        m_result->error = error;
        if (!details.empty()) {
            m_result->error += " (";
            m_result->error += details;
            m_result->error += ")";
        }
        m_callback(m_result);
    }
}

#endif

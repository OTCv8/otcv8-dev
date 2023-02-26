#ifndef __EMSCRIPTEN__

#include <framework/stdext/uri.h>
#include <chrono>

#include "websocket.h"

void WebsocketSession::start() {
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
        m_port = parsedUrl.protocol == "wss" ? 443 : 80;
    }

    m_closed = false;
    m_timer.expires_after(std::chrono::seconds(m_timeout));
    m_timer.async_wait(std::bind(&WebsocketSession::onTimeout, shared_from_this(), std::placeholders::_1));

    if (m_url.find("wss") == 0 || m_url.find("WSS") == 0) {
        m_context = std::make_shared< boost::asio::ssl::context >(boost::asio::ssl::context::tlsv12_client);
        m_ssl = std::make_shared<boost::beast::websocket::stream<boost::beast::ssl_stream<boost::beast::tcp_stream>>>(m_service, *m_context);
        m_ssl->next_layer().set_verify_mode(boost::asio::ssl::verify_peer);
        m_ssl->next_layer().set_verify_callback([](bool, boost::asio::ssl::verify_context&) { return true; });
        if (!SSL_set_tlsext_host_name(m_ssl->next_layer().native_handle(), m_domain.c_str())) {
            boost::beast::error_code ec2(static_cast<int>(::ERR_get_error()), boost::asio::error::get_ssl_category());
            return onError("WSS error", ec2.message());
        }
    } else {
        m_socket = std::make_shared<boost::beast::websocket::stream<boost::beast::tcp_stream>>(m_service);
    }

    m_resolver.async_resolve(m_domain, std::to_string(m_port), std::bind(&WebsocketSession::on_resolve, shared_from_this(), std::placeholders::_1, std::placeholders::_2));
}

void WebsocketSession::send(std::string data)
{
    if (m_closed)
        return;

    bool sendNow = m_result->connected && m_sendQueue.empty();
    m_sendQueue.push(data);
    if (sendNow) {
        if (m_ssl) {
            m_ssl->async_write(boost::asio::buffer(m_sendQueue.front(), m_sendQueue.front().size()), std::bind(&WebsocketSession::on_send, shared_from_this(), std::placeholders::_1));
        } else {
            m_socket->async_write(boost::asio::buffer(m_sendQueue.front(), m_sendQueue.front().size()), std::bind(&WebsocketSession::on_send, shared_from_this(), std::placeholders::_1));
        }
    }
}


void WebsocketSession::on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator) {
    if (ec)
        return onError("resolve error", ec.message());
    iterator->endpoint().port(m_port);
    if (m_ssl) {
        boost::beast::get_lowest_layer(*m_ssl).async_connect(*iterator, std::bind(&WebsocketSession::on_connect, shared_from_this(), std::placeholders::_1));
    } else {
        boost::beast::get_lowest_layer(*m_socket).async_connect(*iterator, std::bind(&WebsocketSession::on_connect, shared_from_this(), std::placeholders::_1));
    }
}

void WebsocketSession::on_connect(const boost::system::error_code& ec) {
    if (ec)
        return onError("connection error", ec.message());

    if (m_url.find("wss") == 0 || m_url.find("WSS") == 0) {
            //m_context.set_options(boost::asio::ssl::context::default_workarounds | boost::asio::ssl::context::tlsv12_client);

        auto self(shared_from_this());
        m_ssl->next_layer().async_handshake(boost::asio::ssl::stream_base::client, [&, self](const boost::system::error_code& ec) {
            if (ec)
                return onError("WSS handshake error", ec.message());

            auto parsedUrl = parseURI(m_url);
            m_ssl->async_handshake(m_domain, parsedUrl.query, std::bind(&WebsocketSession::on_handshake, shared_from_this(), std::placeholders::_1));
        });
        return;
    }

    auto parsedUrl = parseURI(m_url);
    m_socket->async_handshake(m_domain, parsedUrl.query, std::bind(&WebsocketSession::on_handshake, shared_from_this(), std::placeholders::_1));
}

void WebsocketSession::on_handshake(const boost::system::error_code& ec)
{
    if (ec)
        return onError("handshake error", ec.message());
    if (m_closed)
        return;

    m_result->connected = true;
    m_callback(WEBSOCKET_OPEN, "");
    if (m_ssl) {
        m_ssl->async_read(m_streambuf, std::bind(&WebsocketSession::on_read, shared_from_this(), std::placeholders::_1, std::placeholders::_2));
        if (!m_sendQueue.empty()) {
            m_ssl->async_write(boost::asio::buffer(m_sendQueue.front(), m_sendQueue.front().size()), std::bind(&WebsocketSession::on_send, shared_from_this(), std::placeholders::_1));
        }
    } else {
        m_socket->async_read(m_streambuf, std::bind(&WebsocketSession::on_read, shared_from_this(), std::placeholders::_1, std::placeholders::_2));
        if (!m_sendQueue.empty()) {
            m_socket->async_write(boost::asio::buffer(m_sendQueue.front(), m_sendQueue.front().size()), std::bind(&WebsocketSession::on_send, shared_from_this(), std::placeholders::_1));
        }
    }
}

void WebsocketSession::on_send(const boost::system::error_code& ec) {
    if(ec)
        return onError("send error", ec.message());
    m_sendQueue.pop();
    if (m_closed)
        return;

    if (!m_sendQueue.empty()) {
        if (m_ssl) {
            m_ssl->async_write(boost::asio::buffer(m_sendQueue.front(), m_sendQueue.front().size()), std::bind(&WebsocketSession::on_send, shared_from_this(), std::placeholders::_1));
        } else {
            m_socket->async_write(boost::asio::buffer(m_sendQueue.front(), m_sendQueue.front().size()), std::bind(&WebsocketSession::on_send, shared_from_this(), std::placeholders::_1));
        }
    }
}

void WebsocketSession::on_read(const boost::system::error_code& ec, size_t bytes_transferred) {
    if(m_result->canceled)
        return onError("canceled", ec.message());
    if (ec)
        return onError("read error", ec.message());
    if (m_closed)
        return;

    m_timer.expires_after(std::chrono::seconds(m_timeout));
    m_timer.async_wait(std::bind(&WebsocketSession::onTimeout, shared_from_this(), std::placeholders::_1));

    m_callback(WEBSOCKET_MESSAGE, boost::beast::buffers_to_string(m_streambuf.data()));
    m_streambuf.clear();

    if (m_ssl) {
        m_ssl->async_read(m_streambuf, std::bind(&WebsocketSession::on_read, shared_from_this(), std::placeholders::_1, std::placeholders::_2));
    } else {
        m_socket->async_read(m_streambuf, std::bind(&WebsocketSession::on_read, shared_from_this(), std::placeholders::_1, std::placeholders::_2));
    }
}

void WebsocketSession::close() {
    m_timer.cancel();
    if (!m_closed) {
        m_closed = true;
        m_callback(WEBSOCKET_CLOSE, "");
    }
    boost::system::error_code ec;
    if (m_ssl) {
        m_ssl->close(boost::beast::websocket::close_reason(""), ec);
    } else if(m_socket) {
        m_socket->close(boost::beast::websocket::close_reason(""), ec);
    }
}

void WebsocketSession::onTimeout(const boost::system::error_code& error)
{
    if(error)
        return;

    return onError("timeout");
}

void WebsocketSession::onError(const std::string& error, const std::string& details) {
    m_result->connected = false;
    if (!m_result->finished) {
        m_result->finished = true;
        std::string msg = error;
        if (!details.empty()) {
            msg += " (";
            msg += details;
            msg += ")";
        }
        if (!m_closed) {
            m_callback(WEBSOCKET_ERROR, msg);
        }
    }
    close();
}

#endif

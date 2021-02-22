#pragma once

#include <framework/global.h>

#include <iostream>
#include <string>
#include <memory>
#include <functional>
#include <future>
#include <queue>
#include <vector>

#include "result.h"

enum WebsocketCallbackType {
    WEBSOCKET_OPEN,
    WEBSOCKET_MESSAGE,
    WEBSOCKET_ERROR,
    WEBSOCKET_CLOSE
};

using WebsocketSession_cb = std::function<void(WebsocketCallbackType, std::string message)>;

class WebsocketSession : public std::enable_shared_from_this<WebsocketSession>
{
public:

    WebsocketSession(boost::asio::io_service& service, const std::string& url, const std::string& agent, int timeout, HttpResult_ptr result, WebsocketSession_cb callback) :
        m_service(service), m_url(url), m_agent(agent), m_resolver(service), m_callback(callback), m_result(result), m_timer(service), m_timeout(timeout)
    {
        VALIDATE(m_callback);
        VALIDATE(m_result);
    };

    void start();
    void send(std::string data);
    void close();

private:
    boost::asio::io_service& m_service;
    std::string m_url;
    std::string m_agent;
    boost::asio::ip::tcp::resolver m_resolver;
    WebsocketSession_cb m_callback;
    HttpResult_ptr m_result;
    boost::asio::steady_timer m_timer;
    int m_timeout;
    bool m_closed;
    std::string m_domain;
    int m_port;

    std::shared_ptr<boost::beast::websocket::stream<boost::beast::tcp_stream>> m_socket;
    std::shared_ptr<boost::beast::websocket::stream<boost::beast::ssl_stream<boost::beast::tcp_stream>>> m_ssl;
    std::shared_ptr<boost::asio::ssl::context> m_context;

    boost::beast::flat_buffer m_streambuf{ 16 * 1024 * 1024 }; // limited to 16MB
    std::queue<std::string> m_sendQueue;

    void on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator);
    void on_connect(const boost::system::error_code& ec);
    void on_handshake(const boost::system::error_code& ec);
    void on_send(const boost::system::error_code& ec);
    void on_read(const boost::system::error_code& ec, size_t bytes_transferred);
    void onTimeout(const boost::system::error_code& error);
    void onError(const std::string& error, const std::string& details = "");
};
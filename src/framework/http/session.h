#pragma once

#include <framework/global.h>

#include <iostream>
#include <string>
#include <memory>
#include <functional>
#include <future>

#include "result.h"

class HttpSession : public std::enable_shared_from_this<HttpSession>
{
public:

    HttpSession(boost::asio::io_service& service, const std::string& url, const std::string& agent, 
                int timeout, bool isJson, HttpResult_ptr result, HttpResult_cb callback) :
        m_service(service), m_url(url), m_agent(agent), m_socket(service), m_resolver(service), 
        m_callback(callback), m_result(result), m_timer(service), m_timeout(timeout), m_isJson(isJson)
    {
        VALIDATE(m_callback);
        VALIDATE(m_result);
    };

    void start();
    void cancel() { onError("canceled"); }
    
private:
    boost::asio::io_service& m_service;
    std::string m_url;
    std::string m_agent;
    int m_port;
    boost::asio::ip::tcp::socket m_socket;
    boost::asio::ip::tcp::resolver m_resolver;
    HttpResult_cb m_callback;
    HttpResult_ptr m_result;
    boost::asio::steady_timer m_timer;
    int m_timeout;
    bool m_isJson = false;

    std::string m_domain;
    std::shared_ptr<boost::asio::ssl::stream<boost::asio::ip::tcp::socket&>> m_ssl;
    std::shared_ptr<boost::asio::ssl::context> m_context;

    boost::beast::flat_buffer m_streambuf{ 512 * 1024 * 1024 }; // limited to 512MB
    boost::beast::http::request<boost::beast::http::string_body> m_request;
    boost::beast::http::response_parser<boost::beast::http::dynamic_body> m_response;

    void on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator);
    void on_connect(const boost::system::error_code& ec);
    void on_request_sent(const boost::system::error_code& ec);
    void on_read_header(const boost::system::error_code & ec, size_t bytes_transferred);
    void on_read(const boost::system::error_code& ec, size_t bytes_transferred);
    void close();
    void onTimeout(const boost::system::error_code& error);
    void onError(const std::string& error, const std::string& details = "");
};
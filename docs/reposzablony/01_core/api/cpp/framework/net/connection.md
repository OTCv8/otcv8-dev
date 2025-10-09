---
doc_id: "cpp-api-ab3a6ffa65f1"
source_path: "framework/net/connection.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: connection.h"
summary: "Dokumentacja API C++ dla framework/net/connection.h"
tags: ["cpp", "api", "otclient"]
---

# framework/net/connection.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu connection.

## Classes/Structs

### Klasa: `Connection`

| Member | Brief | Signature |
|--------|-------|-----------|
| `poll` |  | `static void poll()` |
| `terminate` |  | `static void terminate()` |
| `connect` |  | `void connect(const std::string& host, uint16 port, const std::function<void()>& connectCallback)` |
| `close` |  | `void close()` |
| `write` |  | `void write(uint8* buffer, size_t size)` |
| `read` |  | `void read(uint32 bytes, const RecvCallback& callback)` |
| `read_until` |  | `void read_until(const std::string& what, const RecvCallback& callback)` |
| `read_some` |  | `void read_some(const RecvCallback& callback)` |
| `setErrorCallback` |  | `void setErrorCallback(const ErrorCallback& errorCallback) { m_errorCallback = errorCallback; }` |
| `getIp` |  | `int getIp()` |
| `getError` |  | `boost::system::error_code getError() { return m_error; }` |
| `isConnecting` |  | `bool isConnecting() { return m_connecting; }` |
| `isConnected` |  | `bool isConnected() { return m_connected; }` |
| `getElapsedTicksSinceLastRead` |  | `ticks_t getElapsedTicksSinceLastRead() { return m_connected ? m_activityTimer.elapsed_millis() : -1; }` |
| `asConnection` |  | `ConnectionPtr asConnection() { return static_self_cast<Connection>(); }` |
| `internal_connect` |  | `void internal_connect(asio::ip::basic_resolver<asio::ip::tcp>::iterator endpointIterator)` |
| `internal_write` |  | `void internal_write()` |
| `onResolve` |  | `void onResolve(const boost::system::error_code& error, asio::ip::tcp::resolver::iterator endpointIterator)` |
| `onConnect` |  | `void onConnect(const boost::system::error_code& error)` |
| `onCanWrite` |  | `void onCanWrite(const boost::system::error_code& error)` |
| `onWrite` |  | `void onWrite(const boost::system::error_code& error, size_t writeSize, std::shared_ptr<asio::streambuf> outputStream)` |
| `onRecv` |  | `void onRecv(const boost::system::error_code& error, size_t recvSize)` |
| `onTimeout` |  | `void onTimeout(const boost::system::error_code& error)` |
| `handleError` |  | `void handleError(const boost::system::error_code& error)` |
| `m_connectCallback` |  | `std::function<void()> m_connectCallback` |
| `m_errorCallback` |  | `ErrorCallback m_errorCallback` |
| `m_recvCallback` |  | `RecvCallback m_recvCallback` |
| `m_readTimer` |  | `asio::steady_timer m_readTimer` |
| `m_writeTimer` |  | `asio::steady_timer m_writeTimer` |
| `m_delayedWriteTimer` |  | `asio::steady_timer m_delayedWriteTimer` |
| `m_resolver` |  | `asio::ip::tcp::resolver m_resolver` |
| `m_socket` |  | `asio::ip::tcp::socket m_socket` |
| `m_outputStream` |  | `std::shared_ptr<asio::streambuf> m_outputStream` |
| `m_inputStream` |  | `asio::streambuf m_inputStream` |
| `m_connected` |  | `bool m_connected` |
| `m_connecting` |  | `bool m_connecting` |
| `m_error` |  | `boost::system::error_code m_error` |
| `m_activityTimer` |  | `stdext::timer m_activityTimer` |

## Functions

### `poll`

**Sygnatura:** `static void poll()`

### `terminate`

**Sygnatura:** `static void terminate()`

### `connect`

**Sygnatura:** `void connect(const std::string& host, uint16 port, const std::function<void()>& connectCallback)`

### `close`

**Sygnatura:** `void close()`

### `write`

**Sygnatura:** `void write(uint8* buffer, size_t size)`

### `read`

**Sygnatura:** `void read(uint32 bytes, const RecvCallback& callback)`

### `read_until`

**Sygnatura:** `void read_until(const std::string& what, const RecvCallback& callback)`

### `read_some`

**Sygnatura:** `void read_some(const RecvCallback& callback)`

### `setErrorCallback`

**Sygnatura:** `void setErrorCallback(const ErrorCallback& errorCallback) { m_errorCallback = errorCallback; }`

### `getIp`

**Sygnatura:** `int getIp()`

### `getError`

**Sygnatura:** `boost::system::error_code getError() { return m_error; }`

### `isConnecting`

**Sygnatura:** `bool isConnecting() { return m_connecting; }`

### `isConnected`

**Sygnatura:** `bool isConnected() { return m_connected; }`

### `getElapsedTicksSinceLastRead`

**Sygnatura:** `ticks_t getElapsedTicksSinceLastRead() { return m_connected ? m_activityTimer.elapsed_millis() : -1; }`

### `asConnection`

**Sygnatura:** `ConnectionPtr asConnection() { return static_self_cast<Connection>(); }`

### `internal_connect`

**Sygnatura:** `void internal_connect(asio::ip::basic_resolver<asio::ip::tcp>::iterator endpointIterator)`

### `internal_write`

**Sygnatura:** `void internal_write()`

### `onResolve`

**Sygnatura:** `void onResolve(const boost::system::error_code& error, asio::ip::tcp::resolver::iterator endpointIterator)`

### `onConnect`

**Sygnatura:** `void onConnect(const boost::system::error_code& error)`

### `onCanWrite`

**Sygnatura:** `void onCanWrite(const boost::system::error_code& error)`

### `onWrite`

**Sygnatura:** `void onWrite(const boost::system::error_code& error, size_t writeSize, std::shared_ptr<asio::streambuf> outputStream)`

### `onRecv`

**Sygnatura:** `void onRecv(const boost::system::error_code& error, size_t recvSize)`

### `onTimeout`

**Sygnatura:** `void onTimeout(const boost::system::error_code& error)`

### `handleError`

**Sygnatura:** `void handleError(const boost::system::error_code& error)`

## Types/Aliases

### `ErrorCallback`

**Typedef:** `std::function<void(const boost::system::error_code&)>`

### `RecvCallback`

**Typedef:** `std::function<void(uint8*, uint32)>`

## Class Diagram

Zobacz: [../diagrams/connection.mmd](../diagrams/connection.mmd)

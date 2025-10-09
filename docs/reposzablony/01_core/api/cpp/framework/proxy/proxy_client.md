---
doc_id: "cpp-api-000e888be866"
source_path: "framework/proxy/proxy_client.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: proxy_client.h"
summary: "Dokumentacja API C++ dla framework/proxy/proxy_client.h"
tags: ["cpp", "api", "otclient"]
---

# framework/proxy/proxy_client.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu proxy_client.

## Classes/Structs

### Klasa: `Session`

| Member | Brief | Signature |
|--------|-------|-----------|
| `m_io` |  | `: m_io(io), m_timer(io), m_socket(io), m_resolver(io), m_state(STATE_NOT_CONNECTED)` |
| `start` |  | `void start()` |
| `terminate` |  | `void terminate()` |
| `getPing` |  | `uint32_t getPing() { return m_ping + m_priority; }` |
| `getRealPing` |  | `uint32_t getRealPing() { return m_ping; }` |
| `getPriority` |  | `uint32_t getPriority() { return m_priority; }` |
| `isConnected` |  | `bool isConnected() { return m_state == STATE_CONNECTED; }` |
| `getHost` |  | `std::string getHost() { return m_host; }` |
| `getPort` |  | `uint16_t getPort() { return m_port; }` |
| `getDebugInfo` |  | `std::string getDebugInfo()` |
| `isActive` |  | `bool isActive() { return m_sessions > 0; }` |
| `addSession` |  | `void addSession(uint32_t id, int m_port)` |
| `removeSession` |  | `void removeSession(uint32_t id)` |
| `send` |  | `void send(const ProxyPacketPtr& packet)` |

### Klasa: `Proxy`

### Klasa: `Session`

## Enums

### `ProxyState`

**Wartości:**

- `STATE_NOT_CONNECTED`
- `STATE_CONNECTING`
- `STATE_CONNECTING_WAIT_FOR_PING`
- `STATE_CONNECTED`

## Functions

### `m_io`

**Sygnatura:** `: m_io(io), m_timer(io), m_socket(io), m_resolver(io), m_state(STATE_NOT_CONNECTED)`

### `start`

**Sygnatura:** `void start()`

### `terminate`

**Sygnatura:** `void terminate()`

### `getPing`

**Sygnatura:** `uint32_t getPing() { return m_ping + m_priority; }`

### `getRealPing`

**Sygnatura:** `uint32_t getRealPing() { return m_ping; }`

### `getPriority`

**Sygnatura:** `uint32_t getPriority() { return m_priority; }`

### `isConnected`

**Sygnatura:** `bool isConnected() { return m_state == STATE_CONNECTED; }`

### `getHost`

**Sygnatura:** `std::string getHost() { return m_host; }`

### `getPort`

**Sygnatura:** `uint16_t getPort() { return m_port; }`

### `getDebugInfo`

**Sygnatura:** `std::string getDebugInfo()`

### `isActive`

**Sygnatura:** `bool isActive() { return m_sessions > 0; }`

### `addSession`

**Sygnatura:** `void addSession(uint32_t id, int m_port)`

### `removeSession`

**Sygnatura:** `void removeSession(uint32_t id)`

### `send`

**Sygnatura:** `void send(const ProxyPacketPtr& packet)`

### `check`

**Sygnatura:** `void check(const boost::system::error_code& ec = boost::system::error_code())`

### `connect`

**Sygnatura:** `void connect()`

### `disconnect`

**Sygnatura:** `void disconnect()`

### `ping`

**Sygnatura:** `void ping()`

### `onPing`

**Sygnatura:** `void onPing(uint32_t packetId)`

### `readHeader`

**Sygnatura:** `void readHeader()`

### `onHeader`

**Sygnatura:** `void onHeader(const boost::system::error_code& ec, std::size_t bytes_transferred)`

### `onPacket`

**Sygnatura:** `void onPacket(const boost::system::error_code& ec, std::size_t bytes_transferred)`

### `onSent`

**Sygnatura:** `void onSent(const boost::system::error_code& ec, std::size_t bytes_transferred)`

### `m_io`

**Sygnatura:** `: m_io(io), m_timer(io), m_socket(std::move(socket))`

### `m_io`

**Sygnatura:** `: m_io(io), m_timer(io), m_socket(io)`

### `getId`

**Sygnatura:** `uint32_t getId() { return m_id; }`

### `start`

**Sygnatura:** `void start(int maxConnections = 3)`

### `terminate`

**Sygnatura:** `void terminate(boost::system::error_code ec = boost::asio::error::eof)`

### `onPacket`

**Sygnatura:** `void onPacket(const ProxyPacketPtr& packet)`

### `onProxyPacket`

**Sygnatura:** `void onProxyPacket(uint32_t packetId, uint32_t lastRecivedPacketId, const ProxyPacketPtr& packet)`

### `check`

**Sygnatura:** `void check(const boost::system::error_code& ec)`

### `selectProxies`

**Sygnatura:** `void selectProxies()`

### `readTibia12Header`

**Sygnatura:** `void readTibia12Header()`

### `readHeader`

**Sygnatura:** `void readHeader()`

### `onHeader`

**Sygnatura:** `void onHeader(const boost::system::error_code& ec, std::size_t bytes_transferred)`

### `onBody`

**Sygnatura:** `void onBody(const boost::system::error_code& ec, std::size_t bytes_transferred)`

### `onSent`

**Sygnatura:** `void onSent(const boost::system::error_code& ec, std::size_t bytes_transferred)`

## Types/Aliases

### `ProxyPacket`

**Using:** `std::vector<uint8_t>`

### `ProxyPacketPtr`

**Using:** `std::shared_ptr<ProxyPacket>`

### `SessionPtr`

**Using:** `std::shared_ptr<Session>`

### `ProxyPtr`

**Using:** `std::shared_ptr<Proxy>`

## Class Diagram

Zobacz: [../diagrams/proxy_client.mmd](../diagrams/proxy_client.mmd)

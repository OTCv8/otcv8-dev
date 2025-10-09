---
doc_id: "cpp-api-6b0f5ce9c782"
source_path: "framework/http/websocket.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: websocket.h"
summary: "Dokumentacja API C++ dla framework/http/websocket.h"
tags: ["cpp", "api", "otclient"]
---

# framework/http/websocket.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu websocket.

## Classes/Structs

### Klasa: `WebsocketSession`

| Member | Brief | Signature |
|--------|-------|-----------|
| `start` |  | `void start()` |
| `send` |  | `void send(std::string data)` |
| `close` |  | `void close()` |

## Enums

### `WebsocketCallbackType`

**Wartości:**

- `WEBSOCKET_OPEN`
- `WEBSOCKET_MESSAGE`
- `WEBSOCKET_ERROR`
- `WEBSOCKET_CLOSE`

## Functions

### `start`

**Sygnatura:** `void start()`

### `send`

**Sygnatura:** `void send(std::string data)`

### `close`

**Sygnatura:** `void close()`

### `on_resolve`

**Sygnatura:** `void on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator)`

### `on_connect`

**Sygnatura:** `void on_connect(const boost::system::error_code& ec)`

### `on_handshake`

**Sygnatura:** `void on_handshake(const boost::system::error_code& ec)`

### `on_send`

**Sygnatura:** `void on_send(const boost::system::error_code& ec)`

### `on_read`

**Sygnatura:** `void on_read(const boost::system::error_code& ec, size_t bytes_transferred)`

### `onTimeout`

**Sygnatura:** `void onTimeout(const boost::system::error_code& error)`

### `onError`

**Sygnatura:** `void onError(const std::string& error, const std::string& details = "")`

## Types/Aliases

### `WebsocketSession_cb`

**Using:** `std::function<void(WebsocketCallbackType, std::string message)>`

## Class Diagram

Zobacz: [../diagrams/websocket.mmd](../diagrams/websocket.mmd)

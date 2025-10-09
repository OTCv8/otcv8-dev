---
doc_id: "cpp-api-22941eef9770"
source_path: "framework/http/session.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: session.h"
summary: "Dokumentacja API C++ dla framework/http/session.h"
tags: ["cpp", "api", "otclient"]
---

# framework/http/session.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu session.

## Classes/Structs

### Klasa: `HttpSession`

| Member | Brief | Signature |
|--------|-------|-----------|
| `start` |  | `void start()` |
| `cancel` |  | `void cancel() { onError("canceled"); }` |

## Functions

### `start`

**Sygnatura:** `void start()`

### `cancel`

**Sygnatura:** `void cancel() { onError("canceled"); }`

### `on_resolve`

**Sygnatura:** `void on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator)`

### `on_connect`

**Sygnatura:** `void on_connect(const boost::system::error_code& ec)`

### `on_request_sent`

**Sygnatura:** `void on_request_sent(const boost::system::error_code& ec)`

### `on_read_header`

**Sygnatura:** `void on_read_header(const boost::system::error_code & ec, size_t bytes_transferred)`

### `on_read`

**Sygnatura:** `void on_read(const boost::system::error_code& ec, size_t bytes_transferred)`

### `close`

**Sygnatura:** `void close()`

### `onTimeout`

**Sygnatura:** `void onTimeout(const boost::system::error_code& error)`

### `onError`

**Sygnatura:** `void onError(const std::string& error, const std::string& details = "")`

## Class Diagram

Zobacz: [../diagrams/session.mmd](../diagrams/session.mmd)

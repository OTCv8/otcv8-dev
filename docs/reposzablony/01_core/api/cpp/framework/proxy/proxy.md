---
doc_id: "cpp-api-02f6e406cee0"
source_path: "framework/proxy/proxy.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: proxy.h"
summary: "Dokumentacja API C++ dla framework/proxy/proxy.h"
tags: ["cpp", "api", "otclient"]
---

# framework/proxy/proxy.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu proxy.

## Classes/Structs

### Klasa: `ProxyManager`

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `clear`

**Sygnatura:** `void clear()`

### `setMaxActiveProxies`

**Sygnatura:** `void setMaxActiveProxies(int value)`

### `isActive`

**Sygnatura:** `bool isActive()`

### `addProxy`

**Sygnatura:** `void addProxy(const std::string& host, uint16_t port, int priority)`

### `removeProxy`

**Sygnatura:** `void removeProxy(const std::string& host, uint16_t port)`

### `addSession`

**Sygnatura:** `uint32_t addSession(uint16_t port, std::function<void(ProxyPacketPtr)> recvCallback, std::function<void(boost::system::error_code)> disconnectCallback)`

### `removeSession`

**Sygnatura:** `void removeSession(uint32_t sessionId)`

### `send`

**Sygnatura:** `void send(uint32_t sessionId, ProxyPacketPtr packet)`

### `getProxies`

**Sygnatura:** `std::map<std::string, uint32_t> getProxies()`

### `getProxiesDebugInfo`

**Sygnatura:** `std::map<std::string, std::string> getProxiesDebugInfo()`

### `getPing`

**Sygnatura:** `int getPing()`

## Class Diagram

Zobacz: [../diagrams/proxy.mmd](../diagrams/proxy.mmd)

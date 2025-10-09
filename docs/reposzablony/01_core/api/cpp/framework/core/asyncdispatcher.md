---
doc_id: "cpp-api-2837ed24d080"
source_path: "framework/core/asyncdispatcher.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: asyncdispatcher.h"
summary: "Dokumentacja API C++ dla framework/core/asyncdispatcher.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/asyncdispatcher.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu asyncdispatcher.

## Classes/Structs

### Klasa: `AsyncDispatcher`

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `spawn_thread`

**Sygnatura:** `void spawn_thread()`

### `stop`

**Sygnatura:** `void stop()`

### `lock`

**Sygnatura:** `std::lock_guard<std::mutex> lock(m_mutex)`

### `dispatch`

**Sygnatura:** `void dispatch(std::function<void()> f) {`

### `lock`

**Sygnatura:** `std::lock_guard<std::mutex> lock(m_mutex)`

### `exec_loop`

**Sygnatura:** `void exec_loop()`

## Class Diagram

Zobacz: [../diagrams/asyncdispatcher.mmd](../diagrams/asyncdispatcher.mmd)

---
doc_id: "lua-spec-1e3ced6a6377"
source_path: "corelib/http.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: http.lua"
summary: "Dokumentacja modułu Lua dla corelib/http.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/http.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla http.

## Globals/Exports

### `images`

### `operations`

## Functions

### `HTTP.get(url, callback)`

**Parametry:**

- `url`
- `callback`

### `HTTP.getJSON(url, callback)`

**Parametry:**

- `url`
- `callback`

### `HTTP.post(url, data, callback)`

**Parametry:**

- `url`
- `data`
- `callback`

### `HTTP.postJSON(url, data, callback)`

**Parametry:**

- `url`
- `data`
- `callback`

### `HTTP.download(url, file, callback, progressCallback)`

**Parametry:**

- `url`
- `file`
- `callback`
- `progressCallback`

### `HTTP.downloadImage(url, callback)`

**Parametry:**

- `url`
- `callback`

### `HTTP.webSocket(url, callbacks, timeout, jsonWebsocket)`

**Parametry:**

- `url`
- `callbacks`
- `timeout`
- `jsonWebsocket`

### `close()`

### `send(message)`

**Parametry:**

- `message`

### `HTTP.webSocketJSON(url, callbacks, timeout)`

**Parametry:**

- `url`
- `callbacks`
- `timeout`

### `HTTP.cancel(operationId)`

**Parametry:**

- `operationId`

### `HTTP.onGet(operationId, url, err, data)`

**Parametry:**

- `operationId`
- `url`
- `err`
- `data`

### `HTTP.onGetProgress(operationId, url, progress)`

**Parametry:**

- `operationId`
- `url`
- `progress`

### `HTTP.onPost(operationId, url, err, data)`

**Parametry:**

- `operationId`
- `url`
- `err`
- `data`

### `HTTP.onPostProgress(operationId, url, progress)`

**Parametry:**

- `operationId`
- `url`
- `progress`

### `HTTP.onDownload(operationId, url, err, path, checksum)`

**Parametry:**

- `operationId`
- `url`
- `err`
- `path`
- `checksum`

### `HTTP.onDownloadProgress(operationId, url, progress, speed)`

**Parametry:**

- `operationId`
- `url`
- `progress`
- `speed`

### `HTTP.onWsOpen(operationId, message)`

**Parametry:**

- `operationId`
- `message`

### `HTTP.onWsMessage(operationId, message)`

**Parametry:**

- `operationId`
- `message`

### `HTTP.onWsClose(operationId, message)`

**Parametry:**

- `operationId`
- `message`

### `HTTP.onWsError(operationId, message)`

**Parametry:**

- `operationId`
- `message`

## Events/Callbacks

### `Get`

**Wywołanie:** `function HTTP.onGet(operationId, url, err, data)`

### `GetProgress`

**Wywołanie:** `function HTTP.onGetProgress(operationId, url, progress)`

### `Post`

**Wywołanie:** `function HTTP.onPost(operationId, url, err, data)`

### `PostProgress`

**Wywołanie:** `function HTTP.onPostProgress(operationId, url, progress)`

### `Download`

**Wywołanie:** `function HTTP.onDownload(operationId, url, err, path, checksum)`

### `DownloadProgress`

**Wywołanie:** `function HTTP.onDownloadProgress(operationId, url, progress, speed)`

### `WsOpen`

**Wywołanie:** `function HTTP.onWsOpen(operationId, message)`

### `Open`

**Wywołanie:** `operation.callbacks.onOpen(message, operationId)`

### `WsMessage`

**Wywołanie:** `function HTTP.onWsMessage(operationId, message)`

### `Error`

**Wywołanie:** `operation.callbacks.onError(err, operationId)`

### `Message`

**Wywołanie:** `operation.callbacks.onMessage(result, operationId)`

### `Message`

**Wywołanie:** `operation.callbacks.onMessage(message, operationId)`

### `WsClose`

**Wywołanie:** `function HTTP.onWsClose(operationId, message)`

### `Close`

**Wywołanie:** `operation.callbacks.onClose(message, operationId)`

### `WsError`

**Wywołanie:** `function HTTP.onWsError(operationId, message)`

### `Error`

**Wywołanie:** `operation.callbacks.onError(message, operationId)`

### `g_http`

**Wywołanie:** `connect(g_http,`

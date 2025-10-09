---
doc_id: "lua-spec-006b438ba564"
source_path: "game_bot/functions/server.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: server.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/server.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/server.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla server.

## Functions

### `context.BotServer.init(name, channel)`

**Parametry:**

- `name`
- `channel`

### `onMessage(message, socketId)`

**Parametry:**

- `message`
- `socketId`

### `onClose(message, socketId)`

**Parametry:**

- `message`
- `socketId`

### `context.BotServer.terminate()`

### `context.BotServer.listen(topic, callback)`

**Parametry:**

- `topic`
- `callback`

### `context.BotServer.send(topic, message)`

**Parametry:**

- `topic`
- `message`

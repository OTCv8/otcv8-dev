---
doc_id: "lua-spec-2a8f3eb49687"
source_path: "gamelib/textmessages.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: textmessages.lua"
summary: "Dokumentacja modułu Lua dla gamelib/textmessages.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/textmessages.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla textmessages.

## Functions

### `g_game.onTextMessage(messageMode, message)`

**Parametry:**

- `messageMode`
- `message`

### `registerMessageMode(messageMode, callback)`

**Parametry:**

- `messageMode`
- `callback`

### `unregisterMessageMode(messageMode, callback)`

**Parametry:**

- `messageMode`
- `callback`

## Events/Callbacks

### `TextMessage`

**Wywołanie:** `function g_game.onTextMessage(messageMode, message)`

---
doc_id: "lua-spec-7700e6aac66a"
source_path: "game_market/marketprotocol.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: marketprotocol.lua"
summary: "Dokumentacja modułu Lua dla game_market/marketprotocol.lua"
tags: ["lua", "module", "otclient"]
---

# game_market/marketprotocol.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla marketprotocol.

## Globals/Exports

### `MarketProtocol`

### `items`

## Functions

### `send(msg)`

**Parametry:**

- `msg`

### `readMarketOffer(msg, action, var)`

**Parametry:**

- `msg`
- `action`
- `var`

### `parseMarketEnter(protocol, msg)`

parsing protocols

**Parametry:**

- `protocol`
- `msg`

### `parseMarketLeave(protocol, msg)`

**Parametry:**

- `protocol`
- `msg`

### `parseMarketDetail(protocol, msg)`

**Parametry:**

- `protocol`
- `msg`

### `parseMarketBrowse(protocol, msg)`

**Parametry:**

- `protocol`
- `msg`

### `initProtocol()`

public functions

### `terminateProtocol()`

### `MarketProtocol.updateProtocol(_protocol)`

**Parametry:**

- `_protocol`

### `MarketProtocol.registerProtocol()`

### `MarketProtocol.unregisterProtocol()`

### `MarketProtocol.silent(mode)`

**Parametry:**

- `mode`

### `MarketProtocol.sendMarketLeave()`

sending protocols

### `MarketProtocol.sendMarketBrowse(browseId)`

**Parametry:**

- `browseId`

### `MarketProtocol.sendMarketBrowseMyOffers()`

### `MarketProtocol.sendMarketBrowseMyHistory()`

### `MarketProtocol.sendMarketCreateOffer(type, spriteId, amount, price, anonymous)`

**Parametry:**

- `type`
- `spriteId`
- `amount`
- `price`
- `anonymous`

### `MarketProtocol.sendMarketCancelOffer(timestamp, counter)`

**Parametry:**

- `timestamp`
- `counter`

### `MarketProtocol.sendMarketAcceptOffer(timestamp, counter, amount)`

**Parametry:**

- `timestamp`
- `counter`
- `amount`

## Events/Callbacks

### `MarketLeave`

**Wywołanie:** `Market.onMarketLeave()`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = MarketProtocol.registerProtocol,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = MarketProtocol.registerProtocol,`

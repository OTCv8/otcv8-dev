---
doc_id: "lua-spec-f3f2e0b1bd78"
source_path: "game_bot/default_configs/vBot_4.8/cavebot/bank.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: bank.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/cavebot/bank.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/cavebot/bank.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla bank.

## Functions

### `CaveBot.Extensions.Bank.setup()`

## Events/Callbacks

### `umber`

**Wywołanie:** `amount = tonumber(data[3]:trim())`

### `umber`

**Wywołanie:** `balanceLeft = tonumber(data[4]:trim())`

### `umber`

**Wywołanie:** `local value = tonumber(amount)`

### `versation`

**Wywołanie:** `CaveBot.Conversation("hi", "deposit all", "yes")`

### `versation`

**Wywołanie:** `CaveBot.Conversation("hi", "withdraw", value, "yes")`

### `versation`

first check balance

**Wywołanie:** `CaveBot.Conversation("hi", "balance")`

### `event`

**Wywołanie:** `schedule(5000, function()`

### `versation`

**Wywołanie:** `CaveBot.Conversation("hi", "transfer", amountToTransfer, transferName, "yes")`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

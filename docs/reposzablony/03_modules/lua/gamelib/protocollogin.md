---
doc_id: "lua-spec-0b559c2b4047"
source_path: "gamelib/protocollogin.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: protocollogin.lua"
summary: "Dokumentacja modułu Lua dla gamelib/protocollogin.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/protocollogin.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla protocollogin.

## Events/Callbacks

### `host`

**Wywołanie:** `self:connect(host, port)`

### `)`

**Wywołanie:** `self:disconnect()`

### `tentRevision`

**Wywołanie:** `msg:addU16(g_things.getContentRevision())`

### `umber`

**Wywołanie:** `msg:addU32(tonumber(self.accountName))`

### `umber`

**Wywołanie:** `msg:addU16(tonumber(version))`

### `umber`

**Wywołanie:** `msg:addU8(booleantonumber(self.stayLogged))`

### `Connect`

**Wywołanie:** `function ProtocolLogin:onConnect()`

### `nectCallback`

**Wywołanie:** `self:connectCallback()`

### `Recv`

**Wywołanie:** `function ProtocolLogin:onRecv(msg)`

### `Key`

**Wywołanie:** `self:parseSessionKey(msg)`

### `)`

**Wywołanie:** `self:disconnect()`

### `Key`

**Wywołanie:** `function ProtocolLogin:parseSessionKey(msg)`

### `Error`

**Wywołanie:** `function ProtocolLogin:onError(msg, code)`

### `necting`

**Wywołanie:** `local text = translateNetworkError(code, self:isConnecting(), msg)`

---
doc_id: "lua-spec-94c810b820a9"
source_path: "gamelib/game.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: game.lua"
summary: "Dokumentacja modułu Lua dla gamelib/game.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/game.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla game.

## Functions

### `g_game.getRsa()`

### `g_game.findPlayerItem(itemId, subType)`

**Parametry:**

- `itemId`
- `subType`

### `g_game.chooseRsa(host)`

**Parametry:**

- `host`

### `g_game.setRsa(rsa, e)`

**Parametry:**

- `rsa`
- `e`

### `g_game.isOfficialTibia()`

### `g_game.getSupportedClients()`

### `g_game.getClientProtocolVersion(client)`

The client version and protocol version where unsynchronized for some releases, not sure if this will be the normal standard. Client Version: Publicly given version when downloading Cipsoft client. Protocol Version: Previously was the same as the client version, but was unsychronized in some releases, now it needs to be verified and added here if it does not match the client version. Reason for defining both: The server now requires a Client version and Protocol version from the client. Important: Use getClientVersion for specific protocol features to ensure we are using the proper version.

**Parametry:**

- `client`

## Events/Callbacks

### `tainers`

**Wywołanie:** `return g_game.findItemInContainers(itemId, subType)`

---
doc_id: "lua-spec-398ae6915719"
source_path: "client_entergame/entergame.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: entergame.lua"
summary: "Dokumentacja modułu Lua dla client_entergame/entergame.lua"
tags: ["lua", "module", "otclient"]
---

# client_entergame/entergame.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla entergame.

## Functions

### `onProtocolError(protocol, message, errorCode)`

private functions

**Parametry:**

- `protocol`
- `message`
- `errorCode`

### `onSessionKey(protocol, sessionKey)`

**Parametry:**

- `protocol`
- `sessionKey`

### `onCharacterList(protocol, characters, account, otui)`

**Parametry:**

- `protocol`
- `characters`
- `account`
- `otui`

### `onUpdateNeeded(protocol, signature)`

**Parametry:**

- `protocol`
- `signature`

### `onProxyList(protocol, proxies)`

**Parametry:**

- `protocol`
- `proxies`

### `parseFeatures(features)`

**Parametry:**

- `features`

### `validateThings(things)`

**Parametry:**

- `things`

### `onTibia12HTTPResult(session, playdata)`

**Parametry:**

- `session`
- `playdata`

### `onHTTPResult(data, err)`

**Parametry:**

- `data`
- `err`

### `EnterGame.init()`

public functions

### `EnterGame.terminate()`

### `EnterGame.show()`

### `EnterGame.hide()`

### `EnterGame.openWindow()`

### `EnterGame.clearAccountFields()`

### `EnterGame.onServerChange()`

### `EnterGame.doLogin(account, password, token, host)`

**Parametry:**

- `account`
- `password`
- `token`
- `host`

### `EnterGame.doLoginHttp()`

### `EnterGame.onError(err)`

**Parametry:**

- `err`

### `EnterGame.onLoginError(err)`

**Parametry:**

- `err`

## Events/Callbacks

### `ProtocolError`

private functions

**Wywołanie:** `local function onProtocolError(protocol, message, errorCode)`

### `Error`

**Wywołanie:** `return EnterGame.onError(message)`

### `LoginError`

**Wywołanie:** `return EnterGame.onLoginError(message)`

### `SessionKey`

**Wywołanie:** `local function onSessionKey(protocol, sessionKey)`

### `CharacterList`

**Wywołanie:** `local function onCharacterList(protocol, characters, account, otui)`

### `UpdateNeeded`

**Wywołanie:** `local function onUpdateNeeded(protocol, signature)`

### `Error`

**Wywołanie:** `return EnterGame.onError(tr('Your client needs updating, try redownloading it.'))`

### `ProxyList`

**Wywołanie:** `local function onProxyList(protocol, proxies)`

### `Tibia12HTTPResult`

**Wywołanie:** `local function onTibia12HTTPResult(session, playdata)`

### `ds`

**Wywołanie:** `if session["premiumuntil"] > g_clock.seconds() then`

### `ds`

**Wywołanie:** `account.subStatus = math.floor((session["premiumuntil"] - g_clock.seconds()) / 86400)`

### `Error`

**Wywołanie:** `return EnterGame.onError(incorrectThings)`

### `SessionKey`

**Wywołanie:** `onSessionKey(nil, session["sessionkey"])`

### `umber`

**Wywołanie:** `g_proxy.addProxy(proxy["host"], tonumber(proxy["port"]), tonumber(proxy["priority"]))`

### `CharacterList`

**Wywołanie:** `onCharacterList(nil, characters, account, nil)`

### `HTTPResult`

**Wywołanie:** `local function onHTTPResult(data, err)`

### `Error`

**Wywołanie:** `return EnterGame.onError(err)`

### `LoginError`

**Wywołanie:** `return EnterGame.onLoginError(data['error'])`

### `LoginError`

**Wywołanie:** `return EnterGame.onLoginError(data['errorMessage'])`

### `Tibia12HTTPResult`

**Wywołanie:** `return onTibia12HTTPResult(data["session"], data["playdata"])`

### `Error`

**Wywołanie:** `return EnterGame.onError(incorrectThings)`

### `umber`

**Wywołanie:** `customProtocol = tonumber(customProtocol)`

### `SessionKey`

**Wywołanie:** `onSessionKey(nil, session)`

### `umber`

**Wywołanie:** `g_proxy.addProxy(proxy["host"], tonumber(proxy["port"]), tonumber(proxy["priority"]))`

### `CharacterList`

**Wywołanie:** `onCharacterList(nil, characters, account, nil)`

### `displayUI`

**Wywołanie:** `enterGame = g_ui.displayUI('entergame')`

### `sCount`

**Wywołanie:** `if serverSelector:getOptionsCount() == 0 or ALLOW_CUSTOM_SERVERS then`

### `sCount`

**Wywołanie:** `if serverSelector:getOptionsCount() == 1 then`

### `ServerChange`

**Wywołanie:** `function EnterGame.onServerChange()`

### `errorBox`

**Wywołanie:** `connect(errorBox, { onOk = EnterGame.show })`

### `umber`

**Wywołanie:** `G.clientVersion = tonumber(clientVersionSelector:getText())`

### `umber`

**Wywołanie:** `G.clientVersion = tonumber(server_params[4])`

### `umber`

**Wywołanie:** `if tostring(tonumber(server_params[3])) == server_params[3] then`

### `umber`

**Wywołanie:** `G.clientVersion = tonumber(server_params[3])`

### `umber`

**Wywołanie:** `server_port = tonumber(server_params[2])`

### `umber`

**Wywołanie:** `G.clientVersion = tonumber(server_params[3])`

### `Error`

**Wywołanie:** `return EnterGame.onError("Invalid server, it should be in format IP:PORT or it should be http url to login script")`

### `Error`

**Wywołanie:** `return EnterGame.onError(incorrectThings)`

### `loadBox`

**Wywołanie:** `connect(loadBox, { onCancel = function(msgbox)`

### `umber`

**Wywołanie:** `g_game.enableFeature(tonumber(server_params[i]))`

### `Error`

**Wywołanie:** `return EnterGame.onError("Invalid server url: " .. G.host)`

### `loadBox`

**Wywołanie:** `connect(loadBox, { onCancel = function(msgbox)`

### `Error`

**Wywołanie:** `function EnterGame.onError(err)`

### `LoginError`

**Wywołanie:** `function EnterGame.onLoginError(err)`

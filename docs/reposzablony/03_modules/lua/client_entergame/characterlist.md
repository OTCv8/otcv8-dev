---
doc_id: "lua-spec-9e410279f3d4"
source_path: "client_entergame/characterlist.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: characterlist.lua"
summary: "Dokumentacja modułu Lua dla client_entergame/characterlist.lua"
tags: ["lua", "module", "otclient"]
---

# client_entergame/characterlist.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla characterlist.

## Functions

### `tryLogin(charInfo, tries)`

private functions

**Parametry:**

- `charInfo`
- `tries`

### `updateWait(timeStart, timeEnd)`

**Parametry:**

- `timeStart`
- `timeEnd`

### `resendWait()`

### `onLoginWait(message, time)`

**Parametry:**

- `message`
- `time`

### `onGameLoginError(message)`

**Parametry:**

- `message`

### `errorBox.onOk()`

### `onGameLoginToken(unknown)`

**Parametry:**

- `unknown`

### `errorBox.onOk()`

### `onGameConnectionError(message, code)`

**Parametry:**

- `message`
- `code`

### `errorBox.onOk()`

### `onGameUpdateNeeded(signature)`

**Parametry:**

- `signature`

### `errorBox.onOk()`

### `onGameEnd()`

### `onLogout()`

### `scheduleAutoReconnect()`

### `executeAutoReconnect()`

### `CharacterList.init()`

public functions

### `CharacterList.terminate()`

### `CharacterList.create(characters, account, otui)`

**Parametry:**

- `characters`
- `account`
- `otui`

### `characterList.onChildFocusChange()`

### `autoReconnectButton.onClick(widget)`

**Parametry:**

- `widget`

### `CharacterList.destroy()`

### `CharacterList.show()`

### `CharacterList.hide(showLogin)`

**Parametry:**

- `showLogin`

### `CharacterList.showAgain()`

### `CharacterList.isVisible()`

### `CharacterList.doLogin()`

### `CharacterList.destroyLoadBox()`

### `CharacterList.cancelWait()`

## Events/Callbacks

### `loadBox`

**Wywołanie:** `connect(loadBox, { onCancel = function()`

### `ds`

**Wywołanie:** `local time = g_clock.seconds()`

### `LoginWait`

**Wywołanie:** `local function onLoginWait(message, time)`

### `displayUI`

**Wywołanie:** `waitingWindow = g_ui.displayUI('waitinglist')`

### `ds`

**Wywołanie:** `updateWaitEvent = scheduleEvent(function() updateWait(g_clock.seconds(), g_clock.seconds() + time) end, 0)`

### `GameLoginError`

**Wywołanie:** `function onGameLoginError(message)`

### `)`

**Wywołanie:** `scheduleAutoReconnect()`

### `GameLoginToken`

**Wywołanie:** `function onGameLoginToken(unknown)`

### `GameConnectionError`

**Wywołanie:** `function onGameConnectionError(message, code)`

### `necting`

**Wywołanie:** `local text = translateNetworkError(code, g_game.getProtocolGame() and g_game.getProtocolGame():isConnecting(), message)`

### `)`

**Wywołanie:** `scheduleAutoReconnect()`

### `GameUpdateNeeded`

**Wywołanie:** `function onGameUpdateNeeded(signature)`

### `GameEnd`

**Wywołanie:** `function onGameEnd()`

### `)`

**Wywołanie:** `scheduleAutoReconnect()`

### `Logout`

**Wywołanie:** `function onLogout()`

### `)`

**Wywołanie:** `function scheduleAutoReconnect()`

### `)  `

**Wywołanie:** `function executeAutoReconnect()`

### `g_game`

**Wywołanie:** `connect(g_game, { onLoginError = onGameLoginError })`

### `g_game`

**Wywołanie:** `connect(g_game, { onLoginToken = onGameLoginToken })`

### `g_game`

**Wywołanie:** `connect(g_game, { onUpdateNeeded = onGameUpdateNeeded })`

### `g_game`

**Wywołanie:** `connect(g_game, { onConnectionError = onGameConnectionError })`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameStart = CharacterList.destroyLoadBox })`

### `g_game`

**Wywołanie:** `connect(g_game, { onLoginWait = onLoginWait })`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = onGameEnd })`

### `g_game`

**Wywołanie:** `connect(g_game, { onLogout = onLogout })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onLoginError = onGameLoginError })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onLoginToken = onGameLoginToken })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onUpdateNeeded = onGameUpdateNeeded })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onConnectionError = onGameConnectionError })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameStart = CharacterList.destroyLoadBox })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onLoginWait = onLoginWait })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onGameEnd = onGameEnd })`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onLogout = onLogout })`

### `displayUI`

**Wywołanie:** `charactersWindow = g_ui.displayUI(otui)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget('CharacterWidget', characterList)`

### `widget`

**Wywołanie:** `connect(widget, { onDoubleClick = function () CharacterList.doLogin() return true end } )`

### `event`

**Wywołanie:** `addEvent(function() characterList:ensureChildVisible(focusLabel) end)`

---
doc_id: "lua-spec-e4610f601211"
source_path: "client_profiles/profiles.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: profiles.lua"
summary: "Dokumentacja modułu Lua dla client_profiles/profiles.lua"
tags: ["lua", "module", "otclient"]
---

# client_profiles/profiles.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla profiles.

## Functions

### `init()`

### `terminate()`

### `online()`

loads settings on character login

### `setProfileOption(index)`

**Parametry:**

- `index`

### `getProfileFromSettings()`

load profile number from settings

### `getProfileFromStartupArgument()`

option to launch client with hardcoded profile

### `getSettingsFilePath(fileNameWithFormat)`

returns string path ie. "/settings/1/actionbar.json"

**Parametry:**

- `fileNameWithFormat`

**Zwraca:** string path ie

### `offline()`

### `onProfileChange(offline)`

profile change callback (called in options), saves settings & reloads given module configs

**Parametry:**

- `offline`

### `collectiveReload()`

collection of refresh functions from different modules

### `load()`

json handlers

### `save()`

## Events/Callbacks

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `line`

loads settings on character login

**Wywołanie:** `function online()`

### `s`

**Wywołanie:** `local startupOptions = string.split(g_app.getStartupOptions(), " ")`

### `ProfileChange`

**Wywołanie:** `onProfileChange(true)`

### `ProfileChange`

profile change callback (called in options), saves settings & reloads given module configs

**Wywołanie:** `function onProfileChange(offline)`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(file))`

### `Error`

**Wywołanie:** `return onError(`

### `Error`

**Wywołanie:** `return onError(`

### `Error`

**Wywołanie:** `return onError(`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(file, result)`

---
doc_id: "lua-spec-a9a26e05463f"
source_path: "updater/updater.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: updater.lua"
summary: "Dokumentacja modułu Lua dla updater/updater.lua"
tags: ["lua", "module", "otclient"]
---

# updater/updater.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla updater.

## Functions

### `onLog(level, message, time)`

**Parametry:**

- `level`
- `message`
- `time`

### `initAppWindow()`

### `loadModules()`

### `downloadFiles(url, files, index, retries, doneCallback)`

**Parametry:**

- `url`
- `files`
- `index`
- `retries`
- `doneCallback`

### `updateFiles(data, keepCurrentFiles)`

**Parametry:**

- `data`
- `keepCurrentFiles`

### `Updater.init(loadModulesFunc)`

public functions

**Parametry:**

- `loadModulesFunc`

### `Updater.terminate()`

### `Updater.abort()`

### `Updater.check(args)`

**Parametry:**

- `args`

### `progressUpdater(value)`

**Parametry:**

- `value`

### `Updater.error(message)`

**Parametry:**

- `message`

### `Updater.changeUrl()`

## Events/Callbacks

### `Log`

**Wywołanie:** `local function onLog(level, message, time)`

### `eCallback`

**Wywołanie:** `return doneCallback()`

### `displayUI`

**Wywołanie:** `updaterWindow = g_ui.displayUI('updater')`

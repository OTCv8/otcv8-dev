---
doc_id: "lua-spec-abd689e8e0ef"
source_path: "client_locales/locales.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: locales.lua"
summary: "Dokumentacja modułu Lua dla client_locales/locales.lua"
tags: ["lua", "module", "otclient"]
---

# client_locales/locales.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla locales.

## Globals/Exports

### `installedLocales`

## Functions

### `createWindow()`

### `widget.onClick()`

### `selectFirstLocale(name)`

**Parametry:**

- `name`

### `init()`

public functions

### `terminate()`

### `generateNewTranslationTable(localename)`

**Parametry:**

- `localename`

### `installLocale(locale)`

**Parametry:**

- `locale`

### `installLocales(directory)`

**Parametry:**

- `directory`

### `setLocale(name)`

**Parametry:**

- `name`

### `getInstalledLocales()`

### `getCurrentLocale()`

### `_G.tr(text, ...)`

global function used to translate texts

**Parametry:**

- `text`
- `...`

## Events/Callbacks

### `displayUI`

**Wywołanie:** `localesWindow = g_ui.displayUI('locales')`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget('LocalesButton', localesPanel)`

### `event`

**Wywołanie:** `addEvent(function() addEvent(function() localesWindow:raise() localesWindow:focus() end) end)`

### `g_app`

**Wywołanie:** `--connect(g_app, { onRun = createWindow })`

### `g_app`

**Wywołanie:** `--disconnect(g_app, { onRun = createWindow })`

### `Table`

**Wywołanie:** `function generateNewTranslationTable(localename)`

### `LocaleChanged`

**Wywołanie:** `if onLocaleChanged then onLocaleChanged(name) end`

### `umber`

**Wywołanie:** `if tonumber(text) and currentLocale.formatNumbers then`

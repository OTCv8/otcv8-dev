---
doc_id: "lua-spec-fb0b882f66fb"
source_path: "game_hotkeys/hotkeys_extra.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: hotkeys_extra.lua"
summary: "Dokumentacja modułu Lua dla game_hotkeys/hotkeys_extra.lua"
tags: ["lua", "module", "otclient"]
---

# game_hotkeys/hotkeys_extra.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla hotkeys_extra.

## Globals/Exports

### `extraHotkeys`

## Functions

### `addExtraHotkey(name, description, callback)`

**Parametry:**

- `name`
- `description`
- `callback`

### `setupExtraHotkeys(combobox)`

**Parametry:**

- `combobox`

### `executeExtraHotkey(action, repeated)`

**Parametry:**

- `action`
- `repeated`

### `translateActionToActionComboboxIndex(action)`

**Parametry:**

- `action`

### `translateActionComboboxIndexToAction(index)`

**Parametry:**

- `index`

### `getActionDescription(action)`

**Parametry:**

- `action`

## Events/Callbacks

### `ToActionComboboxIndex`

**Wywołanie:** `function translateActionToActionComboboxIndex(action)`

### `ComboboxIndexToAction`

**Wywołanie:** `function translateActionComboboxIndexToAction(index)`

### `Description`

**Wywołanie:** `function getActionDescription(action)`

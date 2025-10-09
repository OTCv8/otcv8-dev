---
doc_id: "lua-spec-89f074a44e65"
source_path: "game_buttons/buttons.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: buttons.lua"
summary: "Dokumentacja modułu Lua dla game_buttons/buttons.lua"
tags: ["lua", "module", "otclient"]
---

# game_buttons/buttons.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla buttons.

## Functions

### `init()`

### `terminate()`

### `takeButtons(buttons)`

**Parametry:**

- `buttons`

### `takeButton(button, dontUpdateOrder)`

**Parametry:**

- `button`
- `dontUpdateOrder`

### `updateOrder()`

## Events/Callbacks

### `loadUI`

**Wywołanie:** `buttonsWindow = g_ui.loadUI('buttons', modules.game_interface.getRightPanel())`

### `s`

**Wywołanie:** `function takeButtons(buttons)`

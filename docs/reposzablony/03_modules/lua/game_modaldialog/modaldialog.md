---
doc_id: "lua-spec-e5fa226e7529"
source_path: "game_modaldialog/modaldialog.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: modaldialog.lua"
summary: "Dokumentacja modułu Lua dla game_modaldialog/modaldialog.lua"
tags: ["lua", "module", "otclient"]
---

# game_modaldialog/modaldialog.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla modaldialog.

## Functions

### `init()`

### `terminate()`

### `destroyDialog()`

### `onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)`

**Parametry:**

- `id`
- `title`
- `message`
- `buttons`
- `enterButton`
- `escapeButton`
- `choices`
- `priority`

### `button.onClick(self)`

**Parametry:**

- `self`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('modaldialog')`

### `g_game`

**Wywołanie:** `connect(g_game, { onModalDialog = onModalDialog,`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onModalDialog = onModalDialog,`

### `ModalDialog`

**Wywołanie:** `function onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)`

### `createWidget`

**Wywołanie:** `modalDialog = g_ui.createWidget('ModalDialog', rootWidget)`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('ChoiceListLabel', choiceList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget('ModalButton', buttonsPanel)`

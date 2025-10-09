---
doc_id: "lua-spec-7e836a8cebf3"
source_path: "corelib/ui/uimessagebox.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uimessagebox.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uimessagebox.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uimessagebox.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uimessagebox.

## Functions

### `UIMessageBox.display(title, message, buttons, onEnterCallback, onEscapeCallback)`

**Parametry:**

- `title`
- `message`
- `buttons`
- `onEnterCallback`
- `onEscapeCallback`

### `displayInfoBox(title, message)`

**Parametry:**

- `title`
- `message`

### `displayErrorBox(title, message)`

**Parametry:**

- `title`
- `message`

### `displayCancelBox(title, message)`

**Parametry:**

- `title`
- `message`

### `displayGeneralBox(title, message, buttons, onEnterCallback, onEscapeCallback)`

**Parametry:**

- `title`
- `message`
- `buttons`
- `onEnterCallback`
- `onEscapeCallback`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `local messageLabel = g_ui.createWidget('MessageBoxLabel', messageBox)`

### `createWidget`

**Wywołanie:** `local buttonHolder = g_ui.createWidget('MessageBoxButtonHolder', messageBox)`

### `messageBox`

**Wywołanie:** `if onEnterCallback then connect(messageBox, { onEnter = onEnterCallback }) end`

### `messageBox`

**Wywołanie:** `if onEscapeCallback then connect(messageBox, { onEscape = onEscapeCallback }) end`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget('MessageBoxButton', buttonHolder)`

### `button`

**Wywołanie:** `connect(button, { onClick = callback })`

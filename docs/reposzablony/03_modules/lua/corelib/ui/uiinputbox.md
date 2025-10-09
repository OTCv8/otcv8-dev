---
doc_id: "lua-spec-f4a4b0a4441c"
source_path: "corelib/ui/uiinputbox.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uiinputbox.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uiinputbox.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uiinputbox.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uiinputbox.

## Functions

### `UIInputBox.create(title, okCallback, cancelCallback)`

**Parametry:**

- `title`
- `okCallback`
- `cancelCallback`

### `inputBox.onEnter()`

### `inputBox.onEscape()`

### `displayTextInputBox(title, label, okCallback, cancelCallback)`

**Parametry:**

- `title`
- `label`
- `okCallback`
- `cancelCallback`

### `displayNumberInputBox(title, label, okCallback, cancelCallback, min, max, value, step)`

**Parametry:**

- `title`
- `label`
- `okCallback`
- `cancelCallback`
- `min`
- `max`
- `value`
- `step`

## Events/Callbacks

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('InputBoxLabel', self)`

### `createWidget`

**Wywołanie:** `local lineEdit = g_ui.createWidget('InputBoxLineEdit', self)`

### `createWidget`

**Wywołanie:** `local textEdit = g_ui.createWidget('InputBoxTextEdit', self)`

### `createWidget`

**Wywołanie:** `local checkBox = g_ui.createWidget('InputBoxCheckBox', self)`

### `createWidget`

**Wywołanie:** `local comboBox = g_ui.createWidget('InputBoxComboBox', self)`

### `createWidget`

**Wywołanie:** `local spinBox = g_ui.createWidget('InputBoxSpinBox', self)`

### `createWidget`

**Wywołanie:** `local buttonsWidget = g_ui.createWidget('InputBoxButtonsPanel', self)`

### `createWidget`

**Wywołanie:** `local okButton = g_ui.createWidget('InputBoxButton', buttonsWidget)`

### `createWidget`

**Wywołanie:** `local cancelButton = g_ui.createWidget('InputBoxButton', buttonsWidget)`

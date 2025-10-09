---
doc_id: "lua-spec-10ae7262dbe6"
source_path: "corelib/ui/uispinbox.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uispinbox.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uispinbox.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uispinbox.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uispinbox.

## Functions

### `UISpinBox.create()`

## Events/Callbacks

### `Setup`

**Wywołanie:** `function UISpinBox:onSetup()`

### `MouseWheel`

**Wywołanie:** `function UISpinBox:onMouseWheel(mousePos, direction)`

### `KeyPress`

**Wywołanie:** `function UISpinBox:onKeyPress()`

### `TextChange`

**Wywołanie:** `function UISpinBox:onTextChange(text, oldText)`

### `umber`

**Wywołanie:** `local number = tonumber(text)`

### `ValueChange`

**Wywołanie:** `function UISpinBox:onValueChange(value)`

### `FocusChange`

**Wywołanie:** `function UISpinBox:onFocusChange(focused)`

### `StyleApply`

**Wywołanie:** `function UISpinBox:onStyleApply(styleName, styleNode)`

### `event`

**Wywołanie:** `addEvent(function() self:setMaximum(value) end)`

### `event`

**Wywołanie:** `addEvent(function() self:setMinimum(value) end)`

### `event`

**Wywołanie:** `addEvent(function() self:setMouseScroll(value) end)`

### `event`

**Wywołanie:** `addEvent(function()`

### `s`

**Wywołanie:** `self:showButtons()`

### `s`

**Wywołanie:** `self:hideButtons()`

### `s`

**Wywołanie:** `function UISpinBox:showButtons()`

### `s`

**Wywołanie:** `function UISpinBox:hideButtons()`

### `umber`

**Wywołanie:** `value = tonumber(value)`

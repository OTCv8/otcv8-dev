---
doc_id: "lua-spec-7d4346228f67"
source_path: "corelib/ui/uiscrollbar.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uiscrollbar.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uiscrollbar.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uiscrollbar.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uiscrollbar.

## Functions

### `calcValues(self)`

private functions

**Parametry:**

- `self`

### `updateValueDisplay(widget)`

**Parametry:**

- `widget`

### `updateSlider(self)`

**Parametry:**

- `self`

### `parseSliderPos(self, slider, pos, move)`

**Parametry:**

- `self`
- `slider`
- `pos`
- `move`

### `parseSliderPress(self, slider, pos, button)`

**Parametry:**

- `self`
- `slider`
- `pos`
- `button`

### `UIScrollBar.create()`

public functions

## Events/Callbacks

### `Setup`

**Wywołanie:** `function UIScrollBar:onSetup()`

### `Decrement`

**Wywołanie:** `g_mouse.bindAutoPress(self:getChildById('decrementButton'), function() self:onDecrement() end, 300)`

### `Increment`

**Wywołanie:** `g_mouse.bindAutoPress(self:getChildById('incrementButton'), function() self:onIncrement() end, 300)`

### `StyleApply`

**Wywołanie:** `function UIScrollBar:onStyleApply(styleName, styleNode)`

### `umber`

**Wywołanie:** `self:setMaximum(tonumber(value))`

### `umber`

**Wywołanie:** `self:setMinimum(tonumber(value))`

### `umber`

**Wywołanie:** `self:setStep(tonumber(value))`

### `Decrement`

**Wywołanie:** `function UIScrollBar:onDecrement()`

### `Increment`

**Wywołanie:** `function UIScrollBar:onIncrement()`

### `GeometryChange`

**Wywołanie:** `function UIScrollBar:onGeometryChange()`

### `MouseWheel`

**Wywołanie:** `function UIScrollBar:onMouseWheel(mousePos, mouseWheel)`

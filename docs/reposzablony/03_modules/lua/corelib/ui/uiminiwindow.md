---
doc_id: "lua-spec-98ab6a57aa10"
source_path: "corelib/ui/uiminiwindow.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uiminiwindow.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uiminiwindow.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uiminiwindow.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uiminiwindow.

## Globals/Exports

### `settings`

### `settings`

### `settings`

## Functions

### `UIMiniWindow.create()`

### `self.setMovedChildMargin(v)`

**Parametry:**

- `v`

### `self.setMovedChildMargin(v)`

**Parametry:**

- `v`

## Events/Callbacks

### `event`

**Wywołanie:** `addEvent(function() oldParent:order() end)`

### `event`

**Wywołanie:** `addEvent(function() newParent:order() end)`

### `VisibilityChange`

**Wywołanie:** `function UIMiniWindow:onVisibilityChange(visible)`

### `DragEnter`

**Wywołanie:** `function UIMiniWindow:onDragEnter(mousePos)`

### `DragLeave`

**Wywołanie:** `function UIMiniWindow:onDragLeave(droppedWidget, mousePos)`

### `DragLeave`

**Wywołanie:** `UIWindow:onDragLeave(self, droppedWidget, mousePos)`

### `DragMove`

**Wywołanie:** `function UIMiniWindow:onDragMove(mousePos, mouseMoved)`

### `DragMove`

**Wywołanie:** `return UIWindow.onDragMove(self, mousePos, mouseMoved)`

### `MousePress`

**Wywołanie:** `function UIMiniWindow:onMousePress()`

### `FocusChange`

**Wywołanie:** `function UIMiniWindow:onFocusChange(focused)`

### `HeightChange`

**Wywołanie:** `function UIMiniWindow:onHeightChange(height)`

### `tentHeight`

**Wywołanie:** `function UIMiniWindow:setContentHeight(height)`

### `tentMinimumHeight`

**Wywołanie:** `function UIMiniWindow:setContentMinimumHeight(height)`

### `tentMaximumHeight`

**Wywołanie:** `function UIMiniWindow:setContentMaximumHeight(height)`

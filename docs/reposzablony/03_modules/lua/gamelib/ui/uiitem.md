---
doc_id: "lua-spec-ce5b5995a991"
source_path: "gamelib/ui/uiitem.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uiitem.lua"
summary: "Dokumentacja modułu Lua dla gamelib/ui/uiitem.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/ui/uiitem.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uiitem.

## Events/Callbacks

### `DragEnter`

**Wywołanie:** `function UIItem:onDragEnter(mousePos)`

### `DragLeave`

**Wywołanie:** `function UIItem:onDragLeave(droppedWidget, mousePos)`

### `Drop`

**Wywołanie:** `function UIItem:onDrop(widget, mousePos, forced)`

### `Destroy`

**Wywołanie:** `function UIItem:onDestroy()`

### `getDraggingWidget`

**Wywołanie:** `if self == g_ui.getDraggingWidget() and self.hoveredWho then`

### `HoverChange`

**Wywołanie:** `function UIItem:onHoverChange(hovered)`

### `HoverChange`

**Wywołanie:** `UIWidget.onHoverChange(self, hovered)`

### `getDraggingWidget`

**Wywołanie:** `local draggingWidget = g_ui.getDraggingWidget()`

### `MouseRelease`

**Wywołanie:** `function UIItem:onMouseRelease(mousePosition, mouseButton)`

### `tainsPoint`

**Wywołanie:** `if not item or not self:containsPoint(mousePosition) then return false end`

### `Click`

**Wywołanie:** `function UIItem:onClick(mousePos)`

### `ItemChange`

**Wywołanie:** `function UIItem:onItemChange()`

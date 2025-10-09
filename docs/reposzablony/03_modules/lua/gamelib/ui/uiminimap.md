---
doc_id: "lua-spec-cc023650d548"
source_path: "gamelib/ui/uiminimap.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uiminimap.lua"
summary: "Dokumentacja modułu Lua dla gamelib/ui/uiminimap.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/ui/uiminimap.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uiminimap.

## Functions

### `self.onAddAutomapFlag(pos, icon, description)`

**Parametry:**

- `pos`
- `icon`
- `description`

### `self.onRemoveAutomapFlag(pos, icon, description)`

**Parametry:**

- `pos`
- `icon`
- `description`

### `onFlagMouseRelease(widget, pos, button)`

**Parametry:**

- `widget`
- `pos`
- `button`

### `flag.onDestroy()`

### `self.flagWindow.onDestroy()`

## Events/Callbacks

### `Create`

**Wywołanie:** `function UIMinimap:onCreate()`

### `Setup`

**Wywołanie:** `function UIMinimap:onSetup()`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `Destroy`

**Wywołanie:** `function UIMinimap:onDestroy()`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `VisibilityChange`

**Wywołanie:** `function UIMinimap:onVisibilityChange()`

### `CameraPositionChange`

**Wywołanie:** `function UIMinimap:onCameraPositionChange(cameraPos)`

### `FlagMouseRelease`

**Wywołanie:** `local function onFlagMouseRelease(widget, pos, button)`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `createWidget`

**Wywołanie:** `cross = g_ui.createWidget('MinimapCross', self)`

### `createWidget`

**Wywołanie:** `flag = g_ui.createWidget('MinimapFlag')`

### `umber`

**Wywołanie:** `if type(tonumber(icon)) == 'number' then`

### `ZoomChange`

**Wywołanie:** `function UIMinimap:onZoomChange(zoom)`

### `MouseWheel`

**Wywołanie:** `function UIMinimap:onMouseWheel(mousePos, direction)`

### `MousePress`

**Wywołanie:** `function UIMinimap:onMousePress(pos, button)`

### `MouseRelease`

**Wywołanie:** `function UIMinimap:onMouseRelease(pos, button)`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `DragEnter`

**Wywołanie:** `function UIMinimap:onDragEnter(pos)`

### `DragMove`

**Wywołanie:** `function UIMinimap:onDragMove(pos, moved)`

### `DragLeave`

**Wywołanie:** `function UIMinimap:onDragLeave(widget, pos)`

### `StyleApply`

**Wywołanie:** `function UIMinimap:onStyleApply(styleName, styleNode)`

### `createWidget`

**Wywołanie:** `self.flagWindow = g_ui.createWidget('MinimapFlagWindow', rootWidget)`

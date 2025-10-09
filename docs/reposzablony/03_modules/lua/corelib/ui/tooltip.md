---
doc_id: "lua-spec-b197b68edeb8"
source_path: "corelib/ui/tooltip.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: tooltip.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/tooltip.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/tooltip.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla tooltip.

## Globals/Exports

### `g_tooltip`

@docclass

## Functions

### `moveToolTip(first)`

private functions

**Parametry:**

- `first`

### `onWidgetHoverChange(widget, hovered)`

**Parametry:**

- `widget`
- `hovered`

### `onWidgetStyleApply(widget, styleName, styleNode)`

**Parametry:**

- `widget`
- `styleName`
- `styleNode`

### `g_tooltip.init()`

public functions

### `g_tooltip.terminate()`

### `g_tooltip.display(text)`

**Parametry:**

- `text`

### `g_tooltip.hide()`

## Events/Callbacks

### `WidgetHoverChange`

**Wywołanie:** `local function onWidgetHoverChange(widget, hovered)`

### `WidgetStyleApply`

**Wywołanie:** `local function onWidgetStyleApply(widget, styleName, styleNode)`

### `UIWidget`

**Wywołanie:** `connect(UIWidget, {  onStyleApply = onWidgetStyleApply,`

### `event`

**Wywołanie:** `addEvent(function()`

### `createWidget`

**Wywołanie:** `toolTipLabel = g_ui.createWidget('UILabel', rootWidget)`

### `UIWidget`

**Wywołanie:** `disconnect(UIWidget, { onStyleApply = onWidgetStyleApply,`

### `rootWidget`

**Wywołanie:** `connect(rootWidget, {`

### `rootWidget`

**Wywołanie:** `disconnect(rootWidget, {`

### `g_app`

**Wywołanie:** `connect(g_app, { onTerminate = g_tooltip.terminate })`

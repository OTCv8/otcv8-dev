---
doc_id: "lua-spec-8c3977c308b9"
source_path: "corelib/ui/uimovabletabbar.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uimovabletabbar.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uimovabletabbar.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uimovabletabbar.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uimovabletabbar.

## Functions

### `onTabClick(tab)`

private functions

**Parametry:**

- `tab`

### `updateMargins(tabBar)`

**Parametry:**

- `tabBar`

### `updateNavigation(tabBar)`

**Parametry:**

- `tabBar`

### `updateIndexes(tabBar, tab, xoff)`

**Parametry:**

- `tabBar`
- `tab`
- `xoff`

### `getMaxMargin(tabBar, tab)`

**Parametry:**

- `tabBar`
- `tab`

### `updateTabs(tabBar)`

**Parametry:**

- `tabBar`

### `hideTabs(tabBar, fromBack, toArray, width)`

**Parametry:**

- `tabBar`
- `fromBack`
- `toArray`
- `width`

### `showPreTab(tabBar)`

**Parametry:**

- `tabBar`

### `showPostTab(tabBar)`

**Parametry:**

- `tabBar`

### `onTabMousePress(tab, mousePos, mouseButton)`

**Parametry:**

- `tab`
- `mousePos`
- `mouseButton`

### `onTabDragEnter(tab, mousePos)`

**Parametry:**

- `tab`
- `mousePos`

### `onTabDragLeave(tab)`

**Parametry:**

- `tab`

### `onTabDragMove(tab, mousePos, mouseMoved)`

**Parametry:**

- `tab`
- `mousePos`
- `mouseMoved`

### `tabBlink(tab, step)`

**Parametry:**

- `tab`
- `step`

### `UIMoveableTabBar.create()`

public functions

### `tabbar.onGeometryChange()`

### `tab.onDestroy()`

### `self.prevNavigation.onClick()`

### `self.nextNavigation.onClick()`

## Events/Callbacks

### `TabClick`

private functions

**Wywołanie:** `local function onTabClick(tab)`

### `TabMousePress`

**Wywołanie:** `local function onTabMousePress(tab, mousePos, mouseButton)`

### `TabDragEnter`

**Wywołanie:** `local function onTabDragEnter(tab, mousePos)`

### `TabDragLeave`

**Wywołanie:** `local function onTabDragLeave(tab)`

### `TabDragMove`

**Wywołanie:** `local function onTabDragMove(tab, mousePos, mouseMoved)`

### `Destroy`

**Wywołanie:** `function UIMoveableTabBar:onDestroy()`

### `tentWidget`

**Wywołanie:** `function UIMoveableTabBar:setContentWidget(widget)`

### `createWidget`

**Wywołanie:** `panel = g_ui.createWidget(self:getStyleName() .. 'Panel')`

### `createWidget`

**Wywołanie:** `local tab = g_ui.createWidget(self:getStyleName() .. 'Button', self)`

### `StyleApply`

**Wywołanie:** `function UIMoveableTabBar:onStyleApply(styleName, styleNode)`

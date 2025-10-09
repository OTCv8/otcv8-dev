---
doc_id: "lua-spec-961c72d10656"
source_path: "corelib/ui/uitabbar.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uitabbar.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uitabbar.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uitabbar.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uitabbar.

## Functions

### `onTabClick(tab)`

private functions

**Parametry:**

- `tab`

### `onTabMouseRelease(tab, mousePos, mouseButton)`

**Parametry:**

- `tab`
- `mousePos`
- `mouseButton`

### `UITabBar.create()`

public functions

### `tab.onDestroy()`

## Events/Callbacks

### `TabClick`

private functions

**Wywołanie:** `local function onTabClick(tab)`

### `TabMouseRelease`

**Wywołanie:** `local function onTabMouseRelease(tab, mousePos, mouseButton)`

### `tainsPoint`

**Wywołanie:** `if mouseButton == MouseRightButton and tab:containsPoint(mousePos) then`

### `Setup`

**Wywołanie:** `function UITabBar:onSetup()`

### `tentWidget`

**Wywołanie:** `function UITabBar:setContentWidget(widget)`

### `createWidget`

**Wywołanie:** `panel = g_ui.createWidget(self:getStyleName() .. 'Panel')`

### `createWidget`

**Wywołanie:** `local tab = g_ui.createWidget(self:getStyleName() .. 'Button', self.buttonsPanel)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget(self:getStyleName() .. 'Button', self.buttonsPanel)`

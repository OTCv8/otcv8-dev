---
doc_id: "lua-spec-ed1e1a539ba5"
source_path: "corelib/ui/uicombobox.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uicombobox.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uicombobox.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uicombobox.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uicombobox.

## Functions

### `UIComboBox.create()`

## Events/Callbacks

### `s`

**Wywołanie:** `function UIComboBox:clearOptions()`

### `s`

**Wywołanie:** `return self:clearOptions()`

### `sCount`

**Wywołanie:** `function UIComboBox:getOptionsCount()`

### `ByData`

**Wywołanie:** `function UIComboBox:setCurrentOptionByData(data, dontSignal)`

### `MousePress`

**Wywołanie:** `function UIComboBox:onMousePress(mousePos, mouseButton)`

### `createWidget`

**Wywołanie:** `menu = g_ui.createWidget(self:getStyleName() .. 'PopupScrollMenu')`

### `createWidget`

**Wywołanie:** `menu = g_ui.createWidget(self:getStyleName() .. 'PopupMenu')`

### `menu`

**Wywołanie:** `connect(menu, { onDestroy = function() self:setOn(false) end })`

### `MouseWheel`

**Wywołanie:** `function UIComboBox:onMouseWheel(mousePos, direction)`

### `StyleApply`

**Wywołanie:** `function UIComboBox:onStyleApply(styleName, styleNode)`

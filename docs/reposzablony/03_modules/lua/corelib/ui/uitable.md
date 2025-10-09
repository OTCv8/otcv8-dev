---
doc_id: "lua-spec-57b4b88c0020"
source_path: "corelib/ui/uitable.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uitable.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uitable.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uitable.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uitable.

## Functions

### `UITable.create()`

Initialize default values

## Events/Callbacks

### `Destroy`

Clear table values

**Wywołanie:** `function UITable:onDestroy()`

### `Setup`

Detect if a header is already defined

**Wywołanie:** `function UITable:onSetup()`

### `StyleApply`

Parse table related styles

**Wywołanie:** `function UITable:onStyleApply(styleName, styleNode)`

### `event`

**Wywołanie:** `addEvent(function()`

### `event`

**Wywołanie:** `addEvent(function()`

### `event`

**Wywołanie:** `addEvent(function()`

### `event`

**Wywołanie:** `addEvent(function()`

### `event`

**Wywołanie:** `addEvent(function()`

### `createWidget`

**Wywołanie:** `local col = g_ui.createWidget(self.headerColumnBaseStyle)`

### `createWidget`

create a new header

**Wywołanie:** `local headerRow = g_ui.createWidget(self.headerRowBaseStyle, self)`

### `createWidget`

**Wywołanie:** `local row = g_ui.createWidget(self.rowBaseStyle)`

### `createWidget`

**Wywołanie:** `local col = g_ui.createWidget(self.columBaseStyle, row)`

### `FocusChange`

**Wywołanie:** `function UITableRow:onFocusChange(focused)`

### `StyleApply`

**Wywołanie:** `function UITableRow:onStyleApply(styleName, styleNode)`

### `Click`

**Wywołanie:** `function UITableHeaderColumn:onClick()`

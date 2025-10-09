---
doc_id: "lua-spec-6c66e02297e0"
source_path: "corelib/ui/uitextedit.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: uitextedit.lua"
summary: "Dokumentacja modułu Lua dla corelib/ui/uitextedit.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/ui/uitextedit.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla uitextedit.

## Functions

### `self.verticalScrollBar.onValueChange(scrollbar, value)`

**Parametry:**

- `scrollbar`
- `value`

### `self.horizontalScrollBar.onValueChange(scrollbar, value)`

**Parametry:**

- `scrollbar`
- `value`

## Events/Callbacks

### `StyleApply`

**Wywołanie:** `function UITextEdit:onStyleApply(styleName, styleNode)`

### `event`

**Wywołanie:** `addEvent(function()`

### `event`

**Wywołanie:** `addEvent(function()`

### `talScrollBar`

**Wywołanie:** `self:setHorizontalScrollBar(self:getParent():getChildById(value))`

### `MouseWheel`

**Wywołanie:** `function UITextEdit:onMouseWheel(mousePos, mouseWheel)`

### `TextAreaUpdate`

**Wywołanie:** `function UITextEdit:onTextAreaUpdate(virtualOffset, virtualSize, totalSize)`

### `talScrollBar`

**Wywołanie:** `function UITextEdit:setHorizontalScrollBar(scrollbar)`

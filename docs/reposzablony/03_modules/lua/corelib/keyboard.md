---
doc_id: "lua-spec-926a75543ad0"
source_path: "corelib/keyboard.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: keyboard.lua"
summary: "Dokumentacja modułu Lua dla corelib/keyboard.lua"
tags: ["lua", "module", "otclient"]
---

# corelib/keyboard.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla keyboard.

## Globals/Exports

### `g_keyboard`

@docclass

## Functions

### `translateKeyCombo(keyCombo)`

private functions

**Parametry:**

- `keyCombo`

### `getKeyCode(key)`

**Parametry:**

- `key`

### `retranslateKeyComboDesc(keyComboDesc)`

**Parametry:**

- `keyComboDesc`

### `determineKeyComboDesc(keyCode, keyboardModifiers)`

**Parametry:**

- `keyCode`
- `keyboardModifiers`

### `onWidgetKeyDown(widget, keyCode, keyboardModifiers)`

**Parametry:**

- `widget`
- `keyCode`
- `keyboardModifiers`

### `onWidgetKeyUp(widget, keyCode, keyboardModifiers)`

**Parametry:**

- `widget`
- `keyCode`
- `keyboardModifiers`

### `onWidgetKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)`

**Parametry:**

- `widget`
- `keyCode`
- `keyboardModifiers`
- `autoRepeatTicks`

### `connectKeyDownEvent(widget)`

**Parametry:**

- `widget`

### `connectKeyUpEvent(widget)`

**Parametry:**

- `widget`

### `connectKeyPressEvent(widget)`

**Parametry:**

- `widget`

### `g_keyboard.bindKeyDown(keyComboDesc, callback, widget, alone)`

public functions

**Parametry:**

- `keyComboDesc`
- `callback`
- `widget`
- `alone`

### `g_keyboard.bindKeyUp(keyComboDesc, callback, widget, alone)`

**Parametry:**

- `keyComboDesc`
- `callback`
- `widget`
- `alone`

### `g_keyboard.bindKeyPress(keyComboDesc, callback, widget)`

**Parametry:**

- `keyComboDesc`
- `callback`
- `widget`

### `getUnbindArgs(arg1, arg2)`

**Parametry:**

- `arg1`
- `arg2`

### `g_keyboard.unbindKeyDown(keyComboDesc, arg1, arg2)`

**Parametry:**

- `keyComboDesc`
- `arg1`
- `arg2`

### `g_keyboard.unbindKeyUp(keyComboDesc, arg1, arg2)`

**Parametry:**

- `keyComboDesc`
- `arg1`
- `arg2`

### `g_keyboard.unbindKeyPress(keyComboDesc, arg1, arg2)`

**Parametry:**

- `keyComboDesc`
- `arg1`
- `arg2`

### `g_keyboard.getModifiers()`

### `g_keyboard.isKeyPressed(key)`

**Parametry:**

- `key`

### `g_keyboard.areKeysPressed(keyComboDesc)`

**Parametry:**

- `keyComboDesc`

### `g_keyboard.isKeySetPressed(keys, all)`

**Parametry:**

- `keys`
- `all`

### `g_keyboard.isInUse()`

### `g_keyboard.isCtrlPressed()`

### `g_keyboard.isAltPressed()`

### `g_keyboard.isShiftPressed()`

## Events/Callbacks

### `WidgetKeyDown`

**Wywołanie:** `local function onWidgetKeyDown(widget, keyCode, keyboardModifiers)`

### `WidgetKeyUp`

**Wywołanie:** `local function onWidgetKeyUp(widget, keyCode, keyboardModifiers)`

### `WidgetKeyPress`

**Wywołanie:** `local function onWidgetKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)`

### `nectKeyDownEvent`

**Wywołanie:** `local function connectKeyDownEvent(widget)`

### `widget`

**Wywołanie:** `connect(widget, { onKeyDown = onWidgetKeyDown })`

### `nectKeyUpEvent`

**Wywołanie:** `local function connectKeyUpEvent(widget)`

### `widget`

**Wywołanie:** `connect(widget, { onKeyUp = onWidgetKeyUp })`

### `nectKeyPressEvent`

**Wywołanie:** `local function connectKeyPressEvent(widget)`

### `widget`

**Wywołanie:** `connect(widget, { onKeyPress = onWidgetKeyPress })`

### `nectKeyDownEvent`

**Wywołanie:** `connectKeyDownEvent(widget)`

### `widget.boundAloneKeyDownCombos`

**Wywołanie:** `connect(widget.boundAloneKeyDownCombos, keyComboDesc, callback)`

### `widget.boundKeyDownCombos`

**Wywołanie:** `connect(widget.boundKeyDownCombos, keyComboDesc, callback)`

### `nectKeyUpEvent`

**Wywołanie:** `connectKeyUpEvent(widget)`

### `widget.boundAloneKeyUpCombos`

**Wywołanie:** `connect(widget.boundAloneKeyUpCombos, keyComboDesc, callback)`

### `widget.boundKeyUpCombos`

**Wywołanie:** `connect(widget.boundKeyUpCombos, keyComboDesc, callback)`

### `nectKeyPressEvent`

**Wywołanie:** `connectKeyPressEvent(widget)`

### `widget.boundKeyPressCombos`

**Wywołanie:** `connect(widget.boundKeyPressCombos, keyComboDesc, callback)`

### `widget.boundKeyDownCombos`

**Wywołanie:** `disconnect(widget.boundKeyDownCombos, keyComboDesc, callback)`

### `widget.boundKeyUpCombos`

**Wywołanie:** `disconnect(widget.boundKeyUpCombos, keyComboDesc, callback)`

### `widget.boundKeyPressCombos`

**Wywołanie:** `disconnect(widget.boundKeyPressCombos, keyComboDesc, callback)`

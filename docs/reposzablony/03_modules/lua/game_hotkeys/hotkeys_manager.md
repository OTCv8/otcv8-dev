---
doc_id: "lua-spec-a4e2c9fde02f"
source_path: "game_hotkeys/hotkeys_manager.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: hotkeys_manager.lua"
summary: "Dokumentacja modułu Lua dla game_hotkeys/hotkeys_manager.lua"
tags: ["lua", "module", "otclient"]
---

# game_hotkeys/hotkeys_manager.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla hotkeys_manager.

## Globals/Exports

### `boundCombosCallback`

### `hotkeysList`

### `hotkeyConfigs`

### `hotkeyList`

### `boundCombosCallback`

### `hotkeyList`

## Functions

### `init()`

public functions

### `useRadioGroup.onSelectionChange(self, selected)`

**Parametry:**

- `self`
- `selected`

### `currentHotkeys.onChildFocusChange(self, hotkeyLabel)`

**Parametry:**

- `self`
- `hotkeyLabel`

### `terminate()`

### `online()`

### `offline()`

### `show()`

### `hide()`

### `toggle()`

### `ok()`

### `cancel()`

### `load(forceDefaults)`

**Parametry:**

- `forceDefaults`

### `unload()`

### `reset()`

### `reload()`

### `save()`

### `onConfigChange()`

### `loadDefautComboKeys()`

### `setDefaultComboKeys(combo)`

**Parametry:**

- `combo`

### `onChooseItemMouseRelease(self, mousePosition, mouseButton)`

**Parametry:**

- `self`
- `mousePosition`
- `mouseButton`

### `startChooseItem()`

### `clearObject()`

### `addHotkey()`

### `addKeyCombo(keyCombo, keySettings, focus)`

**Parametry:**

- `keyCombo`
- `keySettings`
- `focus`

### `prepareKeyCombo(keyCombo, ticks)`

**Parametry:**

- `keyCombo`
- `ticks`

### `doKeyCombo(keyCombo, repeated)`

**Parametry:**

- `keyCombo`
- `repeated`

### `updateHotkeyLabel(hotkeyLabel)`

**Parametry:**

- `hotkeyLabel`

### `updateHotkeyForm(reset)`

**Parametry:**

- `reset`

### `removeHotkey()`

### `updateHotkeyAction()`

### `onHotkeyTextChange(value)`

**Parametry:**

- `value`

### `onSendAutomaticallyChange(autoSend)`

**Parametry:**

- `autoSend`

### `onChangeUseType(useTypeWidget)`

**Parametry:**

- `useTypeWidget`

### `onSelectHotkeyLabel(hotkeyLabel)`

**Parametry:**

- `hotkeyLabel`

### `hotkeyCapture(assignWindow, keyCode, keyboardModifiers)`

**Parametry:**

- `assignWindow`
- `keyCode`
- `keyboardModifiers`

### `hotkeyCaptureOk(assignWindow, keyCombo)`

**Parametry:**

- `assignWindow`
- `keyCombo`

## Events/Callbacks

### `displayUI`

**Wywołanie:** `hotkeysWindow = g_ui.displayUI('hotkeys_manager')`

### `ChangeUseType`

**Wywołanie:** `useRadioGroup.onSelectionChange = function(self, selected) onChangeUseType(selected) end`

### `createWidget`

**Wywołanie:** `mouseGrabberWidget = g_ui.createWidget('UIWidget')`

### `SelectHotkeyLabel`

**Wywołanie:** `currentHotkeys.onChildFocusChange = function(self, hotkeyLabel) onSelectHotkeyLabel(hotkeyLabel) end`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `sCount`

**Wywołanie:** `for i = 1, configSelector:getOptionsCount() do`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `line`

**Wywołanie:** `function online()`

### `ConfigChange`

**Wywołanie:** `function onConfigChange()`

### `ChooseItemMouseRelease`

**Wywołanie:** `function onChooseItemMouseRelease(self, mousePosition, mouseButton)`

### `tainer`

**Wywołanie:** `if item:isFluidContainer() then`

### `isMouseGrabbed`

**Wywołanie:** `if g_ui.isMouseGrabbed() then return end`

### `createWidget`

**Wywołanie:** `local assignWindow = g_ui.createWidget('HotkeyAssignWindow', rootWidget)`

### `createWidget`

**Wywołanie:** `hotkeyLabel = g_ui.createWidget('HotkeyListLabel')`

### `umber`

**Wywołanie:** `hotkeyLabel.itemId = tonumber(keySettings.itemId)`

### `umber`

**Wywołanie:** `hotkeyLabel.subType = tonumber(keySettings.subType)`

### `umber`

**Wywołanie:** `hotkeyLabel.useType = tonumber(keySettings.useType)`

### `Description`

**Wywołanie:** `hotkeyLabel:setText(tr('%s: (Action: %s)', hotkeyLabel.keyCombo, getActionDescription(hotkeyLabel.action)))`

### `ToActionComboboxIndex`

**Wywołanie:** `hotkeysWindow.action:setCurrentIndex(translateActionToActionComboboxIndex(currentHotkeyLabel.action), true)`

### `ComboboxIndexToAction`

**Wywołanie:** `currentHotkeyLabel.action = translateActionComboboxIndexToAction(hotkeysWindow.action.currentIndex)`

### `HotkeyTextChange`

**Wywołanie:** `function onHotkeyTextChange(value)`

### `SendAutomaticallyChange`

**Wywołanie:** `function onSendAutomaticallyChange(autoSend)`

### `ChangeUseType`

**Wywołanie:** `function onChangeUseType(useTypeWidget)`

### `SelectHotkeyLabel`

**Wywołanie:** `function onSelectHotkeyLabel(hotkeyLabel)`

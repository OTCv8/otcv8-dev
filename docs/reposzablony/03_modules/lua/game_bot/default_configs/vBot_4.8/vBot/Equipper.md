---
doc_id: "lua-spec-9a71c8d7816b"
source_path: "game_bot/default_configs/vBot_4.8/vBot/Equipper.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: Equipper.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/Equipper.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/Equipper.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla Equipper.

## Globals/Exports

### `rules`

### `bosses`

## Functions

### `ui.switch.onClick(widget)`

**Parametry:**

- `widget`

### `ui.setup.onClick()`

### `setCondition(first, n)`

**Parametry:**

- `first`
- `n`

### `resetFields()`

### `mainWindow.closeButton.onClick()`

### `inputPanel.useSecondCondition.onOptionChange(widget, option, data)`

**Parametry:**

- `widget`
- `option`
- `data`

### `inputPanel.condition.nex.onClick()`

in/de/crementation buttons

### `inputPanel.condition.pre.onClick()`

### `inputPanel.optionalCondition.nex.onClick()`

### `inputPanel.optionalCondition.pre.onClick()`

### `listPanel.up.onClick(widget)`

**Parametry:**

- `widget`

### `listPanel.down.onClick(widget)`

**Parametry:**

- `widget`

### `eqPanel.cloneEq.onClick(widget)`

**Parametry:**

- `widget`

### `widget.onItemChange(widget)`

**Parametry:**

- `widget`

### `widget.onMouseRelease(widget, mousePos, mouseButton)`

**Parametry:**

- `widget`
- `mousePos`
- `mouseButton`

### `inputPanel.condition.description.onMouseWheel(widget, mousePos, scroll)`

**Parametry:**

- `widget`
- `mousePos`
- `scroll`

### `inputPanel.optionalCondition.description.onMouseWheel(widget, mousePos, scroll)`

**Parametry:**

- `widget`
- `mousePos`
- `scroll`

### `namePanel.profileName.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `setupPreview(display, data)`

**Parametry:**

- `display`
- `data`

### `refreshRules()`

### `widget.remove.onClick()`

### `widget.visible.onClick()`

### `widget.enabled.onClick()`

### `widget.onHoverChange(widget, hover)`

**Parametry:**

- `widget`
- `hover`

### `widget.onDoubleClick(widget)`

**Parametry:**

- `widget`

### `widget.onClick()`

### `inputPanel.add.onClick(widget)`

**Parametry:**

- `widget`

### `mainWindow.bossList.onClick(widget)`

**Parametry:**

- `widget`

### `widget.remove.onClick()`

### `bossPanel.add.onClick()`

### `widget.remove.onClick()`

### `interpreteCondition(n, v)`

**Parametry:**

- `n`
- `v`

### `finalCheck(first,relation,second)`

**Parametry:**

- `first`
- `relation`
- `second`

### `isEquipped(id)`

**Parametry:**

- `id`

### `unequipItem(table)`

**Parametry:**

- `table`

### `equipItem(id, slot)`

**Parametry:**

- `id`
- `slot`

### `markChild(child)`

**Parametry:**

- `child`

## Events/Callbacks

### `dition`

**Wywołanie:** `local function setCondition(first, n)`

### `dition`

**Wywołanie:** `setCondition(false, optionalConditionNumber)`

### `dition`

**Wywołanie:** `setCondition(true, conditionNumber)`

### `dition`

add default text & windows

**Wywołanie:** `setCondition(true, 1)`

### `dition`

**Wywołanie:** `setCondition(false, 2)`

### `dition`

**Wywołanie:** `setCondition(false, optionalConditionNumber)`

### `dition`

**Wywołanie:** `setCondition(true, conditionNumber)`

### `dition`

**Wywołanie:** `setCondition(false, optionalConditionNumber)`

### `dition`

**Wywołanie:** `setCondition(true, conditionNumber)`

### `dition`

**Wywołanie:** `setCondition(false, optionalConditionNumber)`

### `dition`

**Wywołanie:** `setCondition(false, optionalConditionNumber)`

### `Click`

**Wywołanie:** `inputPanel.condition.nex.onClick()`

### `Click`

**Wywołanie:** `inputPanel.condition.pre.onClick()`

### `Click`

**Wywołanie:** `inputPanel.optionalCondition.nex.onClick()`

### `Click`

**Wywołanie:** `inputPanel.optionalCondition.pre.onClick()`

### `dition`

**Wywołanie:** `setCondition(false, optionalConditionNumber)`

### `dition`

**Wywołanie:** `setCondition(true, conditionNumber)`

### `dition`

**Wywołanie:** `local function interpreteCondition(n, v)`

### `sters`

**Wywołanie:** `return getMonsters() > v`

### `sters`

**Wywołanie:** `return getMonsters() < v`

### `tainers`

**Wywołanie:** `for i, container in ipairs(getContainers()) do`

### `tainerIsFull`

**Wywołanie:** `if not containerIsFull(container) then`

### `dition`

conditions

**Wywołanie:** `local firstCondition = interpreteCondition(rule.mainCondition, rule.mainValue)`

### `dition`

**Wywołanie:** `optionalCondition = interpreteCondition(rule.optionalCondition, rule.optValue)`

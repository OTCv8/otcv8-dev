---
doc_id: "lua-spec-f22ee870ade8"
source_path: "game_bot/default_configs/vBot_4.8/vBot/supplies.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: supplies.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/supplies.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/supplies.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla supplies.

## Globals/Exports

### `items`

### `Supplies`

## Functions

### `convertOldConfig(config)`

**Parametry:**

- `config`

### `getEmptyItemPanels()`

### `deleteFirstEmptyPanel()`

### `clearEmptyPanels()`

### `addItemPanel()`

### `item.onItemChange(widget)`

**Parametry:**

- `widget`

### `loadSettings()`

load settings

### `SuppliesWindow.onVisibilityChange(widget, visible)`

save settings

**Parametry:**

- `widget`
- `visible`

### `refreshProfileList()`

### `label.remove.onClick()`

### `label.onDoubleClick(widget)`

**Parametry:**

- `widget`

### `label.onClick()`

### `label.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `setProfileFocus()`

### `SuppliesWindow.newProfile.onClick()`

### `SuppliesWindow.capSwitch.onClick(widget)`

**Parametry:**

- `widget`

### `SuppliesWindow.SoftBoots.onClick(widget)`

**Parametry:**

- `widget`

### `SuppliesWindow.imbues.onClick(widget)`

**Parametry:**

- `widget`

### `SuppliesWindow.staminaSwitch.onClick(widget)`

**Parametry:**

- `widget`

### `SuppliesWindow.capValue.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `SuppliesWindow.staminaValue.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `SuppliesWindow.increment.onClick(widget)`

**Parametry:**

- `widget`

### `SuppliesWindow.decrement.onClick(widget)`

**Parametry:**

- `widget`

### `SuppliesWindow.increment.onMouseWheel(widget, mousePos, dir)`

**Parametry:**

- `widget`
- `mousePos`
- `dir`

### `Supplies.show()`

### `Supplies.getItemsData()`

### `Supplies.isSupplyItem(id)`

**Parametry:**

- `id`

### `Supplies.hasEnough()`

### `Supplies.setAverageValues(data)`

**Parametry:**

- `data`

### `Supplies.addSupplyItem(id, min, max, avg)`

**Parametry:**

- `id`
- `min`
- `max`
- `avg`

### `Supplies.getAdditionalData()`

### `Supplies.getFullData()`

## Events/Callbacks

### `vertOldConfig`

**Wywołanie:** `local function convertOldConfig(config)`

### `vertOldConfig`

**Wywołanie:** `SuppliesConfig[panelName][k] = convertOldConfig(profile)`

### `figSave`

**Wywołanie:** `vBotConfigSave("supply")`

### `umber`

itemId was not changed, ignore

**Wywołanie:** `if tonumber(panelId) == id then`

### `umber`

**Wywołanie:** `widget.id:setItemId(tonumber(id))`

### `figSave`

**Wywołanie:** `vBotConfigSave("supply")`

### `figSave`

**Wywołanie:** `vBotConfigSave("supply")`

### `event`

**Wywołanie:** `schedule(`

### `figSave`

**Wywołanie:** `vBotConfigSave("supply")`

### `figSave`

**Wywołanie:** `vBotConfigSave("supply")`

### `figSave`

**Wywołanie:** `vBotConfigSave("supply")`

### `umber`

**Wywołanie:** `local value = tonumber(SuppliesWindow.capValue:getText())`

### `umber`

**Wywołanie:** `local value = tonumber(SuppliesWindow.staminaValue:getText())`

### `Click`

**Wywołanie:** `SuppliesWindow.increment.onClick()`

### `Click`

**Wywołanie:** `SuppliesWindow.decrement.onClick()`

### `umber`

**Wywołanie:** `id = tonumber(id)`

### `umber`

**Wywołanie:** `widget.id:setItemId(tonumber(id))`

### `alData`

**Wywołanie:** `additional = Supplies.getAdditionalData()`

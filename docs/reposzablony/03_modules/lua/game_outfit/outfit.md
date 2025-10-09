---
doc_id: "lua-spec-5ecea2b1e940"
source_path: "game_outfit/outfit.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: outfit.lua"
summary: "Dokumentacja modułu Lua dla game_outfit/outfit.lua"
tags: ["lua", "module", "otclient"]
---

# game_outfit/outfit.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla outfit.

## Globals/Exports

### `currentOutfit`

### `outfits`

### `mounts`

### `wings`

### `auras`

### `shaders`

### `healthBars`

### `manaBars`

### `colorBoxes`

### `currentOutfit`

### `outfits`

### `mounts`

### `wings`

### `auras`

### `shaders`

### `healthBars`

### `manaBars`

### `settings`

### `presets`

## Functions

### `init()`

### `terminate()`

### `onMovementChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `onShowFloorChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `onShowMountChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `onShowOutfitChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `onShowAuraChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `onShowWingsChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `onShowShaderChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `onShowBarsChange(checkBox, checked)`

**Parametry:**

- `checkBox`
- `checked`

### `create(currentOutfit, outfitList, mountList, wingList, auraList, shaderList, healthBarList, manaBarList)`

**Parametry:**

- `currentOutfit`
- `outfitList`
- `mountList`
- `wingList`
- `auraList`
- `shaderList`
- `healthBarList`
- `manaBarList`

### `destroy()`

### `configureAddons(addons)`

**Parametry:**

- `addons`

### `newPreset()`

### `deletePreset()`

### `savePreset()`

### `renamePreset()`

### `presetWidget.rename.save.onClick()`

### `saveRename(presetId)`

**Parametry:**

- `presetId`

### `onAppearanceChange(widget, selectedWidget)`

**Parametry:**

- `widget`
- `selectedWidget`

### `showPresets()`

### `showOutfits()`

### `showMounts()`

### `showAuras()`

### `showWings()`

### `showShaders()`

### `showHealthBars()`

### `showManaBars()`

### `onPresetSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `onOutfitSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `onMountSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `onAuraSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `onWingsSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `onShaderSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `onHealthBarSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `onManaBarSelect(list, focusedChild, unfocusedChild, reason)`

**Parametry:**

- `list`
- `focusedChild`
- `unfocusedChild`
- `reason`

### `updateAppearanceText(widget, text)`

**Parametry:**

- `widget`
- `text`

### `updateAppearanceTexts(outfit)`

**Parametry:**

- `outfit`

### `deselectPreset()`

### `onAddonChange(widget, checked)`

**Parametry:**

- `widget`
- `checked`

### `onColorModeChange(widget, selectedWidget)`

**Parametry:**

- `widget`
- `selectedWidget`

### `onColorCheckChange(widget, selectedWidget)`

**Parametry:**

- `widget`
- `selectedWidget`

### `updatePreview()`

### `rotate(value)`

**Parametry:**

- `value`

### `onFilterSearch()`

### `saveSettings()`

### `loadSettings()`

### `loadDefaultSettings()`

### `accept()`

## Events/Callbacks

### `nect`

**Wywołanie:** `connect(`

### `nect`

**Wywołanie:** `disconnect(`

### `MovementChange`

**Wywołanie:** `function onMovementChange(checkBox, checked)`

### `ShowFloorChange`

**Wywołanie:** `function onShowFloorChange(checkBox, checked)`

### `ShowMountChange`

**Wywołanie:** `function onShowMountChange(checkBox, checked)`

### `ShowOutfitChange`

**Wywołanie:** `function onShowOutfitChange(checkBox, checked)`

### `ShowAuraChange`

**Wywołanie:** `function onShowAuraChange(checkBox, checked)`

### `ShowWingsChange`

**Wywołanie:** `function onShowWingsChange(checkBox, checked)`

### `ShowShaderChange`

**Wywołanie:** `function onShowShaderChange(checkBox, checked)`

### `ShowBarsChange`

**Wywołanie:** `function onShowBarsChange(checkBox, checked)`

### `displayUI`

**Wywołanie:** `window = g_ui.displayUI("outfitwindow")`

### `createWidget`

**Wywołanie:** `g_ui.createWidget("FloorTile", floor)`

### `figureAddons`

**Wywołanie:** `configureAddons(currentOutfit.addons)`

### `createWidget`

**Wywołanie:** `local colorBox = g_ui.createWidget("ColorBox", window.appearance.colorBoxPanel)`

### `figureAddons`

**Wywołanie:** `function configureAddons(addons)`

### `createWidget`

**Wywołanie:** `local presetWidget = g_ui.createWidget("PresetButton", window.presetsList)`

### `umber`

**Wywołanie:** `presetId = tonumber(focused:getId())`

### `umber`

**Wywołanie:** `presetId = tonumber(focused:getId())`

### `umber`

**Wywołanie:** `presetId = tonumber(focused:getId())`

### `AppearanceChange`

**Wywołanie:** `function onAppearanceChange(widget, selectedWidget)`

### `createWidget`

**Wywołanie:** `local presetWidget = g_ui.createWidget("PresetButton", window.presetsList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `figureAddons`

**Wywołanie:** `configureAddons(outfitData[3])`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `createWidget`

**Wywołanie:** `local button = g_ui.createWidget("SelectionButton", window.selectionList)`

### `PresetSelect`

**Wywołanie:** `function onPresetSelect(list, focusedChild, unfocusedChild, reason)`

### `umber`

**Wywołanie:** `local presetId = tonumber(focusedChild:getId())`

### `figureAddons`

**Wywołanie:** `configureAddons(outfitData[3])`

### `OutfitSelect`

**Wywołanie:** `function onOutfitSelect(list, focusedChild, unfocusedChild, reason)`

### `umber`

**Wywołanie:** `local outfitType = tonumber(focusedChild:getId())`

### `figureAddons`

**Wywołanie:** `configureAddons(outfit.addons)`

### `MountSelect`

**Wywołanie:** `function onMountSelect(list, focusedChild, unfocusedChild, reason)`

### `umber`

**Wywołanie:** `local mountType = tonumber(focusedChild:getId())`

### `AuraSelect`

**Wywołanie:** `function onAuraSelect(list, focusedChild, unfocusedChild, reason)`

### `umber`

**Wywołanie:** `local auraType = tonumber(focusedChild:getId())`

### `WingsSelect`

**Wywołanie:** `function onWingsSelect(list, focusedChild, unfocusedChild, reason)`

### `umber`

**Wywołanie:** `local wingsType = tonumber(focusedChild:getId())`

### `ShaderSelect`

**Wywołanie:** `function onShaderSelect(list, focusedChild, unfocusedChild, reason)`

### `HealthBarSelect`

**Wywołanie:** `function onHealthBarSelect(list, focusedChild, unfocusedChild, reason)`

### `umber`

**Wywołanie:** `local barType = tonumber(focusedChild:getId())`

### `ManaBarSelect`

**Wywołanie:** `function onManaBarSelect(list, focusedChild, unfocusedChild, reason)`

### `umber`

**Wywołanie:** `local barType = tonumber(focusedChild:getId())`

### `AddonChange`

**Wywołanie:** `function onAddonChange(widget, checked)`

### `ColorModeChange`

**Wywołanie:** `function onColorModeChange(widget, selectedWidget)`

### `ColorCheckChange`

**Wywołanie:** `function onColorCheckChange(widget, selectedWidget)`

### `FilterSearch`

**Wywołanie:** `function onFilterSearch()`

### `event`

**Wywołanie:** `addEvent(`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(settingsFile, "[]")`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(settingsFile))`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(settingsFile, json.encode(fullSettings))`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(settingsFile))`

---
doc_id: "lua-spec-198b9263112f"
source_path: "game_prey/prey.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: prey.lua"
summary: "Dokumentacja modułu Lua dla game_prey/prey.lua"
tags: ["lua", "module", "otclient"]
---

# game_prey/prey.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla prey.

## Functions

### `bonusDescription(bonusType, bonusValue, bonusGrade)`

**Parametry:**

- `bonusType`
- `bonusValue`
- `bonusGrade`

### `timeleftTranslation(timeleft, forPreyTimeleft)`

**Parametry:**

- `timeleft`
- `forPreyTimeleft`

### `init()`

### `onHover(widget)`

**Parametry:**

- `widget`

### `terminate()`

### `setUnsupportedSettings()`

### `check()`

### `toggleTracker()`

### `hide()`

### `show()`

### `toggle()`

### `onPreyFreeRolls(slot, timeleft)`

**Parametry:**

- `slot`
- `timeleft`

### `onPreyTimeLeft(slot, timeLeft)`

**Parametry:**

- `slot`
- `timeLeft`

### `element.onClick()`

### `onPreyPrice(price)`

**Parametry:**

- `price`

### `setTimeUntilFreeReroll(slot, timeUntilFreeReroll)`

**Parametry:**

- `slot`
- `timeUntilFreeReroll`

### `onPreyLocked(slot, unlockState, timeUntilFreeReroll)`

**Parametry:**

- `slot`
- `unlockState`
- `timeUntilFreeReroll`

### `onPreyInactive(slot, timeUntilFreeReroll)`

**Parametry:**

- `slot`
- `timeUntilFreeReroll`

### `element.onClick()`

### `rerollButton.onClick()`

### `setBonusGradeStars(slot, grade)`

**Parametry:**

- `slot`
- `grade`

### `widget.onHoverChange(widget,hovered)`

**Parametry:**

- `widget`
- `hovered`

### `widget.onHoverChange(widget,hovered)`

**Parametry:**

- `widget`
- `hovered`

### `getBigIconPath(bonusType)`

**Parametry:**

- `bonusType`

### `getSmallIconPath(bonusType)`

**Parametry:**

- `bonusType`

### `getBonusDescription(bonusType)`

**Parametry:**

- `bonusType`

### `getTooltipBonusDescription(bonusType, bonusValue)`

**Parametry:**

- `bonusType`
- `bonusValue`

### `capitalFormatStr(str)`

**Parametry:**

- `str`

### `onItemBoxChecked(widget)`

**Parametry:**

- `widget`

### `onPreyActive(slot, currentHolderName, currentHolderOutfit, bonusType, bonusValue, bonusGrade, timeLeft, timeUntilFreeReroll, lockType)`

**Parametry:**

- `slot`
- `currentHolderName`
- `currentHolderOutfit`
- `bonusType`
- `bonusValue`
- `bonusGrade`
- `timeLeft`
- `timeUntilFreeReroll`
- `lockType`

### `element.onClick()`

### `creatureAndBonus.bonus.icon.onHoverChange(widget, hovered)`

**Parametry:**

- `widget`
- `hovered`

### `prey.active.choose.selectPrey.onClick()`

bonus reroll

### `prey.active.reroll.button.rerollButton.onClick()`

creature reroll

### `onPreySelection(slot, bonusType, bonusValue, bonusGrade, names, outfits, timeUntilFreeReroll)`

**Parametry:**

- `slot`
- `bonusType`
- `bonusValue`
- `bonusGrade`
- `names`
- `outfits`
- `timeUntilFreeReroll`

### `element.onClick()`

### `rerollButton.onClick()`

### `prey.inactive.choose.choosePreyButton.onClick()`

### `onResourceBalance(type, balance)`

**Parametry:**

- `type`
- `balance`

### `showMessage(title, message)`

**Parametry:**

- `title`
- `message`

## Events/Callbacks

### `usDescription`

**Wywołanie:** `function bonusDescription(bonusType, bonusValue, bonusGrade)`

### `us`

**Wywołanie:** `return "Damage bonus (" .. bonusGrade .. "/10)"`

### `us`

**Wywołanie:** `return "Damage reduction bonus (" .. bonusGrade .. "/10)"`

### `us`

**Wywołanie:** `return "XP bonus (" .. bonusGrade .. "/10)"`

### `us`

**Wywołanie:** `return "Loot bonus (" .. bonusGrade .. "/10)"`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `displayUI`

**Wywołanie:** `preyWindow = g_ui.displayUI('prey')`

### `createWidget`

**Wywołanie:** `preyTracker = g_ui.createWidget('PreyTracker', modules.game_interface.getRightPanel())`

### `tentMaximumHeight`

**Wywołanie:** `preyTracker:setContentMaximumHeight(100)`

### `tentMinimumHeight`

**Wywołanie:** `preyTracker:setContentMinimumHeight(47)`

### `Hover`

**Wywołanie:** `function onHover(widget)`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `PreyFreeRolls`

**Wywołanie:** `function onPreyFreeRolls(slot, timeleft)`

### `PreyTimeLeft`

**Wywołanie:** `function onPreyTimeLeft(slot, timeLeft)`

### `PreyPrice`

**Wywołanie:** `function onPreyPrice(price)`

### `PreyLocked`

**Wywołanie:** `function onPreyLocked(slot, unlockState, timeUntilFreeReroll)`

### `tentMaximumHeight`

**Wywołanie:** `preyTracker:setContentMaximumHeight(preyTracker:getHeight()-20)`

### `PreyInactive`

**Wywołanie:** `function onPreyInactive(slot, timeUntilFreeReroll)`

### `usGradeStars`

**Wywołanie:** `function setBonusGradeStars(slot, grade)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget("Star", gradePanel)`

### `Hover`

**Wywołanie:** `onHover(slot)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget("NoStar", gradePanel)`

### `Hover`

**Wywołanie:** `onHover(slot)`

### `Path`

**Wywołanie:** `function getBigIconPath(bonusType)`

### `Path`

**Wywołanie:** `function getSmallIconPath(bonusType)`

### `usDescription`

**Wywołanie:** `function getBonusDescription(bonusType)`

### `usDescription`

**Wywołanie:** `function getTooltipBonusDescription(bonusType, bonusValue)`

### `ItemBoxChecked`

**Wywołanie:** `function onItemBoxChecked(widget)`

### `PreyActive`

**Wywołanie:** `function onPreyActive(slot, currentHolderName, currentHolderOutfit, bonusType, bonusValue, bonusGrade, timeLeft, timeUntilFreeReroll, lockType) -- locktype always 0 for protocols <12`

### `Path`

**Wywołanie:** `tracker.preyType:setImageSource(getSmallIconPath(bonusType))`

### `usDescription`

**Wywołanie:** `preyDescription[slot].two = "\nValue: " ..bonusGrade.."/10".."\nType: " .. getBonusDescription(bonusType) ..  "\n"..getTooltipBonusDescription(bonusType,bonusValue).."\n\nClick in this window to open the prey dialog."`

### `Path`

**Wywołanie:** `creatureAndBonus.bonus.icon:setImageSource(getBigIconPath(bonusType))`

### `Hover`

**Wywołanie:** `onHover(slot)`

### `usGradeStars`

**Wywołanie:** `setBonusGradeStars(slot, bonusGrade)`

### `PreySelection`

**Wywołanie:** `function onPreySelection(slot, bonusType, bonusValue, bonusGrade, names, outfits, timeUntilFreeReroll)`

### `createWidget`

**Wywołanie:** `local box = g_ui.createWidget("PreyCreatureBox", list)`

### `ResourceBalance`

**Wywołanie:** `function onResourceBalance(type, balance)`

---
doc_id: "lua-spec-904fba22888c"
source_path: "game_bot/default_configs/vBot_4.8/vBot/AttackBot.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: AttackBot.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/AttackBot.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/AttackBot.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla AttackBot.

## Globals/Exports

### `attackTable`

### `attackTable`

### `attackTable`

### `attackTable`

### `attackTable`

### `AttackBot`

public functions

### `t`

## Functions

### `ui.title.onClick(widget)`

small UI elements

**Parametry:**

- `widget`

### `ui.settings.onClick(widget)`

**Parametry:**

- `widget`

### `mainWindow.onVisibilityChange(widget, visible)`

**Parametry:**

- `widget`
- `visible`

### `toggleSettings()`

main panel functions

### `mainWindow.settings.onClick()`

### `toggleItem()`

### `setCategoryText()`

### `setPatternText()`

### `panel.previousCategory.onClick()`

in/de/crementation buttons

### `panel.nextCategory.onClick()`

### `panel.previousSource.onClick()`

### `panel.nextSource.onClick()`

### `panel.previousRange.onClick()`

### `panel.nextRange.onClick()`

### `setupWidget(widget)`

eo in/de/crementation ----- [[core table function]] -------

**Parametry:**

- `widget`

### `widget.remove.onClick()`

### `widget.enabled.onClick()`

### `widget.onDoubleClick(widget)`

will serve as edit

**Parametry:**

- `widget`

### `widget.onClick(widget)`

**Parametry:**

- `widget`

### `refreshAttacks()`

refreshing values

### `panel.addEntry.onClick(wdiget)`

adding values

**Parametry:**

- `wdiget`

### `panel.up.onClick(widget)`

moving values up

**Parametry:**

- `widget`

### `panel.down.onClick(widget)`

down

**Parametry:**

- `widget`

### `settingsUI.profileName.onTextChange(widget, text)`

[[settings panel]] --

**Parametry:**

- `widget`
- `text`

### `settingsUI.IgnoreMana.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.Rotate.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.Kills.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.Cooldown.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.Visible.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.PvpMode.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.PvpSafe.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.Training.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.BlackListSafe.onClick(widget)`

**Parametry:**

- `widget`

### `settingsUI.KillsAmount.onValueChange(widget, value)`

**Parametry:**

- `widget`
- `value`

### `settingsUI.AntiRsRange.onValueChange(widget, value)`

**Parametry:**

- `widget`
- `value`

### `mainWindow.closeButton.onClick()`

window elements

### `resetFields()`

core functions

### `loadSettings()`

### `button.onClick()`

### `AttackBot.isOn()`

### `AttackBot.isOff()`

### `AttackBot.setOff()`

### `AttackBot.setOn()`

### `AttackBot.getActiveProfile()`

### `AttackBot.setActiveProfile(n)`

**Parametry:**

- `n`

### `AttackBot.show()`

### `getPattern(category, pattern, safe)`

otui covered, now support functions

**Parametry:**

- `category`
- `pattern`
- `safe`

### `getMonstersInArea(category, posOrCreature, pattern, minHp, maxHp, safePattern, monsterNamesTable)`

**Parametry:**

- `category`
- `posOrCreature`
- `pattern`
- `minHp`
- `maxHp`
- `safePattern`
- `monsterNamesTable`

### `getBestTileByPattern(pattern, minHp, maxHp, safePattern, monsterNamesTable)`

for area runes only should return valid targets number (int) and position

**Parametry:**

- `pattern`
- `minHp`
- `maxHp`
- `safePattern`
- `monsterNamesTable`

**Zwraca:** valid targets number (int) and position

### `executeAttackBotAction(categoryOrPos, idOrFormula, cooldown)`

**Parametry:**

- `categoryOrPos`
- `idOrFormula`
- `cooldown`

## Events/Callbacks

### `figSave`

**Wywołanie:** `vBotConfigSave("atk")`

### `figSave`

**Wywołanie:** `vBotConfigSave("atk")`

### `figSave`

**Wywołanie:** `vBotConfigSave("atk")`

### `figSave`

**Wywołanie:** `vBotConfigSave("atk")`

### `figSave`

**Wywołanie:** `vBotConfigSave("atk")`

### `umber`

**Wywołanie:** `if not n or not tonumber(n) or n < 1 or n > 5 then`

### `stersInArea`

**Wywołanie:** `function getMonstersInArea(category, posOrCreature, pattern, minHp, maxHp, safePattern, monsterNamesTable)`

### `ster`

**Wywołanie:** `monsters = spec:isMonster() and specHp >= minHp and specHp <= maxHp and (#t == 0 or table.find(t, name, true)) and`

### `ster`

**Wywołanie:** `monsters = spec:isMonster() and specHp >= minHp and specHp <= maxHp and (#t == 0 or table.find(t, name)) and`

### `stersInArea`

**Wywołanie:** `local amount = getMonstersInArea(2, tPos, pattern, minHp, maxHp, safePattern, monsterNamesTable)`

### `Active`

**Wywołanie:** `if #currentSettings.attackTable == 0 or isInPz() or not target() or modules.game_cooldown.isGroupCooldownIconActive(1) then return end`

### `stersInArea`

**Wywołanie:** `local monsterAmount = getMonstersInArea(entry.category, nil, nil, entry.minHp, entry.maxHp, false, entry.monsters)`

### `stersInArea`

**Wywołanie:** `local monsterAmount = getMonstersInArea(entry.category, nil, nil, entry.minHp, entry.maxHp, false, entry.monsters)`

### `stersInArea`

**Wywołanie:** `local monsterAmount = pCat ~= 8 and getMonstersInArea(entry.category, anchorParam, spellPatterns[pCat][entry.pattern][1], entry.minHp, entry.maxHp, safe, entry.monsters)`

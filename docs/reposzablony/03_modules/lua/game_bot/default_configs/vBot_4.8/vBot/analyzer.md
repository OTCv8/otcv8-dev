---
doc_id: "lua-spec-a971bb7d7918"
source_path: "game_bot/default_configs/vBot_4.8/vBot/analyzer.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: analyzer.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/analyzer.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/analyzer.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla analyzer.

## Globals/Exports

### `time`

### `refillTime`

### `trackedLoot`

### `trackedBoss`

### `outfits`

### `customPrices`

### `time`

### `refillTime`

### `dmgTable`

### `healTable`

### `expTable`

### `dmgDistribution`

### `lootedItems`

### `useData`

### `usedItems`

### `killList`

### `Analyzer`

public functions global namespace

## Functions

### `getSumStats()`

### `clipboardData()`

### `mainWindow.contentsPanel.HuntingAnalyzer.onClick()`

toggles window

### `mainWindow.onClose()`

### `mainWindow.contentsPanel.LootAnalyzer.onClick()`

### `mainWindow.contentsPanel.SupplyAnalyzer.onClick()`

### `mainWindow.contentsPanel.ImpactAnalyzer.onClick()`

### `mainWindow.contentsPanel.XPAnalyzer.onClick()`

### `mainWindow.contentsPanel.PartyHunt.onClick()`

### `mainWindow.contentsPanel.DropTracker.onClick()`

### `mainWindow.contentsPanel.Stats.onClick()`

### `mainWindow.contentsPanel.BossTracker.onClick()`

### `bossWindow.contentsPanel.search.onTextChange(widget, newText)`

boss tracker

**Parametry:**

- `widget`
- `newText`

### `newTimeFormat(v)`

on login

**Parametry:**

- `v`

### `createBossPanel(bossName, dueTime)`

**Parametry:**

- `bossName`
- `dueTime`

### `maintainDropTable()`

### `createTrackedItems()`

### `dropLoot.onDoubleClick()`

### `item.onItemChange(widget)`

**Parametry:**

- `widget`

### `dropLoot.onDoubleClick()`

### `item.onItemChange(widget)`

**Parametry:**

- `widget`

### `getColor(v)`

**Parametry:**

- `v`

### `formatStr(str)`

**Parametry:**

- `str`

### `getPrice(name)`

**Parametry:**

- `name`

### `format_thousand(v, comma)`

**Parametry:**

- `v`
- `comma`

### `niceTimeFormat(v, seconds)`

**Parametry:**

- `v`
- `seconds`

### `sessionTime()`

### `add(t, text, color, last)`

**Parametry:**

- `t`
- `text`
- `color`
- `last`

### `sendData()`

Bot Server

### `widget.onDoubleClick()`

### `hightlightText(widget, color, duration)`

**Parametry:**

- `widget`
- `color`
- `duration`

### `niceFormat(v)`

**Parametry:**

- `v`

### `resetAnalyzerSessionData()`

### `mainWindow.contentsPanel.ResetSession.onClick()`

### `mainWindow.contentsPanel.Settings.onClick()`

### `settingsWindow.closeButton.onClick()`

extras window

### `getFrame(v)`

**Parametry:**

- `v`

### `displayCondition(menuPosition, lookThing, useThing, creatureThing)`

**Parametry:**

- `menuPosition`
- `lookThing`
- `useThing`
- `creatureThing`

### `setFrames()`

### `child.onHoverChange(widget, hovered)`

**Parametry:**

- `widget`
- `hovered`

### `smallNumbers(n)`

**Parametry:**

- `n`

### `refreshList()`

### `label.remove.onClick()`

### `settingsWindow.addItem.onClick()`

### `settingsWindow.LootChannel.onClick(widget)`

**Parametry:**

- `widget`

### `settingsWindow.RarityFrames.onClick(widget)`

**Parametry:**

- `widget`

### `capitalFistLetter(str)`

**Parametry:**

- `str`

### `getPanelHeight(panel)`

**Parametry:**

- `panel`

### `refreshLoot()`

### `refreshKills()`

### `refreshWaste()`

### `hourVal(v)`

**Parametry:**

- `v`

### `bottingStats()`

### `bottingLabels(lootWorth, wasteWorth, balance)`

**Parametry:**

- `lootWorth`
- `wasteWorth`
- `balance`

### `reportStats()`

### `damageHour()`

### `healHour()`

### `wasteHour()`

### `lootHour()`

### `getHuntingData()`

### `avgTable(t)`

**Parametry:**

- `t`

### `Analyzer.getKillsAmount(name)`

**Parametry:**

- `name`

### `Analyzer.getLootedAmount(nameOrId)`

**Parametry:**

- `nameOrId`

### `Analyzer.getTotalProfit()`

### `Analyzer.getTotalWaste()`

### `Analyzer.getBalance()`

### `Analyzer.getXpGained()`

### `Analyzer.getXpHour()`

### `Analyzer.getTimeToNextLevel()`

### `Analyzer.getCaveBotStats()`

## Events/Callbacks

### `getRootWidget`

**Wywołanie:** `local element = g_ui.getRootWidget():recursiveGetChildById(window)`

### `tentMaximumHeight`

**Wywołanie:** `mainWindow:setContentMaximumHeight(267)`

### `tentMaximumHeight`

**Wywołanie:** `impactWindow:setContentMaximumHeight(615)`

### `tentMaximumHeight`

**Wywołanie:** `xpWindow:setContentMaximumHeight(230)`

### `Time`

**Wywołanie:** `local second = "Session: " .. sessionTime()`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

### `umber`

**Wywołanie:** `cd = tonumber(cd) * 60 * 60 -- cd in seconds`

### `AttackingCreatureChange`

save outfits

**Wywołanie:** `onAttackingCreatureChange(function(newCreature, oldCreature)`

### `umber`

**Wywołanie:** `local id = tonumber(k)`

### `umber`

**Wywołanie:** `if tonumber(widget:getParent():getId()) then`

### `umber`

only amount have changed, ignore

**Wywołanie:** `if tonumber(widget:getParent():getId()) == id then return end`

### `umber`

**Wywołanie:** `if tonumber(widget:getParent():getId()) then`

### `umber`

only amount have changed, ignore

**Wywołanie:** `if tonumber(widget:getParent():getId()) == id then return end`

### `Time`

**Wywołanie:** `sessionTime()`

### `Time`

**Wywołanie:** `sessionTime()`

### `Data`

**Wywołanie:** `resetAnalyzerSessionData()`

### `event`

**Wywołanie:** `schedule(10*1000, function()`

### `event`

**Wywołanie:** `schedule(i * 250, function()`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode, text)`

### `event`

**Wywołanie:** `schedule(3000, function()`

### `event`

**Wywołanie:** `schedule(math.max(#text * 50, 2000), function()`

### `Data`

**Wywołanie:** `resetAnalyzerSessionData()`

### `tainers`

**Wywołanie:** `for _, container in pairs(getContainers()) do`

### `ContainerOpen`

**Wywołanie:** `onContainerOpen(function(container, previousContainer)`

### `AddItem`

**Wywołanie:** `onAddItem(function(container, slot, item, oldItem)`

### `RemoveItem`

**Wywołanie:** `onRemoveItem(function(container, slot, item)`

### `ContainerUpdateItem`

**Wywołanie:** `onContainerUpdateItem(function(container, slot, item, oldItem)`

### `event`

**Wywołanie:** `schedule(5, function()`

### `umber`

**Wywołanie:** `local newPrice = tonumber(settingsWindow.NewPrice:getText())`

### `event`

**Wywołanie:** `schedule(5, function()`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode, text)`

### `umber`

**Wywołanie:** `table.insert(labelTable, {m=k, d=tonumber(v)})`

### `tainers`

loot analyzer adding

**Wywołanie:** `local containers = CaveBot.GetLootContainers()`

### `AddItem`

**Wywołanie:** `onAddItem(function(container, slot, item, oldItem)`

### `tainerItem`

**Wywołanie:** `if not table.find(containers, container:getContainerItem():getId()) then return end`

### `ContainerUpdateItem`

**Wywołanie:** `onContainerUpdateItem(function(container, slot, item, oldItem)`

### `tainerItem`

**Wywołanie:** `if not table.find(containers, container:getContainerItem():getId()) then return end`

### `ContainerUpdateItem`

**Wywołanie:** `onContainerUpdateItem(function(container, slot, item, oldItem)`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode, text)`

### `Time`

**Wywołanie:** `a = "Session Time: " .. sessionTime() .. ", Exp Gained: " .. format_thousand(expGained()) .. ", Exp/h: " .. expPerHour()`

### `ds`

hps and dps

**Wywołanie:** `local curHPS = valueInSeconds(healTable)`

### `ds`

**Wywołanie:** `local curDPS = valueInSeconds(dmgTable)`

### `Time`

hunt window

**Wywołanie:** `sessionTimeLabel:setText(sessionTime())`

### `ds`

**Wywołanie:** `drawGraph(dmgGraph, valueInSeconds(dmgTable) or 0)`

### `ds`

**Wywołanie:** `drawGraph(healGraph, valueInSeconds(healTable) or 0)`

### `Time`

**Wywołanie:** `partySessionTimeLabel:setText(sessionTime())`

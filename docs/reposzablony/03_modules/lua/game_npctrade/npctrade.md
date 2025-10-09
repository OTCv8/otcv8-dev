---
doc_id: "lua-spec-193a0553d1d3"
source_path: "game_npctrade/npctrade.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: npctrade.lua"
summary: "Dokumentacja modułu Lua dla game_npctrade/npctrade.lua"
tags: ["lua", "module", "otclient"]
---

# game_npctrade/npctrade.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla npctrade.

## Globals/Exports

### `tradeItems`

### `playerItems`

### `playerItems`

## Functions

### `init()`

### `terminate()`

### `show()`

### `hide()`

### `onItemBoxChecked(widget)`

**Parametry:**

- `widget`

### `onQuantityValueChange(quantity)`

**Parametry:**

- `quantity`

### `onTradeTypeChange(radioTabs, selected, deselected)`

**Parametry:**

- `radioTabs`
- `selected`
- `deselected`

### `onTradeClick()`

### `onSearchTextChange()`

### `itemPopup(self, mousePosition, mouseButton)`

**Parametry:**

- `self`
- `mousePosition`
- `mouseButton`

### `onBuyWithBackpackChange()`

### `onIgnoreCapacityChange()`

### `onIgnoreEquippedChange()`

### `onShowAllItemsChange()`

### `setCurrency(currency, decimal)`

**Parametry:**

- `currency`
- `decimal`

### `setShowWeight(state)`

**Parametry:**

- `state`

### `setShowYourCapacity(state)`

**Parametry:**

- `state`

### `clearSelectedItem()`

### `getCurrentTradeType()`

### `getItemPrice(item, single)`

**Parametry:**

- `item`
- `single`

### `getSellQuantity(item)`

**Parametry:**

- `item`

### `canTradeItem(item)`

**Parametry:**

- `item`

### `refreshItem(item)`

**Parametry:**

- `item`

### `refreshTradeItems()`

### `refreshPlayerGoods()`

### `onOpenNpcTrade(items)`

**Parametry:**

- `items`

### `closeNpcTrade()`

### `onCloseNpcTrade()`

### `onPlayerGoods(money, items)`

**Parametry:**

- `money`
- `items`

### `onFreeCapacityChange(localPlayer, freeCapacity, oldFreeCapacity)`

**Parametry:**

- `localPlayer`
- `freeCapacity`
- `oldFreeCapacity`

### `onInventoryChange(inventory, item, oldItem)`

**Parametry:**

- `inventory`
- `item`
- `oldItem`

### `getTradeItemData(id, type)`

**Parametry:**

- `id`
- `type`

### `checkSellAllTooltip()`

### `formatCurrency(amount)`

**Parametry:**

- `amount`

### `getMaxAmount()`

### `sellAll(delayed, exceptions)`

**Parametry:**

- `delayed`
- `exceptions`

## Events/Callbacks

### `displayUI`

**Wywołanie:** `npcWindow = g_ui.displayUI('npctrade')`

### `g_game`

**Wywołanie:** `connect(g_game, { onGameEnd = hide,`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, { onFreeCapacityChange = onFreeCapacityChange,`

### `g_game`

**Wywołanie:** `disconnect(g_game, {  onGameEnd = hide,`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, { onFreeCapacityChange = onFreeCapacityChange,`

### `ItemBoxChecked`

**Wywołanie:** `function onItemBoxChecked(widget)`

### `QuantityValueChange`

**Wywołanie:** `function onQuantityValueChange(quantity)`

### `TradeTypeChange`

**Wywołanie:** `function onTradeTypeChange(radioTabs, selected, deselected)`

### `TradeClick`

**Wywołanie:** `function onTradeClick()`

### `SearchTextChange`

**Wywołanie:** `function onSearchTextChange()`

### `createWidget`

**Wywołanie:** `local menu = g_ui.createWidget('PopupMenu')`

### `BuyWithBackpackChange`

**Wywołanie:** `function onBuyWithBackpackChange()`

### `IgnoreCapacityChange`

**Wywołanie:** `function onIgnoreCapacityChange()`

### `IgnoreEquippedChange`

**Wywołanie:** `function onIgnoreEquippedChange()`

### `ShowAllItemsChange`

**Wywołanie:** `function onShowAllItemsChange()`

### `createWidget`

**Wywołanie:** `local itemBox = g_ui.createWidget('NPCItemBox', itemsPanel)`

### `OpenNpcTrade`

**Wywołanie:** `function onOpenNpcTrade(items)`

### `event`

**Wywołanie:** `addEvent(show) -- player goods has not been parsed yet`

### `event`

**Wywołanie:** `addEvent(hide)`

### `CloseNpcTrade`

**Wywołanie:** `function onCloseNpcTrade()`

### `event`

**Wywołanie:** `addEvent(hide)`

### `PlayerGoods`

**Wywołanie:** `function onPlayerGoods(money, items)`

### `FreeCapacityChange`

**Wywołanie:** `function onFreeCapacityChange(localPlayer, freeCapacity, oldFreeCapacity)`

### `InventoryChange`

**Wywołanie:** `function onInventoryChange(inventory, item, oldItem)`

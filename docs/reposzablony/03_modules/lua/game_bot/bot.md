---
doc_id: "lua-spec-40bd8539d74d"
source_path: "game_bot/bot.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: bot.lua"
summary: "Dokumentacja modułu Lua dla game_bot/bot.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/bot.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla bot.

## Globals/Exports

### `botStorage`

storage

## Functions

### `init()`

### `terminate()`

### `clear()`

### `refresh()`

### `configList.onOptionChange(widget)`

**Parametry:**

- `widget`

### `enableButton.onClick(widget)`

**Parametry:**

- `widget`

### `save()`

### `onMiniWindowClose()`

### `toggle()`

### `online()`

### `offline()`

### `onError(message)`

**Parametry:**

- `message`

### `edit()`

### `createDefaultConfigs()`

### `uploadConfig()`

### `downloadConfig()`

### `compressConfig(configName)`

**Parametry:**

- `configName`

### `decompressConfig(configName, archive)`

**Parametry:**

- `configName`
- `archive`

### `message(category, msg)`

Executor

**Parametry:**

- `category`
- `msg`

### `check()`

### `initCallbacks()`

Callbacks

### `terminateCallbacks()`

### `safeBotCall(func)`

**Parametry:**

- `func`

### `botKeyDown(widget, keyCode, keyboardModifiers)`

**Parametry:**

- `widget`
- `keyCode`
- `keyboardModifiers`

### `botKeyUp(widget, keyCode, keyboardModifiers)`

**Parametry:**

- `widget`
- `keyCode`
- `keyboardModifiers`

### `botKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)`

**Parametry:**

- `widget`
- `keyCode`
- `keyboardModifiers`
- `autoRepeatTicks`

### `botOnTalk(name, level, mode, text, channelId, pos)`

**Parametry:**

- `name`
- `level`
- `mode`
- `text`
- `channelId`
- `pos`

### `botOnTextMessage(mode, text)`

**Parametry:**

- `mode`
- `text`

### `botOnLoginAdvice(message)`

**Parametry:**

- `message`

### `botAddThing(tile, thing)`

**Parametry:**

- `tile`
- `thing`

### `botRemoveThing(tile, thing)`

**Parametry:**

- `tile`
- `thing`

### `botCreatureAppear(creature)`

**Parametry:**

- `creature`

### `botCreatureDisappear(creature)`

**Parametry:**

- `creature`

### `botCreaturePositionChange(creature, newPos, oldPos)`

**Parametry:**

- `creature`
- `newPos`
- `oldPos`

### `botCraetureHealthPercentChange(creature, healthPercent)`

**Parametry:**

- `creature`
- `healthPercent`

### `botOnUse(pos, itemId, stackPos, subType)`

**Parametry:**

- `pos`
- `itemId`
- `stackPos`
- `subType`

### `botOnUseWith(pos, itemId, target, subType)`

**Parametry:**

- `pos`
- `itemId`
- `target`
- `subType`

### `botContainerOpen(container, previousContainer)`

**Parametry:**

- `container`
- `previousContainer`

### `botContainerClose(container)`

**Parametry:**

- `container`

### `botContainerUpdateItem(container, slot, item, oldItem)`

**Parametry:**

- `container`
- `slot`
- `item`
- `oldItem`

### `botOnMissle(missle)`

**Parametry:**

- `missle`

### `botOnAnimatedText(thing, text)`

**Parametry:**

- `thing`
- `text`

### `botOnStaticText(thing, text)`

**Parametry:**

- `thing`
- `text`

### `botChannelList(channels)`

**Parametry:**

- `channels`

### `botOpenChannel(channelId, name)`

**Parametry:**

- `channelId`
- `name`

### `botCloseChannel(channelId)`

**Parametry:**

- `channelId`

### `botChannelEvent(channelId, name, event)`

**Parametry:**

- `channelId`
- `name`
- `event`

### `botCreatureTurn(creature, direction)`

**Parametry:**

- `creature`
- `direction`

### `botCreatureWalk(creature, oldPos, newPos)`

**Parametry:**

- `creature`
- `oldPos`
- `newPos`

### `botImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)`

**Parametry:**

- `itemId`
- `slots`
- `activeSlots`
- `imbuements`
- `needItems`

### `botModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)`

**Parametry:**

- `id`
- `title`
- `message`
- `buttons`
- `enterButton`
- `escapeButton`
- `choices`
- `priority`

### `botGameEditText(id, itemId, maxLength, text, writer, time)`

**Parametry:**

- `id`
- `itemId`
- `maxLength`
- `text`
- `writer`
- `time`

### `botAttackingCreatureChange(creature, oldCreature)`

**Parametry:**

- `creature`
- `oldCreature`

### `botManaChange(player, mana, maxMana, oldMana, oldMaxMana)`

**Parametry:**

- `player`
- `mana`
- `maxMana`
- `oldMana`
- `oldMaxMana`

### `botStatesChange(player, states, oldStates)`

**Parametry:**

- `player`
- `states`
- `oldStates`

### `botContainerAddItem(container, slot, item, oldItem)`

**Parametry:**

- `container`
- `slot`
- `item`
- `oldItem`

### `botContainerRemoveItem(container, slot, item)`

**Parametry:**

- `container`
- `slot`
- `item`

### `botSpellCooldown(iconId, duration)`

**Parametry:**

- `iconId`
- `duration`

### `botGroupSpellCooldown(iconId, duration)`

**Parametry:**

- `iconId`
- `duration`

### `botInventoryChange(player, slot, item, oldItem)`

**Parametry:**

- `player`
- `slot`
- `item`
- `oldItem`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle("ui/basic.otui")`

### `importStyle`

**Wywołanie:** `g_ui.importStyle("ui/panels.otui")`

### `importStyle`

**Wywołanie:** `g_ui.importStyle("ui/config.otui")`

### `importStyle`

**Wywołanie:** `g_ui.importStyle("ui/icons.otui")`

### `importStyle`

**Wywołanie:** `g_ui.importStyle("ui/container.otui")`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `loadUI`

**Wywołanie:** `botWindow = g_ui.loadUI('bot', modules.game_interface.getLeftPanel())`

### `tentWidget`

**Wywołanie:** `botTabs:setContentWidget(contentsPanel.botPanel)`

### `displayUI`

**Wywołanie:** `editWindow = g_ui.displayUI('edit')`

### `line`

**Wywołanie:** `online()`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `getRootWidget`

**Wywołanie:** `for i, widget in pairs(g_ui.getRootWidget():getChildren()) do`

### `Error`

**Wywołanie:** `return onError("Can't create bot directory in " .. g_resources.getWriteDir())`

### `figs`

get list of configs

**Wywołanie:** `createDefaultConfigs()`

### `s`

**Wywołanie:** `configList:clearOptions()`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(botStorageFile))`

### `Error`

**Wywołanie:** `return onError("Error while reading storage (" .. botStorageFile .. "). To fix this problem you can delete storage.json. Details: " .. result)`

### `Error`

**Wywołanie:** `return onError(result)`

### `Error`

**Wywołanie:** `return onError("Error while saving bot storage. Storage won't be saved. Details: " .. result)`

### `Error`

**Wywołanie:** `return onError("Storage file is too big, above 100MB, it won't be saved")`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(botStorageFile, result)`

### `MiniWindowClose`

**Wywołanie:** `function onMiniWindowClose()`

### `line`

**Wywołanie:** `function online()`

### `Error`

**Wywołanie:** `function onError(message)`

### `s`

**Wywołanie:** `editWindow.manager.upload.config:clearOptions()`

### `figs`

**Wywołanie:** `function createDefaultConfigs()`

### `Error`

**Wywołanie:** `return onError("Can't create /bot/" .. config_name .. " directory in " .. g_resources.getWriteDir())`

### `Error`

**Wywołanie:** `return onError("Can't create /bot/" .. config_name  .. "/" .. baseName .. " directory in " .. g_resources.getWriteDir())`

### `tents`

**Wywołanie:** `local contents = g_resources.fileExists(file) and g_resources.readFileContents(file) or ""`

### `tents`

**Wywołanie:** `g_resources.writeFileContents("/bot/" .. config_name .. "/" .. baseName .. "/" .. baseName2, contents)`

### `tents`

**Wywołanie:** `local contents = g_resources.fileExists(file) and g_resources.readFileContents(file) or ""`

### `tents`

**Wywołanie:** `g_resources.writeFileContents("/bot/" .. config_name .. "/" .. baseName, contents)`

### `fig`

**Wywołanie:** `function uploadConfig()`

### `fig`

**Wywołanie:** `local archive = compressConfig(config)`

### `fig`

**Wywołanie:** `function downloadConfig()`

### `fig`

**Wywołanie:** `decompressConfig(configName, "/downloads/" .. path)`

### `fig`

**Wywołanie:** `function compressConfig(configName)`

### `Error`

**Wywołanie:** `return onError("Config " .. configName .. " doesn't exist")`

### `tents`

**Wywołanie:** `forArchive[file] = g_resources.readFileContents(fullPath)`

### `tents`

**Wywołanie:** `forArchive[file .. "/" .. file2] = g_resources.readFileContents(fullPath2)`

### `fig`

**Wywołanie:** `function decompressConfig(configName, archive)`

### `Error`

**Wywołanie:** `return onError("Can't create /bot/" .. configName .. " directory in " .. g_resources.getWriteDir())`

### `Error`

**Wywołanie:** `return onError("Can't create " .. dirPath .. " directory in " .. g_resources.getWriteDir())`

### `tents`

**Wywołanie:** `g_resources.writeFileContents("/bot/" .. configName .. file, contents)`

### `createWidget`

**Wywołanie:** `local widget = g_ui.createWidget('BotLabel', botMessages)`

### `Error`

**Wywołanie:** `return onError(result)`

### `rootWidget`

**Wywołanie:** `connect(rootWidget, {`

### `g_game`

**Wywołanie:** `connect(g_game, {`

### `Tile`

**Wywołanie:** `connect(Tile, {`

### `Creature`

**Wywołanie:** `connect(Creature, {`

### `LocalPlayer`

**Wywołanie:** `connect(LocalPlayer, {`

### `Container`

**Wywołanie:** `connect(Container, {`

### `g_map`

**Wywołanie:** `connect(g_map, {`

### `rootWidget`

**Wywołanie:** `disconnect(rootWidget, {`

### `g_game`

**Wywołanie:** `disconnect(g_game, {`

### `Tile`

**Wywołanie:** `disconnect(Tile, {`

### `Creature`

**Wywołanie:** `disconnect(Creature, {`

### `LocalPlayer`

**Wywołanie:** `disconnect(LocalPlayer, {`

### `Container`

**Wywołanie:** `disconnect(Container, {`

### `g_map`

**Wywołanie:** `disconnect(g_map, {`

### `Error`

**Wywołanie:** `onError(result)`

### `KeyDown`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onKeyDown(keyCode, keyboardModifiers) end)`

### `KeyUp`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onKeyUp(keyCode, keyboardModifiers) end)`

### `KeyPress`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onKeyPress(keyCode, keyboardModifiers, autoRepeatTicks) end)`

### `Talk`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onTalk(name, level, mode, text, channelId, pos) end)`

### `TextMessage`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onTextMessage(mode, text) end)`

### `LoginAdvice`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onLoginAdvice(message) end)`

### `AddThing`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onAddThing(tile, thing) end)`

### `RemoveThing`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onRemoveThing(tile, thing) end)`

### `CreatureAppear`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onCreatureAppear(creature) end)`

### `CreatureDisappear`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onCreatureDisappear(creature) end)`

### `Change`

**Wywołanie:** `function botCreaturePositionChange(creature, newPos, oldPos)`

### `CreaturePositionChange`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onCreaturePositionChange(creature, newPos, oldPos) end)`

### `CreatureHealthPercentChange`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onCreatureHealthPercentChange(creature, healthPercent) end)`

### `Use`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onUse(pos, itemId, stackPos, subType) end)`

### `UseWith`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onUseWith(pos, itemId, target, subType) end)`

### `tainerOpen`

**Wywołanie:** `function botContainerOpen(container, previousContainer)`

### `ContainerOpen`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onContainerOpen(container, previousContainer) end)`

### `tainerClose`

**Wywołanie:** `function botContainerClose(container)`

### `ContainerClose`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onContainerClose(container) end)`

### `tainerUpdateItem`

**Wywołanie:** `function botContainerUpdateItem(container, slot, item, oldItem)`

### `ContainerUpdateItem`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onContainerUpdateItem(container, slot, item, oldItem) end)`

### `Missle`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onMissle(missle) end)`

### `AnimatedText`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onAnimatedText(thing, text) end)`

### `StaticText`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onStaticText(thing, text) end)`

### `ChannelList`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onChannelList(channels) end)`

### `OpenChannel`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onOpenChannel(channelId, name) end)`

### `CloseChannel`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onCloseChannel(channelId) end)`

### `ChannelEvent`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onChannelEvent(channelId, name, event) end)`

### `Turn`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onTurn(creature, direction) end)`

### `Walk`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onWalk(creature, oldPos, newPos) end)`

### `ImbuementWindow`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onImbuementWindow(itemId, slots, activeSlots, imbuements, needItems) end)`

### `ModalDialog`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority) end)`

### `GameEditText`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onGameEditText(id, itemId, maxLength, text, writer, time) end)`

### `AttackingCreatureChange`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onAttackingCreatureChange(creature,oldCreature) end)`

### `ManaChange`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onManaChange(player, mana, maxMana, oldMana, oldMaxMana) end)`

### `StatesChange`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onStatesChange(player, states, oldStates) end)`

### `tainerAddItem`

**Wywołanie:** `function botContainerAddItem(container, slot, item, oldItem)`

### `AddItem`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onAddItem(container, slot, item, oldItem) end)`

### `tainerRemoveItem`

**Wywołanie:** `function botContainerRemoveItem(container, slot, item)`

### `RemoveItem`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onRemoveItem(container, slot, item) end)`

### `SpellCooldown`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onSpellCooldown(iconId, duration) end)`

### `GroupSpellCooldown`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onGroupSpellCooldown(iconId, duration) end)`

### `InventoryChange`

**Wywołanie:** `safeBotCall(function() botExecutor.callbacks.onInventoryChange(player, slot, item, oldItem) end)`

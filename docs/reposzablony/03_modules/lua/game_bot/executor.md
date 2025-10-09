---
doc_id: "lua-spec-37ac7a61fccd"
source_path: "game_bot/executor.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: executor.lua"
summary: "Dokumentacja modułu Lua dla game_bot/executor.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/executor.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla executor.

## Globals/Exports

### `onKeyDown`

### `onKeyUp`

### `onKeyPress`

### `onTalk`

### `onTextMessage`

### `onLoginAdvice`

### `onAddThing`

### `onRemoveThing`

### `onCreatureAppear`

### `onCreatureDisappear`

### `onCreaturePositionChange`

### `onCreatureHealthPercentChange`

### `onUse`

### `onUseWith`

### `onContainerOpen`

### `onContainerClose`

### `onContainerUpdateItem`

### `onMissle`

### `onAnimatedText`

### `onStaticText`

### `onChannelList`

### `onOpenChannel`

### `onCloseChannel`

### `onChannelEvent`

### `onTurn`

### `onWalk`

### `onImbuementWindow`

### `onModalDialog`

### `onAttackingCreatureChange`

### `onManaChange`

### `onStatesChange`

### `onAddItem`

### `onGameEditText`

### `onGroupSpellCooldown`

### `onSpellCooldown`

### `onRemoveItem`

### `onInventoryChange`

## Functions

### `executeBot(config, storage, tabs, msgCallback, saveConfigCallback, reloadCallback, websockets)`

**Parametry:**

- `config`
- `storage`
- `tabs`
- `msgCallback`
- `saveConfigCallback`
- `reloadCallback`
- `websockets`

### `context.load(str)`

**Parametry:**

- `str`

### `context.dofile(file)`

**Parametry:**

- `file`

### `context.getDistanceBetween(p1, p2)`

**Parametry:**

- `p1`
- `p2`

### `context.info(text)`

log functions

**Parametry:**

- `text`

### `context.warn(text)`

**Parametry:**

- `text`

### `context.error(text)`

**Parametry:**

- `text`

### `script()`

### `onKeyDown(keyCode, keyboardModifiers)`

**Parametry:**

- `keyCode`
- `keyboardModifiers`

### `onKeyUp(keyCode, keyboardModifiers)`

**Parametry:**

- `keyCode`
- `keyboardModifiers`

### `onKeyPress(keyCode, keyboardModifiers, autoRepeatTicks)`

**Parametry:**

- `keyCode`
- `keyboardModifiers`
- `autoRepeatTicks`

### `onTalk(name, level, mode, text, channelId, pos)`

**Parametry:**

- `name`
- `level`
- `mode`
- `text`
- `channelId`
- `pos`

### `onImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)`

**Parametry:**

- `itemId`
- `slots`
- `activeSlots`
- `imbuements`
- `needItems`

### `onTextMessage(mode, text)`

**Parametry:**

- `mode`
- `text`

### `onLoginAdvice(message)`

**Parametry:**

- `message`

### `onAddThing(tile, thing)`

**Parametry:**

- `tile`
- `thing`

### `onRemoveThing(tile, thing)`

**Parametry:**

- `tile`
- `thing`

### `onCreatureAppear(creature)`

**Parametry:**

- `creature`

### `onCreatureDisappear(creature)`

**Parametry:**

- `creature`

### `onCreaturePositionChange(creature, newPos, oldPos)`

**Parametry:**

- `creature`
- `newPos`
- `oldPos`

### `onCreatureHealthPercentChange(creature, healthPercent)`

**Parametry:**

- `creature`
- `healthPercent`

### `onUse(pos, itemId, stackPos, subType)`

**Parametry:**

- `pos`
- `itemId`
- `stackPos`
- `subType`

### `onUseWith(pos, itemId, target, subType)`

**Parametry:**

- `pos`
- `itemId`
- `target`
- `subType`

### `onContainerOpen(container, previousContainer)`

**Parametry:**

- `container`
- `previousContainer`

### `onContainerClose(container)`

**Parametry:**

- `container`

### `onContainerUpdateItem(container, slot, item, oldItem)`

**Parametry:**

- `container`
- `slot`
- `item`
- `oldItem`

### `onMissle(missle)`

**Parametry:**

- `missle`

### `onAnimatedText(thing, text)`

**Parametry:**

- `thing`
- `text`

### `onStaticText(thing, text)`

**Parametry:**

- `thing`
- `text`

### `onChannelList(channels)`

**Parametry:**

- `channels`

### `onOpenChannel(channelId, channelName)`

**Parametry:**

- `channelId`
- `channelName`

### `onCloseChannel(channelId)`

**Parametry:**

- `channelId`

### `onChannelEvent(channelId, name, event)`

**Parametry:**

- `channelId`
- `name`
- `event`

### `onTurn(creature, direction)`

**Parametry:**

- `creature`
- `direction`

### `onWalk(creature, oldPos, newPos)`

**Parametry:**

- `creature`
- `oldPos`
- `newPos`

### `onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)`

**Parametry:**

- `id`
- `title`
- `message`
- `buttons`
- `enterButton`
- `escapeButton`
- `choices`
- `priority`

### `onGameEditText(id, itemId, maxLength, text, writer, time)`

**Parametry:**

- `id`
- `itemId`
- `maxLength`
- `text`
- `writer`
- `time`

### `onAttackingCreatureChange(creature, oldCreature)`

**Parametry:**

- `creature`
- `oldCreature`

### `onManaChange(player, mana, maxMana, oldMana, oldMaxMana)`

**Parametry:**

- `player`
- `mana`
- `maxMana`
- `oldMana`
- `oldMaxMana`

### `onAddItem(container, slot, item)`

**Parametry:**

- `container`
- `slot`
- `item`

### `onRemoveItem(container, slot, item)`

**Parametry:**

- `container`
- `slot`
- `item`

### `onStatesChange(player, states, oldStates)`

**Parametry:**

- `player`
- `states`
- `oldStates`

### `onGroupSpellCooldown(iconId, duration)`

**Parametry:**

- `iconId`
- `duration`

### `onSpellCooldown(iconId, duration)`

**Parametry:**

- `iconId`
- `duration`

### `onSpellCooldown(iconId, duration)`

**Parametry:**

- `iconId`
- `duration`

### `onInventoryChange(player, slot, item, oldItem)`

**Parametry:**

- `player`
- `slot`
- `item`
- `oldItem`

## Events/Callbacks

### `fig`

**Wywołanie:** `return error("Config (/bot/" .. config .. ") doesn't have lua files")`

### `createWidget`

**Wywołanie:** `context.mainTab = context.tabs:addTab("Main", g_ui.createWidget('BotPanel')).tabPanel.content`

### `tents`

**Wywołanie:** `context.dofile = function(file) assert(load(g_resources.readFileContents("/bot/" .. config .. "/" .. file), file, nil, context))() end`

### `importStyle`

**Wywołanie:** `g_ui.importStyle(file)`

### `tents`

**Wywołanie:** `assert(load(g_resources.readFileContents(file), file, nil, context))()`

### `Click`

**Wywołanie:** `macro.switch:onClick()`

---
doc_id: "lua-spec-0a745eb119d3"
source_path: "game_bot/functions/callbacks.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: callbacks.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/callbacks.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/callbacks.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla callbacks.

## Functions

### `context.callback(callbackType, callback)`

callback(callbackType, callback)

**Parametry:**

- `callbackType`
- `callback`

### `remove()`

### `context.onKeyDown(callback)`

onKeyDown(callback) -- callback = function(keys)

**Parametry:**

- `callback`

### `context.onKeyPress(callback)`

onKeyPress(callback) -- callback = function(keys)

**Parametry:**

- `callback`

### `context.onKeyUp(callback)`

onKeyUp(callback) -- callback = function(keys)

**Parametry:**

- `callback`

### `context.onTalk(callback)`

onTalk(callback) -- callback = function(name, level, mode, text, channelId, pos)

**Parametry:**

- `callback`

### `context.onTextMessage(callback)`

onTextMessage(callback) -- callback = function(mode, text)

**Parametry:**

- `callback`

### `context.onLoginAdvice(callback)`

onLoginAdvice(callback) -- callback = function(message)

**Parametry:**

- `callback`

### `context.onAddThing(callback)`

onAddThing(callback) -- callback = function(tile, thing)

**Parametry:**

- `callback`

### `context.onRemoveThing(callback)`

onRemoveThing(callback) -- callback = function(tile, thing)

**Parametry:**

- `callback`

### `context.onCreatureAppear(callback)`

onCreatureAppear(callback) -- callback = function(creature)

**Parametry:**

- `callback`

### `context.onCreatureDisappear(callback)`

onCreatureDisappear(callback) -- callback = function(creature)

**Parametry:**

- `callback`

### `context.onCreaturePositionChange(callback)`

onCreaturePositionChange(callback) -- callback = function(creature, newPos, oldPos)

**Parametry:**

- `callback`

### `context.onCreatureHealthPercentChange(callback)`

onCreatureHealthPercentChange(callback) -- callback = function(creature, healthPercent)

**Parametry:**

- `callback`

### `context.onUse(callback)`

onUse(callback) -- callback = function(pos, itemId, stackPos, subType)

**Parametry:**

- `callback`

### `context.onUseWith(callback)`

onUseWith(callback) -- callback = function(pos, itemId, target, subType)

**Parametry:**

- `callback`

### `context.onContainerOpen(callback)`

onContainerOpen -- callback = function(container, previousContainer)

**Parametry:**

- `callback`

### `context.onContainerClose(callback)`

onContainerClose -- callback = function(container)

**Parametry:**

- `callback`

### `context.onContainerUpdateItem(callback)`

onContainerUpdateItem -- callback = function(container, slot, item, oldItem)

**Parametry:**

- `callback`

### `context.onMissle(callback)`

onMissle -- callback = function(missle)

**Parametry:**

- `callback`

### `context.onAnimatedText(callback)`

onAnimatedText -- callback = function(thing, text)

**Parametry:**

- `callback`

### `context.onStaticText(callback)`

onStaticText -- callback = function(thing, text)

**Parametry:**

- `callback`

### `context.onChannelList(callback)`

onChannelList -- callback = function(channels)

**Parametry:**

- `callback`

### `context.onOpenChannel(callback)`

onOpenChannel -- callback = function(channelId, name)

**Parametry:**

- `callback`

### `context.onCloseChannel(callback)`

onCloseChannel -- callback = function(channelId)

**Parametry:**

- `callback`

### `context.onChannelEvent(callback)`

onChannelEvent -- callback = function(channelId, name, event)

**Parametry:**

- `callback`

### `context.onTurn(callback)`

onTurn -- callback = function(creature, direction)

**Parametry:**

- `callback`

### `context.onWalk(callback)`

onWalk -- callback = function(creature, oldPos, newPos)

**Parametry:**

- `callback`

### `context.onImbuementWindow(callback)`

onImbuementWindow -- callback = function(itemId, slots, activeSlots, imbuements, needItems)

**Parametry:**

- `callback`

### `context.onModalDialog(callback)`

onModalDialog -- callback = function(id, title, message, buttons, enterButton, escapeButton, choices, priority) -- priority is unused, ignore it

**Parametry:**

- `callback`

### `context.onAttackingCreatureChange(callback)`

onAttackingCreatureChange -- callback = function(creature, oldCreature)

**Parametry:**

- `callback`

### `context.onManaChange(callback)`

onManaChange -- callback = function(player, mana, maxMana, oldMana, oldMaxMana)

**Parametry:**

- `callback`

### `context.onAddItem(callback)`

onAddItem - callback = function(container, slot, item, oldItem)

**Parametry:**

- `callback`

### `context.onRemoveItem(callback)`

onRemoveItem - callback = function(container, slot, item)

**Parametry:**

- `callback`

### `context.onStatesChange(callback)`

onStatesChange - callback = function(player, states, oldStates)

**Parametry:**

- `callback`

### `context.onGameEditText(callback)`

onGameEditText - callback = function(id, itemId, maxLength, text, writer, time)

**Parametry:**

- `callback`

### `context.onSpellCooldown(callback)`

onSpellCooldown - callback = function(iconId, duration)

**Parametry:**

- `callback`

### `context.onGroupSpellCooldown(callback)`

onGroupSpellCooldown - callback = function(iconId, duration)

**Parametry:**

- `callback`

### `context.onInventoryChange(callback)`

onInventoryChange - callback = function(player, slot, item, oldItem)

**Parametry:**

- `callback`

### `context.listen(name, callback)`

CUSTOM CALLBACKS listen(name, callback) -- callback = function(text, channelId, pos)

**Parametry:**

- `name`
- `callback`

### `context.onPlayerPositionChange(callback)`

onPlayerPositionChange(callback) -- callback = function(newPos, oldPos)

**Parametry:**

- `callback`

### `context.onPlayerHealthChange(callback)`

onPlayerHealthChange(callback) -- callback = function(healthPercent)

**Parametry:**

- `callback`

### `context.onPlayerInventoryChange(callback)`

onPlayerInventoryChange -- callback = function(slot, item, oldItem)

**Parametry:**

- `callback`

## Events/Callbacks

### `KeyDown`

**Wywołanie:** `-- onKeyDown(callback) -- callback = function(keys)`

### `KeyPress`

**Wywołanie:** `-- onKeyPress(callback) -- callback = function(keys)`

### `KeyUp`

**Wywołanie:** `-- onKeyUp(callback) -- callback = function(keys)`

### `Talk`

**Wywołanie:** `-- onTalk(callback) -- callback = function(name, level, mode, text, channelId, pos)`

### `TextMessage`

**Wywołanie:** `-- onTextMessage(callback) -- callback = function(mode, text)`

### `LoginAdvice`

**Wywołanie:** `-- onLoginAdvice(callback) -- callback = function(message)`

### `AddThing`

**Wywołanie:** `-- onAddThing(callback) -- callback = function(tile, thing)`

### `RemoveThing`

**Wywołanie:** `-- onRemoveThing(callback) -- callback = function(tile, thing)`

### `CreatureAppear`

**Wywołanie:** `-- onCreatureAppear(callback) -- callback = function(creature)`

### `CreatureDisappear`

**Wywołanie:** `-- onCreatureDisappear(callback) -- callback = function(creature)`

### `CreaturePositionChange`

**Wywołanie:** `-- onCreaturePositionChange(callback) -- callback = function(creature, newPos, oldPos)`

### `CreatureHealthPercentChange`

**Wywołanie:** `-- onCreatureHealthPercentChange(callback) -- callback = function(creature, healthPercent)`

### `Use`

**Wywołanie:** `-- onUse(callback) -- callback = function(pos, itemId, stackPos, subType)`

### `UseWith`

**Wywołanie:** `-- onUseWith(callback) -- callback = function(pos, itemId, target, subType)`

### `Talk`

**Wywołanie:** `return context.onTalk(function(name2, level, mode, text, channelId, pos)`

### `PlayerPositionChange`

**Wywołanie:** `-- onPlayerPositionChange(callback) -- callback = function(newPos, oldPos)`

### `CreaturePositionChange`

**Wywołanie:** `return context.onCreaturePositionChange(function(creature, newPos, oldPos)`

### `PlayerHealthChange`

**Wywołanie:** `-- onPlayerHealthChange(callback) -- callback = function(healthPercent)`

### `CreatureHealthPercentChange`

**Wywołanie:** `return context.onCreatureHealthPercentChange(function(creature, healthPercent)`

### `InventoryChange`

**Wywołanie:** `return context.onInventoryChange(function(player, slot, item, oldItem)`

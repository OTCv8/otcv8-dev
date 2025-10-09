---
doc_id: "lua-spec-d97b310b73d7"
source_path: "game_bot/functions/player.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: player.lua"
summary: "Dokumentacja modułu Lua dla game_bot/functions/player.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/functions/player.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla player.

## Functions

### `context.name()`

### `context.hp()`

### `context.mana()`

### `context.hppercent()`

### `context.manapercent()`

### `context.maxhp()`

### `context.maxmana()`

### `context.hpmax()`

### `context.manamax()`

### `context.cap()`

### `context.freecap()`

### `context.maxcap()`

### `context.capmax()`

### `context.exp()`

### `context.lvl()`

### `context.level()`

### `context.mlev()`

### `context.magic()`

### `context.mlevel()`

### `context.soul()`

### `context.stamina()`

### `context.voc()`

### `context.vocation()`

### `context.bless()`

### `context.blesses()`

### `context.blessings()`

### `context.pos()`

### `context.posx()`

### `context.posy()`

### `context.posz()`

### `context.direction()`

### `context.speed()`

### `context.skull()`

### `context.outfit()`

### `context.setOutfit(outfit)`

**Parametry:**

- `outfit`

### `context.setSpeed(value)`

**Parametry:**

- `value`

### `context.walk(dir)`

**Parametry:**

- `dir`

### `context.turn(dir)`

**Parametry:**

- `dir`

### `context.getChannels()`

game releated

### `context.getChannelId(name)`

**Parametry:**

- `name`

### `context.yell(text)`

**Parametry:**

- `text`

### `context.talkChannel(channel, text)`

**Parametry:**

- `channel`
- `text`

### `context.talkPrivate(receiver, text)`

**Parametry:**

- `receiver`
- `text`

### `context.talkNpc(text)`

**Parametry:**

- `text`

### `context.saySpell(text, lastSpellTimeout)`

**Parametry:**

- `text`
- `lastSpellTimeout`

### `context.setSpellTimeout()`

### `context.use(thing, subtype)`

**Parametry:**

- `thing`
- `subtype`

### `context.usewith(thing, target, subtype)`

**Parametry:**

- `thing`
- `target`
- `subtype`

### `context.useRune(itemid, target, lastSpellTimeout)`

**Parametry:**

- `itemid`
- `target`
- `lastSpellTimeout`

### `context.findItem(itemId, subType)`

**Parametry:**

- `itemId`
- `subType`

## Events/Callbacks

### `event`

**Wywołanie:** `context.schedule(100, function()`

### `tainers`

**Wywołanie:** `return g_game.findItemInContainers(itemId, subType)`

### `Active`

**Wywołanie:** `modules.game_cooldown.isGroupCooldownIconActive(id)`

### `Active`

**Wywołanie:** `modules.game_cooldown.isCooldownIconActive(id)`

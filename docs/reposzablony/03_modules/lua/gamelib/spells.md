---
doc_id: "lua-spec-280e97fbbd4a"
source_path: "gamelib/spells.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: spells.lua"
summary: "Dokumentacja modułu Lua dla gamelib/spells.lua"
tags: ["lua", "module", "otclient"]
---

# gamelib/spells.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla spells.

## Globals/Exports

### `Spells`

## Functions

### `Spells.getClientId(spellName)`

**Parametry:**

- `spellName`

### `Spells.getServerId(spellName)`

**Parametry:**

- `spellName`

### `Spells.getSpellByName(name)`

**Parametry:**

- `name`

### `Spells.getSpellByWords(words)`

**Parametry:**

- `words`

### `Spells.getSpellByIcon(iconId)`

**Parametry:**

- `iconId`

### `Spells.getSpellIconIds()`

### `Spells.getSpellProfileById(id)`

**Parametry:**

- `id`

### `Spells.getSpellProfileByWords(words)`

**Parametry:**

- `words`

### `Spells.getSpellProfileByName(spellName)`

**Parametry:**

- `spellName`

### `Spells.getSpellsByVocationId(vocId)`

**Parametry:**

- `vocId`

### `Spells.filterSpellsByGroups(spells, groups)`

**Parametry:**

- `spells`
- `groups`

### `Spells.getGroupIds(spell)`

**Parametry:**

- `spell`

### `Spells.getImageClip(id, profile)`

**Parametry:**

- `id`
- `profile`

## Events/Callbacks

### `umber`

**Wywołanie:** `if not tonumber(id) and SpellIcons[id] then`

### `umber`

**Wywołanie:** `return tonumber(id)`

### `umber`

**Wywołanie:** `if not tonumber(id) and SpellIcons[id] then`

### `umber`

**Wywołanie:** `return tonumber(id)`

### `Ids`

**Wywołanie:** `function Spells.getSpellIconIds()`

### `Id`

**Wywołanie:** `function Spells.getSpellsByVocationId(vocId)`

### `tains`

**Wywołanie:** `if table.contains(spell.vocations, vocId) then`

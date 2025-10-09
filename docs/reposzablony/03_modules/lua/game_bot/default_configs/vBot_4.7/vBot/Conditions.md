---
doc_id: "lua-spec-7b3696757b5f"
source_path: "game_bot/default_configs/vBot_4.7/vBot/Conditions.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: Conditions.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/vBot/Conditions.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/vBot/Conditions.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla Conditions.

## Globals/Exports

### `Conditions`

## Functions

### `ui.title.onClick(widget)`

**Parametry:**

- `widget`

### `ui.conditionList.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.onVisibilityChange(widget, visible)`

**Parametry:**

- `widget`
- `visible`

### `conditionsWindow.Cure.PoisonCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Cure.CurseCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Cure.BleedCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Cure.BurnCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Cure.ElectrifyCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Cure.ParalyseCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Cure.ParalyseSpell.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Hold.HasteSpell.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Hold.HasteCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Hold.UtamoCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Hold.UtanaCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Hold.UturaCost.onTextChange(widget, text)`

**Parametry:**

- `widget`
- `text`

### `conditionsWindow.Hold.UturaType.onOptionChange(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Cure.CurePoison.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Cure.CureCurse.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Cure.CureBleed.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Cure.CureBurn.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Cure.CureElectrify.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Cure.CureParalyse.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Hold.HoldHaste.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Hold.HoldUtamo.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Hold.HoldUtana.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Hold.HoldUtura.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Hold.IgnoreInPz.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.Hold.StopHaste.onClick(widget)`

**Parametry:**

- `widget`

### `conditionsWindow.closeButton.onClick(widget)`

buttons

**Parametry:**

- `widget`

### `Conditions.show()`

## Events/Callbacks

### `figSave`

**Wywołanie:** `vBotConfigSave("heal")`

### `getRootWidget`

**Wywołanie:** `local rootWidget = g_ui.getRootWidget()`

### `figSave`

**Wywołanie:** `vBotConfigSave("heal")`

### `umber`

**Wywołanie:** `config.poisonCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.curseCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.bleedCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.burnCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.electrifyCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.paralyseCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.hasteCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.utamoCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.utanaCost = tonumber(text)`

### `umber`

**Wywołanie:** `config.uturaCost = tonumber(text)`

### `Active`

**Wywołanie:** `if not config.enabled or modules.game_cooldown.isGroupCooldownIconActive(2) then return end`

### `ed`

**Wywołanie:** `if config.curePoison and mana() >= config.poisonCost and isPoisioned() then say("exana pox")`

### `Allowed`

**Wywołanie:** `elseif ((not config.ignoreInPz or not isInPz()) and standTime() < 5000 and config.holdHaste and mana() >= config.hasteCost and not hasHaste() and not getSpellCoolDown(config.hasteSpell) and (not target() or not config.stopHaste or TargetBot.isCaveBotActionAllowed())) and standTime() < 3000 then say(config.hasteSpell)`

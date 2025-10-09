---
doc_id: "otui-ui-f0b5a8f366fc"
source_path: "game_battle/battle.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: battle.otui"
summary: "Dokumentacja interfejsu OTUI dla game_battle/battle.otui"
tags: ["otui", "ui", "widget"]
---

# game_battle/battle.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla battle.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `BattleIcon` | `BattleIcon` | `UICheckBox` | size=20 20 |
| `BattlePlayers` | `BattlePlayers` | `BattleIcon` | image-source=/images/game/battle/battle_players |
| `BattleNPCs` | `BattleNPCs` | `BattleIcon` | image-source=/images/game/battle/battle_npcs |
| `BattleMonsters` | `BattleMonsters` | `BattleIcon` | image-source=/images/game/battle/battle_monsters |
| `BattleSkulls` | `BattleSkulls` | `BattleIcon` | image-source=/images/game/battle/battle_skulls |
| `battlePanel` | `BattleParty` | `BattleIcon` | image-source=/images/ui/arrow_vertical, id=battlePanel, height=18 |

## Widget Details

### `BattleIcon`

- **Klasa:** `BattleIcon`
- **Rodzic:** `UICheckBox`
- **Właściwości:**
  - `size`: 20 20
  - `image-color`: #ffffff88
  - `image-rect`: 0 0 20 20
  - `color`: #cccccc
  - `image-clip`: 0 60 20 20

### `BattlePlayers`

- **Klasa:** `BattlePlayers`
- **Rodzic:** `BattleIcon`
- **Właściwości:**
  - `image-source`: /images/game/battle/battle_players

### `BattleNPCs`

- **Klasa:** `BattleNPCs`
- **Rodzic:** `BattleIcon`
- **Właściwości:**
  - `image-source`: /images/game/battle/battle_npcs

### `BattleMonsters`

- **Klasa:** `BattleMonsters`
- **Rodzic:** `BattleIcon`
- **Właściwości:**
  - `image-source`: /images/game/battle/battle_monsters

### `BattleSkulls`

- **Klasa:** `BattleSkulls`
- **Rodzic:** `BattleIcon`
- **Właściwości:**
  - `image-source`: /images/game/battle/battle_skulls

### `battlePanel`

- **Klasa:** `BattleParty`
- **Rodzic:** `BattleIcon`
- **Właściwości:**
  - `image-source`: /images/ui/arrow_vertical
  - `id`: battlePanel
  - `height`: 18
  - `icon`: /images/topbuttons/battle
  - `margin-top`: 5
  - `width`: 21
  - `type`: verticalBox
  - `spacing`: 5
  - `margin-left`: 4
  - `image-rect`: 0 0 21 12
  - `image-clip`: 21 0 21 12
  - `phantom`: false
  - `margin-right`: 1
  - `padding-right`: 5
  - `fit-children`: true

## Hierarchy Diagram

Zobacz: [../diagrams/battle.mmd](../diagrams/battle.mmd)

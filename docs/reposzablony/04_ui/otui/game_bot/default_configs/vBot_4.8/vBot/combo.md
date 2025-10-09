---
doc_id: "otui-ui-ec3ce0410dcd"
source_path: "game_bot/default_configs/vBot_4.8/vBot/combo.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: combo.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/combo.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/combo.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla combo.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `AttackComboBoxPopupMenu` | `AttackComboBoxPopupMenu` | `ComboBoxPopupMenu` |  |
| `AttackComboBoxPopupMenuButton` | `AttackComboBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | self=addOption("COMMAND TARGET") |
| `AttackComboBox` | `AttackComboBox` | `ComboBox` | self=addOption("COMMAND TARGET") |
| `FollowComboBoxPopupMenu` | `FollowComboBoxPopupMenu` | `ComboBoxPopupMenu` |  |
| `FollowComboBoxPopupMenuButton` | `FollowComboBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | self=addOption("SERVER LEADER") |
| `FollowComboBox` | `FollowComboBox` | `ComboBox` | self=addOption("SERVER LEADER") |
| `onCastToggle` | `ComboTrigger` | `Panel` | size=450 72 |
| `commandsToggle` | `ComboActions` | `Panel` | size=220 100 |
| `Triggers` | `BotServer` | `Panel` | size=220 100 |
| `toolsButton` | `ComboWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `AttackComboBoxPopupMenu`

- **Klasa:** `AttackComboBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`

### `AttackComboBoxPopupMenuButton`

- **Klasa:** `AttackComboBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `self`: addOption("COMMAND TARGET")

### `AttackComboBox`

- **Klasa:** `AttackComboBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `self`: addOption("COMMAND TARGET")

### `FollowComboBoxPopupMenu`

- **Klasa:** `FollowComboBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`

### `FollowComboBoxPopupMenuButton`

- **Klasa:** `FollowComboBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `self`: addOption("SERVER LEADER")

### `FollowComboBox`

- **Klasa:** `FollowComboBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `self`: addOption("SERVER LEADER")

### `onCastToggle`

- **Klasa:** `ComboTrigger`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: onCastToggle
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 6
  - `padding`: 3
  - `size`: 450 72
  - `text`: Leader:
  - `margin-top`: 1
  - `margin-left`: 5
  - `color`: #ffaa00
  - `width`: 120
  - `font`: cipsoftFont

### `commandsToggle`

- **Klasa:** `ComboActions`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: commandsToggle
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 6
  - `padding`: 3
  - `size`: 220 100
  - `text`: Leader Commands
  - `margin-top`: 15
  - `margin-left`: 5
  - `height`: 15
  - `color`: #ffaa00
  - `width`: 145
  - `font`: cipsoftFont
  - `text-wrap`: true
  - `multiline`: true

### `Triggers`

- **Klasa:** `BotServer`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: Triggers
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 6
  - `padding`: 3
  - `size`: 220 100
  - `text`: Triggers
  - `height`: 30
  - `color`: #ffaa00
  - `margin-left`: 3
  - `margin-top`: 3
  - `margin-right`: 3
  - `font`: cipsoftFont
  - `text-wrap`: true
  - `multiline`: true

### `toolsButton`

- **Klasa:** `ComboWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: toolsButton
  - `margin-top`: 15
  - `margin-left`: 3
  - `text`: BotServer
  - `color`: #ff7700
  - `margin-bottom`: 8
  - `font`: cipsoftFont
  - `margin-right`: 10

## Hierarchy Diagram

Zobacz: [../diagrams/combo.mmd](../diagrams/combo.mmd)

---
doc_id: "otui-ui-25fc636714d9"
source_path: "game_bot/default_configs/vBot_4.8/vBot/HealBot.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: HealBot.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/HealBot.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/HealBot.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla HealBot.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `SettingCheckBox` | `SettingCheckBox` | `CheckBox` | text-wrap=true, text-auto-resize=true, margin-top=3 |
| `SpellSourceBoxPopupMenu` | `SpellSourceBoxPopupMenu` | `ComboBoxPopupMenu` |  |
| `SpellSourceBoxPopupMenuButton` | `SpellSourceBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | self=addOption("Burst Damage") |
| `SpellSourceBox` | `SpellSourceBox` | `ComboBox` | self=addOption("Burst Damage") |
| `SpellConditionBoxPopupMenu` | `SpellConditionBoxPopupMenu` | `ComboBoxPopupMenu` |  |
| `SpellConditionBoxPopupMenuButton` | `SpellConditionBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | self=addOption("Equal To") |
| `SpellConditionBox` | `SpellConditionBox` | `ComboBox` | self=addOption("Equal To") |
| `remove` | `SpellEntry` | `Label` | background-color=#00000055, text-offset=1 0, focusable=true |
| `remove` | `ItemEntry` | `Label` | size=15 15 |
| `MoveDown` | `SpellHealing` | `FlatPanel` | size=55 17 |
| `MoveDown` | `ItemHealing` | `FlatPanel` | size=55 17 |
| `items` | `HealerPanel` | `Panel` | size=510 275 |
| `ResetSettings` | `HealBotSettingsPanel` | `Panel` | size=500 267 |
| `settingsButton` | `HealWindow` | `MainWindow` | visible=false, size=45 21 |

## Widget Details

### `SettingCheckBox`

- **Klasa:** `SettingCheckBox`
- **Rodzic:** `CheckBox`
- **Właściwości:**
  - `text-wrap`: true
  - `text-auto-resize`: true
  - `margin-top`: 3
  - `font`: verdana-11px-rounded

### `SpellSourceBoxPopupMenu`

- **Klasa:** `SpellSourceBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`

### `SpellSourceBoxPopupMenuButton`

- **Klasa:** `SpellSourceBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `self`: addOption("Burst Damage")

### `SpellSourceBox`

- **Klasa:** `SpellSourceBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `self`: addOption("Burst Damage")

### `SpellConditionBoxPopupMenu`

- **Klasa:** `SpellConditionBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`

### `SpellConditionBoxPopupMenuButton`

- **Klasa:** `SpellConditionBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `self`: addOption("Equal To")

### `SpellConditionBox`

- **Klasa:** `SpellConditionBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `self`: addOption("Equal To")

### `remove`

- **Klasa:** `SpellEntry`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 1 0
  - `focusable`: true
  - `height`: 15
  - `font`: verdana-11px-rounded
  - `id`: remove
  - `width`: 15
  - `margin-top`: 2
  - `margin-left`: 3
  - `margin-right`: 15

### `remove`

- **Klasa:** `ItemEntry`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 1 0
  - `focusable`: false
  - `height`: 15
  - `font`: verdana-11px-rounded
  - `id`: remove
  - `width`: 15
  - `margin-top`: 2
  - `margin-left`: 3
  - `size`: 15 15
  - `margin-right`: 15

### `MoveDown`

- **Klasa:** `SpellHealing`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 55 17
  - `id`: MoveDown
  - `margin-left`: 7
  - `text`: Move Down
  - `color`: #269e26
  - `font`: cipsoftFont
  - `width`: 270
  - `margin-top`: 10
  - `marin-top`: 15
  - `padding`: 1
  - `padding-top`: 2
  - `margin-bottom`: 7
  - `vertical-scrollbar`: spellListScrollBar
  - `step`: 14
  - `pixels-scroll`: true
  - `margin-right`: 5

### `MoveDown`

- **Klasa:** `ItemHealing`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 55 17
  - `id`: MoveDown
  - `margin-left`: 8
  - `text`: Move Down
  - `color`: #ff4513
  - `font`: cipsoftFont
  - `margin-right`: 5
  - `width`: 270
  - `margin-top`: 10
  - `marin-top`: 15
  - `padding`: 1
  - `padding-top`: 2
  - `margin-bottom`: 7
  - `vertical-scrollbar`: itemListScrollBar
  - `step`: 14
  - `pixels-scroll`: true

### `items`

- **Klasa:** `HealerPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 510 275
  - `id`: items
  - `margin-top`: 10

### `ResetSettings`

- **Klasa:** `HealBotSettingsPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 500 267
  - `padding-top`: 6
  - `id`: ResetSettings
  - `margin-right`: 8
  - `padding-left`: 6
  - `padding-right`: 6
  - `type`: verticalBox
  - `text`: Reset Current Profile
  - `text-align`: center
  - `font`: verdana-11px-rounded
  - `margin-top`: 3
  - `margin-left`: 8
  - `padding`: 8
  - `text-auto-resize`: true
  - `color`: #ff4513

### `settingsButton`

- **Klasa:** `HealWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: settingsButton
  - `margin-left`: 2
  - `text-align`: left
  - `font`: cipsoftFont
  - `color`: #aeaeae
  - `visible`: false
  - `margin-bottom`: 8
  - `margin-right`: 5

## Hierarchy Diagram

Zobacz: [../diagrams/HealBot.mmd](../diagrams/HealBot.mmd)

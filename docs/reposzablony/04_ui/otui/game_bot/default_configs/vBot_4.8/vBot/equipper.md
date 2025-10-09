---
doc_id: "otui-ui-56759bb1df46"
source_path: "game_bot/default_configs/vBot_4.8/vBot/equipper.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: equipper.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/equipper.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/equipper.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla equipper.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `SlotBotItem` | `SlotBotItem` | `BotItem` | border-width=1, image-source=/images/ui/item, border-color=#FF0000 |
| `remove` | `BossLabel` | `UIWidget` | background-color=#00000055, text-offset=0 1, focusable=true |
| `ConditionBoxPopupMenu` | `ConditionBoxPopupMenu` | `ComboBoxPopupMenu` |  |
| `ConditionBoxPopupMenuButton` | `ConditionBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | self=addOption("or") |
| `ConditionBox` | `ConditionBox` | `ComboBox` | self=addOption("or") |
| `PreButton` | `PreButton` | `PreviousButton` | background=#363636, height=15 |
| `NexButton` | `NexButton` | `NextButton` | background=#363636, height=15 |
| `text` | `CondidionLabel` | `FlatPanel` | padding=1, height=15, id=text |
| `visible` | `Rule` | `UIWidget` | background-color=#00000055, text-offset=18 2, focusable=true |
| `text` | `ConditionPanel` | `Panel` | height=58, id=text, margin-top=10 |
| `down` | `ListPanel` | `FlatPanel` | size=60 17 |
| `add` | `InputPanel` | `FlatPanel` | size=270 300 |
| `default` | `EQPanel` | `FlatPanel` | size=160 230 |
| `profileName` | `Profile` | `FlatPanel` | size=160 35 |
| `add` | `BossList` | `FlatPanel` | padding-left=10, padding-right=10, padding-bottom=10 |
| `bossList` | `EquipWindow` | `MainWindow` | visible=true, size=65 21 |

## Widget Details

### `SlotBotItem`

- **Klasa:** `SlotBotItem`
- **Rodzic:** `BotItem`
- **Właściwości:**
  - `border-width`: 1
  - `image-source`: /images/ui/item
  - `border-color`: #FF0000

### `remove`

- **Klasa:** `BossLabel`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 0 1
  - `focusable`: true
  - `height`: 14
  - `font`: verdana-11px-rounded
  - `text-align`: center
  - `id`: remove
  - `width`: 14
  - `margin-right`: 15
  - `tooltip`: Remove profile from the list.

### `ConditionBoxPopupMenu`

- **Klasa:** `ConditionBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`

### `ConditionBoxPopupMenuButton`

- **Klasa:** `ConditionBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `self`: addOption("or")

### `ConditionBox`

- **Klasa:** `ConditionBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `self`: addOption("or")

### `PreButton`

- **Klasa:** `PreButton`
- **Rodzic:** `PreviousButton`
- **Właściwości:**
  - `background`: #363636
  - `height`: 15

### `NexButton`

- **Klasa:** `NexButton`
- **Rodzic:** `NextButton`
- **Właściwości:**
  - `background`: #363636
  - `height`: 15

### `text`

- **Klasa:** `CondidionLabel`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 1
  - `height`: 15
  - `id`: text
  - `text-align`: center
  - `font`: verdana-11px-rounded
  - `background`: #363636

### `visible`

- **Klasa:** `Rule`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 18 2
  - `focusable`: true
  - `height`: 14
  - `text-align`: center
  - `font`: verdana-11px-rounded
  - `id`: visible
  - `width`: 14
  - `margin-top`: 2
  - `margin-left`: 3
  - `tooltip`: Items must be visible
  - `text`: V
  - `margin-right`: 3

### `text`

- **Klasa:** `ConditionPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 58
  - `id`: text
  - `margin-top`: 10
  - `margin-left`: 3
  - `margin-right`: 3
  - `width`: 200
  - `text-align`: center
  - `minimum`: 0
  - `maximum`: 100
  - `step`: 1
  - `focusable`: true

### `down`

- **Klasa:** `ListPanel`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 60 17
  - `padding-left`: 10
  - `padding-right`: 10
  - `padding-bottom`: 10
  - `id`: down
  - `text`: Move Down
  - `font`: cipsoftFont
  - `color`: #aeaeae
  - `margin-top`: 5
  - `margin-left`: 2
  - `text-align`: center
  - `margin-bottom`: 18
  - `vertical-scrollbar`: listScrollBar
  - `padding`: 2
  - `step`: 14
  - `pixels-scroll`: true
  - `tooltip`: Decrease priority of selected rule.
  - `margin-right`: 5

### `add`

- **Klasa:** `InputPanel`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 270 300
  - `padding-left`: 10
  - `padding-right`: 10
  - `padding-bottom`: 10
  - `id`: add
  - `text`: Add Rule
  - `font`: verdana-11px-rounded
  - `color`: #aeaeae
  - `margin-top`: 10
  - `text-align`: center
  - `width`: 50
  - `margin-bottom`: 10

### `default`

- **Klasa:** `EQPanel`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 160 230
  - `padding-left`: 10
  - `padding-right`: 10
  - `padding-bottom`: 10
  - `id`: default
  - `text`: Reset fields
  - `font`: verdana-11px-rounded
  - `color`: #03C04A
  - `image-source`: /images/game/slots/ammo
  - `margin-top`: 3
  - `margin-right`: 5
  - `margin-left`: 5
  - `tooltip`: Reset all fields to the blank state

### `profileName`

- **Klasa:** `Profile`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 160 35
  - `id`: profileName
  - `margin-left`: 10
  - `text`: Profile Name
  - `font`: verdana-11px-rounded
  - `margin`: 5

### `add`

- **Klasa:** `BossList`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding-left`: 10
  - `padding-right`: 10
  - `padding-bottom`: 10
  - `id`: add
  - `text`: Add Boss
  - `font`: verdana-11px-rounded
  - `color`: #FABD02
  - `margin-top`: 3
  - `margin-bottom`: 20
  - `vertical-scrollbar`: listScrollBar
  - `padding`: 2
  - `step`: 14
  - `pixels-scroll`: true
  - `height`: 21
  - `text-align`: center
  - `tooltip`: Creature with given name will be considered as boss.

### `bossList`

- **Klasa:** `EquipWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 65 21
  - `text`: Equipment Manager
  - `id`: bossList
  - `margin-bottom`: 8
  - `margin-left`: 5
  - `visible`: true
  - `margin-top`: 10
  - `font`: cipsoftFont

## Hierarchy Diagram

Zobacz: [../diagrams/equipper.mmd](../diagrams/equipper.mmd)

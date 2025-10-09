---
doc_id: "otui-ui-070129920b1c"
source_path: "game_bot/default_configs/vBot_4.8/vBot/AttackBot.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: AttackBot.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/AttackBot.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/AttackBot.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla AttackBot.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `remove` | `AttackEntry` | `UIWidget` | visible=false, size=12 12 |
| `name` | `AttackBotBotPanel` | `Panel` | size=17 17 |
| `description` | `CategoryLabel` | `Panel` | size=315 15 |
| `description` | `SourceLabel` | `Panel` | size=105 15 |
| `description` | `RangeLabel` | `Panel` | size=323 15 |
| `PreButton` | `PreButton` | `PreviousButton` | background=#363636, height=15 |
| `NexButton` | `NexButton` | `NextButton` | background=#363636, height=15 |
| `spellName` | `AttackBotPanel` | `Panel` | visible=false, size=40 19 |
| `AntiRsRange` | `SettingsPanel` | `Panel` | size=500 200 |
| `settings` | `AttackBotWindow` | `MainWindow` | visible=false, size=50 21 |

## Widget Details

### `remove`

- **Klasa:** `AttackEntry`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 35 1
  - `focusable`: false
  - `height`: 15
  - `font`: verdana-11px-rounded
  - `text-align`: left
  - `id`: remove
  - `width`: 15
  - `margin-top`: 2
  - `margin-left`: 1
  - `size`: 12 12
  - `visible`: false
  - `image-source`: /images/game/dangerous
  - `margin-right`: 15

### `name`

- **Klasa:** `AttackBotBotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 17
  - `id`: name
  - `text-align`: center
  - `width`: 130
  - `margin-left`: 4
  - `text`: Profile #1
  - `margin-right`: 2
  - `margin-top`: 4
  - `size`: 17 17
  - `background`: #292A2A

### `description`

- **Klasa:** `CategoryLabel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 315 15
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 5
  - `padding`: 1
  - `id`: description
  - `text-align`: center
  - `text`: Area Rune (avalanche, great fireball, etc)
  - `font`: verdana-11px-rounded
  - `background`: #363636

### `description`

- **Klasa:** `SourceLabel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 105 15
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 5
  - `padding`: 1
  - `id`: description
  - `text-align`: center
  - `text`: Monster Name
  - `font`: verdana-11px-rounded
  - `background`: #363636

### `description`

- **Klasa:** `RangeLabel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 323 15
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 5
  - `padding`: 1
  - `id`: description
  - `text-align`: center
  - `text`: 5 Sqm
  - `font`: verdana-11px-rounded
  - `background`: #363636

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

### `spellName`

- **Klasa:** `AttackBotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 40 19
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 5
  - `padding`: 5
  - `id`: spellName
  - `margin-top`: 7
  - `vertical-scrollbar`: entryListScrollBar
  - `step`: 100
  - `pixels-scroll`: true
  - `margin-left`: 5
  - `text`: spell name
  - `font`: cipsoftFont
  - `background`: #363636
  - `text-align`: center
  - `minimum`: 0
  - `maximum`: 999999
  - `editable`: true
  - `focusable`: true
  - `tooltip`: drag item here on press to open window
  - `value`: 0
  - `margin-right`: 5
  - `margin-bottom`: 2
  - `height`: 15
  - `visible`: false

### `AntiRsRange`

- **Klasa:** `SettingsPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 500 200
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 5
  - `padding`: 10
  - `margin-left`: 5
  - `margin-top`: 8
  - `margin-bottom`: 5
  - `text-align`: center
  - `font`: verdana-11px-rounded
  - `text`: Stop if Anti-RS player in range
  - `id`: AntiRsRange
  - `margin-right`: 20
  - `width`: 50
  - `height`: 18
  - `text-wrap`: true
  - `minimum`: 1
  - `maximum`: 10
  - `focusable`: true

### `settings`

- **Klasa:** `AttackBotWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 50 21
  - `padding`: 15
  - `text`: Settings
  - `id`: settings
  - `margin-top`: 10
  - `margin-left`: 3
  - `text-align`: left
  - `font`: cipsoftFont
  - `color`: #fe4400
  - `visible`: false
  - `margin-bottom`: 10

## Hierarchy Diagram

Zobacz: [../diagrams/AttackBot.mmd](../diagrams/AttackBot.mmd)

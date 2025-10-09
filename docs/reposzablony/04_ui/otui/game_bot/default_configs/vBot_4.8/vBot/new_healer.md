---
doc_id: "otui-ui-e9f001b3f2a4"
source_path: "game_bot/default_configs/vBot_4.8/vBot/new_healer.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: new_healer.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/new_healer.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/new_healer.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla new_healer.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `CategoryCheckBox` | `CategoryCheckBox` | `CheckBox` | font=verdana-11px-rounded, margin-top=3, color=#98BF64 |
| `scroll` | `HealScroll` | `Panel` | id=scroll, text-align=center, text=test |
| `text` | `HealItem` | `Panel` | size=34 34 |
| `ToolTipLabel` | `ToolTipLabel` | `UIWidget` | font=verdana-11px-rounded, color=#dfdfdf, height=14 |
| `remove` | `HealerPlayerEntry` | `Label` | size=15 15 |
| `decrement` | `PriorityEntry` | `ToolTipLabel` | size=14 14 |
| `vocations` | `TargetSettings` | `Panel` | size=280 125 |
| `botserver` | `Groups` | `FlatPanel` | size=150 90 |
| `sorcerers` | `Vocations` | `FlatPanel` | size=100 90 |
| `list` | `Priority` | `Panel` | size=190 123 |
| `add` | `AddPlayer` | `FlatPanel` | padding=5, font=verdana-11px-rounded, text=Add Player |
| `listScrollBar` | `PlayerList` | `Panel` | id=listScrollBar, fit-children=true, padding-top=2 |
| `playerList` | `CustomList` | `Panel` | size=190 172 |
| `box` | `Conditions` | `Panel` | size=280 170 |
| `closeButton` | `FriendHealer` | `MainWindow` | size=45 21 |

## Widget Details

### `CategoryCheckBox`

- **Klasa:** `CategoryCheckBox`
- **Rodzic:** `CheckBox`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `margin-top`: 3
  - `color`: #98BF64

### `scroll`

- **Klasa:** `HealScroll`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: scroll
  - `text-align`: center
  - `text`: test
  - `margin-top`: 3
  - `minimum`: 0
  - `maximum`: 100
  - `step`: 1

### `text`

- **Klasa:** `HealItem`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: text
  - `size`: 34 34
  - `margin-left`: 8
  - `text-wrap`: true
  - `text-align`: left

### `ToolTipLabel`

- **Klasa:** `ToolTipLabel`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `color`: #dfdfdf
  - `height`: 14
  - `text-align`: center

### `remove`

- **Klasa:** `HealerPlayerEntry`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 5 1
  - `focusable`: true
  - `height`: 16
  - `font`: verdana-11px-rounded
  - `text-align`: left
  - `id`: remove
  - `margin-right`: 15
  - `size`: 15 15
  - `text`: X
  - `tooltip`: Remove player from the list

### `decrement`

- **Klasa:** `PriorityEntry`
- **Rodzic:** `ToolTipLabel`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 18 1
  - `focusable`: true
  - `height`: 16
  - `font`: verdana-11px-rounded
  - `text-align`: left
  - `id`: decrement
  - `size`: 14 14
  - `margin-top`: 2
  - `margin-left`: 3
  - `margin-right`: 2
  - `text`: -
  - `tooltip`: Decrease Priority

### `vocations`

- **Klasa:** `TargetSettings`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 280 125
  - `padding`: 3
  - `image-source`: /images/ui/window
  - `image-border`: 6
  - `font`: verdana-11px-rounded
  - `text`: Heal Target Settings
  - `id`: vocations
  - `margin-top`: 8
  - `margin-left`: 5

### `botserver`

- **Klasa:** `Groups`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 150 90
  - `padding`: 2
  - `padding-top`: 5
  - `id`: botserver
  - `text`: BotServer Members
  - `tooltip`: Players added in custom list will always be in scope
  - `margin-top`: 2
  - `type`: verticalBox

### `sorcerers`

- **Klasa:** `Vocations`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 100 90
  - `padding`: 2
  - `padding-top`: 5
  - `id`: sorcerers
  - `font`: verdana-11px-rounded
  - `text`: Sorcerers
  - `margin-top`: 2
  - `type`: verticalBox

### `list`

- **Klasa:** `Priority`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 190 123
  - `padding`: 6
  - `padding-top`: 1
  - `image-source`: /images/ui/window
  - `image-border`: 6
  - `id`: list
  - `font`: verdana-11px-rounded
  - `text`: Priority & Toggles
  - `margin-top`: 3
  - `fit-children`: true

### `add`

- **Klasa:** `AddPlayer`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 5
  - `font`: verdana-11px-rounded
  - `text`: Add Player
  - `text-align`: center
  - `text-wrap`: true
  - `margin-top`: 5
  - `id`: add
  - `width`: 50
  - `minimum`: 1
  - `maximum`: 99
  - `step`: 1
  - `focusable`: true
  - `margin-left`: 3

### `listScrollBar`

- **Klasa:** `PlayerList`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: listScrollBar
  - `fit-children`: true
  - `padding-top`: 2
  - `vertical-scrollbar`: listScrollBar
  - `step`: 14
  - `pixels-scroll`: true

### `playerList`

- **Klasa:** `CustomList`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 190 172
  - `padding`: 6
  - `padding-top`: 3
  - `image-source`: /images/ui/window
  - `image-border`: 6
  - `font`: verdana-11px-rounded
  - `text`: Custom Player List
  - `tooltip`: Double click on the list below to add new player.
  - `id`: playerList
  - `margin-top`: 3

### `box`

- **Klasa:** `Conditions`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 280 170
  - `padding`: 5
  - `image-source`: /images/ui/window
  - `image-border`: 6
  - `font`: verdana-11px-rounded
  - `text`: Player Conditions
  - `id`: box
  - `margin-top`: 16
  - `padding-top`: 3
  - `type`: grid
  - `cell-size`: 128 31
  - `cell-spacing`: 5
  - `num-columns`: 2

### `closeButton`

- **Klasa:** `FriendHealer`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `padding-top`: 30
  - `id`: closeButton
  - `margin-top`: 10
  - `margin-bottom`: 8
  - `font`: cipsoftFont

## Hierarchy Diagram

Zobacz: [../diagrams/new_healer.mmd](../diagrams/new_healer.mmd)

---
doc_id: "otui-ui-1d0b4d8c0f9f"
source_path: "game_bot/default_configs/vBot_4.7/vBot/playerlist.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: playerlist.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.7/vBot/playerlist.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.7/vBot/playerlist.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla playerlist.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `remove` | `PlayerLabel` | `UIWidget` | background-color=#00000055, text-offset=0 1, focusable=true |
| `SettingCheckBox` | `SettingCheckBox` | `CheckBox` | text-wrap=true, text-auto-resize=true, margin-top=3 |
| `AutoAdd` | `Settings` | `FlatPanel` | padding=6, type=verticalBox, text=Automatically add killed players while cave botting to blacklist. |
| `add` | `tPanel` | `Panel` | margin=3, padding=3, id=add |
| `closeButton` | `PlayerListWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `remove`

- **Klasa:** `PlayerLabel`
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

### `SettingCheckBox`

- **Klasa:** `SettingCheckBox`
- **Rodzic:** `CheckBox`
- **Właściwości:**
  - `text-wrap`: true
  - `text-auto-resize`: true
  - `margin-top`: 3
  - `font`: verdana-11px-rounded

### `AutoAdd`

- **Klasa:** `Settings`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 6
  - `type`: verticalBox
  - `text`: Automatically add killed players while cave botting to blacklist.
  - `text-align`: center
  - `font`: verdana-11px-rounded
  - `id`: AutoAdd
  - `margin-top`: 6

### `add`

- **Klasa:** `tPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `margin`: 3
  - `padding`: 3
  - `id`: add
  - `height`: 200
  - `vertical-scrollbar`: listScrollBar
  - `step`: 14
  - `pixels-scroll`: true
  - `margin-top`: 3
  - `text`: Add Player
  - `font`: verdana-11px-rounded

### `closeButton`

- **Klasa:** `PlayerListWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: closeButton
  - `width`: 180
  - `margin-bottom`: 8
  - `margin`: 3
  - `margin-left`: 6
  - `font`: cipsoftFont
  - `margin-top`: 15
  - `margin-right`: 5

## Hierarchy Diagram

Zobacz: [../diagrams/playerlist.mmd](../diagrams/playerlist.mmd)

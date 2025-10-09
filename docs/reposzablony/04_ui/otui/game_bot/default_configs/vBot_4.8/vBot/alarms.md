---
doc_id: "otui-ui-079d9ffe26b2"
source_path: "game_bot/default_configs/vBot_4.8/vBot/alarms.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: alarms.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/alarms.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/alarms.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla alarms.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `tick` | `AlarmCheckBox` | `Panel` | height=20, margin-top=4, id=tick |
| `value` | `AlarmCheckBoxAndSpinBox` | `Panel` | height=20, margin-top=1, id=value |
| `text` | `AlarmCheckBoxAndTextEdit` | `Panel` | height=20, margin-top=1, id=text |
| `closeButton` | `AlarmsWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `tick`

- **Klasa:** `AlarmCheckBox`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 4
  - `id`: tick
  - `font`: verdana-11px-rounded
  - `text`: Player Attack
  - `text-offset`: 17 -3

### `value`

- **Klasa:** `AlarmCheckBoxAndSpinBox`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 1
  - `id`: value
  - `font`: verdana-11px-rounded
  - `text`: Player Attack
  - `text-offset`: 17 -3
  - `margin-bottom`: 1
  - `width`: 40
  - `minimum`: 0
  - `maximum`: 100
  - `step`: 1
  - `editable`: true
  - `focusable`: true

### `text`

- **Klasa:** `AlarmCheckBoxAndTextEdit`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 1
  - `id`: text
  - `font`: terminus-10px
  - `text`: Creature Name
  - `text-offset`: 17 -3
  - `width`: 150
  - `margin-bottom`: 1

### `closeButton`

- **Klasa:** `AlarmsWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `padding`: 5
  - `id`: closeButton
  - `margin-bottom`: 8
  - `margin-top`: 10
  - `layout`: verticalBox
  - `padding-top`: 5
  - `padding-left`: 10
  - `type`: verticalBox
  - `fit-children`: true
  - `margin-left`: 3
  - `width`: 200
  - `text`: Active Alarms
  - `font`: cipsoftFont
  - `color`: #9f5031
  - `height`: 3
  - `minimum`: 260
  - `maximum`: 600
  - `margin-right`: 5
  - `background`: #ffffff88

## Hierarchy Diagram

Zobacz: [../diagrams/alarms.mmd](../diagrams/alarms.mmd)

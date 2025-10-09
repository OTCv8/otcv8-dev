---
doc_id: "otui-ui-52fb25f6ede1"
source_path: "game_bot/default_configs/vBot_4.8/vBot/supplies.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: supplies.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/supplies.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/supplies.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla supplies.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `remove` | `ProfileLabel` | `UIWidget` | background-color=#00000055, text-offset=0 1, focusable=true |
| `SupplySpinBox` | `SupplySpinBox` | `SpinBox` | height=20, margin-left=3, width=75 |
| `avg` | `ItemPanel` | `Panel` | height=38, id=avg, width=55 |
| `decrement` | `SuppliesWindow` | `MainWindow` | visible=false, size=45 21 |

## Widget Details

### `remove`

- **Klasa:** `ProfileLabel`
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
  - `margin-right`: 3
  - `tooltip`: Remove profile from the list.

### `SupplySpinBox`

- **Klasa:** `SupplySpinBox`
- **Rodzic:** `SpinBox`
- **Właściwości:**
  - `height`: 20
  - `margin-left`: 3
  - `width`: 75
  - `minimum`: 0
  - `maximum`: 9999
  - `text-align`: center
  - `focusable`: true
  - `text`: 0

### `avg`

- **Klasa:** `ItemPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 38
  - `id`: avg
  - `width`: 55
  - `text-align`: center
  - `font`: verdana-11px-rounded
  - `text`: AVG
  - `tooltip`: Amount of given supplies to purchase

### `decrement`

- **Klasa:** `SuppliesWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: decrement
  - `margin-right`: 3
  - `margin-bottom`: 8
  - `margin-left`: 10
  - `visible`: false
  - `margin-top`: 15
  - `text-align`: center
  - `text`: -
  - `tooltip`: decrease all max supplies amount by average
  - `height`: 20
  - `font`: cipsoftFont
  - `step`: 14
  - `pixels-scroll`: true
  - `vertical-scrollbar`: itemsScrollBar
  - `layout`: verticalBox
  - `width`: 50

## Hierarchy Diagram

Zobacz: [../diagrams/supplies.mmd](../diagrams/supplies.mmd)

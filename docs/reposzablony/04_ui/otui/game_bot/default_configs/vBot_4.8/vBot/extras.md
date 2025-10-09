---
doc_id: "otui-ui-40735c04d80f"
source_path: "game_bot/default_configs/vBot_4.8/vBot/extras.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: extras.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/extras.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/extras.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla extras.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `scroll` | `ExtrasScrollBar` | `Panel` | height=28, margin-top=3, id=scroll |
| `textEdit` | `ExtrasTextEdit` | `Panel` | height=40, margin-top=5, id=textEdit |
| `item` | `ExtrasItem` | `Panel` | height=34, margin-top=7, margin-left=25 |
| `ExtrasCheckBox` | `ExtrasCheckBox` | `BotSwitch` | height=20, margin-top=7 |
| `closeButton` | `ExtrasWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `scroll`

- **Klasa:** `ExtrasScrollBar`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 28
  - `margin-top`: 3
  - `id`: scroll
  - `text-align`: center
  - `minimum`: 0
  - `maximum`: 10
  - `step`: 1

### `textEdit`

- **Klasa:** `ExtrasTextEdit`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 40
  - `margin-top`: 5
  - `id`: textEdit
  - `text-align`: center
  - `minimum`: 0
  - `maximum`: 10
  - `step`: 1

### `item`

- **Klasa:** `ExtrasItem`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 34
  - `margin-top`: 7
  - `margin-left`: 25
  - `margin-right`: 25
  - `id`: item

### `ExtrasCheckBox`

- **Klasa:** `ExtrasCheckBox`
- **Rodzic:** `BotSwitch`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 7

### `closeButton`

- **Klasa:** `ExtrasWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `padding`: 25
  - `text-align`: center
  - `text`: < Miscellaneous >
  - `id`: closeButton
  - `margin-top`: 5
  - `step`: 28
  - `pixels-scroll`: true
  - `margin-right`: 5
  - `margin-bottom`: 8
  - `vertical-scrollbar`: contentScroll
  - `margin-left`: 3
  - `type`: verticalBox
  - `fit-children`: true
  - `height`: 3
  - `minimum`: 260
  - `maximum`: 600
  - `background`: #ffffff88
  - `font`: cipsoftFont

## Hierarchy Diagram

Zobacz: [../diagrams/extras.mmd](../diagrams/extras.mmd)

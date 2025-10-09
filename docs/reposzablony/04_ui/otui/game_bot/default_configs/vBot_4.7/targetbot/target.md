---
doc_id: "otui-ui-2575429f0ff3"
source_path: "game_bot/default_configs/vBot_4.7/targetbot/target.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: target.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.7/targetbot/target.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.7/targetbot/target.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla target.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `TargetBotEntry` | `TargetBotEntry` | `Label` | background-color=#00000055, text-offset=2 0, focusable=true |
| `right` | `TargetBotDualLabel` | `Panel` | height=18, margin-left=3, margin-right=4 |
| `debug` | `TargetBotPanel` | `Panel` | visible=false |

## Widget Details

### `TargetBotEntry`

- **Klasa:** `TargetBotEntry`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 2 0
  - `focusable`: true

### `right`

- **Klasa:** `TargetBotDualLabel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 18
  - `margin-left`: 3
  - `margin-right`: 4
  - `id`: right
  - `text-auto-resize`: true

### `debug`

- **Klasa:** `TargetBotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `type`: verticalBox
  - `fit-children`: true
  - `margin-top`: 2
  - `margin-bottom`: 5
  - `id`: debug
  - `height`: 20
  - `vertical-scrollbar`: listScrollbar
  - `margin-right`: 15
  - `focusable`: false
  - `auto-focus`: first
  - `pixels-scroll`: true
  - `step`: 10
  - `self`: getParent().editor:setVisible(self:isOn())
  - `text`: Show target priority
  - `visible`: false
  - `width`: 56

## Hierarchy Diagram

Zobacz: [../diagrams/target.mmd](../diagrams/target.mmd)

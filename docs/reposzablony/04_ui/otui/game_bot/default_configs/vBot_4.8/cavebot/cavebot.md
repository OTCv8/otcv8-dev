---
doc_id: "otui-ui-a1e5bb711f4e"
source_path: "game_bot/default_configs/vBot_4.8/cavebot/cavebot.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: cavebot.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/cavebot/cavebot.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/cavebot/cavebot.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla cavebot.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `CaveBotAction` | `CaveBotAction` | `Label` | background-color=#00000055, text-offset=2 0, focusable=true |
| `showConfig` | `CaveBotPanel` | `Panel` | type=verticalBox, fit-children=true, margin-top=2 |

## Widget Details

### `CaveBotAction`

- **Klasa:** `CaveBotAction`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 2 0
  - `focusable`: true

### `showConfig`

- **Klasa:** `CaveBotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `type`: verticalBox
  - `fit-children`: true
  - `margin-top`: 2
  - `margin-bottom`: 5
  - `id`: showConfig
  - `height`: 100
  - `vertical-scrollbar`: listScrollbar
  - `margin-right`: 15
  - `focusable`: false
  - `auto-focus`: first
  - `pixels-scroll`: true
  - `step`: 10
  - `text`: Show config

## Hierarchy Diagram

Zobacz: [../diagrams/cavebot.mmd](../diagrams/cavebot.mmd)

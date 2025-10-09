---
doc_id: "otui-ui-5525992e81de"
source_path: "game_npctrade/npctrade.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: npctrade.otui"
summary: "Dokumentacja interfejsu OTUI dla game_npctrade/npctrade.otui"
tags: ["otui", "ui", "widget"]
---

# game_npctrade/npctrade.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla npctrade.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `NPCOfferLabel` | `NPCOfferLabel` | `Label` | margin-left=5, text-auto-resize=true |
| `tradeButton` | `NPCItemBox` | `UICheckBox` | visible=false, enabled=false, size=550 360 |

## Widget Details

### `NPCOfferLabel`

- **Klasa:** `NPCOfferLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `margin-left`: 5
  - `text-auto-resize`: true

### `tradeButton`

- **Klasa:** `NPCItemBox`
- **Rodzic:** `UICheckBox`
- **Właściwości:**
  - `border-width`: 1
  - `border-color`: #000000
  - `color`: #aaaaaa88
  - `text-align`: center
  - `text-offset`: 0 30
  - `id`: tradeButton
  - `phantom`: true
  - `image-color`: #ffffff88
  - `margin-top`: 3
  - `size`: 550 360
  - `checked`: true
  - `on`: true
  - `height`: 80
  - `step`: 1
  - `pixels-scroll`: true
  - `vertical-scrollbar`: itemsPanelListScrollBar
  - `margin-left`: 5
  - `margin-right`: 10
  - `type`: grid
  - `cell-size`: 160 90
  - `flow`: true
  - `auto-spacing`: true
  - `enabled`: false
  - `width`: 64
  - `show-value`: true
  - `minimum`: 1
  - `maximum`: 100
  - `text-auto-resize`: true
  - `visible`: false

## Hierarchy Diagram

Zobacz: [../diagrams/npctrade.mmd](../diagrams/npctrade.mmd)

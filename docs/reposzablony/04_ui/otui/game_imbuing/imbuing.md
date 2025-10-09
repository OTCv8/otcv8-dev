---
doc_id: "otui-ui-3f694d30920c"
source_path: "game_imbuing/imbuing.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: imbuing.otui"
summary: "Dokumentacja interfejsu OTUI dla game_imbuing/imbuing.otui"
tags: ["otui", "ui", "widget"]
---

# game_imbuing/imbuing.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla imbuing.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `Slot` | `Slot` | `Button` | enabled=false |
| `count` | `RequiredItem` | `Panel` | width=66, height=66, id=count |
| `selectSlot` | `ItemInformation` | `Panel` | height=66, border=1 black, padding=5 |
| `cost` | `EmptyImbue` | `Panel` | height=66, border=1 black, padding=5 |
| `balance` | `ClearImbue` | `Panel` | enabled=false, size=550 430 |

## Widget Details

### `Slot`

- **Klasa:** `Slot`
- **Rodzic:** `Button`
- **Właściwości:**
  - `width`: 70
  - `height`: 66
  - `enabled`: false
  - `text-wrap`: true

### `count`

- **Klasa:** `RequiredItem`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `width`: 66
  - `height`: 66
  - `id`: count
  - `margin-top`: 5
  - `text-align`: center

### `selectSlot`

- **Klasa:** `ItemInformation`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 66
  - `border`: 1 black
  - `padding`: 5
  - `id`: selectSlot
  - `text-align`: center
  - `margin-left`: 10
  - `margin-top`: 5
  - `width`: 240
  - `margin-right`: 15

### `cost`

- **Klasa:** `EmptyImbue`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 66
  - `border`: 1 black
  - `padding`: 5
  - `id`: cost
  - `text-align`: center
  - `margin-right`: 15
  - `margin-top`: 5
  - `isdisabled`: true
  - `margin-left`: 15
  - `width`: 128
  - `image-source`: /images/game/imbuing/imbue_empty
  - `image-clip`: 0 66 128 66
  - `image-rect`: 0 0 12 21
  - `phantom`: false

### `balance`

- **Klasa:** `ClearImbue`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 25
  - `border`: 1 black
  - `padding`: 5
  - `id`: balance
  - `text-align`: center
  - `margin-right`: 3
  - `margin-top`: 5
  - `enabled`: false
  - `margin-left`: 15
  - `width`: 50
  - `size`: 550 430
  - `margin-bottom`: 20
  - `image-source`: /images/game/imbuing/clear
  - `image-clip`: 0 66 128 66
  - `background-color`: #AAAAAA

## Hierarchy Diagram

Zobacz: [../diagrams/imbuing.mmd](../diagrams/imbuing.mmd)

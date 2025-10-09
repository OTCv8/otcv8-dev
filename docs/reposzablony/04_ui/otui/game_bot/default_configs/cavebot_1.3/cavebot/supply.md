---
doc_id: "otui-ui-bc0bc885201b"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/supply.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: supply.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/cavebot_1.3/cavebot/supply.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/supply.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla supply.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `max` | `SupplyItem` | `Panel` | size=32 32 |
| `scroll` | `SupplyItemList` | `Panel` | height=102, id=scroll, vertical-scrollbar=scroll |

## Widget Details

### `max`

- **Klasa:** `SupplyItem`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 34
  - `id`: max
  - `size`: 32 32
  - `margin-top`: 1
  - `margin-left`: 2
  - `margin-right`: 2
  - `text-align`: center
  - `text`: 100

### `scroll`

- **Klasa:** `SupplyItemList`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 102
  - `id`: scroll
  - `vertical-scrollbar`: scroll
  - `margin-right`: 7
  - `type`: verticalBox
  - `cell-height`: 34
  - `step`: 10
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/supply.mmd](../diagrams/supply.mmd)

---
doc_id: "otui-ui-5bd39ec86914"
source_path: "game_bot/default_configs/cavebot_1.3/cavebot/config.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: config.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/cavebot_1.3/cavebot/config.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/cavebot_1.3/cavebot/config.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla config.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `cavebotEditor` | `CaveBotConfigPanel` | `Panel` | visible=false |
| `title` | `CaveBotConfigNumberValuePanel` | `Panel` | height=20, margin-top=5, id=title |
| `title` | `CaveBotConfigBooleanValuePanel` | `Panel` | height=20, margin-top=5, id=title |

## Widget Details

### `cavebotEditor`

- **Klasa:** `CaveBotConfigPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: cavebotEditor
  - `visible`: false
  - `type`: verticalBox
  - `fit-children`: true
  - `margin-top`: 5
  - `text-align`: center
  - `text`: CaveBot Config

### `title`

- **Klasa:** `CaveBotConfigNumberValuePanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 5
  - `id`: title
  - `margin-right`: 5
  - `width`: 50
  - `margin-left`: 5

### `title`

- **Klasa:** `CaveBotConfigBooleanValuePanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 5
  - `id`: title
  - `margin-right`: 5
  - `width`: 50
  - `text`: Off
  - `margin-left`: 5

## Hierarchy Diagram

Zobacz: [../diagrams/config.mmd](../diagrams/config.mmd)

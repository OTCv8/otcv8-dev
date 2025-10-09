---
doc_id: "otui-ui-64e2dab53874"
source_path: "game_bot/default_configs/vBot_4.7/vBot/BotServer.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: BotServer.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.7/vBot/BotServer.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.7/vBot/BotServer.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla BotServer.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `Members` | `BotServerData` | `Panel` | size=80 21 |
| `Broadcast` | `FeaturePanel` | `Panel` | size=340 150 |
| `closeButton` | `BotServerWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `Members`

- **Klasa:** `BotServerData`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 80 21
  - `image-source`: /images/ui/window
  - `image-border`: 6
  - `padding`: 3
  - `id`: Members
  - `text-align`: center
  - `margin-top`: 20
  - `text`: Members:
  - `margin-left`: 10
  - `width`: 150
  - `margin-right`: 8
  - `margin-bottom`: 4

### `Broadcast`

- **Klasa:** `FeaturePanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 340 150
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 5
  - `padding`: 3
  - `id`: Broadcast
  - `text-align`: center
  - `text`: Broadcast
  - `margin-top`: 3
  - `margin-left`: 3
  - `margin-bottom`: 3
  - `margin-right`: 3
  - `height`: 22

### `closeButton`

- **Klasa:** `BotServerWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: closeButton
  - `margin-top`: 15
  - `margin-bottom`: 8
  - `font`: cipsoftFont
  - `margin-right`: 5

## Hierarchy Diagram

Zobacz: [../diagrams/BotServer.mmd](../diagrams/BotServer.mmd)

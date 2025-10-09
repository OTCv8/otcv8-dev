---
doc_id: "otui-ui-3a743a2adca3"
source_path: "game_bot/default_configs/vBot_4.8/vBot/siolist.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: siolist.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/siolist.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/siolist.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla siolist.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `RP` | `VocationPanel` | `Panel` | size=190 55 |
| `closeButton` | `SioListWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `RP`

- **Klasa:** `VocationPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `padding`: 3
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 6
  - `size`: 190 55
  - `text-align`: center
  - `text`: Paladins
  - `id`: RP

### `closeButton`

- **Klasa:** `SioListWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: closeButton
  - `text`: Max Distance
  - `margin-right`: 5
  - `margin-left`: 2
  - `margin-top`: 15
  - `text-align`: center
  - `minimum`: 1
  - `maximum`: 100
  - `step`: 1
  - `margin-bottom`: 8
  - `font`: cipsoftFont

## Hierarchy Diagram

Zobacz: [../diagrams/siolist.mmd](../diagrams/siolist.mmd)

---
doc_id: "otui-ui-ede19e9b2263"
source_path: "game_minimap/flagwindow.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: flagwindow.otui"
summary: "Dokumentacja interfejsu OTUI dla game_minimap/flagwindow.otui"
tags: ["otui", "ui", "widget"]
---

# game_minimap/flagwindow.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla flagwindow.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `FlagButton` | `FlagButton` | `CheckBox` | size=15 15 |
| `cancelButton` | `FlagWindow` | `MainWindow` | size=196 185 |

## Widget Details

### `FlagButton`

- **Klasa:** `FlagButton`
- **Rodzic:** `CheckBox`
- **Właściwości:**
  - `size`: 15 15
  - `margin-left`: 2
  - `image-source`: /images/game/minimap/flagcheckbox
  - `image-size`: 15 15
  - `image-border`: 3
  - `icon-source`: /images/game/minimap/mapflags
  - `icon-size`: 11 11
  - `icon-clip`: 0 0 11 11
  - `icon-offset`: 2 4
  - `image-clip`: 52 0 26 26

### `cancelButton`

- **Klasa:** `FlagWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `id`: cancelButton
  - `size`: 196 185
  - `text-auto-resize`: true
  - `margin-top`: 6
  - `width`: 64
  - `margin-left`: 0
  - `icon-clip`: 99 11 11 11
  - `margin-right`: 10

## Hierarchy Diagram

Zobacz: [../diagrams/flagwindow.mmd](../diagrams/flagwindow.mmd)

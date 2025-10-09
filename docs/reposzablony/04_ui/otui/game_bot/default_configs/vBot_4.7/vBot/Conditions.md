---
doc_id: "otui-ui-984595f09fda"
source_path: "game_bot/default_configs/vBot_4.7/vBot/Conditions.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: Conditions.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.7/vBot/Conditions.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.7/vBot/Conditions.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla Conditions.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `UturaComboBoxPopupMenu` | `UturaComboBoxPopupMenu` | `ComboBoxPopupMenu` |  |
| `UturaComboBoxPopupMenuButton` | `UturaComboBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | self=addOption("Utura Gran") |
| `UturaComboBox` | `UturaComboBox` | `ComboBox` | self=addOption("Utura Gran") |
| `ParalyseSpell` | `CureConditions` | `Panel` | size=200 190 |
| `StopHaste` | `HoldConditions` | `Panel` | size=200 190 |
| `closeButton` | `ConditionsWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `UturaComboBoxPopupMenu`

- **Klasa:** `UturaComboBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`

### `UturaComboBoxPopupMenuButton`

- **Klasa:** `UturaComboBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `self`: addOption("Utura Gran")

### `UturaComboBox`

- **Klasa:** `UturaComboBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `self`: addOption("Utura Gran")

### `ParalyseSpell`

- **Klasa:** `CureConditions`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: ParalyseSpell
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 6
  - `padding`: 3
  - `size`: 200 190
  - `margin-top`: 10
  - `margin-left`: 10
  - `text`: Spell:
  - `color`: #ffaa00
  - `font`: verdana-11px-rounded
  - `width`: 100
  - `margin-right`: 10

### `StopHaste`

- **Klasa:** `HoldConditions`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: StopHaste
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 6
  - `padding`: 3
  - `size`: 200 190
  - `margin-top`: 3
  - `margin-left`: 5
  - `text`: Stop Haste if TargetBot Is Active
  - `color`: #ffaa00
  - `font`: cipsoftFont
  - `width`: 100
  - `margin-right`: 10

### `closeButton`

- **Klasa:** `ConditionsWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: closeButton
  - `margin-top`: 15
  - `text`: Hold Conditions
  - `color`: #88e3dd
  - `margin-left`: 10
  - `font`: cipsoftFont
  - `margin-right`: 5
  - `margin-bottom`: 8

## Hierarchy Diagram

Zobacz: [../diagrams/Conditions.mmd](../diagrams/Conditions.mmd)

---
doc_id: "otui-ui-6a73a077fa37"
source_path: "game_market/ui/general/marketcombobox.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: marketcombobox.otui"
summary: "Dokumentacja interfejsu OTUI dla game_market/ui/general/marketcombobox.otui"
tags: ["otui", "ui", "widget"]
---

# game_market/ui/general/marketcombobox.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla marketcombobox.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `MarketComboBoxPopupMenuButton` | `MarketComboBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | height=18, font=verdana-11px-rounded, text-offset=2 2 |
| `MarketComboBoxPopupMenuSeparator` | `MarketComboBoxPopupMenuSeparator` | `UIWidget` | image-source=/images/combobox_rounded, image-repeated=true, image-clip=1 59 89 1 |
| `MarketComboBoxPopupMenu` | `MarketComboBoxPopupMenu` | `ComboBoxPopupMenu` | size=86 20 |
| `MarketComboBox` | `MarketComboBox` | `ComboBox` | size=86 20 |

## Widget Details

### `MarketComboBoxPopupMenuButton`

- **Klasa:** `MarketComboBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `height`: 18
  - `font`: verdana-11px-rounded
  - `text-offset`: 2 2

### `MarketComboBoxPopupMenuSeparator`

- **Klasa:** `MarketComboBoxPopupMenuSeparator`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `image-source`: /images/combobox_rounded
  - `image-repeated`: true
  - `image-clip`: 1 59 89 1
  - `height`: 1
  - `phantom`: true

### `MarketComboBoxPopupMenu`

- **Klasa:** `MarketComboBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `size`: 86 20
  - `text-offset`: 3 2

### `MarketComboBox`

- **Klasa:** `MarketComboBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `size`: 86 20
  - `text-offset`: 3 2

## Hierarchy Diagram

Zobacz: [../diagrams/marketcombobox.mmd](../diagrams/marketcombobox.mmd)

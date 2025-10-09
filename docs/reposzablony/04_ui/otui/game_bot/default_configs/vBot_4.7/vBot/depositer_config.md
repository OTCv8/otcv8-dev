---
doc_id: "otui-ui-07c63b464933"
source_path: "game_bot/default_configs/vBot_4.7/vBot/depositer_config.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: depositer_config.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.7/vBot/depositer_config.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.7/vBot/depositer_config.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla depositer_config.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `slot` | `StashItem` | `Panel` | height=40, id=slot, margin-top=3 |
| `CloseButton` | `DepositerPanel` | `MainWindow` | visible=false, size=45 21 |

## Widget Details

### `slot`

- **Klasa:** `StashItem`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 40
  - `id`: slot
  - `margin-top`: 3
  - `margin-left`: 5
  - `text-align`: left
  - `text`: Add item to select locker.
  - `font`: verdana-11px-rounded
  - `color`: #CCCCCC

### `CloseButton`

- **Klasa:** `DepositerPanel`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `size`: 45 21
  - `id`: CloseButton
  - `text`: Double click here to add item.
  - `text-align`: left
  - `font`: cipsoftFont
  - `color`: #aeaeae
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 1
  - `margin-top`: 5
  - `margin-bottom`: 8
  - `padding`: 2
  - `padding-left`: 4
  - `vertical-scrollbar`: DepositerScrollBar
  - `type`: verticalBox
  - `step`: 14
  - `pixels-scroll`: true
  - `visible`: false
  - `height`: 3
  - `minimum`: 180
  - `maximum`: 800
  - `margin-left`: 3
  - `margin-right`: 5
  - `background`: #ffffff88

## Hierarchy Diagram

Zobacz: [../diagrams/depositer_config.mmd](../diagrams/depositer_config.mmd)

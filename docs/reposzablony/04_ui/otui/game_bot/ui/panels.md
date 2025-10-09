---
doc_id: "otui-ui-f3bbf32ed645"
source_path: "game_bot/ui/panels.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: panels.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/ui/panels.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/ui/panels.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla panels.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `text` | `DualScrollPanel` | `Panel` | height=51, margin-top=3, id=text |
| `scroll` | `SingleScrollItemPanel` | `Panel` | height=45, margin-top=2, id=scroll |
| `scroll2` | `DualScrollItemPanel` | `Panel` | height=33, margin-top=2, id=scroll2 |
| `item5` | `ItemsRow` | `Panel` | height=33, margin-top=2, id=item5 |
| `items` | `ItemsPanel` | `Panel` | height=55, id=items, text-align=center |
| `title` | `ItemAndButtonPanel` | `Panel` | height=40, id=title, text-align=center |
| `slot` | `ItemAndSlotPanel` | `Panel` | height=20, id=slot, text-align=center |
| `slot` | `TwoItemsAndSlotPanel` | `Panel` | height=20, margin-top=2, id=slot |
| `right` | `DualLabelPanel` | `Panel` | height=20, padding=1, id=right |
| `right` | `LabelAndTextEditPanel` | `Panel` | height=20, padding=1, id=right |
| `left` | `SwitchAndButtonPanel` | `Panel` | height=20, padding=1, id=left |

## Widget Details

### `text`

- **Klasa:** `DualScrollPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 51
  - `margin-top`: 3
  - `id`: text
  - `text-align`: center
  - `margin-right`: 1
  - `minimum`: 0
  - `maximum`: 100
  - `step`: 1
  - `margin-left`: 2

### `scroll`

- **Klasa:** `SingleScrollItemPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 45
  - `margin-top`: 2
  - `id`: scroll
  - `margin-left`: 2
  - `text-align`: center
  - `minimum`: 0
  - `maximum`: 100
  - `step`: 1

### `scroll2`

- **Klasa:** `DualScrollItemPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 33
  - `margin-top`: 2
  - `id`: scroll2
  - `margin-left`: 2
  - `text-align`: center
  - `margin-right`: 2
  - `minimum`: 0
  - `maximum`: 100
  - `step`: 1

### `item5`

- **Klasa:** `ItemsRow`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 33
  - `margin-top`: 2
  - `id`: item5
  - `margin-left`: 2

### `items`

- **Klasa:** `ItemsPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 55
  - `id`: items
  - `text-align`: center

### `title`

- **Klasa:** `ItemAndButtonPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 40
  - `id`: title
  - `text-align`: center
  - `margin-left`: 2
  - `margin-top`: 0

### `slot`

- **Klasa:** `ItemAndSlotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `id`: slot
  - `text-align`: center
  - `margin-left`: 2
  - `margin-top`: 2

### `slot`

- **Klasa:** `TwoItemsAndSlotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 2
  - `id`: slot
  - `margin-left`: 2
  - `text-align`: center

### `right`

- **Klasa:** `DualLabelPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `padding`: 1
  - `id`: right
  - `text-align`: right
  - `text-wrap`: true
  - `text-auto-resize`: true
  - `margin-left`: 2
  - `font`: verdana-11px-rounded
  - `margin-right`: 3

### `right`

- **Klasa:** `LabelAndTextEditPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `padding`: 1
  - `id`: right
  - `text-align`: center
  - `text-wrap`: true
  - `margin-right`: 2
  - `margin-left`: 3

### `left`

- **Klasa:** `SwitchAndButtonPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `padding`: 1
  - `id`: left
  - `margin-top`: 2
  - `text-auto-resize`: true
  - `text-align`: center
  - `margin-right`: 3

## Hierarchy Diagram

Zobacz: [../diagrams/panels.mmd](../diagrams/panels.mmd)

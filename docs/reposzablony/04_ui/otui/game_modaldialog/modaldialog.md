---
doc_id: "otui-ui-2225c863328b"
source_path: "game_modaldialog/modaldialog.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: modaldialog.otui"
summary: "Dokumentacja interfejsu OTUI dla game_modaldialog/modaldialog.otui"
tags: ["otui", "ui", "widget"]
---

# game_modaldialog/modaldialog.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla modaldialog.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `ChoiceListLabel` | `ChoiceListLabel` | `Label` | font=verdana-11px-monochrome, background-color=#00000055, text-offset=2 0 |
| `choiceList` | `ChoiceList` | `TextList` | visible=false |
| `choiceScrollBar` | `ChoiceScrollBar` | `VerticalScrollBar` | visible=false |
| `ModalButton` | `ModalButton` | `Button` | text-auto-resize=true, margin-top=2, margin-bottom=2 |
| `buttonsPanel` | `ModalDialog` | `MainWindow` | size=280 97 |

## Widget Details

### `ChoiceListLabel`

- **Klasa:** `ChoiceListLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `background-color`: #00000055
  - `text-offset`: 2 0
  - `focusable`: true
  - `color`: #ffffff

### `choiceList`

- **Klasa:** `ChoiceList`
- **Rodzic:** `TextList`
- **Właściwości:**
  - `id`: choiceList
  - `vertical-scrollbar`: choiceScrollBar
  - `margin-top`: 4
  - `margin-bottom`: 10
  - `focusable`: false
  - `visible`: false

### `choiceScrollBar`

- **Klasa:** `ChoiceScrollBar`
- **Rodzic:** `VerticalScrollBar`
- **Właściwości:**
  - `id`: choiceScrollBar
  - `step`: 14
  - `pixels-scroll`: true
  - `visible`: false

### `ModalButton`

- **Klasa:** `ModalButton`
- **Rodzic:** `Button`
- **Właściwości:**
  - `text-auto-resize`: true
  - `margin-top`: 2
  - `margin-bottom`: 2
  - `margin-left`: 2
  - `text-offset`: 0 0

### `buttonsPanel`

- **Klasa:** `ModalDialog`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `id`: buttonsPanel
  - `size`: 280 97
  - `text-align`: left
  - `text-auto-resize`: true
  - `text-wrap`: true
  - `margin-bottom`: 5
  - `height`: 24
  - `layout`: horizontalBox
  - `align-right`: true

## Hierarchy Diagram

Zobacz: [../diagrams/modaldialog.mmd](../diagrams/modaldialog.mmd)

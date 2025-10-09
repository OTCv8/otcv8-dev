---
doc_id: "otui-ui-3327ac9305aa"
source_path: "game_bot/ui/basic.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: basic.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/ui/basic.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/ui/basic.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla basic.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `BotButton` | `BotButton` | `Button` | height=17, margin-top=2 |
| `BotSwitch` | `BotSwitch` | `Button` | margin-top=2, height=17, image-color=red |
| `SmallBotSwitch` | `SmallBotSwitch` | `Button` | margin-top=2, height=15, image-color=red |
| `BotLabel` | `BotLabel` | `Label` | margin-top=2, height=15, text-auto-resize=true |
| `BotItem` | `BotItem` | `Item` | virtual=true |
| `BotTextEdit` | `BotTextEdit` | `TextEdit` | text-align=center, multiline=false, focusable=false |
| `BotSeparator` | `BotSeparator` | `HorizontalSeparator` | margin-top=5, margin-bottom=3 |
| `botPanelScroll` | `BotSmallScrollBar` | `SmallScrollBar` | margin-top=1, id=botPanelScroll, margin-right=16 |
| `botPanelScroll` | `BotPanel` | `Panel` | margin-top=1, id=botPanelScroll, margin-right=16 |
| `CaveBotLabel` | `CaveBotLabel` | `Label` | background-color=#00000055, text-offset=2 0, focusable=true |
| `SlotComboBoxPopupMenu` | `SlotComboBoxPopupMenu` | `ComboBoxPopupMenu` |  |
| `SlotComboBoxPopupMenuButton` | `SlotComboBoxPopupMenuButton` | `ComboBoxPopupMenuButton` | self=addOption("Purse") |
| `SlotComboBox` | `SlotComboBox` | `ComboBox` | self=addOption("Purse") |

## Widget Details

### `BotButton`

- **Klasa:** `BotButton`
- **Rodzic:** `Button`
- **Właściwości:**
  - `height`: 17
  - `margin-top`: 2

### `BotSwitch`

- **Klasa:** `BotSwitch`
- **Rodzic:** `Button`
- **Właściwości:**
  - `margin-top`: 2
  - `height`: 17
  - `image-color`: red

### `SmallBotSwitch`

- **Klasa:** `SmallBotSwitch`
- **Rodzic:** `Button`
- **Właściwości:**
  - `margin-top`: 2
  - `height`: 15
  - `image-color`: red

### `BotLabel`

- **Klasa:** `BotLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `margin-top`: 2
  - `height`: 15
  - `text-auto-resize`: true
  - `text-align`: center
  - `text-wrap`: true

### `BotItem`

- **Klasa:** `BotItem`
- **Rodzic:** `Item`
- **Właściwości:**
  - `virtual`: true

### `BotTextEdit`

- **Klasa:** `BotTextEdit`
- **Rodzic:** `TextEdit`
- **Właściwości:**
  - `text-align`: center
  - `multiline`: false
  - `focusable`: false
  - `height`: 20

### `BotSeparator`

- **Klasa:** `BotSeparator`
- **Rodzic:** `HorizontalSeparator`
- **Właściwości:**
  - `margin-top`: 5
  - `margin-bottom`: 3

### `botPanelScroll`

- **Klasa:** `BotSmallScrollBar`
- **Rodzic:** `SmallScrollBar`
- **Właściwości:**
  - `margin-top`: 1
  - `id`: botPanelScroll
  - `margin-right`: 16
  - `margin-left`: 1
  - `margin-bottom`: 5
  - `vertical-scrollbar`: botPanelScroll
  - `type`: verticalBox

### `botPanelScroll`

- **Klasa:** `BotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `margin-top`: 1
  - `id`: botPanelScroll
  - `margin-right`: 16
  - `margin-left`: 1
  - `margin-bottom`: 5
  - `vertical-scrollbar`: botPanelScroll
  - `type`: verticalBox

### `CaveBotLabel`

- **Klasa:** `CaveBotLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 2 0
  - `focusable`: true

### `SlotComboBoxPopupMenu`

- **Klasa:** `SlotComboBoxPopupMenu`
- **Rodzic:** `ComboBoxPopupMenu`

### `SlotComboBoxPopupMenuButton`

- **Klasa:** `SlotComboBoxPopupMenuButton`
- **Rodzic:** `ComboBoxPopupMenuButton`
- **Właściwości:**
  - `self`: addOption("Purse")

### `SlotComboBox`

- **Klasa:** `SlotComboBox`
- **Rodzic:** `ComboBox`
- **Właściwości:**
  - `self`: addOption("Purse")

## Hierarchy Diagram

Zobacz: [../diagrams/basic.mmd](../diagrams/basic.mmd)

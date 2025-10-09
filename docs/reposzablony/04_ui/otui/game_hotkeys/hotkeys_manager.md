---
doc_id: "otui-ui-37c9966b4c1d"
source_path: "game_hotkeys/hotkeys_manager.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: hotkeys_manager.otui"
summary: "Dokumentacja interfejsu OTUI dla game_hotkeys/hotkeys_manager.otui"
tags: ["otui", "ui", "widget"]
---

# game_hotkeys/hotkeys_manager.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla hotkeys_manager.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `cancelButton` | `HotkeyListLabel` | `UILabel` | enabled=false, size=370 475 |
| `cancelButton` | `HotkeyAssignWindow` | `MainWindow` | size=360 150 |

## Widget Details

### `cancelButton`

- **Klasa:** `HotkeyListLabel`
- **Rodzic:** `UILabel`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `background-color`: #ffffff22
  - `text-offset`: 5 2
  - `focusable`: false
  - `phantom`: false
  - `id`: cancelButton
  - `size`: 370 475
  - `menu-scroll`: true
  - `menu-height`: 125
  - `menu-scroll-step`: 25
  - `self`: addOption(tr("Hotkeys config #5"))
  - `height`: 150
  - `margin-top`: 2
  - `step`: 14
  - `pixels-scroll`: true
  - `vertical-scrollbar`: currentHotkeysScrollBar
  - `width`: 64
  - `margin-right`: 10
  - `enabled`: false
  - `margin-left`: 10
  - `enable`: false
  - `virtual`: true
  - `checked`: false
  - `margin-bottom`: 5

### `cancelButton`

- **Klasa:** `HotkeyAssignWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `id`: cancelButton
  - `size`: 360 150
  - `text-auto-resize`: true
  - `text-align`: left
  - `margin-top`: 10
  - `margin-bottom`: 10
  - `width`: 64
  - `margin-right`: 10

## Hierarchy Diagram

Zobacz: [../diagrams/hotkeys_manager.mmd](../diagrams/hotkeys_manager.mmd)

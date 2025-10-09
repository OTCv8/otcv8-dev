---
doc_id: "otui-ui-71e22a3ef856"
source_path: "game_console/communicationwindow.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: communicationwindow.otui"
summary: "Dokumentacja interfejsu OTUI dla game_console/communicationwindow.otui"
tags: ["otui", "ui", "widget"]
---

# game_console/communicationwindow.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla communicationwindow.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `IgnoreListLabel` | `IgnoreListLabel` | `Label` | font=verdana-11px-monochrome, background-color=#ffffff22, text-offset=2 0 |
| `whiteListScrollBar` | `WhiteListLabel` | `Label` | size=160 30 |

## Widget Details

### `IgnoreListLabel`

- **Klasa:** `IgnoreListLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `background-color`: #ffffff22
  - `text-offset`: 2 0
  - `focusable`: true
  - `phantom`: false
  - `color`: #ffffff

### `whiteListScrollBar`

- **Klasa:** `WhiteListLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `background-color`: #ffffff22
  - `text-offset`: 2 0
  - `focusable`: false
  - `phantom`: false
  - `color`: #ffffff
  - `id`: whiteListScrollBar
  - `size`: 160 30
  - `width`: 75
  - `margin-top`: 5
  - `vertical-scrollbar`: whiteListScrollBar
  - `height`: 30
  - `margin-bottom`: 10
  - `padding`: 1
  - `margin-left`: 10
  - `step`: 14
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/communicationwindow.mmd](../diagrams/communicationwindow.mmd)

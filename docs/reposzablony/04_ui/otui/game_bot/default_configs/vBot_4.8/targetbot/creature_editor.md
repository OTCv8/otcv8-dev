---
doc_id: "otui-ui-43cd97e5dde6"
source_path: "game_bot/default_configs/vBot_4.8/targetbot/creature_editor.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: creature_editor.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/targetbot/creature_editor.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/targetbot/creature_editor.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla creature_editor.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `scroll` | `TargetBotCreatureEditorScrollBar` | `Panel` | height=28, margin-top=3, id=scroll |
| `textEdit` | `TargetBotCreatureEditorTextEdit` | `Panel` | height=40, margin-top=5, id=textEdit |
| `item` | `TargetBotCreatureEditorItem` | `Panel` | height=34, margin-top=7, margin-left=25 |
| `TargetBotCreatureEditorCheckBox` | `TargetBotCreatureEditorCheckBox` | `BotSwitch` | height=20, margin-top=7 |
| `cancel` | `TargetBotCreatureEditorWindow` | `MainWindow` | text=Target name:, width=60, height=300 |

## Widget Details

### `scroll`

- **Klasa:** `TargetBotCreatureEditorScrollBar`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 28
  - `margin-top`: 3
  - `id`: scroll
  - `text-align`: center
  - `minimum`: 0
  - `maximum`: 10
  - `step`: 1

### `textEdit`

- **Klasa:** `TargetBotCreatureEditorTextEdit`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 40
  - `margin-top`: 5
  - `id`: textEdit
  - `text-align`: center
  - `minimum`: 0
  - `maximum`: 10
  - `step`: 1

### `item`

- **Klasa:** `TargetBotCreatureEditorItem`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 34
  - `margin-top`: 7
  - `margin-left`: 25
  - `margin-right`: 25
  - `id`: item

### `TargetBotCreatureEditorCheckBox`

- **Klasa:** `TargetBotCreatureEditorCheckBox`
- **Rodzic:** `BotSwitch`
- **Właściwości:**
  - `height`: 20
  - `margin-top`: 7

### `cancel`

- **Klasa:** `TargetBotCreatureEditorWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `text`: Target name:
  - `width`: 60
  - `height`: 300
  - `text-align`: center
  - `id`: cancel
  - `margin-left`: 10
  - `margin-top`: 5
  - `step`: 28
  - `pixels-scroll`: true
  - `margin-right`: 10
  - `margin-bottom`: 10
  - `vertical-scrollbar`: contentScroll
  - `type`: verticalBox
  - `fit-children`: true

## Hierarchy Diagram

Zobacz: [../diagrams/creature_editor.mmd](../diagrams/creature_editor.mmd)

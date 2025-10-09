---
doc_id: "otui-ui-b74dbb5845c4"
source_path: "client_terminal/terminal.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: terminal.otui"
summary: "Dokumentacja interfejsu OTUI dla client_terminal/terminal.otui"
tags: ["otui", "ui", "widget"]
---

# client_terminal/terminal.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla terminal.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `TerminalLabel` | `TerminalLabel` | `UILabel` | font=terminus-10px, text-wrap=true, text-auto-resize=true |
| `rightResizeBorder` | `TerminalSelectText` | `UITextEdit` | visible=false, enabled=false, size=12 12 |

## Widget Details

### `TerminalLabel`

- **Klasa:** `TerminalLabel`
- **Rodzic:** `UILabel`
- **Właściwości:**
  - `font`: terminus-10px
  - `text-wrap`: true
  - `text-auto-resize`: true
  - `phantom`: true

### `rightResizeBorder`

- **Klasa:** `TerminalSelectText`
- **Rodzic:** `UITextEdit`
- **Właściwości:**
  - `font`: terminus-10px
  - `text-wrap`: true
  - `text-align`: left
  - `editable`: false
  - `change-cursor-image`: false
  - `cursor-visible`: false
  - `selection-color`: black
  - `selection-background-color`: white
  - `color`: white
  - `focusable`: false
  - `auto-scroll`: false
  - `id`: rightResizeBorder
  - `background-color`: #ffffff11
  - `opacity`: 0.85
  - `clipping`: true
  - `border`: 1 black
  - `text-offset`: 4 0
  - `height`: 18
  - `visible`: false
  - `type`: verticalBox
  - `align-bottom`: true
  - `vertical-scrollbar`: terminalScroll
  - `inverted-scroll`: true
  - `margin-left`: 1
  - `step`: 48
  - `pixels-scroll`: true
  - `size`: 12 12
  - `fixed-size`: true
  - `text`: >
  - `background`: #aaaaaa11
  - `border-color`: #aaaaaa88
  - `padding-left`: 2
  - `border-width-left`: 1
  - `border-width-top`: 1
  - `multiline`: true
  - `text-auto-submit`: true
  - `enabled`: false

## Hierarchy Diagram

Zobacz: [../diagrams/terminal.mmd](../diagrams/terminal.mmd)

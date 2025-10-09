---
doc_id: "otui-ui-089de991213b"
source_path: "client_options/options.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: options.otui"
summary: "Dokumentacja interfejsu OTUI dla client_options/options.otui"
tags: ["otui", "ui", "widget"]
---

# client_options/options.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla options.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `OptionCheckBox` | `OptionCheckBox` | `CheckBox` | height=16, margin-top=2 |
| `OptionScrollbar` | `OptionScrollbar` | `HorizontalScrollBar` | step=1 |
| `optionsTabContent` | `OptionPanel` | `Panel` | size=490 360 |

## Widget Details

### `OptionCheckBox`

- **Klasa:** `OptionCheckBox`
- **Rodzic:** `CheckBox`
- **Właściwości:**
  - `height`: 16
  - `margin-top`: 2

### `OptionScrollbar`

- **Klasa:** `OptionScrollbar`
- **Rodzic:** `HorizontalScrollBar`
- **Właściwości:**
  - `step`: 1

### `optionsTabContent`

- **Klasa:** `OptionPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `type`: verticalBox
  - `id`: optionsTabContent
  - `size`: 490 360
  - `margin-left`: 10
  - `margin-top`: 3
  - `width`: 64

## Hierarchy Diagram

Zobacz: [../diagrams/options.mmd](../diagrams/options.mmd)

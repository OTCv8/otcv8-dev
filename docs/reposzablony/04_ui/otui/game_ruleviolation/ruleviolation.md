---
doc_id: "otui-ui-a13c65f6501b"
source_path: "game_ruleviolation/ruleviolation.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: ruleviolation.otui"
summary: "Dokumentacja interfejsu OTUI dla game_ruleviolation/ruleviolation.otui"
tags: ["otui", "ui", "widget"]
---

# game_ruleviolation/ruleviolation.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla ruleviolation.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `RVListLabel` | `RVListLabel` | `Label` | background-color=#ffffff22, text-offset=2 0, focusable=true |
| `RVLabel` | `RVLabel` | `Label` | margin-top=10 |
| `commentText` | `RVTextEdit` | `TextEdit` | enabled=false, size=400 445 |

## Widget Details

### `RVListLabel`

- **Klasa:** `RVListLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #ffffff22
  - `text-offset`: 2 0
  - `focusable`: true
  - `color`: #ffffff

### `RVLabel`

- **Klasa:** `RVLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `margin-top`: 10

### `commentText`

- **Klasa:** `RVTextEdit`
- **Rodzic:** `TextEdit`
- **Właściwości:**
  - `margin-top`: 10
  - `id`: commentText
  - `size`: 400 445
  - `text`: Rule Violation
  - `enabled`: false
  - `height`: 60
  - `focusable`: false
  - `vertical-scrollbar`: actionListScrollBar
  - `step`: 14
  - `pixels-scroll`: true
  - `width`: 64
  - `margin-right`: 5

## Hierarchy Diagram

Zobacz: [../diagrams/ruleviolation.mmd](../diagrams/ruleviolation.mmd)

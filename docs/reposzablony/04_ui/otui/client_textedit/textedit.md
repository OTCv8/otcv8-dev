---
doc_id: "otui-ui-8c9621edb08f"
source_path: "client_textedit/textedit.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: textedit.otui"
summary: "Dokumentacja interfejsu OTUI dla client_textedit/textedit.otui"
tags: ["otui", "ui", "widget"]
---

# client_textedit/textedit.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla textedit.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `cancel` | `TextEditButtons` | `Panel` | id=cancel, height=30, margin-right=10 |
| `examples` | `TextEditWindow` | `MainWindow` | visible=false |
| `text` | `SinglelineTextEditWindow` | `TextEditWindow` | width=250, id=text |
| `textScroll` | `MultilineTextEditWindow` | `TextEditWindow` | width=500, id=textScroll, height=300 |

## Widget Details

### `cancel`

- **Klasa:** `TextEditButtons`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: cancel
  - `height`: 30
  - `margin-right`: 10
  - `width`: 60

### `examples`

- **Klasa:** `TextEditWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `id`: examples
  - `type`: verticalBox
  - `fit-children`: true
  - `text-align`: center
  - `margin-bottom`: 5
  - `visible`: false
  - `text-wrap`: true
  - `text-auto-resize`: true

### `text`

- **Klasa:** `SinglelineTextEditWindow`
- **Rodzic:** `TextEditWindow`
- **Właściwości:**
  - `width`: 250
  - `id`: text

### `textScroll`

- **Klasa:** `MultilineTextEditWindow`
- **Rodzic:** `TextEditWindow`
- **Właściwości:**
  - `width`: 500
  - `id`: textScroll
  - `height`: 300
  - `margin-right`: 12
  - `text-wrap`: true
  - `vertical-scrollbar`: textScroll
  - `pixels-scroll`: true
  - `step`: 10

## Hierarchy Diagram

Zobacz: [../diagrams/textedit.mmd](../diagrams/textedit.mmd)

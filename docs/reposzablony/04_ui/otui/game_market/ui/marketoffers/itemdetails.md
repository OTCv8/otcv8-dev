---
doc_id: "otui-ui-83dd3f69e4ff"
source_path: "game_market/ui/marketoffers/itemdetails.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: itemdetails.otui"
summary: "Dokumentacja interfejsu OTUI dla game_market/ui/marketoffers/itemdetails.otui"
tags: ["otui", "ui", "widget"]
---

# game_market/ui/marketoffers/itemdetails.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla itemdetails.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `DetailsTableRow` | `DetailsTableRow` | `TableRow` | font=verdana-11px-monochrome, focusable=false, color=#cccccc |
| `detailsTableScrollBar` | `DetailsTableColumn` | `TableColumn` | font=verdana-11px-monochrome, background-color=#222833, text-offset=2 2 |

## Widget Details

### `DetailsTableRow`

- **Klasa:** `DetailsTableRow`
- **Rodzic:** `TableRow`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `focusable`: false
  - `color`: #cccccc
  - `height`: 45
  - `padding`: 2
  - `even-background-color`: alpha
  - `odd-background-color`: alpha

### `detailsTableScrollBar`

- **Klasa:** `DetailsTableColumn`
- **Rodzic:** `TableColumn`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `background-color`: #222833
  - `text-offset`: 2 2
  - `color`: #cccccc
  - `width`: 100
  - `focusable`: false
  - `margin`: 1
  - `id`: detailsTableScrollBar
  - `margin-top`: 63
  - `margin-left`: 6
  - `margin-bottom`: 85
  - `margin-right`: 6
  - `padding`: 1
  - `border-width`: 1
  - `border-color`: #191f27
  - `table-data`: detailsTableData
  - `row-style`: DetailsTableRow
  - `column-style`: DetailsTableColumn
  - `vertical-scrollbar`: detailsTableScrollBar
  - `step`: 28
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/itemdetails.mmd](../diagrams/itemdetails.mmd)

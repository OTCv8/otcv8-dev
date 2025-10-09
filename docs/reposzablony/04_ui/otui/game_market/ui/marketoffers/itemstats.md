---
doc_id: "otui-ui-d41cc588722b"
source_path: "game_market/ui/marketoffers/itemstats.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: itemstats.otui"
summary: "Dokumentacja interfejsu OTUI dla game_market/ui/marketoffers/itemstats.otui"
tags: ["otui", "ui", "widget"]
---

# game_market/ui/marketoffers/itemstats.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla itemstats.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `StatsTableRow` | `StatsTableRow` | `TableRow` | font=verdana-11px-monochrome, focusable=false, color=#cccccc |
| `sellStatsTableScrollBar` | `StatsTableColumn` | `TableColumn` | font=verdana-11px-rounded, background-color=#222833, text-offset=0 2 |

## Widget Details

### `StatsTableRow`

- **Klasa:** `StatsTableRow`
- **Rodzic:** `TableRow`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `focusable`: false
  - `color`: #cccccc
  - `height`: 20

### `sellStatsTableScrollBar`

- **Klasa:** `StatsTableColumn`
- **Rodzic:** `TableColumn`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `background-color`: #222833
  - `text-offset`: 0 2
  - `color`: #cccccc
  - `width`: 110
  - `focusable`: false
  - `margin`: 1
  - `margin-top`: 6
  - `margin-left`: 6
  - `id`: sellStatsTableScrollBar
  - `margin-bottom`: 5
  - `margin-right`: 6
  - `height`: 112
  - `padding`: 1
  - `border-width`: 1
  - `border-color`: #191f27
  - `table-data`: sellStatsTableData
  - `row-style`: StatsTableRow
  - `column-style`: StatsTableColumn
  - `vertical-scrollbar`: sellStatsTableScrollBar
  - `step`: 28
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/itemstats.mmd](../diagrams/itemstats.mmd)

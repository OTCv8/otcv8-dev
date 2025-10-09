---
doc_id: "otui-ui-8d82e189cd4d"
source_path: "game_market/ui/myoffers/currentoffers.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: currentoffers.otui"
summary: "Dokumentacja interfejsu OTUI dla game_market/ui/myoffers/currentoffers.otui"
tags: ["otui", "ui", "widget"]
---

# game_market/ui/myoffers/currentoffers.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla currentoffers.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `OfferTableRow` | `OfferTableRow` | `TableRow` | font=verdana-11px-monochrome, color=#cccccc, height=15 |
| `OfferTableColumn` | `OfferTableColumn` | `TableColumn` | font=verdana-11px-monochrome, background-color=alpha, text-offset=5 0 |
| `OfferTableWarningColumn` | `OfferTableWarningColumn` | `OfferTableColumn` | color=#e03d3d |
| `OfferTableHeaderRow` | `OfferTableHeaderRow` | `TableHeaderRow` | font=verdana-11px-monochrome, color=#cccccc, height=20 |
| `myBuyingTableScrollBar` | `OfferTableHeaderColumn` | `SortableTableHeaderColumn` | enabled=false |

## Widget Details

### `OfferTableRow`

- **Klasa:** `OfferTableRow`
- **Rodzic:** `TableRow`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `color`: #cccccc
  - `height`: 15

### `OfferTableColumn`

- **Klasa:** `OfferTableColumn`
- **Rodzic:** `TableColumn`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `background-color`: alpha
  - `text-offset`: 5 0
  - `color`: #cccccc
  - `width`: 80

### `OfferTableWarningColumn`

- **Klasa:** `OfferTableWarningColumn`
- **Rodzic:** `OfferTableColumn`
- **Właściwości:**
  - `color`: #e03d3d

### `OfferTableHeaderRow`

- **Klasa:** `OfferTableHeaderRow`
- **Rodzic:** `TableHeaderRow`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `color`: #cccccc
  - `height`: 20

### `myBuyingTableScrollBar`

- **Klasa:** `OfferTableHeaderColumn`
- **Rodzic:** `SortableTableHeaderColumn`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `text-offset`: 0 2
  - `color`: #ffffff
  - `background-color`: #222833
  - `margin`: 1
  - `id`: myBuyingTableScrollBar
  - `margin-right`: 6
  - `width`: 120
  - `enabled`: false
  - `margin-top`: 5
  - `margin-left`: 6
  - `height`: 160
  - `margin-bottom`: 5
  - `padding`: 1
  - `focusable`: false
  - `border-width`: 1
  - `border-color`: #191f27
  - `table-data`: myBuyingTableData
  - `row-style`: OfferTableRow
  - `column-style`: OfferTableColumn
  - `header-column-style`: false
  - `header-row-style`: false
  - `vertical-scrollbar`: myBuyingTableScrollBar
  - `step`: 28
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/currentoffers.mmd](../diagrams/currentoffers.mmd)

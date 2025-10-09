---
doc_id: "otui-ui-bb40fe801dd9"
source_path: "client_stats/stats.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: stats.otui"
summary: "Dokumentacja interfejsu OTUI dla client_stats/stats.otui"
tags: ["otui", "ui", "widget"]
---

# client_stats/stats.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla stats.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `DebugText` | `DebugText` | `Label` | font=terminus-10px, text-wrap=false, text-auto-resize=true |
| `debugScroll` | `DebugLabel` | `Label` | size=550 300 |

## Widget Details

### `DebugText`

- **Klasa:** `DebugText`
- **Rodzic:** `Label`
- **Właściwości:**
  - `font`: terminus-10px
  - `text-wrap`: false
  - `text-auto-resize`: true
  - `text-align`: topleft

### `debugScroll`

- **Klasa:** `DebugLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `text-wrap`: false
  - `text-auto-resize`: false
  - `text-align`: center
  - `id`: debugScroll
  - `size`: 550 300
  - `margin`: 5 5 5 5
  - `padding`: 25 3 3 3
  - `opacity`: 0.9
  - `margin-bottom`: 5
  - `padding-left`: 5
  - `vertical-scrollbar`: debugScroll
  - `text`: -
  - `step`: 48
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/stats.mmd](../diagrams/stats.mmd)

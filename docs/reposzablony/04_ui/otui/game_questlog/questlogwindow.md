---
doc_id: "otui-ui-d7e5078b3244"
source_path: "game_questlog/questlogwindow.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: questlogwindow.otui"
summary: "Dokumentacja interfejsu OTUI dla game_questlog/questlogwindow.otui"
tags: ["otui", "ui", "widget"]
---

# game_questlog/questlogwindow.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla questlogwindow.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `description` | `QuestTrackerLabel` | `Panel` | height=20, type=verticalBox, fit-children=true |
| `QuestLabel` | `QuestLabel` | `Label` | font=verdana-11px-monochrome, height=18, text-offset=2 1 |
| `questListScrollBar` | `QuestLog` | `Panel` | id=questListScrollBar, margin-bottom=20, focusable=false |
| `missionDescription` | `MissionLog` | `Panel` | enabled=false |
| `trackerButton` | `QuestLogWindow` | `MainWindow` | visible=false, size=80 21 |
| `list` | `QuestTracker` | `MiniWindow` | id=list, height=20, icon=/images/topbuttons/quest_tracker |

## Widget Details

### `description`

- **Klasa:** `QuestTrackerLabel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 20
  - `type`: verticalBox
  - `fit-children`: true
  - `margin-top`: 3
  - `id`: description
  - `text-align`: center
  - `text-wrap`: true
  - `text-auto-resize`: true

### `QuestLabel`

- **Klasa:** `QuestLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `height`: 18
  - `text-offset`: 2 1
  - `focusable`: true
  - `color`: #aaaaaa
  - `background-color`: #ffffff22

### `questListScrollBar`

- **Klasa:** `QuestLog`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: questListScrollBar
  - `margin-bottom`: 20
  - `focusable`: false
  - `background-color`: #484848
  - `vertical-scrollbar`: questListScrollBar
  - `step`: 14
  - `pixels-scroll`: true

### `missionDescription`

- **Klasa:** `MissionLog`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: missionDescription
  - `text-align`: left
  - `text`: questline name
  - `margin-top`: 10
  - `height`: 133
  - `padding`: 1
  - `focusable`: false
  - `vertical-scrollbar`: missionListScrollBar
  - `background-color`: #363636
  - `step`: 14
  - `pixels-scroll`: true
  - `margin-bottom`: 10
  - `enabled`: false
  - `text-wrap`: true

### `trackerButton`

- **Klasa:** `QuestLogWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `id`: trackerButton
  - `size`: 80 21
  - `visible`: false
  - `margin-bottom`: 8
  - `font`: cipsoftFont
  - `color`: #ffffff
  - `margin-right`: 3
  - `text-align`: center

### `list`

- **Klasa:** `QuestTracker`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: list
  - `height`: 20
  - `icon`: /images/topbuttons/quest_tracker
  - `padding-left`: 5
  - `padding-right`: 5
  - `padding-top`: 5
  - `layout`: verticalBox
  - `type`: verticalBox
  - `fit-children`: true
  - `margin-top`: 5
  - `margin-left`: 30
  - `margin-right`: 30
  - `font`: cipsoftFont
  - `color`: #FFFFFF

## Hierarchy Diagram

Zobacz: [../diagrams/questlogwindow.mmd](../diagrams/questlogwindow.mmd)

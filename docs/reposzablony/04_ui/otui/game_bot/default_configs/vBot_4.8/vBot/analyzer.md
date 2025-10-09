---
doc_id: "otui-ui-e4fda6d29f8a"
source_path: "game_bot/default_configs/vBot_4.8/vBot/analyzer.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: analyzer.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/default_configs/vBot_4.8/vBot/analyzer.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/default_configs/vBot_4.8/vBot/analyzer.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla analyzer.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `cooldown` | `BossCreaturePanel` | `Panel` | size=35 35 |
| `clear` | `SearchPanel` | `TextEdit` | size=18 18 |
| `drops` | `TrackerItem` | `Panel` | height=40, id=drops, margin-top=3 |
| `value` | `DualLabel` | `Label` | height=15, text-offset=4 0, font=verdana-11px-rounded |
| `healing` | `MemberWidget` | `Panel` | size=28 28 |
| `remove` | `AnalyzerPriceLabel` | `Label` | background-color=#00000055, text-offset=2 0, focusable=true |
| `AnalyzerListPanel` | `AnalyzerListPanel` | `Panel` | padding-left=4, padding-right=4, type=verticalBox |
| `ListLabel` | `ListLabel` | `Label` | height=15, font=verdana-11px-rounded, text-offset=15 0 |
| `List` | `AnalyzerItemsPanel` | `Panel` | id=List, padding=2, type=grid |
| `count` | `AnalyzerLootItem` | `UIItem` | opacity=0.87, height=37, margin-left=1 |
| `AnalyzerGraph` | `AnalyzerGraph` | `UIGraph` | height=140, capacity=400, line-width=1 |
| `AnalyzerProgressBar` | `AnalyzerProgressBar` | `ProgressBar` | background-color=green, height=5, margin-top=3 |
| `AnalyzerButton` | `AnalyzerButton` | `Button` | height=22, margin-bottom=2, font=verdana-11px-rounded |
| `ResetSession` | `MainAnalyzerWindow` | `MiniWindow` | id=ResetSession, text=Reset Session, height=293 |
| `HuntingAnalyzerWindow` | `HuntingAnalyzer` | `MiniWindow` | id=HuntingAnalyzerWindow, text=Hunt Analyzer, icon=/images/topbuttons/analyzers |
| `LootAnalyzerWindow` | `LootAnalyzer` | `MiniWindow` | id=LootAnalyzerWindow, text=Loot Analyzer, icon=/images/topbuttons/analyzers |
| `SupplyAnalyzerWindow` | `SupplyAnalyzer` | `MiniWindow` | id=SupplyAnalyzerWindow, text=Supply Analyzer, icon=/images/topbuttons/analyzers |
| `ImpactAnalyzerWindow` | `ImpactAnalyzer` | `MiniWindow` | id=ImpactAnalyzerWindow, text=Impact Analyzer, icon=/images/topbuttons/analyzers |
| `XPAnalyzerWindow` | `XPAnalyzer` | `MiniWindow` | id=XPAnalyzerWindow, text=XP Analyzer, height=150 |
| `PartyAnalyzerWindow` | `PartyAnalyzerWindow` | `MiniWindow` | id=PartyAnalyzerWindow, text=Party Hunt, height=200 |
| `DropTracker` | `DropTracker` | `MiniWindow` | id=DropTracker, text=Drop Tracker, height=200 |
| `CaveBotStats` | `CaveBotStats` | `MiniWindow` | id=CaveBotStats, text=CaveBot Stats, height=200 |
| `search` | `BossTracker` | `MiniWindow` | id=search, text=Boss Cooldowns, height=200 |
| `closeButton` | `FeaturesWindow` | `MainWindow` | size=45 21 |

## Widget Details

### `cooldown`

- **Klasa:** `BossCreaturePanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 38
  - `id`: cooldown
  - `size`: 35 35
  - `old-scaling`: true
  - `margin-left`: 5
  - `margin`: 1
  - `margin-top`: 4
  - `font`: verdana-11px-rounded
  - `color`: #FFFFFF
  - `text`: 19h 20min

### `clear`

- **Klasa:** `SearchPanel`
- **Rodzic:** `TextEdit`
- **Właściwości:**
  - `placeholder`: Type to search
  - `margin-top`: 1
  - `id`: clear
  - `margin-right`: -2
  - `size`: 18 18
  - `text`: X
  - `self`: getParent():setText("")

### `drops`

- **Klasa:** `TrackerItem`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 40
  - `id`: drops
  - `margin-top`: 3
  - `margin-left`: 5
  - `text`: Loot Drops: 0
  - `text-align`: left
  - `font`: verdana-11px-rounded
  - `color`: #CCCCCC

### `value`

- **Klasa:** `DualLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `height`: 15
  - `text-offset`: 4 0
  - `font`: verdana-11px-rounded
  - `text-align`: right
  - `width`: 200
  - `id`: value
  - `margin-right`: 4
  - `text`: 0

### `healing`

- **Klasa:** `MemberWidget`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 7
  - `margin-top`: 2
  - `id`: healing
  - `size`: 28 28
  - `margin-left`: 5
  - `text`: Healing:
  - `font`: verdana-11px-rounded
  - `text-align`: left
  - `background-color`: #0000FF
  - `phantom`: false

### `remove`

- **Klasa:** `AnalyzerPriceLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `background-color`: #00000055
  - `text-offset`: 2 0
  - `focusable`: true
  - `height`: 15
  - `id`: remove
  - `margin-right`: 15
  - `width`: 15

### `AnalyzerListPanel`

- **Klasa:** `AnalyzerListPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `padding-left`: 4
  - `padding-right`: 4
  - `type`: verticalBox
  - `fit-children`: true

### `ListLabel`

- **Klasa:** `ListLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `height`: 15
  - `font`: verdana-11px-rounded
  - `text-offset`: 15 0

### `List`

- **Klasa:** `AnalyzerItemsPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `id`: List
  - `padding`: 2
  - `type`: grid
  - `cell-size`: 33 33
  - `cell-spacing`: 1
  - `num-columns`: 5
  - `fit-children`: true

### `count`

- **Klasa:** `AnalyzerLootItem`
- **Rodzic:** `UIItem`
- **Właściwości:**
  - `opacity`: 0.87
  - `height`: 37
  - `margin-left`: 1
  - `virtual`: true
  - `background-color`: alpha
  - `id`: count
  - `font`: verdana-11px-rounded
  - `color`: white
  - `margin-right`: 2
  - `text-align`: right
  - `text`: 0

### `AnalyzerGraph`

- **Klasa:** `AnalyzerGraph`
- **Rodzic:** `UIGraph`
- **Właściwości:**
  - `height`: 140
  - `capacity`: 400
  - `line-width`: 1
  - `color`: red
  - `margin-top`: 5
  - `margin-left`: 5
  - `margin-right`: 5
  - `background-color`: #383636
  - `padding`: 5
  - `font`: verdana-11px-rounded
  - `image-source`: /images/ui/graph_background

### `AnalyzerProgressBar`

- **Klasa:** `AnalyzerProgressBar`
- **Rodzic:** `ProgressBar`
- **Właściwości:**
  - `background-color`: green
  - `height`: 5
  - `margin-top`: 3
  - `phantom`: false
  - `margin-left`: 3
  - `margin-right`: 3
  - `border`: 1 black

### `AnalyzerButton`

- **Klasa:** `AnalyzerButton`
- **Rodzic:** `Button`
- **Właściwości:**
  - `height`: 22
  - `margin-bottom`: 2
  - `font`: verdana-11px-rounded
  - `text-offset`: 0 4

### `ResetSession`

- **Klasa:** `MainAnalyzerWindow`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: ResetSession
  - `text`: Reset Session
  - `height`: 293
  - `icon`: /images/topbuttons/analyzers
  - `padding-left`: 5
  - `padding-right`: 5
  - `padding-top`: 5
  - `layout`: verticalBox
  - `color`: #FF0000

### `HuntingAnalyzerWindow`

- **Klasa:** `HuntingAnalyzer`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: HuntingAnalyzerWindow
  - `text`: Hunt Analyzer
  - `icon`: /images/topbuttons/analyzers
  - `padding-top`: 3
  - `layout`: verticalBox

### `LootAnalyzerWindow`

- **Klasa:** `LootAnalyzer`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: LootAnalyzerWindow
  - `text`: Loot Analyzer
  - `icon`: /images/topbuttons/analyzers
  - `padding-top`: 3
  - `layout`: verticalBox

### `SupplyAnalyzerWindow`

- **Klasa:** `SupplyAnalyzer`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: SupplyAnalyzerWindow
  - `text`: Supply Analyzer
  - `icon`: /images/topbuttons/analyzers
  - `padding-top`: 3
  - `layout`: verticalBox

### `ImpactAnalyzerWindow`

- **Klasa:** `ImpactAnalyzer`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: ImpactAnalyzerWindow
  - `text`: Impact Analyzer
  - `icon`: /images/topbuttons/analyzers
  - `padding-top`: 3
  - `layout`: verticalBox

### `XPAnalyzerWindow`

- **Klasa:** `XPAnalyzer`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: XPAnalyzerWindow
  - `text`: XP Analyzer
  - `height`: 150
  - `icon`: /images/topbuttons/analyzers
  - `padding-top`: 3
  - `layout`: verticalBox

### `PartyAnalyzerWindow`

- **Klasa:** `PartyAnalyzerWindow`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: PartyAnalyzerWindow
  - `text`: Party Hunt
  - `height`: 200
  - `icon`: /images/topbuttons/analyzers
  - `padding-left`: 3
  - `padding-right`: 3
  - `padding-top`: 1
  - `layout`: verticalBox

### `DropTracker`

- **Klasa:** `DropTracker`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: DropTracker
  - `text`: Drop Tracker
  - `height`: 200
  - `icon`: /images/topbuttons/analyzers
  - `padding-left`: 3
  - `padding-right`: 3
  - `padding-top`: 1
  - `layout`: verticalBox

### `CaveBotStats`

- **Klasa:** `CaveBotStats`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: CaveBotStats
  - `text`: CaveBot Stats
  - `height`: 200
  - `icon`: /images/topbuttons/analyzers
  - `padding-left`: 3
  - `padding-right`: 3
  - `padding-top`: 1
  - `layout`: verticalBox

### `search`

- **Klasa:** `BossTracker`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: search
  - `text`: Boss Cooldowns
  - `height`: 200
  - `icon`: /images/topbuttons/analyzers
  - `padding-left`: 3
  - `padding-right`: 3
  - `padding-top`: 1
  - `layout`: verticalBox

### `closeButton`

- **Klasa:** `FeaturesWindow`
- **Rodzic:** `MainWindow`
- **Właściwości:**
  - `id`: closeButton
  - `size`: 45 21
  - `padding`: 1
  - `text`: Rarity Frames
  - `margin-top`: 15
  - `height`: 220
  - `vertical-scrollbar`: CustomPricesScrollBar
  - `step`: 1
  - `pixels-scroll`: true
  - `margin-left`: 2
  - `width`: 100
  - `minimum`: 0
  - `maximum`: 1000000000
  - `text-align`: center
  - `focusable`: true
  - `font`: cipsoftFont
  - `margin-right`: 5
  - `margin-bottom`: 8

## Hierarchy Diagram

Zobacz: [../diagrams/analyzer.mmd](../diagrams/analyzer.mmd)

---
doc_id: "otui-ui-6b2300350cca"
source_path: "game_topbar/topbar.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: topbar.otui"
summary: "Dokumentacja interfejsu OTUI dla game_topbar/topbar.otui"
tags: ["otui", "ui", "widget"]
---

# game_topbar/topbar.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla topbar.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `box` | `StatsPanel` | `Panel` | size=150 18 |
| `skills` | `SkillPanel` | `Panel` | size=76 14 |

## Widget Details

### `box`

- **Klasa:** `StatsPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 19
  - `id`: box
  - `margin-right`: 7
  - `margin-left`: 7
  - `background-color`: #0060d5
  - `padding`: 1
  - `size`: 150 18
  - `image-source`: /images/ui/dark_background
  - `type`: horizontalBox

### `skills`

- **Klasa:** `SkillPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 6
  - `id`: skills
  - `text`: 999
  - `font`: verdana-11px-rounded
  - `text-align`: center
  - `margin-left`: 7
  - `image-source`: /images/game/topbar/boost
  - `size`: 76 14
  - `image-clip`: 0 14 76 14
  - `margin-right`: 7
  - `background-color`: #c00000
  - `border`: 1 black
  - `margin-top`: -2
  - `margin-bottom`: -2
  - `focusable`: false
  - `padding-top`: 4
  - `padding-left`: 7
  - `padding-right`: 7
  - `type`: grid
  - `fit-children`: true
  - `num-columns`: 2

## Hierarchy Diagram

Zobacz: [../diagrams/topbar.mmd](../diagrams/topbar.mmd)

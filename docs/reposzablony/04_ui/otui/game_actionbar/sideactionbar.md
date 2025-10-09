---
doc_id: "otui-ui-c21de8b2cc85"
source_path: "game_actionbar/sideactionbar.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: sideactionbar.otui"
summary: "Dokumentacja interfejsu OTUI dla game_actionbar/sideactionbar.otui"
tags: ["otui", "ui", "widget"]
---

# game_actionbar/sideactionbar.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla sideactionbar.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `cooldown` | `SideActionButton` | `UIButton` | font=verdana-11px-rounded, height=36, padding=1 |
| `image` | `TopSliders` | `Panel` | size=34 17 |
| `nextPanel` | `BottomSliders` | `Panel` | visible=false, size=34 32 |

## Widget Details

### `cooldown`

- **Klasa:** `SideActionButton`
- **Rodzic:** `UIButton`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `height`: 36
  - `padding`: 1
  - `margin-top`: 1
  - `id`: cooldown
  - `virtual`: true
  - `border-width`: 1
  - `border-color`: #00000000
  - `image-source`: /images/ui/button
  - `image-color`: #dfdfdf
  - `image-clip`: 0 46 22 23
  - `image-border`: 3
  - `text-auto-resize`: true
  - `text-wrap`: false
  - `phantom`: true
  - `text-align`: center
  - `margin`: 3 4 3 3
  - `color`: white
  - `background`: #101010aa
  - `margin-bottom`: -3
  - `margin-left`: 2
  - `margin-right`: 2
  - `percent`: 100
  - `focusable`: false

### `image`

- **Klasa:** `TopSliders`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 34 17
  - `id`: image
  - `tooltip`: Move to the first action button
  - `phantom`: true
  - `margin-left`: 1
  - `rotation`: 90
  - `image-source`: /images/game/actionbar/arrow-skip

### `nextPanel`

- **Klasa:** `BottomSliders`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 34 32
  - `id`: nextPanel
  - `height`: 17
  - `tooltip`: Move to the last action button
  - `phantom`: true
  - `margin-bottom`: 3
  - `image-source`: /images/ui/actionbar_background
  - `margin-right`: 1
  - `on`: true
  - `margin-top`: 2
  - `rotation`: 270
  - `focusable`: false
  - `image-border`: 1
  - `width`: 0
  - `visible`: false
  - `clipping`: true
  - `padding-left`: 1
  - `vertical-scrollbar`: actionScroll
  - `layout`: verticalBox
  - `step`: 37
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/sideactionbar.mmd](../diagrams/sideactionbar.mmd)

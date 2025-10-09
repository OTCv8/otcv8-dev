---
doc_id: "otui-ui-515366f4af00"
source_path: "game_actionbar/actionbar.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: actionbar.otui"
summary: "Dokumentacja interfejsu OTUI dla game_actionbar/actionbar.otui"
tags: ["otui", "ui", "widget"]
---

# game_actionbar/actionbar.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla actionbar.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `cooldown` | `ActionButton` | `UIButton` | font=verdana-11px-rounded, width=36, padding=1 |
| `image` | `LeftSliders` | `Panel` | size=17 34 |
| `nextPanel` | `RightSliders` | `Panel` | visible=false, size=29 34 |

## Widget Details

### `cooldown`

- **Klasa:** `ActionButton`
- **Rodzic:** `UIButton`
- **Właściwości:**
  - `font`: verdana-11px-rounded
  - `width`: 36
  - `padding`: 1
  - `margin-left`: 2
  - `id`: cooldown
  - `virtual`: true
  - `border-width`: 1
  - `border-color`: #00000000
  - `draggable`: true
  - `image-source`: /images/ui/button
  - `image-color`: #dfdfdf
  - `image-clip`: 0 46 22 23
  - `image-border`: 3
  - `text-auto-resize`: true
  - `text-wrap`: false
  - `phantom`: true
  - `margin`: 3 4 3 3
  - `text-align`: center
  - `color`: white
  - `background`: #101010aa
  - `margin-bottom`: -3
  - `margin-right`: 2
  - `percent`: 100
  - `focusable`: false

### `image`

- **Klasa:** `LeftSliders`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 17 34
  - `id`: image
  - `tooltip`: Move to the first action button
  - `phantom`: true
  - `image-source`: /images/game/actionbar/arrow-skip

### `nextPanel`

- **Klasa:** `RightSliders`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 29 34
  - `id`: nextPanel
  - `width`: 12
  - `tooltip`: Move to the last action button
  - `margin-right`: 1
  - `phantom`: true
  - `image-source`: /images/ui/actionbar_background
  - `on`: true
  - `margin-top`: -1
  - `margin-left`: 4
  - `rotation`: 180
  - `focusable`: false
  - `image-border`: 1
  - `height`: 0
  - `visible`: false
  - `clipping`: true
  - `padding-top`: 2
  - `padding-bottom`: 2
  - `horizontal-scrollbar`: actionScroll
  - `layout`: horizontalBox
  - `step`: 37
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/actionbar.mmd](../diagrams/actionbar.mmd)

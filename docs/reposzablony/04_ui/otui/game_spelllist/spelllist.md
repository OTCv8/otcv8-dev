---
doc_id: "otui-ui-a965a9eaa3eb"
source_path: "game_spelllist/spelllist.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: spelllist.otui"
summary: "Dokumentacja interfejsu OTUI dla game_spelllist/spelllist.otui"
tags: ["otui", "ui", "widget"]
---

# game_spelllist/spelllist.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla spelllist.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `SpellListLabel` | `SpellListLabel` | `Label` | font=verdana-11px-monochrome, background-color=#ffffff22, text-offset=42 3 |
| `SpellInfoLabel` | `SpellInfoLabel` | `Label` | width=70, font=verdana-11px-monochrome, text-align=right |
| `SpellInfoValueLabel` | `SpellInfoValueLabel` | `Label` | text-align=left, width=190, margin-left=10 |
| `premiumBoxYes` | `FilterButton` | `Button` | size=550 400 |

## Widget Details

### `SpellListLabel`

- **Klasa:** `SpellListLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `font`: verdana-11px-monochrome
  - `background-color`: #ffffff22
  - `text-offset`: 42 3
  - `focusable`: true
  - `height`: 36
  - `image-clip`: 0 0 32 32
  - `image-size`: 32 32
  - `image-offset`: 2 2
  - `image-source`: /images/game/spells/defaultspells
  - `color`: #ffffff

### `SpellInfoLabel`

- **Klasa:** `SpellInfoLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `width`: 70
  - `font`: verdana-11px-monochrome
  - `text-align`: right
  - `margin-left`: 10
  - `margin-top`: 5

### `SpellInfoValueLabel`

- **Klasa:** `SpellInfoValueLabel`
- **Rodzic:** `Label`
- **Właściwości:**
  - `text-align`: left
  - `width`: 190
  - `margin-left`: 10
  - `margin-top`: 5

### `premiumBoxYes`

- **Klasa:** `FilterButton`
- **Rodzic:** `Button`
- **Właściwości:**
  - `width`: 75
  - `margin`: 5 0 0 6
  - `color`: green
  - `id`: premiumBoxYes
  - `size`: 550 400
  - `vertical-scrollbar`: spellsScrollBar
  - `margin-bottom`: 10
  - `padding`: 1
  - `focusable`: false
  - `step`: 50
  - `pixels-scroll`: true
  - `margin-top`: 3
  - `font`: verdana-11px-monochrome
  - `margin-left`: 3

## Hierarchy Diagram

Zobacz: [../diagrams/spelllist.mmd](../diagrams/spelllist.mmd)

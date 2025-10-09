---
doc_id: "otui-ui-86950d9477cc"
source_path: "game_prey/prey.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: prey.otui"
summary: "Dokumentacja interfejsu OTUI dla game_prey/prey.otui"
tags: ["otui", "ui", "widget"]
---

# game_prey/prey.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla prey.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `shopTempButton` | `LockedPreyPanel` | `Panel` | size=195 67 |
| `Star` | `Star` | `UIWidget` | size=9 10 |
| `NoStar` | `NoStar` | `UIWidget` | size=9 10 |
| `noBonusIcon` | `NoCreaturePanel` | `Panel` | size=124 124 |
| `lockPreyPrice` | `ActivePreyPanel` | `Panel` | size=155 15 |
| `timeLeft` | `CreatureAndBonus` | `Panel` | size=124 124 |
| `price` | `BonusReroll` | `FlatPanel` | size=40 55 |
| `list` | `InactivePreyPanel` | `Panel` | size=195 195 |
| `choosePreyButton` | `ChoosePrey` | `FlatPanel` | size=55 92 |
| `price` | `SelectPreyCreature` | `FlatPanel` | size=66 66 |
| `price` | `RerollButton` | `FlatPanel` | size=66 66 |
| `text` | `CardLabel` | `FlatPanel` | padding=5, id=text, image-source=/images/game/prey/prey_wildcard |
| `text` | `GoldLabel` | `FlatPanel` | padding=5, id=text, image-source=/images/game/prey/prey_gold |
| `creature` | `PreyCreatureBox` | `UICheckBox` | border-width=1, border-color=alpha, padding=3 |
| `openStore` | `SlotPanel` | `Panel` | visible=false, size=20 20 |
| `time` | `PreyCreature` | `Panel` | size=15 15 |
| `slot3` | `PreyTracker` | `MiniWindow` | id=slot3, height=95, icon=/images/topbuttons/prey |

## Widget Details

### `shopTempButton`

- **Klasa:** `LockedPreyPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 195 67
  - `id`: shopTempButton
  - `height`: 64
  - `background-color`: #1c4161
  - `margin-top`: 7
  - `image-source`: /images/game/prey/prey_temp_test
  - `image-clip`: 0 67 204 67

### `Star`

- **Klasa:** `Star`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `size`: 9 10
  - `image-source`: /images/game/prey/prey_star

### `NoStar`

- **Klasa:** `NoStar`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `size`: 9 10
  - `image-source`: /images/game/prey/prey_nostar

### `noBonusIcon`

- **Klasa:** `NoCreaturePanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 124 124
  - `image-source`: /images/game/prey/prey_bignobonus
  - `image-border`: 1
  - `phantom`: true
  - `id`: noBonusIcon
  - `margin-left`: 10
  - `margin-top`: 5
  - `margin-right`: 10
  - `padding-left`: 5
  - `type`: grid
  - `cell-size`: 9 10
  - `cell-spacing`: 2
  - `num-columns`: 5
  - `height`: 20
  - `background-color`: #262626
  - `border`: 1 black

### `lockPreyPrice`

- **Klasa:** `ActivePreyPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 155 15
  - `id`: lockPreyPrice
  - `margin-top`: 2
  - `margin-right`: 2
  - `image-source`: /images/ui/panel_flat
  - `image-border`: 1
  - `font`: verdana-11px-rounded
  - `text`: Lock Prey
  - `margin-left`: 2

### `timeLeft`

- **Klasa:** `CreatureAndBonus`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 124 124
  - `id`: timeLeft
  - `phantom`: true
  - `image-source`: /images/game/prey/prey_bignobonus
  - `image-border`: 1
  - `padding`: 5
  - `margin-left`: 10
  - `margin-top`: 5
  - `margin-right`: 10
  - `padding-left`: 5
  - `type`: grid
  - `cell-size`: 9 10
  - `cell-spacing`: 2
  - `num-columns`: 5
  - `height`: 20
  - `background-color`: #C28400

### `price`

- **Klasa:** `BonusReroll`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 2
  - `size`: 40 55
  - `id`: price
  - `margin-top`: 2
  - `image-source`: /images/game/prey/prey_bonus_reroll
  - `image-clip`: 0 52 37 54
  - `height`: 21

### `list`

- **Klasa:** `InactivePreyPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 195 195
  - `id`: list
  - `margin-right`: 2
  - `margin-top`: 20
  - `padding-left`: 4
  - `padding-top`: 4
  - `type`: grid
  - `cell-size`: 60 60
  - `cell-spacing`: 3
  - `num-columns`: 3

### `choosePreyButton`

- **Klasa:** `ChoosePrey`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `size`: 55 92
  - `padding`: 10
  - `id`: choosePreyButton
  - `margin-bottom`: 17
  - `margin-top`: 17
  - `margin-left`: 3
  - `image-source`: /images/game/prey/prey_choose
  - `image-clip`: 0 35 45 37

### `price`

- **Klasa:** `SelectPreyCreature`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 2
  - `size`: 66 66
  - `id`: price
  - `image-source`: /images/game/prey/prey_select_blocked
  - `margin-top`: 2

### `price`

- **Klasa:** `RerollButton`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 2
  - `size`: 66 66
  - `id`: price
  - `height`: 15
  - `text-align`: center
  - `background-color`: #C28400
  - `image-source`: /images/game/prey/prey_reroll
  - `image-clip`: 0 46 60 47
  - `margin-top`: 2

### `text`

- **Klasa:** `CardLabel`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 5
  - `id`: text
  - `image-source`: /images/game/prey/prey_wildcard
  - `tooltip`: Prey Wildcards
  - `margin-right`: 5
  - `text-align`: right

### `text`

- **Klasa:** `GoldLabel`
- **Rodzic:** `FlatPanel`
- **Właściwości:**
  - `padding`: 5
  - `id`: text
  - `image-source`: /images/game/prey/prey_gold
  - `tooltip`: Gold Coins
  - `margin-right`: 5
  - `text-align`: right

### `creature`

- **Klasa:** `PreyCreatureBox`
- **Rodzic:** `UICheckBox`
- **Właściwości:**
  - `border-width`: 1
  - `border-color`: alpha
  - `padding`: 3
  - `id`: creature
  - `phantom`: true
  - `image-color`: #ffffff88
  - `margin-top`: 3
  - `color`: #aaaaaa88

### `openStore`

- **Klasa:** `SlotPanel`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `size`: 20 20
  - `image-source`: /images/topbuttons/shop
  - `image-border`: 25
  - `padding-top`: 2
  - `padding-bottom`: 6
  - `padding-left`: 8
  - `padding-right`: 8
  - `id`: openStore
  - `text-align`: center
  - `visible`: false
  - `margin-top`: 10
  - `padding`: 20
  - `margin-left`: 10
  - `margin-bottom`: 10
  - `text-wrap`: true
  - `text`: Close
  - `font`: cipsoftFont
  - `tooltip`: Go to the Store to get more Prey Wildcards!
  - `image-clip`: 0 20 20 20
  - `background-color`: #17354e

### `time`

- **Klasa:** `PreyCreature`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 6
  - `margin-top`: 3
  - `id`: time
  - `size`: 15 15
  - `image-source`: /images/game/prey/prey_inactive
  - `margin-left`: 5
  - `margin-bottom`: 2
  - `text`: Inactive
  - `font`: verdana-11px-rounded
  - `text-align`: left
  - `background-color`: #C28400
  - `phantom`: false

### `slot3`

- **Klasa:** `PreyTracker`
- **Rodzic:** `MiniWindow`
- **Właściwości:**
  - `id`: slot3
  - `height`: 95
  - `icon`: /images/topbuttons/prey
  - `padding-left`: 5
  - `padding-right`: 5
  - `padding-top`: 5
  - `layout`: verticalBox
  - `font`: verdana-11px-rounded
  - `margin-top`: 5

## Hierarchy Diagram

Zobacz: [../diagrams/prey.mmd](../diagrams/prey.mmd)

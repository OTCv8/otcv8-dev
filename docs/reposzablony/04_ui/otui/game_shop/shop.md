---
doc_id: "otui-ui-b060d7eb844d"
source_path: "game_shop/shop.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: shop.otui"
summary: "Dokumentacja interfejsu OTUI dla game_shop/shop.otui"
tags: ["otui", "ui", "widget"]
---

# game_shop/shop.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla shop.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `name` | `ShopCategory` | `Panel` | height=36, focusable=true, background=#99999999 |
| `item` | `ShopCategoryItem` | `ShopCategory` | size=32 32 |
| `creature` | `ShopCategoryCreature` | `ShopCategory` | size=32 32 |
| `image` | `ShopCategoryImage` | `ShopCategory` | size=32 32 |
| `buyButton` | `ShopOffer` | `Panel` | height=25, background=#99999999, id=buyButton |
| `item` | `ShopOfferItem` | `ShopOffer` | size=48 48 |
| `creature` | `ShopOfferCreature` | `ShopOffer` | size=48 48 |
| `buttonCancel` | `ShopOfferImage` | `ShopOffer` | visible=false, size=500 360 |

## Widget Details

### `name`

- **Klasa:** `ShopCategory`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 36
  - `focusable`: true
  - `background`: #99999999
  - `id`: name
  - `margin-left`: 40
  - `text-align`: left
  - `color`: white
  - `font`: verdana-11px-rounded

### `item`

- **Klasa:** `ShopCategoryItem`
- **Rodzic:** `ShopCategory`
- **Właściwości:**
  - `id`: item
  - `margin-top`: 2
  - `margin-bottom`: 2
  - `margin-left`: 2
  - `virtual`: true
  - `size`: 32 32

### `creature`

- **Klasa:** `ShopCategoryCreature`
- **Rodzic:** `ShopCategory`
- **Właściwości:**
  - `id`: creature
  - `margin-top`: 2
  - `margin-bottom`: 2
  - `margin-left`: 2
  - `size`: 32 32

### `image`

- **Klasa:** `ShopCategoryImage`
- **Rodzic:** `ShopCategory`
- **Właściwości:**
  - `id`: image
  - `margin-top`: 2
  - `margin-bottom`: 2
  - `margin-left`: 2
  - `size`: 32 32

### `buyButton`

- **Klasa:** `ShopOffer`
- **Rodzic:** `Panel`
- **Właściwości:**
  - `height`: 25
  - `background`: #99999999
  - `id`: buyButton
  - `margin-top`: 4
  - `margin-left`: 55
  - `text-align`: center
  - `color`: white
  - `font`: verdana-11px-rounded
  - `margin-right`: 15
  - `text-auto-resize`: true
  - `text-wrap`: true
  - `text`: BUY

### `item`

- **Klasa:** `ShopOfferItem`
- **Rodzic:** `ShopOffer`
- **Właściwości:**
  - `id`: item
  - `margin-top`: 4
  - `margin-bottom`: 4
  - `margin-left`: 2
  - `virtual`: true
  - `size`: 48 48

### `creature`

- **Klasa:** `ShopOfferCreature`
- **Rodzic:** `ShopOffer`
- **Właściwości:**
  - `id`: creature
  - `margin-top`: 4
  - `margin-bottom`: 4
  - `margin-left`: 2
  - `size`: 48 48

### `buttonCancel`

- **Klasa:** `ShopOfferImage`
- **Rodzic:** `ShopOffer`
- **Właściwości:**
  - `id`: buttonCancel
  - `margin-top`: 10
  - `margin-bottom`: 10
  - `margin-left`: 10
  - `size`: 500 360
  - `width`: 64
  - `height`: 0
  - `text`: -
  - `text-auto-resize`: true
  - `visible`: false
  - `text-wrap`: true
  - `text-align`: center
  - `font`: sans-bold-16px
  - `vertical-scrollbar`: offersScrollBar
  - `padding`: 1
  - `focusable`: false
  - `step`: 50
  - `pixels-scroll`: true

## Hierarchy Diagram

Zobacz: [../diagrams/shop.mmd](../diagrams/shop.mmd)

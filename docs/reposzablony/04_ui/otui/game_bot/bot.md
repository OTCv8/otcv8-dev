---
doc_id: "otui-ui-879f0269ff1a"
source_path: "game_bot/bot.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: bot.otui"
summary: "Dokumentacja interfejsu OTUI dla game_bot/bot.otui"
tags: ["otui", "ui", "widget"]
---

# game_bot/bot.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla bot.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `BotTabBar` | `BotTabBar` | `TabBar` | visible=false |
| `botPanel` | `BotTabBarPanel` | `TabBarPanel` | padding=4, padding-right=5, text-horizontal-auto-resize=true |
| `botPanel` | `BotTabBarButton` | `TabBarButton` | padding=4, padding-right=5, text-horizontal-auto-resize=true |

## Widget Details

### `BotTabBar`

- **Klasa:** `BotTabBar`
- **Rodzic:** `TabBar`
- **Właściwości:**
  - `tab-spacing`: 1
  - `margin-left`: 1
  - `margin-right`: 1
  - `height`: 20
  - `visible`: false
  - `margin-top`: -20

### `botPanel`

- **Klasa:** `BotTabBarPanel`
- **Rodzic:** `TabBarPanel`
- **Właściwości:**
  - `padding`: 4
  - `padding-right`: 5
  - `text-horizontal-auto-resize`: true
  - `margin-left`: 2
  - `id`: botPanel
  - `height`: 600
  - `icon`: /images/topbuttons/bot
  - `margin-top`: 2
  - `margin-right`: -20
  - `text-offset`: 3 0
  - `text`: Off
  - `color`: #FF0000
  - `text-wrap`: true
  - `text-auto-resize`: true
  - `text-align`: center
  - `type`: verticalBox
  - `fit-children`: true

### `botPanel`

- **Klasa:** `BotTabBarButton`
- **Rodzic:** `TabBarButton`
- **Właściwości:**
  - `padding`: 4
  - `padding-right`: 5
  - `text-horizontal-auto-resize`: true
  - `margin-left`: 2
  - `id`: botPanel
  - `height`: 600
  - `icon`: /images/topbuttons/bot
  - `margin-top`: 2
  - `margin-right`: -20
  - `text-offset`: 3 0
  - `text`: Off
  - `color`: #FF0000
  - `text-wrap`: true
  - `text-auto-resize`: true
  - `text-align`: center
  - `type`: verticalBox
  - `fit-children`: true

## Hierarchy Diagram

Zobacz: [../diagrams/bot.mmd](../diagrams/bot.mmd)

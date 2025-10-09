---
doc_id: "otui-ui-1fb449d4d552"
source_path: "game_cooldown/cooldown.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: cooldown.otui"
summary: "Dokumentacja interfejsu OTUI dla game_cooldown/cooldown.otui"
tags: ["otui", "ui", "widget"]
---

# game_cooldown/cooldown.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla cooldown.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `SpellGroupIcon` | `SpellGroupIcon` | `UIWidget` | size=22 22 |
| `SpellIcon` | `SpellIcon` | `UIWidget` | size=24 24 |
| `SpellProgressRect` | `SpellProgressRect` | `UIProgressRect` | background=#585858AA, percent=100, focusable=false |
| `cooldownPanel` | `GroupCooldownParticles` | `UIParticles` | effect=groupcooldown-effect, id=cooldownPanel, height=30 |

## Widget Details

### `SpellGroupIcon`

- **Klasa:** `SpellGroupIcon`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `size`: 22 22
  - `image-size`: 22 22
  - `image-source`: /images/game/spells/cooldowns
  - `focusable`: false
  - `margin-top`: 3

### `SpellIcon`

- **Klasa:** `SpellIcon`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `size`: 24 24
  - `image-size`: 24 24
  - `focusable`: false
  - `margin-left`: 1

### `SpellProgressRect`

- **Klasa:** `SpellProgressRect`
- **Rodzic:** `UIProgressRect`
- **Właściwości:**
  - `background`: #585858AA
  - `percent`: 100
  - `focusable`: false

### `cooldownPanel`

- **Klasa:** `GroupCooldownParticles`
- **Rodzic:** `UIParticles`
- **Właściwości:**
  - `effect`: groupcooldown-effect
  - `id`: cooldownPanel
  - `height`: 30
  - `icon`: /images/topbuttons/cooldowns
  - `image-clip`: 60 20 20 20
  - `margin-left`: 3
  - `type`: horizontalBox
  - `margin-top`: 3
  - `padding`: 3
  - `background-color`: #00000022

## Hierarchy Diagram

Zobacz: [../diagrams/cooldown.mmd](../diagrams/cooldown.mmd)

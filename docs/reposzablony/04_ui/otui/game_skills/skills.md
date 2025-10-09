---
doc_id: "otui-ui-8c399d851c2b"
source_path: "game_skills/skills.otui"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:14Z"
doc_class: "ui"
language: "pl"
title: "UI: skills.otui"
summary: "Dokumentacja interfejsu OTUI dla game_skills/skills.otui"
tags: ["otui", "ui", "widget"]
---

# game_skills/skills.otui

## Overview

Plik OTUI definiujący interfejs użytkownika dla skills.

## Widgets

| ID | Class | Parent | Key Properties |
|----|-------|--------|----------------|
| `SkillFirstWidget` | `SkillFirstWidget` | `UIWidget` | height=21, margin-bottom=2 |
| `SkillButton` | `SkillButton` | `UIButton` | height=21, margin-bottom=2 |
| `SmallSkillButton` | `SmallSkillButton` | `SkillButton` | height=14 |
| `SkillNameLabel` | `SkillNameLabel` | `GameLabel` | font=verdana-11px-monochrome |
| `value` | `SkillValueLabel` | `GameLabel` | id=value, font=verdana-11px-monochrome, text-align=topright |
| `skillId12` | `SkillPercentPanel` | `ProgressBar` | id=skillId12, background-color=red, height=15 |

## Widget Details

### `SkillFirstWidget`

- **Klasa:** `SkillFirstWidget`
- **Rodzic:** `UIWidget`
- **Właściwości:**
  - `height`: 21
  - `margin-bottom`: 2

### `SkillButton`

- **Klasa:** `SkillButton`
- **Rodzic:** `UIButton`
- **Właściwości:**
  - `height`: 21
  - `margin-bottom`: 2

### `SmallSkillButton`

- **Klasa:** `SmallSkillButton`
- **Rodzic:** `SkillButton`
- **Właściwości:**
  - `height`: 14

### `SkillNameLabel`

- **Klasa:** `SkillNameLabel`
- **Rodzic:** `GameLabel`
- **Właściwości:**
  - `font`: verdana-11px-monochrome

### `value`

- **Klasa:** `SkillValueLabel`
- **Rodzic:** `GameLabel`
- **Właściwości:**
  - `id`: value
  - `font`: verdana-11px-monochrome
  - `text-align`: topright

### `skillId12`

- **Klasa:** `SkillPercentPanel`
- **Rodzic:** `ProgressBar`
- **Właściwości:**
  - `id`: skillId12
  - `background-color`: red
  - `height`: 15
  - `margin-top`: 5
  - `phantom`: false
  - `icon`: /images/topbuttons/skills
  - `padding-left`: 5
  - `padding-right`: 5
  - `layout`: verticalBox

## Hierarchy Diagram

Zobacz: [../diagrams/skills.mmd](../diagrams/skills.mmd)

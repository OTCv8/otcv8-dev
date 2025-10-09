---
doc_id: "cpp-api-ff402587d5ef"
source_path: "client/statictext.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: statictext.h"
summary: "Dokumentacja API C++ dla client/statictext.h"
tags: ["cpp", "api", "otclient"]
---

# client/statictext.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu statictext.

## Classes/Structs

### Struktura: `StaticTextMessage`

### Klasa: `StaticText`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawText` |  | `void drawText(const Point& dest, const Rect& parentRect)` |
| `getName` |  | `std::string getName() { return m_name; }` |
| `getText` |  | `std::string getText() { return m_cachedText.getText(); }` |
| `getMessageMode` |  | `Otc::MessageMode getMessageMode() { return m_mode; }` |
| `getFirstMessage` |  | `std::vector<std::string> getFirstMessage() { return m_messages[0].texts; }` |
| `isYell` |  | `bool isYell() { return m_mode == Otc::MessageYell \|\| m_mode == Otc::MessageMonsterYell \|\| m_mode == Otc::MessageBarkLoud; }` |
| `setText` |  | `void setText(const std::string& text)` |
| `setFont` |  | `void setFont(const std::string& fontName)` |
| `addMessage` |  | `bool addMessage(const std::string& name, Otc::MessageMode mode, const std::string& text)` |
| `addColoredMessage` |  | `bool addColoredMessage(const std::string& name, Otc::MessageMode mode, const std::vector<std::string>& texts)` |
| `asStaticText` |  | `StaticTextPtr asStaticText() { return static_self_cast<StaticText>(); }` |
| `isStaticText` |  | `bool isStaticText() { return true; }` |
| `setColor` |  | `void setColor(const Color& color) { m_color = color; }` |
| `getColor` |  | `Color getColor() { return m_color; }` |
| `hasText` |  | `bool hasText() { return m_cachedText.hasText(); }` |

## Functions

### `drawText`

**Sygnatura:** `void drawText(const Point& dest, const Rect& parentRect)`

### `getName`

**Sygnatura:** `std::string getName() { return m_name; }`

### `getText`

**Sygnatura:** `std::string getText() { return m_cachedText.getText(); }`

### `getMessageMode`

**Sygnatura:** `Otc::MessageMode getMessageMode() { return m_mode; }`

### `getFirstMessage`

**Sygnatura:** `std::vector<std::string> getFirstMessage() { return m_messages[0].texts; }`

### `isYell`

**Sygnatura:** `bool isYell() { return m_mode == Otc::MessageYell || m_mode == Otc::MessageMonsterYell || m_mode == Otc::MessageBarkLoud; }`

### `setText`

**Sygnatura:** `void setText(const std::string& text)`

### `setFont`

**Sygnatura:** `void setFont(const std::string& fontName)`

### `addMessage`

**Sygnatura:** `bool addMessage(const std::string& name, Otc::MessageMode mode, const std::string& text)`

### `addColoredMessage`

**Sygnatura:** `bool addColoredMessage(const std::string& name, Otc::MessageMode mode, const std::vector<std::string>& texts)`

### `asStaticText`

**Sygnatura:** `StaticTextPtr asStaticText() { return static_self_cast<StaticText>(); }`

### `isStaticText`

**Sygnatura:** `bool isStaticText() { return true; }`

### `setColor`

**Sygnatura:** `void setColor(const Color& color) { m_color = color; }`

### `getColor`

**Sygnatura:** `Color getColor() { return m_color; }`

### `hasText`

**Sygnatura:** `bool hasText() { return m_cachedText.hasText(); }`

### `update`

**Sygnatura:** `void update()`

### `scheduleUpdate`

**Sygnatura:** `void scheduleUpdate()`

### `compose`

**Sygnatura:** `void compose()`

## Class Diagram

Zobacz: [../diagrams/statictext.mmd](../diagrams/statictext.mmd)

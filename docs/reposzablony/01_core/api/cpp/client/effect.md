---
doc_id: "cpp-api-5c4bc2839124"
source_path: "client/effect.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: effect.h"
summary: "Dokumentacja API C++ dla client/effect.h"
tags: ["cpp", "api", "otclient"]
---

# client/effect.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu effect.

## Classes/Structs

### Klasa: `Effect`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr) override {}` |
| `draw` |  | `void draw(const Point& dest, int offsetX = 0, int offsetY = 0, bool animate = true, LightView* lightView = nullptr)` |
| `setId` |  | `void setId(uint32 id) override` |
| `getId` |  | `uint32 getId() override { return m_id; }` |
| `asEffect` |  | `EffectPtr asEffect() { return static_self_cast<Effect>(); }` |
| `isEffect` |  | `bool isEffect() override { return true; }` |
| `onAppear` |  | `void onAppear() override` |

## Functions

### `draw`

**Sygnatura:** `void draw(const Point& dest, bool animate = true, LightView* lightView = nullptr) override {}`

### `draw`

**Sygnatura:** `void draw(const Point& dest, int offsetX = 0, int offsetY = 0, bool animate = true, LightView* lightView = nullptr)`

### `setId`

**Sygnatura:** `void setId(uint32 id) override`

### `getId`

**Sygnatura:** `uint32 getId() override { return m_id; }`

### `asEffect`

**Sygnatura:** `EffectPtr asEffect() { return static_self_cast<Effect>(); }`

### `isEffect`

**Sygnatura:** `bool isEffect() override { return true; }`

### `onAppear`

**Sygnatura:** `void onAppear() override`

## Class Diagram

Zobacz: [../diagrams/effect.mmd](../diagrams/effect.mmd)

---
doc_id: "cpp-api-1ab6cf745173"
source_path: "client/healthbars.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: healthbars.h"
summary: "Dokumentacja API C++ dla client/healthbars.h"
tags: ["cpp", "api", "otclient"]
---

# client/healthbars.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu healthbars.

## Classes/Structs

### Klasa: `HealthBar`

| Member | Brief | Signature |
|--------|-------|-----------|
| `setPath` |  | `void setPath(const std::string& path) {` |
| `getPath` |  | `std::string getPath() { return m_path; }` |
| `setTexture` |  | `void setTexture(const std::string& path)` |
| `getTexture` |  | `TexturePtr getTexture() { return m_texture; }` |
| `setOffset` |  | `void setOffset(int x, int y) {` |
| `getOffset` |  | `Point getOffset() { return m_offset; }` |
| `setBarOffset` |  | `void setBarOffset(int x, int y) {` |
| `getBarOffset` |  | `Point getBarOffset() { return m_barOffset; }` |
| `setHeight` |  | `void setHeight(int height) {` |
| `getHeight` |  | `int getHeight() { return m_height; }` |

### Klasa: `HealthBars`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `addHealthBackground` |  | `void addHealthBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height)` |
| `addManaBackground` |  | `void addManaBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height)` |
| `getHealthBar` |  | `HealthBarPtr getHealthBar(int id) { return m_healthBars[id]; }` |
| `getManaBar` |  | `HealthBarPtr getManaBar(int id) { return m_manaBars[id]; }` |
| `getHealthBarPath` |  | `std::string getHealthBarPath(int id)` |
| `getManaBarPath` |  | `std::string getManaBarPath(int id)` |
| `getHealthBarOffset` |  | `Point getHealthBarOffset(int id)` |
| `getManaBarOffset` |  | `Point getManaBarOffset(int id)` |
| `getHealthBarOffsetBar` |  | `Point getHealthBarOffsetBar(int id)` |
| `getManaBarOffsetBar` |  | `Point getManaBarOffsetBar(int id)` |
| `getHealthBarHeight` |  | `int getHealthBarHeight(int id)` |
| `getManaBarHeight` |  | `int getManaBarHeight(int id)` |

## Functions

### `setPath`

**Sygnatura:** `void setPath(const std::string& path) {`

### `getPath`

**Sygnatura:** `std::string getPath() { return m_path; }`

### `setTexture`

**Sygnatura:** `void setTexture(const std::string& path)`

### `getTexture`

**Sygnatura:** `TexturePtr getTexture() { return m_texture; }`

### `setOffset`

**Sygnatura:** `void setOffset(int x, int y) {`

### `getOffset`

**Sygnatura:** `Point getOffset() { return m_offset; }`

### `setBarOffset`

**Sygnatura:** `void setBarOffset(int x, int y) {`

### `getBarOffset`

**Sygnatura:** `Point getBarOffset() { return m_barOffset; }`

### `setHeight`

**Sygnatura:** `void setHeight(int height) {`

### `getHeight`

**Sygnatura:** `int getHeight() { return m_height; }`

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `addHealthBackground`

**Sygnatura:** `void addHealthBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height)`

### `addManaBackground`

**Sygnatura:** `void addManaBackground(const std::string& path, int offsetX, int offsetY, int barOffsetX, int barOffsetY, int height)`

### `getHealthBar`

**Sygnatura:** `HealthBarPtr getHealthBar(int id) { return m_healthBars[id]; }`

### `getManaBar`

**Sygnatura:** `HealthBarPtr getManaBar(int id) { return m_manaBars[id]; }`

### `getHealthBarPath`

**Sygnatura:** `std::string getHealthBarPath(int id)`

### `getManaBarPath`

**Sygnatura:** `std::string getManaBarPath(int id)`

### `getHealthBarOffset`

**Sygnatura:** `Point getHealthBarOffset(int id)`

### `getManaBarOffset`

**Sygnatura:** `Point getManaBarOffset(int id)`

### `getHealthBarOffsetBar`

**Sygnatura:** `Point getHealthBarOffsetBar(int id)`

### `getManaBarOffsetBar`

**Sygnatura:** `Point getManaBarOffsetBar(int id)`

### `getHealthBarHeight`

**Sygnatura:** `int getHealthBarHeight(int id)`

### `getManaBarHeight`

**Sygnatura:** `int getManaBarHeight(int id)`

## Class Diagram

Zobacz: [../diagrams/healthbars.mmd](../diagrams/healthbars.mmd)

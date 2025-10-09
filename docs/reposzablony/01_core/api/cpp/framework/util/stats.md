---
doc_id: "cpp-api-dc34061c9228"
source_path: "framework/util/stats.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: stats.h"
summary: "Dokumentacja API C++ dla framework/util/stats.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/stats.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu stats.

## Classes/Structs

### Struktura: `Stat`

### Struktura: `StatsData`

### Klasa: `UIWidget`

| Member | Brief | Signature |
|--------|-------|-----------|
| `add` |  | `void add(int type, Stat* stats)` |
| `get` |  | `std::string get(int type, int limit, bool pretty)` |
| `clear` |  | `void clear(int type)` |
| `clearAll` |  | `void clearAll()` |
| `getSlow` |  | `std::string getSlow(int type, int limit, unsigned int minTime, bool pretty)` |
| `clearSlow` |  | `void clearSlow(int type)` |
| `types` |  | `int types() { return STATS_LAST + 1; }` |
| `getSleepTime` |  | `int64_t getSleepTime() {` |
| `m_sleepTime` |  | `return m_sleepTime` |
| `resetSleepTime` |  | `void resetSleepTime() {` |
| `m_sleepTime` |  | `int64_t m_sleepTime = 0` |
| `addWidget` |  | `void addWidget(UIWidget* widget)` |
| `removeWidget` |  | `void removeWidget(UIWidget* widget)` |
| `getWidgetsInfo` |  | `std::string getWidgetsInfo(int limit, bool pretty)` |
| `addTexture` |  | `inline void addTexture() { createdTextures += 1; }` |
| `removeTexture` |  | `inline void removeTexture() { destroyedTextures += 1; }` |
| `addThing` |  | `inline void addThing() { createdThings += 1; }` |
| `removeThing` |  | `inline void removeThing() { destroyedThings += 1; }` |
| `addCreature` |  | `inline void addCreature() { createdCreatures += 1; }` |
| `removeCreature` |  | `inline void removeCreature() { destroyedCreatures += 1; }` |

### Klasa: `Stats`

### Klasa: `AutoStat`

## Enums

### `StatsTypes`

**Wartości:**

- `STATS_FIRST`
- `STATS_GENERAL`
- `STATS_MAIN`
- `STATS_RENDER`
- `STATS_DISPATCHER`
- `STATS_LUA`
- `STATS_LUACALLBACK`
- `STATS_PACKETS`
- `STATS_LAST`

## Functions

### `add`

**Sygnatura:** `void add(int type, Stat* stats)`

### `get`

**Sygnatura:** `std::string get(int type, int limit, bool pretty)`

### `clear`

**Sygnatura:** `void clear(int type)`

### `clearAll`

**Sygnatura:** `void clearAll()`

### `getSlow`

**Sygnatura:** `std::string getSlow(int type, int limit, unsigned int minTime, bool pretty)`

### `clearSlow`

**Sygnatura:** `void clearSlow(int type)`

### `types`

**Sygnatura:** `int types() { return STATS_LAST + 1; }`

### `getSleepTime`

**Sygnatura:** `int64_t getSleepTime() {`

### `resetSleepTime`

**Sygnatura:** `void resetSleepTime() {`

### `addWidget`

**Sygnatura:** `void addWidget(UIWidget* widget)`

### `removeWidget`

**Sygnatura:** `void removeWidget(UIWidget* widget)`

### `getWidgetsInfo`

**Sygnatura:** `std::string getWidgetsInfo(int limit, bool pretty)`

### `addTexture`

**Sygnatura:** `inline void addTexture() { createdTextures += 1; }`

### `removeTexture`

**Sygnatura:** `inline void removeTexture() { destroyedTextures += 1; }`

### `addThing`

**Sygnatura:** `inline void addThing() { createdThings += 1; }`

### `removeThing`

**Sygnatura:** `inline void removeThing() { destroyedThings += 1; }`

### `addCreature`

**Sygnatura:** `inline void addCreature() { createdCreatures += 1; }`

### `removeCreature`

**Sygnatura:** `inline void removeCreature() { destroyedCreatures += 1; }`

## Types/Aliases

### `StatsMap`

**Using:** `std::unordered_map<std::string, StatsData>`

### `StatsList`

**Using:** `std::list<Stat*>`

## Class Diagram

Zobacz: [../diagrams/stats.mmd](../diagrams/stats.mmd)

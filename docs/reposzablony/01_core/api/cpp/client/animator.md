---
doc_id: "cpp-api-58794ac7b292"
source_path: "client/animator.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: animator.h"
summary: "Dokumentacja API C++ dla client/animator.h"
tags: ["cpp", "api", "otclient"]
---

# client/animator.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu animator.

## Classes/Structs

### Klasa: `Animator`

| Member | Brief | Signature |
|--------|-------|-----------|
| `unserialize` |  | `void unserialize(int animationPhases, const FileStreamPtr& fin)` |
| `serialize` |  | `void serialize(const FileStreamPtr& fin)` |
| `setPhase` |  | `void setPhase(int phase)` |
| `getPhase` |  | `int getPhase()` |
| `getPhaseAt` |  | `int getPhaseAt(Timer& timer, int lastPhase = 0)` |
| `getStartPhase` |  | `int getStartPhase()` |
| `getAnimationPhases` |  | `int getAnimationPhases() { return m_animationPhases; }` |
| `isAsync` |  | `bool isAsync() { return m_async; }` |
| `isComplete` |  | `bool isComplete() { return m_isComplete; }` |
| `getTotalDuration` |  | `ticks_t getTotalDuration()` |
| `resetAnimation` |  | `void resetAnimation()` |

## Enums

### `AnimationPhase`

**Wartości:**

- `AnimPhaseAutomatic`
- `AnimPhaseRandom`
- `AnimPhaseAsync`

### `AnimationDirection`

**Wartości:**

- `AnimDirForward`
- `AnimDirBackward`

## Functions

### `unserialize`

**Sygnatura:** `void unserialize(int animationPhases, const FileStreamPtr& fin)`

### `serialize`

**Sygnatura:** `void serialize(const FileStreamPtr& fin)`

### `setPhase`

**Sygnatura:** `void setPhase(int phase)`

### `getPhase`

**Sygnatura:** `int getPhase()`

### `getPhaseAt`

**Sygnatura:** `int getPhaseAt(Timer& timer, int lastPhase = 0)`

### `getStartPhase`

**Sygnatura:** `int getStartPhase()`

### `getAnimationPhases`

**Sygnatura:** `int getAnimationPhases() { return m_animationPhases; }`

### `isAsync`

**Sygnatura:** `bool isAsync() { return m_async; }`

### `isComplete`

**Sygnatura:** `bool isComplete() { return m_isComplete; }`

### `getTotalDuration`

**Sygnatura:** `ticks_t getTotalDuration()`

### `resetAnimation`

**Sygnatura:** `void resetAnimation()`

### `getPingPongPhase`

**Sygnatura:** `int getPingPongPhase()`

### `getLoopPhase`

**Sygnatura:** `int getLoopPhase()`

### `getPhaseDuration`

**Sygnatura:** `int getPhaseDuration(int phase)`

### `calculateSynchronous`

**Sygnatura:** `void calculateSynchronous()`

## Class Diagram

Zobacz: [../diagrams/animator.mmd](../diagrams/animator.mmd)

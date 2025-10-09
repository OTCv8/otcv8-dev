---
doc_id: "cpp-api-f602cd571b52"
source_path: "framework/sound/combinedsoundsource.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: combinedsoundsource.h"
summary: "Dokumentacja API C++ dla framework/sound/combinedsoundsource.h"
tags: ["cpp", "api", "otclient"]
---

# framework/sound/combinedsoundsource.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu combinedsoundsource.

## Classes/Structs

### Klasa: `CombinedSoundSource`

| Member | Brief | Signature |
|--------|-------|-----------|
| `addSource` |  | `void addSource(const SoundSourcePtr& source)` |
| `getSources` |  | `std::vector<SoundSourcePtr> getSources() { return m_sources; }` |
| `play` |  | `void play()` |
| `stop` |  | `void stop()` |
| `isBuffering` |  | `bool isBuffering()` |
| `isPlaying` |  | `bool isPlaying()` |
| `setLooping` |  | `void setLooping(bool looping)` |
| `setRelative` |  | `void setRelative(bool relative)` |
| `setReferenceDistance` |  | `void setReferenceDistance(float distance)` |
| `setGain` |  | `void setGain(float gain)` |
| `setPitch` |  | `void setPitch(float pitch)` |
| `setPosition` |  | `void setPosition(const Point& pos)` |
| `setVelocity` |  | `void setVelocity(const Point& velocity)` |
| `setFading` |  | `void setFading(FadeState state, float fadetime)` |
| `update` |  | `virtual void update()` |

## Functions

### `addSource`

**Sygnatura:** `void addSource(const SoundSourcePtr& source)`

### `getSources`

**Sygnatura:** `std::vector<SoundSourcePtr> getSources() { return m_sources; }`

### `play`

**Sygnatura:** `void play()`

### `stop`

**Sygnatura:** `void stop()`

### `isBuffering`

**Sygnatura:** `bool isBuffering()`

### `isPlaying`

**Sygnatura:** `bool isPlaying()`

### `setLooping`

**Sygnatura:** `void setLooping(bool looping)`

### `setRelative`

**Sygnatura:** `void setRelative(bool relative)`

### `setReferenceDistance`

**Sygnatura:** `void setReferenceDistance(float distance)`

### `setGain`

**Sygnatura:** `void setGain(float gain)`

### `setPitch`

**Sygnatura:** `void setPitch(float pitch)`

### `setPosition`

**Sygnatura:** `void setPosition(const Point& pos)`

### `setVelocity`

**Sygnatura:** `void setVelocity(const Point& velocity)`

### `setFading`

**Sygnatura:** `void setFading(FadeState state, float fadetime)`

## Class Diagram

Zobacz: [../diagrams/combinedsoundsource.mmd](../diagrams/combinedsoundsource.mmd)

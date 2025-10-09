---
doc_id: "cpp-api-203ef9529599"
source_path: "framework/sound/streamsoundsource.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: streamsoundsource.h"
summary: "Dokumentacja API C++ dla framework/sound/streamsoundsource.h"
tags: ["cpp", "api", "otclient"]
---

# framework/sound/streamsoundsource.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu streamsoundsource.

## Classes/Structs

### Klasa: `StreamSoundSource`

| Member | Brief | Signature |
|--------|-------|-----------|
| `play` |  | `void play()` |
| `stop` |  | `void stop()` |
| `isPlaying` |  | `bool isPlaying() { return m_playing; }` |
| `setSoundFile` |  | `void setSoundFile(const SoundFilePtr& soundFile)` |
| `downMix` |  | `void downMix(DownMix downMix)` |
| `update` |  | `void update()` |

## Enums

### `DownMix`

**Wartości:**

- `StreamSoundSource`
- `virtual`
- `void`
- `void`

## Functions

### `play`

**Sygnatura:** `void play()`

### `stop`

**Sygnatura:** `void stop()`

### `isPlaying`

**Sygnatura:** `bool isPlaying() { return m_playing; }`

### `setSoundFile`

**Sygnatura:** `void setSoundFile(const SoundFilePtr& soundFile)`

### `downMix`

**Sygnatura:** `void downMix(DownMix downMix)`

### `update`

**Sygnatura:** `void update()`

### `queueBuffers`

**Sygnatura:** `void queueBuffers()`

### `unqueueBuffers`

**Sygnatura:** `void unqueueBuffers()`

### `fillBufferAndQueue`

**Sygnatura:** `bool fillBufferAndQueue(uint buffer)`

## Class Diagram

Zobacz: [../diagrams/streamsoundsource.mmd](../diagrams/streamsoundsource.mmd)

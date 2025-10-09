---
doc_id: "cpp-api-c95fddd14f87"
source_path: "framework/sound/soundchannel.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: soundchannel.h"
summary: "Dokumentacja API C++ dla framework/sound/soundchannel.h"
tags: ["cpp", "api", "otclient"]
---

# framework/sound/soundchannel.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu soundchannel.

## Classes/Structs

### Klasa: `SoundChannel`

| Member | Brief | Signature |
|--------|-------|-----------|
| `play` |  | `SoundSourcePtr play(const std::string& filename, float fadetime = 0, float gain = 1.0f)` |
| `stop` |  | `void stop(float fadetime = 0)` |
| `enqueue` |  | `void enqueue(const std::string& filename, float fadetime = 0, float gain = 1.0f)` |
| `enable` |  | `void enable() { setEnabled(true); }` |
| `disable` |  | `void disable() { setEnabled(false); }` |
| `setGain` |  | `void setGain(float gain)` |
| `getGain` |  | `float getGain() { return m_gain; }` |
| `setEnabled` |  | `void setEnabled(bool enable)` |
| `isEnabled` |  | `bool isEnabled() { return m_enabled; }` |
| `getId` |  | `int getId() { return m_id; }` |
| `update` |  | `void update()` |

### Struktura: `QueueEntry`

## Functions

### `play`

**Sygnatura:** `SoundSourcePtr play(const std::string& filename, float fadetime = 0, float gain = 1.0f)`

### `stop`

**Sygnatura:** `void stop(float fadetime = 0)`

### `enqueue`

**Sygnatura:** `void enqueue(const std::string& filename, float fadetime = 0, float gain = 1.0f)`

### `enable`

**Sygnatura:** `void enable() { setEnabled(true); }`

### `disable`

**Sygnatura:** `void disable() { setEnabled(false); }`

### `setGain`

**Sygnatura:** `void setGain(float gain)`

### `getGain`

**Sygnatura:** `float getGain() { return m_gain; }`

### `setEnabled`

**Sygnatura:** `void setEnabled(bool enable)`

### `isEnabled`

**Sygnatura:** `bool isEnabled() { return m_enabled; }`

### `getId`

**Sygnatura:** `int getId() { return m_id; }`

### `update`

**Sygnatura:** `void update()`

## Class Diagram

Zobacz: [../diagrams/soundchannel.mmd](../diagrams/soundchannel.mmd)

---
doc_id: "cpp-api-78766f6fbca1"
source_path: "framework/sound/soundsource.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: soundsource.h"
summary: "Dokumentacja API C++ dla framework/sound/soundsource.h"
tags: ["cpp", "api", "otclient"]
---

# framework/sound/soundsource.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu soundsource.

## Classes/Structs

### Klasa: `SoundSource`

| Member | Brief | Signature |
|--------|-------|-----------|
| `play` |  | `virtual void play()` |
| `stop` |  | `virtual void stop()` |
| `isBuffering` |  | `virtual bool isBuffering()` |
| `isPlaying` |  | `virtual bool isPlaying() { return isBuffering(); }` |
| `setName` |  | `void setName(const std::string& name) { m_name = name; }` |
| `setLooping` |  | `virtual void setLooping(bool looping)` |
| `setRelative` |  | `virtual void setRelative(bool relative)` |
| `setReferenceDistance` |  | `virtual void setReferenceDistance(float distance)` |
| `setGain` |  | `virtual void setGain(float gain)` |
| `setPitch` |  | `virtual void setPitch(float pitch)` |
| `setPosition` |  | `virtual void setPosition(const Point& pos)` |
| `setVelocity` |  | `virtual void setVelocity(const Point& velocity)` |
| `setFading` |  | `virtual void setFading(FadeState state, float fadetime)` |
| `getName` |  | `std::string getName() { return m_name; }` |
| `getChannel` |  | `uchar getChannel() { return m_channel; }` |
| `getGain` |  | `float getGain() { return m_gain; }` |
| `setBuffer` |  | `void setBuffer(const SoundBufferPtr& buffer)` |
| `setChannel` |  | `void setChannel(uchar channel) { m_channel = channel; }` |
| `update` |  | `virtual void update()` |
| `m_sourceId` |  | `uint m_sourceId` |
| `m_channel` |  | `uchar m_channel` |
| `m_name` |  | `std::string m_name` |
| `m_buffer` |  | `SoundBufferPtr m_buffer` |
| `m_fadeState` |  | `FadeState m_fadeState` |
| `m_fadeStartTime` |  | `float m_fadeStartTime` |
| `m_fadeTime` |  | `float m_fadeTime` |
| `m_fadeGain` |  | `float m_fadeGain` |
| `m_gain` |  | `float m_gain` |

## Enums

### `FadeState`

**Wartości:**

- `SoundSource`
- `virtual`
- `virtual`
- `virtual`
- `virtual`

## Functions

### `setName`

**Sygnatura:** `void setName(const std::string& name) { m_name = name; }`

### `getName`

**Sygnatura:** `std::string getName() { return m_name; }`

### `getChannel`

**Sygnatura:** `uchar getChannel() { return m_channel; }`

### `getGain`

**Sygnatura:** `float getGain() { return m_gain; }`

### `setBuffer`

**Sygnatura:** `void setBuffer(const SoundBufferPtr& buffer)`

### `setChannel`

**Sygnatura:** `void setChannel(uchar channel) { m_channel = channel; }`

## Class Diagram

Zobacz: [../diagrams/soundsource.mmd](../diagrams/soundsource.mmd)

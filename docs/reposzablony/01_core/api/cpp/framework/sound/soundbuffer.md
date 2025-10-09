---
doc_id: "cpp-api-b3823624b3c3"
source_path: "framework/sound/soundbuffer.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: soundbuffer.h"
summary: "Dokumentacja API C++ dla framework/sound/soundbuffer.h"
tags: ["cpp", "api", "otclient"]
---

# framework/sound/soundbuffer.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu soundbuffer.

## Classes/Structs

### Klasa: `SoundBuffer`

| Member | Brief | Signature |
|--------|-------|-----------|
| `fillBuffer` |  | `bool fillBuffer(const SoundFilePtr& soundFile)` |
| `fillBuffer` |  | `bool fillBuffer(ALenum sampleFormat, const DataBuffer<char>& data, int size, int rate)` |
| `getBufferId` |  | `uint getBufferId() { return m_bufferId; }` |

## Functions

### `fillBuffer`

**Sygnatura:** `bool fillBuffer(const SoundFilePtr& soundFile)`

### `fillBuffer`

**Sygnatura:** `bool fillBuffer(ALenum sampleFormat, const DataBuffer<char>& data, int size, int rate)`

### `getBufferId`

**Sygnatura:** `uint getBufferId() { return m_bufferId; }`

## Class Diagram

Zobacz: [../diagrams/soundbuffer.mmd](../diagrams/soundbuffer.mmd)

---
doc_id: "cpp-api-3dc5d2fff172"
source_path: "framework/sound/soundfile.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: soundfile.h"
summary: "Dokumentacja API C++ dla framework/sound/soundfile.h"
tags: ["cpp", "api", "otclient"]
---

# framework/sound/soundfile.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu soundfile.

## Classes/Structs

### Klasa: `SoundFile`

| Member | Brief | Signature |
|--------|-------|-----------|
| `loadSoundFile` |  | `static SoundFilePtr loadSoundFile(const std::string& filename)` |
| `read` |  | `virtual int read(void *buffer, int bufferSize) { return -1; }` |
| `reset` |  | `virtual void reset() { }` |
| `eof` |  | `bool eof() { return m_file->eof(); }` |
| `getSampleFormat` |  | `ALenum getSampleFormat()` |
| `getChannels` |  | `int getChannels() { return m_channels; }` |
| `getRate` |  | `int getRate() { return m_rate; }` |
| `getBps` |  | `int getBps() { return m_bps; }` |
| `getSize` |  | `int getSize() { return m_size; }` |
| `getName` |  | `std::string getName() { return m_file ? m_file->name() : std::string(); }` |
| `m_file` |  | `FileStreamPtr m_file` |
| `m_channels` |  | `int m_channels` |
| `m_rate` |  | `int m_rate` |
| `m_bps` |  | `int m_bps` |
| `m_size` |  | `int m_size` |

## Functions

### `loadSoundFile`

**Sygnatura:** `static SoundFilePtr loadSoundFile(const std::string& filename)`

### `eof`

**Sygnatura:** `bool eof() { return m_file->eof(); }`

### `getSampleFormat`

**Sygnatura:** `ALenum getSampleFormat()`

### `getChannels`

**Sygnatura:** `int getChannels() { return m_channels; }`

### `getRate`

**Sygnatura:** `int getRate() { return m_rate; }`

### `getBps`

**Sygnatura:** `int getBps() { return m_bps; }`

### `getSize`

**Sygnatura:** `int getSize() { return m_size; }`

### `getName`

**Sygnatura:** `std::string getName() { return m_file ? m_file->name() : std::string(); }`

## Class Diagram

Zobacz: [../diagrams/soundfile.mmd](../diagrams/soundfile.mmd)

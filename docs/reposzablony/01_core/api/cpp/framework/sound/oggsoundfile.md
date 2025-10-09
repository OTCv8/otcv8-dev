---
doc_id: "cpp-api-8469ef1a65a3"
source_path: "framework/sound/oggsoundfile.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: oggsoundfile.h"
summary: "Dokumentacja API C++ dla framework/sound/oggsoundfile.h"
tags: ["cpp", "api", "otclient"]
---

# framework/sound/oggsoundfile.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu oggsoundfile.

## Classes/Structs

### Klasa: `OggSoundFile`

| Member | Brief | Signature |
|--------|-------|-----------|
| `prepareOgg` |  | `bool prepareOgg()` |
| `read` |  | `int read(void *buffer, int bufferSize)` |
| `reset` |  | `void reset()` |

## Functions

### `prepareOgg`

**Sygnatura:** `bool prepareOgg()`

### `read`

**Sygnatura:** `int read(void *buffer, int bufferSize)`

### `reset`

**Sygnatura:** `void reset()`

### `cb_read`

**Sygnatura:** `static size_t cb_read(void* ptr, size_t size, size_t nmemb, void* source)`

### `cb_seek`

**Sygnatura:** `static int cb_seek(void* source, ogg_int64_t offset, int whence)`

### `cb_close`

**Sygnatura:** `static int cb_close(void* source)`

### `cb_tell`

**Sygnatura:** `static long cb_tell(void* source)`

## Class Diagram

Zobacz: [../diagrams/oggsoundfile.mmd](../diagrams/oggsoundfile.mmd)

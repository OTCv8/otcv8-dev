---
doc_id: "cpp-api-9d32adf767d9"
source_path: "framework/stdext/math.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: math.h"
summary: "Dokumentacja API C++ dla framework/stdext/math.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/math.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu math.

## Namespaces

### `stdext`

## Functions

### `is_power_of_two`

**Sygnatura:** `inline bool is_power_of_two(size_t v) { return ((v != 0) && !(v & (v - 1))); }`

### `to_power_of_two`

**Sygnatura:** `inline size_t to_power_of_two(size_t v) { if(v == 0) return 0; size_t r = 1; while(r < v && r != 0xffffffff) r <<= 1; return r; }`

### `readULE16`

**Sygnatura:** `inline uint16_t readULE16(const uchar *addr) { return (uint16_t)addr[1] << 8 | addr[0]; }`

### `readULE32`

**Sygnatura:** `inline uint32_t readULE32(const uchar *addr) { return (uint32_t)readULE16(addr + 2) << 16 | readULE16(addr); }`

### `readULE64`

**Sygnatura:** `inline uint64_t readULE64(const uchar *addr) { return (uint64_t)readULE32(addr + 4) << 32 | readULE32(addr); }`

### `writeULE16`

**Sygnatura:** `inline void writeULE16(uchar *addr, uint16_t value) { addr[1] = value >> 8; addr[0] = (uint8_t)value; }`

### `writeULE32`

**Sygnatura:** `inline void writeULE32(uchar *addr, uint32_t value) { writeULE16(addr + 2, value >> 16); writeULE16(addr, (uint16_t)value); }`

### `writeULE64`

**Sygnatura:** `inline void writeULE64(uchar *addr, uint64_t value) { writeULE32(addr + 4, value >> 32); writeULE32(addr, (uint32_t)value); }`

### `readSLE16`

**Sygnatura:** `inline int16_t readSLE16(const uchar *addr) { return (int16_t)addr[1] << 8 | addr[0]; }`

### `readSLE32`

**Sygnatura:** `inline int32_t readSLE32(const uchar *addr) { return (int32_t)readSLE16(addr + 2) << 16 | readSLE16(addr); }`

### `readSLE64`

**Sygnatura:** `inline int64_t readSLE64(const uchar *addr) { return (int64_t)readSLE32(addr + 4) << 32 | readSLE32(addr); }`

### `writeSLE16`

**Sygnatura:** `inline void writeSLE16(uchar *addr, int16_t value) { addr[1] = value >> 8; addr[0] = (int8_t)value; }`

### `writeSLE32`

**Sygnatura:** `inline void writeSLE32(uchar *addr, int32_t value) { writeSLE16(addr + 2, value >> 16); writeSLE16(addr, (int16_t)value); }`

### `writeSLE64`

**Sygnatura:** `inline void writeSLE64(uchar *addr, int64_t value) { writeSLE32(addr + 4, value >> 32); writeSLE32(addr, (int32_t)value); }`

### `adler32`

**Sygnatura:** `uint32_t adler32(const uint8_t *buffer, size_t size)`

### `random_range`

**Sygnatura:** `long random_range(long min, long max)`

### `random_range`

**Sygnatura:** `float random_range(float min, float max)`

### `round`

**Sygnatura:** `double round(double r)`

### `clamp`

**Sygnatura:** `T clamp(T x, T min, T max) { return std::max<T>(min, std::min<T>(x, max)); }`

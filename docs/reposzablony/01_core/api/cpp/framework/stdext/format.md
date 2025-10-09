---
doc_id: "cpp-api-8cab77a4f7c5"
source_path: "framework/stdext/format.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: format.h"
summary: "Dokumentacja API C++ dla framework/stdext/format.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/format.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu format.

## Namespaces

### `stdext`

## Functions

### `print_ostream`

**Sygnatura:** `void print_ostream(std::ostringstream& stream, const T& first, const Args&... rest) { stream << "\t" << first; print_ostream(stream, rest...); }`

### `print`

**Sygnatura:** `void print(const T&... args) { std::ostringstream buf; print_ostream(buf, args...); std::cout << buf.str() << std::endl; }`

### `_snprintf`

**Sygnatura:** `return _snprintf(s, maxlen, format, args...)`

### `snprintf`

**Sygnatura:** `return snprintf(s, maxlen, format, args...)`

### `snprintf`

**Sygnatura:** `int snprintf(char *s, size_t maxlen, const char *format, const Args&... args) {`

### `snprintf`

**Sygnatura:** `inline int snprintf(char *s, size_t maxlen, const char *format) {`

### `strlen`

**Sygnatura:** `return strlen(s)`

### `format`

**Sygnatura:** `inline std::string format() { return std::string(); }`

### `format`

**Sygnatura:** `inline std::string format(const std::string& format) { return format; }`

### `format`

**Sygnatura:** `std::string format(const std::string& format, const Args&... args) {`

### `buffer`

**Sygnatura:** `std::string buffer(n + 1, '\0')`

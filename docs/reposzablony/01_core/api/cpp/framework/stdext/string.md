---
doc_id: "cpp-api-082cfe947647"
source_path: "framework/stdext/string.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: string.h"
summary: "Dokumentacja API C++ dla framework/stdext/string.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/string.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu string.

## Namespaces

### `stdext`

## Functions

### `resolve_path`

Resolve a file path by combining sourcePath with filePath

**Sygnatura:** `std::string resolve_path(const std::string& filePath, std::string sourcePath)`

### `date_time_string`

Get current date and time in a std::string

**Sygnatura:** `std::string date_time_string()`

### `timestamp_to_date`

**Sygnatura:** `std::string timestamp_to_date(time_t tnow)`

### `dec_to_hex`

**Sygnatura:** `std::string dec_to_hex(uint32_t num)`

### `dec_to_hex`

**Sygnatura:** `std::string dec_to_hex(uint64_t num)`

### `hex_to_dec`

**Sygnatura:** `uint64_t hex_to_dec(const std::string& str)`

### `tolower`

**Sygnatura:** `void tolower(std::string& str)`

### `toupper`

**Sygnatura:** `void toupper(std::string& str)`

### `trim`

**Sygnatura:** `void trim(std::string& str)`

### `ucwords`

**Sygnatura:** `void ucwords(std::string& str)`

### `upchar`

**Sygnatura:** `char upchar(char c)`

### `lochar`

**Sygnatura:** `char lochar(char c)`

### `ends_with`

**Sygnatura:** `bool ends_with(const std::string& str, const std::string& test)`

### `starts_with`

**Sygnatura:** `bool starts_with(const std::string& str, const std::string& test)`

### `replace_all`

**Sygnatura:** `void replace_all(std::string& str, const std::string& search, const std::string& replacement)`

### `is_valid_utf8`

**Sygnatura:** `bool is_valid_utf8(const std::string& src)`

### `utf8_to_latin1`

**Sygnatura:** `std::string utf8_to_latin1(const std::string& src)`

### `latin1_to_utf8`

**Sygnatura:** `std::string latin1_to_utf8(const std::string& src)`

### `utf8_to_utf16`

**Sygnatura:** `std::wstring utf8_to_utf16(const std::string& src)`

### `utf16_to_utf8`

**Sygnatura:** `std::string utf16_to_utf8(const std::wstring& src)`

### `utf16_to_latin1`

**Sygnatura:** `std::string utf16_to_latin1(const std::wstring& src)`

### `latin1_to_utf16`

**Sygnatura:** `std::wstring latin1_to_utf16(const std::string& src)`

### `split`

**Sygnatura:** `std::vector<std::string> split(const std::string& str, const std::string& separators = " ")`

### `results`

**Sygnatura:** `std::vector<T> results(splitted.size())`

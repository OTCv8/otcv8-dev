---
doc_id: "cpp-api-29692dd52589"
source_path: "framework/stdext/cast.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: cast.h"
summary: "Dokumentacja API C++ dla framework/stdext/cast.h"
tags: ["cpp", "api", "otclient"]
---

# framework/stdext/cast.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu cast.

## Namespaces

### `stdext`

## Classes/Structs

### Klasa: `cast_exception`

## Functions

### `cast`

**Sygnatura:** `bool cast(const T& in, R& out) {`

### `cast`

**Sygnatura:** `bool cast(const T& in, std::string& out) {`

### `cast`

**Sygnatura:** `inline bool cast(const std::string& in, std::string& out) {`

### `cast`

**Sygnatura:** `inline bool cast(const std::string& in, bool& b) {`

### `if`

**Sygnatura:** `else if(in == "false")`

### `cast`

**Sygnatura:** `inline bool cast(const std::string& in, char& c) {`

### `cast`

**Sygnatura:** `inline bool cast(const std::string& in, long& l) {`

### `cast`

**Sygnatura:** `inline bool cast(const std::string& in, int& i) {`

### `cast`

**Sygnatura:** `inline bool cast(const std::string& in, double& d) {`

### `cast`

**Sygnatura:** `inline bool cast(const std::string& in, float& f) {`

### `cast`

**Sygnatura:** `inline bool cast(const bool& in, std::string& out) {`

### `update_what`

**Sygnatura:** `void update_what() {`

### `safe_cast`

**Sygnatura:** `R safe_cast(const T& t) {`

### `unsafe_cast`

**Sygnatura:** `R unsafe_cast(const T& t, R def = R()) {`

## Class Diagram

Zobacz: [../diagrams/cast.mmd](../diagrams/cast.mmd)

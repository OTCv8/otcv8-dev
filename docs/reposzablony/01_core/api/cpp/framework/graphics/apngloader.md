---
doc_id: "cpp-api-afa995ec64a9"
source_path: "framework/graphics/apngloader.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: apngloader.h"
summary: "Dokumentacja API C++ dla framework/graphics/apngloader.h"
tags: ["cpp", "api", "otclient"]
---

# framework/graphics/apngloader.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu apngloader.

## Classes/Structs

### Struktura: `apng_data`

## Functions

### `load_apng`

**Sygnatura:** `int load_apng(std::stringstream& file, struct apng_data *apng)`

### `save_png`

**Sygnatura:** `void save_png(std::stringstream& file, unsigned int width, unsigned int height, int channels, unsigned char *pixels)`

### `free_apng`

**Sygnatura:** `void free_apng(struct apng_data *apng)`

## Class Diagram

Zobacz: [../diagrams/apngloader.mmd](../diagrams/apngloader.mmd)

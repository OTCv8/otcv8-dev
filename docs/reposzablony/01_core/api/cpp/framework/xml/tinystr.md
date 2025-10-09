---
doc_id: "cpp-api-b7975ddede5e"
source_path: "framework/xml/tinystr.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: tinystr.h"
summary: "Dokumentacja API C++ dla framework/xml/tinystr.h"
tags: ["cpp", "api", "otclient"]
---

# framework/xml/tinystr.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu tinystr.

## Classes/Structs

### Klasa: `TiXmlString`

TiXmlString is an emulation of a subset of the std::string template. Its purpose is to allow compiling TinyXML on compilers with no or poor STL support. Only the member functions relevant to the TinyXML project have been implemented. The buffer allocation is made by a simplistic power of 2 like mechanism : if we increase a string and there's no more room, we allocate a buffer twice as big as we need.

### Struktura: `Rep`

### Klasa: `TiXmlOutStream`

TiXmlOutStream is an emulation of std::ostream. It is based on TiXmlString. Only the operators that we need for TinyXML have been developped.

## Functions

### `TiXmlString`

**Sygnatura:** `TIXML_EXPLICIT TiXmlString ( const char * copy) : rep_(0)`

### `TiXmlString`

**Sygnatura:** `TIXML_EXPLICIT TiXmlString ( const char * str, size_type len) : rep_(0)`

### `assign`

**Sygnatura:** `return assign( copy, (size_type)strlen(copy))`

### `assign`

**Sygnatura:** `return assign(copy.start(), copy.length())`

### `append`

**Sygnatura:** `return append(suffix, static_cast<size_type>( strlen(suffix) ))`

### `append`

**Sygnatura:** `return append(&single, 1)`

### `append`

**Sygnatura:** `return append(suffix.data(), suffix.length())`

### `length`

**Sygnatura:** `size_type length () const { return rep_->size; }`

### `size`

**Sygnatura:** `size_type size () const { return rep_->size; }`

### `empty`

**Sygnatura:** `bool empty () const { return rep_->size == 0; }`

### `capacity`

**Sygnatura:** `size_type capacity () const { return rep_->capacity; }`

### `find`

**Sygnatura:** `size_type find (char lookup) const`

### `find`

**Sygnatura:** `return find(lookup, 0)`

### `find`

**Sygnatura:** `size_type find (char tofind, size_type offset) const`

### `clear`

**Sygnatura:** `void clear ()`

### `reserve`

Function to reserve a big amount of data when we know we'll need it. Be aware that this function DOES NOT clear the content of the TiXmlString if any exists.

**Sygnatura:** `void reserve (size_type cap)`

### `swap`

**Sygnatura:** `void swap (TiXmlString& other)`

### `init`

**Sygnatura:** `void init(size_type sz) { init(sz, sz); }`

### `set_size`

**Sygnatura:** `void set_size(size_type sz) { rep_->str[ rep_->size = sz ] = '\0'; }`

### `init`

**Sygnatura:** `void init(size_type sz, size_type cap)`

### `quit`

**Sygnatura:** `void quit()`

### `strcmp`

**Sygnatura:** `return strcmp(a.c_str(), b.c_str()) < 0`

## Types/Aliases

### `size_type`

**Typedef:** `size_t`

## Class Diagram

Zobacz: [../diagrams/tinystr.mmd](../diagrams/tinystr.mmd)

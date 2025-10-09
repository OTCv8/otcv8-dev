---
doc_id: "cpp-api-679a0b7531bf"
source_path: "framework/luaengine/luavaluecasts.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: luavaluecasts.h"
summary: "Dokumentacja API C++ dla framework/luaengine/luavaluecasts.h"
tags: ["cpp", "api", "otclient"]
---

# framework/luaengine/luavaluecasts.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu luavaluecasts.

## Classes/Structs

### Struktura: `push_tuple_internal_luavalue`

**Szablon:** `template<int N>`

### Struktura: `push_tuple_internal_luavalue`

**Szablon:** `template<>`

### Struktura: `push_tuple_luavalue`

**Szablon:** `template<int N>`

### Struktura: `push_tuple_luavalue`

**Szablon:** `template<>`

## Functions

### `push_internal_luavalue`

**Sygnatura:** `int push_internal_luavalue(T v)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(bool b)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, bool& b)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(int i)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, int& i)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(double d)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, double& d)`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(float f) { push_luavalue((double)f); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, float& f) { double d; bool r = luavalue_cast(index, d); f = d; return r; }`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(int8 v) { push_luavalue((int)v); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, int8& v) { int i; bool r = luavalue_cast(index, i); v = i; return r; }`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(uint8 v) { push_luavalue((int)v); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, uint8& v){ int i; bool r = luavalue_cast(index, i); v = i; return r; }`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(int16 v) { push_luavalue((int)v); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, int16& v){ int i; bool r = luavalue_cast(index, i); v = i; return r; }`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(uint16 v) { push_luavalue((int)v); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, uint16& v){ int i; bool r = luavalue_cast(index, i); v = i; return r; }`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(uint32 v) { push_luavalue((double)v); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, uint32& v) { double d; bool r = luavalue_cast(index, d); v = d; return r; }`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(int64 v) { push_luavalue((double)v); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, int64& v) { double d; bool r = luavalue_cast(index, d); v = d; return r; }`

### `push_luavalue`

**Sygnatura:** `inline int push_luavalue(uint64 v) { push_luavalue((double)v); return 1; }`

### `luavalue_cast`

**Sygnatura:** `inline bool luavalue_cast(int index, uint64& v) { double d; bool r = luavalue_cast(index, d); v = d; return r; }`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const char* cstr)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::string& str)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::string& str)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const LuaCppFunction& func)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const Color& color)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, Color& color)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const Rect& rect)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, Rect& rect)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const Point& point)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, Point& point)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const Size& size)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, Size& size)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const OTMLNodePtr& node)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, OTMLNodePtr& node)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, LuaObjectPtr& obj)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::function<Ret(Args...)>& func)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::function<void(Args...)>& func)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::list<T>& list)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::list<T>& list)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::vector<T>& vec)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::vector<T>& vec)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::set<T>& vec)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::set<T>& vec)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::deque<T>& vec)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::deque<T>& vec)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::map<K, V>& map)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::map<K, V>& map)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::pair<K, V>& pair)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::tuple<Args...>& tuple)`

### `push_internal_luavalue`

**Sygnatura:** `int push_internal_luavalue(const std::tuple<Args...>& tuple)`

### `push_internal_luavalue`

**Sygnatura:** `int push_internal_luavalue(T v) {`

### `push_luavalue`

**Sygnatura:** `return push_luavalue(v)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::function<Ret(Args...)>& func) {`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::function<void(Args...)>& func) {`

### `LuaException`

**Sygnatura:** `throw LuaException("a function from lua didn't retrieve the expected number of results", 0)`

### `Ret`

**Sygnatura:** `return Ret()`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::list<T>& list) {`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::list<T>& list)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::vector<T>& vec)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::vector<T>& vec)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::set<T>& set)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::set<T>& set)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::deque<T>& vec) {`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::deque<T>& vec)`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::map<K, V>& map)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::map<K, V>& map)`

### `luavalue_cast`

**Sygnatura:** `bool luavalue_cast(int index, std::pair<K, V>& pair)`

### `call`

**Sygnatura:** `static void call(const Tuple& tuple) {`

### `call`

**Sygnatura:** `static void call(const Tuple& tuple) { }`

### `push_internal_luavalue`

**Sygnatura:** `int push_internal_luavalue(const std::tuple<Args...>& tuple) {`

### `call`

**Sygnatura:** `static void call(const Tuple& tuple) {`

### `call`

**Sygnatura:** `static void call(const Tuple& tuple) { }`

### `push_luavalue`

**Sygnatura:** `int push_luavalue(const std::tuple<Args...>& tuple) {`

## Class Diagram

Zobacz: [../diagrams/luavaluecasts.mmd](../diagrams/luavaluecasts.mmd)

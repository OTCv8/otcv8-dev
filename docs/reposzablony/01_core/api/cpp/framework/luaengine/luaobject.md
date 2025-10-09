---
doc_id: "cpp-api-6e7d2f4748d0"
source_path: "framework/luaengine/luaobject.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: luaobject.h"
summary: "Dokumentacja API C++ dla framework/luaengine/luaobject.h"
tags: ["cpp", "api", "otclient"]
---

# framework/luaengine/luaobject.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu luaobject.

## Namespaces

### `luabinder`

## Classes/Structs

### Klasa: `LuaObject`

LuaObject, all script-able classes have it as base

| Member | Brief | Signature |
|--------|-------|-----------|
| `connectLuaField` |  | `void connectLuaField(const std::string& field, const std::function<T>& f, bool pushFront = false)` |
| `luaCallLuaField` |  | `int luaCallLuaField(const std::string& field, const T&... args)` |
| `callLuaField` |  | `R callLuaField(const std::string& field, const T&... args)` |
| `callLuaField` |  | `void callLuaField(const std::string& field, const T&... args)` |
| `hasLuaField` | Returns true if the lua field exists | `bool hasLuaField(const std::string& field)` |
| `setLuaField` |  | `void setLuaField(const std::string& key, const T& value)` |
| `getLuaField` |  | `T getLuaField(const std::string& key)` |
| `releaseLuaFieldsTable` | Release fields table reference | `void releaseLuaFieldsTable()` |
| `luaSetField` | Sets a field from this lua object, the value must be on the stack | `void luaSetField(const std::string& key)` |
| `luaGetField` | Gets a field from this lua object, the result is pushed onto the stack | `void luaGetField(const std::string& key)` |
| `luaGetMetatable` | Get object's metatable | `void luaGetMetatable()` |
| `luaGetFieldsTable` | Gets the table containing all stored fields of this lua object, the result is pushed onto the stack | `void luaGetFieldsTable()` |
| `getUseCount` | Returns the number of references of this object @note each userdata of this object on lua counts as  | `int getUseCount()` |
| `getClassName` | Returns the derived class name, its the same name used in Lua | `std::string getClassName()` |
| `asLuaObject` |  | `LuaObjectPtr asLuaObject() { return static_self_cast<LuaObject>(); }` |
| `operator` |  | `void operator=(const LuaObject& other) { }` |

### Struktura: `connect_lambda`

**Szablon:** `template<typename F>`

### Struktura: `connect_lambda`

**Szablon:** `template<typename Lambda, typename Ret, typename... Args>`

## Functions

### `connectLuaField`

**Sygnatura:** `void connectLuaField(const std::string& field, const std::function<T>& f, bool pushFront = false)`

### `luaCallLuaField`

**Sygnatura:** `int luaCallLuaField(const std::string& field, const T&... args)`

### `callLuaField`

**Sygnatura:** `R callLuaField(const std::string& field, const T&... args)`

### `callLuaField`

**Sygnatura:** `void callLuaField(const std::string& field, const T&... args)`

### `hasLuaField`

Returns true if the lua field exists

**Sygnatura:** `bool hasLuaField(const std::string& field)`

### `setLuaField`

**Sygnatura:** `void setLuaField(const std::string& key, const T& value)`

### `getLuaField`

**Sygnatura:** `T getLuaField(const std::string& key)`

### `releaseLuaFieldsTable`

Release fields table reference

**Sygnatura:** `void releaseLuaFieldsTable()`

### `luaSetField`

Sets a field from this lua object, the value must be on the stack

**Sygnatura:** `void luaSetField(const std::string& key)`

### `luaGetField`

Gets a field from this lua object, the result is pushed onto the stack

**Sygnatura:** `void luaGetField(const std::string& key)`

### `luaGetMetatable`

Get object's metatable

**Sygnatura:** `void luaGetMetatable()`

### `luaGetFieldsTable`

Gets the table containing all stored fields of this lua object, the result is pushed onto the stack

**Sygnatura:** `void luaGetFieldsTable()`

### `getUseCount`

Returns the number of references of this object @note each userdata of this object on lua counts as a reference

**Sygnatura:** `int getUseCount()`

### `getClassName`

Returns the derived class name, its the same name used in Lua

**Sygnatura:** `std::string getClassName()`

### `asLuaObject`

**Sygnatura:** `LuaObjectPtr asLuaObject() { return static_self_cast<LuaObject>(); }`

### `connect`

**Sygnatura:** `void connect(const LuaObjectPtr& obj, const std::string& field, const std::function<F>& f, bool pushFront = false)`

### `connect`

**Sygnatura:** `void connect(const LuaObjectPtr& obj, const std::string& field, const std::function<F>& f, bool pushFront) {`

### `call`

**Sygnatura:** `static void call(const LuaObjectPtr& obj, const std::string& field, const Lambda& f, bool pushFront) {`

### `decltype`

**Sygnatura:** `typedef decltype(&Lambda::operator()) F`

### `s`

**Sygnatura:** `AutoStat s(STATS_LUA, getClassName() + ":" + field)`

## Types/Aliases

### `F`

**Typedef:** `decltype(&Lambda::operator())`

## Class Diagram

Zobacz: [../diagrams/luaobject.mmd](../diagrams/luaobject.mmd)

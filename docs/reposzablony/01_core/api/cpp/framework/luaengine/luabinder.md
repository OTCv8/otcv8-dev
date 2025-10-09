---
doc_id: "cpp-api-92130acbf331"
source_path: "framework/luaengine/luabinder.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: luabinder.h"
summary: "Dokumentacja API C++ dla framework/luaengine/luabinder.h"
tags: ["cpp", "api", "otclient"]
---

# framework/luaengine/luabinder.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu luabinder.

## Namespaces

### `luabinder`

This namespace contains some dirty metaprogamming that uses a lot of C++0x features The purpose here is to create templates that can bind any function from C++ and expose in lua environment. This is done combining variadic templates, lambdas, tuples and some type traits features from the new C++0x standard to create templates that can detect functions's arguments and then generate lambdas. These lambdas pops arguments from lua stack, call the bound C++ function and then pushes the result to lua.

## Classes/Structs

### Struktura: `pack_values_into_tuple`

**Szablon:** `template<int N>`

Pack arguments from lua stack into a tuple recursively

### Struktura: `pack_values_into_tuple`

**Szablon:** `template<>`

### Struktura: `expand_fun_arguments`

**Szablon:** `template<int N, typename Ret>`

Expand arguments from tuple for later calling the C++ function

### Struktura: `expand_fun_arguments`

**Szablon:** `template<typename Ret>`

### Struktura: `bind_lambda_fun`

**Szablon:** `template<typename F>`

Specialization for lambdas

### Struktura: `bind_lambda_fun`

**Szablon:** `template<typename Lambda, typename Ret, typename... Args>`

## Functions

### `call`

**Sygnatura:** `static void call(Tuple& tuple, LuaInterface* lua) {`

### `call`

**Sygnatura:** `static void call(Tuple& tuple, LuaInterface* lua) { }`

### `call`

**Sygnatura:** `static int call(const Tuple& tuple, const F& f, LuaInterface* lua, const Args&... args) {`

### `call`

**Sygnatura:** `static int call(const Tuple& tuple, const F& f, LuaInterface* lua, const Args&... args) {`

### `bind_fun_specializer`

**Sygnatura:** `LuaCppFunction bind_fun_specializer(const F& f) {`

### `bind_fun`

**Sygnatura:** `LuaCppFunction bind_fun(const std::function<int(LuaInterface*)>& f) {`

### `bind_fun`

**Sygnatura:** `LuaCppFunction bind_fun(const std::function<Ret(Args...)>& f) {`

### `call`

**Sygnatura:** `static LuaCppFunction call(const Lambda& f) {`

### `decltype`

**Sygnatura:** `typedef decltype(&Lambda::operator()) F`

### `bind_fun`

**Sygnatura:** `LuaCppFunction bind_fun(Ret (*f)(Args...)) {`

### `bind_fun`

**Sygnatura:** `return bind_fun(std::function<Ret(Args...)>(f))`

### `LuaException`

**Sygnatura:** `throw LuaException("failed to call a member function because the passed object is nil")`

### `mf`

**Sygnatura:** `return mf(obj.get(), args...)`

### `LuaException`

**Sygnatura:** `throw LuaException("failed to call a member function because the passed object is nil")`

### `make_mem_func_singleton`

**Sygnatura:** `std::function<Ret(const Args&...)> make_mem_func_singleton(Ret (C::* f)(Args...), C* instance) {`

### `make_mem_func_singleton`

**Sygnatura:** `std::function<void(const Args&...)> make_mem_func_singleton(void (C::* f)(Args...), C* instance) {`

### `bind_mem_fun`

**Sygnatura:** `LuaCppFunction bind_mem_fun(Ret (FC::* f)(Args...)) {`

### `bind_singleton_mem_fun`

**Sygnatura:** `LuaCppFunction bind_singleton_mem_fun(Ret (FC::*f)(Args...), C *instance) {`

### `bind_mem_fun`

**Sygnatura:** `LuaCppFunction bind_mem_fun(int (C::*f)(LuaInterface*)) {`

### `mf`

**Sygnatura:** `return mf(obj, lua)`

## Types/Aliases

### `ValueType`

**Typedef:** `typename std::tuple_element<N-1, Tuple>::type`

### `Tuple`

**Typedef:** `typename std::tuple<typename stdext::remove_const_ref<Args>::type...>`

### `Tuple`

**Typedef:** `typename std::tuple<typename stdext::remove_const_ref<Args>::type...>`

### `F`

**Typedef:** `decltype(&Lambda::operator())`

### `Tuple`

**Typedef:** `typename std::tuple<stdext::shared_object_ptr<FC>, typename stdext::remove_const_ref<Args>::type...>`

### `Tuple`

**Typedef:** `typename std::tuple<typename stdext::remove_const_ref<Args>::type...>`

## Class Diagram

Zobacz: [../diagrams/luabinder.mmd](../diagrams/luabinder.mmd)

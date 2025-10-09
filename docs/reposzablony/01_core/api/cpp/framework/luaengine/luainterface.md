---
doc_id: "cpp-api-477c2ddd2b8b"
source_path: "framework/luaengine/luainterface.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: luainterface.h"
summary: "Dokumentacja API C++ dla framework/luaengine/luainterface.h"
tags: ["cpp", "api", "otclient"]
---

# framework/luaengine/luainterface.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu luainterface.

## Classes/Structs

### Struktura: `lua_State`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `registerFunctions` | Register core script functions | `void registerFunctions()` |
| `registerSingletonClass` |  | `void registerSingletonClass(const std::string& className)` |
| `registerClass` |  | `void registerClass(const std::string& className, const std::string& baseClass = "LuaObject")` |
| `registerClass` |  | `void registerClass() {` |
| `registerClassStaticFunction` |  | `void registerClassStaticFunction(const std::string& functionName, const LuaCppFunction& function) {` |
| `registerClassMemberFunction` |  | `void registerClassMemberFunction(const std::string& functionName, const LuaCppFunction& function) {` |
| `bindSingletonFunction` |  | `void bindSingletonFunction(const std::string& functionName, F C::*function, C *instance)` |
| `bindSingletonFunction` |  | `void bindSingletonFunction(const std::string& className, const std::string& functionName, F C::* function, C* instance)` |
| `bindSingletonFunction` |  | `void bindSingletonFunction(const std::string& className, const std::string& functionName, const F& function)` |
| `bindClassStaticFunction` |  | `void bindClassStaticFunction(const std::string& functionName, const F& function)` |
| `bindClassStaticFunction` |  | `void bindClassStaticFunction(const std::string& className, const std::string& functionName, const F& function)` |
| `bindClassMemberFunction` |  | `void bindClassMemberFunction(const std::string& functionName, F FC::*function)` |
| `bindClassMemberFunction` |  | `void bindClassMemberFunction(const std::string& className, const std::string& functionName, F FC::*function)` |
| `bindClassMemberField` |  | `void bindClassMemberField(const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)` |
| `bindClassMemberField` |  | `void bindClassMemberField(const std::string& className, const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)` |
| `bindClassMemberGetField` |  | `void bindClassMemberGetField(const std::string& fieldName, F FC::*getFunction)` |
| `bindClassMemberGetField` |  | `void bindClassMemberGetField(const std::string& className, const std::string& fieldName, F FC::*getFunction)` |
| `bindClassMemberSetField` |  | `void bindClassMemberSetField(const std::string& fieldName, F FC::*setFunction)` |
| `bindClassMemberSetField` |  | `void bindClassMemberSetField(const std::string& className, const std::string& fieldName, F FC::*setFunction)` |
| `bindGlobalFunction` |  | `void bindGlobalFunction(const std::string& functionName, const F& function)` |
| `safeRunScript` | Loads and runs a script, any errors are printed to stdout and returns false | `bool safeRunScript(const std::string& fileName)` |
| `runScript` | Loads and runs a script @exception LuaException is thrown on any lua error | `void runScript(const std::string& fileName)` |
| `runBuffer` | Loads and runs the script from buffer @exception LuaException is thrown on any lua error | `void runBuffer(const std::string& buffer, const std::string& source)` |
| `loadScript` | Loads a script file and pushes it's main function onto stack, @exception LuaException is thrown on a | `void loadScript(const std::string& fileName)` |
| `loadFunction` | Loads a function from buffer and pushes it onto stack, @exception LuaException is thrown on any lua  | `void loadFunction(const std::string& buffer, const std::string& source = "lua function buffer")` |
| `evaluateExpression` | Evaluates a lua expression and pushes the result value onto the stack @exception LuaException is thr | `void evaluateExpression(const std::string& expression, const std::string& source = "lua expression")` |
| `traceback` | Generates a traceback message for the current call stack @param errorMessage is an additional error  | `std::string traceback(const std::string& errorMessage = "", int level = 0)` |
| `throwError` | Throw a lua error if inside a lua call or generates an C++ stdext::exception @param message is the e | `void throwError(const std::string& message)` |
| `getCurrentSourcePath` | Searches for the source of the current running function | `std::string getCurrentSourcePath(int level = 0)` |
| `getCurrentFunction` | gets current function name | `std::string getCurrentFunction(int level = 0)` |
| `safeCall` | @brief Calls a function The function and arguments must be on top of the stack in order, results are | `int safeCall(int numArgs = 0, int numRets = -1, const std::shared_ptr<std::string>& error = nullptr)` |
| `signalCall` | Same as safeCall but catches exceptions and can also calls a table of functions, if any error occurs | `int signalCall(int numArgs = 0, int numRets = -1)` |
| `newSandboxEnv` | @brief Creates a new environment table The new environment table is redirected to the global environ | `int newSandboxEnv()` |
| `luaCallGlobalField` |  | `int luaCallGlobalField(const std::string& global, const std::string& field, const T&... args)` |
| `callGlobalField` |  | `void callGlobalField(const std::string& global, const std::string& field, const T&... args)` |
| `callGlobalField` |  | `R callGlobalField(const std::string& global, const std::string& field, const T&... args)` |
| `isInCppCallback` |  | `bool isInCppCallback() { return m_cppCallbackDepth != 0; }` |
| `createLuaState` |  | `void createLuaState()` |
| `closeLuaState` |  | `void closeLuaState()` |
| `collectGarbage` |  | `void collectGarbage()` |
| `loadBuffer` |  | `void loadBuffer(const std::string& buffer, const std::string& source)` |
| `generateByteCode` |  | `std::string generateByteCode(const std::string & buffer, std::string source)` |
| `pcall` |  | `int pcall(int numArgs = 0, int numRets = 0, int errorFuncIndex = 0)` |
| `call` |  | `void call(int numArgs = 0, int numRets = 0)` |
| `error` |  | `void error()` |
| `ref` |  | `int ref()` |
| `weakRef` |  | `int weakRef()` |
| `unref` |  | `void unref(int ref)` |
| `useValue` |  | `void useValue() { pushValue(); ref(); }` |
| `functionSourcePath` |  | `std::string functionSourcePath()` |
| `functionSource` |  | `std::string functionSource()` |
| `insert` |  | `void insert(int index)` |
| `remove` |  | `void remove(int index)` |
| `next` |  | `bool next(int index = -2)` |
| `checkStack` |  | `void checkStack() { VALIDATE(getTop() <= 20); }` |
| `getStackFunction` |  | `void getStackFunction(int level = 0)` |
| `getRef` |  | `void getRef(int ref)` |
| `getWeakRef` |  | `void getWeakRef(int weakRef)` |
| `getGlobalEnvironment` |  | `int getGlobalEnvironment() { return m_globalEnv; }` |
| `setGlobalEnvironment` |  | `void setGlobalEnvironment(int env)` |
| `resetGlobalEnvironment` |  | `void resetGlobalEnvironment() { setGlobalEnvironment(m_globalEnv); }` |
| `setMetatable` |  | `void setMetatable(int index = -2)` |
| `getMetatable` |  | `void getMetatable(int index = -1)` |
| `getField` |  | `void getField(const char* key, int index = -1)` |
| `getField` |  | `void getField(const std::string& key, int index = -1) { return getField(key.c_str(), index); }` |
| `setField` |  | `void setField(const char* key, int index = -2)` |
| `setField` |  | `void setField(const std::string& key, int index = -2) { return setField(key.c_str(), index); }` |
| `getTable` |  | `void getTable(int index = -2)` |
| `setTable` |  | `void setTable(int index = -3)` |
| `clearTable` |  | `void clearTable(int index = -1)` |
| `getEnv` |  | `void getEnv(int index = -1)` |
| `setEnv` |  | `void setEnv(int index = -2)` |
| `getGlobal` |  | `void getGlobal(const std::string& key)` |
| `getGlobalField` |  | `void getGlobalField(const std::string& globalKey, const std::string& fieldKey)` |
| `setGlobal` |  | `void setGlobal(const std::string& key)` |
| `rawGet` |  | `void rawGet(int index = -1)` |
| `rawGeti` |  | `void rawGeti(int n, int index = -1)` |
| `rawSet` |  | `void rawSet(int index = -3)` |
| `rawSeti` |  | `void rawSeti(int n, int index = -2)` |
| `newTable` |  | `void newTable()` |
| `createTable` |  | `void createTable(int narr, int nrec)` |
| `pop` |  | `void pop(int n = 1)` |
| `popInteger` |  | `long popInteger()` |
| `popNumber` |  | `double popNumber()` |
| `popBoolean` |  | `bool popBoolean()` |
| `popString` |  | `std::string popString()` |
| `popObject` |  | `LuaObjectPtr popObject()` |
| `pushNil` |  | `void pushNil()` |
| `pushInteger` |  | `void pushInteger(long v)` |
| `pushNumber` |  | `void pushNumber(double v)` |
| `pushBoolean` |  | `void pushBoolean(bool v)` |
| `pushCString` |  | `void pushCString(const char* v)` |
| `pushString` |  | `void pushString(const std::string& v)` |
| `pushLightUserdata` |  | `void pushLightUserdata(void* p)` |
| `pushThread` |  | `void pushThread()` |
| `pushValue` |  | `void pushValue(int index = -1)` |
| `pushObject` |  | `void pushObject(const LuaObjectPtr& obj)` |
| `pushCFunction` |  | `void pushCFunction(LuaCFunction func, int n = 0)` |
| `pushCppFunction` |  | `void pushCppFunction(const LuaCppFunction& func)` |
| `isNil` |  | `bool isNil(int index = -1)` |
| `isBoolean` |  | `bool isBoolean(int index = -1)` |
| `isNumber` |  | `bool isNumber(int index = -1)` |
| `isString` |  | `bool isString(int index = -1)` |
| `isTable` |  | `bool isTable(int index = -1)` |
| `isFunction` |  | `bool isFunction(int index = -1)` |
| `isCFunction` |  | `bool isCFunction(int index = -1)` |
| `isLuaFunction` |  | `bool isLuaFunction(int index = -1)  { return (isFunction() && !isCFunction()); }` |
| `isUserdata` |  | `bool isUserdata(int index = -1)` |
| `toBoolean` |  | `bool toBoolean(int index = -1)` |
| `toInteger` |  | `int toInteger(int index = -1)` |
| `toNumber` |  | `double toNumber(int index = -1)` |
| `toString` |  | `std::string toString(int index = -1)` |
| `toObject` |  | `LuaObjectPtr toObject(int index = -1)` |
| `getTop` |  | `int getTop()` |
| `stackSize` |  | `int stackSize() { return getTop(); }` |
| `clearStack` |  | `void clearStack() { pop(stackSize()); }` |
| `hasIndex` |  | `bool hasIndex(int index) { return (stackSize() >= (index < 0 ? -index : index) && index != 0); }` |
| `getSource` |  | `std::string getSource(int level = 2)` |
| `loadFiles` |  | `void loadFiles(std::string directory, bool recursive = false, std::string contains = "")` |
| `polymorphicPush` |  | `int polymorphicPush(const T& v, const Args&... args)` |
| `polymorphicPush` |  | `int polymorphicPush() { return 0; }` |
| `castValue` |  | `T castValue(int index = -1)` |
| `polymorphicPop` |  | `T polymorphicPop() { T v = castValue<T>(); pop(1); return v; }` |

### Klasa: `LuaInterface`

Class that manages LUA stuff

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `registerFunctions` | Register core script functions | `void registerFunctions()` |
| `registerSingletonClass` |  | `void registerSingletonClass(const std::string& className)` |
| `registerClass` |  | `void registerClass(const std::string& className, const std::string& baseClass = "LuaObject")` |
| `registerClass` |  | `void registerClass() {` |
| `registerClassStaticFunction` |  | `void registerClassStaticFunction(const std::string& functionName, const LuaCppFunction& function) {` |
| `registerClassMemberFunction` |  | `void registerClassMemberFunction(const std::string& functionName, const LuaCppFunction& function) {` |
| `bindSingletonFunction` |  | `void bindSingletonFunction(const std::string& functionName, F C::*function, C *instance)` |
| `bindSingletonFunction` |  | `void bindSingletonFunction(const std::string& className, const std::string& functionName, F C::* function, C* instance)` |
| `bindSingletonFunction` |  | `void bindSingletonFunction(const std::string& className, const std::string& functionName, const F& function)` |
| `bindClassStaticFunction` |  | `void bindClassStaticFunction(const std::string& functionName, const F& function)` |
| `bindClassStaticFunction` |  | `void bindClassStaticFunction(const std::string& className, const std::string& functionName, const F& function)` |
| `bindClassMemberFunction` |  | `void bindClassMemberFunction(const std::string& functionName, F FC::*function)` |
| `bindClassMemberFunction` |  | `void bindClassMemberFunction(const std::string& className, const std::string& functionName, F FC::*function)` |
| `bindClassMemberField` |  | `void bindClassMemberField(const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)` |
| `bindClassMemberField` |  | `void bindClassMemberField(const std::string& className, const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)` |
| `bindClassMemberGetField` |  | `void bindClassMemberGetField(const std::string& fieldName, F FC::*getFunction)` |
| `bindClassMemberGetField` |  | `void bindClassMemberGetField(const std::string& className, const std::string& fieldName, F FC::*getFunction)` |
| `bindClassMemberSetField` |  | `void bindClassMemberSetField(const std::string& fieldName, F FC::*setFunction)` |
| `bindClassMemberSetField` |  | `void bindClassMemberSetField(const std::string& className, const std::string& fieldName, F FC::*setFunction)` |
| `bindGlobalFunction` |  | `void bindGlobalFunction(const std::string& functionName, const F& function)` |
| `safeRunScript` | Loads and runs a script, any errors are printed to stdout and returns false | `bool safeRunScript(const std::string& fileName)` |
| `runScript` | Loads and runs a script @exception LuaException is thrown on any lua error | `void runScript(const std::string& fileName)` |
| `runBuffer` | Loads and runs the script from buffer @exception LuaException is thrown on any lua error | `void runBuffer(const std::string& buffer, const std::string& source)` |
| `loadScript` | Loads a script file and pushes it's main function onto stack, @exception LuaException is thrown on a | `void loadScript(const std::string& fileName)` |
| `loadFunction` | Loads a function from buffer and pushes it onto stack, @exception LuaException is thrown on any lua  | `void loadFunction(const std::string& buffer, const std::string& source = "lua function buffer")` |
| `evaluateExpression` | Evaluates a lua expression and pushes the result value onto the stack @exception LuaException is thr | `void evaluateExpression(const std::string& expression, const std::string& source = "lua expression")` |
| `traceback` | Generates a traceback message for the current call stack @param errorMessage is an additional error  | `std::string traceback(const std::string& errorMessage = "", int level = 0)` |
| `throwError` | Throw a lua error if inside a lua call or generates an C++ stdext::exception @param message is the e | `void throwError(const std::string& message)` |
| `getCurrentSourcePath` | Searches for the source of the current running function | `std::string getCurrentSourcePath(int level = 0)` |
| `getCurrentFunction` | gets current function name | `std::string getCurrentFunction(int level = 0)` |
| `safeCall` | @brief Calls a function The function and arguments must be on top of the stack in order, results are | `int safeCall(int numArgs = 0, int numRets = -1, const std::shared_ptr<std::string>& error = nullptr)` |
| `signalCall` | Same as safeCall but catches exceptions and can also calls a table of functions, if any error occurs | `int signalCall(int numArgs = 0, int numRets = -1)` |
| `newSandboxEnv` | @brief Creates a new environment table The new environment table is redirected to the global environ | `int newSandboxEnv()` |
| `luaCallGlobalField` |  | `int luaCallGlobalField(const std::string& global, const std::string& field, const T&... args)` |
| `callGlobalField` |  | `void callGlobalField(const std::string& global, const std::string& field, const T&... args)` |
| `callGlobalField` |  | `R callGlobalField(const std::string& global, const std::string& field, const T&... args)` |
| `isInCppCallback` |  | `bool isInCppCallback() { return m_cppCallbackDepth != 0; }` |
| `createLuaState` |  | `void createLuaState()` |
| `closeLuaState` |  | `void closeLuaState()` |
| `collectGarbage` |  | `void collectGarbage()` |
| `loadBuffer` |  | `void loadBuffer(const std::string& buffer, const std::string& source)` |
| `generateByteCode` |  | `std::string generateByteCode(const std::string & buffer, std::string source)` |
| `pcall` |  | `int pcall(int numArgs = 0, int numRets = 0, int errorFuncIndex = 0)` |
| `call` |  | `void call(int numArgs = 0, int numRets = 0)` |
| `error` |  | `void error()` |
| `ref` |  | `int ref()` |
| `weakRef` |  | `int weakRef()` |
| `unref` |  | `void unref(int ref)` |
| `useValue` |  | `void useValue() { pushValue(); ref(); }` |
| `functionSourcePath` |  | `std::string functionSourcePath()` |
| `functionSource` |  | `std::string functionSource()` |
| `insert` |  | `void insert(int index)` |
| `remove` |  | `void remove(int index)` |
| `next` |  | `bool next(int index = -2)` |
| `checkStack` |  | `void checkStack() { VALIDATE(getTop() <= 20); }` |
| `getStackFunction` |  | `void getStackFunction(int level = 0)` |
| `getRef` |  | `void getRef(int ref)` |
| `getWeakRef` |  | `void getWeakRef(int weakRef)` |
| `getGlobalEnvironment` |  | `int getGlobalEnvironment() { return m_globalEnv; }` |
| `setGlobalEnvironment` |  | `void setGlobalEnvironment(int env)` |
| `resetGlobalEnvironment` |  | `void resetGlobalEnvironment() { setGlobalEnvironment(m_globalEnv); }` |
| `setMetatable` |  | `void setMetatable(int index = -2)` |
| `getMetatable` |  | `void getMetatable(int index = -1)` |
| `getField` |  | `void getField(const char* key, int index = -1)` |
| `getField` |  | `void getField(const std::string& key, int index = -1) { return getField(key.c_str(), index); }` |
| `setField` |  | `void setField(const char* key, int index = -2)` |
| `setField` |  | `void setField(const std::string& key, int index = -2) { return setField(key.c_str(), index); }` |
| `getTable` |  | `void getTable(int index = -2)` |
| `setTable` |  | `void setTable(int index = -3)` |
| `clearTable` |  | `void clearTable(int index = -1)` |
| `getEnv` |  | `void getEnv(int index = -1)` |
| `setEnv` |  | `void setEnv(int index = -2)` |
| `getGlobal` |  | `void getGlobal(const std::string& key)` |
| `getGlobalField` |  | `void getGlobalField(const std::string& globalKey, const std::string& fieldKey)` |
| `setGlobal` |  | `void setGlobal(const std::string& key)` |
| `rawGet` |  | `void rawGet(int index = -1)` |
| `rawGeti` |  | `void rawGeti(int n, int index = -1)` |
| `rawSet` |  | `void rawSet(int index = -3)` |
| `rawSeti` |  | `void rawSeti(int n, int index = -2)` |
| `newTable` |  | `void newTable()` |
| `createTable` |  | `void createTable(int narr, int nrec)` |
| `pop` |  | `void pop(int n = 1)` |
| `popInteger` |  | `long popInteger()` |
| `popNumber` |  | `double popNumber()` |
| `popBoolean` |  | `bool popBoolean()` |
| `popString` |  | `std::string popString()` |
| `popObject` |  | `LuaObjectPtr popObject()` |
| `pushNil` |  | `void pushNil()` |
| `pushInteger` |  | `void pushInteger(long v)` |
| `pushNumber` |  | `void pushNumber(double v)` |
| `pushBoolean` |  | `void pushBoolean(bool v)` |
| `pushCString` |  | `void pushCString(const char* v)` |
| `pushString` |  | `void pushString(const std::string& v)` |
| `pushLightUserdata` |  | `void pushLightUserdata(void* p)` |
| `pushThread` |  | `void pushThread()` |
| `pushValue` |  | `void pushValue(int index = -1)` |
| `pushObject` |  | `void pushObject(const LuaObjectPtr& obj)` |
| `pushCFunction` |  | `void pushCFunction(LuaCFunction func, int n = 0)` |
| `pushCppFunction` |  | `void pushCppFunction(const LuaCppFunction& func)` |
| `isNil` |  | `bool isNil(int index = -1)` |
| `isBoolean` |  | `bool isBoolean(int index = -1)` |
| `isNumber` |  | `bool isNumber(int index = -1)` |
| `isString` |  | `bool isString(int index = -1)` |
| `isTable` |  | `bool isTable(int index = -1)` |
| `isFunction` |  | `bool isFunction(int index = -1)` |
| `isCFunction` |  | `bool isCFunction(int index = -1)` |
| `isLuaFunction` |  | `bool isLuaFunction(int index = -1)  { return (isFunction() && !isCFunction()); }` |
| `isUserdata` |  | `bool isUserdata(int index = -1)` |
| `toBoolean` |  | `bool toBoolean(int index = -1)` |
| `toInteger` |  | `int toInteger(int index = -1)` |
| `toNumber` |  | `double toNumber(int index = -1)` |
| `toString` |  | `std::string toString(int index = -1)` |
| `toObject` |  | `LuaObjectPtr toObject(int index = -1)` |
| `getTop` |  | `int getTop()` |
| `stackSize` |  | `int stackSize() { return getTop(); }` |
| `clearStack` |  | `void clearStack() { pop(stackSize()); }` |
| `hasIndex` |  | `bool hasIndex(int index) { return (stackSize() >= (index < 0 ? -index : index) && index != 0); }` |
| `getSource` |  | `std::string getSource(int level = 2)` |
| `loadFiles` |  | `void loadFiles(std::string directory, bool recursive = false, std::string contains = "")` |
| `polymorphicPush` |  | `int polymorphicPush(const T& v, const Args&... args)` |
| `polymorphicPush` |  | `int polymorphicPush() { return 0; }` |
| `castValue` |  | `T castValue(int index = -1)` |
| `polymorphicPop` |  | `T polymorphicPop() { T v = castValue<T>(); pop(1); return v; }` |

## Functions

### `int`

**Sygnatura:** `typedef int (*LuaCFunction) (lua_State *L)`

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `registerFunctions`

Register core script functions

**Sygnatura:** `void registerFunctions()`

### `registerSingletonClass`

**Sygnatura:** `void registerSingletonClass(const std::string& className)`

### `registerClass`

**Sygnatura:** `void registerClass(const std::string& className, const std::string& baseClass = "LuaObject")`

### `registerClass`

**Sygnatura:** `void registerClass() {`

### `registerClassStaticFunction`

**Sygnatura:** `void registerClassStaticFunction(const std::string& functionName, const LuaCppFunction& function) {`

### `registerClassMemberFunction`

**Sygnatura:** `void registerClassMemberFunction(const std::string& functionName, const LuaCppFunction& function) {`

### `bindSingletonFunction`

**Sygnatura:** `void bindSingletonFunction(const std::string& functionName, F C::*function, C *instance)`

### `bindSingletonFunction`

**Sygnatura:** `void bindSingletonFunction(const std::string& className, const std::string& functionName, F C::* function, C* instance)`

### `bindSingletonFunction`

**Sygnatura:** `void bindSingletonFunction(const std::string& className, const std::string& functionName, const F& function)`

### `bindClassStaticFunction`

**Sygnatura:** `void bindClassStaticFunction(const std::string& functionName, const F& function)`

### `bindClassStaticFunction`

**Sygnatura:** `void bindClassStaticFunction(const std::string& className, const std::string& functionName, const F& function)`

### `bindClassMemberFunction`

**Sygnatura:** `void bindClassMemberFunction(const std::string& functionName, F FC::*function)`

### `bindClassMemberFunction`

**Sygnatura:** `void bindClassMemberFunction(const std::string& className, const std::string& functionName, F FC::*function)`

### `bindClassMemberField`

**Sygnatura:** `void bindClassMemberField(const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)`

### `bindClassMemberField`

**Sygnatura:** `void bindClassMemberField(const std::string& className, const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)`

### `bindClassMemberGetField`

**Sygnatura:** `void bindClassMemberGetField(const std::string& fieldName, F FC::*getFunction)`

### `bindClassMemberGetField`

**Sygnatura:** `void bindClassMemberGetField(const std::string& className, const std::string& fieldName, F FC::*getFunction)`

### `bindClassMemberSetField`

**Sygnatura:** `void bindClassMemberSetField(const std::string& fieldName, F FC::*setFunction)`

### `bindClassMemberSetField`

**Sygnatura:** `void bindClassMemberSetField(const std::string& className, const std::string& fieldName, F FC::*setFunction)`

### `bindGlobalFunction`

**Sygnatura:** `void bindGlobalFunction(const std::string& functionName, const F& function)`

### `luaObjectGetEvent`

Metamethod that will retrieve fields values (that include functions) from the object when using '.' or ':'

**Sygnatura:** `static int luaObjectGetEvent(LuaInterface* lua)`

### `luaObjectSetEvent`

Metamethod that is called when setting a field of the object by using the keyword '='

**Sygnatura:** `static int luaObjectSetEvent(LuaInterface* lua)`

### `luaObjectEqualEvent`

Metamethod that will check equality of objects by using the keyword '=='

**Sygnatura:** `static int luaObjectEqualEvent(LuaInterface* lua)`

### `luaObjectCollectEvent`

Metamethod that is called every two lua garbage collections for any LuaObject that have no references left in lua environment anymore, thus this creates the possibility of holding an object existence by lua until it got no references left

**Sygnatura:** `static int luaObjectCollectEvent(LuaInterface* lua)`

### `safeRunScript`

Loads and runs a script, any errors are printed to stdout and returns false

**Sygnatura:** `bool safeRunScript(const std::string& fileName)`

### `runScript`

Loads and runs a script @exception LuaException is thrown on any lua error

**Sygnatura:** `void runScript(const std::string& fileName)`

### `runBuffer`

Loads and runs the script from buffer @exception LuaException is thrown on any lua error

**Sygnatura:** `void runBuffer(const std::string& buffer, const std::string& source)`

### `loadScript`

Loads a script file and pushes it's main function onto stack, @exception LuaException is thrown on any lua error

**Sygnatura:** `void loadScript(const std::string& fileName)`

### `loadFunction`

Loads a function from buffer and pushes it onto stack, @exception LuaException is thrown on any lua error

**Sygnatura:** `void loadFunction(const std::string& buffer, const std::string& source = "lua function buffer")`

### `evaluateExpression`

Evaluates a lua expression and pushes the result value onto the stack @exception LuaException is thrown on any lua error

**Sygnatura:** `void evaluateExpression(const std::string& expression, const std::string& source = "lua expression")`

### `traceback`

Generates a traceback message for the current call stack @param errorMessage is an additional error message @param level is the level of the traceback, 0 means trace from calling function @return the generated traceback message

**Sygnatura:** `std::string traceback(const std::string& errorMessage = "", int level = 0)`

### `throwError`

Throw a lua error if inside a lua call or generates an C++ stdext::exception @param message is the error message wich will be displayed before the error traceback @exception stdext::exception is thrown with the error message if the error is not captured by lua

**Sygnatura:** `void throwError(const std::string& message)`

### `getCurrentSourcePath`

Searches for the source of the current running function

**Sygnatura:** `std::string getCurrentSourcePath(int level = 0)`

### `getCurrentFunction`

gets current function name

**Sygnatura:** `std::string getCurrentFunction(int level = 0)`

### `safeCall`

@brief Calls a function The function and arguments must be on top of the stack in order, results are pushed onto the stack. @exception LuaException is thrown on any lua error @return number of results

**Sygnatura:** `int safeCall(int numArgs = 0, int numRets = -1, const std::shared_ptr<std::string>& error = nullptr)`

### `signalCall`

Same as safeCall but catches exceptions and can also calls a table of functions, if any error occurs it will be reported to stdout and returns 0 results @param requestedResults is the number of results requested to pushes onto the stack, if supplied, the call will always pushes that number of results, even if it fails

**Sygnatura:** `int signalCall(int numArgs = 0, int numRets = -1)`

### `newSandboxEnv`

@brief Creates a new environment table The new environment table is redirected to the global environment (aka _G), this allows to access global variables from _G in the new environment and prevents new variables in this new environment to be set on the global environment

**Sygnatura:** `int newSandboxEnv()`

### `luaCallGlobalField`

**Sygnatura:** `int luaCallGlobalField(const std::string& global, const std::string& field, const T&... args)`

### `callGlobalField`

**Sygnatura:** `void callGlobalField(const std::string& global, const std::string& field, const T&... args)`

### `callGlobalField`

**Sygnatura:** `R callGlobalField(const std::string& global, const std::string& field, const T&... args)`

### `isInCppCallback`

**Sygnatura:** `bool isInCppCallback() { return m_cppCallbackDepth != 0; }`

### `luaScriptLoader`

Load scripts requested by lua 'require'

**Sygnatura:** `static int luaScriptLoader(lua_State* L)`

### `lua_dofile`

Run scripts requested by lua 'dofile'

**Sygnatura:** `static int lua_dofile(lua_State* L)`

### `lua_dofiles`

Run scripts requested by lua 'dofiles'

**Sygnatura:** `static int lua_dofiles(lua_State* L)`

### `lua_loadfile`

Run scripts requested by lua 'dofiles'

**Sygnatura:** `static int lua_loadfile(lua_State* L)`

### `luaErrorHandler`

Handle lua errors from safeCall

**Sygnatura:** `static int luaErrorHandler(lua_State* L)`

### `luaCppFunctionCallback`

Handle bound cpp functions callbacks

**Sygnatura:** `static int luaCppFunctionCallback(lua_State* L)`

### `luaCollectCppFunction`

Collect bound cpp function pointers

**Sygnatura:** `static int luaCollectCppFunction(lua_State* L)`

### `createLuaState`

**Sygnatura:** `void createLuaState()`

### `closeLuaState`

**Sygnatura:** `void closeLuaState()`

### `collectGarbage`

**Sygnatura:** `void collectGarbage()`

### `loadBuffer`

**Sygnatura:** `void loadBuffer(const std::string& buffer, const std::string& source)`

### `generateByteCode`

**Sygnatura:** `std::string generateByteCode(const std::string & buffer, std::string source)`

### `pcall`

**Sygnatura:** `int pcall(int numArgs = 0, int numRets = 0, int errorFuncIndex = 0)`

### `call`

**Sygnatura:** `void call(int numArgs = 0, int numRets = 0)`

### `error`

**Sygnatura:** `void error()`

### `ref`

**Sygnatura:** `int ref()`

### `weakRef`

**Sygnatura:** `int weakRef()`

### `unref`

**Sygnatura:** `void unref(int ref)`

### `useValue`

**Sygnatura:** `void useValue() { pushValue(); ref(); }`

### `functionSourcePath`

**Sygnatura:** `std::string functionSourcePath()`

### `functionSource`

**Sygnatura:** `std::string functionSource()`

### `insert`

**Sygnatura:** `void insert(int index)`

### `remove`

**Sygnatura:** `void remove(int index)`

### `next`

**Sygnatura:** `bool next(int index = -2)`

### `checkStack`

**Sygnatura:** `void checkStack() { VALIDATE(getTop() <= 20); }`

### `getStackFunction`

**Sygnatura:** `void getStackFunction(int level = 0)`

### `getRef`

**Sygnatura:** `void getRef(int ref)`

### `getWeakRef`

**Sygnatura:** `void getWeakRef(int weakRef)`

### `getGlobalEnvironment`

**Sygnatura:** `int getGlobalEnvironment() { return m_globalEnv; }`

### `setGlobalEnvironment`

**Sygnatura:** `void setGlobalEnvironment(int env)`

### `resetGlobalEnvironment`

**Sygnatura:** `void resetGlobalEnvironment() { setGlobalEnvironment(m_globalEnv); }`

### `setMetatable`

**Sygnatura:** `void setMetatable(int index = -2)`

### `getMetatable`

**Sygnatura:** `void getMetatable(int index = -1)`

### `getField`

**Sygnatura:** `void getField(const char* key, int index = -1)`

### `getField`

**Sygnatura:** `void getField(const std::string& key, int index = -1) { return getField(key.c_str(), index); }`

### `setField`

**Sygnatura:** `void setField(const char* key, int index = -2)`

### `setField`

**Sygnatura:** `void setField(const std::string& key, int index = -2) { return setField(key.c_str(), index); }`

### `getTable`

**Sygnatura:** `void getTable(int index = -2)`

### `setTable`

**Sygnatura:** `void setTable(int index = -3)`

### `clearTable`

**Sygnatura:** `void clearTable(int index = -1)`

### `getEnv`

**Sygnatura:** `void getEnv(int index = -1)`

### `setEnv`

**Sygnatura:** `void setEnv(int index = -2)`

### `getGlobal`

**Sygnatura:** `void getGlobal(const std::string& key)`

### `getGlobalField`

**Sygnatura:** `void getGlobalField(const std::string& globalKey, const std::string& fieldKey)`

### `setGlobal`

**Sygnatura:** `void setGlobal(const std::string& key)`

### `rawGet`

**Sygnatura:** `void rawGet(int index = -1)`

### `rawGeti`

**Sygnatura:** `void rawGeti(int n, int index = -1)`

### `rawSet`

**Sygnatura:** `void rawSet(int index = -3)`

### `rawSeti`

**Sygnatura:** `void rawSeti(int n, int index = -2)`

### `newTable`

**Sygnatura:** `void newTable()`

### `createTable`

**Sygnatura:** `void createTable(int narr, int nrec)`

### `pop`

**Sygnatura:** `void pop(int n = 1)`

### `popInteger`

**Sygnatura:** `long popInteger()`

### `popNumber`

**Sygnatura:** `double popNumber()`

### `popBoolean`

**Sygnatura:** `bool popBoolean()`

### `popString`

**Sygnatura:** `std::string popString()`

### `popObject`

**Sygnatura:** `LuaObjectPtr popObject()`

### `pushNil`

**Sygnatura:** `void pushNil()`

### `pushInteger`

**Sygnatura:** `void pushInteger(long v)`

### `pushNumber`

**Sygnatura:** `void pushNumber(double v)`

### `pushBoolean`

**Sygnatura:** `void pushBoolean(bool v)`

### `pushCString`

**Sygnatura:** `void pushCString(const char* v)`

### `pushString`

**Sygnatura:** `void pushString(const std::string& v)`

### `pushLightUserdata`

**Sygnatura:** `void pushLightUserdata(void* p)`

### `pushThread`

**Sygnatura:** `void pushThread()`

### `pushValue`

**Sygnatura:** `void pushValue(int index = -1)`

### `pushObject`

**Sygnatura:** `void pushObject(const LuaObjectPtr& obj)`

### `pushCFunction`

**Sygnatura:** `void pushCFunction(LuaCFunction func, int n = 0)`

### `pushCppFunction`

**Sygnatura:** `void pushCppFunction(const LuaCppFunction& func)`

### `isNil`

**Sygnatura:** `bool isNil(int index = -1)`

### `isBoolean`

**Sygnatura:** `bool isBoolean(int index = -1)`

### `isNumber`

**Sygnatura:** `bool isNumber(int index = -1)`

### `isString`

**Sygnatura:** `bool isString(int index = -1)`

### `isTable`

**Sygnatura:** `bool isTable(int index = -1)`

### `isFunction`

**Sygnatura:** `bool isFunction(int index = -1)`

### `isCFunction`

**Sygnatura:** `bool isCFunction(int index = -1)`

### `isLuaFunction`

**Sygnatura:** `bool isLuaFunction(int index = -1)  { return (isFunction() && !isCFunction()); }`

### `isUserdata`

**Sygnatura:** `bool isUserdata(int index = -1)`

### `toBoolean`

**Sygnatura:** `bool toBoolean(int index = -1)`

### `toInteger`

**Sygnatura:** `int toInteger(int index = -1)`

### `toNumber`

**Sygnatura:** `double toNumber(int index = -1)`

### `toString`

**Sygnatura:** `std::string toString(int index = -1)`

### `toObject`

**Sygnatura:** `LuaObjectPtr toObject(int index = -1)`

### `getTop`

**Sygnatura:** `int getTop()`

### `stackSize`

**Sygnatura:** `int stackSize() { return getTop(); }`

### `clearStack`

**Sygnatura:** `void clearStack() { pop(stackSize()); }`

### `hasIndex`

**Sygnatura:** `bool hasIndex(int index) { return (stackSize() >= (index < 0 ? -index : index) && index != 0); }`

### `getSource`

**Sygnatura:** `std::string getSource(int level = 2)`

### `loadFiles`

**Sygnatura:** `void loadFiles(std::string directory, bool recursive = false, std::string contains = "")`

### `polymorphicPush`

**Sygnatura:** `int polymorphicPush(const T& v, const Args&... args)`

### `polymorphicPush`

**Sygnatura:** `int polymorphicPush() { return 0; }`

### `castValue`

**Sygnatura:** `T castValue(int index = -1)`

### `polymorphicPop`

**Sygnatura:** `T polymorphicPop() { T v = castValue<T>(); pop(1); return v; }`

### `LuaBadValueCastException`

**Sygnatura:** `throw LuaBadValueCastException(typeName(index), stdext::demangle_type<T>())`

### `s`

**Sygnatura:** `AutoStat s(STATS_LUA, std::string(global) + ":" + field)`

## Class Diagram

Zobacz: [../diagrams/luainterface.mmd](../diagrams/luainterface.mmd)

---
doc_id: "cpp-api-beaef2d6673d"
source_path: "framework/core/logger.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: logger.h"
summary: "Dokumentacja API C++ dla framework/core/logger.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/logger.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu logger.

## Classes/Structs

### Struktura: `LogMessage`

### Klasa: `Logger`

| Member | Brief | Signature |
|--------|-------|-----------|
| `log` |  | `void log(Fw::LogLevel level, const std::string& message)` |
| `logFunc` |  | `void logFunc(Fw::LogLevel level, const std::string& message, std::string prettyFunction)` |
| `debug` |  | `void debug(const std::string& what) { log(Fw::LogDebug, what); }` |
| `info` |  | `void info(const std::string& what) { log(Fw::LogInfo, what); }` |
| `warning` |  | `void warning(const std::string& what) { log(Fw::LogWarning, what); }` |
| `error` |  | `void error(const std::string& what) { log(Fw::LogError, what); }` |
| `fatal` |  | `void fatal(const std::string& what) { log(Fw::LogFatal, what); }` |
| `fireOldMessages` |  | `void fireOldMessages()` |
| `setLogFile` |  | `void setLogFile(const std::string& file)` |
| `setOnLog` |  | `void setOnLog(const OnLogCallback& onLog) { m_onLog = onLog; }` |
| `getLastLog` |  | `std::string getLastLog() {` |
| `m_lastLog` |  | `return m_lastLog` |
| `setTestingMode` |  | `void setTestingMode()` |

## Functions

### `log`

**Sygnatura:** `void log(Fw::LogLevel level, const std::string& message)`

### `logFunc`

**Sygnatura:** `void logFunc(Fw::LogLevel level, const std::string& message, std::string prettyFunction)`

### `debug`

**Sygnatura:** `void debug(const std::string& what) { log(Fw::LogDebug, what); }`

### `info`

**Sygnatura:** `void info(const std::string& what) { log(Fw::LogInfo, what); }`

### `warning`

**Sygnatura:** `void warning(const std::string& what) { log(Fw::LogWarning, what); }`

### `error`

**Sygnatura:** `void error(const std::string& what) { log(Fw::LogError, what); }`

### `fatal`

**Sygnatura:** `void fatal(const std::string& what) { log(Fw::LogFatal, what); }`

### `fireOldMessages`

**Sygnatura:** `void fireOldMessages()`

### `setLogFile`

**Sygnatura:** `void setLogFile(const std::string& file)`

### `setOnLog`

**Sygnatura:** `void setOnLog(const OnLogCallback& onLog) { m_onLog = onLog; }`

### `getLastLog`

**Sygnatura:** `std::string getLastLog() {`

### `setTestingMode`

**Sygnatura:** `void setTestingMode()`

## Types/Aliases

### `OnLogCallback`

**Typedef:** `std::function<void(Fw::LogLevel, const std::string&, int64)>`

## Class Diagram

Zobacz: [../diagrams/logger.mmd](../diagrams/logger.mmd)

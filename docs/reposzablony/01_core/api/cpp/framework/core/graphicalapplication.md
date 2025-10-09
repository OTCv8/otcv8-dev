---
doc_id: "cpp-api-e1de8d6a1499"
source_path: "framework/core/graphicalapplication.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: graphicalapplication.h"
summary: "Dokumentacja API C++ dla framework/core/graphicalapplication.h"
tags: ["cpp", "api", "otclient"]
---

# framework/core/graphicalapplication.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu graphicalapplication.

## Classes/Structs

### Klasa: `GraphicalApplication`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init(std::vector<std::string>& args)` |
| `deinit` |  | `void deinit()` |
| `terminate` |  | `void terminate()` |
| `run` |  | `void run()` |
| `poll` |  | `void poll()` |
| `pollGraphics` |  | `void pollGraphics()` |
| `close` |  | `void close()` |
| `willRepaint` |  | `bool willRepaint() { return m_mustRepaint; }` |
| `repaint` |  | `void repaint() { m_mustRepaint = true; }` |
| `setMaxFps` |  | `void setMaxFps(int maxFps) { m_maxFps = maxFps; }` |
| `getMaxFps` |  | `int getMaxFps() { return m_maxFps; }` |
| `getFps` |  | `int getFps() { return m_graphicsFrames.getFps(); }` |
| `getGraphicsFps` |  | `int getGraphicsFps() { return m_graphicsFrames.getFps(); }` |
| `getProcessingFps` |  | `int getProcessingFps() { return m_processingFrames.getFps(); }` |
| `isOnInputEvent` |  | `bool isOnInputEvent() { return m_onInputEvent; }` |
| `getIteration` |  | `int getIteration() {` |
| `m_iteration` |  | `return m_iteration` |
| `doScreenshot` |  | `void doScreenshot(std::string file)` |
| `scaleUp` |  | `void scaleUp()` |
| `scaleDown` |  | `void scaleDown()` |
| `scale` |  | `void scale(float value)` |
| `setSmooth` |  | `void setSmooth(bool value)` |
| `doMapScreenshot` |  | `void doMapScreenshot(std::string fileName)` |
| `resize` |  | `void resize(const Size& size)` |
| `inputEvent` |  | `void inputEvent(InputEvent event)` |

## Functions

### `init`

**Sygnatura:** `void init(std::vector<std::string>& args)`

### `deinit`

**Sygnatura:** `void deinit()`

### `terminate`

**Sygnatura:** `void terminate()`

### `run`

**Sygnatura:** `void run()`

### `poll`

**Sygnatura:** `void poll()`

### `pollGraphics`

**Sygnatura:** `void pollGraphics()`

### `close`

**Sygnatura:** `void close()`

### `willRepaint`

**Sygnatura:** `bool willRepaint() { return m_mustRepaint; }`

### `repaint`

**Sygnatura:** `void repaint() { m_mustRepaint = true; }`

### `setMaxFps`

**Sygnatura:** `void setMaxFps(int maxFps) { m_maxFps = maxFps; }`

### `getMaxFps`

**Sygnatura:** `int getMaxFps() { return m_maxFps; }`

### `getFps`

**Sygnatura:** `int getFps() { return m_graphicsFrames.getFps(); }`

### `getGraphicsFps`

**Sygnatura:** `int getGraphicsFps() { return m_graphicsFrames.getFps(); }`

### `getProcessingFps`

**Sygnatura:** `int getProcessingFps() { return m_processingFrames.getFps(); }`

### `isOnInputEvent`

**Sygnatura:** `bool isOnInputEvent() { return m_onInputEvent; }`

### `getIteration`

**Sygnatura:** `int getIteration() {`

### `doScreenshot`

**Sygnatura:** `void doScreenshot(std::string file)`

### `scaleUp`

**Sygnatura:** `void scaleUp()`

### `scaleDown`

**Sygnatura:** `void scaleDown()`

### `scale`

**Sygnatura:** `void scale(float value)`

### `setSmooth`

**Sygnatura:** `void setSmooth(bool value)`

### `doMapScreenshot`

**Sygnatura:** `void doMapScreenshot(std::string fileName)`

### `resize`

**Sygnatura:** `void resize(const Size& size)`

### `inputEvent`

**Sygnatura:** `void inputEvent(InputEvent event)`

## Class Diagram

Zobacz: [../diagrams/graphicalapplication.mmd](../diagrams/graphicalapplication.mmd)

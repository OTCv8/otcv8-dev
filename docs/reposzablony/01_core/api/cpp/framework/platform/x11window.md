---
doc_id: "cpp-api-34cabdbad7c9"
source_path: "framework/platform/x11window.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: x11window.h"
summary: "Dokumentacja API C++ dla framework/platform/x11window.h"
tags: ["cpp", "api", "otclient"]
---

# framework/platform/x11window.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu x11window.

## Classes/Structs

### Klasa: `X11Window`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `move` |  | `void move(const Point& pos)` |
| `resize` |  | `void resize(const Size& size)` |
| `show` |  | `void show()` |
| `hide` |  | `void hide()` |
| `minimize` |  | `void minimize()` |
| `maximize` |  | `void maximize()` |
| `poll` |  | `void poll()` |
| `swapBuffers` |  | `void swapBuffers()` |
| `showMouse` |  | `void showMouse()` |
| `hideMouse` |  | `void hideMouse()` |
| `setMouseCursor` |  | `void setMouseCursor(int cursorId)` |
| `restoreMouseCursor` |  | `void restoreMouseCursor()` |
| `setTitle` |  | `void setTitle(const std::string& title)` |
| `setMinimumSize` |  | `void setMinimumSize(const Size& minimumSize)` |
| `setFullscreen` |  | `void setFullscreen(bool fullscreen)` |
| `setVerticalSync` |  | `void setVerticalSync(bool enable)` |
| `setIcon` |  | `void setIcon(const std::string& file)` |
| `setClipboardText` |  | `void setClipboardText(const std::string& text)` |
| `getDisplaySize` |  | `Size getDisplaySize()` |
| `getClipboardText` |  | `std::string getClipboardText()` |
| `getPlatformType` |  | `std::string getPlatformType()` |
| `displayFatalError` |  | `void displayFatalError(const std::string& message)` |
| `internalLoadMouseCursor` |  | `int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)` |

## Functions

### `internalOpenDisplay`

**Sygnatura:** `void internalOpenDisplay()`

### `internalCreateWindow`

**Sygnatura:** `void internalCreateWindow()`

### `internalSetupWindowInput`

**Sygnatura:** `bool internalSetupWindowInput()`

### `internalCheckGL`

**Sygnatura:** `void internalCheckGL()`

### `internalChooseGLVisual`

**Sygnatura:** `void internalChooseGLVisual()`

### `internalCreateGLContext`

**Sygnatura:** `void internalCreateGLContext()`

### `internalDestroyGLContext`

**Sygnatura:** `void internalDestroyGLContext()`

### `internalConnectGLContext`

**Sygnatura:** `void internalConnectGLContext()`

### `isExtensionSupported`

**Sygnatura:** `bool isExtensionSupported(const char *ext)`

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `move`

**Sygnatura:** `void move(const Point& pos)`

### `resize`

**Sygnatura:** `void resize(const Size& size)`

### `show`

**Sygnatura:** `void show()`

### `hide`

**Sygnatura:** `void hide()`

### `minimize`

**Sygnatura:** `void minimize()`

### `maximize`

**Sygnatura:** `void maximize()`

### `poll`

**Sygnatura:** `void poll()`

### `swapBuffers`

**Sygnatura:** `void swapBuffers()`

### `showMouse`

**Sygnatura:** `void showMouse()`

### `hideMouse`

**Sygnatura:** `void hideMouse()`

### `setMouseCursor`

**Sygnatura:** `void setMouseCursor(int cursorId)`

### `restoreMouseCursor`

**Sygnatura:** `void restoreMouseCursor()`

### `setTitle`

**Sygnatura:** `void setTitle(const std::string& title)`

### `setMinimumSize`

**Sygnatura:** `void setMinimumSize(const Size& minimumSize)`

### `setFullscreen`

**Sygnatura:** `void setFullscreen(bool fullscreen)`

### `setVerticalSync`

**Sygnatura:** `void setVerticalSync(bool enable)`

### `setIcon`

**Sygnatura:** `void setIcon(const std::string& file)`

### `setClipboardText`

**Sygnatura:** `void setClipboardText(const std::string& text)`

### `getDisplaySize`

**Sygnatura:** `Size getDisplaySize()`

### `getClipboardText`

**Sygnatura:** `std::string getClipboardText()`

### `getPlatformType`

**Sygnatura:** `std::string getPlatformType()`

### `displayFatalError`

**Sygnatura:** `void displayFatalError(const std::string& message)`

### `internalLoadMouseCursor`

**Sygnatura:** `int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)`

## Class Diagram

Zobacz: [../diagrams/x11window.mmd](../diagrams/x11window.mmd)

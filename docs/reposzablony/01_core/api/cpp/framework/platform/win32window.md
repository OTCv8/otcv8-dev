---
doc_id: "cpp-api-c9932ed43ace"
source_path: "framework/platform/win32window.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: win32window.h"
summary: "Dokumentacja API C++ dla framework/platform/win32window.h"
tags: ["cpp", "api", "otclient"]
---

# framework/platform/win32window.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu win32window.

## Classes/Structs

### Struktura: `WindowProcProxy`

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
| `displayFatalError` |  | `void displayFatalError(const std::string& message)` |
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
| `flash` |  | `void flash() override` |
| `internalLoadMouseCursor` |  | `int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)` |

### Klasa: `WIN32Window`

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
| `displayFatalError` |  | `void displayFatalError(const std::string& message)` |
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
| `flash` |  | `void flash() override` |
| `internalLoadMouseCursor` |  | `int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)` |

## Functions

### `internalSetupTimerAccuracy`

**Sygnatura:** `void internalSetupTimerAccuracy()`

### `internalCreateWindow`

**Sygnatura:** `void internalCreateWindow()`

### `internalCreateGLContext`

**Sygnatura:** `void internalCreateGLContext()`

### `internalDestroyGLContext`

**Sygnatura:** `void internalDestroyGLContext()`

### `internalRestoreGLContext`

**Sygnatura:** `void internalRestoreGLContext()`

### `isExtensionSupported`

**Sygnatura:** `bool isExtensionSupported(const char *ext)`

### `windowProc`

**Sygnatura:** `LRESULT windowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)`

### `dispatcherWindowProc`

**Sygnatura:** `LRESULT dispatcherWindowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)`

### `retranslateVirtualKey`

**Sygnatura:** `Fw::Key retranslateVirtualKey(WPARAM wParam, LPARAM lParam)`

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

### `displayFatalError`

**Sygnatura:** `void displayFatalError(const std::string& message)`

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

### `flash`

**Sygnatura:** `void flash() override`

### `internalLoadMouseCursor`

**Sygnatura:** `int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)`

### `getClientRect`

**Sygnatura:** `Rect getClientRect()`

### `getWindowRect`

**Sygnatura:** `Rect getWindowRect()`

### `adjustWindowRect`

**Sygnatura:** `Rect adjustWindowRect(const Rect& rect)`

## Class Diagram

Zobacz: [../diagrams/win32window.mmd](../diagrams/win32window.mmd)

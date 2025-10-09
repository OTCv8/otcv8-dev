---
doc_id: "cpp-api-d6decd2c7c9c"
source_path: "framework/platform/sdlwindow.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: sdlwindow.h"
summary: "Dokumentacja API C++ dla framework/platform/sdlwindow.h"
tags: ["cpp", "api", "otclient"]
---

# framework/platform/sdlwindow.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu sdlwindow.

## Classes/Structs

### Klasa: `SDLWindow`

## Enums

### `EventType`

**Wartości:**

- `TOUCH_DOWN`
- `TOUCH_UP`
- `TOUCH_MOTION`
- `TOUCH_LONGPRESS`
- `KEY_DOWN`
- `KEY_UP`
- `TEXTINPUT`
- `EVENT_UNDEFINED`

### `NativeMessage`

**Wartości:**

- `RECREATE_CONTEXT`
- `APP_TERMINATE`

## Functions

### `internalInitGL`

**Sygnatura:** `void internalInitGL()`

### `internalDestroyGL`

**Sygnatura:** `void internalDestroyGL()`

### `internalCheckGL`

**Sygnatura:** `void internalCheckGL()`

### `internalChooseGL`

**Sygnatura:** `void internalChooseGL()`

### `internalCreateGLContext`

**Sygnatura:** `void internalCreateGLContext()`

### `internalDestroyGLContext`

**Sygnatura:** `void internalDestroyGLContext()`

### `internalConnectGLContext`

**Sygnatura:** `void internalConnectGLContext()`

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

**Sygnatura:** `void setIcon(const std::string& iconFile)`

### `setClipboardText`

**Sygnatura:** `void setClipboardText(const std::string& text)`

### `getDisplaySize`

**Sygnatura:** `Size getDisplaySize()`

### `getClipboardText`

**Sygnatura:** `std::string getClipboardText()`

### `getPlatformType`

**Sygnatura:** `std::string getPlatformType()`

### `displayFatalError`

**Sygnatura:** `void displayFatalError(const std::string& message) override`

### `showTextEditor`

**Sygnatura:** `void showTextEditor(const std::string& title, const std::string& description, const std::string& text, int flags) override`

### `updateSize`

**Sygnatura:** `void updateSize()`

### `handleTextInput`

**Sygnatura:** `void handleTextInput(std::string text)`

### `openUrl`

**Sygnatura:** `void openUrl(std::string url)`

### `internalLoadMouseCursor`

**Sygnatura:** `int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot) override { return -1; }`

## Class Diagram

Zobacz: [../diagrams/sdlwindow.mmd](../diagrams/sdlwindow.mmd)

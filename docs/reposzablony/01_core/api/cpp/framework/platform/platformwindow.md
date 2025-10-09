---
doc_id: "cpp-api-5b2c967baa92"
source_path: "framework/platform/platformwindow.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: platformwindow.h"
summary: "Dokumentacja API C++ dla framework/platform/platformwindow.h"
tags: ["cpp", "api", "otclient"]
---

# framework/platform/platformwindow.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu platformwindow.

## Classes/Structs

### Klasa: `PlatformWindow`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `virtual void init() = 0` |
| `terminate` |  | `virtual void terminate() = 0` |
| `move` |  | `virtual void move(const Point& pos) = 0` |
| `resize` |  | `virtual void resize(const Size& size) = 0` |
| `show` |  | `virtual void show() = 0` |
| `hide` |  | `virtual void hide() = 0` |
| `minimize` |  | `virtual void minimize() = 0` |
| `maximize` |  | `virtual void maximize() = 0` |
| `poll` |  | `virtual void poll() = 0` |
| `swapBuffers` |  | `virtual void swapBuffers() = 0` |
| `showMouse` |  | `virtual void showMouse() = 0` |
| `hideMouse` |  | `virtual void hideMouse() = 0` |
| `displayFatalError` |  | `virtual void displayFatalError(const std::string& message) { }` |
| `loadMouseCursor` |  | `int loadMouseCursor(const std::string& file, const Point& hotSpot)` |
| `setMouseCursor` |  | `virtual void setMouseCursor(int cursorId) = 0` |
| `restoreMouseCursor` |  | `virtual void restoreMouseCursor() = 0` |
| `setTitle` |  | `virtual void setTitle(const std::string& title) = 0` |
| `setMinimumSize` |  | `virtual void setMinimumSize(const Size& minimumSize) = 0` |
| `setFullscreen` |  | `virtual void setFullscreen(bool fullscreen) = 0` |
| `setVerticalSync` |  | `virtual void setVerticalSync(bool enable) = 0` |
| `setIcon` |  | `virtual void setIcon(const std::string& iconFile) = 0` |
| `setClipboardText` |  | `virtual void setClipboardText(const std::string& text) = 0` |
| `hasVerticalSync` |  | `bool hasVerticalSync() { return m_verticalSync; }` |
| `getDisplaySize` |  | `virtual Size getDisplaySize() = 0` |
| `getClipboardText` |  | `virtual std::string getClipboardText() = 0` |
| `getPlatformType` |  | `virtual std::string getPlatformType() = 0` |
| `getDisplayWidth` |  | `int getDisplayWidth() { return getDisplaySize().width(); }` |
| `getDisplayHeight` |  | `int getDisplayHeight() { return getDisplaySize().height(); }` |
| `getUnmaximizedSize` |  | `Size getUnmaximizedSize() { return m_unmaximizedSize; }` |
| `getSize` |  | `Size getSize() { return m_size; }` |
| `getMinimumSize` |  | `Size getMinimumSize() { return m_minimumSize; }` |
| `getWidth` |  | `int getWidth() { return m_size.width(); }` |
| `getHeight` |  | `int getHeight() { return m_size.height(); }` |
| `getUnmaximizedPos` |  | `Point getUnmaximizedPos() { return m_unmaximizedPos; }` |
| `getPosition` |  | `Point getPosition() { return m_position; }` |
| `getX` |  | `int getX() { return m_position.x; }` |
| `getY` |  | `int getY() { return m_position.y; }` |
| `getMousePosition` |  | `Point getMousePosition() { return m_inputEvent.mousePos; }` |
| `getKeyboardModifiers` |  | `int getKeyboardModifiers() { return m_inputEvent.keyboardModifiers; }` |
| `isKeyPressed` |  | `bool isKeyPressed(Fw::Key keyCode) { return m_keysState[keyCode]; }` |
| `isMouseButtonPressed` |  | `bool isMouseButtonPressed(Fw::MouseButton mouseButton) { return m_mouseButtonStates[mouseButton]; }` |
| `isVisible` |  | `bool isVisible() { return m_visible; }` |
| `isMaximized` |  | `bool isMaximized() { return m_maximized; }` |
| `isFullscreen` |  | `bool isFullscreen() { return m_fullscreen; }` |
| `hasFocus` |  | `bool hasFocus() { return m_focused; }` |
| `setOnClose` |  | `void setOnClose(const std::function<void()>& onClose) { m_onClose = onClose; }` |
| `setOnResize` |  | `void setOnResize(const OnResizeCallback& onResize) { m_onResize = onResize; }` |
| `setOnInputEvent` |  | `void setOnInputEvent(const OnInputEventCallback& onInputEvent) { m_onInputEvent = onInputEvent; }` |
| `showTextEditor` |  | `virtual void showTextEditor(const std::string& title, const std::string& description, const std::string& text, int flags) {}` |
| `handleTextInput` |  | `virtual void handleTextInput(std::string text) {} // for android` |
| `setScaling` |  | `void setScaling(float scaling) { m_scaling = scaling; }` |
| `flash` |  | `virtual void flash()` |
| `internalLoadMouseCursor` |  | `virtual int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot) = 0` |
| `updateUnmaximizedCoords` |  | `void updateUnmaximizedCoords()` |
| `processKeyDown` |  | `void processKeyDown(Fw::Key keyCode)` |
| `processKeyUp` |  | `void processKeyUp(Fw::Key keyCode)` |
| `releaseAllKeys` |  | `void releaseAllKeys()` |
| `fireKeysPress` |  | `void fireKeysPress()` |
| `m_keyMap` |  | `std::map<int, Fw::Key> m_keyMap` |
| `m_firstKeysPress` |  | `std::map<Fw::Key, ticks_t> m_firstKeysPress` |
| `m_lastKeysPress` |  | `std::map<Fw::Key, ticks_t> m_lastKeysPress` |
| `m_keyPressTimer` |  | `Timer m_keyPressTimer` |
| `m_size` |  | `Size m_size` |
| `m_minimumSize` |  | `Size m_minimumSize` |
| `m_position` |  | `Point m_position` |
| `m_unmaximizedSize` |  | `Size m_unmaximizedSize` |
| `m_unmaximizedPos` |  | `Point m_unmaximizedPos` |
| `m_inputEvent` |  | `InputEvent m_inputEvent` |
| `m_created` |  | `stdext::boolean<false> m_created` |
| `m_visible` |  | `stdext::boolean<false> m_visible` |
| `m_focused` |  | `stdext::boolean<false> m_focused` |
| `m_fullscreen` |  | `stdext::boolean<false> m_fullscreen` |
| `m_maximized` |  | `stdext::boolean<false> m_maximized` |
| `m_verticalSync` |  | `bool m_verticalSync = false` |
| `m_scaling` |  | `float m_scaling = 1.0` |
| `m_onClose` |  | `std::function<void()> m_onClose` |
| `m_onResize` |  | `OnResizeCallback m_onResize` |
| `m_onInputEvent` |  | `OnInputEventCallback m_onInputEvent` |

## Functions

### `loadMouseCursor`

**Sygnatura:** `int loadMouseCursor(const std::string& file, const Point& hotSpot)`

### `hasVerticalSync`

**Sygnatura:** `bool hasVerticalSync() { return m_verticalSync; }`

### `getDisplayWidth`

**Sygnatura:** `int getDisplayWidth() { return getDisplaySize().width(); }`

### `getDisplayHeight`

**Sygnatura:** `int getDisplayHeight() { return getDisplaySize().height(); }`

### `getUnmaximizedSize`

**Sygnatura:** `Size getUnmaximizedSize() { return m_unmaximizedSize; }`

### `getSize`

**Sygnatura:** `Size getSize() { return m_size; }`

### `getMinimumSize`

**Sygnatura:** `Size getMinimumSize() { return m_minimumSize; }`

### `getWidth`

**Sygnatura:** `int getWidth() { return m_size.width(); }`

### `getHeight`

**Sygnatura:** `int getHeight() { return m_size.height(); }`

### `getUnmaximizedPos`

**Sygnatura:** `Point getUnmaximizedPos() { return m_unmaximizedPos; }`

### `getPosition`

**Sygnatura:** `Point getPosition() { return m_position; }`

### `getX`

**Sygnatura:** `int getX() { return m_position.x; }`

### `getY`

**Sygnatura:** `int getY() { return m_position.y; }`

### `getMousePosition`

**Sygnatura:** `Point getMousePosition() { return m_inputEvent.mousePos; }`

### `getKeyboardModifiers`

**Sygnatura:** `int getKeyboardModifiers() { return m_inputEvent.keyboardModifiers; }`

### `isKeyPressed`

**Sygnatura:** `bool isKeyPressed(Fw::Key keyCode) { return m_keysState[keyCode]; }`

### `isMouseButtonPressed`

**Sygnatura:** `bool isMouseButtonPressed(Fw::MouseButton mouseButton) { return m_mouseButtonStates[mouseButton]; }`

### `isVisible`

**Sygnatura:** `bool isVisible() { return m_visible; }`

### `isMaximized`

**Sygnatura:** `bool isMaximized() { return m_maximized; }`

### `isFullscreen`

**Sygnatura:** `bool isFullscreen() { return m_fullscreen; }`

### `hasFocus`

**Sygnatura:** `bool hasFocus() { return m_focused; }`

### `setOnClose`

**Sygnatura:** `void setOnClose(const std::function<void()>& onClose) { m_onClose = onClose; }`

### `setOnResize`

**Sygnatura:** `void setOnResize(const OnResizeCallback& onResize) { m_onResize = onResize; }`

### `setOnInputEvent`

**Sygnatura:** `void setOnInputEvent(const OnInputEventCallback& onInputEvent) { m_onInputEvent = onInputEvent; }`

### `setScaling`

**Sygnatura:** `void setScaling(float scaling) { m_scaling = scaling; }`

### `updateUnmaximizedCoords`

**Sygnatura:** `void updateUnmaximizedCoords()`

### `processKeyDown`

**Sygnatura:** `void processKeyDown(Fw::Key keyCode)`

### `processKeyUp`

**Sygnatura:** `void processKeyUp(Fw::Key keyCode)`

### `releaseAllKeys`

**Sygnatura:** `void releaseAllKeys()`

### `fireKeysPress`

**Sygnatura:** `void fireKeysPress()`

## Types/Aliases

### `OnResizeCallback`

**Typedef:** `std::function<void(const Size&)>`

### `OnInputEventCallback`

**Typedef:** `std::function<void(const InputEvent&)>`

## Class Diagram

Zobacz: [../diagrams/platformwindow.mmd](../diagrams/platformwindow.mmd)

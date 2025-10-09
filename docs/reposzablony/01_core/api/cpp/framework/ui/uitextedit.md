---
doc_id: "cpp-api-173bf19a30c3"
source_path: "framework/ui/uitextedit.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uitextedit.h"
summary: "Dokumentacja API C++ dla framework/ui/uitextedit.h"
tags: ["cpp", "api", "otclient"]
---

# framework/ui/uitextedit.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uitextedit.

## Classes/Structs

### Klasa: `UITextEdit`

| Member | Brief | Signature |
|--------|-------|-----------|
| `drawSelf` |  | `void drawSelf(Fw::DrawPane drawPane)` |
| `setCursorPos` |  | `void setCursorPos(int pos)` |
| `setSelection` |  | `void setSelection(int start, int end)` |
| `setCursorVisible` |  | `void setCursorVisible(bool enable) { m_cursorVisible = enable; }` |
| `setTextHidden` |  | `void setTextHidden(bool hidden)` |
| `setValidCharacters` |  | `void setValidCharacters(const std::string validCharacters) { m_validCharacters = validCharacters; }` |
| `setShiftNavigation` |  | `void setShiftNavigation(bool enable) { m_shiftNavigation = enable; }` |
| `setMultiline` |  | `void setMultiline(bool enable) { m_multiline = enable; }` |
| `setMaxLength` |  | `void setMaxLength(uint maxLength) { m_maxLength = maxLength; }` |
| `setTextVirtualOffset` |  | `void setTextVirtualOffset(const Point& offset)` |
| `setEditable` |  | `void setEditable(bool editable) { m_editable = editable; }` |
| `setSelectable` |  | `void setSelectable(bool selectable) { m_selectable = selectable; }` |
| `setSelectionColor` |  | `void setSelectionColor(const Color& color) { m_selectionColor = color; }` |
| `setSelectionBackgroundColor` |  | `void setSelectionBackgroundColor(const Color& color) { m_selectionBackgroundColor = color; }` |
| `setAutoScroll` |  | `void setAutoScroll(bool autoScroll) { m_autoScroll = autoScroll; }` |
| `setAutoSubmit` |  | `void setAutoSubmit(bool autoSubmit) { m_autoSubmit = autoSubmit; }` |
| `setPlaceholder` |  | `void setPlaceholder(std::string placeholder) { m_placeholder = placeholder; }` |
| `setPlaceholderColor` |  | `void setPlaceholderColor(const Color& color) { m_placeholderColor = color; }` |
| `setPlaceholderAlign` |  | `void setPlaceholderAlign(Fw::AlignmentFlag align) { m_placeholderAlign = align; }` |
| `setPlaceholderFont` |  | `void setPlaceholderFont(const std::string& fontName)` |
| `moveCursorHorizontally` |  | `void moveCursorHorizontally(bool right)` |
| `moveCursorVertically` |  | `void moveCursorVertically(bool up)` |
| `appendText` |  | `void appendText(std::string text)` |
| `appendCharacter` |  | `void appendCharacter(char c)` |
| `removeCharacter` |  | `void removeCharacter(bool right)` |
| `blinkCursor` |  | `void blinkCursor()` |
| `del` |  | `void del(bool right = false)` |
| `paste` |  | `void paste(const std::string& text)` |
| `copy` |  | `std::string copy()` |
| `cut` |  | `std::string cut()` |
| `selectAll` |  | `void selectAll() { setSelection(0, m_text.length()); }` |
| `clearSelection` |  | `void clearSelection() { setSelection(0, 0); }` |
| `wrapText` |  | `void wrapText()` |
| `getDisplayedText` |  | `std::string getDisplayedText()` |
| `getSelection` |  | `std::string getSelection()` |
| `getTextPos` |  | `int getTextPos(Point pos)` |
| `getCursorPos` |  | `int getCursorPos() { return m_cursorPos; }` |
| `getTextVirtualOffset` |  | `Point getTextVirtualOffset() { return m_textVirtualOffset; }` |
| `getTextVirtualSize` |  | `Size getTextVirtualSize() { return m_textVirtualSize; }` |
| `getTextTotalSize` |  | `Size getTextTotalSize() { return m_textTotalSize; }` |
| `getMaxLength` |  | `uint getMaxLength() { return m_maxLength; }` |
| `getSelectionStart` |  | `int getSelectionStart() { return m_selectionStart; }` |
| `getSelectionEnd` |  | `int getSelectionEnd() { return m_selectionEnd; }` |
| `getSelectionColor` |  | `Color getSelectionColor() { return m_selectionColor; }` |
| `getSelectionBackgroundColor` |  | `Color getSelectionBackgroundColor() { return m_selectionBackgroundColor; }` |
| `hasSelection` |  | `bool hasSelection() { return m_selectionEnd - m_selectionStart > 0; }` |
| `isCursorVisible` |  | `bool isCursorVisible() { return m_cursorVisible; }` |
| `isTextHidden` |  | `bool isTextHidden() { return m_textHidden; }` |
| `isShiftNavigation` |  | `bool isShiftNavigation() { return m_shiftNavigation; }` |
| `isMultiline` |  | `bool isMultiline() { return m_multiline; }` |
| `isEditable` |  | `bool isEditable() { return m_editable; }` |
| `isSelectable` |  | `bool isSelectable() { return m_selectable; }` |
| `isAutoScrolling` |  | `bool isAutoScrolling() { return m_autoScroll; }` |
| `updateText` |  | `void updateText()` |
| `onStyleApply` |  | `virtual void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)` |
| `onGeometryChange` |  | `virtual void onGeometryChange(const Rect& oldRect, const Rect& newRect)` |
| `onFocusChange` |  | `virtual void onFocusChange(bool focused, Fw::FocusReason reason)` |
| `onKeyText` |  | `virtual bool onKeyText(const std::string& keyText)` |
| `onKeyPress` |  | `virtual bool onKeyPress(uchar keyCode, int keyboardModifiers, int autoRepeatTicks)` |
| `onMousePress` |  | `virtual bool onMousePress(const Point& mousePos, Fw::MouseButton button)` |
| `onMouseRelease` |  | `virtual bool onMouseRelease(const Point& mousePos, Fw::MouseButton button)` |
| `onMouseMove` |  | `virtual bool onMouseMove(const Point& mousePos, const Point& mouseMoved)` |
| `onDoubleClick` |  | `virtual bool onDoubleClick(const Point& mousePos)` |
| `onTextAreaUpdate` |  | `virtual void onTextAreaUpdate(const Point& vitualOffset, const Size& virtualSize, const Size& totalSize)` |

## Functions

### `drawSelf`

**Sygnatura:** `void drawSelf(Fw::DrawPane drawPane)`

### `update`

**Sygnatura:** `void update(bool focusCursor = false)`

### `setCursorPos`

**Sygnatura:** `void setCursorPos(int pos)`

### `setSelection`

**Sygnatura:** `void setSelection(int start, int end)`

### `setCursorVisible`

**Sygnatura:** `void setCursorVisible(bool enable) { m_cursorVisible = enable; }`

### `setTextHidden`

**Sygnatura:** `void setTextHidden(bool hidden)`

### `setValidCharacters`

**Sygnatura:** `void setValidCharacters(const std::string validCharacters) { m_validCharacters = validCharacters; }`

### `setShiftNavigation`

**Sygnatura:** `void setShiftNavigation(bool enable) { m_shiftNavigation = enable; }`

### `setMultiline`

**Sygnatura:** `void setMultiline(bool enable) { m_multiline = enable; }`

### `setMaxLength`

**Sygnatura:** `void setMaxLength(uint maxLength) { m_maxLength = maxLength; }`

### `setTextVirtualOffset`

**Sygnatura:** `void setTextVirtualOffset(const Point& offset)`

### `setEditable`

**Sygnatura:** `void setEditable(bool editable) { m_editable = editable; }`

### `setSelectable`

**Sygnatura:** `void setSelectable(bool selectable) { m_selectable = selectable; }`

### `setSelectionColor`

**Sygnatura:** `void setSelectionColor(const Color& color) { m_selectionColor = color; }`

### `setSelectionBackgroundColor`

**Sygnatura:** `void setSelectionBackgroundColor(const Color& color) { m_selectionBackgroundColor = color; }`

### `setAutoScroll`

**Sygnatura:** `void setAutoScroll(bool autoScroll) { m_autoScroll = autoScroll; }`

### `setAutoSubmit`

**Sygnatura:** `void setAutoSubmit(bool autoSubmit) { m_autoSubmit = autoSubmit; }`

### `setPlaceholder`

**Sygnatura:** `void setPlaceholder(std::string placeholder) { m_placeholder = placeholder; }`

### `setPlaceholderColor`

**Sygnatura:** `void setPlaceholderColor(const Color& color) { m_placeholderColor = color; }`

### `setPlaceholderAlign`

**Sygnatura:** `void setPlaceholderAlign(Fw::AlignmentFlag align) { m_placeholderAlign = align; }`

### `setPlaceholderFont`

**Sygnatura:** `void setPlaceholderFont(const std::string& fontName)`

### `moveCursorHorizontally`

**Sygnatura:** `void moveCursorHorizontally(bool right)`

### `moveCursorVertically`

**Sygnatura:** `void moveCursorVertically(bool up)`

### `appendText`

**Sygnatura:** `void appendText(std::string text)`

### `appendCharacter`

**Sygnatura:** `void appendCharacter(char c)`

### `removeCharacter`

**Sygnatura:** `void removeCharacter(bool right)`

### `blinkCursor`

**Sygnatura:** `void blinkCursor()`

### `del`

**Sygnatura:** `void del(bool right = false)`

### `paste`

**Sygnatura:** `void paste(const std::string& text)`

### `copy`

**Sygnatura:** `std::string copy()`

### `cut`

**Sygnatura:** `std::string cut()`

### `selectAll`

**Sygnatura:** `void selectAll() { setSelection(0, m_text.length()); }`

### `clearSelection`

**Sygnatura:** `void clearSelection() { setSelection(0, 0); }`

### `wrapText`

**Sygnatura:** `void wrapText()`

### `getDisplayedText`

**Sygnatura:** `std::string getDisplayedText()`

### `getSelection`

**Sygnatura:** `std::string getSelection()`

### `getTextPos`

**Sygnatura:** `int getTextPos(Point pos)`

### `getCursorPos`

**Sygnatura:** `int getCursorPos() { return m_cursorPos; }`

### `getTextVirtualOffset`

**Sygnatura:** `Point getTextVirtualOffset() { return m_textVirtualOffset; }`

### `getTextVirtualSize`

**Sygnatura:** `Size getTextVirtualSize() { return m_textVirtualSize; }`

### `getTextTotalSize`

**Sygnatura:** `Size getTextTotalSize() { return m_textTotalSize; }`

### `getMaxLength`

**Sygnatura:** `uint getMaxLength() { return m_maxLength; }`

### `getSelectionStart`

**Sygnatura:** `int getSelectionStart() { return m_selectionStart; }`

### `getSelectionEnd`

**Sygnatura:** `int getSelectionEnd() { return m_selectionEnd; }`

### `getSelectionColor`

**Sygnatura:** `Color getSelectionColor() { return m_selectionColor; }`

### `getSelectionBackgroundColor`

**Sygnatura:** `Color getSelectionBackgroundColor() { return m_selectionBackgroundColor; }`

### `hasSelection`

**Sygnatura:** `bool hasSelection() { return m_selectionEnd - m_selectionStart > 0; }`

### `isCursorVisible`

**Sygnatura:** `bool isCursorVisible() { return m_cursorVisible; }`

### `isTextHidden`

**Sygnatura:** `bool isTextHidden() { return m_textHidden; }`

### `isShiftNavigation`

**Sygnatura:** `bool isShiftNavigation() { return m_shiftNavigation; }`

### `isMultiline`

**Sygnatura:** `bool isMultiline() { return m_multiline; }`

### `isEditable`

**Sygnatura:** `bool isEditable() { return m_editable; }`

### `isSelectable`

**Sygnatura:** `bool isSelectable() { return m_selectable; }`

### `isAutoScrolling`

**Sygnatura:** `bool isAutoScrolling() { return m_autoScroll; }`

### `updateText`

**Sygnatura:** `void updateText()`

### `disableUpdates`

**Sygnatura:** `void disableUpdates() { m_updatesEnabled = false; }`

### `enableUpdates`

**Sygnatura:** `void enableUpdates() { m_updatesEnabled = true; }`

### `recacheGlyphs`

**Sygnatura:** `void recacheGlyphs() { m_glyphsMustRecache = true; }`

## Class Diagram

Zobacz: [../diagrams/uitextedit.mmd](../diagrams/uitextedit.mmd)

---
doc_id: "lua-spec-aeffebd62eda"
source_path: "client_terminal/terminal.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:04Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: terminal.lua"
summary: "Dokumentacja modułu Lua dla client_terminal/terminal.lua"
tags: ["lua", "module", "otclient"]
---

# client_terminal/terminal.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla terminal.

## Globals/Exports

### `cachedLines`

### `cachedLines`

### `allLines`

## Functions

### `navigateCommand(step)`

private functions

**Parametry:**

- `step`

### `completeCommand()`

### `doCommand(textWidget)`

**Parametry:**

- `textWidget`

### `addNewline(textWidget)`

**Parametry:**

- `textWidget`

### `onCommandChange(textWidget, newText, oldText)`

**Parametry:**

- `textWidget`
- `newText`
- `oldText`

### `onLog(level, message, time)`

**Parametry:**

- `level`
- `message`
- `time`

### `init()`

public functions

### `terminalSelectText.onMouseWheel(a,b,c)`

**Parametry:**

- `a`
- `b`
- `c`

### `terminalBuffer.onScrollChange(self, value)`

**Parametry:**

- `self`
- `value`

### `terminate()`

### `hideButton()`

### `popWindow()`

### `toggle()`

### `show()`

### `hide()`

### `disable()`

### `flushLines()`

### `addLine(text, color)`

**Parametry:**

- `text`
- `color`

### `terminalPrint(value)`

**Parametry:**

- `value`

### `executeCommand(command)`

**Parametry:**

- `command`

### `func()`

### `clear()`

## Events/Callbacks

### `CommandChange`

**Wywołanie:** `local function onCommandChange(textWidget, newText, oldText)`

### `Log`

**Wywołanie:** `local function onLog(level, message, time)`

### `displayUI`

**Wywołanie:** `terminalWindow = g_ui.displayUI('terminal')`

### `commandTextEdit`

**Wywołanie:** `connect(commandTextEdit, {onTextChange = onCommandChange})`

### `MouseWheel`

**Wywołanie:** `terminalSelectText.onMouseWheel = function(a,b,c) terminalBuffer:onMouseWheel(b,c) end`

### `createWidget`

**Wywołanie:** `local label = g_ui.createWidget('TerminalLabel', terminalBuffer)`

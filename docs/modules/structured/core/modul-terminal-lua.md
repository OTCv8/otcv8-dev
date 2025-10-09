# Modu: Modu: `terminal.lua`
**Rola:** *(krtko  13 zdania co robi modu i gdzie jest uywany).*

## Zakres
-

## Punkty wejcia
- **Lua:**
- **C++/IPC:**

## UI / OTUI
- Pliki OTUI:
- Kluczowe widety:

## Integracje i zalenoci
- Wsppracuje z:

## Scenariusze
1.
2.

## API (linki)
- [API Lua  klient](../../api/lua/luafunctions_client.md)
- [Engine  Spec UI](../../api/engine/otclient_v_8_specyfikacja_ui.md)

---

> **Uwagi migracyjne**
>
> Ten modu pochodzi z: modules/modules_core.md

### Zaimportowana tre (legacy)
#### Opis

-- configs

-- private variables


#### Funkcje

- `navigateCommand(step)`
- `completeCommand()`
- `doCommand(textWidget)`
- `addNewline(textWidget)`
- `onCommandChange(textWidget, newText, oldText)`
- `onLog(level, message, time)`
- `init()`
- `terminate()`
- `hideButton()`
- `popWindow()`
- `toggle()`
- `show()`
- `hide()`
- `disable()`
- `flushLines()`
- `addLine(text, color)`
- `terminalPrint(value)`
- `executeCommand(command)`
- `clear()`
- `local navigateCommand(step)`
- `local completeCommand()`
- `local doCommand(textWidget)`
- `local addNewline(textWidget)`
- `local onCommandChange(textWidget, newText, oldText)`
- `local onLog(level, message, time)`


#### Eventy / Hooki

- `connect`
- `onCommandChange`
- `onDoubleClick`
- `onLog`
- `onMouseWheel`
- `onScrollChange`
- `onTextChange`
- `one`
- `scheduleEvent`


#### Wywoania API

- `g_game`
- `g_keyboard`
- `g_ui`
- `g_window`

---

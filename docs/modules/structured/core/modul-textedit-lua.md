# Modu: Modu: `textedit.lua`
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

-- also works as show(text, callback)

-- callback = function(newText)


#### Funkcje

- `init()`
- `terminate()`
- `destroyWindow()`
- `show(text, options, callback)`
- `hide()`
- `edit(...)`
- `singlelineEditor(text, callback)`
- `multilineEditor(description, text, callback)`


#### Eventy / Hooki

- `connect`
- `onClick`
- `onDestroy`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onOptionChange`
- `onTextChange`


#### Wywoania API

- `g_ui`
- `g_window`

---

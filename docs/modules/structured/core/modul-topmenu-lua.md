# Modu: Modu: `topmenu.lua`
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

-- private variables

-- private functions


#### Funkcje

- `addButton(id, description, icon, callback, panel, toggle, front, index)`
- `init()`
- `terminate()`
- `online()`
- `offline()`
- `updateFps()`
- `updatePing(ping)`
- `setPingVisible(enable)`
- `setFpsVisible(enable)`
- `addLeftButton(id, description, icon, callback, front, index)`
- `addLeftToggleButton(id, description, icon, callback, front, index)`
- `addRightButton(id, description, icon, callback, front, index)`
- `addRightToggleButton(id, description, icon, callback, front, index)`
- `addLeftGameButton(id, description, icon, callback, front, index)`
- `addLeftGameToggleButton(id, description, icon, callback, front, index)`
- `addRightGameButton(id, description, icon, callback, front, index)`
- `addRightGameToggleButton(id, description, icon, callback, front, index)`
- `showGameButtons()`
- `hideGameButtons()`
- `getButton(id)`
- `getTopMenu()`
- `toggle()`
- `hide()`
- `show()`
- `updateStatus()`
- `local addButton(id, description, icon, callback, panel, toggle, front, index)`


#### Eventy / Hooki

- `addEvent`
- `connect`
- `onClick`
- `onGameEnd`
- `onGameStart`
- `onMouseRelease`
- `onPingBack`
- `onTouchRelease`
- `online`
- `onlineLabel`
- `scheduleEvent`


#### Wywoania API

- `g_game`
- `g_keyboard`
- `g_ui`

---

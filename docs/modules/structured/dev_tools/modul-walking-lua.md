# Modu: Modu: `walking.lua`
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
> Ten modu pochodzi z: modules/modules_misc.md

### Zaimportowana tre (legacy)
#### Funkcje

- `init()`
- `terminate()`
- `bindKeys()`
- `unbindKeys()`
- `enableWSAD()`
- `disableWSAD()`
- `bindWalkKey(key, dir)`
- `unbindWalkKey(key)`
- `bindTurnKey(key, dir)`
- `unbindTurnKey(key)`
- `stopSmartWalk()`
- `changeWalkDir(dir, pop)`
- `smartWalk(dir, ticks)`
- `canChangeFloorDown(pos)`
- `canChangeFloorUp(pos)`
- `onPositionChange(player, newPos, oldPos)`
- `onWalk(player, newPos, oldPos)`
- `onTeleport(player, newPos, oldPos)`
- `onWalkFinish(player)`
- `onCancelWalk(player)`
- `walk(dir, ticks)`
- `turn(dir, repeated)`
- `checkTurn()`


#### Eventy / Hooki

- `addEvent`
- `connect`
- `onCancelWalk`
- `onFocusChange`
- `onPositionChange`
- `onTeleport`
- `onWalk`
- `onWalkFinish`
- `scheduleEvent`


#### Wywoania API

- `g_clock`
- `g_game`
- `g_keyboard`
- `g_map`

---

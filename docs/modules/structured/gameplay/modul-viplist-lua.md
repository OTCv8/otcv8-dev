# Modu: Modu: `viplist.lua`
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
> Ten modu pochodzi z: modules/modules_game_2.md

### Zaimportowana tre (legacy)
#### Funkcje

- `init()`
- `terminate()`
- `loadVipInfo()`
- `saveVipInfo()`
- `refresh()`
- `clear()`
- `toggle()`
- `onMiniWindowClose()`
- `createAddWindow()`
- `createEditWindow(widget)`
- `destroyAddWindow()`
- `addVip()`
- `removeVip(widgetOrName)`
- `hideOffline(state)`
- `isHiddingOffline()`
- `getSortedBy()`
- `sortBy(state)`
- `onAddVip(id, name, state, description, iconId, notify)`
- `onVipStateChange(id, state)`
- `onVipListMousePress(widget, mousePos, mouseButton)`
- `onVipListLabelMousePress(widget, mousePos, mouseButton)`


#### Eventy / Hooki

- `connect`
- `onAddVip`
- `onClick`
- `onDoubleClick`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onGameStart`
- `onMiniWindowClose`
- `onMousePress`
- `onVipListLabelMousePress`
- `onVipListMousePress`
- `onVipStateChange`


#### Wywoania API

- `g_game`
- `g_keyboard`
- `g_ui`
- `g_window`

---

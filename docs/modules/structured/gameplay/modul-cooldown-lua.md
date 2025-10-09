# Modu: Modu: `cooldown.lua`
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
- `loadIcon(iconId)`
- `onMiniWindowClose()`
- `toggle()`
- `online()`
- `refresh()`
- `removeCooldown(progressRect)`
- `turnOffCooldown(progressRect)`
- `initCooldown(progressRect, updateCallback, finishCallback)`
- `updateCooldown(progressRect, duration)`
- `isGroupCooldownIconActive(groupId)`
- `isCooldownIconActive(iconId)`
- `onSpellCooldown(iconId, duration)`
- `onSpellGroupCooldown(groupId, duration)`


#### Eventy / Hooki

- `connect`
- `onEffectEnd`
- `onGameStart`
- `onMiniWindowClose`
- `onSpellCooldown`
- `onSpellGroupCooldown`
- `online`
- `scheduleEvent`


#### Wywoania API

- `g_game`
- `g_ui`

---

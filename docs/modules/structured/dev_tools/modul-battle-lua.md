# Modu: Modu: `battle.lua`
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
- `toggle()`
- `onMiniWindowClose()`
- `getSortType()`
- `setSortType(state)`
- `getSortOrder()`
- `setSortOrder(state)`
- `isSortAsc()`
- `isSortDesc()`
- `isHidingFilters()`
- `setHidingFilters(state)`
- `hideFilterPanel()`
- `showFilterPanel()`
- `toggleFilterPanel()`
- `onChangeSortType(comboBox, option, value)`
- `onChangeSortOrder(comboBox, option, value)`
- `updateBattleList()`
- `checkCreatures()`
- `doCreatureFitFilters(creature)`
- `getDistanceBetween(p1, p2)`
- `sortCreatures(creatures)`
- `onBattleButtonMouseRelease(self, mousePosition, mouseButton)`
- `onBattleButtonHoverChange(battleButton, hovered)`
- `onPlayerPositionChange(creature, newPos, oldPos)`
- `updateSquare()`
- `local getDistanceBetween(p1, p2)`


#### Eventy / Hooki

- `addEvent`
- `connect`
- `onAppear`
- `onAttackingCreatureChange`
- `onBattleButtonHoverChange`
- `onBattleButtonMouseRelease`
- `onChangeSortOrder`
- `onChangeSortType`
- `onCreatureAppear`
- `onCreatureDisappear`
- `onDisappear`
- `onFollowed`
- `onFollowingCreatureChange`
- `onHoverChange`
- `onIdle`
- `onMiniWindowClose`
- `onMouseRelease`
- `onOptionChange`
- `onPlayerPositionChange`
- `onPositionChange`
- `onTargeted`
- `scheduleEvent`


#### Wywoania API

- `g_clock`
- `g_game`
- `g_keyboard`
- `g_map`
- `g_mouse`
- `g_ui`

---

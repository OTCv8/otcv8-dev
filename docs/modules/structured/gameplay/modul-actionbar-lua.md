# Modu: Modu: `actionbar.lua`
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
#### Opis

-- servers may have different id's, change if not working properly (only for protocols 910+)

-- ek


#### Funkcje

- `translateVocation(id)`
- `isSpell(text)`
- `init()`
- `terminate()`
- `createActionBars()`
- `offline()`
- `online()`
- `show()`
- `refresh()`
- `translateHotkeyDesc(text)`
- `destroyAssignWindows()`
- `changeLockState(widget)`
- `moveActionButtons(widget)`
- `onDropActionButton(self, mousePosition, mouseButton)`
- `setupActionBar(n)`
- `setupButton(widget)`
- `resetSlot(widget)`
- `assignItem(widget)`
- `assignText(widget)`
- `assignSpell(widget)`
- `filterByVocation(a, filter)`
- `assignHotkey(widget)`
- `setupAction(widget)`
- `onSpellCooldown(iconId, duration)`
- `onSpellGroupCooldown(groupId, duration)`
- `startCooldown(action, duration)`
- `updateCooldown(action)`
- `save()`
- `load()`
- `local translateVocation(id)`
- `local isSpell(text)`
- `local filterByVocation(a, filter)`


#### Eventy / Hooki

- `connect`
- `onCheckChange`
- `onChildFocusChange`
- `onClick`
- `onDragEnter`
- `onDropActionButton`
- `onEnter`
- `onEscape`
- `onGameEnd`
- `onGameStart`
- `onItemChange`
- `onKeyDown`
- `onMouseRelease`
- `onMouseWheel`
- `onSelectionChange`
- `onSpellCooldown`
- `onSpellGroupCooldown`
- `onTextChange`
- `one`
- `online`
- `only`
- `scheduleEvent`


#### Wywoania API

- `g_clock`
- `g_game`
- `g_keyboard`
- `g_mouse`
- `g_ui`

---

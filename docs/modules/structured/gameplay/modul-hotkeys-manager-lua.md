# Modu: Modu: `hotkeys_manager.lua`
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
- `online()`
- `offline()`
- `show()`
- `hide()`
- `toggle()`
- `ok()`
- `cancel()`
- `load(forceDefaults)`
- `unload()`
- `reset()`
- `reload()`
- `save()`
- `onConfigChange()`
- `loadDefautComboKeys()`
- `setDefaultComboKeys(combo)`
- `onChooseItemMouseRelease(self, mousePosition, mouseButton)`
- `startChooseItem()`
- `clearObject()`
- `addHotkey()`
- `addKeyCombo(keyCombo, keySettings, focus)`
- `prepareKeyCombo(keyCombo, ticks)`
- `doKeyCombo(keyCombo, repeated)`
- `updateHotkeyLabel(hotkeyLabel)`
- `updateHotkeyForm(reset)`
- `removeHotkey()`
- `updateHotkeyAction()`
- `onHotkeyTextChange(value)`
- `onSendAutomaticallyChange(autoSend)`
- `onChangeUseType(useTypeWidget)`
- `onSelectHotkeyLabel(hotkeyLabel)`
- `hotkeyCapture(assignWindow, keyCode, keyboardModifiers)`
- `hotkeyCaptureOk(assignWindow, keyCombo)`


#### Eventy / Hooki

- `connect`
- `onChangeUseType`
- `onChildFocusChange`
- `onChooseItemMouseRelease`
- `onConfigChange`
- `onGameEnd`
- `onGameStart`
- `onHotkeyTextChange`
- `onKeyDown`
- `onMouseRelease`
- `onSelectHotkeyLabel`
- `onSelectionChange`
- `onSendAutomaticallyChange`
- `online`
- `scheduleEvent`


#### Wywoania API

- `g_clock`
- `g_game`
- `g_keyboard`
- `g_mouse`
- `g_ui`

---

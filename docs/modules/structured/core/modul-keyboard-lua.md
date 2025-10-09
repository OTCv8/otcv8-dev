# Modu: Modu: `keyboard.lua`
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

-- @docclass

-- private functions


#### Funkcje

- `translateKeyCombo(keyCombo)`
- `getKeyCode(key)`
- `retranslateKeyComboDesc(keyComboDesc)`
- `determineKeyComboDesc(keyCode, keyboardModifiers)`
- `onWidgetKeyDown(widget, keyCode, keyboardModifiers)`
- `onWidgetKeyUp(widget, keyCode, keyboardModifiers)`
- `onWidgetKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)`
- `connectKeyDownEvent(widget)`
- `connectKeyUpEvent(widget)`
- `connectKeyPressEvent(widget)`
- `g_keyboard.bindKeyDown(keyComboDesc, callback, widget, alone)`
- `g_keyboard.bindKeyUp(keyComboDesc, callback, widget, alone)`
- `g_keyboard.bindKeyPress(keyComboDesc, callback, widget)`
- `getUnbindArgs(arg1, arg2)`
- `g_keyboard.unbindKeyDown(keyComboDesc, arg1, arg2)`
- `g_keyboard.unbindKeyUp(keyComboDesc, arg1, arg2)`
- `g_keyboard.unbindKeyPress(keyComboDesc, arg1, arg2)`
- `g_keyboard.getModifiers()`
- `g_keyboard.isKeyPressed(key)`
- `g_keyboard.areKeysPressed(keyComboDesc)`
- `g_keyboard.isKeySetPressed(keys, all)`
- `g_keyboard.isInUse()`
- `g_keyboard.isCtrlPressed()`
- `g_keyboard.isAltPressed()`
- `g_keyboard.isShiftPressed()`
- `local getKeyCode(key)`
- `local onWidgetKeyDown(widget, keyCode, keyboardModifiers)`
- `local onWidgetKeyUp(widget, keyCode, keyboardModifiers)`
- `local onWidgetKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)`
- `local connectKeyDownEvent(widget)`
- `local connectKeyUpEvent(widget)`
- `local connectKeyPressEvent(widget)`
- `local getUnbindArgs(arg1, arg2)`


#### Eventy / Hooki

- `connect`
- `onKeyDown`
- `onKeyPress`
- `onKeyUp`
- `onWidgetKeyDown`
- `onWidgetKeyPress`
- `onWidgetKeyUp`


#### Wywoania API

- `g_keyboard`
- `g_window`

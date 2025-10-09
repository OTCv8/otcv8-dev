# Modu: Modu: `characterlist.lua`
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

- `tryLogin(charInfo, tries)`
- `updateWait(timeStart, timeEnd)`
- `resendWait()`
- `onLoginWait(message, time)`
- `onGameLoginError(message)`
- `onGameLoginToken(unknown)`
- `onGameConnectionError(message, code)`
- `onGameUpdateNeeded(signature)`
- `onGameEnd()`
- `onLogout()`
- `scheduleAutoReconnect()`
- `executeAutoReconnect()`
- `CharacterList.init()`
- `CharacterList.terminate()`
- `CharacterList.create(characters, account, otui)`
- `CharacterList.destroy()`
- `CharacterList.show()`
- `CharacterList.hide(showLogin)`
- `CharacterList.showAgain()`
- `CharacterList.isVisible()`
- `CharacterList.doLogin()`
- `CharacterList.destroyLoadBox()`
- `CharacterList.cancelWait()`
- `local tryLogin(charInfo, tries)`
- `local updateWait(timeStart, timeEnd)`
- `local resendWait()`
- `local onLoginWait(message, time)`


#### Eventy / Hooki

- `addEvent`
- `connect`
- `onCancel`
- `onChildFocusChange`
- `onClick`
- `onConnectionError`
- `onDoubleClick`
- `onGameConnectionError`
- `onGameEnd`
- `onGameLoginError`
- `onGameLoginToken`
- `onGameStart`
- `onGameUpdateNeeded`
- `onLoginError`
- `onLoginToken`
- `onLoginWait`
- `onLogout`
- `onOk`
- `onUpdateNeeded`
- `scheduleEvent`


#### Wywoania API

- `g_clock`
- `g_game`
- `g_ui`

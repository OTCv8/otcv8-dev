# Modu: Modu: `questlog.lua`
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
#### Opis

-- each call delay is also increased by random values (0-callDelay/2)


#### Funkcje

- `init()`
- `terminate()`
- `toggle()`
- `offline()`
- `online()`
- `show(questlog)`
- `back()`
- `showQuestLine()`
- `onGameQuestLog(quests)`
- `onGameQuestLine(questId, questMissions)`
- `onTrackOptionChange(checkbox)`
- `refreshQuests()`
- `refreshTrackerWidgets()`
- `load()`
- `save()`


#### Eventy / Hooki

- `connect`
- `onChildFocusChange`
- `onDoubleClick`
- `onGameEnd`
- `onGameQuestLine`
- `onGameQuestLog`
- `onGameStart`
- `onQuestLine`
- `onQuestLog`
- `onTrackOptionChange`
- `online`
- `scheduleEvent`


#### Wywoania API

- `g_clock`
- `g_game`
- `g_ui`

---

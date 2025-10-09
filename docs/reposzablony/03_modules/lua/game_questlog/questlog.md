---
doc_id: "lua-spec-70442a858bbc"
source_path: "game_questlog/questlog.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:06Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: questlog.lua"
summary: "Dokumentacja modułu Lua dla game_questlog/questlog.lua"
tags: ["lua", "module", "otclient"]
---

# game_questlog/questlog.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla questlog.

## Globals/Exports

### `settings`

## Functions

### `init()`

### `terminate()`

### `toggle()`

### `offline()`

### `online()`

### `onChildFocusChange(self, focusedChild)`

**Parametry:**

- `self`
- `focusedChild`

### `show(questlog)`

**Parametry:**

- `questlog`

### `back()`

### `showQuestLine()`

### `onGameQuestLog(quests)`

**Parametry:**

- `quests`

### `questLabel.onDoubleClick()`

### `onGameQuestLine(questId, questMissions)`

**Parametry:**

- `questId`
- `questMissions`

### `onTrackOptionChange(checkbox)`

**Parametry:**

- `checkbox`

### `refreshQuests()`

### `refreshTrackerWidgets()`

### `load()`

json handlers

### `save()`

## Events/Callbacks

### `importStyle`

**Wywołanie:** `g_ui.importStyle('questlogwindow')`

### `createWidget`

**Wywołanie:** `window = g_ui.createWidget('QuestLogWindow', rootWidget)`

### `createWidget`

**Wywołanie:** `trackerWindow = g_ui.createWidget('QuestTracker', modules.game_interface.getRightPanel())`

### `g_game`

**Wywołanie:** `connect(g_game, { onQuestLog = onGameQuestLog,`

### `line`

**Wywołanie:** `online()`

### `g_game`

**Wywołanie:** `disconnect(g_game, { onQuestLog = onGameQuestLog,`

### `line`

**Wywołanie:** `function online()`

### `missionList`

**Wywołanie:** `connect(missionList, {`

### `GameQuestLog`

**Wywołanie:** `function onGameQuestLog(quests)`

### `createWidget`

**Wywołanie:** `local questLabel = g_ui.createWidget('QuestLabel', questList)`

### `GameQuestLine`

**Wywołanie:** `function onGameQuestLine(questId, questMissions)`

### `createWidget`

questlog

**Wywołanie:** `local missionLabel = g_ui.createWidget('QuestLabel', missionList)`

### `createWidget`

**Wywołanie:** `trackerLabel = trackerLabel or g_ui.createWidget('QuestTrackerLabel', trackerWindow.contentsPanel.list)`

### `TrackOptionChange`

**Wywołanie:** `function onTrackOptionChange(checkbox)`

### `umber`

**Wywołanie:** `local id = tonumber(data[1])`

### `tents`

**Wywołanie:** `return json.decode(g_resources.readFileContents(file))`

### `tents`

**Wywołanie:** `g_resources.writeFileContents(file, result)`

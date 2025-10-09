---
doc_id: "lua-spec-ab4223706390"
source_path: "game_bot/default_configs/vBot_4.8/vBot/new_cavebot_lib.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: new_cavebot_lib.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.8/vBot/new_cavebot_lib.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.8/vBot/new_cavebot_lib.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla new_cavebot_lib.

## Globals/Exports

### `CaveBot`

## Functions

### `CaveBotConfigParse()`

### `getNearTiles(pos)`

**Parametry:**

- `pos`

### `CaveBot.GetLootItems()`

- Parses config and extracts loot list. @return table

**Zwraca:** table

### `CaveBot.HasLootItems()`

- Checks whether player has any visible items to be stashed @return boolean

**Zwraca:** boolean

### `CaveBot.GetLootContainers()`

- Parses config and extracts loot containers. @return table

**Zwraca:** table

### `CaveBot.GetOpenedLootContainers(containerTable)`

- Information about open containers. @param amount is boolean @return table or integer

**Parametry:**

- `containerTable`

**Zwraca:** table or integer

### `CaveBot.PingDelay(multiplayer)`

- Some actions needs to be additionally slowed down in case of high ping. Maximum at 2000ms in case of lag spike. @param multiplayer is integer @return void

**Parametry:**

- `multiplayer`: is integer

**Zwraca:** void

### `CaveBot.CloseLootContainer()`

##################### -- [[ Container class ]] -- ##################### -- - Closes any loot container that is open. @return void or boolean

**Zwraca:** void or boolean

### `CaveBot.CloseAllLootContainers()`

### `CaveBot.OpenLootContainer()`

- Opens any loot container that isn't already opened. @return void or boolean

**Zwraca:** void or boolean

### `CaveBot.MatchPosition(position, distance)`

##################### -- [[[ Position class ]] -- ##################### -- - Compares distance between player position and given pos. @param position is table @param distance is integer @return boolean

**Parametry:**

- `position`: is table
- `distance`: is integer

**Zwraca:** boolean

### `CaveBot.GoTo(position, precision)`

- Stripped down to take less space. Use only to safe position, like pz movement or reaching npc. Needs to be called between 200-500ms to achieve fluid movement. @param position is table @param distance is integer @return void

**Parametry:**

- `position`: is table
- `precision`

**Zwraca:** void

### `CaveBot.ReachNPC(name)`

- Finds position of npc by name and reaches its position. @return void(acion) or boolean

**Parametry:**

- `name`

**Zwraca:** void(acion) or boolean

### `CaveBot.ReachDepot()`

### `CaveBot.OpenLocker()`

- Opens locker item. @return void(acion) or boolean

**Zwraca:** void(acion) or boolean

### `CaveBot.OpenDepotChest()`

- Opens depot chest. @return void(acion) or boolean

**Zwraca:** void(acion) or boolean

### `CaveBot.OpenInbox()`

- Opens inbox inside locker. @return void(acion) or boolean

**Zwraca:** void(acion) or boolean

### `CaveBot.OpenDepotBox(index)`

- Opens depot box of given number. @param index is integer @return void or boolean

**Parametry:**

- `index`: is integer

**Zwraca:** void or boolean

### `CaveBot.ReachAndOpenDepot()`

- Reaches and opens depot. Combined for shorthand usage. @return boolean whether succeed to reach and open depot

**Zwraca:** boolean whether succeed to reach and open depot

### `CaveBot.ReachAndOpenInbox()`

- Reaches and opens imbox. Combined for shorthand usage. @return boolean whether succeed to reach and open depot

**Zwraca:** boolean whether succeed to reach and open depot

### `CaveBot.StashItem(item, index, destination)`

- Stripped down function to stash item. @param item is object @param index is integer @param destination is object @return void

**Parametry:**

- `item`: is object
- `index`: is integer
- `destination`: is object

**Zwraca:** void

### `CaveBot.WithdrawItem(id, amount, fromDepot, destination)`

- Withdraws item from depot chest or mail inbox. main function for depositer/withdrawer @param id is integer @param amount is integer @param fromDepot is boolean or integer @param destination is object @return void

**Parametry:**

- `id`: is integer
- `amount`: is integer
- `fromDepot`: is boolean or integer
- `destination`: is object

**Zwraca:** void

### `CaveBot.Conversation(...)`

##################### -- [[[[[ Talk class ]]]] -- ##################### -- - Controlled by event caller. Simple way to build npc conversations instead of multiline overcopied code. @return void

**Parametry:**

- `...`

**Zwraca:** void

### `CaveBot.OpenNpcTrade()`

- Says hi trade to NPC. Used as shorthand to open NPC trade window. @return void

**Zwraca:** void

### `CaveBot.Travel(destination)`

- Says hi destination yes to NPC. Used as shorthand to travel. @param destination is string @return void

**Parametry:**

- `destination`: is string

**Zwraca:** void

## Events/Callbacks

### `figParse`

**Wywołanie:** `local function CaveBotConfigParse()`

### `tents`

**Wywołanie:** `local data = g_resources.readFileContents(file)`

### `figParse`

**Wywołanie:** `local t = CaveBotConfigParse() and CaveBotConfigParse()["items"] or nil`

### `tainers`

**Wywołanie:** `for _, container in pairs(getContainers()) do`

### `tainers`

- Parses config and extracts loot containers. @return table

**Wywołanie:** `function CaveBot.GetLootContainers()`

### `figParse`

**Wywołanie:** `local t = CaveBotConfigParse() and CaveBotConfigParse()["containers"] or nil`

### `tainers`

- Information about open containers. @param amount is boolean @return table or integer

**Wywołanie:** `function CaveBot.GetOpenedLootContainers(containerTable)`

### `tainers`

**Wywołanie:** `local containers = CaveBot.GetLootContainers()`

### `tainers`

**Wywołanie:** `for i, container in pairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `local containerId = container:getContainerItem():getId()`

### `tainer`

##################### -- [[ Container class ]] -- ##################### -- - Closes any loot container that is open. @return void or boolean

**Wywołanie:** `function CaveBot.CloseLootContainer()`

### `tainers`

**Wywołanie:** `local containers = CaveBot.GetLootContainers()`

### `tainers`

**Wywołanie:** `for i, container in pairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `local containerId = container:getContainerItem():getId()`

### `tainers`

**Wywołanie:** `function CaveBot.CloseAllLootContainers()`

### `tainers`

**Wywołanie:** `local containers = CaveBot.GetLootContainers()`

### `tainers`

**Wywołanie:** `for i, container in pairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `local containerId = container:getContainerItem():getId()`

### `tainer`

- Opens any loot container that isn't already opened. @return void or boolean

**Wywołanie:** `function CaveBot.OpenLootContainer()`

### `tainers`

**Wywołanie:** `local containers = CaveBot.GetLootContainers()`

### `tainers`

**Wywołanie:** `for i, container in pairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `local containerId = container:getContainerItem():getId()`

### `tainers`

**Wywołanie:** `for _, container in pairs(getContainers()) do`

### `tainerByName`

**Wywołanie:** `local locker = getContainerByName("Locker")`

### `tainerByName`

**Wywołanie:** `local depot = getContainerByName("Depot chest")`

### `tainerByName`

**Wywołanie:** `local locker = getContainerByName("Locker")`

### `tainerByName`

**Wywołanie:** `local inbox = getContainerByName("Your inbox")`

### `tainerByName`

**Wywołanie:** `local locker = getContainerByName("Locker")`

### `tainerByName`

**Wywołanie:** `local depot = getContainerByName("Depot chest")`

### `tainers`

**Wywołanie:** `for i, container in pairs(getContainers()) do`

### `tainerByName`

**Wywołanie:** `destination = destination or getContainerByName("Depot chest")`

### `tainerByName`

**Wywołanie:** `destination = getContainerByName(destination)`

### `tainers`

**Wywołanie:** `for i, container in pairs(getContainers()) do`

### `tainers`

**Wywołanie:** `for i, container in pairs(getContainers()) do`

### `versation`

##################### -- [[[[[ Talk class ]]]] -- ##################### -- - Controlled by event caller. Simple way to build npc conversations instead of multiline overcopied code. @return void

**Wywołanie:** `function CaveBot.Conversation(...)`

### `event`

**Wywołanie:** `schedule(talkDelay, function() NPC.say(expr) end)`

### `versation`

**Wywołanie:** `return CaveBot.Conversation("hi", "trade")`

### `versation`

**Wywołanie:** `return CaveBot.Conversation("hi", destination, "yes")`

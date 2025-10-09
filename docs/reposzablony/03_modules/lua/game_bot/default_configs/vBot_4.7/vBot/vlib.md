---
doc_id: "lua-spec-eb9507eb99b8"
source_path: "game_bot/default_configs/vBot_4.7/vBot/vlib.lua"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:29:05Z"
doc_class: "spec"
language: "pl"
title: "Moduł Lua: vlib.lua"
summary: "Dokumentacja modułu Lua dla game_bot/default_configs/vBot_4.7/vBot/vlib.lua"
tags: ["lua", "module", "otclient"]
---

# game_bot/default_configs/vBot_4.7/vBot/vlib.lua

## Overview

Moduł Lua zawierający funkcje i logikę dla vlib.

## Globals/Exports

### `vBot`

Author: Vithrax contains mostly basic function shortcuts and code shorteners initial global variables declaration

### `SpellCastTable`

[[ canCast and cast functions ]] -- callback connected to cast and canCast function detects if a given spell was in fact casted based on player's text messages Cast text and message text must match checks only spells inserted in SpellCastTable by function cast

### `CachedFriends`

global tables for cached players to prevent unnecesary resource consumption probably still can be improved, TODO in future c can be creature or string if exected then adds name or name and creature to tables returns boolean

### `CachedEnemies`

## Functions

### `logInfo(text)`

**Parametry:**

- `text`

### `standTime()`

### `relogOnCharacter(charName)`

**Parametry:**

- `charName`

### `castSpell(text)`

**Parametry:**

- `text`

### `burstDamageValue()`

based on data collected by callback calculates per second damage returns number

**Zwraca:** number

### `whiteInfoMessage(text)`

simplified function from modules displays string as white colour message

**Parametry:**

- `text`

### `statusMessage(text, logInConsole)`

**Parametry:**

- `text`
- `logInConsole`

### `broadcastMessage(text)`

same as above but red message

**Parametry:**

- `text`

### `scheduleNpcSay(text, delay)`

almost every talk action inside cavebot has to be done by using schedule therefore this is simplified function that doesn't require to build a body for schedule function

**Parametry:**

- `text`
- `delay`

### `getFirstNumberInText(text)`

returns first number in string, already formatted as number returns number or nil

**Parametry:**

- `text`

**Zwraca:** first number in string, already formatted as number returns number or nil

### `isOnTile(id, p1, p2, p3)`

function to search if item of given ID can be found on certain tile first argument is always ID the rest of aguments can be: - tile - position - or x,y,z coordinates as p1, p2 and p3 returns boolean

**Parametry:**

- `id`
- `p1`
- `p2`
- `p3`

**Zwraca:** boolean

### `getPos(x, y, z)`

position is a special table, impossible to compare with normal one this is translator from x,y,z to proper position value returns position table

**Parametry:**

- `x`
- `y`
- `z`

**Zwraca:** position table

### `openPurse()`

opens purse... that's it

### `containerIsFull(c)`

check's whether container is full c has to be container object returns boolean

**Parametry:**

- `c`

**Zwraca:** boolean

### `dropItem(idOrObject)`

**Parametry:**

- `idOrObject`

### `isBuffed()`

not perfect function to return whether character has utito tempo buff known to be bugged if received debuff (ie. roshamuul) TODO: simply a better version returns boolean

**Zwraca:** whether character has utito tempo buff known to be bugged if received debuff (ie

### `reindexTable(t)`

if using index as table element, this can be used to properly assign new idex to all values table needs to contain "index" as value if no index in tables, it will create one

**Parametry:**

- `t`

### `killsToRs()`

supports only new tibia, ver 10+ returns how many kills left to get next skull - can be red skull, can be black skull! reutrns number

**Zwraca:** how many kills left to get next skull - can be red skull, can be black skull! reutrns number

### `cast(text, delay)`

if delay is nil or delay is lower than 100 then this function will act as a normal say function checks or adds a spell to SpellCastTable and updates cast time if exist

**Parametry:**

- `text`
- `delay`

### `canCast(spell, ignoreRL, ignoreCd)`

**Parametry:**

- `spell`
- `ignoreRL`
- `ignoreCd`

### `getSpellData(spell)`

exctracts data about spell from gamelib SpellInfo table returns table ie:['Spell Name'] = {id, words, exhaustion, premium, type, icon, mana, level, soul, group, vocations} cooldown detection module

**Parametry:**

- `spell`

**Zwraca:** table ie:['Spell Name'] = {id, words, exhaustion, premium, type, icon, mana, level, soul, group, vocations} cooldown detection module

### `getSpellCoolDown(text)`

based on info extracted by getSpellData checks if spell is on cooldown returns boolean

**Parametry:**

- `text`

**Zwraca:** boolean

### `string.starts(String, Start)`

returns first word in string

**Parametry:**

- `String`
- `Start`

**Zwraca:** first word in string

### `isFriend(c)`

**Parametry:**

- `c`

### `isEnemy(c)`

similar to isFriend but lighter version accepts only name string returns boolean

**Parametry:**

- `c`

**Zwraca:** boolean

### `getPlayerDistribution()`

### `getFriends()`

### `getNeutrals()`

### `getEnemies()`

### `isAttSpell(expr)`

based on first word in string detects if text is a offensive spell returns boolean

**Parametry:**

- `expr`

**Zwraca:** boolean

### `getActiveItemId(id)`

returns dressed-up item id based on not dressed id returns number

**Parametry:**

- `id`

**Zwraca:** dressed-up item id based on not dressed id returns number

### `getInactiveItemId(id)`

returns not dressed item id based on dressed-up id returns number

**Parametry:**

- `id`

**Zwraca:** not dressed item id based on dressed-up id returns number

### `getMonstersInRange(pos, range)`

returns amount of monsters within the range of position does not include summons (new tibia) returns number

**Parametry:**

- `pos`
- `range`

**Zwraca:** amount of monsters within the range of position does not include summons (new tibia) returns number

### `distanceFromPlayer(coords)`

shortcut in calculating distance from local player position needs only one argument returns number

**Parametry:**

- `coords`

**Zwraca:** number

### `getMonsters(range, multifloor)`

returns amount of monsters within the range of local player position does not include summons (new tibia) can also check multiple floors returns number

**Parametry:**

- `range`
- `multifloor`

**Zwraca:** amount of monsters within the range of local player position does not include summons (new tibia) can also check multiple floors returns number

### `getPlayers(range, multifloor)`

returns amount of players within the range of local player position does not include party members can also check multiple floors returns number

**Parametry:**

- `range`
- `multifloor`

**Zwraca:** amount of players within the range of local player position does not include party members can also check multiple floors returns number

### `isBlackListedPlayerInRange(range)`

this is multifloor function checks if player added in "Anti RS list" in player list is within the given range returns boolean

**Parametry:**

- `range`

**Zwraca:** boolean

### `isSafe(range, multifloor, padding)`

checks if there is non-friend player withing the range padding is only for multifloor returns boolean

**Parametry:**

- `range`
- `multifloor`
- `padding`

**Zwraca:** boolean

### `getAllPlayers(range, multifloor)`

returns amount of players within the range of local player position can also check multiple floors returns number

**Parametry:**

- `range`
- `multifloor`

**Zwraca:** amount of players within the range of local player position can also check multiple floors returns number

### `getNpcs(range, multifloor)`

returns amount of NPC's within the range of local player position can also check multiple floors returns number

**Parametry:**

- `range`
- `multifloor`

**Zwraca:** amount of NPC's within the range of local player position can also check multiple floors returns number

### `itemAmount(id)`

main function for calculatin item amount in all visible containers also considers equipped items returns number

**Parametry:**

- `id`

**Zwraca:** number

### `useOnInvertoryItem(a, b)`

self explanatory a is item to use on b is item to use a on

**Parametry:**

- `a`
- `b`

### `getNearTiles(pos)`

pos can be tile or position returns table of tiles surrounding given POS/tile

**Parametry:**

- `pos`

**Zwraca:** table of tiles surrounding given POS/tile

### `useGroundItem(id)`

self explanatory use along with delay, it will only call action

**Parametry:**

- `id`

### `reachGroundItem(id)`

self explanatory use along with delay, it will only call action

**Parametry:**

- `id`

### `findItemOnGround(id)`

self explanatory returns object

**Parametry:**

- `id`

**Zwraca:** object

### `useOnGroundItem(a, b)`

self explanatory use along with delay, it will only call action

**Parametry:**

- `a`
- `b`

### `target()`

returns target creature

**Zwraca:** target creature

### `getTarget()`

returns target creature

**Zwraca:** target creature

### `targetPos(dist)`

dist is boolean returns target position/distance from player

**Parametry:**

- `dist`

**Zwraca:** target position/distance from player

### `reopenPurse()`

for gunzodus/ezodus only it will reopen loot bag, necessary for depositer

### `getCreaturesInArea(param1, param2, param3)`

getSpectator patterns param1 - pos/creature param2 - pattern param3 - type of return 1 - everyone, 2 - monsters, 3 - players returns number

**Parametry:**

- `param1`
- `param2`
- `param3`

**Zwraca:** 1 - everyone, 2 - monsters, 3 - players returns number

### `getBestTileByPatern(pattern, specType, maxDist, safe)`

can be improved TODO in future uses getCreaturesInArea, specType returns number

**Parametry:**

- `pattern`
- `specType`
- `maxDist`
- `safe`

**Zwraca:** number

### `getContainerByName(name, notFull)`

returns container object based on name

**Parametry:**

- `name`
- `notFull`

**Zwraca:** container object based on name

### `getContainerByItem(id, notFull)`

returns container object based on container ID

**Parametry:**

- `id`
- `notFull`

**Zwraca:** container object based on container ID

## Events/Callbacks

### `PlayerPositionChange`

scripts / functions

**Wywołanie:** `onPlayerPositionChange(function(x,y)`

### `getRootWidget`

**Wywołanie:** `local characters = g_ui.getRootWidget().charactersWindow.characters`

### `event`

**Wywołanie:** `schedule(100, modules.client_entergame.CharacterList.doLogin)`

### `TextMessage`

**Wywołanie:** `onTextMessage(function(mode, text)`

### `event`

**Wywołanie:** `schedule(3050, function()`

### `event`

**Wywołanie:** `return schedule(delay, function() NPC.say(text) end)`

### `umber`

**Wywołanie:** `if string.match(text, "%d+") then n = tonumber(string.match(text, "%d+")) end`

### `tainerIsFull`

check's whether container is full c has to be container object returns boolean

**Wywołanie:** `function containerIsFull(c)`

### `Talk`

calculates exhaust for potions based on "Aaaah..." message changes state of vBot variable, can be used in other scripts already used in pushmax, healbot, etc

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

### `event`

**Wywołanie:** `schedule(950, function() vBot.isUsingPotion = false end)`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

### `Talk`

**Wywołanie:** `onTalk(function(name, level, mode, text, channelId, pos)`

### `SpellCooldown`

**Wywołanie:** `onSpellCooldown(function(iconId, duration)`

### `event`

**Wywołanie:** `schedule(1, function()`

### `GroupSpellCooldown`

**Wywołanie:** `onGroupSpellCooldown(function(iconId, duration)`

### `event`

**Wywołanie:** `schedule(2, function()`

### `Active`

**Wywołanie:** `local icon = modules.game_cooldown.isCooldownIconActive(data.id)`

### `Active`

**Wywołanie:** `if modules.game_cooldown.isGroupCooldownIconActive(groupId) then`

### `Use`

**Wywołanie:** `onUse(function(pos, itemId, stackPos, subType)`

### `tainer`

**Wywołanie:** `if topThing:isContainer() then return end`

### `UseWith`

**Wywołanie:** `onUseWith(function(pos, itemId, target, subType)`

### `s`

returns amount of monsters within the range of position

**Wywołanie:** `-- does not include summons (new tibia)`

### `stersInRange`

returns amount of monsters within the range of position does not include summons (new tibia) returns number

**Wywołanie:** `function getMonstersInRange(pos, range)`

### `ster`

**Wywołanie:** `if spec:isMonster() and`

### `s`

returns amount of monsters within the range of local player position

**Wywołanie:** `-- does not include summons (new tibia)`

### `sters`

returns amount of monsters within the range of local player position does not include summons (new tibia) can also check multiple floors returns number

**Wywołanie:** `function getMonsters(range, multifloor)`

### `ster`

**Wywołanie:** `spec:isMonster() and distanceFromPlayer(spec:getPosition()) <=`

### `tainers`

**Wywołanie:** `for i, c in pairs(getContainers()) do`

### `event`

**Wywołanie:** `schedule(100, function()`

### `event`

**Wywołanie:** `schedule(1400, function()`

### `tainers`

**Wywołanie:** `for i, c in pairs(getContainers()) do`

### `ster`

**Wywołanie:** `if spec:isMonster() and`

### `tainerByName`

returns container object based on name

**Wywołanie:** `function getContainerByName(name, notFull)`

### `tainers`

**Wywołanie:** `for i, c in pairs(getContainers()) do`

### `tainerIsFull`

**Wywołanie:** `if c:getName():lower() == name:lower() and (not notFull or not containerIsFull(c)) then`

### `tainerByItem`

returns container object based on container ID

**Wywołanie:** `function getContainerByItem(id, notFull)`

### `tainers`

**Wywołanie:** `for i, c in pairs(getContainers()) do`

### `tainerItem`

**Wywołanie:** `if c:getContainerItem():getId() == id and (not notFull or not containerIsFull(c)) then`

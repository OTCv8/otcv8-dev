# Moduł: | Moduł: `game_bot/default_configs/cavebot_1.3`
```lua

-- Cavebot by otclient@otclient.ovh

-- visit http://bot.otclient.ovh/

local cavebotTab = "Cave"

local targetingTab = "Target"

setDefaultTab(cavebotTab)

CaveBot = {} -- global namespace

CaveBot.Extensions = {}

importStyle("/cavebot/cavebot.otui")

importStyle("/cavebot/config.otui")

importStyle("/cavebot/editor.otui")

importStyle("/cavebot/supply.otui")

dofile("/cavebot/actions.lua")

dofile("/cavebot/config.lua")

dofile("/cavebot/editor.lua")

dofile("/cavebot/example_functions.lua")

dofile("/cavebot/recorder.lua")

dofile("/cavebot/walking.lua")

-- in this section you can add extensions, check extension_template.lua

--dofile("/cavebot/extension_template.lua")

dofile("/cavebot/depositer.lua")

dofile("/cavebot/supply.lua")

-- main cavebot file, must be last

dofile("/cavebot/cavebot.lua")

setDefaultTab(targetingTab)

TargetBot = {} -- global namespace

importStyle("/targetbot/looting.otui")

importStyle("/targetbot/target.otui")

importStyle("/targetbot/creature_editor.otui")

dofile("/targetbot/creature.lua")

dofile("/targetbot/creature_attack.lua")

dofile("/targetbot/creature_editor.lua")

dofile("/targetbot/creature_priority.lua")

dofile("/targetbot/looting.lua")

dofile("/targetbot/walking.lua")

-- main targetbot file, must be last

dofile("/targetbot/target.lua")

```

---
# hp.lua
```lua

setDefaultTab("HP")

--2x healing spell

--2x healing rune

--utani hur

--mana shield

--anti paralyze

--4x equip

UI.Label("Healing spells")

if type(storage.healing1) ~= "table" then

  storage.healing1 = {on=false, title="HP%", text="exura", min=51, max=90}

end

if type(storage.healing2) ~= "table" then

  storage.healing2 = {on=false, title="HP%", text="exura vita", min=0, max=50}

end

-- create 2 healing widgets

for _, healingInfo in ipairs({storage.healing1, storage.healing2}) do

  local healingmacro = macro(20, function()

    local hp = player:getHealthPercent()

    if healingInfo.max >= hp and hp >= healingInfo.min then

      if TargetBot then

        TargetBot.saySpell(healingInfo.text) -- sync spell with targetbot if available

      else

        say(healingInfo.text)

      end

    end

  end)

  healingmacro.setOn(healingInfo.on)

  UI.DualScrollPanel(healingInfo, function(widget, newParams)

    healingInfo = newParams

    healingmacro.setOn(healingInfo.on)

  end)

end

UI.Separator()

UI.Label("Mana & health potions/runes")

if type(storage.hpitem1) ~= "table" then

  storage.hpitem1 = {on=false, title="HP%", item=266, min=51, max=90}

end

if type(storage.hpitem2) ~= "table" then

  storage.hpitem2 = {on=false, title="HP%", item=3160, min=0, max=50}

end

if type(storage.manaitem1) ~= "table" then

  storage.manaitem1 = {on=false, title="MP%", item=268, min=51, max=90}

end

if type(storage.manaitem2) ~= "table" then

  storage.manaitem2 = {on=false, title="MP%", item=3157, min=0, max=50}

end

for i, healingInfo in ipairs({storage.hpitem1, storage.hpitem2, storage.manaitem1, storage.manaitem2}) do

  local healingmacro = macro(20, function()

    local hp = i <= 2 and player:getHealthPercent() or math.min(100, math.floor(100 * (player:getMana() / player:getMaxMana())))

    if healingInfo.max >= hp and hp >= healingInfo.min then

      if TargetBot then

        TargetBot.useItem(healingInfo.item, healingInfo.subType, player) -- sync spell with targetbot if available

      else

        local thing = g_things.getThingType(healingInfo.item)

        local subType = g_game.getClientVersion() >= 860 and 0 or 1

        if thing and thing:isFluidContainer() then

          subType = healingInfo.subType

        end

        g_game.useInventoryItemWith(healingInfo.item, player, subType)

      end

    end

  end)

  healingmacro.setOn(healingInfo.on)

  UI.DualScrollItemPanel(healingInfo, function(widget, newParams)

    healingInfo = newParams

    healingmacro.setOn(healingInfo.on and healingInfo.item > 100)

  end)

end

if g_game.getClientVersion() < 780 then

  UI.Label("In old tibia potions & runes work only when you have backpack with them opened")

end

UI.Separator()

UI.Label("Mana shield spell:")

UI.TextEdit(storage.manaShield or "utamo vita", function(widget, newText)

  storage.manaShield = newText

end)

local lastManaShield = 0

macro(20, "mana shield", function()

  if hasManaShield() or lastManaShield + 90000 > now then return end

  if TargetBot then

    TargetBot.saySpell(storage.manaShield) -- sync spell with targetbot if available

  else

    say(storage.manaShield)

  end

end)

UI.Label("Haste spell:")

UI.TextEdit(storage.hasteSpell or "utani hur", function(widget, newText)

  storage.hasteSpell = newText

end)

macro(500, "haste", function()

  if hasHaste() then return end

  if TargetBot then

    TargetBot.saySpell(storage.hasteSpell) -- sync spell with targetbot if available

  else

    say(storage.hasteSpell)

  end

end)

UI.Label("Anti paralyze spell:")

UI.TextEdit(storage.antiParalyze or "utani hur", function(widget, newText)

  storage.antiParalyze = newText

end)

macro(100, "anti paralyze", function()

  if not isParalyzed() then return end

  if TargetBot then

    TargetBot.saySpell(storage.antiParalyze) -- sync spell with targetbot if available

  else

    say(storage.antiParalyze)

  end

end)

UI.Separator()

UI.Label("Eatable items:")

if type(storage.foodItems) ~= "table" then

  storage.foodItems = {3582, 3577}

end

local foodContainer = UI.Container(function(widget, items)

  storage.foodItems = items

end, true)

foodContainer:setHeight(35)

foodContainer:setItems(storage.foodItems)

macro(10000, "eat food", function()

  if not storage.foodItems[1] then return end

  -- search for food in containers

  for _, container in pairs(g_game.getContainers()) do

    for __, item in ipairs(container:getItems()) do

      for i, foodItem in ipairs(storage.foodItems) do

        if item:getId() == foodItem.id then

          return g_game.use(item)

        end

      end

    end

  end

  -- can't find any food, try to eat random item using hotkey

  if g_game.getClientVersion() < 780 then return end -- hotkey's dont work on old tibia

  local toEat = storage.foodItems[math.random(1, #storage.foodItems)]

  if toEat then g_game.useInventoryItem(toEat.id) end

end)

UI.Separator()

UI.Label("Auto equip")

if type(storage.autoEquip) ~= "table" then

  storage.autoEquip = {}

end

for i=1,4 do -- if you want more auto equip panels you can change 4 to higher value

  if not storage.autoEquip[i] then

    storage.autoEquip[i] = {on=false, title="Auto Equip", item1=i == 1 and 3052 or 0, item2=i == 1 and 3089 or 0, slot=i == 1 and 9 or 0}

  end

  UI.TwoItemsAndSlotPanel(storage.autoEquip[i], function(widget, newParams)

    storage.autoEquip[i] = newParams

  end)

end

macro(250, function()

  local containers = g_game.getContainers()

  for index, autoEquip in ipairs(storage.autoEquip) do

    if autoEquip.on then

      local slotItem = getSlot(autoEquip.slot)

      if not slotItem or (slotItem:getId() ~= autoEquip.item1 and slotItem:getId() ~= autoEquip.item2) then

        for _, container in pairs(containers) do

          for __, item in ipairs(container:getItems()) do

            if item:getId() == autoEquip.item1 or item:getId() == autoEquip.item2 then

              g_game.move(item, {x=65535, y=autoEquip.slot, z=0}, item:getCount())

              delay(1000) -- don't call it too often

              return

            end

          end

        end

      end

    end

  end

end)

```

---
# main.lua
```lua

-- main tab

VERSION = "1.3"

UI.Label("Config version: " .. VERSION)

UI.Separator()

UI.Separator()

UI.Button("Discord", function()

  g_platform.openUrl("https://discord.gg/yhqBE4A")

end)

UI.Button("Forum", function()

  g_platform.openUrl("http://otclient.net/")

end)

UI.Button("Help & Tutorials", function()

  g_platform.openUrl("http://bot.otclient.ovh/")

end)

```

---
# mwall_timer.lua
```lua

-- Magic wall & Wild growth timer

-- config

local magicWallId = 2129

local magicWallTime = 20000

local wildGrowthId = 2130

local wildGrowthTime = 45000

-- script

local activeTimers = {}

onAddThing(function(tile, thing)

  if not thing:isItem() then

    return

  end

  local timer = 0

  if thing:getId() == magicWallId then

    timer = magicWallTime

  elseif thing:getId() == wildGrowthId then

    timer = wildGrowthTime

  else

    return

  end

  local pos = tile:getPosition().x .. "," .. tile:getPosition().y .. "," .. tile:getPosition().z

  if not activeTimers[pos] or activeTimers[pos] < now then

    activeTimers[pos] = now + timer

  end

  tile:setTimer(activeTimers[pos] - now)

end)

onRemoveThing(function(tile, thing)

  if not thing:isItem() then

    return

  end

  if (thing:getId() == magicWallId or thing:getId() == wildGrowthId) and tile:getGround() then

    local pos = tile:getPosition().x .. "," .. tile:getPosition().y .. "," .. tile:getPosition().z

    activeTimers[pos] = nil

    tile:setTimer(0)

  end

end)

```

---
# storage.json
```text

{

  "hpitem1": {

    "max": 90,

    "title": "HP%",

    "subType": 0,

    "item": 266,

    "min": 51,

    "on": false

},

  "foodItems": [

{

      "id": 3582,

      "count": 1

},

{

      "id": 3577,

      "count": 1

}

],

  "autoEquip": [

{

      "item1": 3052,

      "title": "Auto Equip",

      "item2": 3089,

      "on": false,

      "slot": 9

},

{

      "item1": 0,

      "title": "Auto Equip",

      "item2": 0,

      "on": false,

      "slot": 0

},

{

      "item1": 0,

      "title": "Auto Equip",

      "item2": 0,

      "on": false,

      "slot": 0

},

{

      "item1": 0,

      "title": "Auto Equip",

      "item2": 0,

      "on": false,

      "slot": 0

}

],

  "ingame_hotkeys": "singlehotkey(\"f1\", function()\nlocal shaders = {\"stars\", \"gold\", \"rainbow\", \"sweden\", \"brazil\", \"line\", \"3line\", \"circle\", \"outline\"}\nlocal p = 0\nfor i, c in pairs(getSpectators()) do\n    c:setOutfitShader(shaders[1 + p % 10])\n    p = p + 1\nend\nend)\n\nsinglehotkey(\"1\", function()\n  for _, s in ipairs(getSpectators()) do\n    if s:canShoot(3) then\n      info(s:getName())\n    else\n      warn(s:getName())\n    end\n  end\nend)",

  "healing2": {

    "max": 50,

    "title": "HP%",

    "on": false,

    "min": 1,

    "text": "exura vita"

},

  "ingame_macros": "",

  "hasteSpell": "utani hur",

  "manaitem2": {

    "max": 50,

    "title": "MP%",

    "subType": 0,

    "item": 3157,

    "min": 0,

    "on": false

},

  "_configs": {

    "cavebot_configs": {

      "selected": "test_src",

      "enabled": false

},

    "targetbot_configs": {

      "enabled": false,

      "selected": "config_name"

}

},

  "healing1": {

    "max": 100,

    "title": "HP%",

    "on": false,

    "min": 51,

    "text": "exura"

},

  "dropItems": [

{

      "id": 283,

      "count": 1

},

{

      "id": 284,

      "count": 1

},

{

      "id": 285,

      "count": 1

}

],

  "_macros": {

    "": false

},

  "manaitem1": {

    "max": 90,

    "title": "MP%",

    "subType": 0,

    "item": 268,

    "min": 51,

    "on": false

},

  "hpitem2": {

    "max": 50,

    "title": "HP%",

    "subType": 0,

    "item": 3160,

    "min": 0,

    "on": false

},

  "manaShield": "utamo vita",

  "autoTradeMessage": "I'm using OTClientV8!",

  "antiParalyze": "utani hur",

  "manaTrain": {

    "max": 100,

    "title": "MP%",

    "on": false,

    "min": 80,

    "text": "utevo lux"

}

}

```

---
# tools.lua
```lua

-- tools tab

setDefaultTab("Tools")

-- allows to test/edit bot lua scripts ingame, you can have multiple scripts like this, just change storage.ingame_lua

UI.Button("Ingame macro editor", function(newText)

  UI.MultilineEditorWindow(storage.ingame_macros or "", {title="Macro editor", description="You can add your custom macros (or any other lua code) here"}, function(text)

    storage.ingame_macros = text

    reload()

  end)

end)

UI.Button("Ingame hotkey editor", function(newText)

  UI.MultilineEditorWindow(storage.ingame_hotkeys or "", {title="Hotkeys editor", description="You can add your custom hotkeys/singlehotkeys here"}, function(text)

    storage.ingame_hotkeys = text

    reload()

  end)

end)

UI.Separator()

for _, scripts in ipairs({storage.ingame_macros, storage.ingame_hotkeys}) do

  if type(scripts) == "string" and scripts:len() > 3 then

    local status, result = pcall(function()

      assert(load(scripts, "ingame_editor"))()

    end)

    if not status then

      error("Ingame edior error:\n" .. result)

    end

  end

end

UI.Separator()

UI.Button("Zoom In map [ctrl + =]", function() zoomIn() end)

UI.Button("Zoom Out map [ctrl + -]", function() zoomOut() end)

UI.Separator()

local moneyIds = {3031, 3035} -- gold coin, platinium coin

macro(1000, "Exchange money", function()

  local containers = g_game.getContainers()

  for index, container in pairs(containers) do

    if not container.lootContainer then -- ignore monster containers

      for i, item in ipairs(container:getItems()) do

        if item:getCount() == 100 then

          for m, moneyId in ipairs(moneyIds) do

            if item:getId() == moneyId then

              return g_game.use(item)

            end

          end

        end

      end

    end

  end

end)

macro(1000, "Stack items", function()

  local containers = g_game.getContainers()

  local toStack = {}

  for index, container in pairs(containers) do

    if not container.lootContainer then -- ignore monster containers

      for i, item in ipairs(container:getItems()) do

        if item:isStackable() and item:getCount() < 100 then

          local stackWith = toStack[item:getId()]

          if stackWith then

            g_game.move(item, stackWith[1], math.min(stackWith[2], item:getCount()))

            return

          end

          toStack[item:getId()] = {container:getSlotPosition(i - 1), 100 - item:getCount()}

        end

      end

    end

  end

end)

macro(10000, "Anti Kick",  function()

  local dir = player:getDirection()

  turn((dir + 1) % 4)

  turn(dir)

end)

UI.Separator()

UI.Label("Drop items:")

if type(storage.dropItems) ~= "table" then

  storage.dropItems = {283, 284, 285}

end

local foodContainer = UI.Container(function(widget, items)

  storage.dropItems = items

end, true)

foodContainer:setHeight(35)

foodContainer:setItems(storage.dropItems)

macro(5000, "drop items", function()

  if not storage.dropItems[1] then return end

  if TargetBot and TargetBot.isActive() then return end -- pause when attacking

  for _, container in pairs(g_game.getContainers()) do

    for __, item in ipairs(container:getItems()) do

      for i, dropItem in ipairs(storage.dropItems) do

        if item:getId() == dropItem.id then

          if item:isStackable() then

            return g_game.move(item, player:getPosition(), item:getCount())

          else

            return g_game.move(item, player:getPosition(), dropItem.count) -- count is also subtype

          end

        end

      end

    end

  end

end)

UI.Separator()

UI.Label("Mana training")

if type(storage.manaTrain) ~= "table" then

  storage.manaTrain = {on=false, title="MP%", text="utevo lux", min=80, max=100}

end

local manatrainmacro = macro(1000, function()

  if TargetBot and TargetBot.isActive() then return end -- pause when attacking

  local mana = math.min(100, math.floor(100 * (player:getMana() / player:getMaxMana())))

  if storage.manaTrain.max >= mana and mana >= storage.manaTrain.min then

    say(storage.manaTrain.text)

  end

end)

manatrainmacro.setOn(storage.manaTrain.on)

UI.DualScrollPanel(storage.manaTrain, function(widget, newParams)

  storage.manaTrain = newParams

  manatrainmacro.setOn(storage.manaTrain.on)

end)

UI.Separator()

macro(60000, "Send message on trade", function()

  local trade = getChannelId("advertising")

  if not trade then

    trade = getChannelId("trade")

  end

  if trade and storage.autoTradeMessage:len() > 0 then

    sayChannel(trade, storage.autoTradeMessage)

  end

end)

UI.TextEdit(storage.autoTradeMessage or "I'm using OTClientV8!", function(widget, text)

  storage.autoTradeMessage = text

end)

UI.Separator()

```

---


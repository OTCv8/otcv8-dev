# ¦ Modul: `game_bot/default_configs/vBot_4.7/cavebot`

```lua

CaveBot.Actions = {}

vBot.lastLabel = ""

local oldTibia = g_game.getClientVersion() < 960

local nextTile = nil

local noPath = 0

-- antistuck f()

local nextPos = nil -- creature

local nextPosF = nil -- furniture

local function modPos(dir)

    local y = 0

    local x = 0

    if dir == 0 then

        y = -1

    elseif dir == 1 then

        x = 1

    elseif dir == 2 then

        y = 1

    elseif dir == 3 then

        x = -1

    elseif dir == 4 then

        y = -1

        x = 1

    elseif dir == 5 then

        y = 1

        x = 1

    elseif dir == 6 then

        y = 1

        x = -1

    elseif dir == 7 then

        y = -1

        x = -1

    end

    return {x, y}

end

-- stack-covered antystuck, in & out pz

local lastMoved = now - 200

onTextMessage(function(mode, text)

  if text ~= 'There is not enough room.' then return end

  if CaveBot.isOff() then return end

  local tiles = getNearTiles(pos())

  for i, tile in ipairs(tiles) do

    if not tile:hasCreature() and tile:isWalkable() and #tile:getItems() > 9 then

      local topThing = tile:getTopThing()

      if not isInPz() then

        return useWith(3197, tile:getTopThing()) -- disintegrate

      else

        if now < lastMoved + 200 then return end -- delay to prevent clogging

        local nearTiles = getNearTiles(tile:getPosition())

        for i, tile in ipairs(nearTiles) do

          local tpos = tile:getPosition()

          if pos() ~= tpos then

            if tile:isWalkable() then

              lastMoved = now

              return g_game.move(topThing, tpos) -- move item

            end

          end

        end

      end

    end

  end

end)

local furnitureIgnore = { 2986 }

local function breakFurniture(destPos)

  if isInPz() then return false end

  local candidate = {thing=nil, dist=100}

  for i, tile in ipairs(g_map.getTiles(posz())) do

    local walkable = tile:isWalkable()

    local topThing = tile:getTopThing()

    local isWg = topThing and topThing:getId() == 2130

    if topThing and (isWg or not table.find(furnitureIgnore, topThing:getId()) and topThing:isItem()) then

      local moveable = not topThing:isNotMoveable()

      local tpos = tile:getPosition()

      local path = findPath(player:getPosition(), tpos, 7, { ignoreNonPathable = true, precision = 1 })

      if path then

        if isWg or (not walkable and moveable) then

          local distance = getDistanceBetween(destPos, tpos)

          if distance < candidate.dist then

            candidate = {thing=topThing, dist=distance}

          end

        end

      end

    end

  end

  local thing = candidate.thing

  if thing then

    useWith(3197, thing)

    return true

  end

  return false

end

local function pushPlayer(creature)

  local cpos = creature:getPosition()

  local tiles = getNearTiles(cpos)

  for i, tile in ipairs(tiles) do

    local pos = tile:getPosition()

    local minimapColor = g_map.getMinimapColor(pos)

    local stairs = (minimapColor >= 210 and minimapColor <= 213)

    if not stairs and tile:isWalkable() then

      g_game.move(creature, pos)

    end

  end

end

local function pathfinder()

  if not storage.extras.pathfinding then return end

  if noPath < 10 then return end

  if not CaveBot.gotoNextWaypointInRange() then

    if getConfigFromName and getConfigFromName() then

      local profile = CaveBot.getCurrentProfile()

      local config = getConfigFromName()

      local newProfile = profile == '#Unibase' and config or '#Unibase'

      CaveBot.setCurrentProfile(newProfile)

    end

  end

  noPath = 0

  return true

end

-- it adds an action widget to list

CaveBot.addAction = function(action, value, focus)

  action = action:lower()

  local raction = CaveBot.Actions[action]

  if not raction then

    return warn("Invalid cavebot action: " .. action)

  end

  if type(value) == 'number' then

    value = tostring(value)

  end

  local widget = UI.createWidget("CaveBotAction", CaveBot.actionList)

  widget:setText(action .. ":" .. value:split("\n")[1])

  widget.action = action

  widget.value = value

  if raction.color then

    widget:setColor(raction.color)

  end

  widget.onDoubleClick = function(cwidget) -- edit on double click

    if CaveBot.Editor then

      schedule(20, function() -- schedule to have correct focus

        CaveBot.Editor.edit(cwidget.action, cwidget.value, function(action, value)

          CaveBot.editAction(cwidget, action, value)

          CaveBot.save()

        end)

      end)

    end

  end

  if focus then

    widget:focus()

    CaveBot.actionList:ensureChildVisible(widget)

  end

  return widget

end

-- it updates existing widget, you should call CaveBot.save() later

CaveBot.editAction = function(widget, action, value)

  action = action:lower()

  local raction = CaveBot.Actions[action]

  if not raction then

    return warn("Invalid cavebot action: " .. action)

  end

  if not widget.action or not widget.value then

    return warn("Invalid cavebot action widget, has missing action or value")  

  end

  widget:setText(action .. ":" .. value:split("\n")[1])

  widget.action = action

  widget.value = value

  if raction.color then

    widget:setColor(raction.color)

  end

  return widget

end

--[[

registerAction:

action - string, color - string, callback = function(value, retries, prev)

value is a string value of action, retries is number which will grow by 1 if return is "retry"

prev is a true when previuos action was executed succesfully, false otherwise

it must return true if executed correctly, false otherwise

it can also return string "retry", then the function will be called again in 20 ms

]]--

CaveBot.registerAction = function(action, color, callback) 

  action = action:lower()

  if CaveBot.Actions[action] then

    return warn("Duplicated acction: " .. action)

  end

  CaveBot.Actions[action] = {

    color=color,

    callback=callback

}

end

CaveBot.registerAction("label", "yellow", function(value, retries, prev)

  vBot.lastLabel = value

  return true

end)

CaveBot.registerAction("gotolabel", "#FFFF55", function(value, retries, prev)

  return CaveBot.gotoLabel(value) 

end)

CaveBot.registerAction("delay", "#AAAAAA", function(value, retries, prev)

  if retries == 0 then

    local data = string.split(value, ",")

    local val = tonumber(data[1]:trim())

    local random

    local final

    if #data == 2 then

      random = tonumber(data[2]:trim())

    end

    if random then

      local diff = (val/100) * random

      local min = val - diff

      local max = val + diff

      final = math.random(min, max)

    end

    final = final or val

    CaveBot.delay(final) 

    return "retry"

  end

  return true

end)

CaveBot.registerAction("follow", "#FF8400", function(value, retries, prev)

  local c = getCreatureByName(value)

  if not c then

    print("CaveBot[follow]: can't find creature to follow")

    return false

  end

  local cpos = c:getPosition()

  local pos = pos()

  if getDistanceBetween(cpos, pos) < 2 then

    g_game.cancelFollow()

    return true

  else

    follow(c)

    delay(200)

    return "retry"

  end

end)

CaveBot.registerAction("function", "red", function(value, retries, prev)

  local prefix = "local retries = " .. retries .. "\nlocal prev = " .. tostring(prev) .. "\nlocal delay = CaveBot.delay\nlocal gotoLabel = CaveBot.gotoLabel\n"

  prefix = prefix .. "local macro = function() warn('Macros inside cavebot functions are not allowed') end\n"

  for extension, callbacks in pairs(CaveBot.Extensions) do

    prefix = prefix .. "local " .. extension .. " = CaveBot.Extensions." .. extension .. "\n"

  end

  local status, result = pcall(function() 

    return assert(load(prefix .. value, "cavebot_function"))()

  end)

  if not status then

    warn("warn in cavebot function:\n" .. result)

    return false

  end  

  return result

end)

CaveBot.registerAction("goto", "green", function(value, retries, prev)

  local pos = regexMatch(value, "\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+),?\\s*([0-9]?)")

  if not pos[1] then

    warn("Invalid cavebot goto action value. It should be position (x,y,z), is: " .. value)

    return false

  end

  -- reset pathfinder

  nextPosF = nil

  nextPos = nil

  if CaveBot.Config.get("mapClick") then

    if retries >= 5 then

      noPath = noPath + 1

      pathfinder()

      return false -- tried 5 times, can't get there

    end

  else

    if retries >= 100 then

      noPath = noPath + 1

      pathfinder()

      return false -- tried 100 times, can't get there

    end  

  end

  local precision = tonumber(pos[1][5])

  pos = {x=tonumber(pos[1][2]), y=tonumber(pos[1][3]), z=tonumber(pos[1][4])}  

  local playerPos = player:getPosition()

  if pos.z ~= playerPos.z then 

    noPath = noPath + 1

    pathfinder()

    return false -- different floor

  end

  local maxDist = storage.extras.gotoMaxDistance or 40

  if math.abs(pos.x-playerPos.x) + math.abs(pos.y-playerPos.y) > maxDist then

    noPath = noPath + 1

    pathfinder()

    return false -- too far way

  end

  local minimapColor = g_map.getMinimapColor(pos)

  local stairs = (minimapColor >= 210 and minimapColor <= 213)

  if stairs then

    if math.abs(pos.x-playerPos.x) == 0 and math.abs(pos.y-playerPos.y) <= 0 then

      noPath = 0

      return true -- already at position

    end

  elseif math.abs(pos.x-playerPos.x) == 0 and math.abs(pos.y-playerPos.y) <= (precision or 1) then

      noPath = 0

      return true -- already at position

  end

  -- check if there's a path to that place, ignore creatures and fields

  local path = findPath(playerPos, pos, maxDist, { ignoreNonPathable = true, precision = 1, ignoreCreatures = true, allowUnseen = true, allowOnlyVisibleTiles = false  })

  if not path then

    if breakFurniture(pos, storage.extras.machete) then

      CaveBot.delay(1000)

      retries = 0

      return "retry"

    end

    noPath = noPath + 1

    pathfinder()

    return false -- there's no way

  end

  -- check if there's a path to destination but consider Creatures (attack only if trapped)

  local path2 = findPath(playerPos, pos, maxDist, { ignoreNonPathable = true, precision = 1 })

  if not path2 then

    local foundMonster = false

    for i, dir in ipairs(path) do

      local dirs = modPos(dir)

      nextPos = nextPos or playerPos

      nextPos.x = nextPos.x + dirs[1]

      nextPos.y = nextPos.y + dirs[2]

      local tile = g_map.getTile(nextPos)

      if tile then

          if tile:hasCreature() then

              local creature = tile:getCreatures()[1]

              local hppc = creature:getHealthPercent()

              if creature:isMonster() and (hppc and hppc > 0) and (oldTibia or creature:getType() < 3) then

                  -- real blocking creature can not meet those conditions - ie. it could be player, so just in case check if the next creature is reachable

                  local path = findPath(playerPos, creature:getPosition(), 7, { ignoreNonPathable = true, precision = 1 }) 

                  if path then

                      foundMonster = true

                      if g_game.getAttackingCreature() ~= creature then

                        attack(creature)

                      end

                      g_game.setChaseMode(1)

                      CaveBot.delay(100)

                      retries = 0 -- reset retries, we are trying to unclog the cavebot

                      break

                  end

              end

          end

      end

    end

    if not foundMonster then

      foundMonster = false

      return false -- no other way

    end

  end

  -- try to find path, don't ignore creatures, don't ignore fields

  if not CaveBot.Config.get("ignoreFields") and CaveBot.walkTo(pos, 40) then

    return "retry"

  end

  -- try to find path, don't ignore creatures, ignore fields

  if CaveBot.walkTo(pos, maxDist, { ignoreNonPathable = true, allowUnseen = true, allowOnlyVisibleTiles = false }) then

    return "retry"

  end

  if retries >= 3 then

    -- try to lower precision, find something close to final position

    local precison = retries - 1

    if stairs then

      precison = 0

    end

    if CaveBot.walkTo(pos, 50, { ignoreNonPathable = true, precision = precison, allowUnseen = true, allowOnlyVisibleTiles = false }) then

      return "retry"

    end    

  end

  if not CaveBot.Config.get("mapClick") and retries >= 5 then

    noPath = noPath + 1

    pathfinder()

    return false

  end

  if CaveBot.Config.get("skipBlocked") then

    noPath = noPath + 1

    pathfinder()

    return false

  end

  -- everything else failed, try to walk ignoring creatures, maybe will work

  CaveBot.walkTo(pos, maxDist, { ignoreNonPathable = true, precision = 1, ignoreCreatures = true, allowUnseen = true, allowOnlyVisibleTiles = false })

  return "retry"

end)

CaveBot.registerAction("use", "#FFB272", function(value, retries, prev)

  local pos = regexMatch(value, "\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+)")

  if not pos[1] then

    local itemid = tonumber(value)

    if not itemid then

      warn("Invalid cavebot use action value. It should be (x,y,z) or item id, is: " .. value)

      return false

    end

    use(itemid)

    return true

  end

  pos = {x=tonumber(pos[1][2]), y=tonumber(pos[1][3]), z=tonumber(pos[1][4])}  

  local playerPos = player:getPosition()

  if pos.z ~= playerPos.z then 

    return false -- different floor

  end

  if math.max(math.abs(pos.x-playerPos.x), math.abs(pos.y-playerPos.y)) > 7 then

    return false -- too far way

  end

  local tile = g_map.getTile(pos)

  if not tile then

    return false

  end

  local topThing = tile:getTopUseThing()

  if not topThing then

    return false

  end

  use(topThing)

  CaveBot.delay(CaveBot.Config.get("useDelay") + CaveBot.Config.get("ping"))

  return true

end)

CaveBot.registerAction("usewith", "#EEB292", function(value, retries, prev)

  local pos = regexMatch(value, "\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+)")

  if not pos[1] then

    if not itemid then

      warn("Invalid cavebot usewith action value. It should be (itemid,x,y,z) or item id, is: " .. value)

      return false

    end

    use(itemid)

    return true

  end

  local itemid = tonumber(pos[1][2])

  pos = {x=tonumber(pos[1][3]), y=tonumber(pos[1][4]), z=tonumber(pos[1][5])}  

  local playerPos = player:getPosition()

  if pos.z ~= playerPos.z then 

    return false -- different floor

  end

  if math.max(math.abs(pos.x-playerPos.x), math.abs(pos.y-playerPos.y)) > 7 then

    return false -- too far way

  end

  local tile = g_map.getTile(pos)

  if not tile then

    return false

  end

  local topThing = tile:getTopUseThing()

  if not topThing then

    return false

  end

  usewith(itemid, topThing)

  CaveBot.delay(CaveBot.Config.get("useDelay") + CaveBot.Config.get("ping"))

  return true

end)

CaveBot.registerAction("say", "#FF55FF", function(value, retries, prev)

  say(value)

  return true

end)

CaveBot.registerAction("npcsay", "#FF55FF", function(value, retries, prev)

  NPC.say(value)

  return true

end)

```

---
# bank.lua

```lua

CaveBot.Extensions.Bank = {}

local balance = 0

CaveBot.Extensions.Bank.setup = function()

  CaveBot.registerAction("bank", "#db5a5a", function(value, retries)

   local data = string.split(value, ",")

   local waitVal = 300

   local amount = 0

   local actionType

   local npcName

   local transferName

   local balanceLeft

    if #data ~= 3 and #data ~= 2 and #data ~= 4 then

     warn("CaveBot[Bank]: incorrect value!")

     return false

    else

      actionType = data[1]:trim():lower()

      npcName = data[2]:trim()

      if #data == 3 then

        amount = tonumber(data[3]:trim())

      end

      if #data == 4 then

        transferName = data[3]:trim()

        balanceLeft = tonumber(data[4]:trim())

      end

    end

    if actionType ~= "withdraw" and actionType ~= "deposit" and actionType ~= "transfer" then

      warn("CaveBot[Bank]: incorrect action type! should be withdraw/deposit/transfer, is: " .. actionType)

      return false

    elseif actionType == "withdraw" then

      local value = tonumber(amount)

      if not value then

        warn("CaveBot[Bank]: incorrect amount value! should be number, is: " .. amount)

        return false

      end

    end

    if retries > 5 then

      print("CaveBot[Bank]: too many tries, skipping")

     return false

    end

    local npc = getCreatureByName(npcName)

    if not npc then 

      print("CaveBot[Bank]: NPC not found, skipping")

     return false 

    end

    if not CaveBot.ReachNPC(npcName) then

      return "retry"

    end

    if actionType == "deposit" then

      CaveBot.Conversation("hi", "deposit all", "yes")

      CaveBot.delay(storage.extras.talkDelay*3)

      return true

    elseif actionType == "withdraw" then

      CaveBot.Conversation("hi", "withdraw", value, "yes")

      CaveBot.delay(storage.extras.talkDelay*4)

      return true

    else

      -- first check balance

      CaveBot.Conversation("hi", "balance")

      schedule(5000, function()

        local amountToTransfer = balance - balanceLeft

        if amountToTransfer <= 0 then

          warn("CaveBot[Bank] Not enough gold to transfer! proceeding")

          return false

        end

        CaveBot.Conversation("hi", "transfer", amountToTransfer, transferName, "yes")

        warn("CaveBot[Bank] transferred "..amountToTransfer.." gold to: "..transferName)

      end)

      CaveBot.delay(storage.extras.talkDelay*11)

      return true

    end

  end)

 CaveBot.Editor.registerAction("bank", "bank", {

  value="action, NPC name",

  title="Banker",

  description="action type(withdraw/deposit/transfer), NPC name, (if withdraw: amount|if transfer: name, balance left)",

})

end

onTalk(function(name, level, mode, text, channelId, pos)

  if mode == 51 and text:find("Your account balance is") then

    balance = getFirstNumberInText(text)

  end

end)

```

---
# buy_supplies.lua

```lua

CaveBot.Extensions.BuySupplies = {}

CaveBot.Extensions.BuySupplies.setup = function()

  CaveBot.registerAction("BuySupplies", "#C300FF", function(value, retries)

    local possibleItems = {}

    local val = string.split(value, ",")

    local waitVal

    if #val == 0 or #val > 2 then 

      warn("CaveBot[BuySupplies]: incorrect BuySupplies value")

      return false 

    elseif #val == 2 then

      waitVal = tonumber(val[2]:trim())

    end

    local npcName = val[1]:trim()

    local npc = getCreatureByName(npcName)

    if not npc then 

      print("CaveBot[BuySupplies]: NPC not found")

      return false 

    end

    if not waitVal and #val == 2 then 

      warn("CaveBot[BuySupplies]: incorrect delay values!")

    elseif waitVal and #val == 2 then

      delay(waitVal)

    end

    if retries > 50 then

      print("CaveBot[BuySupplies]: Too many tries, can't buy")

      return false

    end

    if not CaveBot.ReachNPC(npcName) then

      return "retry"

    end

    if not NPC.isTrading() then

      CaveBot.OpenNpcTrade()

      CaveBot.delay(storage.extras.talkDelay*2)

      return "retry"

    end

    -- get items from npc

    local npcItems = NPC.getBuyItems()

    for i,v in pairs(npcItems) do

      table.insert(possibleItems, v.id)

    end

    for id, values in pairs(Supplies.getItemsData()) do

      id = tonumber(id)

      if table.find(possibleItems, id) then

        local max = values.max

        local current = player:getItemsCount(id)

        local toBuy = max - current

        if toBuy > 0 then

          toBuy = math.min(100, toBuy)

          NPC.buy(id, math.min(100, toBuy))

          print("CaveBot[BuySupplies]: bought " .. toBuy .. "x " .. id)

          return "retry"

        end

      end

    end

    print("CaveBot[BuySupplies]: bought everything, proceeding")

    return true

 end)

 CaveBot.Editor.registerAction("buysupplies", "buy supplies", {

  value="NPC name",

  title="Buy Supplies",

  description="NPC Name, delay(in ms, optional)",

})

end

```

---
# cavebot.lua

```lua

local cavebotMacro = nil

local config = nil

-- ui

local configWidget = UI.Config()

local ui = UI.createWidget("CaveBotPanel")

ui.list = ui.listPanel.list -- shortcut

CaveBot.actionList = ui.list

if CaveBot.Editor then

  CaveBot.Editor.setup()

end

if CaveBot.Config then

  CaveBot.Config.setup()

end

for extension, callbacks in pairs(CaveBot.Extensions) do

  if callbacks.setup then

    callbacks.setup()

  end

end

-- main loop, controlled by config

local actionRetries = 0

local prevActionResult = true

cavebotMacro = macro(20, function()

  if TargetBot and TargetBot.isActive() and not TargetBot.isCaveBotActionAllowed() then

    CaveBot.resetWalking()

    return -- target bot or looting is working, wait

  end

  if CaveBot.doWalking() then

    return -- executing walking3

  end

  local actions = ui.list:getChildCount()

  if actions == 0 then return end

  local currentAction = ui.list:getFocusedChild()

  if not currentAction then

    currentAction = ui.list:getFirstChild()

  end

  local action = CaveBot.Actions[currentAction.action]  

  local value = currentAction.value

  local retry = false

  if action then

    local status, result = pcall(function()

      CaveBot.resetWalking()

      return action.callback(value, actionRetries, prevActionResult)

    end)

    if status then

      if result == "retry" then

        actionRetries = actionRetries + 1

        retry = true

      elseif type(result) == 'boolean' then

        actionRetries = 0

        prevActionResult = result

      else

        warn("Invalid return from cavebot action (" .. currentAction.action .. "), should be \"retry\", false or true, is: " .. tostring(result))

      end

    else

      warn("warn while executing cavebot action (" .. currentAction.action .. "):\n" .. result)

    end    

  else

    warn("Invalid cavebot action: " .. currentAction.action)

  end

  if retry then

    return

  end

  if currentAction ~= ui.list:getFocusedChild() then

    -- focused child can change durring action, get it again and reset state

    currentAction = ui.list:getFocusedChild() or ui.list:getFirstChild()

    actionRetries = 0

    prevActionResult = true

  end

  local nextAction = ui.list:getChildIndex(currentAction) + 1

  if nextAction > actions then

    nextAction = 1

  end

  ui.list:focusChild(ui.list:getChildByIndex(nextAction))

end)

-- config, its callback is called immediately, data can be nil

local lastConfig = ""

config = Config.setup("cavebot_configs", configWidget, "cfg", function(name, enabled, data)

  if enabled and CaveBot.Recorder.isOn() then

    CaveBot.Recorder.disable()

    CaveBot.setOff()

    return    

  end

  local currentActionIndex = ui.list:getChildIndex(ui.list:getFocusedChild())

  ui.list:destroyChildren()

  if not data then return cavebotMacro.setOff() end

  local cavebotConfig = nil

  for k,v in ipairs(data) do

    if type(v) == "table" and #v == 2 then

      if v[1] == "config" then

        local status, result = pcall(function()

          return json.decode(v[2])

        end)

        if not status then

          warn("warn while parsing CaveBot extensions from config:\n" .. result)

        else

          cavebotConfig = result

        end

      elseif v[1] == "extensions" then

        local status, result = pcall(function()

          return json.decode(v[2])

        end)

        if not status then

          warn("warn while parsing CaveBot extensions from config:\n" .. result)

        else

          for extension, callbacks in pairs(CaveBot.Extensions) do

            if callbacks.onConfigChange then

              callbacks.onConfigChange(name, enabled, result[extension])

            end

          end

        end

      else

        CaveBot.addAction(v[1], v[2])

      end

    end

  end

  CaveBot.Config.onConfigChange(name, enabled, cavebotConfig)

  actionRetries = 0

  CaveBot.resetWalking()

  prevActionResult = true

  cavebotMacro.setOn(enabled)

  cavebotMacro.delay = nil

  if lastConfig == name then 

    -- restore focused child on the action list

    ui.list:focusChild(ui.list:getChildByIndex(currentActionIndex))

  end

  lastConfig = name  

end)

-- ui callbacks

ui.showEditor.onClick = function()

  if not CaveBot.Editor then return end

  if ui.showEditor:isOn() then

    CaveBot.Editor.hide()

    ui.showEditor:setOn(false)

  else

    CaveBot.Editor.show()

    ui.showEditor:setOn(true)

  end

end

ui.showConfig.onClick = function()

  if not CaveBot.Config then return end

  if ui.showConfig:isOn() then

    CaveBot.Config.hide()

    ui.showConfig:setOn(false)

  else

    CaveBot.Config.show()

    ui.showConfig:setOn(true)

  end

end

-- public function, you can use them in your scripts

CaveBot.isOn = function()

  return config.isOn()

end

CaveBot.isOff = function()

  return config.isOff()

end

CaveBot.setOn = function(val)

  if val == false then  

    return CaveBot.setOff(true)

  end

  config.setOn()

end

CaveBot.setOff = function(val)

  if val == false then  

    return CaveBot.setOn(true)

  end

  config.setOff()

end

CaveBot.getCurrentProfile = function()

  return storage._configs.cavebot_configs.selected

end

CaveBot.lastReachedLabel = function()

  return vBot.lastLabel

end

CaveBot.gotoNextWaypointInRange = function()

  local currentAction = ui.list:getFocusedChild()

  local index = ui.list:getChildIndex(currentAction)

  local actions = ui.list:getChildren()

  -- start searching from current index

  for i, child in ipairs(actions) do

    if i > index then

      local text = child:getText()

      if string.starts(text, "goto:") then

        local re = regexMatch(text, [[(?:goto:)([^,]+),([^,]+),([^,]+)]])

        local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}

        if posz() == pos.z then

          local maxDist = storage.extras.gotoMaxDistance

          if distanceFromPlayer(pos) <= maxDist then

            if findPath(player:getPosition(), pos, maxDist, { ignoreNonPathable = true }) then

              ui.list:focusChild(ui.list:getChildByIndex(i-1))

              return true

            end

          end

        end

      end

    end

  end

  -- if not found then damn go from start

  for i, child in ipairs(actions) do

    if i <= index then

      local text = child:getText()

      if string.starts(text, "goto:") then

        local re = regexMatch(text, [[(?:goto:)([^,]+),([^,]+),([^,]+)]])

        local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}

        if posz() == pos.z then

          local maxDist = storage.extras.gotoMaxDistance

          if distanceFromPlayer(pos) <= maxDist then

            if findPath(player:getPosition(), pos, maxDist, { ignoreNonPathable = true }) then

              ui.list:focusChild(ui.list:getChildByIndex(i-1))

              return true

            end

          end

        end

      end

    end

  end

  -- not found

  return false

end

local function reverseTable(t, max)

  local reversedTable = {}

  local itemCount = max or #t

  for i, v in ipairs(t) do

      reversedTable[itemCount + 1 - i] = v

  end

  return reversedTable

end

function rpairs(t)

  test()

	return function(t, i)

		i = i - 1

		if i ~= 0 then

			return i, t[i]

		end

	end, t, #t + 1

end

CaveBot.gotoFirstPreviousReachableWaypoint = function()

  local currentAction = ui.list:getFocusedChild()

  local currentIndex = ui.list:getChildIndex(currentAction)

  local index = ui.list:getChildIndex(currentAction)

  -- check up to 100 childs

  for i=0,100 do

    index = index - i

    if index <= 0 or index > currentIndex or math.abs(index-currentIndex) > 100 then

      break

    end

    local child = ui.list:getChildByIndex(index)

    if child then

      local text = child:getText()

      if string.starts(text, "goto:") then

        local re = regexMatch(text, [[(?:goto:)([^,]+),([^,]+),([^,]+)]])

        local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}

        if posz() == pos.z then

          if distanceFromPlayer(pos) <= storage.extras.gotoMaxDistance/2 then

            print("found pos, going back "..currentIndex-index.. " waypoints.")

            return ui.list:focusChild(child)

          end

        end

      end

    end

  end

  -- not found

  print("previous pos not found, proceeding")

  return false

end

CaveBot.getFirstWaypointBeforeLabel = function(label)

  label = "label:"..label

  label = label:lower()

  local actions = ui.list:getChildren()

  local index

  -- find index of label

  for i, child in pairs(actions) do

    local name = child:getText():lower()

    if name == label then

      index = i

      break

    end

  end

  -- if there's no index then label was not found

  if not index then return false end

  for i=1,#actions do

    if index - 1 < 1 then

      -- did not found any waypoint in range before label 

      return false

    end

    local child = ui.list:getChildByIndex(index-i)

    if child then

      local text = child:getText()

      if string.starts(text, "goto:") then

        local re = regexMatch(text, [[(?:goto:)([^,]+),([^,]+),([^,]+)]])

        local pos = {x = tonumber(re[1][2]), y = tonumber(re[1][3]), z = tonumber(re[1][4])}

        if posz() == pos.z then

          if distanceFromPlayer(pos) <= storage.extras.gotoMaxDistance/2 then

            return ui.list:focusChild(child)

          end

        end

      end

    end

  end

end

CaveBot.getPreviousLabel = function()

  local actions = ui.list:getChildren()

  -- check if config is empty

  if #actions == 0 then return false end

  local currentAction = ui.list:getFocusedChild()

  --check we made any progress in waypoints, if no focused or first then no point checking

  if not currentAction or currentAction == ui.list:getFirstChild() then return false end

  local index = ui.list:getChildIndex(currentAction)

  -- if not index then something went wrong and there's no selected child

  if not index then return false end

  for i=1,#actions do

    if index - i < 1 then

      -- did not found any waypoint in range before label 

      return false

    end

    local child = ui.list:getChildByIndex(index-i)

    if child then

      if child.action == "label" then

        return child.value

      end

    end

  end

end

CaveBot.getNextLabel = function()

  local actions = ui.list:getChildren()

  -- check if config is empty

  if #actions == 0 then return false end

  local currentAction = ui.list:getFocusedChild() or ui.list:getFirstChild()

  local index = ui.list:getChildIndex(currentAction)

  -- if not index then something went wrong

  if not index then return false end

  for i=1,#actions do

    if index + i > #actions then

      -- did not found any waypoint in range before label 

      return false

    end

    local child = ui.list:getChildByIndex(index+i)

    if child then

      if child.action == "label" then

        return child.value

      end

    end

  end

end

local botConfigName = modules.game_bot.contentsPanel.config:getCurrentOption().text

CaveBot.setCurrentProfile = function(name)

  if not g_resources.fileExists("/bot/"..botConfigName.."/cavebot_configs/"..name..".cfg") then

    return warn("there is no cavebot profile with that name!")

  end

  CaveBot.setOff()

  storage._configs.cavebot_configs.selected = name

  CaveBot.setOn()

end

CaveBot.delay = function(value)

  cavebotMacro.delay = math.max(cavebotMacro.delay or 0, now + value)

end

CaveBot.gotoLabel = function(label)

  label = label:lower()

  for index, child in ipairs(ui.list:getChildren()) do

    if child.action == "label" and child.value:lower() == label then    

      ui.list:focusChild(child)

      return true

    end

  end

  return false

end

CaveBot.save = function()

  local data = {}

  for index, child in ipairs(ui.list:getChildren()) do

    table.insert(data, {child.action, child.value})

  end

  if CaveBot.Config then

    table.insert(data, {"config", json.encode(CaveBot.Config.save())})

  end

  local extension_data = {}

  for extension, callbacks in pairs(CaveBot.Extensions) do

    if callbacks.onSave then

      local ext_data = callbacks.onSave()

      if type(ext_data) == "table" then

        extension_data[extension] = ext_data

      end

    end

  end

  table.insert(data, {"extensions", json.encode(extension_data, 2)})

  config.save(data)

end

CaveBotList = function()

  return ui.list

end

```

---
# cavebot.otui

```otui

CaveBotAction < Label

  background-color: alpha

  text-offset: 2 0

  focusable: true

  $focus:

    background-color: #00000055

CaveBotPanel < Panel

  layout:

    type: verticalBox

    fit-children: true

  HorizontalSeparator

    margin-top: 2

    margin-bottom: 5

  Panel

    id: listPanel

    height: 100

    margin-top: 2

    TextList

      id: list

      anchors.fill: parent

      vertical-scrollbar: listScrollbar

      margin-right: 15

      focusable: false

      auto-focus: first

    VerticalScrollBar

      id: listScrollbar

      anchors.top: parent.top

      anchors.bottom: parent.bottom

      anchors.right: parent.right

      pixels-scroll: true

      step: 10

  BotSwitch

    id: showEditor

    margin-top: 2

    $on:

      text: Hide waypoints editor

    $!on:

      text: Show waypoints editor

  BotSwitch

    id: showConfig

    margin-top: 2

    $on:

      text: Hide config

    $!on:

      text: Show config

```

---
# clear_tile.lua

```lua

CaveBot.Extensions.ClearTile = {}

CaveBot.Extensions.ClearTile.setup = function()

  CaveBot.registerAction("ClearTile", "#00FFFF", function(value, retries)

    local data = string.split(value, ",")

    local pos = {x=tonumber(data[1]), y=tonumber(data[2]), z=tonumber(data[3])}

    local doors = false

    local stand = false

    local pPos = player:getPosition()

    for i, value in ipairs(data) do

      value = value:lower():trim()

      if value == "stand" then

        stand = true

      elseif value == "doors" then

        doors = true

      end

    end

    if not #pos == 3 then

      warn("CaveBot[ClearTile]: invalid value. It should be position (x,y,z), is: " .. value)

      return false

    end

    if retries >= 20 then

      print("CaveBot[ClearTile]: too many tries, can't clear it")

      return false -- tried 20 times, can't clear it

    end

    if getDistanceBetween(player:getPosition(), pos) == 0 then

      print("CaveBot[ClearTile]: tile reached, proceeding")

      return true

    end

    local tile = g_map.getTile(pos)

    if not tile then

      print("CaveBot[ClearTile]: can't find tile or tile is unreachable, skipping")

      return false

    end

    local tPos = tile:getPosition()

    -- no items on tile and walkability means we are done

    if tile:isWalkable() and tile:getTopUseThing():isNotMoveable() and not tile:hasCreature() and not doors then

      if stand then

        if not CaveBot.MatchPosition(tPos, 0) then

          CaveBot.GoTo(tPos, 0)

          return "retry"

        end

      end

      print("CaveBot[ClearTile]: tile clear, proceeding")

      return true

    end

    if not CaveBot.MatchPosition(tPos, 3) then

      CaveBot.GoTo(tPos, 3)

      return "retry"

    end

    if retries > 0 then

      delay(1100)

    end

    -- monster

    if tile:hasCreature() then

      local c = tile:getCreatures()[1]

      if c:isMonster() then

        attack(c)

        return "retry"

      end

    end

    -- moveable item

    local item = tile:getTopMoveThing()

    if item:isItem() then

      if item and not item:isNotMoveable() then

        print("CaveBot[ClearTile]: moving item... " .. item:getId().. " from tile")

        g_game.move(item, pPos, item:getCount())

        return "retry"

      end   

    end

    -- player

      -- push creature

      if tile:hasCreature() then

        local c = tile:getCreatures()[1]

        if c and c:isPlayer() then

          local candidates = {}

          for _, tile in ipairs(g_map.getTiles(posz())) do

            local tPos = tile:getPosition()

            if getDistanceBetween(c:getPosition(), tPos) == 1 and tPos ~= pPos and tile:isWalkable() then

              table.insert(candidates, tPos)

            end

          end

          if #candidates == 0 then

            print("CaveBot[ClearTile]: can't find tile to push, cannot clear way, skipping")

            return false

          else

            print("CaveBot[ClearTile]: pushing player... " .. c:getName() .. " out of the way")

            local pos = candidates[math.random(1,#candidates)]

            local tile = g_map.getTile(pos)

            tile:setText("here")

            schedule(500, function() tile:setText("") end)

            g_game.move(c, pos, 1)

            return "retry"

          end

        end

      end

    -- doors

    if doors then

      use(tile:getTopUseThing())

      return "retry"

    end

    return "retry"

  end)

  CaveBot.Editor.registerAction("cleartile", "clear tile", {

    value=function() return posx() .. "," .. posy() .. "," .. posz() end,

    title="position of tile to clear",

    description="tile position (x,y,z), doors/stand - optional",

    multiline=false

})

end

```

---
# config.lua

```lua

-- config for bot

CaveBot.Config = {}

CaveBot.Config.values = {}

CaveBot.Config.default_values = {}

CaveBot.Config.value_setters = {}

CaveBot.Config.setup = function()

  CaveBot.Config.ui = UI.createWidget("CaveBotConfigPanel")

  local ui = CaveBot.Config.ui

  local add = CaveBot.Config.add

  add("ping", "Server ping", 100)

  add("walkDelay", "Walk delay", 10)

  add("mapClick", "Use map click", false)

  add("mapClickDelay", "Map click delay", 100)

  add("ignoreFields", "Ignore fields", false)  

  add("skipBlocked", "Skip blocked path", false)  

  add("useDelay", "Delay after use", 400)

end

CaveBot.Config.show = function()

  CaveBot.Config.ui:show()

end

CaveBot.Config.hide = function()

  CaveBot.Config.ui:hide()

end

CaveBot.Config.onConfigChange = function(configName, isEnabled, configData)

  for k, v in pairs(CaveBot.Config.default_values) do

    CaveBot.Config.value_setters[k](v)

  end

  if not configData then return end

  for k, v in pairs(configData) do

    if CaveBot.Config.value_setters[k] then

      CaveBot.Config.value_setters[k](v)

    end

  end

end

CaveBot.Config.save = function()

  return CaveBot.Config.values

end

CaveBot.Config.add = function(id, title, defaultValue)

  if CaveBot.Config.values[id] then

    return warn("Duplicated config key: " .. id)

  end

  local panel

  local setter -- sets value

  if type(defaultValue) == "number" then

    panel = UI.createWidget("CaveBotConfigNumberValuePanel", CaveBot.Config.ui)

    panel:setId(id)

    setter = function(value)

      CaveBot.Config.values[id] = value

      panel.value:setText(value, true)

    end

    setter(defaultValue)

    panel.value.onTextChange = function(widget, newValue)

      newValue = tonumber(newValue)

      if newValue then

        CaveBot.Config.values[id] = newValue

        CaveBot.save()

      end

    end

  elseif type(defaultValue) == "boolean" then

    panel = UI.createWidget("CaveBotConfigBooleanValuePanel", CaveBot.Config.ui)

    panel:setId(id)

    setter = function(value)

      CaveBot.Config.values[id] = value

      panel.value:setOn(value, true)

    end

    setter(defaultValue)

    panel.value.onClick = function(widget)

      widget:setOn(not widget:isOn())

      CaveBot.Config.values[id] = widget:isOn()

      CaveBot.save()

    end

  else

    return warn("Invalid default value of config for key " .. id .. ", should be number or boolean")      

  end

  panel.title:setText(tr(title) .. ":")

  CaveBot.Config.value_setters[id] = setter

  CaveBot.Config.values[id] = defaultValue

  CaveBot.Config.default_values[id] = defaultValue

end

CaveBot.Config.get = function(id)

  if CaveBot.Config.values[id] == nil then

    return warn("Invalid CaveBot.Config.get, id: " .. id)

  end

  return CaveBot.Config.values[id]

end

CaveBot.Config.set = function(id, value)

  local valueType = CaveBot.Config.get(id)

  local panel = CaveBot.Config.ui[id]

  if valueType == 'boolean' then

    CaveBot.Config.values[id] = value

    panel.value:setOn(value, true)

    CaveBot.save()

  else

    CaveBot.Config.values[id] = value

    panel.value:setText(value, true)

    CaveBot.save()

  end

end

```

---
# config.otui

```otui

CaveBotConfigPanel < Panel

  id: cavebotEditor

  visible: false

  layout:

    type: verticalBox

    fit-children: true

  HorizontalSeparator

    margin-top: 5

  Label

    text-align: center

    text: CaveBot Config

    margin-top: 5

CaveBotConfigNumberValuePanel < Panel

  height: 20

  margin-top: 5

  BotTextEdit

    id: value

    anchors.right: parent.right

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    margin-right: 5

    width: 50

  Label

    id: title

    anchors.left: parent.left

    anchors.verticalCenter: prev.verticalCenter

    margin-left: 5

CaveBotConfigBooleanValuePanel < Panel

  height: 20

  margin-top: 5

  BotSwitch

    id: value

    anchors.right: parent.right

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    margin-right: 5

    width: 50

    $on:

      text: On

    $!on:

      text: Off

  Label

    id: title

    anchors.left: parent.left

    anchors.verticalCenter: prev.verticalCenter

    margin-left: 5

```

---
# d_withdraw.lua

```lua

CaveBot.Extensions.DWithdraw = {}

CaveBot.Extensions.DWithdraw.setup = function()

	CaveBot.registerAction("dpwithdraw", "#002FFF", function(value, retries)

		local capLimit

		local data = string.split(value, ",")

		if retries > 600 then

			print("CaveBot[DepotWithdraw]: actions limit reached, proceeding") 

			return false

		end

		local destContainer

		local depotContainer

		delay(70)

		-- input validation

		if not value or #data ~= 3 and #data ~= 4 then

			warn("CaveBot[DepotWithdraw]: incorrect value!")

			return false

		end

		local indexDp = tonumber(data[1]:trim())

		local destName = data[2]:trim():lower()

		local destId = tonumber(data[3]:trim())

		if #data == 4 then

			capLimit = tonumber(data[4]:trim())

		end

		-- cap check

		if freecap() < (capLimit or 200) then

			for i, container in ipairs(getContainers()) do

				if container:getName():lower():find("depot") or container:getName():lower():find("locker") then

					g_game.close(container)

				end

			end

			print("CaveBot[DepotWithdraw]: cap limit reached, proceeding") 

			return false 

		end

		-- containers

		for i, container in ipairs(getContainers()) do

			local cName = container:getName():lower()

			if destName == cName then

				destContainer = container

			elseif cName:find("depot box") then

				depotContainer = container

			end

		end

		if not destContainer then 

			print("CaveBot[DepotWithdraw]: container not found!")

			return false

		end

		if containerIsFull(destContainer) then

			for i, item in pairs(destContainer:getItems()) do

				if item:getId() == destId then

					g_game.open(item, destContainer)

					return "retry"

				end

			end

		end

		-- stash validation

		if depotContainer and #depotContainer:getItems() == 0 then

			print("CaveBot[DepotWithdraw]: all items withdrawn")

			g_game.close(depotContainer)

			return true

		end

		if containerIsFull(destContainer) then

			for i, item in pairs(destContainer:getItems()) do

				if item:getId() == destId then

					g_game.open(foundNextContainer, destContainer)

					return "retry"

				end

			end

			print("CaveBot[DepotWithdraw]: loot containers full!")

			return false

		end

		if not CaveBot.OpenDepotBox(indexDp) then

			return "retry"

		end

		CaveBot.PingDelay(2)

		for i, container in pairs(g_game.getContainers()) do

			if string.find(container:getName():lower(), "depot box") then

				for j, item in ipairs(container:getItems()) do

					statusMessage("[D_Withdraw] witdhrawing item: "..item:getId())

					g_game.move(item, destContainer:getSlotPosition(destContainer:getItemsCount()), item:getCount())

					return "retry"

				end

			end

		end

		return "retry"

  	end)

 	CaveBot.Editor.registerAction("dpwithdraw", "dpwithdraw", {

 	 value="1, shopping bag, 21411",

 	 title="Loot Withdraw",

 	 description="insert index, destination container name and it's ID",

})

end

```

---
# depositor.lua

```lua

CaveBot.Extensions.Depositor = {}

--local variables

local destination = nil

local lootTable = nil

local reopenedContainers = false

local function resetCache()

	reopenedContainers = false

	destination = nil

	lootTable = nil

	for i, container in ipairs(getContainers()) do

		if container:getName():lower():find("depot") or container:getName():lower():find("locker") then

			g_game.close(container)

		end

	end

	if storage.caveBot.backStop then

		storage.caveBot.backStop = false

		CaveBot.setOff()

	elseif storage.caveBot.backTrainers then

		storage.caveBot.backTrainers = false

		CaveBot.gotoLabel('toTrainers')

	elseif storage.caveBot.backOffline then

		storage.caveBot.backOffline = false

		CaveBot.gotoLabel('toOfflineTraining')

	end

end

local description = g_game.getClientVersion() > 960 and "No - just deposit \n Yes - also reopen loot containers" or "currently not supported, will be added in near future"

CaveBot.Extensions.Depositor.setup = function()

	CaveBot.registerAction("depositor", "#002FFF", function(value, retries)

		-- version check, TODO old tibia

		if g_game.getClientVersion() < 960 then

			resetCache()

			warn("CaveBot[Depositor]: unsupported Tibia version, will be added in near future")

			return false

		end

		-- loot list check

		lootTable = lootTable or CaveBot.GetLootItems()

		if #lootTable == 0 then

			print("CaveBot[Depositor]: no items in loot list. Wrong TargetBot Config? Proceeding")

			resetCache()

			return true

		end

		delay(70)

		-- backpacks etc

		if value:lower() == "yes" then

			if not reopenedContainers then

				CaveBot.CloseAllLootContainers()

				delay(3000)

				reopenedContainers = true

				return "retry"

			end

			-- open next backpacks if no more loot

			if not CaveBot.HasLootItems() then

				local lootContainers = CaveBot.GetLootContainers()

				for _, container in ipairs(getContainers()) do

					local cId = container:getContainerItem():getId()

					if table.find(lootContainers, cId) then

						for i, item in ipairs(container:getItems()) do

							if item:getId() == cId then

								g_game.open(item, container)

								delay(100)

								return "retry"

							end

						end

					end

				end

				-- couldn't find next container, so we done

				print("CaveBot[Depositor]: all items stashed, no backpack to open next, proceeding")

				CaveBot.CloseAllLootContainers()

				delay(3000)

				resetCache()

				return true

			end

		end

		-- first check items

		if retries == 0 then

			if not CaveBot.HasLootItems() then -- resource consuming function

				print("CaveBot[Depositor]: no items to stash, proceeding")

				resetCache()

				return true

			end

		end

		-- next check retries

		if retries > 400 then 

			print("CaveBot[Depositor]: Depositor actions limit reached, proceeding")

			resetCache()

			return true 

		end

		-- reaching and opening depot 

		if not CaveBot.ReachAndOpenDepot() then

			return "retry"

		end

		-- add delay to prevent bugging

		CaveBot.PingDelay(2)

		-- prep time and stashing

		destination = destination or getContainerByName("Depot chest")

		if not destination then return "retry" end

		for _, container in pairs(getContainers()) do

    	    local name = container:getName():lower()

    	    if not name:find("depot") and not name:find("your inbox") then

    	        for _, item in pairs(container:getItems()) do

    	            local id = item:getId()

					if table.find(lootTable, id) then

						local index = getStashingIndex(id) or item:isStackable() and 1 or 0

						statusMessage("[Depositer] stashing item: " ..id.. " to depot: "..index+1)

						CaveBot.StashItem(item, index, destination)

						return "retry"

					end

				end

			end

		end

		-- we gucci

		resetCache()

		return true

	end)

	CaveBot.Editor.registerAction("depositor", "depositor", {

	 value="no",

	 title="Depositor",

	 description=description,

	 validation="(yes|Yes|YES|no|No|NO)"

})

end

```

---
# doors.lua

```lua

CaveBot.Extensions.OpenDoors = {}

CaveBot.Extensions.OpenDoors.setup = function()

  CaveBot.registerAction("OpenDoors", "#00FFFF", function(value, retries)

    local pos = string.split(value, ",")

    local key = nil

    if #pos == 4 then

      key = tonumber(pos[4])

    end

    if not pos[1] then

      warn("CaveBot[OpenDoors]: invalid value. It should be position (x,y,z), is: " .. value)

      return false

    end

    if retries >= 5 then

      print("CaveBot[OpenDoors]: too many tries, can't open doors")

      return false -- tried 5 times, can't open

    end

    pos = {x=tonumber(pos[1]), y=tonumber(pos[2]), z=tonumber(pos[3])}  

    local doorTile

    if not doorTile then

      for i, tile in ipairs(g_map.getTiles(posz())) do

        if tile:getPosition().x == pos.x and tile:getPosition().y == pos.y and tile:getPosition().z == pos.z then

          doorTile = tile

        end

      end

    end

    if not doorTile then

      return false

    end

    if not doorTile:isWalkable() then

      if not key then

        use(doorTile:getTopUseThing())

        delay(200)

        return "retry"

      else

        useWith(key, doorTile:getTopUseThing())

        delay(200)

        return "retry"

      end

    else

      print("CaveBot[OpenDoors]: possible to cross, proceeding")

      return true

    end

  end)

  CaveBot.Editor.registerAction("opendoors", "open doors", {

    value=function() return posx() .. "," .. posy() .. "," .. posz() end,

    title="Door position",

    description="doors position (x,y,z) and key id (optional)",

    multiline=false,

    validation=[[\d{1,5},\d{1,5},\d{1,2}(?:,\d{1,5}$|$)]]

})

end

```

---
# editor.lua

```lua

CaveBot.Editor = {}

CaveBot.Editor.Actions = {}

-- also works as registerAction(action, params), then text == action

-- params are options for text editor or function to be executed when clicked

-- you have many examples how to use it bellow

CaveBot.Editor.registerAction = function(action, text, params)

  if type(text) ~= 'string' then

    params = text

    text = action

  end

  local color = nil

  if type(params) ~= 'function' then

    local raction = CaveBot.Actions[action]

    if not raction then

      return warn("CaveBot editor warn: action " .. action .. " doesn't exist")

    end

    CaveBot.Editor.Actions[action] = params

    color = raction.color

  end

  local button = UI.createWidget('CaveBotEditorButton', CaveBot.Editor.ui.buttons)

  button:setText(text)

  if color then

    button:setColor(color)

  end

  button.onClick = function()    

    if type(params) == 'function' then

      params()

      return

    end

    CaveBot.Editor.edit(action, nil, function(action, value)

      local focusedAction = CaveBot.actionList:getFocusedChild()

      local index = CaveBot.actionList:getChildCount()

      if focusedAction then

        index = CaveBot.actionList:getChildIndex(focusedAction)

      end

      local widget = CaveBot.addAction(action, value)

      CaveBot.actionList:moveChildToIndex(widget, index + 1)

      CaveBot.actionList:focusChild(widget)

      CaveBot.save()

    end)

  end

  return button

end

CaveBot.Editor.setup = function()

  CaveBot.Editor.ui = UI.createWidget("CaveBotEditorPanel")

  local ui = CaveBot.Editor.ui

  local registerAction = CaveBot.Editor.registerAction

  registerAction("move up", function()

    local action = CaveBot.actionList:getFocusedChild()

    if not action then return end

    local index = CaveBot.actionList:getChildIndex(action)

    if index < 2 then return end

    CaveBot.actionList:moveChildToIndex(action, index - 1)

    CaveBot.actionList:ensureChildVisible(action)

    CaveBot.save()

  end)

  registerAction("edit", function()

    local action = CaveBot.actionList:getFocusedChild()

    if not action or not action.onDoubleClick then return end

    action.onDoubleClick(action)

  end)

  registerAction("move down", function()

    local action = CaveBot.actionList:getFocusedChild()

    if not action then return end

    local index = CaveBot.actionList:getChildIndex(action)

    if index >= CaveBot.actionList:getChildCount() then return end

    CaveBot.actionList:moveChildToIndex(action, index + 1)

    CaveBot.actionList:ensureChildVisible(action)

    CaveBot.save()

  end)

  registerAction("remove", function()

    local action = CaveBot.actionList:getFocusedChild()

    if not action then return end

    action:destroy()

    CaveBot.save()

  end)

  registerAction("label", {

    value="labelName",

    title="Label",

    description="Add label",

    multiline=false   

})

  registerAction("delay", {

    value="500",

    title="Delay",

    description="Delay next action (in milliseconds),randomness (in percent-optional)",

    multiline=false,

    validation="^[0-9]{1,10}$|^[0-9]{1,10},[0-9]{1,4}$"

})

  registerAction("gotolabel", "go to label", {

    value="labelName",

    title="Go to label",

    description="Go to label",

    multiline=false   

})

  registerAction("goto", "go to", {

    value=function() return posx() .. "," .. posy() .. "," .. posz() end,

    title="Go to position",

    description="Go to position (x,y,z)",

    multiline=false,

    validation="^\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+),?\\s*([0-9]?)$"

})

  registerAction("use", {

    value=function() return posx() .. "," .. posy() .. "," .. posz() end,

    title="Use",

    description="Use item from position (x,y,z) or from inventory (itemId)",

    multiline=false   

})

  registerAction("usewith", "use with", {

    value=function() return "itemId," .. posx() .. "," .. posy() .. "," .. posz() end,

    title="Use with",

    description="Use item at position (itemid,x,y,z)",

    multiline=false,

    validation="^\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+)$"

})

  registerAction("say", {

    value="text",

    title="Say",

    description="Enter text to say",

    multiline=false   

})

  registerAction("follow", {

    value="NPC name",

    title="Follow Creature",

    description="insert creature name to follow",

    multiline=false   

})

  registerAction("npcsay", {

    value="text",

    title="NPC Say",

    description="Enter text to NPC say",

    multiline=false   

})

  registerAction("function", {

    title="Edit bot function",

    multiline=true,

    value=CaveBot.Editor.ExampleFunctions[1][2],

    examples=CaveBot.Editor.ExampleFunctions,

    width=650

})

  ui.autoRecording.onClick = function()

    if ui.autoRecording:isOn() then

      CaveBot.Recorder.disable()

    else

      CaveBot.Recorder.enable()

    end

  end

  -- callbacks

  onPlayerPositionChange(function(pos)

    ui.pos:setText("Position: " .. pos.x .. ", " .. pos.y .. ", " .. pos.z) 

  end)

  ui.pos:setText("Position: " .. posx() .. ", " .. posy() .. ", " .. posz()) 

end

CaveBot.Editor.show = function()

  CaveBot.Editor.ui:show()

end

CaveBot.Editor.hide = function()

  CaveBot.Editor.ui:hide()

end

CaveBot.Editor.edit = function(action, value, callback) -- callback = function(action, value)

  local params = CaveBot.Editor.Actions[action]

  if not params then return end

  if not value then

    if type(params.value) == 'function' then

      value = params.value()

    elseif type(params.value) == 'string' then

      value = params.value

    end

  end

  UI.EditorWindow(value, params, function(newText)

    callback(action, newText)

  end)   

end

```

---
# editor.otui

```otui

CaveBotEditorButton < Button

CaveBotEditorPanel < Panel

  id: cavebotEditor

  visible: false

  layout:

    type: verticalBox

    fit-children: true

  Label

    id: pos

    text-align: center

    text: -

  Panel

    id: buttons

    margin-top: 2

    layout:

      type: grid

      cell-size: 86 20

      cell-spacing: 1

      flow: true

      fit-children: true

  Label

    text: Double click on action from action list to edit it

    text-align: center

    text-auto-resize: true

    text-wrap: true

    margin-top: 3

    margin-left: 2

    margin-right: 2

  BotSwitch

    id: autoRecording

    text: Auto Recording

    margin-top: 3

  BotButton

    margin-top: 3

    margin-bottom: 3

    text: Documentation

    @onClick: g_platform.openUrl("http://bot.otclient.ovh/")

```

---
# example_functions.lua

```lua

CaveBot.Editor.ExampleFunctions = {}

local function addExampleFunction(title, text)

  return table.insert(CaveBot.Editor.ExampleFunctions, {title, text:trim()})

end

addExampleFunction("Click to browse example functions", [[

-- available functions/variables:

-- prev - result of previous action (true or false)

-- retries - number of retries of current function, goes up by one when you return "retry"

-- delay(number) - delays bot next action, value in milliseconds

-- gotoLabel(string) - goes to specific label, return true if label exists

-- you can easily access bot extensions, Depositer.run() instead of CaveBot.Extensions.Depositer.run()

-- also you can access bot global variables, like CaveBot, TargetBot

-- use storage variable to store date between calls

-- function should return false, true or "retry"

-- if "retry" is returned, function will be executed again in 20 ms (so better call delay before)

return true

]])

addExampleFunction("Check for PZ and wait until dropped", [[

if retries > 25 or not isPzLocked() then

  return true

else

  if isPoisioned() then

      say("exana pox")

  end

  if isPzLocked() then

      delay(8000)

  end

  return "retry"

end

]])

addExampleFunction("Check for stamina and imbues", [[

  if stamina() < 900 or player:getSkillLevel(11) == 0 then CaveBot.setOff() return false else return true end

]])

addExampleFunction("buy 200 mana potion from npc Eryn", [[

--buy 200 mana potions

local npc = getCreatureByName("Eryn")

if not npc then 

  return false 

end

if retries > 10 then

  return false

end

local pos = player:getPosition()

local npcPos = npc:getPosition()

if math.max(math.abs(pos.x - npcPos.x), math.abs(pos.y - npcPos.y)) > 3 then

  autoWalk(npcPos, {precision=3})

  delay(300)

  return "retry"

end

if not NPC.isTrading() then

  NPC.say("hi")

  NPC.say("trade")

  delay(200)

  return "retry"

end

NPC.buy(268, 100)

schedule(1000, function()

  -- buy again in 1s

  NPC.buy(268, 100)

  NPC.closeTrade()

  NPC.say("bye")

end)

delay(1200)

return true

]])

addExampleFunction("Say hello 5 times with some delay", [[

--say hello

if retries > 5 then

  return true -- finish

end

say("hello")

delay(100 + retries * 100)

return "retry"

]])

addExampleFunction("Disable TargetBot", [[

TargetBot.setOff()

return true

]])

addExampleFunction("Enable TargetBot", [[

TargetBot.setOn()

return true

]])

addExampleFunction("Enable TargetBot luring", [[

TargetBot.enableLuring()

return true

]])

addExampleFunction("Disable TargetBot luring", [[

TargetBot.disableLuring()

return true

]])

addExampleFunction("Logout", [[

g_game.safeLogout()

delay(1000)

return "retry"

]])

addExampleFunction("Close Loot Containers", [[

CaveBot.CloseAllLootContainers()

delay(3000)

return true

]])

```

---
# extension_template.lua

```lua

-- example cavebot extension (remember to add this file to ../cavebot.lua)

CaveBot.Extensions.Example = {}

local ui

-- setup is called automaticly when cavebot is ready

CaveBot.Extensions.Example.setup = function()

  ui = UI.createWidget('BotTextEdit')

  ui:setText("Hello")

  ui.onTextChange = function()

    CaveBot.save() -- save new config when you change something

  end

  -- add custom cavebot action (check out actions.lua)

  CaveBot.registerAction("sayhello", "orange", function(value, retries, prev)

    local how_many_times = tonumber(value)

    if retries >= how_many_times then

      return true

    end

    say("hello " .. (retries + 1))

    delay(250)

    return "retry"

  end)

  -- add this custom action to editor (check out editor.lua)

  CaveBot.Editor.registerAction("sayhello", "say hello", {

    value="5",

    title="Say hello",

    description="Says hello x times",

    validation="[0-9]{1,5}" -- regex, optional

})

end

-- called when cavebot config changes, configData is a table but it can also be nil

CaveBot.Extensions.Example.onConfigChange = function(configName, isEnabled, configData)

  if not configData then return end

  if configData["text"] then

    ui:setText(configData["text"])

  end

end

-- called when cavebot is saving config (so when CaveBot.save() is called), should return table or nil

CaveBot.Extensions.Example.onSave = function()

  return {text=ui:getText()}

end

-- bellow add you custom functions to be used in cavebot function action

-- an example: return Example.run(retries, prev)

-- there are 2 useful parameters - retries (number) and prev (true/false), check actions.lua and example_functions.lua to learn more

CaveBot.Extensions.Example.run = function(retries, prev)

  -- it will say text 10 times with some delay and then continue

  if retries > 10 then

    return true

  end

  say(ui:getText() .. " x" .. retries)

  delay(100 + retries * 100)

  return "retry"

end

```

---
# imbuing.lua

```lua

-- imbuing window should be handled separatly

-- reequiping should be handled separatly (ie. equipment manager)

CaveBot.Extensions.Imbuing = {}

local SHRINES = {25060, 25061, 25182, 25183}

local currentIndex = 1

local shrine = nil

local item = nil

local currentId = 0

local triedToTakeOff = false

local destination = nil

local function reset()

  EquipManager.setOn()

  shrine = nil

  currentIndex = 1

  item = nil

  currentId = 0

  triedToTakeOff = false

  destination = nil

end

CaveBot.Extensions.Imbuing.setup = function()

  CaveBot.registerAction("imbuing", "red", function(value, retries)

    local data = string.split(value, ",")

    local ids = {}

    if #data == 0 and value ~= 'name' then

      warn("CaveBot[Imbuing] no items added, proceeding")

      reset()

      return false

    end

    -- setting of equipment manager so it wont disturb imbuing process

    EquipManager.setOff()

    if value == 'name' then

      local imbuData = AutoImbueTable[player:getName()]      

      for id, imbues in pairs(imbuData) do

        table.insert(ids, id)

      end

    else

      -- convert to number

      for i, id in ipairs(data) do

        id = tonumber(id)

        if not table.find(ids, id) then

          table.insert(ids, id)

        end

      end

    end

    -- all items imbued, can proceed

    if currentIndex > #ids then

      warn("CaveBot[Imbuing] used shrine on all items, proceeding")

      reset()

      return true

    end

    for _, tile in ipairs(g_map.getTiles(posz())) do

      for _, item in ipairs(tile:getItems()) do

          local id = item:getId()

          if table.find(SHRINES, id) then

            shrine = item

            break

          end

      end

    end

    -- if not shrine

    if not shrine then

      warn("CaveBot[Imbuing] shrine not found! proceeding")

      reset()

      return false

    end

    destination = shrine:getPosition()

    currentId = ids[currentIndex]

    item = findItem(currentId)

    -- maybe equipped? try to take off

    if not item then

      -- did try before, still not found so item is unavailable

      if triedToTakeOff then

        warn("CaveBot[Imbuing] item not found! skipping: "..currentId)

        triedToTakeOff = false

        currentIndex = currentIndex + 1

        return "retry"

      end

      triedToTakeOff = true

      g_game.equipItemId(currentId)

      delay(1000)

      return "retry"

    end

    -- we are past unequiping so just in case we were forced before, reset var

    triedToTakeOff = false

    -- reaching shrine

    if not CaveBot.MatchPosition(destination, 1) then

      CaveBot.GoTo(destination, 1)

      delay(200)

      return "retry"

    end

    useWith(shrine, item)

    currentIndex = currentIndex + 1

    warn("CaveBot[Imbuing] Using shrine on item: "..currentId)

    delay(4000)

    return "retry"

  end)

 CaveBot.Editor.registerAction("imbuing", "imbuing", {

  value="name",

  title="Auto Imbuing",

  description="insert below item ids to be imbued, separated by comma\nor 'name' to load from file",

})

end

```

---
# inbox_withdraw.lua

```lua

CaveBot.Extensions.InWithdraw = {}

CaveBot.Extensions.InWithdraw.setup = function()

	CaveBot.registerAction("inwithdraw", "#002FFF", function(value, retries)

		local data = string.split(value, ",")

		local withdrawId

		local amount

		-- validation

		if #data ~= 2 then

			warn("CaveBot[InboxWithdraw]: incorrect withdraw value")

			return false

		else

			withdrawId = tonumber(data[1])

			amount = tonumber(data[2])

		end

		local currentAmount = itemAmount(withdrawId)

		if currentAmount >= amount then

			print("CaveBot[InboxWithdraw]: enough items, proceeding")

			return true

		end

		if retries > 400 then

			print("CaveBot[InboxWithdraw]: actions limit reached, proceeding")

			return true

		end

		-- actions

		local inboxContainer = getContainerByName("your inbox")

		delay(100)

		if not inboxContainer then

			if not CaveBot.ReachAndOpenInbox() then

				return "retry"

			end

		end

		local inboxAmount = 0

		if not inboxContainer then

			return "retry"

		end

		for i, item in pairs(inboxContainer:getItems()) do

			if item:getId() == withdrawId then

				inboxAmount = inboxAmount + item:getCount()

			end

		end

		if inboxAmount == 0 then

			warn("CaveBot[InboxWithdraw]: not enough items in inbox container, proceeding")

			g_game.close(inboxContainer)

			return true

		end

		local destination

		for i, container in pairs(getContainers()) do

			if container:getCapacity() > #container:getItems() and not string.find(container:getName():lower(), "quiver") and not string.find(container:getName():lower(), "depot") and not string.find(container:getName():lower(), "loot") and not string.find(container:getName():lower(), "inbox") then

				destination = container 

			end

		end

		if not destination then

			print("CaveBot[InboxWithdraw]: couldn't find proper destination container, skipping")

			g_game.close(inboxContainer)

			return false

		end

		CaveBot.PingDelay(2)

		for i, container in pairs(getContainers()) do

			if string.find(container:getName():lower(), "your inbox") then

				for j, item in pairs(container:getItems()) do

					if item:getId() == withdrawId then

						if item:isStackable() then

							g_game.move(item, destination:getSlotPosition(destination:getItemsCount()), math.min(item:getCount(), (amount - currentAmount)))

							return "retry"

						else

							g_game.move(item, destination:getSlotPosition(destination:getItemsCount()), 1)

							return "retry"

						end

						return "retry"

					end

				end

			end

		end

  	end)

 	CaveBot.Editor.registerAction("inwithdraw", "in withdraw", {

 	 value="id,amount",

 	 title="Withdraw Items",

 	 description="insert item id and amount",

})

end

```

---
# lure.lua

```lua

CaveBot.Extensions.Lure = {}

CaveBot.Extensions.Lure.setup = function()

  CaveBot.registerAction("lure", "#FF0090", function(value, retries)

    value = value:lower()

    if value == "start" then

        TargetBot.setOff()

    elseif value == "stop" then

        TargetBot.setOn()

    elseif value == "toggle" then

      if TargetBot.isOn() then

        TargetBot.setOff()

      else

        TargetBot.setOn()

      end

    else

      warn("incorrect lure value!")

    end

    return true

  end)

  CaveBot.Editor.registerAction("lure", "lure", {

    value="toggle",

    title="Lure",

    description="TargetBot: start, stop, toggle",

    multiline=false,

    validation=[[(start|stop|toggle)$]]

})

end

```

---
# minimap.lua

```lua

local minimap = modules.game_minimap.minimapWidget

minimap.onMouseRelease = function(widget,pos,button)

  if not minimap.allowNextRelease then return true end

  minimap.allowNextRelease = false

  local mapPos = minimap:getTilePosition(pos)

  if not mapPos then return end

  if button == 1 then

    local player = g_game.getLocalPlayer()

    if minimap.autowalk then

      player:autoWalk(mapPos)

    end

    return true

  elseif button == 2 then

    local menu = g_ui.createWidget('PopupMenu')

    menu:setId("minimapMenu")

    menu:setGameMenu(true)

    menu:addOption(tr('Create mark'), function() minimap:createFlagWindow(mapPos) end)

    menu:addOption(tr('Add CaveBot GoTo'), function() CaveBot.addAction("goto", mapPos.x .. "," .. mapPos.y .. "," .. mapPos.z, true) CaveBot.save() end)

    menu:display(pos)

    return true

  end

  return false

end

```

---
# pos_check.lua

```lua

CaveBot.Extensions.PosCheck = {}

local posCheckRetries = 0

CaveBot.Extensions.PosCheck.setup = function()

  CaveBot.registerAction("PosCheck", "#00FFFF", function(value, retries)

    local tilePos

    local data = string.split(value, ",")

    if #data ~= 5 then

     warn("wrong travel format, should be: label, distance, x, y, z")

     return false

    end

    local tilePos = player:getPosition()

    tilePos.x = tonumber(data[3])

    tilePos.y = tonumber(data[4])

    tilePos.z = tonumber(data[5])

    if posCheckRetries > 10 then

        posCheckRetries = 0

        print("CaveBot[CheckPos]: waypoints locked, too many tries, unclogging cavebot and proceeding")

        return false

    elseif (tilePos.z == player:getPosition().z) and (getDistanceBetween(player:getPosition(), tilePos) <= tonumber(data[2])) then

        posCheckRetries = 0

        print("CaveBot[CheckPos]: position reached, proceeding")

        return true

    else

        posCheckRetries = posCheckRetries + 1

        if data[1] == "last" then

          CaveBot.gotoFirstPreviousReachableWaypoint()

          print("CaveBot[CheckPos]: position not-reached, going back to first reachable waypoint.")

          return false

        else

          CaveBot.gotoLabel(data[1])

          print("CaveBot[CheckPos]: position not-reached, going back to label: " .. data[1])

          return false

        end

    end

  end)

  CaveBot.Editor.registerAction("poscheck", "pos check", {

    value=function() return "last" .. "," .. "10" .. "," .. posx() .. "," .. posy() .. "," .. posz() end,

    title="Location Check",

    description="label name, accepted dist from coordinates, x, y, z",

    multiline=false,

})

end

```

---
# recorder.lua

```lua

-- auto recording for cavebot

CaveBot.Recorder = {}

local isEnabled = nil

local lastPos = nil

local function setup()

  local function addPosition(pos)

    CaveBot.addAction("goto", pos.x .. "," .. pos.y .. "," .. pos.z, true)

    lastPos = pos

  end

  local function addStairs(pos)

    CaveBot.addAction("goto", pos.x .. "," .. pos.y .. "," .. pos.z .. ",0", true)

    lastPos = pos

  end

  onPlayerPositionChange(function(newPos, oldPos)

    if CaveBot.isOn() or not isEnabled then return end    

    if not lastPos then

      -- first step

      addPosition(oldPos)

    elseif newPos.z ~= oldPos.z or math.abs(oldPos.x - newPos.x) > 1 or math.abs(oldPos.y - newPos.y) > 1 then

      -- stairs/teleport

      addStairs(oldPos)

    elseif math.max(math.abs(lastPos.x - newPos.x), math.abs(lastPos.y - newPos.y)) > 5 then

      -- 5 steps from last pos

      addPosition(newPos)

    end

  end)

  onUse(function(pos, itemId, stackPos, subType)

    if CaveBot.isOn() or not isEnabled then return end

    if pos.x ~= 0xFFFF then 

      lastPos = pos

      CaveBot.addAction("use", pos.x .. "," .. pos.y .. "," .. pos.z, true)

    end

  end)

  onUseWith(function(pos, itemId, target, subType)

    if CaveBot.isOn() or not isEnabled then return end

    if not target:isItem() then return end

    local targetPos = target:getPosition()

    if targetPos.x == 0xFFFF then return end

    lastPos = pos

    CaveBot.addAction("usewith", itemId .. "," .. targetPos.x .. "," .. targetPos.y .. "," .. targetPos.z, true)

  end)

end

CaveBot.Recorder.isOn = function()

  return isEnabled

end

CaveBot.Recorder.enable = function()

  CaveBot.setOff()

  if isEnabled == nil then

    setup()

  end

  CaveBot.Editor.ui.autoRecording:setOn(true)

  isEnabled = true

  lastPos = nil

end

CaveBot.Recorder.disable = function()

  if isEnabled == true then

    isEnabled = false

  end

  CaveBot.Editor.ui.autoRecording:setOn(false)

  CaveBot.save()

end

```

---
# sell_all.lua

```lua

CaveBot.Extensions.SellAll = {}

local sellAllCap = 0

CaveBot.Extensions.SellAll.setup = function()

  CaveBot.registerAction("SellAll", "#C300FF", function(value, retries)

    local val = string.split(value, ",")

    local wait

    -- table formatting

    for i, v in ipairs(val) do

      v = v:trim()

      v = tonumber(v) or v

      val[i] = v

    end

    if table.find(val, "yes", true) then

      wait = true

    end

    local npcName = val[1]

    local npc = getCreatureByName(npcName)

    if not npc then 

      print("CaveBot[SellAll]: NPC not found! skipping")

      return false 

    end

    if retries > 10 then

      print("CaveBot[SellAll]: can't sell, skipping")

      return false

    end

    if freecap() == sellAllCap then

      sellAllCap = 0 

      print("CaveBot[SellAll]: Sold everything, proceeding")

      return true

    end

    delay(800)

    if not CaveBot.ReachNPC(npcName) then

      return "retry"

    end

    if not NPC.isTrading() then

      CaveBot.OpenNpcTrade()

      delay(storage.extras.talkDelay*2)

      return "retry"

    else

      sellAllCap = freecap()

    end

    modules.game_npctrade.sellAll(wait, val)

    if wait then

      print("CaveBot[SellAll]: Sold All with delay")

    else

      print("CaveBot[SellAll]: Sold All without delay")

    end

    return "retry"

  end)

 CaveBot.Editor.registerAction("sellall", "sell all", {

  value="NPC",

  title="Sell All",

  description="NPC Name, 'yes' if sell with delay, exceptions: id separated by comma",

})

end

```

---
# stand_lure.lua

```lua

CaveBot.Extensions.StandLure = {}

local enable = nil

local function modPos(dir)

    local y = 0

    local x = 0

    if dir == 0 then

        y = -1

    elseif dir == 1 then

        x = 1

    elseif dir == 2 then

        y = 1

    elseif dir == 3 then

        x = -1

    elseif dir == 4 then

        y = -1

        x = 1

    elseif dir == 5 then

        y = 1

        x = 1

    elseif dir == 6 then

        y = 1

        x = -1

    elseif dir == 7 then

        y = -1

        x = -1

    end

    return {x, y}

end

local function reset(delay)

    if type(Supplies.hasEnough()) == 'table' then

        return

    end

    delay = delay or 0

    CaveBot.delay(delay)

    if delay == nil then

        enable = nil

    end

end

local resetRetries = false

CaveBot.Extensions.StandLure.setup = function()

    CaveBot.registerAction(

        "rushlure",

        "#FF0090",

        function(value, retries)

            local nextPos = nil

            local data = string.split(value, ",")

            if not data[1] then

                warn("Invalid cavebot lure action value. It should be position (x,y,z), delay(ms) is: " .. value)

                return false

            end

            if type(Supplies.hasEnough()) == 'table' then -- do not execute if no supplies

                return false

            end

            local pos = {x = tonumber(data[1]), y = tonumber(data[2]), z = tonumber(data[3])}

            local delayTime = data[4] and tonumber(data[4]) or 1000

            if not data[5] then

                enable = nil

            elseif data[5] == "yes" then

                enable = true

            else

                enable = false

            end

            delay(100)

            if retries > 50 and not resetRetries then

                reset()

                warn("[Rush Lure] Too many tries, can't reach position")

                return false  -- can't stand on tile

            end

            if resetRetries then

                resetRetries = false

            end

            if distanceFromPlayer(pos) > 30 then

                reset()

                return false -- not reachable

            end

            local playerPos = player:getPosition()

            local pathWithoutMonsters = findPath(playerPos, pos, 30, { ignoreFields = true, ignoreNonPathable = true, ignoreCreatures = true, precision = 0})

            local pathWithMonsters = findPath(playerPos, pos, maxDist, { ignoreFields = true, ignoreNonPathable = true, ignoreCreatures = false, precision = 0 })

            if not pathWithoutMonsters then

                reset()

                warn("[Rush Lure] No possible path to reach position, skipping.")

                return false -- spot is unreachable 

            elseif pathWithoutMonsters and not pathWithMonsters then

              local foundMonster = false

              for i, dir in ipairs(pathWithoutMonsters) do

                local dirs = modPos(dir)

                nextPos = nextPos or playerPos

                nextPos.x = nextPos.x + dirs[1]

                nextPos.y = nextPos.y + dirs[2]

                local tile = g_map.getTile(nextPos)

                if tile then

                    if tile:hasCreature() then

                        local creature = tile:getCreatures()[1]

                        local hppc = creature:getHealthPercent()

                        if creature:isMonster() and (hppc and hppc > 0) and (oldTibia or creature:getType() < 3) then

                            -- real blocking creature can not meet those conditions - ie. it could be player, so just in case check if the next creature is reachable

                            local path = findPath(playerPos, creature:getPosition(), 7, { ignoreNonPathable = true, precision = 1 }) 

                            if path then

                                creature:setMarked('#00FF00')

                                if g_game.getAttackingCreature() ~= creature then

                                  attack(creature)

                                end

                                g_game.setChaseMode(1)

                                resetRetries = true -- reset retries, we are trying to unclog the cavebot

                                delay(100)

                                return "retry"

                            end

                        end

                    end

                end

              end

              if not g_game.getAttackingCreature() then

                reset()

                warn("[Rush Lure] No path, no blocking monster, skipping.")

                return false -- no other way

              end

            end

            -- reaching position, delay targetbot in process

            if not CaveBot.MatchPosition(pos, 0) then

                TargetBot.delay(300)

                CaveBot.walkTo(pos, 30, { ignoreCreatures = false, ignoreFields = true, ignoreNonPathable = true, precision = 0})

                delay(100)

                resetRetries = true

                return "retry"

            end

            TargetBot.setOn()

            reset(delayTime)

            return true

        end

)

    CaveBot.Editor.registerAction(

        "rushlure",

        "rush lure",

{

            value = function()

                return posx() .. "," .. posy() .. "," .. posz() .. ",1000"

            end,

            title = "Stand Lure",

            description = "Run to position(x,y,z), delay(ms), targetbot on/off (yes/no)",

            multiline = false,

            validation = [[\d{1,5},\d{1,5},\d{1,2},\d{1,5}(?:,(yes|no)$|$)]]

}

)

end

local next = false

schedule(5, function() -- delay because cavebot.lua is loaded after this file

    modules.game_bot.connect(CaveBotList(), {

        onChildFocusChange = function(widget, newChild, oldChild)

        if oldChild and oldChild.action == "rushlure" then

            next = true

            return

        end

        if next then

            if enable then

                TargetBot.setOn()

            elseif enable == false then

                TargetBot.setOff()

            end

            enable = nil -- reset

            next = false

        end

    end})

end)

```

---
# supply_check.lua

```lua

CaveBot.Extensions.SupplyCheck = {}

local supplyRetries = 0

local missedChecks = 0

local rawRound = 0

local time = now

vBot.CaveBotData =

  vBot.CaveBotData or

{

    refills = 0,

    rounds = 0,

    time = {},

    lastRefill = os.time(),

    refillTime = {}

}

local function setCaveBotData(hunting)

  if hunting then

    supplyRetries = supplyRetries + 1

  else

    supplyRetries = 0

    table.insert(vBot.CaveBotData.refillTime, os.difftime(os.time() - vBot.CaveBotData.lastRefill))

    vBot.CaveBotData.lastRefill = os.time()

    vBot.CaveBotData.refills = vBot.CaveBotData.refills + 1

  end

  table.insert(vBot.CaveBotData.time, rawRound)

  vBot.CaveBotData.rounds = vBot.CaveBotData.rounds + 1

  missedChecks = 0

end

CaveBot.Extensions.SupplyCheck.setup = function()

  CaveBot.registerAction(

    "supplyCheck",

    "#db5a5a",

    function(value)

      local data = string.split(value, ",")

      local round = 0

      rawRound = 0

      local label = data[1]:trim()

      local pos = nil

      if #data == 4 then

        pos = {x = tonumber(data[2]), y = tonumber(data[3]), z = tonumber(data[4])}

      end

      if pos then

        if missedChecks >= 4 then

          missedChecks = 0

          supplyRetries = 0

          print("CaveBot[SupplyCheck]: Missed 5 supply checks, proceeding with waypoints")

          return true

        end

        if getDistanceBetween(player:getPosition(), pos) > 10 then

          missedChecks = missedChecks + 1

          print("CaveBot[SupplyCheck]: Missed supply check! " .. 5 - missedChecks .. " tries left before skipping.")

          return CaveBot.gotoLabel(label)

        end

      end

      if time then

        rawRound = math.ceil((now - time) / 1000)

        round = rawRound .. "s"

      else

        round = ""

      end

      time = now

      local softCount = itemAmount(6529) + itemAmount(3549)

      local supplyData = Supplies.hasEnough()

      local supplyInfo = Supplies.getAdditionalData()

      if storage.caveBot.forceRefill then

        print("CaveBot[SupplyCheck]: User forced, going back on refill. Last round took: " .. round)

        storage.caveBot.forceRefill = false

        supplyRetries = 0

        missedChecks = 0

        return false

      elseif storage.caveBot.backStop then

        print("CaveBot[SupplyCheck]: User forced, going back to city and turning off CaveBot. Last round took: " .. round)

        supplyRetries = 0

        missedChecks = 0

        return false

      elseif storage.caveBot.backTrainers then

        print("CaveBot[SupplyCheck]: User forced, going back to city, then on trainers. Last round took: " .. round)

        supplyRetries = 0

        missedChecks = 0

        return false

      elseif storage.caveBot.backOffline then

        print("CaveBot[SupplyCheck]: User forced, going back to city, then on offline training. Last round took: " .. round)

        supplyRetries = 0

        missedChecks = 0

        return false

      elseif supplyRetries > (storage.extras.huntRoutes or 50) then

        print("CaveBot[SupplyCheck]: Round limit reached, going back on refill. Last round took: " .. round)

        setCaveBotData()

        return false

      elseif (supplyInfo.imbues.enabled and player:getSkillLevel(11) == 0) then

        print("CaveBot[SupplyCheck]: Imbues ran out. Going on refill. Last round took: " .. round)

        setCaveBotData()

        return false

      elseif (supplyInfo.stamina.enabled and stamina() < tonumber(supplyInfo.stamina.value)) then

        print("CaveBot[SupplyCheck]: Stamina ran out. Going on refill. Last round took: " .. round)

        setCaveBotData()

        return false

      elseif (supplyInfo.softBoots.enabled and softCount < 1) then

        print("CaveBot[SupplyCheck]: No soft boots left. Going on refill. Last round took: " .. round)

        setCaveBotData()

        return false

      elseif type(supplyData) == "table" then

        print("CaveBot[SupplyCheck]: Not enough item: " .. supplyData.id .. "(only " .. supplyData.amount .. " left). Going on refill. Last round took: " .. round)

        setCaveBotData()

        return false

      elseif (supplyInfo.capacity.enabled and freecap() < tonumber(supplyInfo.capacity.value)) then

        print("CaveBot[SupplyCheck]: Not enough capacity. Going on refill. Last round took: " .. round)

        setCaveBotData()

        return false

      else

        print("CaveBot[SupplyCheck]: Enough supplies. Hunting. Round (" .. supplyRetries .. "/" .. (storage.extras.huntRoutes or 50) .. "). Last round took: " .. round)

        setCaveBotData(true)

        return CaveBot.gotoLabel(label)

      end

    end

)

  CaveBot.Editor.registerAction(

    "supplycheck",

    "supply check",

{

      value = function()

        return "startHunt," .. posx() .. "," .. posy() .. "," .. posz()

      end,

      title = "Supply check label",

      description = "Insert here hunting start label",

      validation = [[[^,]+,\d{1,5},\d{1,5},\d{1,2}$]]

}

)

end

```

---
# tasker.lua

```lua

CaveBot.Extensions.Tasker = {}

local dataValidationFailed = function()

    print("CaveBot[Tasker]: data validation failed! incorrect data, check cavebot/tasker for more info")

    return false

end

-- miniconfig

local talkDelay = storage.extras.talkDelay

if not storage.caveBotTasker then

    storage.caveBotTasker = {

        inProgress = false,

        monster = "",

        taskName = "",

        count = 0,

        max = 0

}

end

local resetTaskData = function()

    storage.caveBotTasker.inProgress = false

    storage.caveBotTasker.monster = ""

    storage.caveBotTasker.monster2 = ""

    storage.caveBotTasker.taskName = ""

    storage.caveBotTasker.count = 0

    storage.caveBotTasker.max = 0

end

CaveBot.Extensions.Tasker.setup = function()

  CaveBot.registerAction("Tasker", "#FF0090", function(value, retries)

    local taskName = ""

    local monster = ""

    local monster2 = ""

    local count = 0

    local label1 = ""

    local label2 = ""

    local task

    local data = string.split(value, ",")

    if not data or #data < 1 then

        dataValidationFailed()

    end

    local marker = tonumber(data[1])

    if not marker then

        dataValidationFailed()

        resetTaskData()

    elseif marker == 1 then

        if getNpcs(3) == 0 then

            print("CaveBot[Tasker]: no NPC found in range! skipping")

            return false

        end

        if #data ~= 4 and #data ~= 5 then

            dataValidationFailed()

            resetTaskData()

        else

            taskName = data[2]:lower():trim()

            count = tonumber(data[3]:trim())

            monster = data[4]:lower():trim()

            if #data == 5 then

                monster2 = data[5]:lower():trim()

            end

        end

    elseif marker == 2 then

        if #data ~= 3 then

            dataValidationFailed()

        else

            label1 = data[2]:lower():trim()

            label2 = data[3]:lower():trim()

        end

    elseif marker == 3 then

        if getNpcs(3) == 0 then

            print("CaveBot[Tasker]: no NPC found in range! skipping")

            return false

        end

        if #data ~= 1 then

            dataValidationFailed()

        end

    end

    -- let's cover markers now

    if marker == 1 then -- starting task

        CaveBot.Conversation("hi", "task", taskName, "yes")

        delay(talkDelay*4)

        storage.caveBotTasker.monster = monster

        if monster2 then storage.caveBotTasker.monster2 = monster2 end

        storage.caveBotTasker.taskName = taskName

        storage.caveBotTasker.inProgress = true

        storage.caveBotTasker.max = count

        storage.caveBotTasker.count = 0

        print("CaveBot[Tasker]: taken task for: " .. monster .. " x" .. count)

        return true

    elseif marker == 2 then -- only checking

        if not storage.caveBotTasker.inProgress then

            CaveBot.gotoLabel(label2)

            print("CaveBot[Tasker]: there is no task in progress so going to take one.")

            return true

        end

        local max = storage.caveBotTasker.max

        local count = storage.caveBotTasker.count

        if count >= max then

            CaveBot.gotoLabel(label2)

            print("CaveBot[Tasker]: task completed: " .. storage.caveBotTasker.taskName)

            return true

        else

            CaveBot.gotoLabel(label1)

            print("CaveBot[Tasker]: task in progress, left: " .. max - count .. " " .. storage.caveBotTasker.taskName)

            return true

        end

    elseif marker == 3 then -- reporting task

        CaveBot.Conversation("hi", "report", "task")

        delay(talkDelay*3)

        resetTaskData()

        print("CaveBot[Tasker]: task reported, done")

        return true

    end

  end)

 CaveBot.Editor.registerAction("tasker", "tasker", {

  value=[[     There is 3 scenarios for this extension, as example we will use medusa:

  1. start task,

      parameters:

      - scenario for extension: 1

      - task name in gryzzly adams: medusae

      - monster count: 500

      - monster name to track: medusa

      - optional, monster name 2: 

  2. check status, 

      to be used on refill to decide whether to go back or spawn or go give task back

      parameters:

      - scenario for extension: 2

      - label if task in progress: skipTask

      - label if task done: taskDone  

  3. report task,

      parameters:

      - scenario for extension: 3

  Strong suggestion, almost mandatory - USE POS CHECK to verify position! this module will only check if there is ANY npc in range!

  when begin remove all the text and leave just a single string of parameters

  some examples:

  2, skipReport, goReport

3

  1, drakens, 500, draken warmaster, draken spellweaver

  1, medusae, 500, medusa]],

  title="Tasker",

  multiline = true

})

end

local regex = "Loot of ([a-z])* ([a-z A-Z]*):"

local regex2 = "Loot of ([a-z A-Z]*):"

onTextMessage(function(mode, text)

   -- if CaveBot.isOff() then return end

    if not text:lower():find("loot of") then return end

    if #regexMatch(text, regex) == 1 and #regexMatch(text, regex)[1] == 3 then

        monster = regexMatch(text, regex)[1][3]

    elseif #regexMatch(text, regex2) == 1 and #regexMatch(text, regex2)[1] == 2 then

        monster = regexMatch(text, regex2)[1][2]

    end

    local m1 = storage.caveBotTasker.monster

    local m2 = storage.caveBotTasker.monster2

    if monster == m1 or monster == m2 and storage.caveBotTasker.count then

        storage.caveBotTasker.count = storage.caveBotTasker.count + 1

    end

end)

```

---
# travel.lua

```lua

CaveBot.Extensions.Travel = {}

CaveBot.Extensions.Travel.setup = function()

  CaveBot.registerAction("Travel", "#db5a5a", function(value, retries)

   local data = string.split(value, ",")

    if #data < 2 then

     warn("CaveBot[Travel]: incorrect travel value!")

     return false

    end

    local npcName = data[1]:trim()

    local dest = data[2]:trim()

    if retries > 5 then

      print("CaveBot[Travel]: too many tries, can't travel")

     return false

    end

    local npc = getCreatureByName(npcName)

    if not npc then 

      print("CaveBot[Travel]: NPC not found, can't travel")

     return false 

    end

    if not CaveBot.ReachNPC(npcName) then

      return "retry"

    end

    CaveBot.Travel(dest)

    delay(storage.extras.talkDelay*3)

    print("CaveBot[Travel]: travel action finished")

    return true

  end)

 CaveBot.Editor.registerAction("travel", "travel", {

  value="NPC name, city",

  title="Travel",

  description="NPC name, City name, delay in ms(default is 200ms)",

})

end

```

---
# walking.lua

```lua

-- walking

local expectedDirs = {}

local isWalking = {}

local walkPath = {}

local walkPathIter = 0

CaveBot.resetWalking = function()

  expectedDirs = {}

  walkPath = {}

  isWalking = false

end

CaveBot.doWalking = function()

  if CaveBot.Config.get("mapClick") then

    return false

  end

  if #expectedDirs == 0 then

    return false

  end

  if #expectedDirs >= 3 then

    CaveBot.resetWalking()

  end

  local dir = walkPath[walkPathIter]

  if dir then

    g_game.walk(dir, false)

    table.insert(expectedDirs, dir)

    walkPathIter = walkPathIter + 1

    CaveBot.delay(CaveBot.Config.get("walkDelay") + player:getStepDuration(false, dir))

    return true

  end

  return false  

end

-- called when player position has been changed (step has been confirmed by server)

onPlayerPositionChange(function(newPos, oldPos)

  if not oldPos or not newPos then return end

  local dirs = {{NorthWest, North, NorthEast}, {West, 8, East}, {SouthWest, South, SouthEast}}

  local dir = dirs[newPos.y - oldPos.y + 2]

  if dir then

    dir = dir[newPos.x - oldPos.x + 2]

  end

  if not dir then

    dir = 8 -- 8 is invalid dir, it's fine

  end

  if not isWalking or not expectedDirs[1] then

    -- some other walk action is taking place (for example use on ladder), wait

    walkPath = {}

    CaveBot.delay(CaveBot.Config.get("ping") + player:getStepDuration(false, dir) + 150)

    return

  end

  if expectedDirs[1] ~= dir then

    if CaveBot.Config.get("mapClick") then

      CaveBot.delay(CaveBot.Config.get("walkDelay") + player:getStepDuration(false, dir))

    else

      CaveBot.delay(CaveBot.Config.get("mapClickDelay") + player:getStepDuration(false, dir))

    end

    return

  end

  table.remove(expectedDirs, 1)  

  if CaveBot.Config.get("mapClick") and #expectedDirs > 0 then

    CaveBot.delay(CaveBot.Config.get("mapClickDelay") + player:getStepDuration(false, dir))

  end

end)

CaveBot.walkTo = function(dest, maxDist, params)

  local path = getPath(player:getPosition(), dest, maxDist, params)

  if not path or not path[1] then

    return false

  end

  local dir = path[1]

  if CaveBot.Config.get("mapClick") then

    local ret = autoWalk(path)

    if ret then

      isWalking = true

      expectedDirs = path

      CaveBot.delay(CaveBot.Config.get("mapClickDelay") + math.max(CaveBot.Config.get("ping") + player:getStepDuration(false, dir), player:getStepDuration(false, dir) * 2))

    end

    return ret

  end

  g_game.walk(dir, false)

  isWalking = true    

  walkPath = path

  walkPathIter = 2

  expectedDirs = { dir }

  CaveBot.delay(CaveBot.Config.get("walkDelay") + player:getStepDuration(false, dir))

  return true

end

```

---
# withdraw.lua

```lua

CaveBot.Extensions.Withdraw = {}

CaveBot.Extensions.Withdraw.setup = function()

	CaveBot.registerAction("withdraw", "#002FFF", function(value, retries)

		-- validation

		local data = string.split(value, ",")

		if #data ~= 3 then

			print("CaveBot[Withdraw]: incorrect data! skipping")

			return false

		end

		-- variables declaration

		local source = tonumber(data[1])

		local id = tonumber(data[2])

		local amount = tonumber(data[3])

		-- validation for correct values

		if not id or not amount then

			print("CaveBot[Withdraw]: incorrect id or amount! skipping") 

			return false

		end

		-- check for retries

		if retries > 100 then

			print("CaveBot[Withdraw]: actions limit reached, proceeding")

			for i, container in ipairs(getContainers()) do

				if container:getName():lower():find("depot") or container:getName():lower():find("locker") then

					g_game.close(container)

				end

			end

			return true

		end

		-- check for items

		if itemAmount(id) >= amount then

			print("CaveBot[Withdraw]: enough items, proceeding")

			for i, container in ipairs(getContainers()) do

				if container:getName():lower():find("depot") or container:getName():lower():find("locker") then

					g_game.close(container)

				end

			end

			return true

		end

		statusMessage("[Withdraw] withdrawing item: " ..id.. " x"..amount)

		CaveBot.WithdrawItem(id, amount, source)

		CaveBot.PingDelay()

		return "retry"

  	end)

 CaveBot.Editor.registerAction("withdraw", "withdraw", {

  value="source,id,amount",

  title="Withdraw Items",

  description="index/inbox, item id and amount",

})

end

```

---

# ¦ Modul: `game_bot/default_configs/vBot_4.8/targetbot`

```lua

TargetBot.Creature = {}

TargetBot.Creature.configsCache = {}

TargetBot.Creature.cached = 0

TargetBot.Creature.resetConfigs = function()

  TargetBot.targetList:destroyChildren()

  TargetBot.Creature.resetConfigsCache()

end

TargetBot.Creature.resetConfigsCache = function()

  TargetBot.Creature.configsCache = {}

  TargetBot.Creature.cached = 0

end

TargetBot.Creature.addConfig = function(config, focus)

  if type(config) ~= 'table' or type(config.name) ~= 'string' then

    return error("Invalid targetbot creature config (missing name)")

  end

  TargetBot.Creature.resetConfigsCache()

  if not config.regex then

    config.regex = ""

    for part in string.gmatch(config.name, "[^,]+") do

      if config.regex:len() > 0 then

        config.regex = config.regex .. "|"

      end

      config.regex = config.regex .. "^" .. part:trim():lower():gsub("%*", ".*"):gsub("%?", ".?") .. "$"

    end

  end

  local widget = UI.createWidget("TargetBotEntry", TargetBot.targetList)

  widget:setText(config.name)

  widget.value = config

  widget.onDoubleClick = function(entry) -- edit on double click

    schedule(20, function() -- schedule to have correct focus

      TargetBot.Creature.edit(entry.value, function(newConfig)

        entry:setText(newConfig.name)

        entry.value = newConfig

        TargetBot.Creature.resetConfigsCache()

        TargetBot.save()

      end)

    end)

  end

  if focus then

    widget:focus()

    TargetBot.targetList:ensureChildVisible(widget)

  end

  return widget

end

TargetBot.Creature.getConfigs = function(creature)

  if not creature then return {} end

  local name = creature:getName():trim():lower()

  -- this function may be slow, so it will be using cache

  if TargetBot.Creature.configsCache[name] then

    return TargetBot.Creature.configsCache[name]

  end

  local configs = {}

  for _, config in ipairs(TargetBot.targetList:getChildren()) do

    if regexMatch(name, config.value.regex)[1] then

      table.insert(configs, config.value)

    end

  end

  if TargetBot.Creature.cached > 1000 then 

    TargetBot.Creature.resetConfigsCache() -- too big cache size, reset

  end

  TargetBot.Creature.configsCache[name] = configs -- add to cache

  TargetBot.Creature.cached = TargetBot.Creature.cached + 1

  return configs

end

TargetBot.Creature.calculateParams = function(creature, path)

  local configs = TargetBot.Creature.getConfigs(creature)

  local priority = 0

  local danger = 0

  local selectedConfig = nil

  for _, config in ipairs(configs) do

    local config_priority = TargetBot.Creature.calculatePriority(creature, config, path)

    if config_priority > priority then

      priority = config_priority

      danger = TargetBot.Creature.calculateDanger(creature, config, path)

      selectedConfig = config

    end

  end

  return {

    config = selectedConfig,

    creature = creature,

    danger = danger,

    priority = priority

}

end

TargetBot.Creature.calculateDanger = function(creature, config, path)

  -- config is based on creature_editor

  return config.danger

end

```

---
# creature_attack.lua

```lua

local targetBotLure = false

local targetCount = 0 

local delayValue = 0

local lureMax = 0

local anchorPosition = nil

local lastCall = now

local delayFrom = nil

local dynamicLureDelay = false

function getWalkableTilesCount(position)

  local count = 0

  for i, tile in pairs(getNearTiles(position)) do

      if tile:isWalkable() or tile:hasCreature() then

          count = count + 1

      end

  end

  return count

end

function rePosition(minTiles)

  minTiles = minTiles or 8

  if now - lastCall < 500 then return end

  local pPos = player:getPosition()

  local tiles = getNearTiles(pPos)

  local playerTilesCount = getWalkableTilesCount(pPos)

  local tilesTable = {}

  if playerTilesCount > minTiles then return end

  for i, tile in ipairs(tiles) do

      tilesTable[tile] = not tile:hasCreature() and tile:isWalkable() and getWalkableTilesCount(tile:getPosition()) or nil

  end

  local best = 0

  local target = nil

  for k,v in pairs(tilesTable) do

      if v > best and v > playerTilesCount then

          best = v

          target = k:getPosition()

      end

  end

  if target then

      lastCall = now

      return CaveBot.GoTo(target, 0)

  end

end

TargetBot.Creature.attack = function(params, targets, isLooting) -- params {config, creature, danger, priority}

  if player:isWalking() then

    lastWalk = now

  end

  local config = params.config

  local creature = params.creature

  if g_game.getAttackingCreature() ~= creature then

    g_game.attack(creature)

  end

  if not isLooting then -- walk only when not looting

    TargetBot.Creature.walk(creature, config, targets)

  end

  -- attacks

  local mana = player:getMana()

  if config.useGroupAttack and config.groupAttackSpell:len() > 1 and mana > config.minManaGroup then

    local creatures = g_map.getSpectatorsInRange(player:getPosition(), false, config.groupAttackRadius, config.groupAttackRadius)

    local playersAround = false

    local monsters = 0

    for _, creature in ipairs(creatures) do

      if not creature:isLocalPlayer() and creature:isPlayer() and (not config.groupAttackIgnoreParty or creature:getShield() <= 2) then

        playersAround = true

      elseif creature:isMonster() then

        monsters = monsters + 1

      end

    end

    if monsters >= config.groupAttackTargets and (not playersAround or config.groupAttackIgnorePlayers) then

      if TargetBot.sayAttackSpell(config.groupAttackSpell, config.groupAttackDelay) then

        return

      end

    end

  end

  if config.useGroupAttackRune and config.groupAttackRune > 100 then

    local creatures = g_map.getSpectatorsInRange(creature:getPosition(), false, config.groupRuneAttackRadius, config.groupRuneAttackRadius)

    local playersAround = false

    local monsters = 0

    for _, creature in ipairs(creatures) do

      if not creature:isLocalPlayer() and creature:isPlayer() and (not config.groupAttackIgnoreParty or creature:getShield() <= 2) then

        playersAround = true

      elseif creature:isMonster() then

        monsters = monsters + 1

      end

    end

    if monsters >= config.groupRuneAttackTargets and (not playersAround or config.groupAttackIgnorePlayers) then

      if TargetBot.useAttackItem(config.groupAttackRune, 0, creature, config.groupRuneAttackDelay) then

        return

      end

    end

  end

  if config.useSpellAttack and config.attackSpell:len() > 1 and mana > config.minMana then

    if TargetBot.sayAttackSpell(config.attackSpell, config.attackSpellDelay) then

      return

    end

  end

  if config.useRuneAttack and config.attackRune > 100 then

    if TargetBot.useAttackItem(config.attackRune, 0, creature, config.attackRuneDelay) then

      return

    end

  end

end

TargetBot.Creature.walk = function(creature, config, targets)

  local cpos = creature:getPosition()

  local pos = player:getPosition()

  local isTrapped = true

  local pos = player:getPosition()

  local dirs = {{-1,1}, {0,1}, {1,1}, {-1, 0}, {1, 0}, {-1, -1}, {0, -1}, {1, -1}}

  for i=1,#dirs do

    local tile = g_map.getTile({x=pos.x-dirs[i][1],y=pos.y-dirs[i][2],z=pos.z})

    if tile and tile:isWalkable(false) then

      isTrapped = false

    end

  end

  -- data for external dynamic lure

  if config.lureMin and config.lureMax and config.dynamicLure then

    if config.lureMin >= targets then

      targetBotLure = true

    elseif targets >= config.lureMax then

      targetBotLure = false

    end

  end

  targetCount = targets

  delayValue = config.lureDelay

  if config.lureMax then

    lureMax = config.lureMax

  end

  dynamicLureDelay = config.dynamicLureDelay

  delayFrom = config.delayFrom

  -- luring

  if config.closeLure and config.closeLureAmount <= getMonsters(1) then

    return TargetBot.allowCaveBot(150)

  end

  if TargetBot.canLure() and (config.lure or config.lureCavebot or config.dynamicLure) and not (creature:getHealthPercent() < (storage.extras.killUnder or 30)) and not isTrapped then

    if targetBotLure then

      anchorPosition = nil

      return TargetBot.allowCaveBot(150)

    else

      if targets < config.lureCount then

        if config.lureCavebot then

          anchorPosition = nil

          return TargetBot.allowCaveBot(150)

        else

          local path = findPath(pos, cpos, 5, {ignoreNonPathable=true, precision=2})

          if path then

            return TargetBot.walkTo(cpos, 10, {marginMin=5, marginMax=6, ignoreNonPathable=true})

          end

        end

      end

    end

  end

  local currentDistance = findPath(pos, cpos, 10, {ignoreCreatures=true, ignoreNonPathable=true, ignoreCost=true})

  if (not config.chase or #currentDistance == 1) and not config.avoidAttacks and not config.keepDistance and config.rePosition and (creature:getHealthPercent() >= storage.extras.killUnder) then

    return rePosition(config.rePositionAmount or 6)

  end

  if ((storage.extras.killUnder > 1 and (creature:getHealthPercent() < storage.extras.killUnder)) or config.chase) and not config.keepDistance then

    if #currentDistance > 1 then

      return TargetBot.walkTo(cpos, 10, {ignoreNonPathable=true, precision=1})

    end

  elseif config.keepDistance then

    if not anchorPosition or distanceFromPlayer(anchorPosition) > config.anchorRange then

      anchorPosition = pos

    end

    if #currentDistance ~= config.keepDistanceRange and #currentDistance ~= config.keepDistanceRange + 1 then

      if config.anchor and anchorPosition and getDistanceBetween(pos, anchorPosition) <= config.anchorRange*2 then

        return TargetBot.walkTo(cpos, 10, {ignoreNonPathable=true, marginMin=config.keepDistanceRange, marginMax=config.keepDistanceRange + 1, maxDistanceFrom={anchorPosition, config.anchorRange}})

      else

        return TargetBot.walkTo(cpos, 10, {ignoreNonPathable=true, marginMin=config.keepDistanceRange, marginMax=config.keepDistanceRange + 1})

      end

    end

  end

  --target only movement

  if config.avoidAttacks then

    local diffx = cpos.x - pos.x

    local diffy = cpos.y - pos.y

    local candidates = {}

    if math.abs(diffx) == 1 and diffy == 0 then

      candidates = {{x=pos.x, y=pos.y-1, z=pos.z}, {x=pos.x, y=pos.y+1, z=pos.z}}

    elseif diffx == 0 and math.abs(diffy) == 1 then

      candidates = {{x=pos.x-1, y=pos.y, z=pos.z}, {x=pos.x+1, y=pos.y, z=pos.z}}

    end

    for _, candidate in ipairs(candidates) do

      local tile = g_map.getTile(candidate)

      if tile and tile:isWalkable() then

        return TargetBot.walkTo(candidate, 2, {ignoreNonPathable=true})

      end

    end

  elseif config.faceMonster then

    local diffx = cpos.x - pos.x

    local diffy = cpos.y - pos.y

    local candidates = {}

    if diffx == 1 and diffy == 1 then

      candidates = {{x=pos.x+1, y=pos.y, z=pos.z}, {x=pos.x, y=pos.y-1, z=pos.z}}

    elseif diffx == -1 and diffy == 1 then

      candidates = {{x=pos.x-1, y=pos.y, z=pos.z}, {x=pos.x, y=pos.y-1, z=pos.z}}

    elseif diffx == -1 and diffy == -1 then

      candidates = {{x=pos.x, y=pos.y-1, z=pos.z}, {x=pos.x-1, y=pos.y, z=pos.z}} 

    elseif diffx == 1 and diffy == -1 then

      candidates = {{x=pos.x, y=pos.y-1, z=pos.z}, {x=pos.x+1, y=pos.y, z=pos.z}}       

    else

      local dir = player:getDirection()

      if diffx == 1 and dir ~= 1 then turn(1)

      elseif diffx == -1 and dir ~= 3 then turn(3)

      elseif diffy == 1 and dir ~= 2 then turn(2)

      elseif diffy == -1 and dir ~= 0 then turn(0)

      end

    end

    for _, candidate in ipairs(candidates) do

      local tile = g_map.getTile(candidate)

      if tile and tile:isWalkable() then

        return TargetBot.walkTo(candidate, 2, {ignoreNonPathable=true})

      end

    end

  end

end

onPlayerPositionChange(function(newPos, oldPos)

  if CaveBot.isOff() then return end

  if TargetBot.isOff() then return end

  if not lureMax then return end

  if storage.TargetBotDelayWhenPlayer then return end

  if not dynamicLureDelay then return end

  if targetCount < (delayFrom or lureMax/2) or not target() then return end

  CaveBot.delay(delayValue or 0)

end)

```

---
# creature_editor.lua

```lua

TargetBot.Creature.edit = function(config, callback) -- callback = function(newConfig)

  config = config or {}

  local editor = UI.createWindow('TargetBotCreatureEditorWindow')

  local values = {} -- (key, function returning value of key)

  editor.name:setText(config.name or "")

  table.insert(values, {"name", function() return editor.name:getText() end})

  local addScrollBar = function(id, title, min, max, defaultValue)

    local widget = UI.createWidget('TargetBotCreatureEditorScrollBar', editor.content.left)

    widget.scroll.onValueChange = function(scroll, value)

      widget.text:setText(title .. ": " .. value)

    end

    widget.scroll:setRange(min, max)

    if max-min > 1000 then

      widget.scroll:setStep(100)

    elseif max-min > 100 then

      widget.scroll:setStep(10)

    end

    widget.scroll:setValue(config[id] or defaultValue)

    widget.scroll.onValueChange(widget.scroll, widget.scroll:getValue())

    table.insert(values, {id, function() return widget.scroll:getValue() end})

  end

  local addTextEdit = function(id, title, defaultValue)

    local widget = UI.createWidget('TargetBotCreatureEditorTextEdit', editor.content.right)

    widget.text:setText(title)

    widget.textEdit:setText(config[id] or defaultValue or "")

    table.insert(values, {id, function() return widget.textEdit:getText() end})

  end

  local addCheckBox = function(id, title, defaultValue)

    local widget = UI.createWidget('TargetBotCreatureEditorCheckBox', editor.content.right)

    widget.onClick = function()

      widget:setOn(not widget:isOn())

    end

    widget:setText(title)

    if config[id] == nil then

      widget:setOn(defaultValue)

    else

      widget:setOn(config[id])

    end

    table.insert(values, {id, function() return widget:isOn() end})

  end

  local addItem = function(id, title, defaultItem)

    local widget = UI.createWidget('TargetBotCreatureEditorItem', editor.content.right)

    widget.text:setText(title)

    widget.item:setItemId(config[id] or defaultItem)

    table.insert(values, {id, function() return widget.item:getItemId() end})

  end

  editor.cancel.onClick = function()

    editor:destroy()

  end

  editor.onEscape = editor.cancel.onClick

  editor.ok.onClick = function()

    local newConfig = {}

    for _, value in ipairs(values) do

      newConfig[value[1]] = value[2]()

    end

    if newConfig.name:len() < 1 then return end

    newConfig.regex = ""

    for part in string.gmatch(newConfig.name, "[^,]+") do

      if newConfig.regex:len() > 0 then

        newConfig.regex = newConfig.regex .. "|"

      end

      newConfig.regex = newConfig.regex .. "^" .. part:trim():lower():gsub("%*", ".*"):gsub("%?", ".?") .. "$"    

    end

    editor:destroy()

    callback(newConfig)

  end

  -- values

  addScrollBar("priority", "Priority", 0, 10, 1)

  addScrollBar("danger", "Danger", 0, 10, 1)

  addScrollBar("maxDistance", "Max distance", 1, 10, 10)

  addScrollBar("keepDistanceRange", "Keep distance", 1, 5, 1)

  addScrollBar("anchorRange", "Anchoring Range", 1, 10, 3)

  addScrollBar("lureCount", "Classic Lure", 0, 5, 1)

  addScrollBar("lureMin", "Dynamic lure min", 0, 29, 1)

  addScrollBar("lureMax", "Dynamic lure max", 1, 30, 3)

  addScrollBar("lureDelay", "Dynamic lure delay", 100, 1000, 250)

  addScrollBar("delayFrom", "Start delay when monsters", 1, 29, 2)

  addScrollBar("rePositionAmount", "Min tiles to rePosition", 0, 7, 5)

  addScrollBar("closeLureAmount", "Close Pull Until", 0, 8, 3)

  addCheckBox("chase", "Chase", true)

  addCheckBox("keepDistance", "Keep Distance", false)

  addCheckBox("anchor", "Anchoring", false)

  addCheckBox("dontLoot", "Don't loot", false)

  addCheckBox("lure", "Lure", false)

  addCheckBox("lureCavebot", "Lure using cavebot", false)

  addCheckBox("faceMonster", "Face monsters", false)

  addCheckBox("avoidAttacks", "Avoid wave attacks", false)

  addCheckBox("dynamicLure", "Dynamic lure", false)

  addCheckBox("dynamicLureDelay", "Dynamic lure delay", false)

  addCheckBox("diamondArrows", "D-Arrows priority", false)

  addCheckBox("rePosition", "rePosition to better tile", false)

  addCheckBox("closeLure", "Close Pulling Monsters", false)

  addCheckBox("rpSafe", "RP PVP SAFE - (DA)", false)

end

```

---
# creature_editor.otui

```otui

TargetBotCreatureEditorScrollBar < Panel

  height: 28

  margin-top: 3

  Label

    id: text

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

  HorizontalScrollBar

    id: scroll

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 3

    minimum: 0

    maximum: 10

    step: 1

TargetBotCreatureEditorTextEdit < Panel

  height: 40

  margin-top: 7

  Label

    id: text

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

  TextEdit

    id: textEdit

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 0

    maximum: 10

    step: 1

TargetBotCreatureEditorItem < Panel

  height: 34

  margin-top: 7

  margin-left: 25

  margin-right: 25

  Label

    id: text

    anchors.left: parent.left

    anchors.verticalCenter: next.verticalCenter

  BotItem

    id: item

    anchors.top: parent.top

    anchors.right: parent.right

TargetBotCreatureEditorCheckBox < BotSwitch

  height: 20

  margin-top: 7

TargetBotCreatureEditorWindow < MainWindow

  text: TargetBot creature editor

  width: 500

  height: 425

  $mobile:

    height: 300

  Label

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

    !text: tr('You can use * (any characters) and ? (any character) in target name')

  Label

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    text-align: center

    !text: tr('You can also enter multiple targets, separate them by ,')

  TextEdit

    id: name

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-left: 90

    margin-top: 5

  Label

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: parent.left

    text: Target name:

  VerticalScrollBar

    id: contentScroll

    anchors.top: name.bottom

    anchors.right: parent.right

    anchors.bottom: help.top

    step: 28

    pixels-scroll: true

    margin-right: -10

    margin-top: 5

    margin-bottom: 5

  ScrollablePanel

    id: content

    anchors.top: name.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: help.top

    vertical-scrollbar: contentScroll

    margin-bottom: 10

    Panel

      id: left

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.horizontalCenter

      margin-top: 5

      margin-left: 10

      margin-right: 10

      layout:

        type: verticalBox

        fit-children: true

    Panel

      id: right

      anchors.top: parent.top

      anchors.left: parent.horizontalCenter

      anchors.right: parent.right

      margin-top: 5

      margin-left: 10

      margin-right: 10

      layout:

        type: verticalBox

        fit-children: true

  Button

    id: help

    !text: tr('Help & Tutorials')

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    width: 150

    @onClick: g_platform.openUrl("http://bot.otclient.ovh/")

  Button

    id: ok

    !text: tr('Ok')

    anchors.bottom: parent.bottom

    anchors.right: next.left

    margin-right: 10

    width: 60

  Button

    id: cancel

    !text: tr('Cancel')

    anchors.bottom: parent.bottom

    anchors.right: parent.right

    width: 60

```

---
# creature_priority.lua

```lua

TargetBot.Creature.calculatePriority = function(creature, config, path)

  -- config is based on creature_editor

  local priority = 0

  local currentTarget = g_game.getAttackingCreature()

  -- extra priority if it's current target

  if currentTarget == creature then

    priority = priority + 1

  end

  -- check if distance is ok

  if #path > config.maxDistance then

    if config.rpSafe then

      if currentTarget == creature then

        g_game.cancelAttackAndFollow()  -- if not, stop attack (pvp safe)

      end

    end

    return priority

  end

  -- add config priority

  priority = priority + config.priority

  -- extra priority for close distance

  local path_length = #path

  if path_length == 1 then

    priority = priority + 10

  elseif path_length <= 3 then

    priority = priority + 5

  end

  -- extra priority for paladin diamond arrows

  if config.diamondArrows then

    local mobCount = getCreaturesInArea(creature:getPosition(), diamondArrowArea, 2)

    priority = priority + (mobCount * 4)

    if config.rpSafe then

      if getCreaturesInArea(creature:getPosition(), largeRuneArea, 3) > 0 then

        if currentTarget == creature then

          g_game.cancelAttackAndFollow()

        end

        return 0 -- pvp safe

      end

    end

  end

  -- extra priority for low health

  if config.chase and creature:getHealthPercent() < 30 then

    priority = priority + 5

  elseif creature:getHealthPercent() < 20 then

    priority = priority + 2.5

  elseif creature:getHealthPercent() < 40 then

    priority = priority + 1.5

  elseif creature:getHealthPercent() < 60 then

    priority = priority + 0.5

  elseif creature:getHealthPercent() < 80 then

    priority = priority + 0.2

  end

  return priority

end

```

---
# looting.lua

```lua

TargetBot.Looting = {}

TargetBot.Looting.list = {} -- list of containers to loot

local ui

local items = {}

local containers = {}

local itemsById = {}

local containersById = {}

local dontSave = false

TargetBot.Looting.setup = function()

  ui = UI.createWidget("TargetBotLootingPanel")

  UI.Container(TargetBot.Looting.onItemsUpdate, true, nil, ui.items)

  UI.Container(TargetBot.Looting.onContainersUpdate, true, nil, ui.containers) 

  ui.everyItem.onClick = function()

    ui.everyItem:setOn(not ui.everyItem:isOn())

    TargetBot.save()

  end

  ui.maxDangerPanel.value.onTextChange = function()

    local value = tonumber(ui.maxDangerPanel.value:getText())

    if not value then

      ui.maxDangerPanel.value:setText(0)

    end

    if dontSave then return end

    TargetBot.save()

  end

  ui.minCapacityPanel.value.onTextChange = function()

    local value = tonumber(ui.minCapacityPanel.value:getText())

    if not value then

      ui.minCapacityPanel.value:setText(0)

    end

    if dontSave then return end

    TargetBot.save()

  end

end

TargetBot.Looting.onItemsUpdate = function()

  if dontSave then return end

  TargetBot.save()

  TargetBot.Looting.updateItemsAndContainers()

end

TargetBot.Looting.onContainersUpdate = function()

  if dontSave then return end

  TargetBot.save()

  TargetBot.Looting.updateItemsAndContainers()

end

TargetBot.Looting.update = function(data)

  dontSave = true

  TargetBot.Looting.list = {}

  ui.items:setItems(data['items'] or {})

  ui.containers:setItems(data['containers'] or {})

  ui.everyItem:setOn(data['everyItem'])

  ui.maxDangerPanel.value:setText(data['maxDanger'] or 10)

  ui.minCapacityPanel.value:setText(data['minCapacity'] or 100)

  TargetBot.Looting.updateItemsAndContainers()

  dontSave = false

  --vBot

  vBot.lootConainers = {}

  vBot.lootItems = {}

  for i, item in ipairs(ui.containers:getItems()) do

    table.insert(vBot.lootConainers, item['id'])

  end

  for i, item in ipairs(ui.items:getItems()) do

    table.insert(vBot.lootItems, item['id'])

  end

end

TargetBot.Looting.save = function(data)

  data['items'] = ui.items:getItems()

  data['containers'] = ui.containers:getItems()

  data['maxDanger'] = tonumber(ui.maxDangerPanel.value:getText())

  data['minCapacity'] = tonumber(ui.minCapacityPanel.value:getText())

  data['everyItem'] = ui.everyItem:isOn()

end

TargetBot.Looting.updateItemsAndContainers = function()

  items = ui.items:getItems()

  containers = ui.containers:getItems()

  itemsById = {}

  containersById = {}

  for i, item in ipairs(items) do

    itemsById[item.id] = 1

  end

  for i, container in ipairs(containers) do

    containersById[container.id] = 1

  end

end

local waitTill = 0

local waitingForContainer = nil

local status = ""

local lastFoodConsumption = 0

TargetBot.Looting.getStatus = function()

  return status

end

TargetBot.Looting.process = function(targets, dangerLevel)

  if (not items[1] and not ui.everyItem:isOn()) or not containers[1] then

    status = ""

    return false

  end

  if dangerLevel > tonumber(ui.maxDangerPanel.value:getText()) then

    status = "High danger"

    return false

  end

  if player:getFreeCapacity() < tonumber(ui.minCapacityPanel.value:getText()) then

    status = "No cap"

    TargetBot.Looting.list = {}

    return false

  end

  local loot = storage.extras.lootLast and TargetBot.Looting.list[#TargetBot.Looting.list] or TargetBot.Looting.list[1]

  if loot == nil then

    status = ""

    return false

  end

  if waitTill > now then

    return true

  end

  local containers = g_game.getContainers()

  local lootContainers = TargetBot.Looting.getLootContainers(containers)

  -- check if there's container for loot and has empty space for it

  if not lootContainers[1] then

    -- there's no space, don't loot

    status = "No space"

    return false

  end

  status = "Looting"

  for index, container in pairs(containers) do

    if container.lootContainer then

      TargetBot.Looting.lootContainer(lootContainers, container)

      return true

    end

  end

  local pos = player:getPosition()

  local dist = math.max(math.abs(pos.x-loot.pos.x), math.abs(pos.y-loot.pos.y))

  local maxRange = storage.extras.looting or 40

  if loot.tries > 30 or loot.pos.z ~= pos.z or dist > maxRange then

    table.remove(TargetBot.Looting.list, storage.extras.lootLast and #TargetBot.Looting.list or 1)

    return true

  end

  local tile = g_map.getTile(loot.pos)

  if dist >= 3 or not tile then

    loot.tries = loot.tries + 1

    TargetBot.walkTo(loot.pos, 20, { ignoreNonPathable = true, precision = 2 })

    return true

  end

  local container = tile:getTopUseThing()

  if not container or not container:isContainer() then

    table.remove(TargetBot.Looting.list, storage.extras.lootLast and #TargetBot.Looting.list or 1)

    return true

  end

  g_game.open(container)

  waitTill = now + (storage.extras.lootDelay or 200)

  waitingForContainer = container:getId()

  return true

end

TargetBot.Looting.getLootContainers = function(containers)

  local lootContainers = {}

  local openedContainersById = {}

  local toOpen = nil

  for index, container in pairs(containers) do

    openedContainersById[container:getContainerItem():getId()] = 1

    if containersById[container:getContainerItem():getId()] and not container.lootContainer then

      if container:getItemsCount() < container:getCapacity() or container:hasPages() then

        table.insert(lootContainers, container)

      else -- it's full, open next container if possible

        for slot, item in ipairs(container:getItems()) do

          if item:isContainer() and containersById[item:getId()] then

            toOpen = {item, container}

            break

          end

        end

      end

    end

  end

  if not lootContainers[1] then

    if toOpen then

      g_game.open(toOpen[1], toOpen[2])

      waitTill = now + 500 -- wait 0.5s

      return lootContainers

    end

    -- check containers one more time, maybe there's any loot container

    for index, container in pairs(containers) do

      if not containersById[container:getContainerItem():getId()] and not container.lootContainer then

        for slot, item in ipairs(container:getItems()) do

          if item:isContainer() and containersById[item:getId()] then

            g_game.open(item)

            waitTill = now + 500 -- wait 0.5s

            return lootContainers

          end

        end

      end

    end

    -- can't find any lootContainer, let's check slots, maybe there's one

    for slot = InventorySlotFirst, InventorySlotLast do

      local item = getInventoryItem(slot)

      if item and item:isContainer() and not openedContainersById[item:getId()] then

        -- container which is not opened yet, let's open it

        g_game.open(item)

        waitTill = now + 500 -- wait 0.5s

        return lootContainers

      end

    end

  end

  return lootContainers

end

TargetBot.Looting.lootContainer = function(lootContainers, container)

  -- loot items

  local nextContainer = nil

  for i, item in ipairs(container:getItems()) do

    if item:isContainer() and not itemsById[item:getId()] then

      nextContainer = item

    elseif itemsById[item:getId()] or (ui.everyItem:isOn() and not item:isContainer()) then

      item.lootTries = (item.lootTries or 0) + 1

      if item.lootTries < 5 then -- if can't be looted within 0.5s then skip it

        return TargetBot.Looting.lootItem(lootContainers, item)

      end

    elseif storage.foodItems and storage.foodItems[1] and lastFoodConsumption + 5000 < now then

      for _, food in ipairs(storage.foodItems) do

        if item:getId() == food.id then

          g_game.use(item)

          lastFoodConsumption = now

          return

        end

      end

    end

  end

  -- no more items to loot, open next container

  if nextContainer then

    nextContainer.lootTries = (nextContainer.lootTries or 0) + 1

    if nextContainer.lootTries < 2 then -- max 0.6s to open it

      g_game.open(nextContainer, container)

      waitTill = now + 300 -- give it 0.3s to open

      waitingForContainer = nextContainer:getId()

      return

    end

  end

  -- looting finished, remove container from list

  container.lootContainer = false

  g_game.close(container)

  table.remove(TargetBot.Looting.list, storage.extras.lootLast and #TargetBot.Looting.list or 1) 

end

onTextMessage(function(mode, text)

  if TargetBot.isOff() then return end

  if #TargetBot.Looting.list == 0 then return end

  if string.find(text:lower(), "you are not the owner") then -- if we are not the owners of corpse then its a waste of time to try to loot it

    table.remove(TargetBot.Looting.list, storage.extras.lootLast and #TargetBot.Looting.list or 1)

  end

end)

TargetBot.Looting.lootItem = function(lootContainers, item)

  if item:isStackable() then

    local count = item:getCount()

    for _, container in ipairs(lootContainers) do

      for slot, citem in ipairs(container:getItems()) do

        if item:getId() == citem:getId() and citem:getCount() < 100 then

          g_game.move(item, container:getSlotPosition(slot - 1), count)

          waitTill = now + 300 -- give it 0.3s to move item

          return

        end

      end

    end

  end

  local container = lootContainers[1]

  g_game.move(item, container:getSlotPosition(container:getItemsCount()), 1)

  waitTill = now + 300 -- give it 0.3s to move item

end

onContainerOpen(function(container, previousContainer)

  if container:getContainerItem():getId() == waitingForContainer then

    container.lootContainer = true

    waitingForContainer = nil

  end

end)

onCreatureDisappear(function(creature)

  if isInPz() then return end

  if not TargetBot.isOn() then return end

  if not creature:isMonster() then return end

  local config = TargetBot.Creature.calculateParams(creature, {}) -- return {craeture, config, danger, priority}

  if not config.config or config.config.dontLoot then

    return

  end

  local pos = player:getPosition()

  local mpos = creature:getPosition()

  local name = creature:getName()

  if pos.z ~= mpos.z or math.max(math.abs(pos.x-mpos.x), math.abs(pos.y-mpos.y)) > 6 then return end

  schedule(20, function() -- check in 20ms if there's container (dead body) on that tile

    if not containers[1] then return end

    if TargetBot.Looting.list[20] then return end -- too many items to loot

    local tile = g_map.getTile(mpos)

    if not tile then return end

    local container = tile:getTopUseThing()

    if not container or not container:isContainer() then return end

    if not findPath(player:getPosition(), mpos, 6, {ignoreNonPathable=true, ignoreCreatures=true, ignoreCost=true}) then return end

    table.insert(TargetBot.Looting.list, {pos=mpos, creature=name, container=container:getId(), added=now, tries=0})

    table.sort(TargetBot.Looting.list, function(a,b) 

      a.dist = distanceFromPlayer(a.pos)

      b.dist = distanceFromPlayer(b.pos)

      return a.dist > b.dist

    end)

    container:setMarked('#000088')

  end)

end)

```

---
# looting.otui

```otui

TargetBotLootingPanel < Panel

  layout:

    type: verticalBox

    fit-children: true

  HorizontalSeparator

    margin-top: 5

  Label

    margin-top: 5

    text: Items to loot

    text-align: center    

  BotContainer

    id: items

    margin-top: 3

  BotSwitch

    id: everyItem

    !text: tr("Loot every item")

    margin-top: 2

  Label

    margin-top: 5

    text: Containers for loot

    text-align: center

  BotContainer

    id: containers

    margin-top: 3

    height: 45

  Panel

    id: maxDangerPanel

    height: 20

    margin-top: 5

    BotTextEdit

      id: value

      anchors.right: parent.right

      anchors.top: parent.top

      anchors.bottom: parent.bottom

      margin-right: 6

      width: 80

    Label

      anchors.left: parent.left

      anchors.verticalCenter: prev.verticalCenter

      text: Max. danger:

      margin-left: 5

  Panel

    id: minCapacityPanel

    height: 20

    margin-top: 3

    BotTextEdit

      id: value

      anchors.right: parent.right

      anchors.top: parent.top

      anchors.bottom: parent.bottom

      margin-right: 6

      width: 80

    Label

      anchors.left: parent.left

      anchors.verticalCenter: prev.verticalCenter

      text: Min. capacity:

      margin-left: 5

```

---
# target.lua

```lua

local targetbotMacro = nil

local config = nil

local lastAction = 0

local cavebotAllowance = 0

local lureEnabled = true

local dangerValue = 0

local looterStatus = ""

-- ui

local configWidget = UI.Config()

local ui = UI.createWidget("TargetBotPanel")

ui.list = ui.listPanel.list -- shortcut

TargetBot.targetList = ui.list

TargetBot.Looting.setup()

ui.status.left:setText("Status:")

ui.status.right:setText("Off")

ui.target.left:setText("Target:")

ui.target.right:setText("-")

ui.config.left:setText("Config:")

ui.config.right:setText("-")

ui.danger.left:setText("Danger:")

ui.danger.right:setText("0")

ui.editor.debug.onClick = function()

  local on = ui.editor.debug:isOn()

  ui.editor.debug:setOn(not on)

  if on then

    for _, spec in ipairs(getSpectators()) do

      spec:clearText()

    end

  end

end

local oldTibia = g_game.getClientVersion() < 960

-- main loop, controlled by config

targetbotMacro = macro(100, function()

  local pos = player:getPosition()

  local specs = g_map.getSpectatorsInRange(pos, false, 6, 6) -- 12x12 area

  local creatures = 0

  for i, spec in ipairs(specs) do

    if spec:isMonster() then

      creatures = creatures + 1

    end

  end

  if creatures > 10 then -- if there are too many monsters around, limit area

    creatures = g_map.getSpectatorsInRange(pos, false, 3, 3) -- 6x6 area

  else

    creatures = specs

  end

  local highestPriority = 0

  local dangerLevel = 0

  local targets = 0

  local highestPriorityParams = nil

  for i, creature in ipairs(creatures) do

    local hppc = creature:getHealthPercent()

    if hppc and hppc > 0 then

      local path = findPath(player:getPosition(), creature:getPosition(), 7, {ignoreLastCreature=true, ignoreNonPathable=true, ignoreCost=true, ignoreCreatures=true})

      if creature:isMonster() and (oldTibia or creature:getType() < 3) and path then

        local params = TargetBot.Creature.calculateParams(creature, path) -- return {craeture, config, danger, priority}

        dangerLevel = dangerLevel + params.danger

        if params.priority > 0 then

          targets = targets + 1

          if params.priority > highestPriority then

            highestPriority = params.priority

            highestPriorityParams = params

          end

          if ui.editor.debug:isOn() then

            creature:setText(params.config.name .. "\n" .. params.priority)

          end

        end

      end

    end

  end

  -- reset walking

  TargetBot.walkTo(nil)

  -- looting

  local looting = TargetBot.Looting.process(targets, dangerLevel)

  local lootingStatus = TargetBot.Looting.getStatus()

  looterStatus = TargetBot.Looting.getStatus()

  dangerValue = dangerLevel

  ui.danger.right:setText(dangerLevel)

  if highestPriorityParams and not isInPz() then

    ui.target.right:setText(highestPriorityParams.creature:getName())

    ui.config.right:setText(highestPriorityParams.config.name)

    TargetBot.Creature.attack(highestPriorityParams, targets, looting)    

    if lootingStatus:len() > 0 then

      TargetBot.setStatus("Attack & " .. lootingStatus)

    elseif cavebotAllowance > now then

      TargetBot.setStatus("Luring using CaveBot")

    else

      TargetBot.setStatus("Attacking")

      if not lureEnabled then

        TargetBot.setStatus("Attacking (luring off)")      

      end

    end

    TargetBot.walk()

    lastAction = now

    return

  end

  ui.target.right:setText("-")

  ui.config.right:setText("-")

  if looting then

    TargetBot.walk()

    lastAction = now

  end

  if lootingStatus:len() > 0 then

    TargetBot.setStatus(lootingStatus)

  else

    TargetBot.setStatus("Waiting")

  end

end)

-- config, its callback is called immediately, data can be nil

config = Config.setup("targetbot_configs", configWidget, "json", function(name, enabled, data)

  if not data then

    ui.status.right:setText("Off")

    return targetbotMacro.setOff() 

  end

  TargetBot.Creature.resetConfigs()

  for _, value in ipairs(data["targeting"] or {}) do

    TargetBot.Creature.addConfig(value)

  end

  TargetBot.Looting.update(data["looting"] or {})

  -- add configs

  if enabled then

    ui.status.right:setText("On")

  else

    ui.status.right:setText("Off")

  end

  targetbotMacro.setOn(enabled)

  targetbotMacro.delay = nil

  lureEnabled = true

end)

-- setup ui

ui.editor.buttons.add.onClick = function()

  TargetBot.Creature.edit(nil, function(newConfig)

    TargetBot.Creature.addConfig(newConfig, true)

    TargetBot.save()

  end)

end

ui.editor.buttons.edit.onClick = function()

  local entry = ui.list:getFocusedChild()

  if not entry then return end

  TargetBot.Creature.edit(entry.value, function(newConfig)

    entry:setText(newConfig.name)

    entry.value = newConfig

    TargetBot.Creature.resetConfigsCache()

    TargetBot.save()

  end)

end

ui.editor.buttons.remove.onClick = function()

  local entry = ui.list:getFocusedChild()

  if not entry then return end

  entry:destroy()

  TargetBot.Creature.resetConfigsCache()

  TargetBot.save()

end

-- public function, you can use them in your scripts

TargetBot.isActive = function() -- return true if attacking or looting takes place

  return lastAction + 300 > now

end

TargetBot.isCaveBotActionAllowed = function()

  return cavebotAllowance > now

end

TargetBot.setStatus = function(text)

  return ui.status.right:setText(text)

end

TargetBot.getStatus = function()

  return ui.status.right:getText()

end

TargetBot.isOn = function()

  return config.isOn()

end

TargetBot.isOff = function()

  return config.isOff()

end

TargetBot.setOn = function(val)

  if val == false then  

    return TargetBot.setOff(true)

  end

  config.setOn()

end

TargetBot.setOff = function(val)

  if val == false then  

    return TargetBot.setOn(true)

  end

  config.setOff()

end

TargetBot.getCurrentProfile = function()

  return storage._configs.targetbot_configs.selected

end

local botConfigName = modules.game_bot.contentsPanel.config:getCurrentOption().text

TargetBot.setCurrentProfile = function(name)

  if not g_resources.fileExists("/bot/"..botConfigName.."/targetbot_configs/"..name..".json") then

    return warn("there is no targetbot profile with that name!")

  end

  TargetBot.setOff()

  storage._configs.targetbot_configs.selected = name

  TargetBot.setOn()

end

TargetBot.delay = function(value)

  targetbotMacro.delay = now + value

end

TargetBot.save = function()

  local data = {targeting={}, looting={}}

  for _, entry in ipairs(ui.list:getChildren()) do

    table.insert(data.targeting, entry.value)

  end

  TargetBot.Looting.save(data.looting)

  config.save(data)

end

TargetBot.allowCaveBot = function(time)

  cavebotAllowance = now + time

end

TargetBot.disableLuring = function()

  lureEnabled = false

end

TargetBot.enableLuring = function()

  lureEnabled = true

end

TargetBot.Danger = function()

  return dangerValue

end

TargetBot.lootStatus = function()

  return looterStatus

end

-- attacks

local lastSpell = 0

local lastAttackSpell = 0

TargetBot.saySpell = function(text, delay)

  if type(text) ~= 'string' or text:len() < 1 then return end

  if not delay then delay = 500 end

  if g_game.getProtocolVersion() < 1090 then

    lastAttackSpell = now -- pause attack spells, healing spells are more important

  end

  if lastSpell + delay < now then

    say(text)

    lastSpell = now

    return true

  end

  return false

end

TargetBot.sayAttackSpell = function(text, delay)

  if type(text) ~= 'string' or text:len() < 1 then return end

  if not delay then delay = 2000 end

  if lastAttackSpell + delay < now then

    say(text)

    lastAttackSpell = now

    return true

  end

  return false

end

local lastItemUse = 0

local lastRuneAttack = 0

TargetBot.useItem = function(item, subType, target, delay)

  if not delay then delay = 200 end

  if lastItemUse + delay < now then

    local thing = g_things.getThingType(item)

    if not thing or not thing:isFluidContainer() then

      subType = g_game.getClientVersion() >= 860 and 0 or 1

    end

    if g_game.getClientVersion() < 780 then

      local tmpItem = g_game.findPlayerItem(item, subType)

      if not tmpItem then return end

      g_game.useWith(tmpItem, target, subType) -- using item from bp

    else

      g_game.useInventoryItemWith(item, target, subType) -- hotkey

    end

    lastItemUse = now

  end

end

TargetBot.useAttackItem = function(item, subType, target, delay)

  if not delay then delay = 2000 end

  if lastRuneAttack + delay < now then

    local thing = g_things.getThingType(item)

    if not thing or not thing:isFluidContainer() then

      subType = g_game.getClientVersion() >= 860 and 0 or 1

    end

    if g_game.getClientVersion() < 780 then

      local tmpItem = g_game.findPlayerItem(item, subType)

      if not tmpItem then return end

      g_game.useWith(tmpItem, target, subType) -- using item from bp  

    else

      g_game.useInventoryItemWith(item, target, subType) -- hotkey

    end

    lastRuneAttack = now

  end

end

TargetBot.canLure = function()

  return lureEnabled

end

```

---
# target.otui

```otui

TargetBotEntry < Label

  background-color: alpha

  text-offset: 2 0

  focusable: true

  $focus:

    background-color: #00000055

TargetBotDualLabel < Panel

  height: 18

  margin-left: 3

  margin-right: 4

  Label

    id: left

    anchors.top: parent.top

    anchors.left: parent.left

    text-auto-resize: true

  Label

    id: right

    anchors.top: parent.top

    anchors.right: parent.right

    text-auto-resize: true

TargetBotPanel < Panel

  layout:

    type: verticalBox

    fit-children: true

  HorizontalSeparator

    margin-top: 2

    margin-bottom: 5

  TargetBotDualLabel

    id: status

  TargetBotDualLabel

    id: target

  TargetBotDualLabel

    id: config

  TargetBotDualLabel

    id: danger

  Panel

    id: listPanel

    height: 40

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

    id: configButton

    @onClick: |

      self:setOn(not self:isOn())

      self:getParent().listPanel:setHeight(self:isOn() and 100 or 40)

      self:getParent().editor:setVisible(self:isOn())

    $on:

      text: Hide target editor

    $!on:

      text: Show target editor

  Panel

    id: editor

    visible: false

    layout:

      type: verticalBox

      fit-children: true

    Panel

      id: buttons

      height: 20

      margin-top: 2

      Button

        id: add

        anchors.top: parent.top

        anchors.bottom: parent.bottom

        anchors.left: parent.left

        text: Add

        width: 56

      Button

        id: edit

        anchors.top: parent.top

        anchors.bottom: parent.bottom

        anchors.horizontalCenter: parent.horizontalCenter

        text: Edit

        width: 56

      Button

        id: remove

        anchors.top: parent.top

        anchors.bottom: parent.bottom

        anchors.right: parent.right

        text: Remove

        width: 56

    BotSwitch

      id: debug

      text: Show target priority

```

---
# walking.lua

```lua

local dest

local maxDist

local params

TargetBot.walkTo = function(_dest, _maxDist, _params)

  dest = _dest

  maxDist = _maxDist

  params = _params

end

-- called every 100ms if targeting or looting is active

TargetBot.walk = function()

  if not dest then return end

  if player:isWalking() then return end

  local pos = player:getPosition()

  if pos.z ~= dest.z then return end

  local dist = math.max(math.abs(pos.x-dest.x), math.abs(pos.y-dest.y))

  if params.precision and params.precision >= dist then return end

  if params.marginMin and params.marginMax then

    if dist >= params.marginMin and dist <= params.marginMax then 

      return

    end

  end

  local path = getPath(pos, dest, maxDist, params)

  if path then

    walk(path[1])

  end

end

```

---

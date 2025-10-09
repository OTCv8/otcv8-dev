# Moduł: | Moduł: `game_bot/panels`
```text

DONT USE PANELS

THEY ONLY HERE FOR BACKWARD COMPATIBILITY

MAY BE REMOVED IN THE FUTURE

```

---
# attacking.lua
```lua

local context = G.botContext

local Panels = context.Panels

Panels.MonsterEditor = function(monster, config, callback, parent)

  local otherWindow = g_ui.getRootWidget():getChildById('monsterEditor')

  if otherWindow then

    otherWindow:destory()

  end

  local window = context.setupUI([[

MainWindow

  id: monsterEditor

  size: 450 450

  !text: tr("Edit monster")

  Label

    id: info

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

    text: Use monster name * for any other monster not on the list

  Label

    id: info2

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    text-align: center

    text: Add number (1-5) at the end of the name to create multiple configs

  TextEdit

    id: name

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-left: 100

    margin-top: 5

    multiline: false

  Label

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: parent.left

    text: Target name:

  Label

    id: priorityText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 10

    margin-top: 10

    text: Priority

    text-align: center

  HorizontalScrollBar

    id: priority

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 0

    maximum: 10

    step: 1

  Label

    id: dangerText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 10

    margin-top: 10

    text: Danger

    text-align: center

  HorizontalScrollBar

    id: danger

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 0

    maximum: 10

    step: 1

  Label

    id: maxDistanceText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 10

    margin-top: 10

    text: Max distance to target

    text-align: center

  HorizontalScrollBar

    id: maxDistance

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 1

    maximum: 10

    step: 1

  Label

    id: distanceText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 10

    margin-top: 10

    text: Keep distance

    text-align: center

  HorizontalScrollBar

    id: distance

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 0

    maximum: 5

    step: 1

  Label

    id: minHealthText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 10

    margin-top: 10

    text: Minimum Health

    text-align: center

  HorizontalScrollBar

    id: minHealth

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 0

    maximum: 100

    step: 1

  Label

    id: maxHealthText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 10

    margin-top: 10

    text: Maximum Health

    text-align: center

  HorizontalScrollBar

    id: maxHealth

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 0

    maximum: 100

    step: 1

  Label

    id: dangerText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 5

    margin-top: 10

    text: If total danger is high (>8) bot won't auto loot until it's low again and will be trying to minimize it

    text-align: center

    text-wrap: true

    text-auto-resize: true

  Label

    id: attackSpellText

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-right: 5

    margin-top: 10

    text: Attack spell and attack rune are only used when you have more than 30% health

    text-align: center

    text-wrap: true

    text-auto-resize: true

  BotSwitch

    id: attack

    anchors.left: parent.horizontalCenter

    anchors.top: name.bottom

    margin-left: 10

    margin-top: 10

    width: 55

    text: Attack

  BotSwitch

    id: ignore

    anchors.left: prev.right

    anchors.top: name.bottom

    margin-left: 18

    margin-top: 10

    width: 55

    text: Ignore

  BotSwitch

    id: avoid

    anchors.left: prev.right

    anchors.top: name.bottom

    margin-left: 18

    margin-top: 10

    width: 55

    text: Avoid

  BotSwitch

    id: keepDistance

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-left: 10

    margin-top: 10

    text: Keep distance

  BotSwitch

    id: avoidAttacks

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-left: 10

    margin-top: 10

    text: Avoid monster attacks

  BotSwitch

    id: chase

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-left: 10

    margin-top: 10

    text: Chase when has low health

  BotSwitch

    id: loot

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-left: 10

    margin-top: 10

    text: Loot corpse

  BotSwitch

    id: monstersOnly

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-left: 10

    margin-top: 10

    text: Only for monsters

  BotSwitch

    id: dontWalk

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-left: 10

    margin-top: 10

    text: Don't walk to target

  Label

    id: attackSpellText

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-left: 10

    margin-top: 10

    text: Attack Spell:

    text-align: center

  TextEdit

    id: attackSpell

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

    margin-top: 2

  Label

    id: attackItemText

    anchors.left: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 20

    margin-left: 20

    text: Attack rune:

    text-align: left

  BotItem

    id: attackItem

    anchors.right: parent.right

    anchors.verticalCenter: prev.verticalCenter

    margin-right: 30

  Button

    id: okButton

    !text: tr('Ok')

    anchors.bottom: parent.bottom

    anchors.right: next.left

    margin-right: 10

    width: 60

  Button

    id: cancelButton

    !text: tr('Cancel')

    anchors.bottom: parent.bottom

    anchors.right: parent.right

    width: 60

]], g_ui.getRootWidget())

  local destroy = function()

    window:destroy()

  end

  local doneFunc = function()

    local monster = window.name:getText()

    local config = {

      priority = window.priority:getValue(),

      danger = window.danger:getValue(),

      maxDistance = window.maxDistance:getValue(),

      distance = window.distance:getValue(),

      minHealth = window.minHealth:getValue(),

      maxHealth = window.maxHealth:getValue(),

      attack = window.attack:isOn(),

      ignore = window.ignore:isOn(),

      avoid = window.avoid:isOn(),

      keepDistance = window.keepDistance:isOn(),

      avoidAttacks = window.avoidAttacks:isOn(),

      chase = window.chase:isOn(),

      loot = window.loot:isOn(),

      monstersOnly = window.monstersOnly:isOn(),

      dontWalk = window.dontWalk:isOn(),

      attackItem = window.attackItem:getItemId(),

      attackSpell = window.attackSpell:getText()

}

    destroy()

    callback(monster, config)

  end

  window.okButton.onClick = doneFunc

  window.cancelButton.onClick = destroy

  window.onEnter = doneFunc

  window.onEscape = destroy

  window.priority.onValueChange = function(scroll, value)

    window.priorityText:setText("Priority: " .. value)

  end

  window.danger.onValueChange = function(scroll, value)

    window.dangerText:setText("Danger: " .. value)

  end

  window.maxDistance.onValueChange = function(scroll, value)

    window.maxDistanceText:setText("Max distance to target: " .. value)

  end

  window.distance.onValueChange = function(scroll, value)

    window.distanceText:setText("Keep distance: " .. value)

  end

  window.minHealth.onValueChange = function(scroll, value)

    window.minHealthText:setText("Minimum health: " .. value .. "%")

  end

  window.maxHealth.onValueChange = function(scroll, value)

    window.maxHealthText:setText("Maximum health: " .. value .. "%")

  end

  window.priority:setValue(config.priority or 1)

  window.danger:setValue(config.danger or 1)

  window.maxDistance:setValue(config.maxDistance or 6)

  window.distance:setValue(config.distance or 1)

  window.minHealth:setValue(1) -- to force onValueChange update

  window.maxHealth:setValue(1) -- to force onValueChange update

  window.minHealth:setValue(config.minHealth or 0)

  window.maxHealth:setValue(config.maxHealth or 100)

  window.attackSpell:setText(config.attackSpell or "")

  window.attackItem:setItemId(config.attackItem or 0)

  window.attack.onClick = function(widget)

    if widget:isOn() then

      return

    end

    widget:setOn(true)

    window.ignore:setOn(false)

    window.avoid:setOn(false)

  end

  window.ignore.onClick = function(widget)

    if widget:isOn() then

      return

    end

    widget:setOn(true)

    window.attack:setOn(false)

    window.avoid:setOn(false)

  end

  window.avoid.onClick = function(widget)

    if widget:isOn() then

      return

    end

    widget:setOn(true)

    window.attack:setOn(false)

    window.ignore:setOn(false)

  end

  window.attack:setOn(config.attack)

  window.ignore:setOn(config.ignore)

  window.avoid:setOn(config.avoid)

  if not window.attack:isOn() and not window.ignore:isOn() and not window.avoid:isOn() then

    window.attack:setOn(true)

  end

  window.keepDistance.onClick = function(widget)

    widget:setOn(not widget:isOn())

  end

  window.avoidAttacks.onClick = function(widget)

    widget:setOn(not widget:isOn())

  end

  window.chase.onClick = function(widget)

    widget:setOn(not widget:isOn())

  end

  window.loot.onClick = function(widget)

    widget:setOn(not widget:isOn())

  end

  window.monstersOnly.onClick = function(widget)

    widget:setOn(not widget:isOn())

  end

  window.dontWalk.onClick = function(widget)

    widget:setOn(not widget:isOn())

  end

  window.keepDistance:setOn(config.keepDistance)

  window.avoidAttacks:setOn(config.avoidAttacks)

  window.chase:setOn(config.chase)

  window.loot:setOn(config.loot)

  if config.loot == nil then

    window.loot:setOn(true)

  end

  window.monstersOnly:setOn(config.monstersOnly)

  if config.monstersOnly == nil then

    window.monstersOnly:setOn(true)

  end

  window.dontWalk:setOn(config.dontWalk)

  window.name:setText(monster)

  window:show()

  window:raise()

  window:focus()

end

Panels.Attacking = function(parent)

  local ui = context.setupUI([[

Panel

  id: attacking

  height: 140

  BotLabel

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text: Attacking

  ComboBox

    id: config

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-top: 5

    text-offset: 3 0

    width: 130

  Button

    id: enableButton

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 5

  Button

    margin-top: 1

    id: add

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Add

    width: 60

    height: 17

  Button

    id: edit

    anchors.top: prev.top

    anchors.horizontalCenter: parent.horizontalCenter

    text: Edit

    width: 60

    height: 17

  Button

    id: remove

    anchors.top: prev.top

    anchors.right: parent.right

    text: Remove

    width: 60

    height: 17

  TextList

    id: list

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    vertical-scrollbar: listScrollbar

    margin-right: 15

    margin-top: 2

    height: 60

    focusable: false

    auto-focus: first

  VerticalScrollBar

    id: listScrollbar

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.right: parent.right

    pixels-scroll: true

    step: 5

  Button

    margin-top: 2

    id: mAdd

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Add

    width: 60

    height: 17

  Button

    id: mEdit

    anchors.top: prev.top

    anchors.horizontalCenter: parent.horizontalCenter

    text: Edit

    width: 60

    height: 17

  Button

    id: mRemove

    anchors.top: prev.top

    anchors.right: parent.right

    text: Remove

    width: 60

    height: 17

]], parent)

  if type(context.storage.attacking) ~= "table" then

    context.storage.attacking = {}

  end

  if type(context.storage.attacking.configs) ~= "table" then

    context.storage.attacking.configs = {}

  end

  local getConfigName = function(config)

    local matches = regexMatch(config, [[name:\s*([^\n]*)$]])

    if matches[1] and matches[1][2] then

      return matches[1][2]:trim()

    end

    return nil

  end

  local commands = {}

  local monsters = {}

  local configName = nil

  local refreshConfig = nil -- declared later

  local createNewConfig = function()

    if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      return

    end

    local newConfig = ""

    if configName ~= nil then

      newConfig = "name:" .. configName .. "\n"

    end

    for monster, config in pairs(monsters) do

      newConfig = newConfig .. "\n" .. monster .. ":" .. json.encode(config, 2) .. "\n"

    end

    context.storage.attacking.configs[context.storage.attacking.activeConfig] = newConfig

    refreshConfig()

  end

  local parseConfig = function(config)

    commands = {}

    monsters = {}

    configName = nil

    local matches = regexMatch(config, [[([^:^\n]+)(:?)([^\n]*)]])

    for i=1,#matches do

      local command = matches[i][2]

      local validation = (matches[i][3] == ":")

      local text = matches[i][4]

      if validation then

        table.insert(commands, {command=command:lower(), text=text})

      elseif #commands > 0 then

        commands[#commands].text = commands[#commands].text .. "\n" .. matches[i][1]

      end

    end

    local labels = {}

    for i, command in ipairs(commands) do

      if commands[i].command == "name" then

        configName = commands[i].text

      else

        local status, result = pcall(function() return json.decode(command.text) end)

        if not status then

          context.error("Invalid monster config: " .. commands[i].command .. ", error: " .. result)

        else

          monsters[commands[i].command] = result

          table.insert(labels, commands[i].command)

        end

      end

    end

    table.sort(labels)

    for i, text in ipairs(labels) do

      local label = g_ui.createWidget("CaveBotLabel", ui.list)

      label:setText(text)

    end

  end

  local ignoreOnOptionChange = true

  refreshConfig = function(scrollDown)

    ignoreOnOptionChange = true

    if context.storage.attacking.enabled then

      ui.enableButton:setText("On")

      ui.enableButton:setColor('#00AA00FF')

    else

      ui.enableButton:setText("Off")

      ui.enableButton:setColor('#FF0000FF')

    end

    ui.config:clear()

    for i, config in ipairs(context.storage.attacking.configs) do

      local name = getConfigName(config)

      if not name then

        name = "Unnamed config"

      end

      ui.config:addOption(name)

    end

    if (not context.storage.attacking.activeConfig or context.storage.attacking.activeConfig == 0) and #context.storage.attacking.configs > 0 then

       context.storage.attacking.activeConfig = 1

    end

    ui.list:destroyChildren()

    if context.storage.attacking.activeConfig and context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      ui.config:setCurrentIndex(context.storage.attacking.activeConfig)

      parseConfig(context.storage.attacking.configs[context.storage.attacking.activeConfig])

    end

    context.saveConfig()

    if scrollDown and ui.list:getLastChild() then

      ui.list:focusChild(ui.list:getLastChild())

    end

    ignoreOnOptionChange = false

  end

  ui.config.onOptionChange = function(widget)

    if not ignoreOnOptionChange then

      context.storage.attacking.activeConfig = widget.currentIndex

      refreshConfig()

    end

  end

  ui.enableButton.onClick = function()

    if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      return

    end

    context.storage.attacking.enabled = not context.storage.attacking.enabled

    refreshConfig()

  end

  ui.add.onClick = function()

    modules.client_textedit.multilineEditor("Target list editor", "name:Config name", function(newText)

      table.insert(context.storage.attacking.configs, newText)

      context.storage.attacking.activeConfig = #context.storage.attacking.configs

      refreshConfig()

    end)

  end

  ui.edit.onClick = function()

    if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      return

    end

    modules.client_textedit.multilineEditor("Target list editor", context.storage.attacking.configs[context.storage.attacking.activeConfig], function(newText)

      context.storage.attacking.configs[context.storage.attacking.activeConfig] = newText

      refreshConfig()

    end)

  end

  ui.remove.onClick = function()

    if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      return

    end

    local questionWindow = nil

    local closeWindow = function()

      questionWindow:destroy()

    end

    local removeConfig = function()

      closeWindow()

      if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

        return

      end

      context.storage.attacking.enabled = false

      table.remove(context.storage.attacking.configs, context.storage.attacking.activeConfig)

      context.storage.attacking.activeConfig = 0

      refreshConfig()

    end

    questionWindow = context.displayGeneralBox(tr('Remove config'), tr('Do you want to remove current attacking config?'), {

      { text=tr('Yes'), callback=removeConfig },

      { text=tr('No'), callback=closeWindow },

      anchor=AnchorHorizontalCenter}, removeConfig, closeWindow)

  end

  ui.mAdd.onClick = function()

    if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      return

    end

    Panels.MonsterEditor("", {}, function(name, config)

      if name:len() > 0 then

        monsters[name] = config

      end

      createNewConfig()

    end, parent)

  end

  ui.mEdit.onClick = function()

    if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      return

    end

    local monsterWidget = ui.list:getFocusedChild()

    if not monsterWidget or not monsters[monsterWidget:getText()] then

      return

    end

    Panels.MonsterEditor(monsterWidget:getText(), monsters[monsterWidget:getText()], function(name, config)

      monsters[monsterWidget:getText()] = nil

      if name:len() > 0 then

        monsters[name] = config

      end

      createNewConfig()

    end, parent)

  end

  ui.mRemove.onClick = function()

    if not context.storage.attacking.activeConfig or not context.storage.attacking.configs[context.storage.attacking.activeConfig] then

      return

    end

    local monsterWidget = ui.list:getFocusedChild()

    if not monsterWidget or not monsters[monsterWidget:getText()] then

      return

    end

    monsters[monsterWidget:getText()] = nil

    createNewConfig()

  end

  refreshConfig()

  -- processing

  local isConfigPassingConditions = function(monster, config)

    if not config or type(config.priority) ~= 'number' or type(config.danger) ~= 'number' then

      return false

    end

    if not config.attack then

      return false

    end

    if monster:isPlayer() and (config.monstersOnly == true or config.monstersOnly == nil) then

      return false

    end

    local pos = context.player:getPosition()

    local mpos = monster:getPosition()

    local hp = monster:getHealthPercent()

    if config.minHealth > hp or config.maxHealth < hp then

      return false

    end

    local maxDistance = 5

    if type(config.maxDistance) == 'number' then

      maxDistance = config.maxDistance

    end

    if config.chase and hp < 25 then

      maxDistance = maxDistance + 2

    end

    local distance = math.max(math.abs(pos.x-mpos.x), math.abs(pos.y-mpos.y))

    if distance > maxDistance then

      return false

    end

    local pathTo = context.findPath(context.player:getPosition(), {x=mpos.x, y=mpos.y, z=mpos.z}, maxDistance + 2, { ignoreNonPathable = true, precision=1, allowOnlyVisibleTiles = true, ignoreCost = true })

    if not pathTo or #pathTo > maxDistance + 1 then

      return false

    end

    return true

  end

  local getMonsterConfig = function(monster)

    local name = monster:getName():lower()

    local hasConfig = false

    hasConfig = hasConfig or (monsters[name] ~= nil)

    if isConfigPassingConditions(monster, monsters[name]) then

      return monsters[name]

    end

    for i=1, 5 do

      hasConfig = hasConfig or (monsters[name .. i] ~= nil)

      if isConfigPassingConditions(monster, monsters[name .. i]) then

        return monsters[name .. i]

      end

    end

    if not hasConfig and isConfigPassingConditions(monster, monsters["*"]) then

      return monsters["*"]

    end

    return nil

  end

  local calculatePriority = function(monster)

    local priority = 0

    local config = getMonsterConfig(monster)

    if not config then

      return -1

    end

    local pos = context.player:getPosition()

    local mpos = monster:getPosition()

    local hp = monster:getHealthPercent()

    local pathTo = context.findPath(context.player:getPosition(), {x=mpos.x, y=mpos.y, z=mpos.z}, 10, { ignoreNonPathable = true, ignoreLastCreature = true, precision=0, allowOnlyVisibleTiles = true })

    if not pathTo then

      pathTo = context.findPath(context.player:getPosition(), {x=mpos.x, y=mpos.y, z=mpos.z}, 10, { ignoreNonPathable = true, precision=1, allowOnlyVisibleTiles = true })

      if not pathTo then

        return -1

      end

    end

    local distance = #pathTo

    if monster == g_game.getAttackingCreature() then

      priority = priority + 10

    end

    if distance <= 4 then

      priority = priority + 10

    end

    if distance <= 2 then

      priority = priority + 10

    end

    if distance <= 1 then

      priority = priority + 10

    end

    if hp <= 25 and config.chase then

      priority = priority + 30

    end

    if hp <= 10 then

      priority = priority + 10

    end

    if hp <= 25 then

      priority = priority + 10

    end

    if hp <= 50 then

      priority = priority + 10

    end

    if hp <= 75 then

      priority = priority + 10

    end

    priority = priority + config.priority * 10

    return priority

  end

  local calculateMonsterDanger = function(monster)

    local danger = 0

    local config = getMonsterConfig(monster)

    if not config or type(config.danger) ~= 'number' then

      return danger

    end

    danger = danger + config.danger

    return danger

  end

  local lastAttack = context.now

  local lootContainers = {}

  local lootTries = 0

  local openContainerRequest = 0

  local waitForLooting = 0

  local lastAttackSpell = 0

  local lastAttackRune = 0

  local goForLoot = function()

    if #lootContainers == 0 or not context.storage.looting.enabled then

      return false

    end

    if modules.game_walking.lastManualWalk + 500 > context.now then

      return true

    end

    local pos = context.player:getPosition()

    table.sort(lootContainers, function(pos1, pos2)

      local dist1 = math.max(math.abs(pos.x-pos1.x), math.abs(pos.y-pos1.y))

      local dist2 = math.max(math.abs(pos.x-pos2.x), math.abs(pos.y-pos2.y))

      return dist1 < dist2

    end)

    local cpos = lootContainers[1]

    if cpos.z ~= pos.z then

      table.remove(lootContainers, 1)

      return true

    end

    if lootTries >= 5 then

      lootTries = 0

      table.remove(lootContainers, 1)

      return true

    end

    local dist = math.max(math.abs(pos.x-cpos.x), math.abs(pos.y-cpos.y))

    if dist <= 5 then

      local tile = g_map.getTile(cpos)

      if not tile then

        table.remove(lootContainers, 1)

        return true

      end

      local topItem = tile:getTopUseThing()

      if not topItem or not topItem:isContainer() then

        table.remove(lootContainers, 1)

        return true

      end

      topItem:setMarked('orange')

      if dist <= 1 then

        lootTries = lootTries + 1

        openContainerRequest = context.now

        g_game.open(topItem)

        waitForLooting = math.max(waitForLooting, context.now + 500)

        return true

      end

    end

    if dist <= 25 then

      if context.player:isWalking() then

        return true

      end

      lootTries = lootTries + 1

      if context.autoWalk(cpos, 20, { precision = 1}) then

        return true

      end

      if context.autoWalk(cpos, 20, { ignoreNonPathable = true, precision = 1}) then

        return true

      end

      if context.autoWalk(cpos, 20, { ignoreNonPathable = true, precision = 2}) then

        return true

      end

      if context.autoWalk(cpos, 20, { ignoreNonPathable = true, ignoreCreatures = true, precision = 2}) then

        return true

      end

    else

      table.remove(lootContainers, 1)

      return false

    end

    return true

  end

  context.onCreatureDisappear(function(creature)

    if not creature:isMonster() then

      return

    end

    local pos = context.player:getPosition()

    local tpos = creature:getPosition()

    if tpos.z ~= pos.z then

      return

    end

    local config = getMonsterConfig(creature)

    if not config or not config.loot then

      return

    end

    local distance = math.max(math.abs(pos.x-tpos.x), math.abs(pos.y-tpos.y))

    if distance > 6 then

      return

    end

    local tile = g_map.getTile(tpos)

    if not tile then

      return

    end

    local topItem = tile:getTopUseThing()

    if not topItem or not topItem:isContainer() then

      return

    end

    topItem:setMarked('blue')

    table.insert(lootContainers, tpos)

  end)

  context.onContainerOpen(function(container, prevContainer)

    lootTries = 0

    if not context.storage.attacking.enabled then

      return

    end

    if openContainerRequest + 500 > context.now and #lootContainers > 0 then

      waitForLooting = math.max(waitForLooting, context.now + 1000 + container:getItemsCount() * 100)

      table.remove(lootContainers, 1)

    end

    if prevContainer then

      container.autoLooting = prevContainer.autoLooting

    else

      container.autoLooting = (openContainerRequest + 3000 > context.now)

    end

  end)

  context.macro(200, function()

    if not context.storage.attacking.enabled then

      return

    end

    local attacking = nil

    local following = nil

    local attackingCandidate = g_game.getAttackingCreature()

    local followingCandidate = g_game.getFollowingCreature()

    local spectators = context.getSpectators()

    local monsters = {}

    local danger = 0

    for i, spec in ipairs(spectators) do

      if attackingCandidate and attackingCandidate:getId() == spec:getId() then

        attacking = spec

      end

      if followingCandidate and followingCandidate:getId() == spec:getId() then

        following = spec

      end

      if spec:isMonster() or (spec:isPlayer() and not spec:isLocalPlayer()) then

        danger = danger + calculateMonsterDanger(spec)

        spec.attackingPriority = calculatePriority(spec)

        table.insert(monsters, spec)

      end

    end

    if following then

      return

    end

    if waitForLooting > context.now then

      return

    end

    if #monsters == 0 or context.isInProtectionZone() then

      goForLoot()

      return

    end

    table.sort(monsters, function(a, b)

      return a.attackingPriority > b.attackingPriority

    end)

    local target = monsters[1]

    if target.attackingPriority < 0 then

      return

    end

    local pos = context.player:getPosition()

    local tpos = target:getPosition()

    local config = getMonsterConfig(target)

    local offsetX = pos.x - tpos.x

    local offsetY = pos.y - tpos.y

    local justStartedAttack = false

    if target ~= attacking then

      g_game.attack(target)

      attacking = target

      lastAttack = context.now

      justStartedAttack = true

    end

    -- proceed attack

    if not target:isPlayer() and lastAttack + 15000 < context.now then

      -- stop and attack again, just in case

      g_game.cancelAttack()

      g_game.attack(target)

      lastAttack = context.now

      return

    end

    if not justStartedAttack and config.attackSpell and config.attackSpell:len() > 0 then

      if context.now > lastAttackSpell + 1000 and context.player:getHealthPercent() > 30 then

        if context.saySpell(config.attackSpell, 1500) then

          lastAttackRune = context.now

        end

      end

    end

    if not justStartedAttack and config.attackItem and config.attackItem >= 100 then

      if context.now > lastAttackRune + 1000 and context.player:getHealthPercent() > 30 then

        if context.useRune(config.attackItem, target, 1500) then

          lastAttackRune = context.now

        end

      end

    end

    if modules.game_walking.lastManualWalk + 500 > context.now then

      return

    end

    if danger < 8 then

      -- low danger, go for loot first

      if goForLoot() then

        return

      end

    end

    target.ignoreByWaypoints = config.dontWalk

    if config.dontWalk then

      if goForLoot() then

        return

      end

      return

    end

    local distance = math.max(math.abs(offsetX), math.abs(offsetY))

    if config.keepDistance then

      local minDistance = config.distance

      if target:getHealthPercent() <= 25 and config.chase and danger < 10 then

        minDistance = 1

      end

      if (distance == minDistance or distance == minDistance + 1) then

        return

      else

        local bestDist = 10

        local bestPos = pos

        if not context.autoWalk(tpos, 10, {  minMargin=minDistance, maxMargin=minDistance + 1, allowOnlyVisibleTiles = true}) then

          if not context.autoWalk(tpos, 10, { ignoreNonPathable = true, minMargin=minDistance, maxMargin=minDistance + 1, allowOnlyVisibleTiles = true}) then

            if not context.autoWalk(tpos, 10, { ignoreNonPathable = true, ignoreCreatures = true, minMargin=minDistance, maxMargin=minDistance + 2, allowOnlyVisibleTiles = true}) then

              return

            end

          end

        end

        if not target:isPlayer() then

          context.delay(300)

        end

      end

      return

    end

    if config.avoidAttacks and distance <= 1 then

      if (offsetX == 0 and offsetY ~= 0) then

        if context.player:canWalk(Directions.East) then

          g_game.walk(Directions.East)

        elseif context.player:canWalk(Directions.West) then

          g_game.walk(Directions.West)

        end

      elseif (offsetX ~= 0 and offsetY == 0) then

        if context.player:canWalk(Directions.North) then

          g_game.walk(Directions.North)

        elseif context.player:canWalk(Directions.South) then

          g_game.walk(Directions.South)

        end

      end

    end

    if distance > 1 then

      if not context.autoWalk(tpos, 10, { precision = 1, allowOnlyVisibleTiles = true}) then

        if not context.autoWalk(tpos, 10, { ignoreNonPathable = true, precision = 1, allowOnlyVisibleTiles = true}) then

          if not context.autoWalk(tpos, 10, { ignoreNonPathable = true, precision = 2, allowOnlyVisibleTiles = true}) then

            return

          end

        end

      end

      if not target:isPlayer() then

        context.delay(300)

      end

    end

  end)

end

```

---
# basic.lua
```lua

local context = G.botContext

local Panels = context.Panels

Panels.Turning = function(parent)

  context.macro(1000, "Turning / AntiIdle", nil, function()

    context.turn(math.random(1, 4))

  end, parent)

end

Panels.AntiIdle = Panels.Turning

Panels.AttackSpell = function(parent)

  context.macro(500, "Auto attack spell", nil, function()

    local target = g_game.getAttackingCreature()

    if target and context.getCreatureById(target:getId()) and context.storage.autoAttackText:len() > 0 then

      if context.saySpell(context.storage.autoAttackText, 1000) then

        context.delay(1000)

      end

    end

  end, parent)

  context.addTextEdit("autoAttackText", context.storage.autoAttackText or "exori vis", function(widget, text)

    context.storage.autoAttackText = text

  end, parent)

end

Panels.AttackItem = function(parent)

  if not parent then

    parent = context.panel

  end

  local panelName = "attackItem"

  local ui = g_ui.createWidget("ItemAndButtonPanel", parent)

  ui:setId(panelName)

  ui.title:setText("Auto attack item")

  if not context.storage.attackItem then

    context.storage.attackItem = {}

  end

  ui.title:setOn(context.storage.attackItem.enabled)

  ui.title.onClick = function(widget)

    context.storage.attackItem.enabled = not context.storage.attackItem.enabled

    widget:setOn(context.storage.attackItem.enabled)

  end

  ui.item.onItemChange = function(widget)

    context.storage.attackItem.item = widget:getItemId()

  end

  ui.item:setItemId(context.storage.attackItem.item or 3155)

  context.macro(500, function()

    local target = g_game.getAttackingCreature()

    if context.storage.attackItem.enabled and target and context.getCreatureById(target:getId()) and context.storage.attackItem.item and context.storage.attackItem.item >= 100 then

      context.useWith(context.storage.attackItem.item, target)

    end

  end)

end

```

---
# healing.lua
```lua

local context = G.botContext

local Panels = context.Panels

Panels.Haste = function(parent)

  context.macro(500, "Auto Haste", nil, function()

    if not context.hasHaste() and context.storage.autoHasteText:len() > 0 then

      if context.saySpell(context.storage.autoHasteText, 2500) then

        context.delay(5000)

      end

    end

  end, parent)

  context.addTextEdit("autoHasteText", context.storage.autoHasteText or "utani hur", function(widget, text)

    context.storage.autoHasteText = text

  end, parent)

end

Panels.ManaShield = function(parent)

  local lastManaShield = 0

  context.macro(100, "Auto Mana Shield", nil, function()

    if not context.hasManaShield() or context.now > lastManaShield + 90000 then

      if context.saySpell("utamo vita", 200) then

        lastManaShield = context.now

      end

    end

  end, parent)

end

Panels.AntiParalyze = function(parent)

  context.macro(100, "Anti Paralyze", nil, function()

    if context.isParalyzed() and context.storage.autoAntiParalyzeText:len() > 0 then

      context.saySpell(context.storage.autoAntiParalyzeText, 750)

    end

  end, parent)

  context.addTextEdit("autoAntiParalyzeText", context.storage.autoAntiParalyzeText or "utani hur", function(widget, text)

    context.storage.autoAntiParalyzeText = text

  end, parent)

end

Panels.Health = function(parent)

  if not parent then

    parent = context.panel

  end

  local panelName = "autoHealthPanel"

  local panelId = 1

  while parent:getChildById(panelName .. panelId) do

    panelId = panelId + 1

  end

  panelName = panelName .. panelId

  local ui = g_ui.createWidget("DualScrollPanel", parent)

  ui:setId(panelName)

  if not context.storage[panelName] then

    context.storage[panelName] = {

      item = 266,

      min = 20,

      max = 80,

      text = "exura"

}

  end

  ui.title:setOn(context.storage[panelName].enabled)

  ui.title.onClick = function(widget)

    context.storage[panelName].enabled = not context.storage[panelName].enabled

    widget:setOn(context.storage[panelName].enabled)

  end

  ui.text.onTextChange = function(widget, text)

    context.storage[panelName].text = text

  end

  ui.text:setText(context.storage[panelName].text or "exura")

  local updateText = function()

    ui.title:setText("" .. context.storage[panelName].min .. "% <= hp <= " .. context.storage[panelName].max .. "%")

  end

  ui.scroll1.onValueChange = function(scroll, value)

    context.storage[panelName].min = value

    updateText()

  end

  ui.scroll2.onValueChange = function(scroll, value)

    context.storage[panelName].max = value

    updateText()

  end

  ui.scroll1:setValue(context.storage[panelName].min)

  ui.scroll2:setValue(context.storage[panelName].max)

  context.macro(25, function()

    if context.storage[panelName].enabled and context.storage[panelName].text:len() > 0 and context.storage[panelName].min <= context.hppercent() and context.hppercent() <= context.storage[panelName].max then

      if context.saySpell(context.storage[panelName].text, 500) then

        context.delay(200)

      end

    end

  end)

end

Panels.HealthItem = function(parent)

  if not parent then

    parent = context.panel

  end

  local panelName = "autoHealthItemPanel"

  local panelId = 1

  while parent:getChildById(panelName .. panelId) do

    panelId = panelId + 1

  end

  panelName = panelName .. panelId

  local ui = g_ui.createWidget("DualScrollItemPanel", parent)

  ui:setId(panelName)

  if not context.storage[panelName] then

    context.storage[panelName] = {

      item = 266,

      min = 0,

      max = 60

}

  end

  ui.title:setOn(context.storage[panelName].enabled)

  ui.title.onClick = function(widget)

    context.storage[panelName].enabled = not context.storage[panelName].enabled

    widget:setOn(context.storage[panelName].enabled)

  end

  ui.item.onItemChange = function(widget)

    context.storage[panelName].item = widget:getItemId()

  end

  ui.item:setItemId(context.storage[panelName].item)

  local updateText = function()

    ui.title:setText("" .. (context.storage[panelName].min or "") .. "% <= hp <= " .. (context.storage[panelName].max or "") .. "%")

  end

  ui.scroll1.onValueChange = function(scroll, value)

    context.storage[panelName].min = value

    updateText()

  end

  ui.scroll2.onValueChange = function(scroll, value)

    context.storage[panelName].max = value

    updateText()

  end

  ui.scroll1:setValue(context.storage[panelName].min)

  ui.scroll2:setValue(context.storage[panelName].max)

  context.macro(25, function()

    if context.storage[panelName].enabled and context.storage[panelName].item >= 100 and context.storage[panelName].min <= context.hppercent() and context.hppercent() <= context.storage[panelName].max then

      if context.useRune(context.storage[panelName].item, context.player, 500) then

        context.delay(300)

      end

    end

  end)

end

Panels.Mana = function(parent)

  if not parent then

    parent = context.panel

  end

  local panelName = "autoManaItemPanel"

  local panelId = 1

  while parent:getChildById(panelName .. panelId) do

    panelId = panelId + 1

  end

  panelName = panelName .. panelId

  local ui = g_ui.createWidget("DualScrollItemPanel", parent)

  ui:setId(panelName)

  if not context.storage[panelName] then

    context.storage[panelName] = {

      item = 268,

      min = 0,

      max = 60

}

  end

  ui.title:setOn(context.storage[panelName].enabled)

  ui.title.onClick = function(widget)

    context.storage[panelName].enabled = not context.storage[panelName].enabled

    widget:setOn(context.storage[panelName].enabled)

  end

  ui.item.onItemChange = function(widget)

    context.storage[panelName].item = widget:getItemId()

  end

  ui.item:setItemId(context.storage[panelName].item)

  local updateText = function()

    ui.title:setText("" .. (context.storage[panelName].min or "") .. "% <= mana <= " .. (context.storage[panelName].max or "") .. "%")

  end

  ui.scroll1.onValueChange = function(scroll, value)

    context.storage[panelName].min = value

    updateText()

  end

  ui.scroll2.onValueChange = function(scroll, value)

    context.storage[panelName].max = value

    updateText()

  end

  ui.scroll1:setValue(context.storage[panelName].min)

  ui.scroll2:setValue(context.storage[panelName].max)

  context.macro(25, function()

    if context.storage[panelName].enabled and context.storage[panelName].item >= 100 and context.storage[panelName].min <= context.manapercent() and context.manapercent() <= context.storage[panelName].max then

      if context.useRune(context.storage[panelName].item, context.player, 500) then

        context.delay(300)

      end

    end

  end)

end

Panels.ManaItem = Panels.Mana

Panels.Equip = function(parent)

  if not parent then

    parent = context.panel

  end

  local panelName = "autoEquipItem"

  local panelId = 1

  while parent:getChildById(panelName .. panelId) do

    panelId = panelId + 1

  end

  panelName = panelName .. panelId

  local ui = g_ui.createWidget("TwoItemsAndSlotPanel", parent)

  ui:setId(panelName)

  if not context.storage[panelName] then

    context.storage[panelName] = {}

    if panelId == 1 then

      context.storage[panelName].item1 = 3052

      context.storage[panelName].item2 = 3089

      context.storage[panelName].slot = 9

    end

  end

  ui.title:setText("Auto equip")

  ui.title:setOn(context.storage[panelName].enabled)

  ui.title.onClick = function(widget)

    context.storage[panelName].enabled = not context.storage[panelName].enabled

    widget:setOn(context.storage[panelName].enabled)

  end

  ui.item1:setItemId(context.storage[panelName].item1 or 0)

  ui.item1.onItemChange = function(widget)

    context.storage[panelName].item1 = widget:getItemId()

  end

  ui.item2:setItemId(context.storage[panelName].item2 or 0)

  ui.item2.onItemChange = function(widget)

    context.storage[panelName].item2 = widget:getItemId()

  end

  if not context.storage[panelName].slot then

    context.storage[panelName].slot = 1

  end

  ui.slot:setCurrentIndex(context.storage[panelName].slot)

  ui.slot.onOptionChange = function(widget)

    context.storage[panelName].slot = widget.currentIndex

  end

  context.macro(250, function()

    if context.storage[panelName].enabled and context.storage[panelName].slot > 0 then

      local item1 = context.storage[panelName].item1 or 0

      local item2 = context.storage[panelName].item2 or 0

      if item1 < 100 and item2 < 100 then

        return

      end

      local slotItem = context.getSlot(context.storage[panelName].slot)

      if slotItem and (slotItem:getId() == item1 or slotItem:getId() == item2) then

        return

      end

      local newItem = context.findItem(context.storage[panelName].item1)

      if not newItem then

        newItem = context.findItem(context.storage[panelName].item2)

        if not newItem then

          return

        end

      end

      g_game.move(newItem, {x=65535, y=context.storage[panelName].slot, z=0})

      context.delay(1000)

    end

  end)

end

Panels.AutoEquip = Panels.Equip

Panels.Eating = function(parent)

  if not parent then

    parent = context.panel

  end

  local panelName = "autoEatingPanel"

  local panelId = 1

  while parent:getChildById(panelName .. panelId) do

    panelId = panelId + 1

  end

  panelName = panelName .. panelId

  local ui = g_ui.createWidget("ItemsPanel", parent)

  ui:setId(panelName)

  if not context.storage[panelName] then

    context.storage[panelName] = {}

  end

  ui.title:setText("Auto eating")

  ui.title:setOn(context.storage[panelName].enabled)

  ui.title.onClick = function(widget)

    context.storage[panelName].enabled = not context.storage[panelName].enabled

    widget:setOn(context.storage[panelName].enabled)

  end

  if type(context.storage[panelName].items) ~= 'table' then

    context.storage[panelName].items = {3725, 0, 0, 0, 0}

  end

  for i=1,5 do

    ui.items:getChildByIndex(i).onItemChange = function(widget)

      context.storage[panelName].items[i] = widget:getItemId()

    end

    ui.items:getChildByIndex(i):setItemId(context.storage[panelName].items[i])

  end

  context.macro(15000, function()

    if not context.storage[panelName].enabled then

      return

    end

    local candidates = {}

    for i, item in pairs(context.storage[panelName].items) do

      if item >= 100 then

        table.insert(candidates, item)

      end

    end

    if #candidates == 0 then

      return

    end

    context.use(candidates[math.random(1, #candidates)])

  end)

end

```

---
# looting.lua
```lua

local context = G.botContext

local Panels = context.Panels

Panels.Looting = function(parent)

  local ui = context.setupUI([[

Panel

  id: looting

  height: 180

  BotLabel

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text: Looting

  ComboBox

    id: config

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-top: 5

    text-offset: 3 0

    width: 130

  Button

    id: enableButton

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 5

  Button

    margin-top: 1

    id: add

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Add

    width: 60

    height: 17

  Button

    id: edit

    anchors.top: prev.top

    anchors.horizontalCenter: parent.horizontalCenter

    text: Edit

    width: 60

    height: 17

  Button

    id: remove

    anchors.top: prev.top

    anchors.right: parent.right

    text: Remove

    width: 60

    height: 17

  ScrollablePanel

    id: items

    anchors.top: prev.bottom

    anchors.right: parent.right

    anchors.left: parent.left

    vertical-scrollbar: scrollBar

    margin-right: 5

    margin-top: 2

    height: 70

    layout:

      type: grid

      cell-size: 34 34

      flow: true

  BotSmallScrollBar

    id: scrollBar

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.right: parent.right

    step: 10

    pixels-scroll: true

  BotLabel

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 4

    text: Loot Containers

  ItemsRow

    id: containers

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    height: 33

    margin-top: 2

]], parent)

  local lootContainers = { ui.containers.item1, ui.containers.item2, ui.containers.item3, ui.containers.item4, ui.containers.item5 }

  if type(context.storage.looting) ~= "table" then

    context.storage.looting = {}

  end

  if type(context.storage.looting.configs) ~= "table" then

    context.storage.looting.configs = {}

  end

  local getConfigName = function(config)

    local matches = regexMatch(config, [[name:\s*([^\n]*)$]])

    if matches[1] and matches[1][2] then

      return matches[1][2]:trim()

    end

    return nil

  end

  local items = {}

  local itemsByKey = {}

  local containers = {}

  local commands = {}

  local refreshConfig = nil -- declared later

  local createNewConfig = function(focusedWidget)

    if not context.storage.looting.activeConfig or not context.storage.looting.configs[context.storage.looting.activeConfig] then

      return

    end

    local tmpItems = {}

    local tmpContainers = {}

    local focusIndex = 0

    local newConfig = ""

    for i, text in ipairs(commands) do

      newConfig = newConfig .. text .. "\n"

    end

    for i=1,ui.items:getChildCount() do

      local widget = ui.items:getChildByIndex(i)

      if widget and widget:getItemId() >= 100 then

        if tmpItems[widget:getItemId()] == nil then

          tmpItems[widget:getItemId()] = 1

          newConfig = newConfig .. "\n" .. widget:getItemId()

        end

      end

      if widget == focusedWidget then

        focusIndex = i

      end

    end

    for i, widget in ipairs(lootContainers) do

      if widget:getItemId() >= 100 then

        if tmpContainers[widget:getItemId()] == nil then

          tmpContainers[widget:getItemId()] = 1 -- remove duplicates

          newConfig = newConfig .. "\ncontainer:" .. widget:getItemId()

        end

      end

    end

    context.storage.looting.configs[context.storage.looting.activeConfig] = newConfig

    refreshConfig(focusIndex)

  end

  local parseConfig = function(config)

    items = {}

    itemsByKey = {}

    containers = {}

    commands = {}

    local matches = regexMatch(config, [[([^:^\n^\s]+)(:?)([^\n]*)]])

    for i=1,#matches do

      local command = matches[i][2]

      local validation = (matches[i][3] == ":")

      local text = matches[i][4]

      local commandAsNumber = tonumber(command)

      local textAsNumber = tonumber(text)

      if commandAsNumber and commandAsNumber >= 100 then

        table.insert(items, commandAsNumber)

        itemsByKey[commandAsNumber] = 1

      elseif command == "container" and validation and textAsNumber and textAsNumber >= 100 then

        containers[textAsNumber] = 1

      elseif validation then

        table.insert(commands, command .. ":" .. text)

      end

    end

    local itemsToShow = #items + 2

    if itemsToShow % 5 ~= 0 then

      itemsToShow = itemsToShow + 5 - itemsToShow % 5

    end

    if itemsToShow < 10 then

      itemsToShow = 10

    end

    for i=1,itemsToShow do

      local widget = g_ui.createWidget("BotItem", ui.items)

      local itemId = 0

      if i <= #items then

        itemId = items[i]

      end

      widget:setItemId(itemId)

      widget.onItemChange = createNewConfig

    end

    for i, widget in ipairs(lootContainers) do

        widget:setItemId(0)

    end

    local containerIndex = 1

    for containerId, i in pairs(containers) do

      if lootContainers[containerIndex] then

        lootContainers[containerIndex]:setItemId(containerId)

      end

      containerIndex = containerIndex + 1

    end

    for i, widget in ipairs(lootContainers) do

      widget.onItemChange = createNewConfig

    end

  end

  local ignoreOnOptionChange = true

  refreshConfig = function(focusIndex)

    ignoreOnOptionChange = true

    if context.storage.looting.enabled then

      ui.enableButton:setText("On")

      ui.enableButton:setColor('#00AA00FF')

    else

      ui.enableButton:setText("Off")

      ui.enableButton:setColor('#FF0000FF')

    end

    ui.config:clear()

    for i, config in ipairs(context.storage.looting.configs) do

      local name = getConfigName(config)

      if not name then

        name = "Unnamed config"

      end

      ui.config:addOption(name)

    end

    if (not context.storage.looting.activeConfig or context.storage.looting.activeConfig == 0) and #context.storage.looting.configs > 0 then

       context.storage.looting.activeConfig = 1

    end

    ui.items:destroyChildren()

    for i, widget in ipairs(lootContainers) do

      widget.onItemChange = nil

      widget:setItemId(0)

      widget:setItemCount(0)

    end

    if context.storage.looting.activeConfig and context.storage.looting.configs[context.storage.looting.activeConfig] then

      ui.config:setCurrentIndex(context.storage.looting.activeConfig)

      parseConfig(context.storage.looting.configs[context.storage.looting.activeConfig])

    end

    context.saveConfig()

    if focusIndex and focusIndex > 0 and ui.items:getChildByIndex(focusIndex) then

      ui.items:focusChild(ui.items:getChildByIndex(focusIndex))

    end

    ignoreOnOptionChange = false

  end

  ui.config.onOptionChange = function(widget)

    if not ignoreOnOptionChange then

      context.storage.looting.activeConfig = widget.currentIndex

      refreshConfig()

    end

  end

  ui.enableButton.onClick = function()

    if not context.storage.looting.activeConfig or not context.storage.looting.configs[context.storage.looting.activeConfig] then

      return

    end

    context.storage.looting.enabled = not context.storage.looting.enabled

    refreshConfig()

  end

  ui.add.onClick = function()

    modules.client_textedit.multilineEditor("Looting editor", "name:Config name", function(newText)

      table.insert(context.storage.looting.configs, newText)

      context.storage.looting.activeConfig = #context.storage.looting.configs

      refreshConfig()

    end)

  end

  ui.edit.onClick = function()

    if not context.storage.looting.activeConfig or not context.storage.looting.configs[context.storage.looting.activeConfig] then

      return

    end

    modules.client_textedit.multilineEditor("Looting editor", context.storage.looting.configs[context.storage.looting.activeConfig], function(newText)

      context.storage.looting.configs[context.storage.looting.activeConfig] = newText

      refreshConfig()

    end)

  end

  ui.remove.onClick = function()

    if not context.storage.looting.activeConfig or not context.storage.looting.configs[context.storage.looting.activeConfig] then

      return

    end

    local questionWindow = nil

    local closeWindow = function()

      questionWindow:destroy()

    end

    local removeConfig = function()

      closeWindow()

      if not context.storage.looting.activeConfig or not context.storage.looting.configs[context.storage.looting.activeConfig] then

        return

      end

      context.storage.looting.enabled = false

      table.remove(context.storage.looting.configs, context.storage.looting.activeConfig)

      context.storage.looting.activeConfig = 0

      refreshConfig()

    end

    questionWindow = context.displayGeneralBox(tr('Remove config'), tr('Do you want to remove current looting config?'), {

      { text=tr('Yes'), callback=removeConfig },

      { text=tr('No'), callback=closeWindow },

      anchor=AnchorHorizontalCenter}, removeConfig, closeWindow)

  end

  refreshConfig()

  context.onContainerOpen(function(container, prevContainer)

    if context.storage.attacking.enabled then

      return

    end

    if prevContainer then

      container.autoLooting = prevContainer.autoLooting

    else

      container.autoLooting = true

    end

  end)

  context.macro(200, function()

    if not context.storage.looting.enabled then

      return

    end

    local candidates = {}

    local lootContainersCandidates = {}

    for containerId, container in pairs(g_game.getContainers()) do

      local containerItem = container:getContainerItem()

      if container.autoLooting and container:getItemsCount() > 0 and (not containerItem or containers[containerItem:getId()] == nil) then

        table.insert(candidates, container)

      elseif containerItem and containers[containerItem:getId()] ~= nil then

        table.insert(lootContainersCandidates, container)

      end

    end

    if #lootContainersCandidates == 0 then

      for slot = InventorySlotFirst, InventorySlotLast do

        local item = context.getInventoryItem(slot)

        if item and item:isContainer() and containers[item:getId()] ~= nil then

          table.insert(lootContainersCandidates, item)

        end

      end

      if #lootContainersCandidates > 0 then

        -- try to open inventory backpack

        local target = lootContainersCandidates[math.random(1,#lootContainersCandidates)]

        g_game.open(target, nil)

        context.delay(200)

      end

      return

    end

    if #candidates == 0 then

      return

    end

    local container = candidates[math.random(1,#candidates)]

    local nextContainers = {}

    local foundItem = nil

    for i, item in ipairs(container:getItems()) do

      if item:isContainer() then

        table.insert(nextContainers, item)

      elseif itemsByKey[item:getId()] ~= nil then

        foundItem = item

        break

      end

    end

    -- found item to loot

    if foundItem then

      -- find backpack for it, first backpack with same items

      for i, container in ipairs(lootContainersCandidates) do

        if container:getItemsCount() < container:getCapacity() or foundItem:isStackable() then -- has space

          for j, item in ipairs(container:getItems()) do

            if item:getId() == foundItem:getId() then

              if foundItem:isStackable() then

                if item:getCount() ~= 100  then

                  g_game.move(foundItem, container:getSlotPosition(j - 1), foundItem:getCount())

                  return

                end

              else

                g_game.move(foundItem, container:getSlotPosition(container:getItemsCount()), foundItem:getCount())

                return

              end

            end

          end

        end

      end

      -- now any backpack with empty slot

      for i, container in ipairs(lootContainersCandidates) do

        if container:getItemsCount() < container:getCapacity() then -- has space

          g_game.move(foundItem, container:getSlotPosition(container:getItemsCount()), foundItem:getCount())

          return

        end

      end

      -- can't find backpack, try to open new

      for i, container in ipairs(lootContainersCandidates) do

        local candidates = {}

        for j, item in ipairs(container:getItems()) do

          if item:isContainer() and containers[item:getId()] ~= nil then

            table.insert(candidates, item)

          end

        end

        if #candidates > 0 then

          g_game.open(candidates[math.random(1,#candidates)], container)

          return

        end

        -- full, close it

        g_game.close(container)

        return

      end

      return

    end

    -- open remaining containers

    if #nextContainers == 0 then

      return

    end

    local delay = 1

    for i=2,#nextContainers do

      -- if more than 1 container, open them in new window

      context.schedule(delay, function()

        g_game.open(nextContainers[i], nil)

      end)

      delay = delay + 250

    end

    context.schedule(delay, function()

      g_game.open(nextContainers[1], container)

    end)

    context.delay(150 + delay)

  end)

end

```

---
# tools.lua
```lua

local context = G.botContext

local Panels = context.Panels

Panels.TradeMessage = function(parent)

  context.macro(60000, "Send message on trade", nil, function()

    local trade = context.getChannelId("advertising")

    if not trade then

      trade = context.getChannelId("trade")

    end

    if context.storage.autoTradeMessage:len() > 0 and trade then

      context.sayChannel(trade, context.storage.autoTradeMessage)

    end

  end, parent)

  context.addTextEdit("autoTradeMessage", context.storage.autoTradeMessage or "I'm using OTClientV8 - https://github.com/OTCv8/otclientv8", function(widget, text)

    context.storage.autoTradeMessage = text

  end, parent)

end

Panels.AutoStackItems = function(parent)

  context.macro(500, "Auto stacking items", nil, function()

    local containers = context.getContainers()

    for i, container in pairs(containers) do

      local toStack = {}

      for j, item in ipairs(container:getItems()) do

        if item:isStackable() and item:getCount() ~= 100 then

          local otherItem = toStack[item:getId()]

          if otherItem then

            g_game.move(item, otherItem, item:getCount())

            return

          end

          toStack[item:getId()] = container:getSlotPosition(j - 1)

        end

      end

    end

  end, parent)

end

```

---
# war.lua
```lua

local context = G.botContext

local Panels = context.Panels

Panels.AttackLeaderTarget = function(parent)

  local toAttack = nil

  context.onMissle(function(missle)

    if not context.storage.attackLeader or context.storage.attackLeader:len() == 0 then

      return

    end

    local src = missle:getSource()

    if src.z ~= context.posz() then

      return

    end

    local from = g_map.getTile(src)

    local to = g_map.getTile(missle:getDestination())

    if not from or not to then

      return

    end

    local fromCreatures = from:getCreatures()

    local toCreatures = to:getCreatures()

    if #fromCreatures ~= 1 or #toCreatures ~= 1 then

      return

    end

    local c1 = fromCreatures[1]

    if c1:getName():lower() == context.storage.attackLeader:lower() then

      toAttack = toCreatures[1]

    end

  end)

  context.macro(50, "Attack leader's target", nil, function()

    if toAttack and context.storage.attackLeader:len() > 0 and toAttack ~= g_game.getAttackingCreature() then

      g_game.attack(toAttack)

      toAttack = nil

    end

  end, parent)

  context.addTextEdit("attackLeader", context.storage.attackLeader or "player name", function(widget, text)

    context.storage.attackLeader = text

  end, parent)

end

Panels.LimitFloor = function(parent)

  context.onPlayerPositionChange(function(pos)

    if context.storage.limitFloor then

      local gameMapPanel = modules.game_interface.getMapPanel()

      if gameMapPanel then

        gameMapPanel:lockVisibleFloor(pos.z)

      end

    end

  end)

  local switch = context.addSwitch("limitFloor", "Don't show higher floors", function(widget)

    widget:setOn(not widget:isOn())

    context.storage.limitFloor = widget:isOn()

    local gameMapPanel = modules.game_interface.getMapPanel()

    if gameMapPanel then

      if context.storage.limitFloor then

        gameMapPanel:lockVisibleFloor(context.posz())

      else

        gameMapPanel:unlockVisibleFloor()

      end

    end

  end, parent)

  switch:setOn(context.storage.limitFloor)

end

Panels.AntiPush = function(parent)

  if not parent then

    parent = context.panel

  end

  local panelName = "antiPushPanel"

  local ui = g_ui.createWidget("ItemsPanel", parent)

  ui:setId(panelName)

  if not context.storage[panelName] then

    context.storage[panelName] = {}

  end

  ui.title:setText("Anti push")

  ui.title:setOn(context.storage[panelName].enabled)

  ui.title.onClick = function(widget)

    context.storage[panelName].enabled = not context.storage[panelName].enabled

    widget:setOn(context.storage[panelName].enabled)

  end

  if type(context.storage[panelName].items) ~= 'table' then

    context.storage[panelName].items = {3031, 3035, 0, 0, 0}

  end

  for i=1,5 do

    ui.items:getChildByIndex(i).onItemChange = function(widget)

      context.storage[panelName].items[i] = widget:getItemId()

    end

    ui.items:getChildByIndex(i):setItemId(context.storage[panelName].items[i])

  end

  context.macro(100, function()

    if not context.storage[panelName].enabled then

      return

    end

    local tile = g_map.getTile(context.player:getPosition())

    if not tile then

      return

    end

    local topItem = tile:getTopUseThing()

    if topItem and topItem:isStackable() then

      topItem = topItem:getId()

    else

      topItem = 0

    end

    local candidates = {}

    for i, item in pairs(context.storage[panelName].items) do

      if item >= 100 and item ~= topItem and context.findItem(item) then

        table.insert(candidates, item)

      end

    end

    if #candidates == 0 then

      return

    end

    if type(context.storage[panelName].lastItem) ~= 'number' or context.storage[panelName].lastItem > #candidates then

      context.storage[panelName].lastItem = 1

    end

    local item = context.findItem(candidates[context.storage[panelName].lastItem])

    g_game.move(item, context.player:getPosition(), 1)

    context.storage[panelName].lastItem = context.storage[panelName].lastItem + 1

  end)

end

```

---
# waypoints.lua
```lua

local context = G.botContext

local Panels = context.Panels

Panels.Waypoints = function(parent)

  local ui = context.setupUI([[

Panel

  id: waypoints

  height: 206

  BotLabel

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text: Waypoints

  ComboBox

    id: config

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-top: 5

    text-offset: 3 0

    width: 130

  Button

    id: enableButton

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 5

  Button

    margin-top: 1

    id: add

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Add

    width: 60

    height: 17

  Button

    id: edit

    anchors.top: prev.top

    anchors.horizontalCenter: parent.horizontalCenter

    text: Edit

    width: 60

    height: 17

  Button

    id: remove

    anchors.top: prev.top

    anchors.right: parent.right

    text: Remove

    width: 60

    height: 17

  TextList

    id: list

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    vertical-scrollbar: listScrollbar

    margin-right: 15

    margin-top: 2

    height: 60

    focusable: false

    auto-focus: first

  VerticalScrollBar

    id: listScrollbar

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.right: parent.right

    pixels-scroll: true

    step: 5

  Label

    id: pos

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: center

    margin-top: 2

  Button

    id: wGoto

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Goto

    width: 61

    margin-top: 1

    height: 17

  Button

    id: wUse

    anchors.top: prev.top

    anchors.left: prev.right

    text: Use

    width: 61

    height: 17

  Button

    id: wUseWith

    anchors.top: prev.top

    anchors.left: prev.right

    text: UseWith

    width: 61

    height: 17

  Button

    id: wWait

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Wait

    width: 61

    margin-top: 1

    height: 17

  Button

    id: wSay

    anchors.top: prev.top

    anchors.left: prev.right

    text: Say

    width: 61

    height: 17

  Button

    id: wNpc

    anchors.top: prev.top

    anchors.left: prev.right

    text: Say NPC

    width: 61

    height: 17

  Button

    id: wLabel

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: Label

    width: 61

    margin-top: 1

    height: 17

  Button

    id: wFollow

    anchors.top: prev.top

    anchors.left: prev.right

    text: Follow

    width: 61

    height: 17

  Button

    id: wFunction

    anchors.top: prev.top

    anchors.left: prev.right

    text: Function

    width: 61

    height: 17

  BotSwitch

    id: recording

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    text: Auto Recording

    height: 17

]], parent)

  if type(context.storage.cavebot) ~= "table" then

    context.storage.cavebot = {}

  end

  if type(context.storage.cavebot.configs) ~= "table" then

    context.storage.cavebot.configs = {}

  end

  local getConfigName = function(config)

    local matches = regexMatch(config, [[name:\s*([^\n]*)$]])

    if matches[1] and matches[1][2] then

      return matches[1][2]:trim()

    end

    return nil

  end

  local isValidCommand = function(command)

    if command == "goto" then

      return true

    elseif command == "use" then

      return true

    elseif command == "usewith" then

      return true

    elseif command == "wait" then

      return true

    elseif command == "say" then

      return true

    elseif command == "npc" then

      return true

    elseif command == "follow" then

      return true

    elseif command == "label" then

      return true

    elseif command == "gotolabel" then

      return true

    elseif command == "comment" then

      return true

    elseif command == "function" then

      return true

    end

    return false

  end

  local commands = {}

  local waitTo = 0

  local autoRecording = false

  local parseConfig = function(config)

    commands = {}

    local matches = regexMatch(config, [[([^:^\n^\s]+)(:?)([^\n]*)]])

    for i=1,#matches do

      local command = matches[i][2]

      local validation = (matches[i][3] == ":")

      if not validation or isValidCommand(command) then

        local text = matches[i][4]

        if validation then

          table.insert(commands, {command=command:lower(), text=text})

        elseif #commands > 0 then

          commands[#commands].text = commands[#commands].text .. "\n" .. matches[i][1]

        end

      end

    end

    for i=1,#commands do

      local label = g_ui.createWidget("CaveBotLabel", ui.list)

      label:setText(commands[i].command .. ":" .. commands[i].text)

      if commands[i].command == "goto" then

        label:setColor("green")

      elseif commands[i].command == "label" then

        label:setColor("yellow")

      elseif commands[i].command == "comment" then

        label:setText(commands[i].text)

        label:setColor("white")

      elseif commands[i].command == "use" or commands[i].command == "usewith" then

        label:setColor("orange")

      elseif commands[i].command == "gotolabel" then

        label:setColor("red")

      end

    end

  end

  local ignoreOnOptionChange = true

  local refreshConfig = function(scrollDown)

    ignoreOnOptionChange = true

    if context.storage.cavebot.enabled then

      autoRecording = false

      ui.recording:setOn(false)

      ui.enableButton:setText("On")

      ui.enableButton:setColor('#00AA00FF')

    else

      ui.enableButton:setText("Off")

      ui.enableButton:setColor('#FF0000FF')

      ui.recording:setOn(autoRecording)

    end

    ui.config:clear()

    for i, config in ipairs(context.storage.cavebot.configs) do

      local name = getConfigName(config)

      if not name then

        name = "Unnamed config"

      end

      ui.config:addOption(name)

    end

    if (not context.storage.cavebot.activeConfig or context.storage.cavebot.activeConfig == 0) and #context.storage.cavebot.configs > 0 then

       context.storage.cavebot.activeConfig = 1

    end

    ui.list:destroyChildren()

    if context.storage.cavebot.activeConfig and context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      ui.config:setCurrentIndex(context.storage.cavebot.activeConfig)

      parseConfig(context.storage.cavebot.configs[context.storage.cavebot.activeConfig])

    end

    context.saveConfig()

    if scrollDown and ui.list:getLastChild() then

      ui.list:focusChild(ui.list:getLastChild())

    end

    waitTo = 0

    ignoreOnOptionChange = false

  end

  ui.config.onOptionChange = function(widget)

    if not ignoreOnOptionChange then

      context.storage.cavebot.activeConfig = widget.currentIndex

      refreshConfig()

    end

  end

  ui.enableButton.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    context.storage.cavebot.enabled = not context.storage.cavebot.enabled

    if autoRecording then

      refreshConfig()

    elseif context.storage.cavebot.enabled then

      ui.enableButton:setText("On")

      ui.enableButton:setColor('#00AA00FF')

    else

      ui.enableButton:setText("Off")

      ui.enableButton:setColor('#FF0000FF')

    end

  end

  ui.add.onClick = function()

    modules.client_textedit.multilineEditor("Waypoints editor", "name:Config name\nlabel:start\n", function(newText)

      table.insert(context.storage.cavebot.configs, newText)

      context.storage.cavebot.activeConfig = #context.storage.cavebot.configs

      refreshConfig()

    end)

  end

  ui.edit.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    modules.client_textedit.multilineEditor("Waypoints editor", context.storage.cavebot.configs[context.storage.cavebot.activeConfig], function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = newText

      refreshConfig()

    end)

  end

  ui.remove.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    local questionWindow = nil

    local closeWindow = function()

      questionWindow:destroy()

    end

    local removeConfig = function()

      closeWindow()

      if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

        return

      end

      context.storage.cavebot.enabled = false

      table.remove(context.storage.cavebot.configs, context.storage.cavebot.activeConfig)

      context.storage.cavebot.activeConfig = 0

      refreshConfig()

    end

    questionWindow = context.displayGeneralBox(tr('Remove config'), tr('Do you want to remove current waypoints config?'), {

      { text=tr('Yes'), callback=removeConfig },

      { text=tr('No'), callback=closeWindow },

      anchor=AnchorHorizontalCenter}, removeConfig, closeWindow)

  end

  -- waypoint editor

  -- auto recording

  local stepsSincleLastPos = 0

  context.onPlayerPositionChange(function(newPos, oldPos)

    ui.pos:setText("Position: " .. newPos.x .. ", " .. newPos.y .. ", " .. newPos.z)

    if not autoRecording then

      return

    end

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    local newText = ""

    if newPos.z ~= oldPos.z then

      newText = "goto:" .. oldPos.x .. "," .. oldPos.y .. "," .. oldPos.z

      newText = newText .. "\ngoto:" .. newPos.x .. "," .. newPos.y .. "," .. newPos.z

      stepsSincleLastPos = 0

    else

      stepsSincleLastPos = stepsSincleLastPos + 1

      if stepsSincleLastPos > 10 then

        newText = "goto:" .. oldPos.x .. "," .. oldPos.y .. "," .. oldPos.z

        stepsSincleLastPos = 0

      end

    end

    if newText:len() > 0 then

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\n" .. newText

      refreshConfig(true)

    end

  end)

  context.onUse(function(pos, itemId, stackPos, subType)

    if not autoRecording then

      return

    end

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    if pos.x == 0xFFFF then

      return

    end

    stepsSincleLastPos = 0

    local playerPos = context.player:getPosition()

    newText = "goto:" .. playerPos.x .. "," .. playerPos.y .. "," .. playerPos.z .. "\nuse:" .. pos.x .. "," .. pos.y .. "," .. pos.z

    context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\n" .. newText

    refreshConfig(true)

  end)

  context.onUseWith(function(pos, itemId, target, subType)

    if not autoRecording then

      return

    end

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    if not target:isItem() then

      return

    end

    local targetPos = target:getPosition()

    if targetPos.x == 0xFFFF then

      return

    end

    stepsSincleLastPos = 0

    local playerPos = context.player:getPosition()

    newText = "goto:" .. playerPos.x .. "," .. playerPos.y .. "," .. playerPos.z .. "\nusewith:" .. itemId .. "," .. targetPos.x .. "," .. targetPos.y .. "," .. targetPos.z

    context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\n" .. newText

    refreshConfig(true)

  end)

  -- ui

  local pos = context.player:getPosition()

  ui.pos:setText("Position: " .. pos.x .. ", " .. pos.y .. ", " .. pos.z)

  ui.wGoto.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    local pos = context.player:getPosition()

    modules.client_textedit.singlelineEditor("" .. pos.x .. "," .. pos.y .. "," .. pos.z, function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\ngoto:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wUse.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    local pos = context.player:getPosition()

    modules.client_textedit.singlelineEditor("" .. pos.x .. "," .. pos.y .. "," .. pos.z, function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nuse:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wUseWith.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    local pos = context.player:getPosition()

    modules.client_textedit.singlelineEditor("ITEMID," .. pos.x .. "," .. pos.y .. "," .. pos.z, function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nusewith:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wWait.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    modules.client_textedit.singlelineEditor("1000", function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nwait:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wSay.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    modules.client_textedit.singlelineEditor("text", function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nsay:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wNpc.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    modules.client_textedit.singlelineEditor("text", function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nnpc:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wLabel.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    modules.client_textedit.singlelineEditor("label name", function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nlabel:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wFollow.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    modules.client_textedit.singlelineEditor("creature name", function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nfollow:" .. newText

      refreshConfig(true)

    end)

  end

  ui.wFunction.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    modules.client_textedit.multilineEditor("Add function", "function(waypoints)\n  -- your lua code, function is executed if previous goto was successful or is just after label\n\n  -- must return true to execute next command, otherwise will run in loop till correct return\n  return true\nend", function(newText)

      context.storage.cavebot.configs[context.storage.cavebot.activeConfig] = context.storage.cavebot.configs[context.storage.cavebot.activeConfig] .. "\nfunction:" .. newText

      refreshConfig(true)

    end)

  end

  ui.recording.onClick = function()

    if not context.storage.cavebot.activeConfig or not context.storage.cavebot.configs[context.storage.cavebot.activeConfig] then

      return

    end

    autoRecording = not autoRecording

    if autoRecording then

      context.storage.cavebot.enabled = false

      stepsSincleLastPos = 10

    end

    refreshConfig(true)

  end

  refreshConfig()

  local usedGotoLabel = false

  local executeNextMacroCall = false

  local commandExecutionNo = 0

  local lastGotoSuccesful = true

  local lastOpenedContainer = 0

  local functions = {

    enable = function()

      context.storage.cavebot.enabled = true

      refreshConfig()

    end,

    disable = function()

      context.storage.cavebot.enabled = false

      refreshConfig()

    end,

    refresh = function()

      refreshConfig()

    end,

    wait = function(peroid)

      waitTo = context.now + peroid

    end,

    waitTo = function(timepoint)

      waitTo = timepoint

    end,

    gotoLabel = function(name)

      for i=1,ui.list:getChildCount() do

        local command = commands[i]

        if command and command.command == "label" and command.text == name then

          ui.list:focusChild(ui.list:getChildByIndex(i))

          usedGotoLabel = true

          lastGotoSuccesful = true

          return true

        end

      end

    end

}

  context.onContainerOpen(function(container)

    if container:getItemsCount() > 0 then

      lastOpenedContainer = context.now + container:getItemsCount() * 100

    end

  end)

  context.macro(250, function()

    if not context.storage.cavebot.enabled then

      return

    end

    if modules.game_walking.lastManualWalk + 500 > context.now then

      return

    end

    -- wait if walked or opened container recently

    if context.player:isWalking() or lastOpenedContainer + 1000 > context.now then

      executeNextMacroCall = false

      return

    end

    -- wait if attacking/following creature

    local attacking = g_game.getAttackingCreature()

    local following = g_game.getFollowingCreature()

    if (attacking and context.getCreatureById(attacking:getId()) and not attacking.ignoreByWaypoints) or (following and context.getCreatureById(following:getId())) then

      executeNextMacroCall = false

      return

    end

    if not executeNextMacroCall then

      executeNextMacroCall = true

      return

    end

    executeNextMacroCall = false

    local commandWidget = ui.list:getFocusedChild()

    if not commandWidget then

      if ui.list:getFirstChild() then

        ui.list:focusChild(ui.list:getFirstChild())

      end

      return

    end

    local commandIndex = ui.list:getChildIndex(commandWidget)

    local command = commands[commandIndex]

    if not command then

      if ui.list:getFirstChild() then

        ui.list:focusChild(ui.list:getFirstChild())

      end

      return

    end

    if commandIndex == 1 then

      lastGotoSuccesful = true

    end

    if command.command == "goto" or command.command == "follow" then

      local matches = regexMatch(command.text, [[([0-9]+)[^0-9]+([0-9]+)[^0-9]+([0-9]+)]])

      if (#matches == 1 and #matches[1] == 4) or command.command == "follow" then

        local position = nil

        if command.command == "follow" then

          local creature = context.getCreatureByName(command.text)

          if creature then

            position = creature:getPosition()

          end

        else

          position = {x=tonumber(matches[1][2]), y=tonumber(matches[1][3]), z=tonumber(matches[1][4])}

        end

        local distance = 0

        if position then

          distance = context.getDistanceBetween(position, context.player:getPosition())

        end

        if distance > 100 or not position or position.z ~= context.player:getPosition().z then

          lastGotoSuccesful = false

        elseif distance > 0 then

          if not context.findPath(context.player:getPosition(), position, 100, { ignoreNonPathable = true, precision = 1, ignoreCreatures = true }) then

            lastGotoSuccesful = false

            executeNextMacroCall = true

          else

            commandExecutionNo = commandExecutionNo + 1

            lastGotoSuccesful = false

            if commandExecutionNo <= 3 then -- try max 3 times

              if not context.autoWalk(position, distance * 2, { ignoreNonPathable = false }) then

                if commandExecutionNo > 1 then

                  if context.autoWalk(position, distance * 2, { ignoreNonPathable = true, precision = 1 }) then

                    context.delay(500)

                  end

                end

                return

              end

              return

            elseif commandExecutionNo == 4 then -- try last time, location close to destination

              if context.autoWalk(position, distance * 2, { ignoreNonPathable = true, ignoreLastCreature = true, precision = 2, allowUnseen = true }) then

                context.delay(500)

                return

              end

            elseif distance <= 2 then

              lastGotoSuccesful = true

              executeNextMacroCall = true

            end

          end

        else

          lastGotoSuccesful = true

          executeNextMacroCall = true

        end

      else

        context.error("Waypoints: invalid use of goto function")

      end

    elseif command.command == "use" then

      local matches = regexMatch(command.text, [[([0-9]+)[^0-9]+([0-9]+)[^0-9]+([0-9]+)]])

      if #matches == 1 and #matches[1] == 4 then

        local position = {x=tonumber(matches[1][2]), y=tonumber(matches[1][3]), z=tonumber(matches[1][4])}

        if context.player:getPosition().z == position.z then

          local tile = g_map.getTile(position)

          if tile then

            local topThing = tile:getTopUseThing()

            if topThing then

              g_game.use(topThing)

              context.delay(500)

            end

          end

        end

      else

        context.error("Waypoints: invalid use of use function")

      end

    elseif command.command == "usewith" then

      local matches = regexMatch(command.text, [[([0-9]+)[^0-9]+([0-9]+)[^0-9]+([0-9]+)[^0-9]+([0-9]+)]])

      if #matches == 1 and #matches[1] == 5 then

        local itemId = tonumber(matches[1][2])

        local position = {x=tonumber(matches[1][3]), y=tonumber(matches[1][4]), z=tonumber(matches[1][5])}

        if context.player:getPosition().z == position.z then

          local tile = g_map.getTile(position)

          if tile then

            local topThing = tile:getTopUseThing()

            if topThing then

              context.useWith(itemId, topThing)

              context.delay(500)

            end

          end

        end

      else

        context.error("Waypoints: invalid use of usewith function")

      end

    elseif command.command == "wait" and lastGotoSuccesful then

      if not waitTo or waitTo == 0 then

        waitTo = context.now + tonumber(command.text)

      end

      if context.now < waitTo then

        return

      end

      waitTo = 0

    elseif command.command == "say" and lastGotoSuccesful then

      context.say(command.text)

    elseif command.command == "npc" and lastGotoSuccesful then

      context.sayNpc(command.text)

    elseif command.command == "function" and lastGotoSuccesful then

      usedGotoLabel = false

      local status, result = pcall(function()

        return assert(load("return " .. command.text, nil, nil, context))()(functions)

      end)

      if not status then

        context.error("Waypoints function execution error:\n" .. result)

        context.delay(2500)

      end

      if not result or usedGotoLabel then

        return

      end

    elseif command.command == "gotolabel" then

      if functions.gotoLabel(command.text) then

        return

      end

    end

    local nextIndex = 1 + commandIndex % #commands

    local nextChild = ui.list:getChildByIndex(nextIndex)

    if nextChild then

      ui.list:focusChild(nextChild)

      commandExecutionNo = 0

    end

  end)

  return functions

end

```

---


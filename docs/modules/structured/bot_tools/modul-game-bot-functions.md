{% raw %}
# Moduł: | Moduł: `game_bot/functions`
```lua

local context = G.botContext

-- callback(callbackType, callback)

context.callback = function(callbackType, callback)

  if not context._callbacks[callbackType] then

    return error("Wrong callback type: " .. callbackType)

  end

  if callbackType == "onAddThing" or callbackType == "onRemoveThing" then

    g_game.enableTileThingLuaCallback(true)

  end

  local desc = "lua"

  local info = debug.getinfo(2, "Sl")

  if info then

    desc = info.short_src .. ":" .. info.currentline

  end

  local callbackData = {}

  table.insert(context._callbacks[callbackType], function(...)

    if not callbackData.delay or callbackData.delay < context.now then

      local prevExecution = context._currentExecution

      context._currentExecution = callbackData

      local start = g_clock.realMillis()

      callback(...)

      local executionTime = g_clock.realMillis() - start

      if executionTime > 100 then

        context.warning("Slow " .. callbackType .. " (" .. executionTime .. "ms): " .. desc)

      end

      context._currentExecution = prevExecution

    end

  end)

  local cb = context._callbacks[callbackType]

  return {

    remove = function()

      local index = nil

      for i, cb2 in ipairs(context._callbacks[callbackType]) do

        if cb == cb2 then

          index = i

        end

      end

      if index then

        table.remove(context._callbacks[callbackType], index)

      end

    end

}

end

-- onKeyDown(callback) -- callback = function(keys)

context.onKeyDown = function(callback)

  return context.callback("onKeyDown", callback)

end

-- onKeyPress(callback) -- callback = function(keys)

context.onKeyPress = function(callback)

  return context.callback("onKeyPress", callback)

end

-- onKeyUp(callback) -- callback = function(keys)

context.onKeyUp = function(callback)

  return context.callback("onKeyUp", callback)

end

-- onTalk(callback) -- callback = function(name, level, mode, text, channelId, pos)

context.onTalk = function(callback)

  return context.callback("onTalk", callback)

end

-- onTextMessage(callback) -- callback = function(mode, text)

context.onTextMessage = function(callback)

  return context.callback("onTextMessage", callback)

end

-- onLoginAdvice(callback) -- callback = function(message)

context.onLoginAdvice = function(callback)

  return context.callback("onLoginAdvice", callback)

end

-- onAddThing(callback) -- callback = function(tile, thing)

context.onAddThing = function(callback)

  return context.callback("onAddThing", callback)

end

-- onRemoveThing(callback) -- callback = function(tile, thing)

context.onRemoveThing = function(callback)

  return context.callback("onRemoveThing", callback)

end

-- onCreatureAppear(callback) -- callback = function(creature)

context.onCreatureAppear = function(callback)

  return context.callback("onCreatureAppear", callback)

end

-- onCreatureDisappear(callback) -- callback = function(creature)

context.onCreatureDisappear = function(callback)

  return context.callback("onCreatureDisappear", callback)

end

-- onCreaturePositionChange(callback) -- callback = function(creature, newPos, oldPos)

context.onCreaturePositionChange = function(callback)

  return context.callback("onCreaturePositionChange", callback)

end

-- onCreatureHealthPercentChange(callback) -- callback = function(creature, healthPercent)

context.onCreatureHealthPercentChange = function(callback)

  return context.callback("onCreatureHealthPercentChange", callback)

end

-- onUse(callback) -- callback = function(pos, itemId, stackPos, subType)

context.onUse = function(callback)

  return context.callback("onUse", callback)

end

-- onUseWith(callback) -- callback = function(pos, itemId, target, subType)

context.onUseWith = function(callback)

  return context.callback("onUseWith", callback)

end

-- onContainerOpen -- callback = function(container, previousContainer)

context.onContainerOpen = function(callback)

  return context.callback("onContainerOpen", callback)

end

-- onContainerClose -- callback = function(container)

context.onContainerClose = function(callback)

  return context.callback("onContainerClose", callback)

end

-- onContainerUpdateItem -- callback = function(container, slot, item, oldItem)

context.onContainerUpdateItem = function(callback)

  return context.callback("onContainerUpdateItem", callback)

end

-- onMissle -- callback = function(missle)

context.onMissle = function(callback)

  return context.callback("onMissle", callback)

end

-- onAnimatedText -- callback = function(thing, text)

context.onAnimatedText = function(callback)

  return context.callback("onAnimatedText", callback)

end

-- onStaticText -- callback = function(thing, text)

context.onStaticText = function(callback)

  return context.callback("onStaticText", callback)

end

-- onChannelList -- callback = function(channels)

context.onChannelList = function(callback)

  return context.callback("onChannelList", callback)

end

-- onOpenChannel -- callback = function(channelId, name)

context.onOpenChannel = function(callback)

  return context.callback("onOpenChannel", callback)

end

-- onCloseChannel -- callback = function(channelId)

context.onCloseChannel = function(callback)

  return context.callback("onCloseChannel", callback)

end

-- onChannelEvent -- callback = function(channelId, name, event)

context.onChannelEvent = function(callback)

  return context.callback("onChannelEvent", callback)

end

-- onTurn -- callback = function(creature, direction)

context.onTurn = function(callback)

  return context.callback("onTurn", callback)

end

-- onWalk -- callback = function(creature, oldPos, newPos)

context.onWalk = function(callback)

  return context.callback("onWalk", callback)

end

-- onImbuementWindow -- callback = function(itemId, slots, activeSlots, imbuements, needItems)

context.onImbuementWindow = function(callback)

  return context.callback("onImbuementWindow", callback)

end

-- onModalDialog -- callback = function(id, title, message, buttons, enterButton, escapeButton, choices, priority) -- priority is unused, ignore it

context.onModalDialog = function(callback)

  return context.callback("onModalDialog", callback)

end

-- onAttackingCreatureChange -- callback = function(creature, oldCreature)

context.onAttackingCreatureChange = function(callback)

  return context.callback("onAttackingCreatureChange", callback)

end

-- onManaChange -- callback = function(player, mana, maxMana, oldMana, oldMaxMana)

context.onManaChange = function(callback)

  return context.callback("onManaChange", callback)

end

-- onAddItem - callback = function(container, slot, item, oldItem)

context.onAddItem = function(callback)

  return context.callback("onAddItem", callback)

end

-- onRemoveItem - callback = function(container, slot, item)

context.onRemoveItem = function(callback)

  return context.callback("onRemoveItem", callback)

end

-- onStatesChange - callback = function(player, states, oldStates)

context.onStatesChange = function(callback)

  return context.callback("onStatesChange", callback)

end

-- onGameEditText - callback = function(id, itemId, maxLength, text, writer, time)

context.onGameEditText = function(callback)

  return context.callback("onGameEditText", callback)

end

-- onSpellCooldown - callback = function(iconId, duration)

context.onSpellCooldown = function(callback)

  return context.callback("onSpellCooldown", callback)

end

-- onGroupSpellCooldown - callback = function(iconId, duration)

context.onGroupSpellCooldown = function(callback)

  return context.callback("onGroupSpellCooldown", callback)

end

-- onInventoryChange - callback = function(player, slot, item, oldItem)

context.onInventoryChange = function(callback)

  return context.callback("onInventoryChange", callback)

end

-- CUSTOM CALLBACKS

-- listen(name, callback) -- callback = function(text, channelId, pos)

context.listen = function(name, callback)

  if not name then return context.error("listen: invalid name") end

  name = name:lower()

  return context.onTalk(function(name2, level, mode, text, channelId, pos)

    if name == name2:lower() then

      callback(text, channelId, pos)

    end

  end)

end

-- onPlayerPositionChange(callback) -- callback = function(newPos, oldPos)

context.onPlayerPositionChange = function(callback)

  return context.onCreaturePositionChange(function(creature, newPos, oldPos)

    if creature == context.player then

      callback(newPos, oldPos)

    end

  end)

end

-- onPlayerHealthChange(callback) -- callback = function(healthPercent)

context.onPlayerHealthChange = function(callback)

  return context.onCreatureHealthPercentChange(function(creature, healthPercent)

    if creature == context.player then

      callback(healthPercent)

    end

  end)

end

-- onPlayerInventoryChange -- callback = function(slot, item, oldItem)

context.onPlayerInventoryChange = function(callback)

  return context.onInventoryChange(function(player, slot, item, oldItem)

    if player == context.player then

      callback(slot, item, oldItem)

    end

  end)

end

```

---
# config.lua
```lua

--[[

Config - create, load and save config file (.json / .cfg)

Used by cavebot and other things

]]--

local context = G.botContext

context.Config = {}

local Config = context.Config

Config.exist = function(dir)

  return g_resources.directoryExists(context.configDir .. "/" .. dir)

end

Config.create = function(dir)

  g_resources.makeDir(context.configDir .. "/" .. dir)

  return Config.exist(dir)

end

Config.list = function(dir)

  if not Config.exist(dir) then

    if not Config.create(dir) then

      return contex.error("Can't create config dir: " .. context.configDir .. "/" .. dir)

    end

  end

  local list = g_resources.listDirectoryFiles(context.configDir .. "/" .. dir)

  local correctList = {}

  for k,v in ipairs(list) do -- filter files

    local nv = v:gsub(".json", ""):gsub(".cfg", "")

    if nv ~= v then

      table.insert(correctList, nv)

    end

  end

  return correctList

end

-- load config from string insteaf of file

Config.parse = function(data)

  local status, result = pcall(function()

    if data:len() < 2 then return {} end

    return json.decode(data)

  end)

  if status and type(result) == 'table' then

    return result

  end

  local status, result = pcall(function()

    return table.decodeStringPairList(data)

  end)

  if status and type(result) == 'table' then

    return result

  end

  return context.error("Invalid config format")

end

Config.load = function(dir, name)

  local file = context.configDir .. "/" .. dir .. "/" .. name .. ".json"

  if g_resources.fileExists(file) then -- load json

      local status, result = pcall(function()

        local data = g_resources.readFileContents(file)

        if data:len() < 2 then return {} end

        return json.decode(data)

      end)

      if not status then

        context.error("Invalid json config (" .. name .. "): " .. result)

        return {}

      end

      return result

  end

  file = context.configDir .. "/" .. dir .. "/" .. name .. ".cfg"

  if g_resources.fileExists(file) then -- load cfg

    local status, result = pcall(function()

      return table.decodeStringPairList(g_resources.readFileContents(file))

    end)

    if not status then

      context.error("Invalid cfg config (" .. name .. "): " .. result)

      return {}

    end

    return result

  end

  return context.error("Config " .. file .. " doesn't exist")

end

Config.loadRaw = function(dir, name)

  local file = context.configDir .. "/" .. dir .. "/" .. name .. ".json"

  if g_resources.fileExists(file) then -- load json

    return g_resources.readFileContents(file)

  end

  file = context.configDir .. "/" .. dir .. "/" .. name .. ".cfg"

  if g_resources.fileExists(file) then -- load cfg

    return g_resources.readFileContents(file)

  end

  return context.error("Config " .. file .. " doesn't exist")

end

Config.save = function(dir, name, value, forcedExtension)

  if not Config.exist(dir) then

    if not Config.create(dir) then

      return contex.error("Can't create config dir: " .. context.configDir .. "/" .. dir)

    end

  end

  if type(value) ~= 'table' then

    return context.error("Invalid config value type: " .. type(value) .. ", should be table")

  end

  local file = context.configDir .. "/" .. dir .. "/" .. name

  if (table.isStringPairList(value) and forcedExtension ~= "json") or forcedExtension == "cfg" then -- cfg

    g_resources.writeFileContents(file .. ".cfg", table.encodeStringPairList(value))

  else

    g_resources.writeFileContents(file .. ".json", json.encode(value, 2))

  end

  return true

end

Config.remove = function(dir, name)

  local file = context.configDir .. "/" .. dir .. "/" .. name .. ".json"

  local ret = false

  if g_resources.fileExists(file) then

    g_resources.deleteFile(file)

    ret = true

  end

  file = context.configDir .. "/" .. dir .. "/" .. name .. ".cfg"

  if g_resources.fileExists(file) then

    g_resources.deleteFile(file)

    ret = true

  end

  return ret

end

-- setup is used for BotConfig widget

-- not done yet

Config.setup = function(dir, widget, configExtension, callback)

  if type(dir) ~= 'string' or dir:len() == 0 then

    return context.error("Invalid config dir")

  end

  if not Config.exist(dir) and not Config.create(dir) then

    return context.error("Can't create config dir: " .. dir)

  end

  if type(context.storage._configs) ~= "table" then

    context.storage._configs = {}

  end

  if type(context.storage._configs[dir]) ~= "table" then

    context.storage._configs[dir] = {

      enabled = false,

      selected = ""

}

  else

    widget.switch:setOn(context.storage._configs[dir].enabled)

  end

  local isRefreshing = false

  local refresh = function()

    isRefreshing = true

    local configs = Config.list(dir)

    local configIndex = 1

    widget.list:clear()

    for v,k in ipairs(configs) do

      widget.list:addOption(k)

      if k == context.storage._configs[dir].selected then

        configIndex = v

      end

    end

    local data = nil

    if #configs > 0 then

      widget.list:setCurrentIndex(configIndex)

      context.storage._configs[dir].selected = widget.list:getCurrentOption().text

      data = Config.load(dir, configs[configIndex])

    else

      context.storage._configs[dir].selected = nil

    end

    context.storage._configs[dir].enabled = widget.switch:isOn()

    isRefreshing = false

    callback(context.storage._configs[dir].selected, widget.switch:isOn(), data)

  end

  widget.list.onOptionChange = function(widget)

    if not isRefreshing then

      context.storage._configs[dir].selected = widget:getCurrentOption().text

      refresh()

    end

  end

  widget.switch.onClick = function()

    widget.switch:setOn(not widget.switch:isOn())

    refresh()

  end

  widget.add.onClick = function()

    context.UI.SinglelineEditorWindow("config_name", {title="Enter config name"}, function(name)

      name = name:gsub("%s+", "_")

      if name:len() == 0 or name:len() >= 30 or name:find("/") or name:find("\\") then

        return context.error("Invalid config name")

      end

      local file = context.configDir .. "/" .. dir .. "/" .. name .. "." .. configExtension

      if g_resources.fileExists(file) then

        return context.error("Config " .. name .. " already exist")

      end

      if configExtension == "json" then

        g_resources.writeFileContents(file, json.encode({}))

      else

        g_resources.writeFileContents(file, "")

      end

      context.storage._configs[dir].selected = name

      widget.switch:setOn(false)

      refresh()

    end)

  end

  widget.edit.onClick = function()

    local name = context.storage._configs[dir].selected

    if not name then return end

    context.UI.MultilineEditorWindow(Config.loadRaw(dir, name), {title="Config editor - " .. name .. " in " .. dir}, function(newValue)

        local data = Config.parse(newValue)

        Config.save(dir, name, data, configExtension)

        refresh()

      end)

  end

  widget.remove.onClick = function()

    local name = context.storage._configs[dir].selected

    if not name then return end

    context.UI.ConfirmationWindow("Config removal", "Do you want to remove config " .. name .. " from " .. dir .. "?", function()

      Config.remove(dir, name)

      widget.switch:setOn(false)

      refresh()

    end)

  end

  refresh()

  return {

    isOn = function()

      return widget.switch:isOn()

    end,

    isOff = function()

      return not widget.switch:isOn()

    end,

    setOn = function(val)

      if val == false then

        if widget.switch:isOn() then

          widget.switch:onClick()

        end

        return

      end

      if not widget.switch:isOn() then

        widget.switch:onClick()

      end

    end,

    setOff = function(val)

      if val == false then

        if not widget.switch:isOn() then

          widget.switch:onClick()

        end

        return

      end

      if widget.switch:isOn() then

        widget.switch:onClick()

      end

    end,

    save = function(data)

      Config.save(dir, context.storage._configs[dir].selected, data, configExtension)

    end,

    refresh = refresh,

    reload = refresh,

    getActiveConfigName = function()

      return context.storage._configs[dir].selected

    end

}

end

```

---
# const.lua
```lua

local context = G.botContext

context.North = 0

context.East = 1

context.South = 2

context.West = 3

context.NorthEast = 4

context.SouthEast = 5

context.SouthWest = 6

context.NorthWest = 7

context.InventorySlotOther = 0

context.InventorySlotHead = 1

context.InventorySlotNeck = 2

context.InventorySlotBack = 3

context.InventorySlotBody = 4

context.InventorySlotRight = 5

context.InventorySlotLeft = 6

context.InventorySlotLeg = 7

context.InventorySlotFeet = 8

context.InventorySlotFinger = 9

context.InventorySlotAmmo = 10

context.InventorySlotPurse = 11

context.InventorySlotFirst = 1

context.InventorySlotLast = 10

```

---
# icon.lua
```lua

local context = G.botContext

local iconsWithoutPosition = 0

context.addIcon = function(id, options, callback)

--[[

  Available options:

    item: {id=2160, count=100}

    outfit: outfit table ({})

    text: string

    x: float (0.0 - 1.0)

    y: float (0.0 - 1.0)

    hotkey: string

    switchable: true / false [default: true]

    movable: true / false [default: true]

    phantom: true / false [defaule: false]

]]--

  local panel = modules.game_interface.gameMapPanel

  if type(id) ~= "string" or id:len() < 1 then

    return context.error("Invalid id for addIcon")

  end

  if options.switchable == false and type(callback) ~= 'function' then

    return context.error("Invalid callback for addIcon")

  end

  if type(context.storage._icons) ~= "table" then

    context.storage._icons = {}

  end

  if type(context.storage._icons[id]) ~= "table" then

    context.storage._icons[id] = {}

  end

  local config = context.storage._icons[id]

  local widget = g_ui.createWidget("BotIcon", panel)

  widget.botWidget = true

  widget.botIcon = true

  if type(config.x) ~= 'number' and type(config.y) ~= 'number' then

    if type(options.x) == 'number' and type(options.y) == 'number' then

      config.x = math.min(1.0, math.max(0.0, options.x))

      config.y = math.min(1.0, math.max(0.0, options.y))

    else

      config.x = 0.01 + math.floor(iconsWithoutPosition / 5) / 10

      config.y = 0.05 + (iconsWithoutPosition % 5) / 5

      iconsWithoutPosition = iconsWithoutPosition + 1

    end

  end

  if options.item then

    if type(options.item) == 'number' then

      widget.item:setItemId(options.item)

    else

      widget.item:setItemId(options.item.id)

      widget.item:setItemCount(options.item.count or 1)

      widget.item:setShowCount(false)

    end

  end

  if options.outfit then

    widget.creature:setOutfit(options.outfit)

  end

  if options.switchable == false then

    widget.status:hide()

    widget.status:setOn(true)

  else

    if config.enabled ~= true then

      config.enabled = false

    end

    widget.status:setOn(config.enabled)

  end

  if options.text then

    if options.switchable ~= false then

      widget.status:hide()

      if widget.status:isOn() then

        widget.text:setColor('green')

      else

        widget.text:setColor('red')

      end

    end

    widget.text:setText(options.text)

  end

  widget.setOn = function(val)

    widget.status:setOn(val)

    if widget.status:isOn() then

      widget.text:setColor('green')

    else

      widget.text:setColor('red')

    end

    config.enabled = widget.status:isOn()

  end

  widget.onClick = function(widget)

    if options.switchable ~= false then

      widget.setOn(not widget.status:isOn())

      if type(callback) == 'table' then

        callback.setOn(config.enabled)

        return

      end

    end

    callback(widget, widget.status:isOn())

  end

  if options.hotkey then

    widget.hotkey:setText(options.hotkey)

    context.hotkey(options.hotkey, "", function()

      widget:onClick()

    end, nil, options.switchable ~= false)

  else

    widget.hotkey:hide()

  end

  if options.movable ~= false then

    widget.onDragEnter = function(widget, mousePos)

      if not g_keyboard.isCtrlPressed() then

        return false

      end

      widget:breakAnchors()

      widget.movingReference = { x = mousePos.x - widget:getX(), y = mousePos.y - widget:getY() }

      return true

    end

    widget.onDragMove = function(widget, mousePos, moved)

      local parentRect = widget:getParent():getRect()

      local x = math.min(math.max(parentRect.x, mousePos.x - widget.movingReference.x), parentRect.x + parentRect.width - widget:getWidth())

      local y = math.min(math.max(parentRect.y - widget:getParent():getMarginTop(), mousePos.y - widget.movingReference.y), parentRect.y + parentRect.height - widget:getHeight())

      widget:move(x, y)

      return true

    end

    widget.onDragLeave = function(widget, pos)

      local parent = widget:getParent()

      local parentRect = parent:getRect()

      local x = widget:getX() - parentRect.x

      local y = widget:getY() - parentRect.y

      local width = parentRect.width - widget:getWidth()

      local height = parentRect.height - widget:getHeight()

      config.x = math.min(1, math.max(0, x / width))

      config.y = math.min(1, math.max(0, y / height))

      widget:addAnchor(AnchorHorizontalCenter, 'parent', AnchorHorizontalCenter)

      widget:addAnchor(AnchorVerticalCenter, 'parent', AnchorVerticalCenter)

      widget:setMarginTop(math.max(height * (-0.5) - parent:getMarginTop(), height * (-0.5 + config.y)))

      widget:setMarginLeft(width * (-0.5 + config.x))

      return true

    end

  end

  widget.onGeometryChange = function(widget)

    if widget:isDragging() then return end

    local parent = widget:getParent()

    local parentRect = parent:getRect()

    local width = parentRect.width - widget:getWidth()

    local height = parentRect.height - widget:getHeight()

    widget:setMarginTop(math.max(height * (-0.5) - parent:getMarginTop(), height * (-0.5 + config.y)))

    widget:setMarginLeft(width * (-0.5 + config.x))

  end

  if options.phantom ~= true then

    widget.onMouseRelease = function()

      return true

    end

  end

  if options.switchable ~= false then

    if type(callback) == 'table' then

      callback.setOn(config.enabled)

      callback.icon = widget

    else

      callback(widget, widget.status:isOn())

    end

  end

  return widget

end

```

---
# main.lua
```lua

local context = G.botContext

-- MAIN BOT FUNCTION

-- macro(timeout, callback)

-- macro(timeout, name, callback)

-- macro(timeout, name, callback, parent)

-- macro(timeout, name, hotkey, callback)

-- macro(timeout, name, hotkey, callback, parent)

context.macro = function(timeout, name, hotkey, callback, parent)

  if type(timeout) ~= 'number' or timeout < 1 then

    error("Invalid timeout for macro: " .. tostring(timeout))

  end

  if type(name) == 'function' then

    callback = name

    name = ""

    hotkey = ""

  elseif type(hotkey) == 'function' then

    parent = callback

    callback = hotkey

    hotkey = ""

  elseif type(callback) ~= 'function' then

    error("Invalid callback for macro: " .. tostring(callback))

  end

  if hotkey == nil then

    hotkey = ""

  end

  if type(name) ~= 'string' or type(hotkey) ~= 'string' then

    error("Invalid name or hotkey for macro")

  end

  if not parent then

    parent = context.panel

  end

  if hotkey:len() > 0 then

    hotkey = retranslateKeyComboDesc(hotkey)

  end

  -- min timeout is 50, to avoid lags

  if timeout < 50 then

    timeout = 50

  end

  table.insert(context._macros, {

    enabled = false,

    name = name,

    timeout = timeout,

    lastExecution = context.now + math.random(0, 100),

    hotkey = hotkey,

})

  local macro = context._macros[#context._macros]

  macro.isOn = function()

    return macro.enabled

  end

  macro.isOff = function()

    return not macro.enabled

  end

  macro.toggle = function(widget)

    if macro.isOn() then

      macro.setOff()

    else

      macro.setOn()

    end

  end

  macro.setOn = function(val)

    if val == false then

      return macro.setOff()

    end

    macro.enabled = true

    context.storage._macros[name] = true

    if macro.switch then

      macro.switch:setOn(true)

    end

    if macro.icon then

      macro.icon.setOn(true)

    end

  end

  macro.setOff = function(val)

    if val == false then

      return macro.setOn()

    end

    macro.enabled = false

    context.storage._macros[name] = false

    if macro.switch then

      macro.switch:setOn(false)

    end

    if macro.icon then

      macro.icon.setOn(false)

    end

  end

  if name:len() > 0 then

    -- creature switch

    local text = name

    if hotkey:len() > 0 then

      text = name .. " [" .. hotkey .. "]"

    end

    macro.switch = context.addSwitch("macro_" .. (#context._macros + 1), text, macro.toggle, parent)

    -- load state

    if context.storage._macros[name] == true then

      macro.setOn()

    end

  else

    macro.enabled = true -- unnamed macros are enabled by default

  end

  local desc = "lua"

  local info = debug.getinfo(2, "Sl")

  if info then

    desc = info.short_src .. ":" .. info.currentline

  end

  macro.callback = function(macro)

    if not macro.delay or macro.delay < context.now then

      context._currentExecution = macro

      local start = g_clock.realMillis()

      callback(macro)

      local executionTime = g_clock.realMillis() - start

      if executionTime > 100 then

        context.warning("Slow macro (" .. executionTime .. "ms): " .. macro.name .. " - " .. desc)

      end

      context._currentExecution = nil

      return true

    end

  end

  return macro

end

-- hotkey(keys, callback)

-- hotkey(keys, name, callback)

-- hotkey(keys, name, callback, parent)

context.hotkey = function(keys, name, callback, parent, single)

  if type(name) == 'function' then

    callback = name

    name = ""

  end

  if not parent then

    parent = context.panel

  end

  keys = retranslateKeyComboDesc(keys)

  if not keys or #keys == 0 then

    return context.error("Invalid hotkey keys " .. tostring(name))

  end

  if context._hotkeys[keys] then

    return context.error("Duplicated hotkey: " .. keys)

  end

  local switch = nil

  if name:len() > 0 then

    switch = context._addHotkeySwitch(name, keys, parent)

  end

  context._hotkeys[keys] = {

    name = name,

    lastExecution = context.now,

    switch = switch,

    single = single

}

  local desc = "lua"

  local info = debug.getinfo(2, "Sl")

  if info then

    desc = info.short_src .. ":" .. info.currentline

  end

  local hotkeyData = context._hotkeys[keys]

  hotkeyData.callback = function()

    if not hotkeyData.delay or hotkeyData.delay < context.now then

      context._currentExecution = hotkeyData

      local start = g_clock.realMillis()

      callback()

      local executionTime = g_clock.realMillis() - start

      if executionTime > 100 then

        context.warning("Slow hotkey (" .. executionTime .. "ms): " .. hotkeyData.name .. " - " .. desc)

      end

      context._currentExecution = nil

      return true

    end

  end

  return hotkeyData

end

-- singlehotkey(keys, callback)

-- singlehotkey(keys, name, callback)

-- singlehotkey(keys, name, callback, parent)

context.singlehotkey = function(keys, name, callback, parent)

  if type(name) == 'function' then

    callback = name

    name = ""

  end

  return context.hotkey(keys, name, callback, parent, true)

end

-- schedule(timeout, callback)

context.schedule = function(timeout, callback)

  local extecute_time = g_clock.millis() + timeout

  table.insert(context._scheduler, {

    execution = extecute_time,

    callback = callback

})

  table.sort(context._scheduler, function(a, b) return a.execution < b.execution end)

end

-- delay(duration) -- block execution of current macro/hotkey/callback for x milliseconds

context.delay = function(duration)

  if not context._currentExecution then

    return context.error("Invalid usage of delay function, it should be used inside callbacks")

  end

  context._currentExecution.delay = context.now + duration

end

```

---
# map.lua
```lua

local context = G.botContext

context.getMapView = function() return modules.game_interface.getMapPanel() end

context.getMapPanel = context.getMapView

context.zoomIn = function() modules.game_interface.getMapPanel():zoomIn() end

context.zoomOut = function() modules.game_interface.getMapPanel():zoomOut() end

context.getSpectators = function(param1, param2)

--[[

  if param1 is table (position) then it's used for central position, then param2 is used as param1

  if param1 is creature, then creature position and direction of creature is used, then param2 is used as param1

  if param1 is true/false then it's used for multifloor, example: getSpectators(true)

  if param1 is string then it's used for getSpectatorsByPattern

]]--

  local pos = context.player:getPosition()

  local direction = context.player:getDirection()

  if type(param1) == 'table' then

    pos = param1

    direction = 8 -- invalid direction

    param1 = param2

  end

  if type(param1) == 'userdata' then

    pos = param1:getPosition()

    direction = param1:getDirection()

    param1 = param2

  end

  if type(param1) == 'string' then

    return g_map.getSpectatorsByPattern(pos, param1, direction)

  end

  local multifloor = false

  if type(param1) == 'boolean' and param1 == true then

    multifloor = true

  end

  return g_map.getSpectators(pos, multifloor)

end

context.getCreatureById = function(id, multifloor)

  if type(id) ~= 'number' then return nil end

  if multifloor ~= true then

    multifloor = false

  end

  for i, spec in ipairs(g_map.getSpectators(context.player:getPosition(), multifloor)) do

     if spec:getId() == id then

        return spec

     end

  end

  return nil

end

context.getCreatureByName = function(name, multifloor)

  if not name then return nil end

  name = name:lower()

  if multifloor ~= true then

    multifloor = false

  end

  for i, spec in ipairs(g_map.getSpectators(context.player:getPosition(), multifloor)) do

     if spec:getName():lower() == name then

        return spec

     end

  end

  return nil

end

context.getPlayerByName = function(name, multifloor)

  if not name then return nil end

  name = name:lower()

  if multifloor ~= true then

    multifloor = false

  end

  for i, spec in ipairs(g_map.getSpectators(context.player:getPosition(), multifloor)) do

     if spec:isPlayer() and spec:getName():lower() == name then

        return spec

     end

  end

  return nil

end

context.findAllPaths = function(start, maxDist, params)

  --[[

    Available params:

      ignoreLastCreature

      ignoreCreatures

      ignoreNonPathable

      ignoreNonWalkable

      ignoreStairs

      ignoreCost

      allowUnseen

      allowOnlyVisibleTiles

      maxDistanceFrom

  ]]--

  if type(params) ~= 'table' then

    params = {}

  end

  for key, value in pairs(params) do

    if value == nil or value == false then

      params[key] = 0

    elseif value == true then

      params[key] = 1

    end

  end

  if type(params['maxDistanceFrom']) == 'table' then

    if #params['maxDistanceFrom'] == 2 then

      params['maxDistanceFrom'] = params['maxDistanceFrom'][1].x .. "," .. params['maxDistanceFrom'][1].y ..

        "," .. params['maxDistanceFrom'][1].z .. "," .. params['maxDistanceFrom'][2]

    elseif #params['maxDistanceFrom'] == 4 then

      params['maxDistanceFrom'] = params['maxDistanceFrom'][1] .. "," .. params['maxDistanceFrom'][2] ..

        "," .. params['maxDistanceFrom'][3] .. "," .. params['maxDistanceFrom'][4]

    end

  end

  return g_map.findEveryPath(start, maxDist, params)

end

context.findEveryPath = context.findAllPaths

context.translateAllPathsToPath = function(paths, destPos)

  local predirections = {}

  local directions = {}

  local destPosStr = destPos

  if type(destPos) ~= 'string' then

    destPosStr = destPos.x .. "," .. destPos.y .. "," .. destPos.z

  end

  while destPosStr:len() > 0 do

    local node = paths[destPosStr]

    if not node then

      break

    end

    if node[3] < 0 then

      break

    end

    table.insert(predirections, node[3])

    destPosStr = node[4]

  end

  -- reverse

  for i=#predirections,1,-1 do

    table.insert(directions, predirections[i])

  end

  return directions

end

context.translateEveryPathToPath = context.translateAllPathsToPath

context.findPath = function(startPos, destPos, maxDist, params)

  --[[

    Available params:

      ignoreLastCreature

      ignoreCreatures

      ignoreNonPathable

      ignoreNonWalkable

      ignoreStairs

      ignoreCost

      allowUnseen

      allowOnlyVisibleTiles

      precision

      marginMin

      marginMax

      maxDistanceFrom

  ]]--

  if not destPos or startPos.z ~= destPos.z then

    return

  end

  if type(maxDist) ~= 'number' then

    maxDist = 100

  end

  if type(params) ~= 'table' then

    params = {}

  end

  local destPosStr = destPos.x .. "," .. destPos.y .. "," .. destPos.z

  params["destination"] = destPosStr

  local paths = context.findAllPaths(startPos, maxDist, params)

  local marginMin = params.marginMin or params.minMargin

  local marginMax = params.marginMax or params.maxMargin

  if type(marginMin) == 'number' and type(marginMax) == 'number' then

    local bestCandidate = nil

    local bestCandidatePos = nil

    for x = -marginMax, marginMax do

      for y = -marginMax, marginMax do

        if math.abs(x) >= marginMin or math.abs(y) >= marginMin then

          local dest = (destPos.x + x) .. "," .. (destPos.y + y) .. "," .. destPos.z

          local node = paths[dest]

          if node and (not bestCandidate or bestCandidate[1] > node[1]) then

            bestCandidate = node

            bestCandidatePos = dest

          end

        end

      end

    end

    if bestCandidate then

      return context.translateAllPathsToPath(paths, bestCandidatePos)

    end

    return

  end

  if not paths[destPosStr] then

    local precision = params.precision

    if type(precision) == 'number' then

      for p = 1, precision do

        local bestCandidate = nil

        local bestCandidatePos = nil

        for x = -p, p do

          for y = -p, p do

            local dest = (destPos.x + x) .. "," .. (destPos.y + y) .. "," .. destPos.z

            local node = paths[dest]

            if node and (not bestCandidate or bestCandidate[1] > node[1]) then

              bestCandidate = node

              bestCandidatePos = dest

            end

          end

        end

        if bestCandidate then

          return context.translateAllPathsToPath(paths, bestCandidatePos)

        end

      end

    end

    return nil

  end

  return context.translateAllPathsToPath(paths, destPos)

end

context.getPath = context.findPath

-- also works as autoWalk(dirs) where dirs is a list eg.: {1,2,3,0,1,1,2,}

context.autoWalk = function(destination, maxDist, params)

  if type(destination) == "table" and table.isList(destination) and not maxDist and not params then

    g_game.autoWalk(destination, {x=0,y=0,z=0})

    return true

  end

  -- Available params same as for findPath

  local path = context.findPath(context.player:getPosition(), destination, maxDist, params)

  if not path then

    return false

  end

  -- autowalk without prewalk animation

  g_game.autoWalk(path, {x=0,y=0,z=0})

  return true

end

context.getTileUnderCursor = function()

  if not modules.game_interface.gameMapPanel.mousePos then return end

  return modules.game_interface.gameMapPanel:getTile(modules.game_interface.gameMapPanel.mousePos)

end

context.canShoot = function(pos, distance)

  if not distance then distance = 5 end

  local tile = g_map.getTile(pos, distance)

  if tile then

    return tile:canShoot(distance)

  end

  return false

end

context.isTrapped = function(creature)

  if not creature then

    creature = context.player

  end

  local pos = creature:getPosition()

  local dirs = {{-1,1}, {0,1}, {1,1}, {-1, 0}, {1, 0}, {-1, -1}, {0, -1}, {1, -1}}

  for i=1,#dirs do

    local tile = g_map.getTile({x=pos.x-dirs[i][1],y=pos.y-dirs[i][2],z=pos.z})

    if tile and tile:isWalkable(false) then

      return false

    end

  end

  return true

end

```

---
# npc.lua
```lua

local context = G.botContext

context.NPC = {}

context.NPC.talk = function(text)

  if g_game.getClientVersion() >= 810 then

    g_game.talkChannel(11, 0, text)

  else

    return context.say(text)

  end

end

context.NPC.say = context.NPC.talk

context.NPC.isTrading = function()

  return modules.game_npctrade.npcWindow and modules.game_npctrade.npcWindow:isVisible()

end

context.NPC.hasTrade = context.NPC.isTrading

context.NPC.hasTradeWindow = context.NPC.isTrading

context.NPC.isTradeOpen = context.NPC.isTrading

context.NPC.getSellItems = function()

  if not context.NPC.isTrading() then return {} end

  local items = {}

  for i, item in ipairs(modules.game_npctrade.tradeItems[modules.game_npctrade.SELL]) do

    table.insert(items, {

      item = item.ptr,

      id = item.ptr:getId(),

      count = item.ptr:getCount(),

      name = item.name,

      subType = item.ptr:getSubType(),

      weight = item.weight / 100,

      price = item.price

})

  end

  return items

end

context.NPC.getBuyItems = function()

  if not context.NPC.isTrading() then return {} end

  local items = {}

  for i, item in ipairs(modules.game_npctrade.tradeItems[modules.game_npctrade.BUY]) do

    table.insert(items, {

      item = item.ptr,

      id = item.ptr:getId(),

      count = item.ptr:getCount(),

      name = item.name,

      subType = item.ptr:getSubType(),

      weight = item.weight / 100,

      price = item.price

})

  end

  return items

end

context.NPC.getSellQuantity = function(item)

  if not context.NPC.isTrading() then return 0 end

  if type(item) == 'number' then

     item = Item.create(item)

  end

  return modules.game_npctrade.getSellQuantity(item)

end

context.NPC.canTradeItem = function(item)

  if not context.NPC.isTrading() then return false end

  if type(item) == 'number' then

     item = Item.create(item)

  end

  return modules.game_npctrade.canTradeItem(item)

end

context.NPC.sell = function(item, count, ignoreEquipped)

  if type(item) == 'number' then

    for i, entry in ipairs(context.NPC.getSellItems()) do

       if entry.id == item then

         item = entry.item

         break

       end

    end

    if type(item) == 'number' then

     item = Item.create(item)

    end

  end

  if count == 0 then

    count = 1

  end

  if count == nil or count == -1 then

    count = context.NPC.getSellQuantity(item)

  end

  if ignoreEquipped == nil then

    ignoreEquipped = true

  end

  g_game.sellItem(item, count, ignoreEquipped)

end

context.NPC.buy = function(item, count, ignoreCapacity, withBackpack)

  if type(item) == 'number' then

    for i, entry in ipairs(context.NPC.getBuyItems()) do

       if entry.id == item then

         item = entry.item

         break

       end

    end

    if type(item) == 'number' then

     item = Item.create(item)

    end

  end

  if count == nil or count <= 0 then

    count = 1

  end

  if ignoreCapacity == nil then

    ignoreCapacity = false

  end

  if withBackpack == nil then

    withBackpack = false

  end

  g_game.buyItem(item, count, ignoreCapacity, withBackpack)

end

context.NPC.sellAll = function()

  if not context.NPC.isTrading() then return false end

  modules.game_npctrade.sellAll()

end

context.NPC.closeTrade = function()

  modules.game_npctrade.closeNpcTrade()

end

context.NPC.close = context.NPC.closeTrade

context.NPC.finish = context.NPC.closeTrade

context.NPC.endTrade = context.NPC.closeTrade

context.NPC.finishTrade = context.NPC.closeTrade

```

---
# player.lua
```lua

local context = G.botContext

context.name = function() return context.player:getName() end

context.hp = function() return context.player:getHealth() end

context.mana = function() return context.player:getMana() end

context.hppercent = function() return context.player:getHealthPercent() end

context.manapercent = function() if context.player:getMaxMana() <= 1 then return 100 else return math.floor(context.player:getMana() * 100 / context.player:getMaxMana()) end end

context.maxhp = function() return context.player:getMaxHealth() end

context.maxmana = function() return context.player:getMaxMana() end

context.hpmax = function() return context.player:getMaxHealth() end

context.manamax = function() return context.player:getMaxMana() end

context.cap = function() return context.player:getCapacity() end

context.freecap = function() return context.player:getFreeCapacity() end

context.maxcap = function() return context.player:getTotalCapacity() end

context.capmax = function() return context.player:getTotalCapacity() end

context.exp = function() return context.player:getExperience() end

context.lvl = function() return context.player:getLevel() end

context.level = function() return context.player:getLevel() end

context.mlev = function() return context.player:getMagicLevel() end

context.magic = function() return context.player:getMagicLevel() end

context.mlevel = function() return context.player:getMagicLevel() end

context.soul = function() return context.player:getSoul() end

context.stamina = function() return context.player:getStamina() end

context.voc = function() return context.player:getVocation() end

context.vocation = function() return context.player:getVocation() end

context.bless = function() return context.player:getBlessings() end

context.blesses = function() return context.player:getBlessings() end

context.blessings = function() return context.player:getBlessings() end

context.pos = function() return context.player:getPosition() end

context.posx = function() return context.player:getPosition().x end

context.posy = function() return context.player:getPosition().y end

context.posz = function() return context.player:getPosition().z end

context.direction = function() return context.player:getDirection() end

context.speed = function() return context.player:getSpeed() end

context.skull = function() return context.player:getSkull() end

context.outfit = function() return context.player:getOutfit() end

context.setOutfit = function(outfit)

  modules.game_outfit.ignoreNextOutfitWindow = g_clock.millis()

  g_game.requestOutfit()

  context.schedule(100, function()

    g_game.changeOutfit(outfit)

  end)

end

context.changeOutfit = context.setOutfit

context.setSpeed = function(value) context.player:setSpeed(value) end

context.walk = function(dir) return modules.game_walking.walk(dir) end

context.turn = function(dir) return g_game.turn(dir) end

-- game releated

context.getChannels = function()

  -- return { channelId = channelName }

  return modules.game_console.channels

end

context.getChannelId = function(name)

  for id, channel in pairs(context.getChannels()) do

    if name:lower() == channel:lower() then

      return id

    end

  end

  return nil

end

context.getChannel = context.getChannelId

context.say = g_game.talk

context.talk = g_game.talk

context.yell = function(text) g_game.talkChannel(3, 0, text) end

context.talkChannel = function(channel, text) g_game.talkChannel(7, channel, text) end

context.sayChannel = context.talkChannel

context.talkPrivate = function(receiver, text) g_game.talkPrivate(5, receiver, text) end

context.sayPrivate = context.talkPrivate

context.talkNpc = function(text)

  if g_game.getClientVersion() >= 810 then

    g_game.talkChannel(11, 0, text)

  else

    return context.say(text)

  end

end

context.sayNpc = context.talkNpc

context.sayNPC = context.talkNpc

context.talkNPC = context.talkNpc

context.saySpell = function(text, lastSpellTimeout)

  if not text or text:len() < 1 then

    return

  end

  if context.lastSpell == nil then

    context.lastSpell = 0

  end

  if not lastSpellTimeout then

    lastSpellTimeout = 1000

  end

  if context.lastSpell + lastSpellTimeout > context.now then

    return false

  end

  context.say(text)

  context.lastSpell = context.now

  return true

end

context.setSpellTimeout = function()

  context.lastSpell = context.now

end

context.use = function(thing, subtype)

  if type(thing) == 'number' then

    return g_game.useInventoryItem(thing, subtype)

  else

    return g_game.use(thing)

  end

end

context.usewith = function(thing, target, subtype)

  if type(thing) == 'number' then

    return g_game.useInventoryItemWith(thing, target, subtype)

  else

    return g_game.useWith(thing, target, subtype)

  end

end

context.useWith = context.usewith

context.useRune = function(itemid, target, lastSpellTimeout)

  if context.lastRuneUse == nil then

    context.lastRuneUse = 0

  end

  if not lastRuneTimeout then

    lastRuneTimeout = 1000

  end

  if context.lastRuneUse + lastRuneTimeout > context.now then

    return false

  end

  context.usewith(itemid, target)

  context.lastRuneUse = context.now

  return true

end

context.userune = context.useRune

context.findItem = function(itemId, subType)

  if subType == nil then

    subType = -1

  end

  return g_game.findItemInContainers(itemId, subType)

end

context.attack = g_game.attack

context.cancelAttack = g_game.cancelAttack

context.follow = g_game.follow

context.cancelFollow = g_game.cancelFollow

context.cancelAttackAndFollow = g_game.cancelAttackAndFollow

context.logout = g_game.forceLogout

context.safeLogout = g_game.safeLogout

context.ping = g_game.getPing

modules.game_cooldown.isGroupCooldownIconActive(id)

modules.game_cooldown.isCooldownIconActive(id)

```

---
# player_conditions.lua
```lua

local context = G.botContext

for i, state in ipairs(PlayerStates) do

  context[state] = state

end

context.hasCondition = function(condition) return bit.band(context.player:getStates(), condition) > 0 end

context.isPoisioned = function() return context.hasCondition(PlayerStates.Poison) end

context.isBurning = function() return context.hasCondition(PlayerStates.Burn) end

context.isEnergized = function() return context.hasCondition(PlayerStates.Energy) end

context.isDrunk = function() return context.hasCondition(PlayerStates.Drunk) end

context.hasManaShield = function() return context.hasCondition(PlayerStates.ManaShield) end

context.isParalyzed = function() return context.hasCondition(PlayerStates.Paralyze) end

context.hasHaste = function() return context.hasCondition(PlayerStates.Haste) end

context.hasSwords = function() return context.hasCondition(PlayerStates.Swords) end

context.isInFight = function() return context.hasCondition(PlayerStates.Swords) end

context.canLogout = function() return not context.hasCondition(PlayerStates.Swords) end

context.isDrowning = function() return context.hasCondition(PlayerStates.Drowning) end

context.isFreezing = function() return context.hasCondition(PlayerStates.Freezing) end

context.isDazzled = function() return context.hasCondition(PlayerStates.Dazzled) end

context.isCursed = function() return context.hasCondition(PlayerStates.Cursed) end

context.hasPartyBuff = function() return context.hasCondition(PlayerStates.PartyBuff) end

context.hasPzLock = function() return context.hasCondition(PlayerStates.PzBlock) end

context.hasPzBlock = function() return context.hasCondition(PlayerStates.PzBlock) end

context.isPzLocked = function() return context.hasCondition(PlayerStates.PzBlock) end

context.isPzBlocked = function() return context.hasCondition(PlayerStates.PzBlock) end

context.isInProtectionZone = function() return context.hasCondition(PlayerStates.Pz) end

context.hasPz = function() return context.hasCondition(PlayerStates.Pz) end

context.isInPz = function() return context.hasCondition(PlayerStates.Pz) end

context.isBleeding = function() return context.hasCondition(PlayerStates.Bleeding) end

context.isHungry = function() return context.hasCondition(PlayerStates.Hungry) end

```

---
# player_inventory.lua
```lua

local context = G.botContext

context.SlotOther = InventorySlotOther

context.SlotHead = InventorySlotHead

context.SlotNeck = InventorySlotNeck

context.SlotBack = InventorySlotBack

context.SlotBody = InventorySlotBody

context.SlotRight = InventorySlotRight

context.SlotLeft = InventorySlotLeft

context.SlotLeg = InventorySlotLeg

context.SlotFeet = InventorySlotFeet

context.SlotFinger = InventorySlotFinger

context.SlotAmmo = InventorySlotAmmo

context.SlotPurse = InventorySlotPurse

context.getInventoryItem = function(slot) return context.player:getInventoryItem(slot) end

context.getSlot = context.getInventoryItem

context.getHead = function() return context.getInventoryItem(context.SlotHead) end

context.getNeck = function() return context.getInventoryItem(context.SlotNeck) end

context.getBack = function() return context.getInventoryItem(context.SlotBack) end

context.getBody = function() return context.getInventoryItem(context.SlotBody) end

context.getRight = function() return context.getInventoryItem(context.SlotRight) end

context.getLeft = function() return context.getInventoryItem(context.SlotLeft) end

context.getLeg = function() return context.getInventoryItem(context.SlotLeg) end

context.getFeet = function() return context.getInventoryItem(context.SlotFeet) end

context.getFinger = function() return context.getInventoryItem(context.SlotFinger) end

context.getAmmo = function() return context.getInventoryItem(context.SlotAmmo) end

context.getPurse = function() return context.getInventoryItem(context.SlotPurse) end

context.getContainers = function() return g_game.getContainers() end

context.getContainer = function(index) return g_game.getContainer(index) end

context.moveToSlot = function(item, slot, count)

  if type(item) == 'number' then

    item = context.findItem(item)

  end

  if not item then

    return

  end

  if count == nil then

    count = item:getCount()

  end

  return g_game.move(item, {x=65535, y=slot, z=0}, count)

end

```

---
# script_loader.lua
```lua

local context = G.botContext

context.loadScript = function(path, onLoadCallback)

  if type(path) ~= 'string' then

    return context.error("Invalid path for loadScript: " .. tostring(path))

  end

  if path:lower():find("http") == 1 then

    return context.loadRemoteScript(path)

  end

  if not g_resources.fileExists(path) then

    return context.error("File " .. path .. " doesn't exist")

  end

  local status, result = pcall(function()

    assert(load(g_resources.readFileContents(path), path, nil, context))()

  end)

  if not status then

    return context.error("Error while loading script from: " .. path .. ":\n" .. result)

  end

  if onLoadCallback then

    onLoadCallback()

  end

end

context.loadRemoteScript = function(url, onLoadCallback)

  if type(url) ~= 'string' or url:lower():find("http") ~= 1 then

    return context.error("Invalid url for loadRemoteScript: " .. tostring(url))

  end

  HTTP.get(url, function(data, err)

    if err or data:len() == 0 then

      -- try to load from cache

      if type(context.storage.scriptsCache) ~= 'table' then

        context.storage.scriptsCache = {}

      end

      local cache = context.storage.scriptsCache[url]

      if cache and type(cache) == 'string' and cache:len() > 0 then

        data = cache

      else

        return context.error("Can't load script from: " .. url .. ", error: " .. err)

      end

    end

    local status, result = pcall(function()

      assert(load(data, url, nil, context))()

    end)

    if not status then

      return context.error("Error while loading script from: " .. url .. ":\n" .. result)

    end

    -- cache script

    if type(context.storage.scriptsCache) ~= 'table' then

      context.storage.scriptsCache = {}

    end

    context.storage.scriptsCache[url] = data

    if onLoadCallback then

      onLoadCallback()

    end

  end)

end

```

---
# server.lua
```lua

local context = G.botContext

context.BotServer = {}

context.BotServer.url = "ws://bot.otclient.ovh:8000/"

context.BotServer.timeout = 3

context.BotServer.ping = 0

context.BotServer._callbacks = {}

context.BotServer._lastMessageId = 0

context.BotServer._wasConnected = true -- show first warning

context.BotServer.init = function(name, channel)

  if not channel or not name or channel:len() < 1 or name:len() < 1 then

    return context.error("Invalid params for BotServer.init")

  end

  if context.BotServer._websocket then

    return context.error("BotServer is already initialized")

  end

  context.BotServer._websocket = HTTP.WebSocketJSON(context.BotServer.url, {

    onMessage = function(message, socketId)

      if not context._websockets[socketId] then

        return g_http.cancel(socketId)

      end

      if not context.BotServer._websocket or context.BotServer._websocket.id ~= socketId then

        return g_http.cancel(socketId)

      end

      context.BotServer._wasConnected = true

      if message["type"] == "ping" then

        context.BotServer.ping = message["ping"]

        return context.BotServer._websocket.send({type="ping"})

      end

      if message["type"] == "message" then

        context.BotServer._lastMessageId = message["id"]

        local topics = context.BotServer._callbacks[message["topic"]]

        if topics then

          for i=1,#topics do

            topics[i](message["name"], message["message"], message["topic"])

          end

        end

        topics = context.BotServer._callbacks["*"]

        if topics then

          for i=1,#topics do

            topics[i](message["name"], message["message"], message["topic"])

          end

        end

        return

      end

    end,

    onClose = function(message, socketId)

      if not context._websockets[socketId] then

        return

      end

      context._websockets[socketId] = nil

      if not context.BotServer._websocket or context.BotServer._websocket.id ~= socketId then

        return

      end

      if context.BotServer._wasConnected then

        context.warn("BotServer disconnected")

      end

      context.BotServer._wasConnected = false

      context.BotServer._websocket = nil

      context.BotServer.ping = 0

      context.BotServer.init(name, channel)

    end

  }, context.BotServer.timeout)

  context._websockets[context.BotServer._websocket.id] = 1

  context.BotServer._websocket.send({type="init", name=name, channel=channel, lastMessage=context.BotServer._lastMessageId})

end

context.BotServer.terminate = function()

  if context.BotServer._websocket then

    context.BotServer._websocket:close()

    context.BotServer._websocket = nil

  end

end

context.BotServer.listen = function(topic, callback) -- callback = function(name, message, topic) -- message is parsed json = table

  if not context.BotServer._websocket then

    return context.error("BotServer is not initialized")

  end

  if not context.BotServer._callbacks[topic] then

    context.BotServer._callbacks[topic] = {}

  end

  table.insert(context.BotServer._callbacks[topic], callback)

end

context.BotServer.send = function(topic, message)

  if not context.BotServer._websocket then

    return context.error("BotServer is not initialized")

  end

  context.BotServer._websocket.send({type="message", topic=topic, message=message})

end

```

---
# sound.lua
```lua

local context = G.botContext

context.getSoundChannel = function()

  if not g_sounds then

    return

  end

  return g_sounds.getChannel(SoundChannels.Bot)

end

context.playSound = function(file)

  local botSoundChannel = context.getSoundChannel()

  if not botSoundChannel then

    return

  end

  botSoundChannel:setEnabled(true)

  botSoundChannel:stop(0)

  botSoundChannel:play(file, 0, 1.0)

  return botSoundChannel

end

context.stopSound = function()

  local botSoundChannel = context.getSoundChannel()

  if not botSoundChannel then

    return

  end

  botSoundChannel:stop()

end

context.playAlarm = function()

  return context.playSound("/sounds/alarm.ogg")

end

```

---
# test.lua
```lua

local context = G.botContext

context.test = function() return context.info("test") end

```

---
# tools.lua
```lua

local context = G.botContext

context.encode = function(data, indent) return json.encode(data, indent or 2) end

context.decode = function(text) local status, result = pcall(function() return json.decode(text) end) if status then return result end return {} end

context.displayGeneralBox = function(title, message, buttons, onEnterCallback, onEscapeCallback)

  local box = displayGeneralBox(title, message, buttons, onEnterCallback, onEscapeCallback)

  box.botWidget = true

  return box

end

context.doScreenshot = function(filename)

  g_app.doScreenshot(filename)

end

context.screenshot = context.doScreenshot

context.getVersion = function()

  return g_app.getVersion()

end

```

---
# ui.lua
```lua

local context = G.botContext

if type(context.UI) ~= "table" then

  context.UI = {}

end

local UI = context.UI

UI.createWidget = function(name, parent)

  if parent == nil then

    parent = context.panel

  end

  local widget = g_ui.createWidget(name, parent)

  widget.botWidget = true

  return widget

end

UI.createMiniWindow = function(name, parent)

  if parent == nil then

    parent = modules.game_interface.getRightPanel()

  end

  local widget = g_ui.createWidget(name, parent)

  widget:setup()

  widget.botWidget = true

  return widget

end

UI.createWindow = function(name)

  local widget = g_ui.createWidget(name, g_ui.getRootWidget())

  widget.botWidget = true

  widget:show()

  widget:raise()

  widget:focus()

  return widget

end

```

---
# ui_elements.lua
```lua

local context = G.botContext

if type(context.UI) ~= "table" then

  context.UI = {}

end

local UI = context.UI

UI.Button = function(text, callback, parent)

  local widget = UI.createWidget("BotButton", parent)

  widget:setText(text)

  widget.onClick = callback

  return widget

end

UI.Config = function(parent)

  return UI.createWidget("BotConfig", parent)

end

-- call :setItems(table) to set items, call :getItems() to get them

-- unique if true, won't allow duplicates

-- callback (can be nil) gets table with new item list, eg: {{id=2160, count=1}, {id=268, count=100}, {id=269, count=20}}

UI.Container = function(callback, unique, parent, widget)

  if not widget then

    widget = UI.createWidget("BotContainer", parent)

  end

  local oldItems = {}

  local updateItems = function()

    local items = widget:getItems()

    -- callback part

    local somethingNew = (#items ~= #oldItems)

    for i, item in ipairs(items) do

      if type(oldItems[i]) ~= "table" then

        somethingNew = true

        break

      end

      if oldItems[i].id ~= item.id or oldItems[i].count ~= item.count then

        somethingNew = true

        break

      end

    end

    if somethingNew then

      oldItems = items

      callback(widget, items)

    end

    widget:setItems(items)

  end

  widget.setItems = function(self, items)

    if type(self) == 'table' then

      items = self

    end

    local itemsToShow = math.max(10, #items + 2)

    if itemsToShow % 5 ~= 0 then

      itemsToShow = itemsToShow + 5 - itemsToShow % 5

    end

    widget.items:destroyChildren()

    for i = 1, itemsToShow do

      local widget = g_ui.createWidget("BotItem", widget.items)

      if type(items[i]) == 'number' then

        items[i] = {id=items[i], count=1}

      end

      if type(items[i]) == 'table' then

        widget:setItem(Item.create(items[i].id, items[i].count))

      end

    end

    oldItems = items

    for i, child in ipairs(widget.items:getChildren()) do

      child.onItemChange = updateItems

    end

  end

  widget.getItems = function()

    local items = {}

    local duplicates = {}

    for i, child in ipairs(widget.items:getChildren()) do

      if child:getItemId() >= 100 then

        if not duplicates[child:getItemId()] or not unique then

          table.insert(items, {id=child:getItemId(), count=child:getItemCountOrSubType()})

          duplicates[child:getItemId()] = true

        end

      end

    end

    return items

  end

  widget:setItems({})

  return widget

end

UI.DualScrollPanel = function(params, callback, parent) -- callback = function(widget, newParams)

  --[[ params:

    on - bool,

    text - string,

    title - string,

    min - number,

    max - number,

]]

  params.title = params.title or "title"

  params.text = params.text or ""

  params.min = params.min or 20

  params.max = params.max or 80

  local widget = UI.createWidget('DualScrollPanel', parent)

  widget.title:setOn(params.on)

  widget.title.onClick = function()

    params.on = not params.on

    widget.title:setOn(params.on)

    if callback then

      callback(widget, params)

    end

  end

  widget.text:setText(params.text or "")

  widget.text.onTextChange = function(widget, text)

    params.text = text

    if callback then

      callback(widget, params)

    end

  end

  local update  = function(dontSignal)

    widget.title:setText("" .. params.min .. "% <= " .. params.title .. " <= " .. params.max .. "%")

    if callback and not dontSignal then

      callback(widget, params)

    end

  end

  widget.scroll1:setValue(params.min)

  widget.scroll2:setValue(params.max)

  widget.scroll1.onValueChange = function(scroll, value)

    params.min = value

    update()

  end

  widget.scroll2.onValueChange = function(scroll, value)

    params.max = value

    update()

  end

  update(true)

end

UI.DualScrollItemPanel = function(params, callback, parent) -- callback = function(widget, newParams)

  --[[ params:

    on - bool,

    item - number,

    subType - number,

    title - string,

    min - number,

    max - number,

]]

  params.title = params.title or "title"

  params.item = params.item or 0

  params.subType = params.subType or 0

  params.min = params.min or 20

  params.max = params.max or 80

  local widget = UI.createWidget('DualScrollItemPanel', parent)

  widget.title:setOn(params.on)

  widget.title.onClick = function()

    params.on = not params.on

    widget.title:setOn(params.on)

    if callback then

      callback(widget, params)

    end

  end

  widget.item:setItem(Item.create(params.item, params.subType))

  widget.item.onItemChange = function()

    params.item = widget.item:getItemId()

    params.subType = widget.item:getItemSubType()

    if callback then

      callback(widget, params)

    end

  end

  local update  = function(dontSignal)

    widget.title:setText("" .. params.min .. "% <= " .. params.title .. " <= " .. params.max .. "%")

    if callback and not dontSignal then

      callback(widget, params)

    end

  end

  widget.scroll1:setValue(params.min)

  widget.scroll2:setValue(params.max)

  widget.scroll1.onValueChange = function(scroll, value)

    params.min = value

    update()

  end

  widget.scroll2.onValueChange = function(scroll, value)

    params.max = value

    update()

  end

  update(true)

end

UI.Label = function(text, parent)

  local label = UI.createWidget('BotLabel', parent)

  label:setText(text)

  return label

end

UI.Separator = function(parent)

  local separator = UI.createWidget('BotSeparator', parent)

  return separator

end

UI.TextEdit = function(text, callback, parent)

  local widget = UI.createWidget('BotTextEdit', parent)

  widget.onTextChange = callback

  widget:setText(text)

  return widget

end

UI.TwoItemsAndSlotPanel = function(params, callback, parent)

  --[[ params:

    on - bool,

    title - string,

    item1 - number,

    item2 - number,

    slot - number,

]]

  params.title = params.title or "title"

  params.item1 = params.item1 or 0

  params.item2 = params.item2 or 0

  params.slot = params.slot or 1

  local widget = UI.createWidget("TwoItemsAndSlotPanel", parent)

  widget.title:setText(params.title)

  widget.title:setOn(params.on)

  widget.title.onClick = function()

    params.on = not params.on

    widget.title:setOn(params.on)

    if callback then

      callback(widget, params)

    end

  end

  widget.slot:setCurrentIndex(params.slot)

  widget.slot.onOptionChange = function()

    params.slot = widget.slot.currentIndex

    if callback then

      callback(widget, params)

    end

  end

  widget.item1:setItemId(params.item1)

  widget.item1.onItemChange = function()

    params.item1 = widget.item1:getItemId()

    if callback then

      callback(widget, params)

    end

  end

  widget.item2:setItemId(params.item2)

  widget.item2.onItemChange = function()

    params.item2 = widget.item2:getItemId()

    if callback then

      callback(widget, params)

    end

  end

  return widget

end

UI.DualLabel = function(left, right, params, parent)

  --[[ params:

    height - int,

    maxWidth - number

]]

  left = left or ""

  right = right or ""

  params = params or {}

  if not type(params) == "table" then

    parent = params

    params = {}

  end

  params.height = params.height or 20

  params.maxWidth = params.maxWidth or 88

  local widget = UI.createWidget('DualLabelPanel', parent)

  widget.left:setText(left)

  widget.right:setText(right)

  widget:setHeight(params.height)

  if widget.left:getWidth() > params.maxWidth then

      widget.left:setWidth(params.maxWidth)

  end

  return widget

end

UI.LabelAndTextEdit = function(params, callback, parent)

  --[[ params:

    left - str,

    right - str,

    height - int,

    maxWidth - int,

]]

  params = params or {}

  params.left = params.left or ""

  params.right = params.right or ""

  params.height = params.height or 20

  params.maxWidth = params.maxWidth or 88

  local widget = UI.createWidget('LabelAndTextEditPanel', parent)

  widget.left:setText(params.left)

  widget.right:setText(params.right)

  widget:setHeight(params.height)

  if widget.left:getWidth() > params.maxWidth then

    widget.left:setWidth(params.maxWidth)

  end

  widget.right.onTextChange = function(widget, text)

    params.right = text

    if callback then

        callback(widget, params)

    end

  end

  --[[example:

      storage.testParams = storage.testParams or {left = "hotkey", right = "F5"}

      UI.LabelAndTextEdit(storage.testParams, function(widget, newParams)

          storage.testParams = newParams

      end)

]]

  return widget

end

UI.SwitchAndButton = function(params, callbackSwitch, callbackButton, callback, parent)

  --[[ params:

    on - bool,

    left - str,

    right - str,

    height - int,

    maxWidth - int,

]]

  params = params or {}

  params.on = params.on or false

  params.left = params.left or ""

  params.right = params.right or ""

  params.height = params.height or 20

  params.maxWidth = params.maxWidth or 88

  local widget = UI.createWidget('SwitchAndButtonPanel', parent)

  widget.left:setOn(params.on)

  widget.left:setText(params.left)

  widget.right:setText(params.right)

  widget:setHeight(params.height)

  if widget.right:getWidth() > params.maxWidth then

    widget.right:setWidth(params.maxWidth)

  end

  widget.left.onClick = function()

    params.on = not params.on

    widget.left:setOn(params.on)

    if callback then

        callback(widget, params)

    end

    if callbackSwitch then

        callbackSwitch()

    else

        warn("callback not set!")

    end

  end

  widget.right.onClick = function()

    if callbackButton then

        callbackButton()

    else

        warn("callback not set!")

    end

  end

  --[[ params:

    if type(storage.test1) ~= "table" then

        storage.test1 = storage.test1 or {on = false, left = "new script", right = "config"}

    end

    UI.SwitchAndButton(storage.test1, test, test, function(widget, newParams)

        storage.test1 = newParams

    end)

]]

  return widget

end

```

---
# ui_legacy.lua
```lua

local context = G.botContext

-- DO NOT USE THIS CODE.

-- IT'S ONLY HERE FOR BACKWARD COMPATIBILITY, MAY BE REMOVED IN THE FUTURE

context.createWidget = function(name, parent)

  if parent == nil then

    parent = context.panel

  end

  g_ui.createWidget(name, parent)

end

context.setupUI = function(otml, parent)

  if parent == nil then

    parent = context.panel

  end

  local widget = g_ui.loadUIFromString(otml, parent)

  widget.botWidget = true

  return widget

end

context.importStyle = function(otml)

  if type(otml) ~= "string" then

    return error("Invalid parameter for importStyle, should be string")

  end

  if otml:find(".otui") and not otml:find("\n") then

    return g_ui.importStyle(context.configDir .. "/" .. otml)

  end

  return g_ui.importStyleFromString(otml)

end

context.addTab = function(name)

  local tab = context.tabs:getTab(name)

  if tab then -- return existing tab

    return tab.tabPanel.content

  end

  local smallTabs = #(context.tabs.tabs) >= 5

  local newTab = context.tabs:addTab(name, g_ui.createWidget('BotPanel')).tabPanel.content

  context.tabs:setOn(true)

  if smallTabs then

    for k,tab in pairs(context.tabs.tabs) do

      tab:setFont('small-9px')

    end

  end

  return newTab

end

context.getTab = context.addTab

context.setDefaultTab = function(name)

  local tab = context.addTab(name)

  context.panel = tab

end

context.addSwitch = function(id, text, onClickCallback, parent)

  if not parent then

    parent = context.panel

  end

  local switch = g_ui.createWidget('BotSwitch', parent)

  switch:setId(id)

  switch:setText(text)

  switch.onClick = onClickCallback

  return switch

end

context.addButton = function(id, text, onClickCallback, parent)

  if not parent then

    parent = context.panel

  end

  local button = g_ui.createWidget('BotButton', parent)

  button:setId(id)

  button:setText(text)

  button.onClick = onClickCallback

  return button

end

context.addLabel = function(id, text, parent)

  if not parent then

    parent = context.panel

  end

  local label = g_ui.createWidget('BotLabel', parent)

  label:setId(id)

  label:setText(text)

  return label

end

context.addTextEdit = function(id, text, onTextChangeCallback, parent)

  if not parent then

    parent = context.panel

  end

  local widget = g_ui.createWidget('BotTextEdit', parent)

  widget:setId(id)

  widget.onTextChange = onTextChangeCallback

  widget:setText(text)

  return widget

end

context.addSeparator = function(id, parent)

  if not parent then

    parent = context.panel

  end

  local separator = g_ui.createWidget('BotSeparator', parent)

  separator:setId(id)

  return separator

end

context._addMacroSwitch = function(name, keys, parent)

  if not parent then

    parent = context.panel

  end

  local text = name

  if keys:len() > 0 then

    text = name .. " [" .. keys .. "]"

  end

  local switch = context.addSwitch("macro_" .. #context._macros, text, function(widget)

    context.storage._macros[name] = not context.storage._macros[name]

    widget:setOn(context.storage._macros[name])

  end, parent)

  switch:setOn(context.storage._macros[name])

  return switch

end

context._addHotkeySwitch = function(name, keys, parent)

  if not parent then

    parent = context.panel

  end

  local text = name

  if keys:len() > 0 then

    text = name .. " [" .. keys .. "]"

  end

  local switch = context.addSwitch("hotkey_" .. #context._hotkeys, text, nil, parent)

  switch:setOn(false)

  return switch

end

```

---
# ui_windows.lua
```lua

local context = G.botContext

if type(context.UI) ~= "table" then

  context.UI = {}

end

local UI = context.UI

UI.EditorWindow = function(text, options, callback)

  --[[

    Available options:

      title = text

      description = text

      multiline = true / false

      width = number

      validation = text (regex)

      examples = {{name, text}, {name, text}}

  ]]--

  local window = modules.client_textedit.edit(text, options, callback)

  window.botWidget = true

  return window

end

UI.SinglelineEditorWindow = function(text, options, callback)

  options = options or {}

  options.multiline = false

  return UI.EditorWindow(text, options, callback)

end

UI.MultilineEditorWindow = function(text, options, callback)

  options = options or {}

  options.multiline = true

  return UI.EditorWindow(text, options, callback)

end

UI.ConfirmationWindow = function(title, question, callback)

  local window = nil

  local onConfirm = function()

    window:destroy()

    callback()

  end

  local closeWindow = function()

    window:destroy()

  end

  window = context.displayGeneralBox(title, question, {

    { text=tr('Yes'), callback=onConfirm },

    { text=tr('No'), callback=closeWindow },

    anchor=AnchorHorizontalCenter}, onConfirm, closeWindow)

  window.botWidget = true

  return window

end

```

---

{% endraw %}


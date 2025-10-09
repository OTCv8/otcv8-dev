{% raw %}
# Moduł: | Moduł: `game_bot/default_configs/cavebot_1.3/cavebot`
```lua

CaveBot.Actions = {}

-- it adds an action widget to list

CaveBot.addAction = function(action, value, focus)

  action = action:lower()

  local raction = CaveBot.Actions[action]

  if not raction then

    return error("Invalid cavebot action: " .. action)

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

    return error("Invalid cavebot action: " .. action)

  end

  if not widget.action or not widget.value then

    return error("Invalid cavebot action widget, has missing action or value")

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

    return error("Duplicated acction: " .. action)

  end

  CaveBot.Actions[action] = {

    color=color,

    callback=callback

}

end

CaveBot.registerAction("label", "yellow", function(value, retries, prev)

  return true

end)

CaveBot.registerAction("gotolabel", "#FFFF55", function(value, retries, prev)

  return CaveBot.gotoLabel(value)

end)

CaveBot.registerAction("delay", "#AAAAAA", function(value, retries, prev)

  if retries == 0 then

    CaveBot.delay(tonumber(value))

    return "retry"

  end

  return true

end)

CaveBot.registerAction("function", "red", function(value, retries, prev)

  local prefix = "local retries = " .. retries .. "\nlocal prev = " .. tostring(prev) .. "\nlocal delay = CaveBot.delay\nlocal gotoLabel = CaveBot.gotoLabel\n"

  prefix = prefix .. "local macro = function() error('Macros inside cavebot functions are not allowed') end\n"

  for extension, callbacks in pairs(CaveBot.Extensions) do

    prefix = prefix .. "local " .. extension .. " = CaveBot.Extensions." .. extension .. "\n"

  end

  local status, result = pcall(function()

    return assert(load(prefix .. value, "cavebot_function"))()

  end)

  if not status then

    error("Error in cavebot function:\n" .. result)

    return false

  end

  return result

end)

CaveBot.registerAction("goto", "green", function(value, retries, prev)

  local pos = regexMatch(value, "\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+),?\\s*([0-9]?)")

  if not pos[1] then

    error("Invalid cavebot goto action value. It should be position (x,y,z), is: " .. value)

    return false

  end

  if CaveBot.Config.get("mapClick") then

    if retries >= 5 then

      return false -- tried 5 times, can't get there

    end

  else

    if retries >= 100 then

      return false -- tried 100 times, can't get there

    end

  end

  local precision = tonumber(pos[1][5])

  pos = {x=tonumber(pos[1][2]), y=tonumber(pos[1][3]), z=tonumber(pos[1][4])}

  local playerPos = player:getPosition()

  if pos.z ~= playerPos.z then

    return false -- different floor

  end

  if math.abs(pos.x-playerPos.x) + math.abs(pos.y-playerPos.y) > 40 then

    return false -- too far way

  end

  local minimapColor = g_map.getMinimapColor(pos)

  local stairs = (minimapColor >= 210 and minimapColor <= 213)

  if stairs then

    if math.abs(pos.x-playerPos.x) == 0 and math.abs(pos.y-playerPos.y) <= 0 then

      return true -- already at position

    end

  elseif math.abs(pos.x-playerPos.x) == 0 and math.abs(pos.y-playerPos.y) <= (precision or 1) then

      return true -- already at position

  end

  -- check if there's a path to that place, ignore creatures and fields

  local path = findPath(playerPos, pos, 40, { ignoreNonPathable = true, precision = 1, ignoreCreatures = true })

  if not path then

    return false -- there's no way

  end

  -- try to find path, don't ignore creatures, don't ignore fields

  if not CaveBot.Config.get("ignoreFields") and CaveBot.walkTo(pos, 40) then

    return "retry"

  end

  -- try to find path, don't ignore creatures, ignore fields

  if CaveBot.walkTo(pos, 40, { ignoreNonPathable = true }) then

    return "retry"

  end

  if retries >= 3 then

    -- try to lower precision, find something close to final position

    local precison = retries - 1

    if stairs then

      precison = 0

    end

    if CaveBot.walkTo(pos, 50, { ignoreNonPathable = true, precision = precison }) then

      return "retry"

    end

  end

  if not CaveBot.Config.get("mapClick") and retries >= 5 then

    return false

  end

  if CaveBot.Config.get("skipBlocked") then

    return false

  end

  -- everything else failed, try to walk ignoring creatures, maybe will work

  CaveBot.walkTo(pos, 40, { ignoreNonPathable = true, precision = 1, ignoreCreatures = true })

  return "retry"

end)

CaveBot.registerAction("use", "#FFB272", function(value, retries, prev)

  local pos = regexMatch(value, "\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+)")

  if not pos[1] then

    local itemid = tonumber(value)

    if not itemid then

      error("Invalid cavebot use action value. It should be (x,y,z) or item id, is: " .. value)

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

      error("Invalid cavebot usewith action value. It should be (itemid,x,y,z) or item id, is: " .. value)

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

    return -- executing walking

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

        error("Invalid return from cavebot action (" .. currentAction.action .. "), should be \"retry\", false or true, is: " .. tostring(result))

      end

    else

      error("Error while executing cavebot action (" .. currentAction.action .. "):\n" .. result)

    end

  else

    error("Invalid cavebot action: " .. currentAction.action)

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

          error("Error while parsing CaveBot extensions from config:\n" .. result)

        else

          cavebotConfig = result

        end

      elseif v[1] == "extensions" then

        local status, result = pcall(function()

          return json.decode(v[2])

        end)

        if not status then

          error("Error while parsing CaveBot extensions from config:\n" .. result)

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

    return error("Duplicated config key: " .. id)

  end

  local panel

  local setter -- sets value

  if type(defaultValue) == "number" then

    panel = UI.createWidget("CaveBotConfigNumberValuePanel", CaveBot.Config.ui)

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

    return error("Invalid default value of config for key " .. id .. ", should be number or boolean")

  end

  panel.title:setText(tr(title) .. ":")

  CaveBot.Config.value_setters[id] = setter

  CaveBot.Config.values[id] = defaultValue

  CaveBot.Config.default_values[id] = defaultValue

end

CaveBot.Config.get = function(id)

  if CaveBot.Config.values[id] == nil then

    return error("Invalid CaveBot.Config.get, id: " .. id)

  end

  return CaveBot.Config.values[id]

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
# depositer.lua
```lua

CaveBot.Extensions.Depositer = {}

local ui

-- first function called, here you should setup your UI

CaveBot.Extensions.Depositer.setup = function()

  --ui = UI.createWidget('Label')

  --ui:setText("Depositer UI")

end

-- called when cavebot config changes, configData is a table but it can be nil

CaveBot.Extensions.Depositer.onConfigChange = function(configName, isEnabled, configData)

  if not configData then return end

end

-- called when cavebot is saving config, should return table or nil

CaveBot.Extensions.Depositer.onSave = function()

  return {}

end

-- bellow add you custom functions

-- this function can be used in cavebot function waypoint as: return Depositer.run(retries, prev)

-- there are 2 useful parameters - retries (number) and prev (true/false), check actions.lua to learn more

CaveBot.Extensions.Depositer.run = function(retries, prev)

  return true

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

      return error("CaveBot editor error: action " .. action .. " doesn't exist")

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

    description="Delay next action (in milliseconds)",

    multiline=false,

    validation="^\\s*[0-9]{1,10}\\s*$"

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

    validation="^\\s*([0-9]+)\\s*,\\s*([0-9]+)\\s*,\\s*([0-9]+)$"

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

  onPlayerPositionChange(function(newPos, oldPos)

    if CaveBot.isOn() or not isEnabled then return end

    if not lastPos then

      -- first step

      addPosition(oldPos)

    elseif newPos.z ~= oldPos.z or math.abs(oldPos.x - newPos.x) > 1 or math.abs(oldPos.y - newPos.y) > 1 then

      -- stairs/teleport

      addPosition(oldPos)

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
# supply.lua
```lua

CaveBot.Extensions.Supply = {}

local ui

-- first function called, here you should setup your UI

CaveBot.Extensions.Supply.setup = function()

  --ui = UI.createWidget('SupplyItemList')

  --local widget = UI.createWidget('SupplyItem', ui.list)

  --widget.item.onItemChange = function(newItem)

  --widget.fields.min.onTextChange = function(newText)

  -- make it similar to UI.Container, so if there are no free slots, add another one, keep min 4 slots, check if value min/max is number after edit

end

-- called when cavebot config changes, configData is a table but it can be nil

CaveBot.Extensions.Supply.onConfigChange = function(configName, isEnabled, configData)

  if not configData then return end

end

-- called when cavebot is saving config, should return table or nil

CaveBot.Extensions.Supply.onSave = function()

  return {}

end

-- bellow add you custom functions

-- this function can be used in cavebot function waypoint as: return Supply.run(retries, prev)

-- there are 2 useful parameters - retries (number) and prev (true/false), check actions.lua to learn more

CaveBot.Extensions.Supply.run = function(retries, prev)

  return true

end

```

---
# supply.otui
```otui

SupplyItem < Panel

  height: 34

  BotItem

    id: item

    size: 32 32

    anchors.left: parent.left

    anchors.top: parent.top

    margin-top: 1

  Panel

    id: fields

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 2

    margin-right: 2

    Label

      id: minLabel

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.horizontalCenter

      margin-right: 2

      text-align: center

      text: "Min"

    Label

      id: maxLabel

      anchors.top: parent.top

      anchors.left: parent.horizontalCenter

      anchors.right: parent.right

      margin-left: 2

      text-align: center

      text: "Max"

    BotTextEdit

      id: min

      anchors.top: minLabel.bottom

      anchors.left: minLabel.left

      anchors.right: minLabel.right

      text-align: center

      text: 1

    BotTextEdit

      id: max

      anchors.top: maxLabel.bottom

      anchors.left: maxLabel.left

      anchors.right: maxLabel.right

      text-align: center

      text: 100

SupplyItemList < Panel

  height: 102

  ScrollablePanel

    id: list

    anchors.fill: parent

    vertical-scrollbar: scroll

    margin-right: 7

    layout:

      type: verticalBox

      cell-height: 34

  BotSmallScrollBar

    id: scroll

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.right: parent.right

    step: 10

    pixels-scroll: true

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

{% endraw %}


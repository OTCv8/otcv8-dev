setDefaultTab("War")

function superDash(parent)
 if not parent then
    parent = panel
  end
  local switch = g_ui.createWidget('BotSwitch', parent)
  switch:setId("superDashButton")
  switch:setText("Super Dash")
  switch:setOn(storage.superDash)
  switch.onClick = function(widget)    
    storage.superDash = not storage.superDash
    widget:setOn(storage.superDash)
  end

  onKeyPress(function(keys)
    if not storage.superDash then
      return
    end
    consoleModule = modules.game_console
    if (keys == "W" and not consoleModule:isChatEnabled()) or keys == "Up" then
      moveToTile = g_map.getTile({x = posx(), y = posy()-1, z = posz()})
      if moveToTile and not moveToTile:isWalkable(false) then
        moveToPos = {x = posx(), y = posy()-6, z = posz()}
        dashTile = g_map.getTile(moveToPos)
        if dashTile then
          g_game.use(dashTile:getTopThing())
        end
      end
    elseif (keys == "A" and not consoleModule:isChatEnabled()) or keys == "Left" then
      moveToTile = g_map.getTile({x = posx()-1, y = posy(), z = posz()})
      if moveToTile and not moveToTile:isWalkable(false) then
        moveToPos = {x = posx()-6, y = posy(), z = posz()}
        dashTile = g_map.getTile(moveToPos)
        if dashTile then
          g_game.use(dashTile:getTopThing())
        end
      end
    elseif (keys == "S" and not consoleModule:isChatEnabled()) or keys == "Down" then
      moveToTile = g_map.getTile({x = posx(), y = posy()+1, z = posz()})
      if moveToTile and not moveToTile:isWalkable(false) then
        moveToPos = {x = posx(), y = posy()+6, z = posz()}
        dashTile = g_map.getTile(moveToPos)
        if dashTile then
          g_game.use(dashTile:getTopThing())
        end
      end
    elseif (keys == "D" and not consoleModule:isChatEnabled()) or keys == "Right" then
      moveToTile = g_map.getTile({x = posx()+1, y = posy(), z = posz()})
      if moveToTile and not moveToTile:isWalkable(false) then
        moveToPos = {x = posx()+6, y = posy(), z = posz()}
        dashTile = g_map.getTile(moveToPos)
        if dashTile then
          g_game.use(dashTile:getTopThing())
        end
      end
    end
  end)
end
superDash()

macro(100, "debug pathfinding", nil, function()
  for i, tile in ipairs(g_map.getTiles(posz())) do
    tile:setText("")
  end
  local path = findEveryPath(pos(), 20, {
    ignoreNonPathable = false
  })
  local total = 0
  for i, p in pairs(path) do
    local s = i:split(",")
    local pos = {x=tonumber(s[1]), y=tonumber(s[2]), z=tonumber(s[3])}
    local tile = g_map.getTile(pos)
    if tile then
      tile:setText(p[2])
    end
     total = total + 1
  end
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------
local ui = setupUI([[
Panel
  layout:
    type: verticalBox
    fit-children: true
]])

local clearEvent = nil
local lifeSteal = false
local lastMessage = ""
local elements = {
  ["0_255_0"] = "Poison",
  ["255_0_0"] = "Physical",
  ["255_153_0"] = "Fire",
  ["204_51_255"] = "Energy",
  ["153_0_0"] = "Death",
  ["255_255_0"] = "Holy",
  ["0_0_255"] = "Mana Drain",
  ["153_255_255"] = "Ice"
}

local colors = {
  ["0_255_0"] = "#00ff00",
  ["255_0_0"] = "#ff0000",
  ["255_153_0"] = "#ff9900",
  ["204_51_255"] = "#cc33ff",
  ["153_0_0"] = "#990000",
  ["255_255_0"] = "#ffff00",
  ["0_0_255"] = "#0000ff",
  ["153_255_255"] = "#99ffff"
}
local data = {}

UI.Separator()
local title = UI.Label("Received Dmg Analyzer:")
title:setColor("#FABD02")
UI.Separator()
local list = setupUI([[
Panel
  id: list
  layout:
    type: verticalBox
    fit-children: true
]])
UI.Separator()

local function sortWidgets()
  local widgets = list:getChildren()

  table.sort(
    widgets,
    function(a, b)
      return a.val > b.val
    end
  )

  for i, widget in ipairs(widgets) do
    list:moveChildToIndex(widget, i)
  end
end

local function sumWidgets()
  local widgets = list:getChildren()

  local sum = 0
  for i, widget in ipairs(widgets) do
    sum = sum + widget.val
  end

  return sum
end

local function updateValues()
  local widgets = list:getChildren()

  local sum = sumWidgets()
  for i, widget in ipairs(widgets) do
    local value = widget.val
    local percent = math.floor((value / sum) * 100)
    local desc = modules.game_bot.comma_value(value) .. " (" .. percent .. "%)"

    widget.right:setText(desc)
  end
end

onAnimatedText(
  function(thing, text)
    if distanceFromPlayer(thing:getPosition()) > 0 then
      return
    end -- only things on player
    if hasManaShield() then
      return
    end -- abort is self has manashield

    schedule(
      1,
      function()
        -- small delay
        if lastMessage:find(text) then
          text = tonumber(text)
          local color = thing:getColor()
          local colorCode = color.r .. "_" .. color.g .. "_" .. color.b
          local element = elements[colorCode]

          if element == "Physical" and lifeSteal then
            if not isParalyzed() then
              element = "Life Steal"
            end
            lifeSteal = false
          end

          if element then
            if data[element] then
              data[element] = data[element] + text
            else
              data[element] = text
            end

            local dmgSum = 0
            for k, v in pairs(data) do
              dmgSum = dmgSum + v
            end

            local widget = list[element]
            if widget then
              widget.val = data[element]
            else
              widget = UI.DualLabel("", "", {maxWidth = 200}, list)
              widget.onDoubleClick = function() -- reset
                list:destroyChildren()
                list:setHeight(0)
                data = {}
              end
              widget:setId(element)
              widget.right:setWidth(135)
              widget.left:setText(element .. ":")
              widget.val = data[element]
              widget.left:setColor(colors[colorCode])
              widget.right:setColor(colors[colorCode])
            end
            updateValues()
            sortWidgets()
          end
        end
      end
    )
  end
)

onAddThing(function(tile, thing)
  local pos = tile:getPosition()
  if distanceFromPlayer(pos) > 0 then return end
  if not thing:isEffect() then return end

  if thing:getId() == 14 then
    lifeSteal = true
    schedule(2, function() lifeSteal = false end)
  end
end)

onTextMessage(
  function(mode, text)
    if text:find("You lose") then
      lastMessage = text
    end
  end
)

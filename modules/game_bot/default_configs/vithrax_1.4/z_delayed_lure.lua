local panelName = "lurePanel"
local ui = setupUI([[
Panel
  height: 50

  BotSwitch
    id: enabled
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text: Enable Lure

  BotLabel
    id: title
    anchors.top: prev.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    text-align: center
    margin-top: 2

  HorizontalScrollBar
    id: Max
    anchors.top: prev.bottom
    anchors.left: parent.left
    anchors.right: parent.horizontalCenter
    minimum: 2
    step: 1
    maximum: 10
    margin-right: 1
    margin-top: 2

  HorizontalScrollBar
    id: Min
    anchors.verticalCenter: prev.verticalCenter
    anchors.left: parent.horizontalCenter
    anchors.right: parent.right
    minimum: 0
    step: 1
    maximum: 5
    margin-left: 1
]], parent)
ui:setId(panelName)

if not storage[panelName] then
  storage[panelName] = {
    min = 1,
    max = 3,
    enabled = false
  }
end

    -- functions
local updateText = function()
    local string = ("Lure " .. storage[panelName].max .. " monsters, until " .. storage[panelName].min .. " left")
    ui.title:setText(string)
end
updateText()
local setMax = function()
    local v
    if storage[panelName].max > 0 then
        v = storage[panelName].max - 1
    else
        v = storage[panelName].max
    end
    ui.Min:setMaximum(v)
end
setMax()

    -- otui
ui.enabled:setOn(storage[panelName].enabled)
ui.enabled.onClick = function(widget)
  storage[panelName].enabled = not storage[panelName].enabled
  widget:setOn(storage[panelName].enabled)
end
ui.Min:setValue(storage[panelName].min)
ui.Min.onValueChange = function(scroll, value)
  storage[panelName].min = value
  updateText()
end
ui.Max:setValue(storage[panelName].max)
ui.Max.onValueChange = function(scroll, value)
  storage[panelName].max = value
  setMax()
  updateText()
end

local m = macro(1000, "Delayed Lure at 50%", function() end)


onPlayerPositionChange(function(newPos, oldPos)
    if m.isOff() then return end
    if CaveBot.isOff() then return end
    if TargetBot.isOff() then return end
    if storage.targetBotTargets < storage[panelName].max/2 or not target() then return end

    CaveBot.delay(250)
end)

UI.Separator()
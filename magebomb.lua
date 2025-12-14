local ScrptTab = addTab("Scrpt")


setDefaultTab("Scrpt")

-- config
local channel = "9333913959476" -- you need to edit this to any random string

-- script
local ScrptTab = addTab("Scrpt")

local panelName = "magebomb"
local ui = setupUI([[
Panel
  height: 65

  BotSwitch
    id: title
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    text-align: center
    text: MageBomb

  OptionCheckBox
    id: mageBombLeader
    anchors.left: prev.left
    text: MageBomb Leader
    margin-top: 3

  BotLabel
    id: bombLeaderNameInfo
    anchors.left: parent.left
    anchors.top: prev.bottom
    text: Leader Name:
    margin-top: 3

  BotTextEdit
    id: bombLeaderName
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: prev.bottom
    margin-top: 3
  ]], mageBombTab)
ui:setId(panelName)

if not storage[panelName] then
  storage[panelName] = {
    mageBombLeader = false
  }
end
storage[panelName].mageBombLeader = false
ui.title:setOn(storage[panelName].enabled)
ui.title.onClick = function(widget)
  storage[panelName].enabled = not storage[panelName].enabled
  widget:setOn(storage[panelName].enabled)
end
ui.mageBombLeader.onClick = function(widget)
  storage[panelName].mageBombLeader = not storage[panelName].mageBombLeader
  widget:setChecked(storage[panelName].mageBombLeader)
  ui.bombLeaderNameInfo:setVisible(not storage[panelName].mageBombLeader)
  ui.bombLeaderName:setVisible(not storage[panelName].mageBombLeader)
end
ui.bombLeaderName.onTextChange = function(widget, text)
  storage[panelName].bombLeaderName = text
end
ui.bombLeaderName:setText(storage[panelName].bombLeaderName)

local oldPosition = nil
onPlayerPositionChange(function(newPos, oldPos)
  newTile = g_map.getTile(newPos)
  oldPosition = oldPos
  if newPos.z ~= oldPos.z then
    BotServer.send("goto", {pos=oldPos})
  end
end)
onAddThing(function(tile, thing)
  if not storage[panelName].mageBombLeader or not storage[panelName].enabled then
    return
  end
  if tile:getPosition().x == posx() and tile:getPosition().y == posy() and tile:getPosition().z == posz() and thing and thing:isEffect() then
    if thing:getId() == 11 then
      BotServer.send("goto", {pos=oldPosition})
    end
  end
end)

onUse(function(pos, itemId, stackPos, subType)
  if itemId == 1948 or itemId == 7771 or itemId == 435 then
    BotServer.send("useItem", {pos=pos, itemId = itemId})
  end
end)
onUseWith(function(pos, itemId, target, subType)
  if itemId == 9596 then
    BotServer.send("useItemWith", {itemId=itemId, pos = pos})
  elseif itemId == 3155 then
    BotServer.send("useItemWith", {itemId=itemId, targetId = target:getId()})
  end
end)
macro(300, function()
  if not storage[panelName].enabled and not storage[panelName].mageBombLeader then
    return
  end
  local target = g_game.getAttackingCreature()
  if target == nil then
    BotServer.send("attack", { targetId = 0 })
  else
    BotServer.send("attack", { targetId = target:getId() })
  end
end, mageBombTab)
macro(100, function()
  if not storage[panelName].enabled or name() == storage[panelName].bombLeaderName then
    return
  end
  local leader = getPlayerByName(storage[panelName].bombLeaderName)
  
  if leader then
    local leaderPos = leader:getPosition()
    local offsetX = posx() - leaderPos.x
    local offsetY = posy() - leaderPos.y
    local distance = math.max(math.abs(offsetX), math.abs(offsetY))
    if (distance > 2) then
      if not autoWalk(leaderPos, 20, {  minMargin=2, maxMargin=2, allowOnlyVisibleTiles = true}) then
        if not autoWalk(leaderPos, 20, { ignoreNonPathable = true, minMargin=1, maxMargin=2, allowOnlyVisibleTiles = true}) then
          if not autoWalk(leaderPos, 20, { ignoreNonPathable = true, ignoreCreatures = false, minMargin=2, maxMargin=2, allowOnlyVisibleTiles = true}) then
            return
          end
        end
      end
    end
  end
end, mageBombTab)
BotServer.init(name(), channel)
BotServer.listen("goto", function(senderName, message)
  if storage[panelName].enabled and name() ~= senderName and senderName == storage[panelName].bombLeaderName then
    position = message["pos"]

    if position.x ~= posx() or position.y ~= posy() or position.z ~= posz() then
      distance = getDistanceBetween(position, pos())
      autoWalk(position, distance, { ignoreNonPathable = true, precision = 3 })
    end
  end
end)
BotServer.listen("useItem", function(senderName, message)
  if storage[panelName].enabled and name() ~= senderName and senderName == storage[panelName].bombLeaderName then
    position = message["pos"]
    if position.x ~= posx() or position.y ~= posy() or position.z ~= posz() then
      itemTile = g_map.getTile(position)
      for _, thing in ipairs(itemTile:getThings()) do
        if thing:getId() == message["itemId"] then
          g_game.use(thing)
        end
      end
    end
  end
end)
BotServer.listen("useItemWith", function(senderName, message)
  if storage[panelName].enabled and name() ~= senderName and senderName == storage[panelName].bombLeaderName then
    if message["pos"] then
      tile = g_map.getTile(message["pos"])
      if tile then
        topThing = tile:getTopUseThing()
        if topThing then
          useWith(message["itemId"], topThing)
        end
      end
    else
      target = getCreatureById(message["targetId"])
      if target then
        usewith(message["itemId"], target)
      end
    end
  end
end)
BotServer.listen("attack", function(senderName, message)
  if storage[panelName].enabled and name() ~= senderName and senderName == storage[panelName].bombLeaderName then
    targetId = message["targetId"]
    if targetId == 0 then
      g_game.cancelAttackAndFollow()
    else
      leaderTarget = getCreatureById(targetId)

      target = g_game.getAttackingCreature()
      if target == nil then
        if leaderTarget then
          g_game.attack(leaderTarget)
        end
      else
        if leaderTarget and target:getId() ~= leaderTarget:getId() then
          g_game.attack(leaderTarget)
        end
      end
    end
  end
end)







UI.Separator()

------------------------------------------------------- AUTO PARTY ------------------------------------------------


local panelName = "autoParty"
local autopartyui = setupUI([[
Panel
  height: 38

  BotSwitch
    id: status
    anchors.top: parent.top
    anchors.left: parent.left
    text-align: center
    width: 130
    height: 18
    !text: tr('Auto Party')

  Button
    id: editPlayerList
    anchors.top: prev.top
    anchors.left: prev.right
    anchors.right: parent.right
    margin-left: 3
    height: 17
    text: Setup

  Button
    id: ptLeave
    !text: tr('Leave Party')
    anchors.left: parent.left
    anchors.top: prev.bottom
    width: 86
    height: 17
    margin-top: 3
    color: #ee0000

  Button
    id: ptShare
    !text: tr('Share XP')
    anchors.left: prev.right
    anchors.top: prev.top
    margin-left: 5
    height: 17
    width: 86

  ]], parent)

g_ui.loadUIFromString([[
AutoPartyName < Label
  background-color: alpha
  text-offset: 2 0
  focusable: true
  height: 16

  $focus:
    background-color: #00000055

  Button
    id: remove
    !text: tr('x')
    anchors.right: parent.right
    margin-right: 15
    width: 15
    height: 15

AutoPartyListWindow < MainWindow
  !text: tr('Auto Party')
  size: 180 250
  @onEscape: self:hide()

  Label
    id: lblLeader
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.right: parent.right
    text-align: center
    !text: tr('Leader Name')

  TextEdit
    id: txtLeader
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: prev.bottom
    margin-top: 5

  Label
    id: lblParty
    anchors.left: parent.left
    anchors.top: prev.bottom
    anchors.right: parent.right
    margin-top: 5
    text-align: center
    !text: tr('Party List')

  TextList
    id: lstAutoParty
    anchors.top: prev.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 5
    margin-bottom: 5
    padding: 1
    height: 83
    vertical-scrollbar: AutoPartyListListScrollBar

  VerticalScrollBar
    id: AutoPartyListListScrollBar
    anchors.top: lstAutoParty.top
    anchors.bottom: lstAutoParty.bottom
    anchors.right: lstAutoParty.right
    step: 14
    pixels-scroll: true

  TextEdit
    id: playerName
    anchors.left: parent.left
    anchors.top: lstAutoParty.bottom
    margin-top: 5
    width: 120

  Button
    id: addPlayer
    !text: tr('+')
    anchors.right: parent.right
    anchors.left: prev.right
    anchors.top: prev.top
    margin-left: 3

  HorizontalSeparator
    id: separator
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.bottom: closeButton.top
    margin-bottom: 8

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
]])

if not storage[panelName] then
    storage[panelName] = {
        leaderName = 'Leader',
        autoPartyList = {},
        enabled = true,
    }
end

rootWidget = g_ui.getRootWidget()
if rootWidget then
    tcAutoParty = autopartyui.status

    autoPartyListWindow = UI.createWindow('AutoPartyListWindow', rootWidget)
    autoPartyListWindow:hide()

    autopartyui.editPlayerList.onClick = function(widget)
        autoPartyListWindow:show()
        autoPartyListWindow:raise()
        autoPartyListWindow:focus()
    end

    autopartyui.ptShare.onClick = function(widget)
        g_game.partyShareExperience(not player:isPartySharedExperienceActive())
    end

    autopartyui.ptLeave.onClick = function(widget)
        g_game.partyLeave()
    end

    autoPartyListWindow.closeButton.onClick = function(widget)
        autoPartyListWindow:hide()
    end

    if storage[panelName].autoPartyList and #storage[panelName].autoPartyList > 0 then
        for _, pName in ipairs(storage[panelName].autoPartyList) do
            local label = g_ui.createWidget("AutoPartyName", autoPartyListWindow.lstAutoParty)
            label.remove.onClick = function(widget)
                table.removevalue(storage[panelName].autoPartyList, label:getText())
                label:destroy()
            end
            label:setText(pName)
        end
    end
    autoPartyListWindow.addPlayer.onClick = function(widget)
        local playerName = autoPartyListWindow.playerName:getText()
        if playerName:len() > 0 and not (table.contains(storage[panelName].autoPartyList, playerName, true)
                or storage[panelName].leaderName == playerName) then
            table.insert(storage[panelName].autoPartyList, playerName)
            local label = g_ui.createWidget("AutoPartyName", autoPartyListWindow.lstAutoParty)
            label.remove.onClick = function(widget)
                table.removevalue(storage[panelName].autoPartyList, label:getText())
                label:destroy()
            end
            label:setText(playerName)
            autoPartyListWindow.playerName:setText('')
        end
    end

    autopartyui.status:setOn(storage[panelName].enabled)
    autopartyui.status.onClick = function(widget)
        storage[panelName].enabled = not storage[panelName].enabled
        widget:setOn(storage[panelName].enabled)
    end

    autoPartyListWindow.playerName.onKeyPress = function(self, keyCode, keyboardModifiers)
        if not (keyCode == 5) then
            return false
        end
        autoPartyListWindow.addPlayer.onClick()
        return true
    end

    autoPartyListWindow.playerName.onTextChange = function(widget, text)
        if table.contains(storage[panelName].autoPartyList, text, true) then
            autoPartyListWindow.addPlayer:setColor("#FF0000")
        else
            autoPartyListWindow.addPlayer:setColor("#FFFFFF")
        end
    end

    autoPartyListWindow.txtLeader.onTextChange = function(widget, text)
        storage[panelName].leaderName = text
    end
    autoPartyListWindow.txtLeader:setText(storage[panelName].leaderName)

    onTextMessage(function(mode, text)
        if tcAutoParty:isOn() then
            if mode == 20 then
                if text:find("has joined the party") then
                    local data = regexMatch(text, "([a-z A-Z-]*) has joined the party")[1][2]
                    if data then
                        if table.contains(storage[panelName].autoPartyList, data, true) then
                            if not player:isPartySharedExperienceActive() then
                                g_game.partyShareExperience(true)
                            end
                        end
                    end
                elseif text:find("has invited you") then
                    if player:getName():lower() == storage[panelName].leaderName:lower() then
                        return
                    end
                    local data = regexMatch(text, "([a-z A-Z-]*) has invited you")[1][2]
                    if data then
                        if storage[panelName].leaderName:lower() == data:lower() then
                            local leader = getCreatureByName(data, true)
                            if leader then
                                g_game.partyJoin(leader:getId())
                                return
                            end
                        end
                    end
                end
            end
        end
    end)

    onCreatureAppear(function(creature)
        if tcAutoParty:isOn() then
            if not creature:isPlayer() or creature == player then return end
            if creature:getName():lower() == storage[panelName].leaderName:lower() then
                if creature:getShield() == 1 then
                    g_game.partyJoin(creature:getId())
                    return
                end
            end
            if player:getName():lower() ~= storage[panelName].leaderName:lower() then return end
            if not table.contains(storage[panelName].autoPartyList, creature:getName(), true) then return end
            if creature:isPartyMember() or creature:getShield() == 2 then return end
            g_game.partyInvite(creature:getId())
        end
    end)
end


------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------




UI.Label("Auto Follow")
addTextEdit("followleader", storage.followLeader or "player name", function(widget, text)
storage.followLeader = text
end)
--Code
local toFollowPos = {2}
local followMacro = macro(20, "Follow", function()
local target = getCreatureByName(storage.followLeader)
if target then
local tpos = target:getPosition()
toFollowPos[tpos.z] = tpos
end
if player:isWalking() then return end
local p = toFollowPos[posz()]
if not p then return end
if autoWalk(p, 30, {ignoreNonPathable=false, precision=3}) then
delay(100)
end
end)
onCreaturePositionChange(function(creature, oldPos, newPos)
if creature:getName() == storage.followLeader then
toFollowPos[newPos.z] = newPos
end
end)

UI.Separator()

------------------------------------------------------------------------------------------------
local iconImageID = 7443
addIcon("Blueya Potka", 
{item=iconImageID, movable=true,
text = "Potion_dist"}, 

macro(100, "bullseye potion", function(icon)
    if manapercent() < 99 and not isInPz() then
        use(7443)
     delay(600000)
    end
end))
------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------


UI.Separator()
local useArea = true
local pvp = true
 
local iconImageID = 12306
local key = nil
local parent = nil
local creatureId = 0
addIcon("Keep attack", 
{item=iconImageID, movable=true,
text = "Keep"}, 

macro(100, "Keep attack", key, function(icon)
  if g_game.getFollowingCreature() then
    creatureId = 0
    return
  end
  local creature = g_game.getAttackingCreature()
  if creature then
    creatureId = creature:getId()
  elseif creatureId > 0 then
    local target = getCreatureById(creatureId)
    if target then
      attack(target)
      delay(500)
    end
  end
end, parent))

addSeparator("separator")
addSeparator("separator")


------------------------------------------------------------------------------------------------------------------
addSeparator("separator")


local iconImageID = 9086
addIcon("Blessed Steak", 
{item=iconImageID, movable=true,
text = "Stake"}, 

macro(10, "Blessed stake", function(icon)
    if manapercent() < 10 and isInPz() then
        use(9086)
     delay(600000)
    end
end))

addSeparator("separator")
-------------------------------------------------------------------------------------------------------------
addSeparator("separator")

UI.Label("AUTO-AMULET")

local iconImageID = 3081
local ssa = macro(10, "SSA", function()
  local amulet = 3081
  if getNeck() == nill or getNeck():getId() ~= amulet then
  g_game.equipItemId(amulet)
  delay(125)
  end
  end)


  local iconImageID = 23526
  addIcon("Plasma Amulet", 
    {item=iconImageID, movable=true,
      text = "Plasma"}, 
  
    macro(170, "Plasma Amulet", function(icon)
    local amulet = 23526
    if getNeck() == nill or getNeck():getId() ~= amulet then
    g_game.equipItemId(amulet)
    delay(35)
    end
    end))



local iconImageID = 9304
addIcon("SHOCKWAVE", 
  {item=iconImageID, movable=true,
    text = "Shockwave"}, 

  macro(170, "SHOCKWAVE", function(icon)
  local amulet = 9304
  if getNeck() == nill or getNeck():getId() ~= amulet then
  g_game.equipItemId(amulet)
  delay(35)
  end
  end))


local iconImageID = 815
addIcon("GLACIER", 
  {item=iconImageID, movable=true,
    text = "Ice"}, 

  macro(160, "GLACIER", function(icon)
  local amulet = 815
  if getNeck() == nill or getNeck():getId() ~= amulet then
  g_game.equipItemId(amulet)
  delay(35)
  end
  end))




local iconImageID = 817
addIcon("MAGMA", 
  {item=iconImageID, movable=true,
    text = "Fire"}, 

  macro(160, "MAGMA", function(icon)
  local amulet = 817
  if getNeck() == nill or getNeck():getId() ~= amulet then
  g_game.equipItemId(amulet)
  delay(35)
  end
  end))




local iconImageID = 816
addIcon("LIGHTING PENDANT", 
  {item=iconImageID, movable=true,
    text = "Energy"}, 

  macro(160, "LIGHTING PENDANT", function(icon)
  local amulet = 816
  if getNeck() == nill or getNeck():getId() ~= amulet then
  g_game.equipItemId(amulet)
  delay(35)
  end
  end))
-----------------------------------------------

local iconImageID = 23530
addIcon("Blue Plasma Ring", 
{item=iconImageID, movable=true,
text = "Blue"}, 


macro(160, "Blue Plasma Ring", function(icon)
  local ring = 23530
  if getFinger()== nill or getFinger():getId() ~= ring then
  g_game.equipItemId(ring)
  delay(35)
  end
  end))

------------------------------------------------------------------------------------------------------------------
addSeparator("separator")
addSeparator("separator")
UI.Label("[][][][] SPAM RUNE [][][][]")

 local iconImageID = 3155
 addIcon("Attack sd", 
 {item=iconImageID, movable=true,
 text = "Sd"}, 

macro(200, "Attack sd", function(icon)
    if g_game.isAttacking() then
        usewith(3155, g_game.getAttackingCreature())
        delay(2000)
    end
end))

local iconImageID = 3161
addIcon("AVA", 
{item=iconImageID, movable=true,
text = "Ava"}, 


macro(500, "AVA", nil, function(icon)
    if g_game.isAttacking() then
        usewith(tonumber(storage.idruny), g_game.getAttackingCreature())
    end
end))

addTextEdit("", storage.idruny or "3161", function(widget, text)    
  storage.idruny = text
end)


addSeparator()
UI.Label("-> ID RUNE <-")
UI.Label("AVA-3161")
UI.Label("GFB-3191")
UI.Label("THUNDER-3202")
UI.Label("SHOWER-3175")
addSeparator()


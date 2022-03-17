bottomActionPanel1 = nil
bottomActionPanel2 = nil
bottomActionPanel3 = nil
leftActionPanel1 = nil
leftActionPanel2 = nil
leftActionPanel3 = nil

local settings = {}
local hotkeyAssignWindow
local actionButtonsInPanel = 50

ActionTypes = {
  USE = 0,
  USE_SELF = 1,
  USE_TARGET = 2,
  USE_WITH = 3,
  EQUIP = 4
}

ActionColors = {
  empty = '#00000033',
  text = '#00000033',
  itemUse = '#8888FF88',
  itemUseSelf = '#00FF0088',
  itemUseTarget = '#FF000088',
  itemUseWith = '#F5B32588',
  itemEquip = '#FFFFFF88'
}

function init()
  local bottomPanel = modules.game_interface.getBottomActionPanel()
  local leftPanel = modules.game_interface.getLeftActionPanel()
  local rightPanel = modules.game_interface.getRightActionPanel()

  -- bottom
  bottomActionPanel1 = g_ui.loadUI('actionbar', bottomPanel)
  bottomPanel:moveChildToIndex(bottomActionPanel1, 1)
  bottomActionPanel2 = g_ui.loadUI('actionbar', bottomPanel)
  bottomPanel:moveChildToIndex(bottomActionPanel2, 1)
  bottomActionPanel3 = g_ui.loadUI('actionbar', bottomPanel)
  bottomPanel:moveChildToIndex(bottomActionPanel3, 1)

  -- left
  leftActionPanel1 = g_ui.loadUI('sideactionbar', leftPanel)
  leftPanel:moveChildToIndex(leftActionPanel1, 1)
  leftActionPanel2 = g_ui.loadUI('sideactionbar', leftPanel)
  leftPanel:moveChildToIndex(leftActionPanel2, 1)
  leftActionPanel3 = g_ui.loadUI('sideactionbar', leftPanel)
  leftPanel:moveChildToIndex(leftActionPanel3, 1)

  -- right
  rightActionPanel1 = g_ui.loadUI('sideactionbar', rightPanel)
  rightPanel:moveChildToIndex(rightActionPanel1, 1)
  rightActionPanel2 = g_ui.loadUI('sideactionbar', rightPanel)
  rightPanel:moveChildToIndex(rightActionPanel2, 1)
  rightActionPanel3 = g_ui.loadUI('sideactionbar', rightPanel)
  rightPanel:moveChildToIndex(rightActionPanel3, 1)

  connect(g_game, {
    onGameStart = online,
    onGameEnd = offline,
    onSpellGroupCooldown = onSpellGroupCooldown,
    onSpellCooldown = onSpellCooldown
  })

  if g_game.isOnline() then
    online()
  end
end

function terminate()
  disconnect(g_game, {
    onGameStart = online,
    onGameEnd = offline,
    onSpellGroupCooldown = onSpellGroupCooldown,
    onSpellCooldown = onSpellCooldown
  })  

  -- remove hotkeys, also saves config
  local panels = {
    bottomActionPanel1,
    bottomActionPanel2,
    bottomActionPanel3,
    leftActionPanel1,
    leftActionPanel2,
    leftActionPanel3,
    rightActionPanel1,
    rightActionPanel2,
    rightActionPanel3,
  }

  for i, panel in ipairs(panels) do
    if panel.tabBar:getChildCount() > 0 then
      offline()
      break
    end
  end
  
  bottomActionPanel1:destroy()
  bottomActionPanel2:destroy()
  bottomActionPanel3:destroy()
  leftActionPanel1:destroy()
  leftActionPanel2:destroy()
  leftActionPanel3:destroy()
  rightActionPanel1:destroy()
  rightActionPanel2:destroy()
  rightActionPanel3:destroy()
end

function show()
  if not g_game.isOnline() then return end
  bottomActionPanel1:setOn(g_settings.getBoolean("actionbarBottom1", false))
  bottomActionPanel2:setOn(g_settings.getBoolean("actionbarBottom2", false))
  bottomActionPanel3:setOn(g_settings.getBoolean("actionbarBottom3", false))
  leftActionPanel1:setOn(g_settings.getBoolean("actionbarLeft1", false))
  leftActionPanel2:setOn(g_settings.getBoolean("actionbarLeft2", false))
  leftActionPanel3:setOn(g_settings.getBoolean("actionbarLeft3", false))
  rightActionPanel1:setOn(g_settings.getBoolean("actionbarRight1", false))
  rightActionPanel2:setOn(g_settings.getBoolean("actionbarRight2", false))
  rightActionPanel3:setOn(g_settings.getBoolean("actionbarRight3", false))
end

function hide()
  bottomActionPanel1:setOn(false)
  bottomActionPanel2:setOn(false)
  bottomActionPanel3:setOn(false)
  leftActionPanel1:setOn(false)
  leftActionPanel2:setOn(false)
  leftActionPanel3:setOn(false)
  rightActionPanel1:setOn(false)
  rightActionPanel2:setOn(false)
  rightActionPanel3:setOn(false)
end

function switchMode(newMode)
  if newMode then
    bottomActionPanel1:setImageColor('#ffffff88')  
    bottomActionPanel2:setImageColor('#ffffff88')  
    bottomActionPanel3:setImageColor('#ffffff88')
    leftActionPanel1:setImageColor('#ffffff88')
    leftActionPanel2:setImageColor('#ffffff88')
    leftActionPanel3:setImageColor('#ffffff88')
    rightActionPanel1:setImageColor('#ffffff88')
    rightActionPanel2:setImageColor('#ffffff88')
    rightActionPanel3:setImageColor('#ffffff88')
  else
    bottomActionPanel1:setImageColor('white')    
    bottomActionPanel2:setImageColor('white')    
    bottomActionPanel3:setImageColor('white') 
    leftActionPanel1:setImageColor('white') 
    leftActionPanel2:setImageColor('white') 
    leftActionPanel3:setImageColor('white') 
    rightActionPanel1:setImageColor('white') 
    rightActionPanel2:setImageColor('white') 
    rightActionPanel3:setImageColor('white') 
  end
end

function online()
  load()
  setupActionPanel(1, bottomActionPanel1, true)
  setupActionPanel(2, bottomActionPanel2, true)
  setupActionPanel(3, bottomActionPanel3, true)
  setupActionPanel(4, leftActionPanel1, false)
  setupActionPanel(5, leftActionPanel2, false)
  setupActionPanel(6, leftActionPanel3, false)
  setupActionPanel(7, rightActionPanel1, false)
  setupActionPanel(8, rightActionPanel2, false)
  setupActionPanel(9, rightActionPanel3, false)
  show()
end

function refresh(reloaded)
  offline(reloaded)
  online()
end

function offline(reloaded)
  hide()
  if hotkeyAssignWindow then
    hotkeyAssignWindow:destroy()
    hotkeyAssignWindow = nil
  end

  local gameRootPanel = modules.game_interface.getRootPanel()
  for index, panel in ipairs({bottomActionPanel1, bottomActionPanel2, bottomActionPanel3, 
                              leftActionPanel1, leftActionPanel2, leftActionPanel3, 
                              rightActionPanel1, rightActionPanel2, rightActionPanel3}) do
    settings[tostring(index)] = {}
    for i, child in ipairs(panel.tabBar:getChildren()) do
      if child.config and child.config.item then
        settings[tostring(index)][tostring(i)] = child.config
        if type(child.config.hotkey) == 'string' and child.config.hotkey:len() > 0 then
          g_keyboard.unbindKeyPress(child.config.hotkey, child.callback, gameRootPanel)
        end
      end
      if child.cooldownEvent then
        removeEvent(child.cooldownEvent)
      end
    end
    panel.tabBar:destroyChildren()
  end
  if not reloaded then
    save()
  end
end

function setupActionPanel(index, panel, bottom)
  local config = settings[tostring(index)] or {}
  
  for i=1,actionButtonsInPanel do
    local type = bottom and 'ActionButton' or 'SideActionButton'
    local action = g_ui.createWidget(type, panel.tabBar)
    action.config = config[tostring(i)] or {}
    setupAction(action)
  end  
  
  panel.nextButton.onClick = function()
    panel.tabBar:moveChildToIndex(panel.tabBar:getFirstChild(), panel.tabBar:getChildCount())
  end
  panel.prevButton.onClick = function()
    panel.tabBar:moveChildToIndex(panel.tabBar:getLastChild(), 1)  
  end
end

function setupAction(action)
  local config = action.config
  action.item:setShowCount(false)
  action.onMouseRelease = actionOnMouseRelease
  action.onTouchRelease = actionOnMouseRelease

  action.callback = function(k, c, ticks) 
    local lockKeyboard = g_settings.getBoolean('actionbarLock', false)
    local chatMode = not modules.game_walking.wsadWalking

    if not lockKeyboard or not chatMode then
      executeAction(action, ticks) 
    end
  end

  action.item.onItemChange = nil -- disable callbacks for setup
  
  if config then
    if type(config.text) == 'number' then
      config.text = tostring(config.text)
    end
    if type(config.hotkey) == 'number' then
      config.hotkey = tostring(config.hotkey)
    end
    if type(config.hotkey) == 'string' and config.hotkey:len() > 0 then
      local gameRootPanel = modules.game_interface.getRootPanel()
      g_keyboard.bindKeyPress(config.hotkey, action.callback, gameRootPanel)
      local text = config.hotkey
      -- formatting similar to cip Tibia 12
      local values = {
        {"Shift", "S"},
        {"Ctrl", "C"},
        {"+", ""},
        {"PageUp", "PgUp"},
        {"PageDown", "PgDown"},
        {"Enter", "Return"},
        {"Insert", "Ins"},
        {"Delete", "Del"},
        {"Escape", "Esc"}
      }
      for i, v in pairs(values) do
        text = text:gsub(v[1], v[2])
      end
      if text:len() > 6 then
        text = text:sub(text:len()-3,text:len())
        text = "..."..text
      end
      action.hotkeyLabel:setText(text)
    else
      action.hotkeyLabel:setText("")
    end

    action.text:setImageSource("")
    action.cooldownTill = 0
    action.cooldownStart = 0
    if type(config.text) == 'string' and config.text:len() > 0 then
      action.text:setText(config.text)
      action.item:setBorderColor(ActionColors.text)
      action.item:setOn(true) -- removes background
      action.item:setItemId(0)
      if Spells then
        local spell, profile = Spells.getSpellByWords(config.text:lower())
        action.spell = spell
        if action.spell and action.spell.icon and profile then
          action.text:setImageSource(SpelllistSettings[profile].iconFile)
          action.text:setImageClip(Spells.getImageClip(SpellIcons[action.spell.icon][1], profile))
          action.text:setText("")
        end
      end
    else      
      action.text:setText("")
      action.spell = nil
      if type(config.item) == 'number' and config.item > 100 then
        action.item:setOn(true)
        action.item:setItemId(config.item)
        action.item:setItemCount(config.count or 1)
        setupActionType(action, config.actionType)
      else
        action.item:setItemId(0)
        action.item:setOn(false)
        action.item:setBorderColor(ActionColors.empty)
      end    
    end
  end

  action.item.onItemChange = actionOnItemChange
end

function setupActionType(action, actionType)
  local item = action.item:getItem()
  if action.item:getItem():isMultiUse() then
    if not actionType or actionType <= ActionTypes.USE then
     actionType = ActionTypes.USE_WITH
    end
  elseif g_game.getClientVersion() >= 910 then
    if actionType ~= ActionTypes.USE and actionType ~= ActionTypes.EQUIP then
      actionType = ActionTypes.USE
    end
  else
    actionType = ActionTypes.USE
  end

  action.config.actionType = actionType
  if action.config.actionType == ActionTypes.USE then
    action.item:setBorderColor(ActionColors.itemUse)
  elseif action.config.actionType == ActionTypes.USE_SELF then
    action.item:setBorderColor(ActionColors.itemUseSelf)
  elseif action.config.actionType == ActionTypes.USE_TARGET then
    action.item:setBorderColor(ActionColors.itemUseTarget)
  elseif action.config.actionType == ActionTypes.USE_WITH then
    action.item:setBorderColor(ActionColors.itemUseWith)
  elseif action.config.actionType == ActionTypes.EQUIP then
    action.item:setBorderColor(ActionColors.itemEquip)
  end
end

function updateAction(action, newConfig)
  local config = action.config
  if type(config.hotkey) == 'string' and config.hotkey:len() > 0 then
    local gameRootPanel = modules.game_interface.getRootPanel()
    g_keyboard.unbindKeyPress(config.hotkey, action.callback, gameRootPanel)
  end
  for key, val in pairs(newConfig) do
    action.config[key] = val
  end
  setupAction(action)
end

function actionOnMouseRelease(action, mousePosition, mouseButton)
  if mouseButton == MouseTouch then return end
  if mouseButton == MouseRightButton or not action.item:isOn() then
    local menu = g_ui.createWidget('PopupMenu')
    menu:setGameMenu(true)
    if action.item:getItemId() > 0 then
      if action.item:getItem():isMultiUse() then
        menu:addOption(tr('Use on yourself'), function() return setupActionType(action, ActionTypes.USE_SELF) end)
        menu:addOption(tr('Use on target'), function() return setupActionType(action, ActionTypes.USE_TARGET) end)
        menu:addOption(tr('With crosshair'), function() return setupActionType(action, ActionTypes.USE_WITH) end)
      end
      if g_game.getClientVersion() >= 910 then
        if not action.item:getItem():isMultiUse() then
          menu:addOption(tr('Use'), function() return setupActionType(action, ActionTypes.USE) end)
        end
        menu:addOption(tr('Equip'), function() return setupActionType(action, ActionTypes.EQUIP) end)
      end
    else
      menu:addOption(tr('Select item'), function() return modules.game_itemselector.show(action.item) end)      
    end
    menu:addSeparator()
    menu:addOption(tr('Set text'), function() 
      modules.client_textedit.singlelineEditor(action.config.text or "", function(newText)
        updateAction(action, {text=newText, item=0})
      end)
    end)
    menu:addOption(tr('Set hotkey'), function()
      if hotkeyAssignWindow then
        hotkeyAssignWindow:destroy()
      end
      local assignWindow = g_ui.createWidget('ActionAssignWindow', rootWidget)
      assignWindow:grabKeyboard()
      assignWindow.comboPreview.keyCombo = ''
      assignWindow.onKeyDown = function(assignWindow, keyCode, keyboardModifiers)
        local keyCombo = determineKeyComboDesc(keyCode, keyboardModifiers)
        assignWindow.comboPreview:setText(tr('Current action hotkey: %s', keyCombo))
        assignWindow.comboPreview.keyCombo = keyCombo
        assignWindow.comboPreview:resizeToText()
        return true
      end
      assignWindow.onDestroy = function(widget)
        if widget == hotkeyAssignWindow then
          hotkeyAssignWindow = nil
        end
      end
      assignWindow.addButton.onClick = function()
        local text = tostring(assignWindow.comboPreview.keyCombo)
        updateAction(action, {hotkey=text})
        assignWindow:destroy()
      end
      hotkeyAssignWindow = assignWindow
    end)
    menu:addSeparator()
    menu:addOption(tr('Clear'), function()
      updateAction(action, {hotkey="", text="", item=0, count=1})
    end)
    menu:display(mousePosition)
    return true
  elseif mouseButton == MouseLeftButton or mouseButton == MouseTouch2 or mouseButton == MouseTouch3 then
    action.callback()
    return true
  end
  return false
end

function actionOnItemChange(widget)
  updateAction(widget:getParent(), {text="", item=widget:getItemId(), count=widget:getItemCountOrSubType()})
end

function onSpellCooldown(iconId, duration)
  for index, panel in ipairs({bottomActionPanel1, bottomActionPanel2, bottomActionPanel3, 
                              leftActionPanel1, leftActionPanel2, leftActionPanel3, 
                              rightActionPanel1, rightActionPanel2, rightActionPanel3}) do
    for i, child in ipairs(panel.tabBar:getChildren()) do
      if child.spell and child.spell.id == iconId then
        startCooldown(child, duration)
      end
    end
  end
end

function onSpellGroupCooldown(groupId, duration)
  for index, panel in ipairs({bottomActionPanel1, bottomActionPanel2, bottomActionPanel3, 
                              leftActionPanel1, leftActionPanel2, leftActionPanel3, 
                              rightActionPanel1, rightActionPanel2, rightActionPanel3}) do
    for i, child in ipairs(panel.tabBar:getChildren()) do
      if child.spell and child.spell.group then
        for group, dur in pairs(child.spell.group) do
          if groupId == group then
            startCooldown(child, duration)
          end
        end
      end
    end
  end
end

function startCooldown(action, duration)
  if type(action.cooldownTill) == 'number' and action.cooldownTill > g_clock.millis() + duration then
    return -- already has cooldown with greater duration
  end
  action.cooldownStart = g_clock.millis()
  action.cooldownTill = g_clock.millis() + duration
  updateCooldown(action)
end

function updateCooldown(action)
  if not action or not action.cooldownTill then return end
  local timeleft = action.cooldownTill - g_clock.millis()
  if timeleft <= 30 then
    action.cooldown:setPercent(100)
    action.cooldownEvent = nil
    action.cooldown:setText("")
    return
  end
  local duration = action.cooldownTill - action.cooldownStart
  local formattedText
  if timeleft > 60000 then
    formattedText = math.floor(timeleft / 60000) .. "m"
  else
    formattedText = timeleft/1000
    formattedText = math.floor(formattedText * 10) / 10
    formattedText = math.floor(formattedText) .. "." .. math.floor(formattedText * 10) % 10
  end
  action.cooldown:setText(formattedText) 
  action.cooldown:setPercent(100 - math.floor(100 * timeleft / duration))
  action.cooldownEvent = scheduleEvent(function() updateCooldown(action) end, 30)
end

function executeAction(action, ticks)
  if not action.config then return end
  if type(ticks) ~= 'number' then ticks = 0 end

  local actionDelay = 100  
  if ticks == 0 then
    actionDelay = 200 -- for first use
  elseif action.actionDelayTo ~= nil and g_clock.millis() < action.actionDelayTo then
    return
  end
  
  local actionType = action.config.actionType

  if type(action.config.text) == 'string' and action.config.text:len() > 0 then
    if g_app.isMobile() then -- turn to direction of targer
      local target = g_game.getAttackingCreature()
      if target then
        local pos = g_game.getLocalPlayer():getPosition()
        local tpos = target:getPosition()
        if pos and tpos then
          local offx = tpos.x - pos.x
          local offy = tpos.y - pos.y
          if offy < 0 and offx <= 0 and math.abs(offx) < math.abs(offy) then
            g_game.turn(Directions.North)
          elseif offy > 0 and offx >= 0 and math.abs(offx) < math.abs(offy) then
            g_game.turn(Directions.South)
          elseif offx < 0 and offy <= 0 and math.abs(offx) > math.abs(offy) then
            g_game.turn(Directions.West)
          elseif offx > 0 and offy >= 0 and math.abs(offx) > math.abs(offy) then
            g_game.turn(Directions.East)
          end
        end
      end
    end
    if modules.game_interface.isChatVisible() then
      modules.game_console.sendMessage(action.config.text)    
    else
      g_game.talk(action.config.text)
    end
    action.actionDelayTo = g_clock.millis() + actionDelay
  elseif action.item:getItemId() > 0 then    
    if actionType == ActionTypes.USE then
      if g_game.getClientVersion() < 780 then
        local item = g_game.findPlayerItem(action.item:getItemId(), action.item:getItemSubType() or -1)
        if item then
          g_game.use(item)
        end
      else
        g_game.useInventoryItem(action.item:getItemId())
      end
      action.actionDelayTo = g_clock.millis() + actionDelay
    elseif actionType == ActionTypes.USE_SELF then
      if g_game.getClientVersion() < 780 then
        local item = g_game.findPlayerItem(action.item:getItemId(), action.item:getItemSubType() or -1)
        if item then
          g_game.useWith(item, g_game.getLocalPlayer())
        end
      else
        g_game.useInventoryItemWith(action.item:getItemId(), g_game.getLocalPlayer(), action.item:getItemSubType() or -1)
      end
      action.actionDelayTo = g_clock.millis() + actionDelay
    elseif actionType == ActionTypes.USE_TARGET then
      local attackingCreature = g_game.getAttackingCreature()
      if not attackingCreature then
        local item = Item.create(action.item:getItemId())
        if g_game.getClientVersion() < 780 then
          local tmpItem = g_game.findPlayerItem(action.item:getItemId(), action.item:getItemSubType() or -1)
          if not tmpItem then return end
          item = tmpItem
        end

        modules.game_interface.startUseWith(item, action.item:getItemSubType() or - 1)
        return
      end

      if not attackingCreature:getTile() then return end
      if g_game.getClientVersion() < 780 then
        local item = g_game.findPlayerItem(action.item:getItemId(), action.item:getItemSubType() or -1)
        if item then
          g_game.useWith(item, attackingCreature, action.item:getItemSubType() or -1)
        end
      else
        g_game.useInventoryItemWith(action.item:getItemId(), attackingCreature, action.item:getItemSubType() or -1)
      end
      action.actionDelayTo = g_clock.millis() + actionDelay
    elseif actionType == ActionTypes.USE_WITH then
      local item = Item.create(action.item:getItemId())
      if g_game.getClientVersion() < 780 then
        local tmpItem = g_game.findPlayerItem(action.item:getItemId(), action.item:getItemSubType() or -1)
        if not tmpItem then return true end
        item = tmpItem
      end
      modules.game_interface.startUseWith(item, action.item:getItemSubType() or - 1)
    elseif actionType == ActionTypes.EQUIP then
      if g_game.getClientVersion() >= 910 then
        local item = Item.create(action.item:getItemId())
        g_game.equipItem(item)
        action.actionDelayTo = g_clock.millis() + actionDelay
      end
    end
  end
end

function save()
  local settingsFile = modules.client_profiles.getSettingsFilePath("actionbar.json")

  local status, result = pcall(function() return json.encode(settings, 2) end)
  if not status then
      return onError(
                 "Error while saving top bar settings. Data won't be saved. Details: " ..
                     result)
  end

  if result:len() > 100 * 1024 * 1024 then
      return onError(
                 "Something went wrong, file is above 100MB, won't be saved")
  end

  g_resources.writeFileContents(settingsFile, result)
end

function load()
  local settingsFile = modules.client_profiles.getSettingsFilePath("actionbar.json")

  if g_resources.fileExists(settingsFile) then
      local status, result = pcall(function()
          return json.decode(g_resources.readFileContents(settingsFile))
      end)
      if not status then
          return onError(
                     "Error while reading top bar settings file. To fix this problem you can delete storage.json. Details: " ..
                         result)
      end
      settings = result
  else
      settings = {}
  end
end

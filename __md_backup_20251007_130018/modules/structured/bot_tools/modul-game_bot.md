# ¦ Modul: `game_bot`

```lua

botWindow = nil

botButton = nil

contentsPanel = nil

editWindow = nil

local checkEvent = nil

local botStorage = {}

local botStorageFile = nil

local botWebSockets = {}

local botMessages = nil

local botTabs = nil

local botExecutor = nil

local configList = nil

local enableButton = nil

local executeEvent = nil

local statusLabel = nil

local configManagerUrl = "http://otclient.ovh/configs.php"

function init()

  dofile("executor")

  g_ui.importStyle("ui/basic.otui")

  g_ui.importStyle("ui/panels.otui")

  g_ui.importStyle("ui/config.otui")

  g_ui.importStyle("ui/icons.otui")

  g_ui.importStyle("ui/container.otui")

  connect(g_game, { 

    onGameStart = online, 

    onGameEnd = offline, 

})

  initCallbacks()  

  botButton = modules.client_topmenu.addRightGameToggleButton('botButton', tr('Bot'), '/images/topbuttons/bot', toggle, false, 99999)

  botButton:setOn(false)

  botButton:hide()

  botWindow = g_ui.loadUI('bot', modules.game_interface.getLeftPanel())

  botWindow:setup()

  contentsPanel = botWindow.contentsPanel

  configList = contentsPanel.config

  enableButton = contentsPanel.enableButton

  statusLabel = contentsPanel.statusLabel

  botMessages = contentsPanel.messages 

  botTabs = contentsPanel.botTabs

  botTabs:setContentWidget(contentsPanel.botPanel)  

  editWindow = g_ui.displayUI('edit')

  editWindow:hide()

  if g_game.isOnline() then

    clear()

    online()

  end

end

function terminate()

  save()

  clear()

  disconnect(g_game, { 

    onGameStart = online, 

    onGameEnd = offline, 

})

  terminateCallbacks()

  editWindow:destroy()

  botWindow:destroy()

  botButton:destroy()   

end

function clear()

  botExecutor = nil

  removeEvent(checkEvent)

  -- optimization, callback is not used when not needed

  g_game.enableTileThingLuaCallback(false)

  botTabs:clearTabs()  

  botTabs:setOn(false)

  botMessages:destroyChildren()

  botMessages:updateLayout()

  for i, socket in pairs(botWebSockets) do

    g_http.cancel(socket)

    botWebSockets[i] = nil

  end

  for i, widget in pairs(g_ui.getRootWidget():getChildren()) do

    if widget.botWidget then

      widget:destroy()

    end

  end

  for i, widget in pairs(modules.game_interface.gameMapPanel:getChildren()) do

    if widget.botWidget then

      widget:destroy()

    end

  end

  for _, widget in pairs({modules.game_interface.getRightPanel(), modules.game_interface.getLeftPanel()}) do

    for i, child in pairs(widget:getChildren()) do

      if child.botWidget then

        child:destroy()

      end

    end

  end

  local gameMapPanel = modules.game_interface.getMapPanel()

  if gameMapPanel then

    gameMapPanel:unlockVisibleFloor()   

  end

  if g_sounds then

    g_sounds.getChannel(SoundChannels.Bot):stop()

  end  

end

function refresh()

  if not g_game.isOnline() then return end

  save()

  clear()

  -- create bot dir

  if not g_resources.directoryExists("/bot") then

    g_resources.makeDir("/bot")

    if not g_resources.directoryExists("/bot") then

      return onError("Can't create bot directory in " .. g_resources.getWriteDir())

    end

  end

  -- get list of configs

  createDefaultConfigs()

  local configs = g_resources.listDirectoryFiles("/bot", false, false)  

  -- clean

  configList.onOptionChange = nil

  enableButton.onClick = nil

  configList:clearOptions()  

  -- select active config based on settings

  local settings = g_settings.getNode('bot') or {}

  local index = g_game.getCharacterName() .. "_" .. g_game.getClientVersion()

  if settings[index] == nil then

    settings[index] = {

      enabled=false,

      config=""

}

  end  

  -- init list and buttons

  for i=1,#configs do 

    configList:addOption(configs[i])

  end

  configList:setCurrentOption(settings[index].config)

  if configList:getCurrentOption().text ~= settings[index].config then

    settings[index].config = configList:getCurrentOption().text

    settings[index].enabled = false

  end

  enableButton:setOn(settings[index].enabled)

  configList.onOptionChange = function(widget)

    settings[index].config = widget:getCurrentOption().text

    g_settings.setNode('bot', settings)

    g_settings.save()

    refresh()

  end

  enableButton.onClick = function(widget)

    settings[index].enabled = not settings[index].enabled

    g_settings.setNode('bot', settings)

    g_settings.save()

    refresh()    

  end

  if not g_game.isOnline() or not settings[index].enabled then

    statusLabel:setOn(true)

    statusLabel:setText("Status: disabled\nPress off button to enable")

    return

  end

  local configName = settings[index].config

  -- storage

  botStorage = {}

  local path = "/bot/" .. configName .. "/storage/"

  if not g_resources.directoryExists(path) then

    g_resources.makeDir(path)

  end

  botStorageFile = path.."profile_" .. g_settings.getNumber('profile') .. ".json"

  if g_resources.fileExists(botStorageFile) then

    local status, result = pcall(function() 

      return json.decode(g_resources.readFileContents(botStorageFile)) 

    end)

    if not status then

      return onError("Error while reading storage (" .. botStorageFile .. "). To fix this problem you can delete storage.json. Details: " .. result)

    end

    botStorage = result

  end

  -- run script

  local status, result = pcall(function() 

    return executeBot(configName, botStorage, botTabs, message, save, refresh, botWebSockets) end

)

  if not status then

    return onError(result)

  end

  statusLabel:setOn(false)

  botExecutor = result

  check()

end

function save()

  if not botExecutor then

    return

  end

  local settings = g_settings.getNode('bot') or {}

  local index = g_game.getCharacterName() .. "_" .. g_game.getClientVersion()

  if settings[index] == nil then

    return

  end

  local status, result = pcall(function() 

    return json.encode(botStorage, 2) 

  end)

  if not status then

    return onError("Error while saving bot storage. Storage won't be saved. Details: " .. result)

  end

  if result:len() > 100 * 1024 * 1024 then

    return onError("Storage file is too big, above 100MB, it won't be saved")

  end

  g_resources.writeFileContents(botStorageFile, result)

end

function onMiniWindowClose()

  botButton:setOn(false)

end

function toggle()

  if botButton:isOn() then

    botWindow:close()

    botButton:setOn(false)

  else

    botWindow:open()

    botButton:setOn(true)

  end

end

function online()

  botButton:show()

  if not modules.client_profiles.ChangedProfile then

    scheduleEvent(refresh, 20)

  end

end

function offline()

  save()

  clear()

  botButton:hide()

  editWindow:hide()

end

function onError(message)

  statusLabel:setOn(true)

  statusLabel:setText("Error:\n" .. message)

  g_logger.error("[BOT] " .. message)

end

function edit()

  local configs = g_resources.listDirectoryFiles("/bot", false, false)  

  editWindow.manager.upload.config:clearOptions()  

  for i=1,#configs do 

    editWindow.manager.upload.config:addOption(configs[i])

  end

  editWindow.manager.download.config:setText("")

  editWindow:show()

  editWindow:focus()

  editWindow:raise()

end

function createDefaultConfigs()

  local defaultConfigFiles = g_resources.listDirectoryFiles("default_configs", false, false)

  for i, config_name in ipairs(defaultConfigFiles) do

    if not g_resources.directoryExists("/bot/" .. config_name) then

      g_resources.makeDir("/bot/" .. config_name)

      if not g_resources.directoryExists("/bot/" .. config_name) then

        return onError("Can't create /bot/" .. config_name .. " directory in " .. g_resources.getWriteDir())

      end

      local defaultConfigFiles = g_resources.listDirectoryFiles("default_configs/" .. config_name, true, false)

      for i, file in ipairs(defaultConfigFiles) do

        local baseName = file:split("/")

        baseName = baseName[#baseName]

        if g_resources.directoryExists(file) then

          g_resources.makeDir("/bot/" .. config_name .. "/" .. baseName)

          if not g_resources.directoryExists("/bot/" .. config_name .. "/" .. baseName) then

            return onError("Can't create /bot/" .. config_name  .. "/" .. baseName .. " directory in " .. g_resources.getWriteDir())

          end

          local defaultConfigFiles2 = g_resources.listDirectoryFiles("default_configs/" .. config_name .. "/" .. baseName, true, false)

          for i, file in ipairs(defaultConfigFiles2) do

            local baseName2 = file:split("/")

            baseName2 = baseName2[#baseName2]

            local contents = g_resources.fileExists(file) and g_resources.readFileContents(file) or ""

            if contents:len() > 0 then

              g_resources.writeFileContents("/bot/" .. config_name .. "/" .. baseName .. "/" .. baseName2, contents)

            end  

          end

        else

          local contents = g_resources.fileExists(file) and g_resources.readFileContents(file) or ""

          if contents:len() > 0 then

            g_resources.writeFileContents("/bot/" .. config_name .. "/" .. baseName, contents)

          end

        end

      end

    end

  end

end

function uploadConfig()

  local config = editWindow.manager.upload.config:getCurrentOption().text

  local archive = compressConfig(config)

  if not archive then

      return displayErrorBox(tr("Config upload failed"), tr("Config %s is invalid (can't be compressed)", config))

  end

  if archive:len() > 1024 * 1024 then

      return displayErrorBox(tr("Config upload failed"), tr("Config %s is too big, maximum size is 1024KB. Now it has %s KB.", config, math.floor(archive:len() / 1024)))

  end

  local infoBox = displayInfoBox(tr("Uploading config"), tr("Uploading config %s. Please wait.", config))

  HTTP.postJSON(configManagerUrl .. "?config=" .. config:gsub("%s+", "_"), archive, function(data, err)

    if infoBox then

      infoBox:destroy()

    end

    if err or data["error"] then      

      return displayErrorBox(tr("Config upload failed"), tr("Error while upload config %s:\n%s", config, err or data["error"]))

    end

    displayInfoBox(tr("Succesful config upload"), tr("Config %s has been uploaded.\n%s", config, data["message"]))

  end)  

end

function downloadConfig()

  local hash = editWindow.manager.download.config:getText()

  if hash:len() == 0 then

      return displayErrorBox(tr("Config download error"), tr("Enter correct config hash"))  

  end

  local infoBox = displayInfoBox(tr("Downloading config"), tr("Downloading config with hash %s. Please wait.", hash))

  HTTP.download(configManagerUrl .. "?hash=" .. hash, hash .. ".zip", function(path, checksum, err)

    if infoBox then

      infoBox:destroy()

    end

    if err then

      return displayErrorBox(tr("Config download error"), tr("Config with hash %s cannot be downloaded", hash))      

    end

    modules.client_textedit.show("", {

      title="Enter name for downloaded config",

      description="Config with hash " .. hash .. " has been downloaded. Enter name for new config.\nWarning: if config with same name already exist, it will be overwritten!",

      width=500

    }, function(configName)

      decompressConfig(configName, "/downloads/" .. path)

      refresh()

      edit()

    end)

  end)

end

function compressConfig(configName)

  if not g_resources.directoryExists("/bot/" .. configName) then

    return onError("Config " .. configName .. " doesn't exist")

  end

  local forArchive = {}

  for _, file in ipairs(g_resources.listDirectoryFiles("/bot/" .. configName)) do

    local fullPath = "/bot/" .. configName .. "/" .. file

    if g_resources.fileExists(fullPath) then -- regular file

        forArchive[file] = g_resources.readFileContents(fullPath)

    else -- dir

      for __, file2 in ipairs(g_resources.listDirectoryFiles(fullPath)) do

        local fullPath2 = fullPath .. "/" .. file2

        if g_resources.fileExists(fullPath2) then -- regular file

            forArchive[file .. "/" .. file2] = g_resources.readFileContents(fullPath2)

        end

      end

    end

  end

  return g_resources.createArchive(forArchive)

end

function decompressConfig(configName, archive)

  if g_resources.directoryExists("/bot/" .. configName) then

    g_resources.deleteFile("/bot/" .. configName) -- also delete dirs

  end

  local files = g_resources.decompressArchive(archive)

  g_resources.makeDir("/bot/" .. configName)

  if not g_resources.directoryExists("/bot/" .. configName) then

    return onError("Can't create /bot/" .. configName .. " directory in " .. g_resources.getWriteDir())

  end

  for file, contents in pairs(files) do

    local split = file:split("/")

    split[#split] = nil -- remove file name

    local dirPath = "/bot/" .. configName

    for _, s in ipairs(split) do

      dirPath = dirPath .. "/" .. s

      if not g_resources.directoryExists(dirPath) then

        g_resources.makeDir(dirPath)

        if not g_resources.directoryExists(dirPath) then

          return onError("Can't create " .. dirPath .. " directory in " .. g_resources.getWriteDir())

        end

      end

    end

    g_resources.writeFileContents("/bot/" .. configName .. file, contents)

  end

end

-- Executor

function message(category, msg)

  local widget = g_ui.createWidget('BotLabel', botMessages)

  widget.added = g_clock.millis()

  if category == 'error' then

    widget:setText(msg)

    widget:setColor("red")

    g_logger.error("[BOT] " .. msg)

  elseif category == 'warn' then

    widget:setText(msg)        

    widget:setColor("yellow")

    g_logger.warning("[BOT] " .. msg)

  elseif category == 'info' then

    widget:setText(msg)        

    widget:setColor("white")

    g_logger.info("[BOT] " .. msg)

  end

  if botMessages:getChildCount() > 5 then

    botMessages:getFirstChild():destroy()

  end

end

function check()

  removeEvent(checkEvent)

  if not botExecutor then

    return

  end

  checkEvent = scheduleEvent(check, 10)

  local status, result = pcall(function() 

    return botExecutor.script() 

  end)

  if not status then  

    botExecutor = nil -- critical

    return onError(result)

  end 

  -- remove old messages

  local widget = botMessages:getFirstChild()

  if widget and widget.added + 5000 < g_clock.millis() then

    widget:destroy()

  end

end

-- Callbacks

function initCallbacks()

  connect(rootWidget, {

    onKeyDown = botKeyDown,

    onKeyUp = botKeyUp,

    onKeyPress = botKeyPress 

})

  connect(g_game, { 

    onTalk = botOnTalk,

    onTextMessage = botOnTextMessage,

    onLoginAdvice = botOnLoginAdvice,

    onUse = botOnUse,

    onUseWith = botOnUseWith,

    onChannelList = botChannelList,

    onOpenChannel = botOpenChannel,

    onCloseChannel = botCloseChannel,

    onChannelEvent = botChannelEvent,

    onImbuementWindow = botImbuementWindow,

    onModalDialog = botModalDialog,

    onAttackingCreatureChange = botAttackingCreatureChange,

    onAddItem = botContainerAddItem,

    onRemoveItem = botContainerRemoveItem,

    onGameEditText = botGameEditText,

    onSpellCooldown = botSpellCooldown,

    onSpellGroupCooldown = botGroupSpellCooldown

})

  connect(Tile, {

    onAddThing = botAddThing,

    onRemoveThing = botRemoveThing 

})

  connect(Creature, {

    onAppear = botCreatureAppear,

    onDisappear = botCreatureDisappear,

    onPositionChange = botCreaturePositionChange,

    onHealthPercentChange = botCraetureHealthPercentChange,

    onTurn = botCreatureTurn,

    onWalk = botCreatureWalk,

})

  connect(LocalPlayer, {

    onPositionChange = botCreaturePositionChange,

    onHealthPercentChange = botCraetureHealthPercentChange,

    onTurn = botCreatureTurn,

    onWalk = botCreatureWalk,

    onManaChange = botManaChange,

    onStatesChange = botStatesChange,

    onInventoryChange = botInventoryChange

})

  connect(Container, {

    onOpen = botContainerOpen,

    onClose = botContainerClose,

    onUpdateItem = botContainerUpdateItem,

    onAddItem = botContainerAddItem,

    onRemoveItem = botContainerRemoveItem,

})

  connect(g_map, { 

    onMissle = botOnMissle,

    onAnimatedText = botOnAnimatedText,

    onStaticText = botOnStaticText

})

end

function terminateCallbacks()

  disconnect(rootWidget, {

    onKeyDown = botKeyDown,

    onKeyUp = botKeyUp,

    onKeyPress = botKeyPress 

})

  disconnect(g_game, { 

    onTalk = botOnTalk,

    onTextMessage = botOnTextMessage,

    onLoginAdvice = botOnLoginAdvice,

    onUse = botOnUse,

    onUseWith = botOnUseWith,

    onChannelList = botChannelList,

    onOpenChannel = botOpenChannel,

    onCloseChannel = botCloseChannel,

    onChannelEvent = botChannelEvent,

    onImbuementWindow = botImbuementWindow,

    onModalDialog = botModalDialog,

    onAttackingCreatureChange = botAttackingCreatureChange,

    onGameEditText = botGameEditText,

    onSpellCooldown = botSpellCooldown,

    onSpellGroupCooldown = botGroupSpellCooldown

})

  disconnect(Tile, {

    onAddThing = botAddThing,

    onRemoveThing = botRemoveThing 

})

  disconnect(Creature, {

    onAppear = botCreatureAppear,

    onDisappear = botCreatureDisappear,

    onPositionChange = botCreaturePositionChange,

    onHealthPercentChange = botCraetureHealthPercentChange,

    onTurn = botCreatureTurn,

    onWalk = botCreatureWalk,

})

  disconnect(LocalPlayer, {

    onPositionChange = botCreaturePositionChange,

    onHealthPercentChange = botCraetureHealthPercentChange,

    onTurn = botCreatureTurn,

    onWalk = botCreatureWalk,

    onManaChange = botManaChange,

    onStatesChange = botStatesChange,

    onInventoryChange = botInventoryChange

})

  disconnect(Container, {

    onOpen = botContainerOpen,

    onClose = botContainerClose,

    onUpdateItem = botContainerUpdateItem,

    onAddItem = botContainerAddItem, 

    onRemoveItem = botContainerRemoveItem

})

  disconnect(g_map, { 

    onMissle = botOnMissle,

    onAnimatedText = botOnAnimatedText,

    onStaticText = botOnStaticText

})

end

function safeBotCall(func)

  local status, result = pcall(func)

  if not status then    

    onError(result)

  end

end

function botKeyDown(widget, keyCode, keyboardModifiers)

  if botExecutor == nil then return false end

  if keyCode == KeyUnknown then return end

  safeBotCall(function() botExecutor.callbacks.onKeyDown(keyCode, keyboardModifiers) end)

end

function botKeyUp(widget, keyCode, keyboardModifiers)

  if botExecutor == nil then return false end

  if keyCode == KeyUnknown then return end

  safeBotCall(function() botExecutor.callbacks.onKeyUp(keyCode, keyboardModifiers) end)

end

function botKeyPress(widget, keyCode, keyboardModifiers, autoRepeatTicks)

  if botExecutor == nil then return false end

  if keyCode == KeyUnknown then return end

  safeBotCall(function() botExecutor.callbacks.onKeyPress(keyCode, keyboardModifiers, autoRepeatTicks) end)

end

function botOnTalk(name, level, mode, text, channelId, pos)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onTalk(name, level, mode, text, channelId, pos) end)

end

function botOnTextMessage(mode, text)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onTextMessage(mode, text) end)

end

function botOnLoginAdvice(message)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onLoginAdvice(message) end)

end

function botAddThing(tile, thing)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onAddThing(tile, thing) end)

end

function botRemoveThing(tile, thing)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onRemoveThing(tile, thing) end)

end

function botCreatureAppear(creature)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onCreatureAppear(creature) end)

end

function botCreatureDisappear(creature)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onCreatureDisappear(creature) end)

end

function botCreaturePositionChange(creature, newPos, oldPos)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onCreaturePositionChange(creature, newPos, oldPos) end)

end

function botCraetureHealthPercentChange(creature, healthPercent)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onCreatureHealthPercentChange(creature, healthPercent) end)

end

function botOnUse(pos, itemId, stackPos, subType)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onUse(pos, itemId, stackPos, subType) end)

end

function botOnUseWith(pos, itemId, target, subType)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onUseWith(pos, itemId, target, subType) end)

end

function botContainerOpen(container, previousContainer)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onContainerOpen(container, previousContainer) end)

end

function botContainerClose(container)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onContainerClose(container) end)

end

function botContainerUpdateItem(container, slot, item, oldItem)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onContainerUpdateItem(container, slot, item, oldItem) end)

end

function botOnMissle(missle)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onMissle(missle) end)

end

function botOnAnimatedText(thing, text)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onAnimatedText(thing, text) end)

end

function botOnStaticText(thing, text)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onStaticText(thing, text) end)

end

function botChannelList(channels)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onChannelList(channels) end)

end

function botOpenChannel(channelId, name)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onOpenChannel(channelId, name) end)

end

function botCloseChannel(channelId)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onCloseChannel(channelId) end)

end

function botChannelEvent(channelId, name, event)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onChannelEvent(channelId, name, event) end)

end

function botCreatureTurn(creature, direction)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onTurn(creature, direction) end)

end

function botCreatureWalk(creature, oldPos, newPos)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onWalk(creature, oldPos, newPos) end)

end

function botImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onImbuementWindow(itemId, slots, activeSlots, imbuements, needItems) end)

end

function botModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority) end)

end

function botGameEditText(id, itemId, maxLength, text, writer, time)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onGameEditText(id, itemId, maxLength, text, writer, time) end)

end

function botAttackingCreatureChange(creature, oldCreature)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onAttackingCreatureChange(creature,oldCreature) end)

end

function botManaChange(player, mana, maxMana, oldMana, oldMaxMana)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onManaChange(player, mana, maxMana, oldMana, oldMaxMana) end)

end

function botStatesChange(player, states, oldStates)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onStatesChange(player, states, oldStates) end)

end

function botContainerAddItem(container, slot, item, oldItem)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onAddItem(container, slot, item, oldItem) end)

end

function botContainerRemoveItem(container, slot, item)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onRemoveItem(container, slot, item) end)

end

function botSpellCooldown(iconId, duration)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onSpellCooldown(iconId, duration) end)

end

function botGroupSpellCooldown(iconId, duration)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onGroupSpellCooldown(iconId, duration) end)

end

function botInventoryChange(player, slot, item, oldItem)

  if botExecutor == nil then return false end

  safeBotCall(function() botExecutor.callbacks.onInventoryChange(player, slot, item, oldItem) end)

end

```

---
# bot.otmod

```text

Module

  name: game_bot

  description: Advanced OTClientV8 Bot

  author: otclient@otclient.ovh

  sandboxed: true

  scripts: [ bot ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# bot.otui

```otui

BotTabBar < TabBar

  tab-spacing: 1

  margin-left: 1

  margin-right: 1

  height: 20

  $on:

    visible: true

    margin-top: 2

  $!on:

    visible: false

    margin-top: -20

BotTabBarPanel < TabBarPanel

BotTabBarButton < TabBarButton

  padding: 4

  padding-right: 5

  text-horizontal-auto-resize: true

  $!first:

    margin-left: 0

MiniWindow

  id: botWindow

  !text: tr('Bot')

  height: 600

  icon: /images/topbuttons/bot

  @onClose: modules.game_bot.onMiniWindowClose()

  &save: true

  &autoOpen: 10

  MiniWindowContents   

    ComboBox

      id: config

      &menuScroll: true

      &menuHeight: 450

      &menuScrollStep: 100

      &parentWidth: true

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.right

      margin-top: 2

      margin-left: 2

      margin-right: 75

      text-offset: 3 0

    Button

      id: editConfig

      anchors.top: prev.top

      anchors.left: prev.right

      anchors.right: parent.right

      !text: tr('Edit')

      @onClick: modules.game_bot.edit()

      margin-left: 3

      margin-right: 37

    Button

      id: enableButton

      anchors.top: prev.top

      anchors.left: prev.right

      anchors.right: parent.right

      margin-left: 3

      margin-right: 2

      $on:

        text: On

        color: #00AA00

      $!on:

        text: Off

        color: #FF0000

    Label

      id: statusLabel

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

      text-wrap: true

      text-auto-resize: true

      text-align: center

      !text: tr('Status: waiting')

      margin-left: 3

      margin-right: 3

      $on:

        margin-top: 3

      $!on:

        text:

        margin-top: -13

    HorizontalSeparator

      anchors.left: parent.left

      anchors.right: parent.right

      anchors.top: prev.bottom

      margin-top: 3

      margin-left: 2

      margin-right: 2

    Panel

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

      id: messages

      layout:

        type: verticalBox

        fit-children: true

    HorizontalSeparator

      anchors.left: parent.left

      anchors.right: parent.right

      anchors.top: prev.bottom

      margin-top: 5

      margin-left: 2

      margin-right: 2

    BotTabBar

      id: botTabs

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

      margin-right: -20

    Panel

      id: botPanel

      margin-top: 2

      anchors.top: prev.bottom

      anchors.bottom: parent.bottom

      anchors.left: parent.left

      anchors.right: parent.right

```

---
# configs.png

```text

> ERROR: Nie udalo siae odczytaa‡ pliku ('utf-8' codec can't decode byte 0x89 in position 0: invalid start byte)

```

---
# edit.otui

```otui

MainWindow

  id: editWindow

  !text: tr("Config editor & manager")

  @onEscape: self:hide()

  size: 550 570

  $mobile:

    size: 550 240

  Panel

    id: manager

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    height: 152

    Label

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.right

      text-auto-resize: true

      text-align: center

      text-wrap: true

      !text: tr("Config Manager\nYou can use config manager to share configs between different machines, especially smartphones. After you configure your config, you can upload it, then you'll get unique hash code which you can use on diffent machinge (for eg. mobile phone) to download it.")

    HorizontalSeparator

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

      margin-top: 3

      height: 2

    Panel

      id: upload

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.horizontalCenter

      anchors.bottom: parent.bottom

      margin-top: 3

      Label

        anchors.top: parent.top

        anchors.left: parent.left

        anchors.right: parent.right

        text-auto-resize: true

        text-align: center

        text-wrap: true

        !text: tr("Upload config")

      Label

        anchors.top: prev.bottom

        anchors.left: parent.left

        anchors.right: parent.right

        margin-top: 7

        text-auto-resize: true

        text-align: center

        text-wrap: true

        !text: tr("Select config to upload")

      ComboBox

        id: config

        anchors.top: prev.bottom

        anchors.left: parent.left

        anchors.right: parent.right

        margin-top: 4

        margin-left: 20

        margin-right: 20

        text-offset: 3 0

      Button

        id: submit

        anchors.top: prev.bottom

        anchors.left: parent.left

        anchors.right: parent.right

        !text: tr('Upload config')

        margin-top: 4

        margin-left: 40

        margin-right: 40

        @onClick: modules.game_bot.uploadConfig()

    Panel

      id: download

      anchors.top: prev.top

      anchors.left: parent.horizontalCenter

      anchors.right: parent.right      

      anchors.bottom: parent.bottom

      Label

        anchors.top: parent.top

        anchors.left: parent.left

        anchors.right: parent.right

        text-auto-resize: true

        text-align: center

        text-wrap: true

        !text: tr("Download config")

      Label

        anchors.top: prev.bottom

        anchors.left: parent.left

        anchors.right: parent.right

        margin-top: 7

        text-auto-resize: true

        text-align: center

        text-wrap: true

        !text: tr("Enter config hash code")

      TextEdit

        id: config

        anchors.top: prev.bottom

        anchors.left: parent.left

        anchors.right: parent.right

        margin-top: 4

        margin-left: 20

        margin-right: 20

      Button

        id: submit

        anchors.top: prev.bottom

        anchors.left: parent.left

        anchors.right: parent.right

        !text: tr('Download config')

        margin-top: 4

        margin-left: 40

        margin-right: 40

        @onClick: modules.game_bot.downloadConfig()        

  HorizontalSeparator

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 3

    height: 2

  Panel

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right    

    margin-top: 5

    height: 330

    $mobile:

      visible: false

    Label

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.right

      text-auto-resize: true

      text-align: center

      text-wrap: true

      !text: tr("Bot configs are stored in:")

    TextEdit

      anchors.horizontalCenter: parent.horizontalCenter

      anchors.top: prev.bottom

      height: 20

      width: 400

      margin-top: 5

      editable: false

      !text: g_resources.getWriteDir() .. "bot"

      text-align: center

    Button

      id: documentationButton

      !text: tr('Click here to open bot directory')

      anchors.horizontalCenter: parent.horizontalCenter

      anchors.top: prev.bottom

      margin-top: 5

      width: 250

      @onClick: g_platform.openDir(g_resources.getWriteDir() .. "bot")

    Label

      margin-top: 5

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

      text-auto-resize: true

      text-align: center

      text-wrap: true

      !text: tr("Every directory in bot directory is treated as different config.\nTo create new config just create new directory.")

    Label

      margin-top: 5

      anchors.top: prev.bottom

      anchors.horizontalCenter: parent.horizontalCenter

      height: 175

      image-source: configs.png

      image-fixed-ratio: true

      image-size: 500 175

    Label

      margin-top: 3

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

      text-auto-resize: true

      text-align: center

      text-wrap: true

      !text: tr("Inside config directory put .lua and .otui files.\nEvery file will be loaded and executed in alphabetical order, .otui first and then .lua.")

    Label

      margin-top: 3

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

      text-auto-resize: true

      text-align: center

      text-wrap: true

      !text: tr("To reload configs just press On and Off in bot window.\nTo learn more about bot click Tutorials button.")

  Button

    !text: tr('Documentation')

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    width: 118

    @onClick: g_platform.openUrl("http://otclient.ovh/bot.php?documentation")

  Button

    !text: tr('Tutorials')

    anchors.bottom: parent.bottom

    anchors.left: prev.right

    margin-left: 5 

    width: 80

    @onClick: g_platform.openUrl("http://otclient.ovh/bot.php?tutorials")

  Button

    !text: tr('Scripts')

    anchors.bottom: parent.bottom

    anchors.left: prev.right

    margin-left: 5 

    width: 80

    @onClick: g_platform.openUrl("http://otclient.ovh/bot.php?scripts")

  Button

    !text: tr('Forum')

    anchors.bottom: parent.bottom

    anchors.left: prev.right

    margin-left: 5 

    width: 80

    @onClick: g_platform.openUrl("http://otclient.ovh/bot.php?forum")

  Button

    !text: tr('Discord')

    anchors.bottom: parent.bottom

    anchors.left: prev.right

    margin-left: 5 

    width: 80

    @onClick: g_platform.openUrl("http://otclient.ovh/bot.php?discord")

  Button

    id: cancelButton

    !text: tr('Close')

    anchors.bottom: parent.bottom

    anchors.right: parent.right

    width: 60

    @onClick: self:getParent():hide()

```

---
# executor.lua

```lua

function executeBot(config, storage, tabs, msgCallback, saveConfigCallback, reloadCallback, websockets)

  -- load lua and otui files

  local configFiles = g_resources.listDirectoryFiles("/bot/" .. config, true, false)  

  local luaFiles = {}

  local uiFiles = {}

  for i, file in ipairs(configFiles) do

    local ext = file:split(".")

    if ext[#ext]:lower() == "lua" then

      table.insert(luaFiles, file)

    end

    if ext[#ext]:lower() == "ui" or ext[#ext]:lower() == "otui" then

      table.insert(uiFiles, file)

    end

  end

  if #luaFiles == 0 then

    return error("Config (/bot/" .. config .. ") doesn't have lua files")

  end

  -- init bot variables

  local context = {}

  context.configDir = "/bot/".. config

  context.tabs = tabs

  context.mainTab = context.tabs:addTab("Main", g_ui.createWidget('BotPanel')).tabPanel.content

  context.panel = context.mainTab

  context.saveConfig = saveConfigCallback

  context.reload = reloadCallback

  context.storage = storage

  if context.storage._macros == nil then

    context.storage._macros = {} -- active macros

  end

  -- websockets, macros, hotkeys, scheduler, icons, callbacks

  context._websockets = websockets

  context._macros = {}

  context._hotkeys = {}

  context._scheduler = {}

  context._callbacks = {

    onKeyDown = {},

    onKeyUp = {},

    onKeyPress = {},

    onTalk = {},

    onTextMessage = {},

    onLoginAdvice = {},

    onAddThing = {},

    onRemoveThing = {},

    onCreatureAppear = {},

    onCreatureDisappear = {},

    onCreaturePositionChange = {},

    onCreatureHealthPercentChange = {},

    onUse = {},

    onUseWith = {},

    onContainerOpen = {},

    onContainerClose = {},

    onContainerUpdateItem = {},

    onMissle = {},

    onAnimatedText = {},

    onStaticText = {},

    onChannelList = {},

    onOpenChannel = {},

    onCloseChannel = {},

    onChannelEvent = {},

    onTurn = {},

    onWalk = {},

    onImbuementWindow = {},

    onModalDialog = {},

    onAttackingCreatureChange = {},

    onManaChange = {},

    onStatesChange = {},

    onAddItem = {},

    onGameEditText = {},

    onGroupSpellCooldown = {},

    onSpellCooldown = {},

    onRemoveItem = {},

    onInventoryChange = {}

}

  -- basic functions & classes

  context.print = print

  context.bit32 = bit32

  context.bit = bit

  context.pairs = pairs

  context.ipairs = ipairs

  context.tostring = tostring

  context.math = math

  context.table = table

  context.setmetatable = setmetatable

  context.string = string

  context.tonumber = tonumber

  context.type = type

  context.pcall = pcall

  context.os = {

    time = os.time,

    difftime = os.difftime,

    date = os.date,

    clock = os.clock

}

  context.load = function(str) return assert(load(str, nil, nil, context)) end

  context.loadstring = context.load

  context.assert = assert

  context.dofile = function(file) assert(load(g_resources.readFileContents("/bot/" .. config .. "/" .. file), file, nil, context))() end

  context.gcinfo = gcinfo

  context.tr = tr

  context.json = json

  context.base64 = base64

  context.regexMatch = regexMatch

  context.getDistanceBetween = function(p1, p2)

    return math.max(math.abs(p1.x - p2.x), math.abs(p1.y - p2.y))

  end

  context.isMobile = g_app.isMobile

  context.getVersion = g_app.getVersion

  -- classes

  context.g_resources = g_resources

  context.g_game = g_game

  context.g_map = g_map

  context.g_ui = g_ui

  context.g_sounds = g_sounds

  context.g_window = g_window

  context.g_mouse = g_mouse

  context.g_keyboard = g_keyboard

  context.g_things = g_things

  context.g_settings = g_settings

  context.g_platform = {

    openUrl = g_platform.openUrl,

    openDir = g_platform.openDir,

}

  context.Item = Item

  context.Creature = Creature

  context.ThingType = ThingType

  context.Effect = Effect

  context.Missile = Missile

  context.Player = Player

  context.Monster = Monster

  context.StaticText = StaticText

  context.HTTP = HTTP

  context.OutputMessage = OutputMessage

  context.modules = modules

  -- log functions

  context.info = function(text) return msgCallback("info", tostring(text)) end

  context.warn = function(text) return msgCallback("warn", tostring(text)) end

  context.error = function(text) return msgCallback("error", tostring(text)) end

  context.warning = context.warn      

  -- init context

  context.now = g_clock.millis()

  context.time = g_clock.millis()

  context.player = g_game.getLocalPlayer()

  -- init functions

  G.botContext = context

  dofiles("functions")

  context.Panels = {}

  dofiles("panels")

  G.botContext = nil

  -- run ui scripts

  for i, file in ipairs(uiFiles) do

    g_ui.importStyle(file)

  end

  -- run lua script

  for i, file in ipairs(luaFiles) do

    assert(load(g_resources.readFileContents(file), file, nil, context))()

    context.panel = context.mainTab -- reset default tab

  end

  return {

    script = function()      

      context.now = g_clock.millis()

      context.time = g_clock.millis()

      for i, macro in ipairs(context._macros) do

        if macro.lastExecution + macro.timeout <= context.now and macro.enabled then

          local status, result = pcall(function()

            if macro.callback(macro) then

                macro.lastExecution = context.now

            end

          end)

          if not status then

            context.error("Macro: " .. macro.name .. " execution error: " .. result)

          end

        end

      end

      while #context._scheduler > 0 and context._scheduler[1].execution <= g_clock.millis() do

        local status, result = pcall(function()

          context._scheduler[1].callback()

        end)

        if not status then

          context.error("Schedule execution error: " .. result)

        end

        table.remove(context._scheduler, 1)

      end

    end,

    callbacks = {

      onKeyDown = function(keyCode, keyboardModifiers)

        local keyDesc = determineKeyComboDesc(keyCode, keyboardModifiers)

        for i, macro in ipairs(context._macros) do

          if macro.switch and macro.hotkey == keyDesc then

            macro.switch:onClick()

          end

        end

        local hotkey = context._hotkeys[keyDesc]

        if hotkey then

          if hotkey.single then

            if hotkey.callback() then

              hotkey.lastExecution = context.now            

            end

          end

          if hotkey.switch then

            hotkey.switch:setOn(true)

          end

        end

        for i, callback in ipairs(context._callbacks.onKeyDown) do

          callback(keyDesc)

        end

      end,

      onKeyUp = function(keyCode, keyboardModifiers)

        local keyDesc = determineKeyComboDesc(keyCode, keyboardModifiers)

        local hotkey = context._hotkeys[keyDesc]

        if hotkey then        

          if hotkey.switch then

            hotkey.switch:setOn(false)

          end

        end

        for i, callback in ipairs(context._callbacks.onKeyUp) do

          callback(keyDesc)

        end

      end,

      onKeyPress = function(keyCode, keyboardModifiers, autoRepeatTicks)

        local keyDesc = determineKeyComboDesc(keyCode, keyboardModifiers)

        local hotkey = context._hotkeys[keyDesc]

        if hotkey and not hotkey.single then

          if hotkey.callback() then

            hotkey.lastExecution = context.now          

          end

        end

        for i, callback in ipairs(context._callbacks.onKeyPress) do

          callback(keyDesc, autoRepeatTicks)

        end

      end,

      onTalk = function(name, level, mode, text, channelId, pos)

        for i, callback in ipairs(context._callbacks.onTalk) do

          callback(name, level, mode, text, channelId, pos)

        end

      end,

      onImbuementWindow = function(itemId, slots, activeSlots, imbuements, needItems)

        for i, callback in ipairs(context._callbacks.onImbuementWindow) do

          callback(itemId, slots, activeSlots, imbuements, needItems)

        end

      end,

      onTextMessage = function(mode, text)

        for i, callback in ipairs(context._callbacks.onTextMessage) do

          callback(mode, text)

        end

      end,

      onLoginAdvice = function(message)

        for i, callback in ipairs(context._callbacks.onLoginAdvice) do

          callback(message)

        end

      end,      

      onAddThing = function(tile, thing)

        for i, callback in ipairs(context._callbacks.onAddThing) do

          callback(tile, thing)

        end      

      end,

      onRemoveThing = function(tile, thing)

        for i, callback in ipairs(context._callbacks.onRemoveThing) do

          callback(tile, thing)

        end      

      end,

      onCreatureAppear = function(creature)

        for i, callback in ipairs(context._callbacks.onCreatureAppear) do

          callback(creature)

        end      

      end,

      onCreatureDisappear = function(creature)

        for i, callback in ipairs(context._callbacks.onCreatureDisappear) do

          callback(creature)

        end

      end,

      onCreaturePositionChange = function(creature, newPos, oldPos)

        for i, callback in ipairs(context._callbacks.onCreaturePositionChange) do

          callback(creature, newPos, oldPos)

        end      

      end,

      onCreatureHealthPercentChange = function(creature, healthPercent)

        for i, callback in ipairs(context._callbacks.onCreatureHealthPercentChange) do

          callback(creature, healthPercent)

        end      

      end,

      onUse = function(pos, itemId, stackPos, subType)

        for i, callback in ipairs(context._callbacks.onUse) do

          callback(pos, itemId, stackPos, subType)

        end      

      end,

      onUseWith = function(pos, itemId, target, subType)

        for i, callback in ipairs(context._callbacks.onUseWith) do

          callback(pos, itemId, target, subType)

        end

      end,

      onContainerOpen = function(container, previousContainer)

        for i, callback in ipairs(context._callbacks.onContainerOpen) do

          callback(container, previousContainer)

        end

      end,

      onContainerClose = function(container)

        for i, callback in ipairs(context._callbacks.onContainerClose) do

          callback(container)

        end

      end,

      onContainerUpdateItem = function(container, slot, item, oldItem)

        for i, callback in ipairs(context._callbacks.onContainerUpdateItem) do

          callback(container, slot, item, oldItem)

        end

      end,

      onMissle = function(missle)

        for i, callback in ipairs(context._callbacks.onMissle) do

          callback(missle)

        end

      end,

      onAnimatedText = function(thing, text)

        for i, callback in ipairs(context._callbacks.onAnimatedText) do

          callback(thing, text)

        end

      end,

      onStaticText = function(thing, text)

        for i, callback in ipairs(context._callbacks.onStaticText) do

          callback(thing, text)

        end

      end,

      onChannelList = function(channels)

        for i, callback in ipairs(context._callbacks.onChannelList) do

          callback(channels)

        end      

      end,

      onOpenChannel = function(channelId, channelName)

        for i, callback in ipairs(context._callbacks.onOpenChannel) do

          callback(channels)

        end      

      end,

      onCloseChannel = function(channelId)

        for i, callback in ipairs(context._callbacks.onCloseChannel) do

          callback(channelId)

        end      

      end,

      onChannelEvent = function(channelId, name, event)

        for i, callback in ipairs(context._callbacks.onChannelEvent) do

          callback(channelId, name, event)

        end      

      end,

      onTurn = function(creature, direction)

        for i, callback in ipairs(context._callbacks.onTurn) do

          callback(creature, direction)

        end      

      end,

      onWalk = function(creature, oldPos, newPos)

        for i, callback in ipairs(context._callbacks.onWalk) do

          callback(creature, oldPos, newPos)

        end      

      end,

      onModalDialog = function(id, title, message, buttons, enterButton, escapeButton, choices, priority)

        for i, callback in ipairs(context._callbacks.onModalDialog) do

          callback(id, title, message, buttons, enterButton, escapeButton, choices, priority)

        end

      end,

      onGameEditText = function(id, itemId, maxLength, text, writer, time)

        for i, callback in ipairs(context._callbacks.onGameEditText) do

          callback(id, itemId, maxLength, text, writer, time)

        end

      end,

      onAttackingCreatureChange = function(creature, oldCreature)

        for i, callback in ipairs(context._callbacks.onAttackingCreatureChange) do

          callback(creature, oldCreature)

        end

      end,

      onManaChange = function(player, mana, maxMana, oldMana, oldMaxMana)

        for i, callback in ipairs(context._callbacks.onManaChange) do

          callback(player, mana, maxMana, oldMana, oldMaxMana)

        end

      end,

      onAddItem = function(container, slot, item)

        for i, callback in ipairs(context._callbacks.onAddItem) do

          callback(container, slot, item)

        end

      end,

      onRemoveItem = function(container, slot, item)

        for i, callback in ipairs(context._callbacks.onRemoveItem) do

          callback(container, slot, item)

        end

      end,

      onStatesChange = function(player, states, oldStates)

        for i, callback in ipairs(context._callbacks.onStatesChange) do

          callback(player, states, oldStates)

        end

      end,

      onGroupSpellCooldown = function(iconId, duration)

        for i, callback in ipairs(context._callbacks.onGroupSpellCooldown) do

          callback(iconId, duration)

        end

      end,

      onSpellCooldown = function(iconId, duration)

        for i, callback in ipairs(context._callbacks.onSpellCooldown) do

          callback(iconId, duration)

        end

      end,

      onSpellCooldown = function(iconId, duration)

        for i, callback in ipairs(context._callbacks.onSpellCooldown) do

          callback(iconId, duration)

        end

      end,

      onInventoryChange = function(player, slot, item, oldItem)

        for i, callback in ipairs(context._callbacks.onInventoryChange) do

          callback(player, slot, item, oldItem)

        end

      end

}

}

end

```

---
# scripts.png

```text

> ERROR: Nie udalo siae odczytaa‡ pliku ('utf-8' codec can't decode byte 0x89 in position 0: invalid start byte)

```

---

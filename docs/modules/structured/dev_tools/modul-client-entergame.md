# Moduł: | Moduł: `client_entergame`
```lua

CharacterList = { }

-- private variables

local charactersWindow

local loadBox

local characterList

local errorBox

local waitingWindow

local autoReconnectButton

local updateWaitEvent

local resendWaitEvent

local loginEvent

local autoReconnectEvent

local lastLogout = 0

-- private functions

local function tryLogin(charInfo, tries)

  tries = tries or 1

  if tries > 50 then

    return

  end

  if g_game.isOnline() then

    if tries == 1 then

      g_game.safeLogout()

    end

    loginEvent = scheduleEvent(function() tryLogin(charInfo, tries+1) end, 100)

    return

  end

  CharacterList.hide()

  g_game.loginWorld(G.account, G.password, charInfo.worldName, charInfo.worldHost, charInfo.worldPort, charInfo.characterName, G.authenticatorToken, G.sessionKey)

  g_logger.info("Login to " .. charInfo.worldHost .. ":" .. charInfo.worldPort)

  loadBox = displayCancelBox(tr('Please wait'), tr('Connecting to game server...'))

  connect(loadBox, { onCancel = function()

                                  loadBox = nil

                                  g_game.cancelLogin()

                                  CharacterList.show()

                                end })

  -- save last used character

  g_settings.set('last-used-character', charInfo.characterName)

  g_settings.set('last-used-world', charInfo.worldName)

end

local function updateWait(timeStart, timeEnd)

  if waitingWindow then

    local time = g_clock.seconds()

    if time <= timeEnd then

      local percent = ((time - timeStart) / (timeEnd - timeStart)) * 100

      local timeStr = string.format("%.0f", timeEnd - time)

      local progressBar = waitingWindow:getChildById('progressBar')

      progressBar:setPercent(percent)

      local label = waitingWindow:getChildById('timeLabel')

      label:setText(tr('Trying to reconnect in %s seconds.', timeStr))

      updateWaitEvent = scheduleEvent(function() updateWait(timeStart, timeEnd) end, 1000 * progressBar:getPercentPixels() / 100 * (timeEnd - timeStart))

      return true

    end

  end

  if updateWaitEvent then

    updateWaitEvent:cancel()

    updateWaitEvent = nil

  end

end

local function resendWait()

  if waitingWindow then

    waitingWindow:destroy()

    waitingWindow = nil

    if updateWaitEvent then

      updateWaitEvent:cancel()

      updateWaitEvent = nil

    end

    if charactersWindow then

      local selected = characterList:getFocusedChild()

      if selected then

        local charInfo = { worldHost = selected.worldHost,

                           worldPort = selected.worldPort,

                           worldName = selected.worldName,

                           characterName = selected.characterName }

        tryLogin(charInfo)

      end

    end

  end

end

local function onLoginWait(message, time)

  CharacterList.destroyLoadBox()

  waitingWindow = g_ui.displayUI('waitinglist')

  local label = waitingWindow:getChildById('infoLabel')

  label:setText(message)

  updateWaitEvent = scheduleEvent(function() updateWait(g_clock.seconds(), g_clock.seconds() + time) end, 0)

  resendWaitEvent = scheduleEvent(resendWait, time * 1000)

end

function onGameLoginError(message)

  CharacterList.destroyLoadBox()

  errorBox = displayErrorBox(tr("Login Error"), message)

  errorBox.onOk = function()

    errorBox = nil

    CharacterList.showAgain()

  end

  scheduleAutoReconnect()

end

function onGameLoginToken(unknown)

  CharacterList.destroyLoadBox()

  -- TODO: make it possible to enter a new token here / prompt token

  errorBox = displayErrorBox(tr("Two-Factor Authentification"), 'A new authentification token is required.\nPlease login again.')

  errorBox.onOk = function()

    errorBox = nil

    EnterGame.show()

  end

end

function onGameConnectionError(message, code)

  CharacterList.destroyLoadBox()

  if (not g_game.isOnline() or code ~= 2) and not errorBox then -- code 2 is normal disconnect, end of file

    local text = translateNetworkError(code, g_game.getProtocolGame() and g_game.getProtocolGame():isConnecting(), message)

    errorBox = displayErrorBox(tr("Connection Error"), text)

    errorBox.onOk = function()

      errorBox = nil

      CharacterList.showAgain()

    end

  end

  scheduleAutoReconnect()

end

function onGameUpdateNeeded(signature)

  CharacterList.destroyLoadBox()

  errorBox = displayErrorBox(tr("Update needed"), tr('Enter with your account again to update your client.'))

  errorBox.onOk = function()

    errorBox = nil

    CharacterList.showAgain()

  end

end

function onGameEnd()

  scheduleAutoReconnect()

  CharacterList.showAgain()

end

function onLogout()

  lastLogout = g_clock.millis()

end

function scheduleAutoReconnect()

  if lastLogout + 2000 > g_clock.millis() then

    return

  end

  if autoReconnectEvent then

    removeEvent(autoReconnectEvent)

  end

  autoReconnectEvent = scheduleEvent(executeAutoReconnect, 2500)

end

function executeAutoReconnect()

  if not autoReconnectButton or not autoReconnectButton:isOn() or g_game.isOnline() then

    return

  end

  if errorBox then

    errorBox:destroy()

    errorBox = nil

  end

  CharacterList.doLogin()

end

-- public functions

function CharacterList.init()

  if USE_NEW_ENERGAME then return end

  connect(g_game, { onLoginError = onGameLoginError })

  connect(g_game, { onLoginToken = onGameLoginToken })

  connect(g_game, { onUpdateNeeded = onGameUpdateNeeded })

  connect(g_game, { onConnectionError = onGameConnectionError })

  connect(g_game, { onGameStart = CharacterList.destroyLoadBox })

  connect(g_game, { onLoginWait = onLoginWait })

  connect(g_game, { onGameEnd = onGameEnd })

  connect(g_game, { onLogout = onLogout })

  if G.characters then

    CharacterList.create(G.characters, G.characterAccount)

  end

end

function CharacterList.terminate()

 if USE_NEW_ENERGAME then return end

  disconnect(g_game, { onLoginError = onGameLoginError })

  disconnect(g_game, { onLoginToken = onGameLoginToken })

  disconnect(g_game, { onUpdateNeeded = onGameUpdateNeeded })

  disconnect(g_game, { onConnectionError = onGameConnectionError })

  disconnect(g_game, { onGameStart = CharacterList.destroyLoadBox })

  disconnect(g_game, { onLoginWait = onLoginWait })

  disconnect(g_game, { onGameEnd = onGameEnd })

  disconnect(g_game, { onLogout = onLogout })

  if charactersWindow then

    characterList = nil

    charactersWindow:destroy()

    charactersWindow = nil

  end

  if loadBox then

    g_game.cancelLogin()

    loadBox:destroy()

    loadBox = nil

  end

  if waitingWindow then

    waitingWindow:destroy()

    waitingWindow = nil

  end

  if updateWaitEvent then

    removeEvent(updateWaitEvent)

    updateWaitEvent = nil

  end

  if resendWaitEvent then

    removeEvent(resendWaitEvent)

    resendWaitEvent = nil

  end

  if loginEvent then

    removeEvent(loginEvent)

    loginEvent = nil

  end

  CharacterList = nil

end

function CharacterList.create(characters, account, otui)

  if not otui then otui = 'characterlist' end

  if charactersWindow then

    charactersWindow:destroy()

  end

  charactersWindow = g_ui.displayUI(otui)

  characterList = charactersWindow:getChildById('characters')

  autoReconnectButton = charactersWindow:getChildById('autoReconnect')

  -- characters

  G.characters = characters

  G.characterAccount = account

  characterList:destroyChildren()

  local accountStatusLabel = charactersWindow:getChildById('accountStatusLabel')

  local focusLabel

  for i,characterInfo in ipairs(characters) do

    local widget = g_ui.createWidget('CharacterWidget', characterList)

    for key,value in pairs(characterInfo) do

      local subWidget = widget:getChildById(key)

      if subWidget then

        if key == 'outfit' then -- it's an exception

          subWidget:setOutfit(value)

        else

          local text = value

          if subWidget.baseText and subWidget.baseTranslate then

            text = tr(subWidget.baseText, text)

          elseif subWidget.baseText then

            text = string.format(subWidget.baseText, text)

          end

          subWidget:setText(text)

        end

      end

    end

    -- these are used by login

    widget.characterName = characterInfo.name

    widget.worldName = characterInfo.worldName

    widget.worldHost = characterInfo.worldIp

    widget.worldPort = characterInfo.worldPort

    connect(widget, { onDoubleClick = function () CharacterList.doLogin() return true end } )

    if i == 1 or (g_settings.get('last-used-character') == widget.characterName and g_settings.get('last-used-world') == widget.worldName) then

      focusLabel = widget

    end

  end

  if focusLabel then

    characterList:focusChild(focusLabel, KeyboardFocusReason)

    addEvent(function() characterList:ensureChildVisible(focusLabel) end)

  end

  characterList.onChildFocusChange = function()

    removeEvent(autoReconnectEvent)

    autoReconnectEvent = nil

  end

  -- account

  local status = ''

  if account.status == AccountStatus.Frozen then

    status = tr(' (Frozen)')

  elseif account.status == AccountStatus.Suspended then

    status = tr(' (Suspended)')

  end

  if account.subStatus == SubscriptionStatus.Free and account.premDays < 1 then

    accountStatusLabel:setText(('%s%s'):format(tr('Free Account'), status))

  else

    if account.premDays == 0 or account.premDays == 65535 then

      accountStatusLabel:setText(('%s%s'):format(tr('Gratis Premium Account'), status))

    else

      accountStatusLabel:setText(('%s%s'):format(tr('Premium Account (%s) days left', account.premDays), status))

    end

  end

  if account.premDays > 0 and account.premDays <= 7 then

    accountStatusLabel:setOn(true)

  else

    accountStatusLabel:setOn(false)

  end

  autoReconnectButton.onClick = function(widget)

    local autoReconnect = not g_settings.getBoolean('autoReconnect', true)

    autoReconnectButton:setOn(autoReconnect)

    g_settings.set('autoReconnect', autoReconnect)

  end

end

function CharacterList.destroy()

  CharacterList.hide(true)

  if charactersWindow then

    characterList = nil

    charactersWindow:destroy()

    charactersWindow = nil

  end

end

function CharacterList.show()

  if loadBox or errorBox or not charactersWindow then return end

  charactersWindow:show()

  charactersWindow:raise()

  charactersWindow:focus()

  local autoReconnect = g_settings.getBoolean('autoReconnect', true)

  autoReconnectButton:setOn(autoReconnect)

end

function CharacterList.hide(showLogin)

  removeEvent(autoReconnectEvent)

  autoReconnectEvent = nil

  showLogin = showLogin or false

  charactersWindow:hide()

  if showLogin and EnterGame and not g_game.isOnline() then

    EnterGame.show()

  end

end

function CharacterList.showAgain()

  if characterList and characterList:hasChildren() then

    CharacterList.show()

  end

end

function CharacterList.isVisible()

  if charactersWindow and charactersWindow:isVisible() then

    return true

  end

  return false

end

function CharacterList.doLogin()

  removeEvent(autoReconnectEvent)

  autoReconnectEvent = nil

  local selected = characterList:getFocusedChild()

  if selected then

    local charInfo = { worldHost = selected.worldHost,

                       worldPort = selected.worldPort,

                       worldName = selected.worldName,

                       characterName = selected.characterName }

    charactersWindow:hide()

    if loginEvent then

      removeEvent(loginEvent)

      loginEvent = nil

    end

    tryLogin(charInfo)

  else

    displayErrorBox(tr('Error'), tr('You must select a character to login!'))

  end

end

function CharacterList.destroyLoadBox()

  if loadBox then

    loadBox:destroy()

    loadBox = nil

  end

end

function CharacterList.cancelWait()

  if waitingWindow then

    waitingWindow:destroy()

    waitingWindow = nil

  end

  if updateWaitEvent then

    removeEvent(updateWaitEvent)

    updateWaitEvent = nil

  end

  if resendWaitEvent then

    removeEvent(resendWaitEvent)

    resendWaitEvent = nil

  end

  CharacterList.destroyLoadBox()

  CharacterList.showAgain()

end

```

---
# characterlist.otui
```otui

CharacterWidget < UIWidget

  height: 14

  background-color: alpha

  &updateOnStates: |

    function(self)

      local children = self:getChildren()

      for i=1,#children do

        children[i]:setOn(self:isFocused())

      end

    end

  @onFocusChange: self:updateOnStates()

  @onSetup: self:updateOnStates()

  $focus:

    background-color: #ffffff22

  Label

    id: name

    color: #bbbbbb

    anchors.top: parent.top

    anchors.left: parent.left

    font: verdana-11px-monochrome

    text-auto-resize: true

    background-color: alpha

    text-offset: 2 0

    $on:

      color: #ffffff

  Label

    id: worldName

    color: #bbbbbb

    anchors.top: parent.top

    anchors.right: parent.right

    margin-right: 5

    font: verdana-11px-monochrome

    text-auto-resize: true

    background-color: alpha

    &baseText: '(%s)'

    $on:

      color: #ffffff

StaticMainWindow

  id: charactersWindow

  !text: tr('Character List')

  visible: false

  size: 350 400

  $mobile:

    size: 350 280

  @onEnter: CharacterList.doLogin()

  @onEscape: CharacterList.hide(true)

  @onSetup: |

    g_keyboard.bindKeyPress('Up', function() self:getChildById('characters'):focusPreviousChild(KeyboardFocusReason) end, self)

    g_keyboard.bindKeyPress('Down', function() self:getChildById('characters'):focusNextChild(KeyboardFocusReason) end, self)

  TextList

    id: characters

    background-color: #565656

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: characterListScrollBar.left

    anchors.bottom: accountStatusCaption.top

    margin-bottom: 5

    padding: 1

    focusable: false

    vertical-scrollbar: characterListScrollBar

    auto-focus: first

  VerticalScrollBar

    id: characterListScrollBar

    anchors.top: parent.top

    anchors.bottom: accountStatusCaption.top

    anchors.right: parent.right

    margin-bottom: 5

    step: 14

    pixels-scroll: true

  Label

    id: accountStatusCaption

    !text: tr('Account Status') .. ':'

    anchors.left: parent.left

    anchors.bottom: separator.top

    margin-bottom: 5

  Label

    id: accountStatusLabel

    !text: tr('Free Account')

    anchors.right: parent.right

    anchors.bottom: separator.top

    margin-bottom: 5

    text-auto-resize: true

    $on:

      color: #FF0000

  HorizontalSeparator

    id: separator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: next.top

    margin-bottom: 10

  Button

    id: autoReconnect

    width: 140

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    $!on:

      image-color: red

      !text: tr('Auto reconnect: Off')

    $on:

      !text: tr('Auto reconnect: On')

      image-color: green

  Button

    id: buttonOk

    !text: tr('Ok')

    width: 64

    anchors.right: next.left

    anchors.bottom: parent.bottom

    margin-right: 10

    @onClick: CharacterList.doLogin()

  Button

    id: buttonCancel

    !text: tr('Cancel')

    width: 64

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    @onClick: CharacterList.hide(true)

```

---
# entergame.lua
```lua

EnterGame = { }

-- private variables

local loadBox

local enterGame

local enterGameButton

local clientBox

local protocolLogin

local server = nil

local versionsFound = false

local customServerSelectorPanel

local serverSelectorPanel

local serverSelector

local clientVersionSelector

local serverHostTextEdit

local rememberPasswordBox

local protos = {"740", "760", "772", "792", "800", "810", "854", "860", "870", "910", "961", "1000", "1077", "1090", "1096", "1098", "1099", "1100", "1200", "1220"}

local checkedByUpdater = {}

local waitingForHttpResults = 0

-- private functions

local function onProtocolError(protocol, message, errorCode)

  if errorCode then

    return EnterGame.onError(message)

  end

  return EnterGame.onLoginError(message)

end

local function onSessionKey(protocol, sessionKey)

  G.sessionKey = sessionKey

end

local function onCharacterList(protocol, characters, account, otui)

  if rememberPasswordBox:isChecked() then

    local account = g_crypt.encrypt(G.account)

    local password = g_crypt.encrypt(G.password)

    g_settings.set('account', account)

    g_settings.set('password', password)

  else

    EnterGame.clearAccountFields()

  end

  for _, characterInfo in pairs(characters) do

    if characterInfo.previewState and characterInfo.previewState ~= PreviewState.Default then

      characterInfo.worldName = characterInfo.worldName .. ', Preview'

    end

  end

  if loadBox then

    loadBox:destroy()

    loadBox = nil

  end

  CharacterList.create(characters, account, otui)

  CharacterList.show()

  g_settings.save()

end

local function onUpdateNeeded(protocol, signature)

  return EnterGame.onError(tr('Your client needs updating, try redownloading it.'))

end

local function onProxyList(protocol, proxies)

  for _, proxy in ipairs(proxies) do

    g_proxy.addProxy(proxy["host"], proxy["port"], proxy["priority"])

  end

end

local function parseFeatures(features)

  for feature_id, value in pairs(features) do

      if value == "1" or value == "true" or value == true then

        g_game.enableFeature(feature_id)

      else

        g_game.disableFeature(feature_id)

      end

  end

end

local function validateThings(things)

  local incorrectThings = ""

  local missingFiles = false

  local versionForMissingFiles = 0

  if things ~= nil then

    local thingsNode = {}

    for thingtype, thingdata in pairs(things) do

      thingsNode[thingtype] = thingdata[1]

      if not g_resources.fileExists("/things/" .. thingdata[1]) then

        incorrectThings = incorrectThings .. "Missing file: " .. thingdata[1] .. "\n"

        missingFiles = true

        versionForMissingFiles = thingdata[1]:split("/")[1]

      else

        local localChecksum = g_resources.fileChecksum("/things/" .. thingdata[1]):lower()

        if localChecksum ~= thingdata[2]:lower() and #thingdata[2] > 1 then

          if g_resources.isLoadedFromArchive() then -- ignore checksum if it's test/debug version

            incorrectThings = incorrectThings .. "Invalid checksum of file: " .. thingdata[1] .. " (is " .. localChecksum .. ", should be " .. thingdata[2]:lower() .. ")\n"

          end

        end

      end

    end

    g_settings.setNode("things", thingsNode)

  else

    g_settings.setNode("things", {})

  end

  if missingFiles then

    incorrectThings = incorrectThings .. "\nYou should open data/things and create directory " .. versionForMissingFiles ..

    ".\nIn this directory (data/things/" .. versionForMissingFiles .. ") you should put missing\nfiles (Tibia.dat and Tibia.spr/Tibia.cwm) " ..

    "from correct Tibia version."

  end

  return incorrectThings

end

local function onTibia12HTTPResult(session, playdata)

  local characters = {}

  local worlds = {}

  local account = {

    status = 0,

    subStatus = 0,

    premDays = 0

}

  if session["status"] ~= "active" then

    account.status = 1

  end

  if session["ispremium"] then

    account.subStatus = 1 -- premium

  end

  if session["premiumuntil"] > g_clock.seconds() then

    account.subStatus = math.floor((session["premiumuntil"] - g_clock.seconds()) / 86400)

  end

  local things = {

    data = {G.clientVersion .. "/Tibia.dat", ""},

    sprites = {G.clientVersion .. "/Tibia.cwm", ""},

}

  local incorrectThings = validateThings(things)

  if #incorrectThings > 0 then

    things = {

      data = {G.clientVersion .. "/Tibia.dat", ""},

      sprites = {G.clientVersion .. "/Tibia.spr", ""},

}

    incorrectThings = validateThings(things)

  end

  if #incorrectThings > 0 then

    g_logger.error(incorrectThings)

    if Updater and not checkedByUpdater[G.clientVersion] then

      checkedByUpdater[G.clientVersion] = true

      return Updater.check({

        version = G.clientVersion,

        host = G.host

})

    else

      return EnterGame.onError(incorrectThings)

    end

  end

  onSessionKey(nil, session["sessionkey"])

  for _, world in pairs(playdata["worlds"]) do

    worlds[world.id] = {

      name = world.name,

      port = world.externalportunprotected or world.externalportprotected or world.externaladdress,

      address = world.externaladdressunprotected or world.externaladdressprotected or world.externalport

}

  end

  for _, character in pairs(playdata["characters"]) do

    local world = worlds[character.worldid]

    if world then

      table.insert(characters, {

        name = character.name,

        worldName = world.name,

        worldIp = world.address,

        worldPort = world.port

})

    end

  end

  -- proxies

  if g_proxy then

    g_proxy.clear()

    if playdata["proxies"] then

      for i, proxy in ipairs(playdata["proxies"]) do

        g_proxy.addProxy(proxy["host"], tonumber(proxy["port"]), tonumber(proxy["priority"]))

      end

    end

  end

  g_game.setCustomProtocolVersion(0)

  g_game.chooseRsa(G.host)

  g_game.setClientVersion(G.clientVersion)

  g_game.setProtocolVersion(g_game.getClientProtocolVersion(G.clientVersion))

  g_game.setCustomOs(-1) -- disable

  if not g_game.getFeature(GameExtendedOpcode) then

    g_game.setCustomOs(5) -- set os to windows if opcodes are disabled

  end

  onCharacterList(nil, characters, account, nil)

end

local function onHTTPResult(data, err)

  if waitingForHttpResults == 0 then

    return

  end

  waitingForHttpResults = waitingForHttpResults - 1

  if err and waitingForHttpResults > 0 then

    return -- ignore, wait for other requests

  end

  if err then

    return EnterGame.onError(err)

  end

  waitingForHttpResults = 0

  if data['error'] and data['error']:len() > 0 then

    return EnterGame.onLoginError(data['error'])

  elseif data['errorMessage'] and data['errorMessage']:len() > 0 then

    return EnterGame.onLoginError(data['errorMessage'])

  end

  if type(data["session"]) == "table" and type(data["playdata"]) == "table" then

    return onTibia12HTTPResult(data["session"], data["playdata"])

  end

  local characters = data["characters"]

  local account = data["account"]

  local session = data["session"]

  local version = data["version"]

  local things = data["things"]

  local customProtocol = data["customProtocol"]

  local features = data["features"]

  local settings = data["settings"]

  local rsa = data["rsa"]

  local proxies = data["proxies"]

  local incorrectThings = validateThings(things)

  if #incorrectThings > 0 then

    g_logger.info(incorrectThings)

    return EnterGame.onError(incorrectThings)

  end

  -- custom protocol

  g_game.setCustomProtocolVersion(0)

  if customProtocol ~= nil then

    customProtocol = tonumber(customProtocol)

    if customProtocol ~= nil and customProtocol > 0 then

      g_game.setCustomProtocolVersion(customProtocol)

    end

  end

  -- force player settings

  if settings ~= nil then

    for option, value in pairs(settings) do

      modules.client_options.setOption(option, value, true)

    end

  end

  -- version

  G.clientVersion = version

  g_game.setClientVersion(version)

  g_game.setProtocolVersion(g_game.getClientProtocolVersion(version))

  g_game.setCustomOs(-1) -- disable

  if rsa ~= nil then

    g_game.setRsa(rsa)

  end

  if features ~= nil then

    parseFeatures(features)

  end

  if session ~= nil and session:len() > 0 then

    onSessionKey(nil, session)

  end

  -- proxies

  if g_proxy then

    g_proxy.clear()

    if proxies then

      for i, proxy in ipairs(proxies) do

        g_proxy.addProxy(proxy["host"], tonumber(proxy["port"]), tonumber(proxy["priority"]))

      end

    end

  end

  onCharacterList(nil, characters, account, nil)

end

-- public functions

function EnterGame.init()

  if USE_NEW_ENERGAME then return end

  enterGame = g_ui.displayUI('entergame')

  serverSelectorPanel = enterGame:getChildById('serverSelectorPanel')

  customServerSelectorPanel = enterGame:getChildById('customServerSelectorPanel')

  serverSelector = serverSelectorPanel:getChildById('serverSelector')

  rememberPasswordBox = enterGame:getChildById('rememberPasswordBox')

  serverHostTextEdit = customServerSelectorPanel:getChildById('serverHostTextEdit')

  clientVersionSelector = customServerSelectorPanel:getChildById('clientVersionSelector')

  if Servers ~= nil then

    for name,server in pairs(Servers) do

      serverSelector:addOption(name)

    end

  end

  if serverSelector:getOptionsCount() == 0 or ALLOW_CUSTOM_SERVERS then

    serverSelector:addOption(tr("Another"))

  end

  for i,proto in pairs(protos) do

    clientVersionSelector:addOption(proto)

  end

  if serverSelector:getOptionsCount() == 1 then

    enterGame:setHeight(enterGame:getHeight() - serverSelectorPanel:getHeight())

    serverSelectorPanel:setOn(false)

  end

  local account = g_crypt.decrypt(g_settings.get('account'))

  local password = g_crypt.decrypt(g_settings.get('password'))

  local server = g_settings.get('server')

  local host = g_settings.get('host')

  local clientVersion = g_settings.get('client-version')

  if serverSelector:isOption(server) then

    serverSelector:setCurrentOption(server, false)

    if Servers == nil or Servers[server] == nil then

      serverHostTextEdit:setText(host)

    end

    clientVersionSelector:setOption(clientVersion)

  else

    server = ""

    host = ""

  end

  enterGame:getChildById('accountPasswordTextEdit'):setText(password)

  enterGame:getChildById('accountNameTextEdit'):setText(account)

  rememberPasswordBox:setChecked(#account > 0)

  g_keyboard.bindKeyDown('Ctrl+G', EnterGame.openWindow)

  if g_game.isOnline() then

    return EnterGame.hide()

  end

  scheduleEvent(function()

    EnterGame.show()

  end, 100)

end

function EnterGame.terminate()

  if not enterGame then return end

  g_keyboard.unbindKeyDown('Ctrl+G')

  enterGame:destroy()

  if loadBox then

    loadBox:destroy()

    loadBox = nil

  end

  if protocolLogin then

    protocolLogin:cancelLogin()

    protocolLogin = nil

  end

  EnterGame = nil

end

function EnterGame.show()

  if not enterGame then return end

  enterGame:show()

  enterGame:raise()

  enterGame:focus()

  enterGame:getChildById('accountNameTextEdit'):focus()

end

function EnterGame.hide()

  if not enterGame then return end

  enterGame:hide()

end

function EnterGame.openWindow()

  if g_game.isOnline() then

    CharacterList.show()

  elseif not g_game.isLogging() and not CharacterList.isVisible() then

    EnterGame.show()

  end

end

function EnterGame.clearAccountFields()

  enterGame:getChildById('accountNameTextEdit'):clearText()

  enterGame:getChildById('accountPasswordTextEdit'):clearText()

  enterGame:getChildById('accountTokenTextEdit'):clearText()

  enterGame:getChildById('accountNameTextEdit'):focus()

  g_settings.remove('account')

  g_settings.remove('password')

end

function EnterGame.onServerChange()

  server = serverSelector:getText()

  if server == tr("Another") then

    if not customServerSelectorPanel:isOn() then

      serverHostTextEdit:setText("")

      customServerSelectorPanel:setOn(true)

      enterGame:setHeight(enterGame:getHeight() + customServerSelectorPanel:getHeight())

    end

  elseif customServerSelectorPanel:isOn() then

    enterGame:setHeight(enterGame:getHeight() - customServerSelectorPanel:getHeight())

    customServerSelectorPanel:setOn(false)

  end

  if Servers and Servers[server] ~= nil then

    if type(Servers[server]) == "table" then

      serverHostTextEdit:setText(Servers[server][1])

    else

      serverHostTextEdit:setText(Servers[server])

    end

  end

end

function EnterGame.doLogin(account, password, token, host)

  if g_game.isOnline() then

    local errorBox = displayErrorBox(tr('Login Error'), tr('Cannot login while already in game.'))

    connect(errorBox, { onOk = EnterGame.show })

    return

  end

  G.account = account or enterGame:getChildById('accountNameTextEdit'):getText()

  G.password = password or enterGame:getChildById('accountPasswordTextEdit'):getText()

  G.authenticatorToken = token or enterGame:getChildById('accountTokenTextEdit'):getText()

  G.stayLogged = true

  G.server = serverSelector:getText():trim()

  G.host = host or serverHostTextEdit:getText()

  G.clientVersion = tonumber(clientVersionSelector:getText())

  if not rememberPasswordBox:isChecked() then

    g_settings.set('account', G.account)

    g_settings.set('password', G.password)

  end

  g_settings.set('host', G.host)

  g_settings.set('server', G.server)

  g_settings.set('client-version', G.clientVersion)

  g_settings.save()

  local server_params = G.host:split(":")

  if G.host:lower():find("http") ~= nil then

    if #server_params >= 4 then

      G.host = server_params[1] .. ":" .. server_params[2] .. ":" .. server_params[3]

      G.clientVersion = tonumber(server_params[4])

    elseif #server_params >= 3 then

      if tostring(tonumber(server_params[3])) == server_params[3] then

        G.host = server_params[1] .. ":" .. server_params[2]

        G.clientVersion = tonumber(server_params[3])

      end

    end

    return EnterGame.doLoginHttp()

  end

  local server_ip = server_params[1]

  local server_port = 7171

  if #server_params >= 2 then

    server_port = tonumber(server_params[2])

  end

  if #server_params >= 3 then

    G.clientVersion = tonumber(server_params[3])

  end

  if type(server_ip) ~= 'string' or server_ip:len() <= 3 or not server_port or not G.clientVersion then

    return EnterGame.onError("Invalid server, it should be in format IP:PORT or it should be http url to login script")

  end

  local things = {

    data = {G.clientVersion .. "/Tibia.dat", ""},

    sprites = {G.clientVersion .. "/Tibia.cwm", ""},

}

  local incorrectThings = validateThings(things)

  if #incorrectThings > 0 then

    things = {

      data = {G.clientVersion .. "/Tibia.dat", ""},

      sprites = {G.clientVersion .. "/Tibia.spr", ""},

}

    incorrectThings = validateThings(things)

  end

  if #incorrectThings > 0 then

    g_logger.error(incorrectThings)

    if Updater and not checkedByUpdater[G.clientVersion] then

      checkedByUpdater[G.clientVersion] = true

      return Updater.check({

        version = G.clientVersion,

        host = G.host

})

    else

      return EnterGame.onError(incorrectThings)

    end

  end

  protocolLogin = ProtocolLogin.create()

  protocolLogin.onLoginError = onProtocolError

  protocolLogin.onSessionKey = onSessionKey

  protocolLogin.onCharacterList = onCharacterList

  protocolLogin.onUpdateNeeded = onUpdateNeeded

  protocolLogin.onProxyList = onProxyList

  EnterGame.hide()

  loadBox = displayCancelBox(tr('Please wait'), tr('Connecting to login server...'))

  connect(loadBox, { onCancel = function(msgbox)

                                  loadBox = nil

                                  protocolLogin:cancelLogin()

                                  EnterGame.show()

                                end })

  if G.clientVersion == 1000 then -- some people don't understand that tibia 10 uses 1100 protocol

    G.clientVersion = 1100

  end

  -- if you have custom rsa or protocol edit it here

  g_game.setClientVersion(G.clientVersion)

  g_game.setProtocolVersion(g_game.getClientProtocolVersion(G.clientVersion))

  g_game.setCustomProtocolVersion(0)

  g_game.setCustomOs(-1) -- disable

  g_game.chooseRsa(G.host)

  if #server_params <= 3 and not g_game.getFeature(GameExtendedOpcode) then

    g_game.setCustomOs(2) -- set os to windows if opcodes are disabled

  end

  -- extra features from init.lua

  for i = 4, #server_params do

    g_game.enableFeature(tonumber(server_params[i]))

  end

  -- proxies

  if g_proxy then

    g_proxy.clear()

  end

  if modules.game_things.isLoaded() then

    g_logger.info("Connecting to: " .. server_ip .. ":" .. server_port)

    protocolLogin:login(server_ip, server_port, G.account, G.password, G.authenticatorToken, G.stayLogged)

  else

    loadBox:destroy()

    loadBox = nil

    EnterGame.show()

  end

end

function EnterGame.doLoginHttp()

  if G.host == nil or G.host:len() < 10 then

    return EnterGame.onError("Invalid server url: " .. G.host)

  end

  loadBox = displayCancelBox(tr('Please wait'), tr('Connecting to login server...'))

  connect(loadBox, { onCancel = function(msgbox)

                                  loadBox = nil

                                  EnterGame.show()

                                end })

  local data = {

    type = "login",

    account = G.account,

    accountname = G.account,

    email = G.account,

    password = G.password,

    accountpassword = G.password,

    token = G.authenticatorToken,

    version = APP_VERSION,

    uid = G.UUID,

    stayloggedin = true

}

  local server = serverSelector:getText()

  if Servers and Servers[server] ~= nil then

    if type(Servers[server]) == "table" then

      local urls = Servers[server]

      waitingForHttpResults = #urls

      for _, url in ipairs(urls) do

        HTTP.postJSON(url, data, onHTTPResult)

      end

    else

      waitingForHttpResults = 1

      HTTP.postJSON(G.host, data, onHTTPResult)

    end

  end

  EnterGame.hide()

end

function EnterGame.onError(err)

  if loadBox then

    loadBox:destroy()

    loadBox = nil

  end

  local errorBox = displayErrorBox(tr('Login Error'), err)

  errorBox.onOk = EnterGame.show

end

function EnterGame.onLoginError(err)

  if loadBox then

    loadBox:destroy()

    loadBox = nil

  end

  local errorBox = displayErrorBox(tr('Login Error'), err)

  errorBox.onOk = EnterGame.show

  if err:lower():find("invalid") or err:lower():find("not correct") or err:lower():find("or password") then

    EnterGame.clearAccountFields()

  end

end

```

---
# entergame.otmod
```text

Module

  name: client_entergame

  description: Manages enter game and character list windows

  author: edubart & otclient.ovh

  website: https://github.com/edubart/otclient

  scripts: [ entergame, characterlist ]

  @onLoad: EnterGame.init() CharacterList.init()

  @onUnload: EnterGame.terminate() CharacterList.terminate()

  load-later:

    - game_things

    - game_features

```

---
# entergame.otui
```otui

EnterGameWindow

  id: enterGame

  @onEnter: EnterGame.doLogin()

  MenuLabel

    !text: tr('Account name')

    anchors.left: parent.left

    anchors.top: parent.top

    text-auto-resize: true

  TextEdit

    id: accountNameTextEdit

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 2

  MenuLabel

    !text: tr('Password')

    anchors.left: prev.left

    anchors.top: prev.bottom

    margin-top: 8

    text-auto-resize: true

  PasswordTextEdit

    id: accountPasswordTextEdit

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 2

  MenuLabel

    !text: tr('Token')

    anchors.left: prev.left

    anchors.top: prev.bottom

    text-auto-resize: true

    margin-top: 8

  TextEdit

    id: accountTokenTextEdit

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 2

  Panel

    id: serverSelectorPanel

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    height: 52

    on: true

    focusable: false

    $on:

      visible: true

      margin-top: 0

    $!on:

      visible: false

      margin-top: -52

    HorizontalSeparator

      anchors.left: parent.left

      anchors.right: parent.right

      anchors.top: parent.top

      margin-top: 10

    MenuLabel

      id: serverLabel

      !text: tr('Server')

      anchors.left: parent.left

      anchors.top: prev.bottom

      text-auto-resize: true

      margin-top: 5

    ComboBox

      id: serverSelector

      anchors.left: prev.left

      anchors.right: parent.right

      anchors.top: serverLabel.bottom

      margin-top: 2

      margin-right: 3

      menu-scroll: true

      menu-height: 125

      menu-scroll-step: 25

      text-offset: 5 2

      @onOptionChange: EnterGame.onServerChange()

  Panel

    id: customServerSelectorPanel

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    height: 52

    on: true

    focusable: true

    $on:

      visible: true

      margin-top: 0

    $!on:

      visible: false

      margin-top: -52

    HorizontalSeparator

      anchors.left: parent.left

      anchors.right: parent.right

      anchors.top: parent.top

      margin-top: 8

    MenuLabel

      id: serverLabel

      !text: tr('IP:PORT or URL')

      anchors.left: prev.left

      anchors.top: prev.bottom

      margin-top: 8

      text-auto-resize: true

    TextEdit

      id: serverHostTextEdit

      !tooltip: tr('Make sure that your client uses\nthe correct game client version')

      anchors.left: parent.left

      anchors.top: serverLabel.bottom

      margin-top: 2

      width: 150

    MenuLabel

      id: clientLabel

      !text: tr('Version')

      anchors.left: serverHostTextEdit.right

      anchors.top: serverLabel.top

      text-auto-resize: true

      margin-left: 10

    ComboBox

      id: clientVersionSelector

      anchors.top: serverHostTextEdit.top

      anchors.bottom: serverHostTextEdit.bottom

      anchors.left: prev.left

      anchors.right: parent.right

      menu-scroll: true

      menu-height: 125

      menu-scroll-step: 25

      margin-right: 3

  HorizontalSeparator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 10

  CheckBox

    id: rememberPasswordBox

    !text: tr('Remember password')

    !tooltip: tr('Remember account and password when starts client')

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 9

  HorizontalSeparator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 9

  Button

    !text: tr('Login')

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 10

    margin-left: 50

    margin-right: 50

    @onClick: EnterGame.doLogin()

  Label

    id: serverInfoLabel

    font: verdana-11px-rounded

    anchors.top: prev.top

    anchors.left: parent.left

    margin-top: 5

    color: green

    text-auto-resize: true

```

---
# waitinglist.otui
```otui

MainWindow

  id: waitingWindow

  !text: tr('Waiting List')

  size: 260 180

  @onEscape: CharacterList.cancelWait()

  Label

    id: infoLabel

    anchors.top: parent.top

    anchors.bottom: progressBar.top

    anchors.left: parent.left

    anchors.right: parent.right

    text-wrap: true

  ProgressBar

    id: progressBar

    height: 15

    background-color: #4444ff

    anchors.bottom: timeLabel.top

    anchors.left: parent.left

    anchors.right: parent.right

    margin-bottom: 10

  Label

    id: timeLabel

    anchors.bottom: separator.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-bottom: 10

  HorizontalSeparator

    id: separator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: next.top

    margin-bottom: 10

  Button

    id: buttonCancel

    !text: tr('Cancel')

    width: 64

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    @onClick: CharacterList.cancelWait()

```

---


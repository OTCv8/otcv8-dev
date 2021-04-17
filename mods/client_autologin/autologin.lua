local loginConfigsPath = "loginConfigs.json"

--- Parses login configs file and returns login info when config name matches.
-- @param configName name of configuration in login configs file
-- @return boolean or table containing login information
local function getLoginConfiguration(configName)
    if g_resources.fileExists(loginConfigsPath) then
        local fileContents = g_resources.readFileContents(loginConfigsPath)
        if string.len(fileContents) > 0 then
            -- maybe validate fileContents json structure
            local fileJsonContents = json.decode(fileContents)
            for characterConfigName, loginInfo in pairs(fileJsonContents) do
                if characterConfigName == configName then
                    return loginInfo
                end
            end
        end
    else
        g_logger.info("Not found login configs file.")
    end

    return false
end

--- Returns autologin configuration from startup options.
-- Searches for --autologin argument and takes next chunk as autologin config name.
-- @return boolean or autologin configuration
local function getAutoLoginConfigFromStartupOptions()
    local startupOptions = string.split(g_app.getStartupOptions(), " ")
    if #startupOptions < 2 then
        g_logger.info("No startup arguments.")
        return false
    end

    for index, option in ipairs(startupOptions) do
        if option == "--autologin" then
            scheduleEvent(function()
                EnterGame.hide()
            end, 100)

            local optionConfigName = startupOptions[index + 1]
            if optionConfigName == nil then
                local errorBox = displayErrorBox(tr("Autologin configuration"),
                        'Not found autologin config name.\nUsage: otclient_gl.exe --autologin configExample\nPlease provide autologin config and run client again.')
                connect(errorBox, { onOk = exit })
            end

            return getLoginConfiguration(optionConfigName)
        end
    end

    return false
end

--- Logs in character based on login configuration.
-- @param loginConfiguration initial login configuration
-- @return void
local function initialLogin(loginConfiguration)
    local function onCharacterList(protocol, characters, account, otui)
        g_game.loginWorld(G.account, G.password, loginConfiguration.worldName, loginConfiguration.worldHost,
                loginConfiguration.worldPort, loginConfiguration.characterName, nil, G.sessionKey)
    end

    local function onProtocolError(protocol, message, errorCode)
        if errorCode then
            return EnterGame.onError(message)
        end
        return EnterGame.onLoginError(message)
    end

    local function onSessionKey(protocol, sessionKey)
        G.sessionKey = sessionKey
    end

    protocolLogin = ProtocolLogin.create()
    protocolLogin.onLoginError = onProtocolError
    protocolLogin.onSessionKey = onSessionKey
    protocolLogin.onCharacterList = onCharacterList

    if tonumber(loginConfiguration.clientVersion) == 1000 then
        -- some people don't understand that tibia 10 uses 1100 protocol
        loginConfiguration.clientVersion = 1100
    end

    g_game.setClientVersion(tonumber(loginConfiguration.clientVersion))
    g_game.setProtocolVersion(g_game.getClientProtocolVersion(tonumber(loginConfiguration.clientVersion)))
    g_game.setCustomProtocolVersion(0)
    g_game.setCustomOs(2)
    g_game.chooseRsa(loginConfiguration.serverHost)
    protocolLogin:login(loginConfiguration.serverHost, loginConfiguration.serverPort, loginConfiguration.accountName, loginConfiguration.accountPassword, nil, true)
end

function init()
    local autoLoginConfig = getAutoLoginConfigFromStartupOptions()
    if autoLoginConfig then
        initialLogin(autoLoginConfig)
    end
end

function terminate()
    -- not implemented
end

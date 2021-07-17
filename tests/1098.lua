Test.Test("Test 1098 and bot", function(test, wait, ss, fail)
    test(function()
        EnterGame.hide()
        g_settings.setNode("things", {})
        g_game.setClientVersion(1098)
        g_game.setProtocolVersion(g_game.getClientProtocolVersion(1098))
        g_game.playRecord("1098.record")
    end)
    
    wait(2500)
    ss()
    wait(500)
    ss()
    wait(500)

    test(function()
        g_game.getLocalPlayer():setOutfitShader("outfit_rainbow")
        modules.game_interface.gameMapPanel:setShader("map_rainbow")
    end)
    wait(500)
    ss()
    wait(500)
    ss()
    wait(1000)
    test(function()
        g_game.getLocalPlayer():setOutfitShader("")
        modules.game_interface.gameMapPanel:setShader("")
    end)
    ss()

    local configId = 0
    for i=1,3 do
        test(function()
            local botWindow =  g_ui.getRootWidget():recursiveGetChildById("botWindow")
            local configs = botWindow:recursiveGetChildById("config")
            local enableButton = botWindow:recursiveGetChildById("enableButton")
            local configsCount = configs:getOptionsCount()
            configId = configId + 1
            if configId > configsCount then
                configId = 1
            end
            configs:setCurrentIndex(configId)
            enableButton.onClick()
        end)
        wait(2000)
        ss()
        for x=1,5 do
            test(function()
                local botWindow =  g_ui.getRootWidget():recursiveGetChildById("botWindow")
                local tabs = botWindow:recursiveGetChildById("botTabs")
                tabs:selectNextTab()
            end)
            wait(1000)
            ss()
            wait(1000)
        end
        wait(1000)
        test(function()
            local botWindow =  g_ui.getRootWidget():recursiveGetChildById("botWindow")
            local enableButton = botWindow:recursiveGetChildById("enableButton")
            enableButton.onClick()
        end)
        ss()
        wait(1000)
    end

    test(function()
        if not g_game.isOnline() then
            fail("Should be online")
        end
        g_game.forceLogout()    
    end)
    wait(1000)
    ss()
    test(function()
        if g_game.isOnline() then
            fail("Shouldn't be online")
        end
        EnterGame.show()
    end)
end)

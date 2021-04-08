Test.Test("Test 860 and bot", function(test, wait, ss, fail)
    test(function()
        EnterGame.hide()
        g_settings.setNode("things", {})
        g_game.setClientVersion(860)
        g_game.setProtocolVersion(g_game.getClientProtocolVersion(860))
        g_game.playRecord("860.record")
    end)

    wait(3000)
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
        wait(1000)
        ss()
        for x=1,5 do
            test(function()
                local botWindow =  g_ui.getRootWidget():recursiveGetChildById("botWindow")
                local tabs = botWindow:recursiveGetChildById("botTabs")
                tabs:selectNextTab()
            end)
            wait(500)
            ss()
            wait(500)
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
        local channelsWindow =  g_ui.getRootWidget():recursiveGetChildById("channelsWindow")
        if not channelsWindow then
            fail("Can't find channel window")
        end
        channelsWindow:recursiveGetChildById("buttonCancel"):onClick()
    end)

    wait(1000)
    ss()

    test(function()
        local channelsWindow =  g_ui.getRootWidget():recursiveGetChildById("channelsWindow")
        if channelsWindow then
            fail("Channel window is not closed")
        end
    end)

    wait(1000)
    test(function()
        modules.client_stats.toggle()
    end)
    ss()
    wait(2000)
    test(function()
        modules.client_stats.toggle()
    end)
    wait(1000)
    ss()
    wait(5000)
    ss()    

    test(function()
        if g_game.isOnline() then
            fail("Shouldn't be online")
        end
        EnterGame.show()
    end)
end)
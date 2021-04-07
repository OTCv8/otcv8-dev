Test.Test("Test 860", function(test, wait, ss, fail)
    test(function()
        EnterGame.hide()
        g_settings.setNode("things", {})
        g_game.setClientVersion(860)
        g_game.setProtocolVersion(g_game.getClientProtocolVersion(860))
        g_game.playRecord("860.record")
    end)
    for i=1,5 do
        wait(5000)
        ss()    
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

    for i=1,3 do
        wait(5000)
        ss()    
    end

    test(function()
        if g_game.isOnline() then
            fail("Shouldn't be online")
        end
        EnterGame.show()
    end)
end)
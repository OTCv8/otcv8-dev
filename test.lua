Test.Test("Maximize and hide entergame", function(test, wait, ss, fail)
    wait(3000)
    test(function() 
        g_window.maximize()
    end)
    wait(3000)
    ss()
    test(function() 
        EnterGame.hide()
    end)
end)

Test.Test("Test 1098", function(test, wait, ss, fail)
    test(function()
        g_settings.setNode("things", {})
        g_game.setClientVersion(1098)
        g_game.setProtocolVersion(g_game.getClientProtocolVersion(1098))
        g_game.playRecord("1098.record")
    end)
    wait(5000)
    ss()
    wait(1000)
    wait(5000)
    ss()
    wait(5000)
    ss()
    wait(5000)
    ss()
    wait(5000)
    ss()
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
    end)
end)

Test.Test("Test 860", function(test, wait, ss, fail)
    test(function()
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
    end)
end)

Test.Test("Show again entergame", function(test, wait, ss, fail)
    wait(1000)
    test(function() 
        EnterGame.show()
    end)
    ss()    
end)


Test.run()

-- First test
Test.Test("First test, maximize window, open options, do screenshot", function(test, wait, ss, fail)
    wait(1000)
    test(function() 
        g_window.maximize()
    end)
    wait(3000)
    ss()
    test(function()
        modules.client_options.show()
    end)
    wait(1000)
    ss()
    wait(1000)
    test(function()
        local optionsWindow = g_ui.getRootWidget():recursiveGetChildById("optionsWindow")
        if not optionsWindow or optionsWindow:isHidden() then
            fail("Options window is not opened")
        end
        modules.client_options.hide()
    end)
    wait(1000)
    ss()
end)

-- load all tests
dofiles("tests")

-- add last test
Test.Test("Last test, do screenshot", function(test, wait, ss, fail)
    ss()    
end)

-- run tests
Test.run()

-- First test
Test.Test("First test, maximize and hide entergame", function(test, wait, ss, fail)
    wait(1000)
    test(function() 
        g_window.maximize()
    end)
    wait(3000)
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

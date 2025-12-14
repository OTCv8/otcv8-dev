-- AI Agents Launcher
-- Main entry point for the AI agent system

print([[
╔════════════════════════════════════════════════════════════════╗
║                  OTCv8 AI Agent System                        ║
║                Script Search & Improvement                     ║
╚════════════════════════════════════════════════════════════════╝
]])

-- Load the agent coordinator
local success, result = pcall(dofile, "ai_agents/agent_coordinator.lua")

if not success then
  print("Error loading AI agents: " .. tostring(result))
  print("Please make sure all agent files are in the 'ai_agents/' directory")
  return
end

-- Display menu
local function displayMenu()
  print("\n--- AI Agent Commands ---")
  print("1. Search all scripts")
  print("2. Search by pattern (macro/ui/event/etc)")
  print("3. Find scripts with issues")
  print("4. Analyze specific script")
  print("5. Find security issues")
  print("6. Generate comprehensive report")
  print("7. Run quick start example")
  print("8. Run search examples")
  print("9. Run improvement examples")
  print("0. Exit")
  print("\nAgent Status:")
  
  local status = AgentCoordinator.getStatus()
  print("  Search Agent: " .. (status.searchAgentAvailable and "✓ Ready" or "✗ Not available"))
  print("  Improvement Agent: " .. (status.improvementAgentAvailable and "✓ Ready" or "✗ Not available"))
  print("  Scripts Scanned: " .. status.stats.scriptsScanned)
  print("  Issues Found: " .. status.stats.issuesFound)
  print("────────────────────────────────────")
end

-- Command handlers
local commands = {
  -- Search all scripts
  ["1"] = function()
    print("\nSearching all scripts...")
    local scripts = AgentCoordinator.searchScripts("/")
    
    if scripts then
      print("\nFound " .. #scripts .. " scripts")
      print("\nTop 10 scripts by size:")
      
      table.sort(scripts, function(a, b) return a.size > b.size end)
      
      for i, script in ipairs(scripts) do
        if i <= 10 then
          print(string.format("  %2d. %-30s %6d bytes, %4d lines", 
            i, script.filename, script.size, script.lines))
        end
      end
    end
  end,
  
  -- Search by pattern
  ["2"] = function()
    print("\nAvailable patterns: macro, ui, botswitch, event, storage, attack, spell, heal, follow, party")
    print("Enter pattern name: ")
    local pattern = io.read()
    
    if pattern and #pattern > 0 then
      local scripts = AgentCoordinator.findByPattern(pattern)
      
      if scripts and #scripts > 0 then
        print("\nFound " .. #scripts .. " scripts with pattern '" .. pattern .. "':")
        for i, scriptName in ipairs(scripts) do
          print("  " .. i .. ". " .. scriptName)
        end
      else
        print("No scripts found with pattern '" .. pattern .. "'")
      end
    end
  end,
  
  -- Find scripts with issues
  ["3"] = function()
    print("\nFinding scripts with issues...")
    
    local searchAgent = AgentCoordinator.state.agents.search
    if searchAgent then
      local scriptsWithIssues = searchAgent.findWithIssues()
      
      if #scriptsWithIssues > 0 then
        print("\nFound " .. #scriptsWithIssues .. " scripts with issues:\n")
        
        for i, script in ipairs(scriptsWithIssues) do
          print(string.format("%d. %s (%d issues)", i, script.filename, script.issueCount))
          for _, issue in ipairs(script.issues) do
            print("   - " .. issue)
          end
          print()
        end
      else
        print("No issues found!")
      end
    end
  end,
  
  -- Analyze specific script
  ["4"] = function()
    print("\nEnter script filename (e.g., SuperDash.lua): ")
    local filename = io.read()
    
    if filename and #filename > 0 then
      print("\nAnalyzing " .. filename .. "...")
      
      local suggestions = AgentCoordinator.suggestImprovements(filename)
      
      if suggestions then
        local improvementAgent = AgentCoordinator.state.agents.improvement
        if improvementAgent then
          improvementAgent.printReport(suggestions, filename)
        end
      else
        print("Could not analyze script: " .. filename)
      end
    end
  end,
  
  -- Find security issues
  ["5"] = function()
    print("\nScanning for security issues...")
    
    local securityIssues = AgentCoordinator.findSecurityIssues()
    
    if #securityIssues > 0 then
      print("\n⚠ Found security issues in " .. #securityIssues .. " scripts:\n")
      
      for _, item in ipairs(securityIssues) do
        print("┌─ " .. item.script)
        for _, issue in ipairs(item.issues) do
          print(string.format("│  [%s] %s", issue.severity:upper(), issue.message))
          print("│    → " .. issue.suggestion)
        end
        print("└─")
      end
    else
      print("✓ No security issues found!")
    end
  end,
  
  -- Generate comprehensive report
  ["6"] = function()
    print("\nGenerating comprehensive report...")
    AgentCoordinator.printReport()
  end,
  
  -- Run quick start example
  ["7"] = function()
    print("\nRunning quick start example...\n")
    dofile("ai_agents/examples/quick_start.lua")
  end,
  
  -- Run search examples
  ["8"] = function()
    print("\nRunning search examples...\n")
    dofile("ai_agents/examples/example_search.lua")
  end,
  
  -- Run improvement examples
  ["9"] = function()
    print("\nRunning improvement examples...\n")
    dofile("ai_agents/examples/example_improve.lua")
  end
}

-- Main loop (for interactive use)
if arg and #arg == 0 then
  displayMenu()
  print("\nEnter command number (or 'help' for menu): ")
  
  -- For non-interactive environments, just show info
  print("\nTo use AI agents in your scripts:")
  print([[
  
  -- Load the coordinator
  dofile("ai_agents/agent_coordinator.lua")
  
  -- Search for scripts
  local scripts = AgentCoordinator.searchScripts("/")
  
  -- Analyze a script
  local suggestions = AgentCoordinator.suggestImprovements("YourScript.lua")
  
  -- Generate report
  AgentCoordinator.printReport()
  ]])
  
  print("\nSee ai_agents/README.md for full documentation")
  print("Run examples in ai_agents/examples/ for more details\n")
end

-- Export for use in other scripts
return AgentCoordinator

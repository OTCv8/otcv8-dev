-- Example: Basic Script Search
-- This example demonstrates how to use the AI agents to search for scripts

print("=== AI Agent Script Search Example ===\n")

-- Load the agent coordinator
dofile("ai_agents/agent_coordinator.lua")

-- Example 1: Search all scripts in root directory
print("\n--- Example 1: Search All Scripts ---")
local allScripts = AgentCoordinator.searchScripts("/")

if allScripts then
  print("Found " .. #allScripts .. " scripts")
  
  -- Show first 5 scripts
  print("\nFirst 5 scripts:")
  for i, script in ipairs(allScripts) do
    if i <= 5 then
      print(string.format("  %d. %s (%d lines)", i, script.filename, script.lines))
    end
  end
end

-- Example 2: Search for macro scripts
print("\n--- Example 2: Find Macro Scripts ---")
local macroScripts = AgentCoordinator.searchScripts("/", {type = "macro"})

if macroScripts then
  print("Found " .. #macroScripts .. " macro scripts")
  
  for i, script in ipairs(macroScripts) do
    print(string.format("  %d. %s", i, script.filename))
  end
end

-- Example 3: Search for UI scripts
print("\n--- Example 3: Find UI Scripts ---")
local uiScripts = AgentCoordinator.findByPattern("ui")

if uiScripts then
  print("Found " .. #uiScripts .. " UI scripts")
  
  for i, scriptName in ipairs(uiScripts) do
    print(string.format("  %d. %s", i, scriptName))
  end
end

-- Example 4: Find scripts by size
print("\n--- Example 4: Find Large Scripts (>1000 bytes) ---")
local largeScripts = AgentCoordinator.searchScripts("/", {
  minSize = 1000
})

if largeScripts then
  print("Found " .. #largeScripts .. " large scripts")
  
  -- Sort by size
  table.sort(largeScripts, function(a, b)
    return a.size > b.size
  end)
  
  -- Show top 5
  print("\nLargest scripts:")
  for i, script in ipairs(largeScripts) do
    if i <= 5 then
      print(string.format("  %d. %s (%d bytes, %d lines)", 
        i, script.filename, script.size, script.lines))
    end
  end
end

-- Example 5: Find scripts with issues
print("\n--- Example 5: Find Scripts with Issues ---")
local searchAgent = AgentCoordinator.state.agents.search
if searchAgent then
  local scriptsWithIssues = searchAgent.findWithIssues()
  
  print("Found " .. #scriptsWithIssues .. " scripts with issues")
  
  -- Show top 5
  print("\nScripts needing attention:")
  for i, script in ipairs(scriptsWithIssues) do
    if i <= 5 then
      print(string.format("  %d. %s (%d issues)", 
        i, script.filename, script.issueCount))
      
      for _, issue in ipairs(script.issues) do
        print("     - " .. issue)
      end
    end
  end
end

-- Example 6: Generate and print search report
print("\n--- Example 6: Search Report ---")
if searchAgent and searchAgent.cache.scripts then
  local report = searchAgent.generateReport()
  searchAgent.printReport(report)
end

print("\n=== Script Search Examples Complete ===")

-- Example: Quick Start Guide
-- This is a simple example to get you started with the AI agents

print("=== AI Agents Quick Start Guide ===\n")

-- Step 1: Load the agent coordinator
print("Step 1: Loading AI agents...")
dofile("ai_agents/agent_coordinator.lua")

-- Check if agents are ready
local status = AgentCoordinator.getStatus()
print("\nAgent Status:")
print("  Initialized: " .. tostring(status.initialized))
print("  Search Agent: " .. tostring(status.searchAgentAvailable))
print("  Improvement Agent: " .. tostring(status.improvementAgentAvailable))

if not status.initialized then
  print("\nError: Agents not initialized!")
  return
end

-- Step 2: Search for scripts
print("\n--- Step 2: Searching for scripts ---")
local scripts = AgentCoordinator.searchScripts("/")

if scripts then
  print("Found " .. #scripts .. " scripts in the project")
end

-- Step 3: Analyze a script
print("\n--- Step 3: Analyzing a script ---")
local scriptToAnalyze = "SuperDash.lua"
print("Analyzing: " .. scriptToAnalyze)

local analysis = AgentCoordinator.analyzeScript(scriptToAnalyze)

if analysis and analysis.structure then
  print("\nBasic Info:")
  print("  File: " .. scriptToAnalyze)
  print("  Lines: " .. analysis.structure.lines)
  print("  Size: " .. analysis.structure.size .. " bytes")
  print("  Functions: " .. #analysis.structure.functions)
  
  if #analysis.structure.issues > 0 then
    print("\nFound " .. #analysis.structure.issues .. " structural issues:")
    for i, issue in ipairs(analysis.structure.issues) do
      print("  " .. i .. ". " .. issue)
    end
  end
end

-- Step 4: Get improvement suggestions
print("\n--- Step 4: Getting improvement suggestions ---")
local suggestions = AgentCoordinator.suggestImprovements(scriptToAnalyze)

if suggestions then
  local improvementAgent = AgentCoordinator.state.agents.improvement
  if improvementAgent then
    local report = improvementAgent.generateReport(suggestions)
    
    print("\nImprovement Summary:")
    print("  Total suggestions: " .. report.totalIssues)
    
    if report.bySeverity.critical and report.bySeverity.critical > 0 then
      print("  ⚠ Critical issues: " .. report.bySeverity.critical)
    end
    if report.bySeverity.high and report.bySeverity.high > 0 then
      print("  ⚠ High priority: " .. report.bySeverity.high)
    end
    if report.bySeverity.medium and report.bySeverity.medium > 0 then
      print("  ⚠ Medium priority: " .. report.bySeverity.medium)
    end
    if report.bySeverity.low and report.bySeverity.low > 0 then
      print("  ℹ Low priority: " .. report.bySeverity.low)
    end
    
    -- Show one example from each category
    print("\nSample suggestions:")
    
    for category, issues in pairs(suggestions) do
      if #issues > 0 then
        local issue = issues[1] -- First issue
        print(string.format("\n  %s:", category:upper()))
        print(string.format("    [%s] %s", issue.severity:upper(), issue.message))
        print("    → " .. issue.suggestion)
      end
    end
  end
end

-- Step 5: Generate overall report
print("\n--- Step 5: Overall Report ---")
AgentCoordinator.printReport()

print("\n=== Quick Start Complete ===")
print("\nNext steps:")
print("  1. Run 'examples/example_search.lua' for more search examples")
print("  2. Run 'examples/example_improve.lua' for improvement examples")
print("  3. Check 'ai_agents/README.md' for detailed documentation")
print("\nHappy coding with AI assistance! 🤖")

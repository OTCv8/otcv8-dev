-- Example: Script Improvement Suggestions
-- This example demonstrates how to use the AI agents to analyze and improve scripts

print("=== AI Agent Script Improvement Example ===\n")

-- Load the agent coordinator
dofile("ai_agents/agent_coordinator.lua")

-- Example 1: Analyze a specific script
print("\n--- Example 1: Analyze SuperDash.lua ---")
local scriptPath = "SuperDash.lua"

local suggestions = AgentCoordinator.suggestImprovements(scriptPath)

if suggestions then
  local improvementAgent = AgentCoordinator.state.agents.improvement
  if improvementAgent then
    improvementAgent.printReport(suggestions, scriptPath)
  end
end

-- Example 2: Analyze multiple scripts
print("\n--- Example 2: Batch Analysis ---")

local scriptsToAnalyze = {
  "SuperDash.lua",
  "magebomb.lua",
  "_Loader.lua"
}

for _, script in ipairs(scriptsToAnalyze) do
  print("\nAnalyzing: " .. script)
  
  local scriptSuggestions = AgentCoordinator.suggestImprovements(script)
  
  if scriptSuggestions then
    local improvementAgent = AgentCoordinator.state.agents.improvement
    if improvementAgent then
      local report = improvementAgent.generateReport(scriptSuggestions)
      
      print(string.format("  Total issues: %d", report.totalIssues))
      print(string.format("  Critical: %d, High: %d, Medium: %d, Low: %d", 
        report.bySeverity.critical or 0,
        report.bySeverity.high or 0,
        report.bySeverity.medium or 0,
        report.bySeverity.low or 0))
    end
  end
end

-- Example 3: Find all security issues
print("\n--- Example 3: Find Security Issues ---")

local securityIssues = AgentCoordinator.findSecurityIssues()

if #securityIssues > 0 then
  print("Found security issues in " .. #securityIssues .. " scripts:")
  
  for _, item in ipairs(securityIssues) do
    print("\n" .. item.script .. ":")
    for _, issue in ipairs(item.issues) do
      print(string.format("  [%s] %s", issue.severity:upper(), issue.message))
      print("    → " .. issue.suggestion)
    end
  end
else
  print("No security issues found!")
end

-- Example 4: Comprehensive analysis
print("\n--- Example 4: Comprehensive Analysis ---")

local analysis = AgentCoordinator.analyzeScript("SuperDash.lua", {
  analyzeStructure = true,
  analyzeImprovements = true
})

if analysis then
  print("\nAnalysis for: " .. analysis.filepath)
  print("Timestamp: " .. analysis.timestamp)
  
  if analysis.structure then
    print("\nStructure:")
    print("  Lines: " .. analysis.structure.lines)
    print("  Size: " .. analysis.structure.size .. " bytes")
    print("  Functions: " .. #analysis.structure.functions)
    print("  Code Quality: " .. string.format("%.1f%%", analysis.structure.metrics.codeQuality))
    print("  Complexity: " .. string.format("%.1f", analysis.structure.metrics.complexity))
    
    if next(analysis.structure.patterns) then
      print("\n  Detected patterns:")
      for pattern, _ in pairs(analysis.structure.patterns) do
        print("    - " .. pattern)
      end
    end
    
    if #analysis.structure.issues > 0 then
      print("\n  Structural issues:")
      for _, issue in ipairs(analysis.structure.issues) do
        print("    - " .. issue)
      end
    end
  end
  
  if analysis.improvements then
    local improvementAgent = AgentCoordinator.state.agents.improvement
    if improvementAgent then
      local report = improvementAgent.generateReport(analysis.improvements)
      print("\nImprovement Suggestions:")
      print("  Total: " .. report.totalIssues)
      
      for category, count in pairs(report.byCategory) do
        if count > 0 then
          print("  " .. category .. ": " .. count)
        end
      end
    end
  end
end

-- Example 5: Batch improvement (dry run)
print("\n--- Example 5: Batch Improvement (Dry Run) ---")

local batchResults = AgentCoordinator.batchImprove({
  scripts = {"SuperDash.lua", "_Loader.lua"},
  autoApply = false,
  backupFirst = true
})

print("\nBatch improvement results:")
for i, result in ipairs(batchResults) do
  print(string.format("\n%d. %s", i, result.script))
  
  if result.suggestions then
    local improvementAgent = AgentCoordinator.state.agents.improvement
    if improvementAgent then
      local report = improvementAgent.generateReport(result.suggestions)
      print(string.format("   Issues found: %d", report.totalIssues))
      
      -- Show critical and high severity issues
      for category, issues in pairs(result.suggestions) do
        for _, issue in ipairs(issues) do
          if issue.severity == "critical" or issue.severity == "high" then
            print(string.format("   [%s] %s: %s", 
              issue.severity:upper(), category, issue.message))
          end
        end
      end
    end
  end
  
  print("   Applied: " .. tostring(result.applied or false))
end

print("\n=== Script Improvement Examples Complete ===")

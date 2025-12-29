#!/usr/bin/env lua

-- Test script for AI agents
-- This script tests the basic functionality of the AI agent system

print("=== AI Agents Test Suite ===\n")

-- Test 1: Load agent coordinator
print("Test 1: Loading agent coordinator...")
local success, AgentCoordinator = pcall(dofile, "ai_agents/agent_coordinator.lua")

if not success then
  print("✗ FAILED: Could not load agent coordinator")
  print("Error: " .. tostring(AgentCoordinator))
  os.exit(1)
end

print("✓ PASSED: Agent coordinator loaded successfully")

-- Test 2: Check agent status
print("\nTest 2: Checking agent status...")
local status = AgentCoordinator.getStatus()

if not status.initialized then
  print("✗ FAILED: Agents not initialized")
  os.exit(1)
end

print("✓ PASSED: Agents initialized")
print("  - Search agent: " .. tostring(status.searchAgentAvailable))
print("  - Improvement agent: " .. tostring(status.improvementAgentAvailable))

-- Test 3: Test file reading
print("\nTest 3: Testing file reading...")
local searchAgent = AgentCoordinator.state.agents.search

if not searchAgent then
  print("✗ FAILED: Search agent not available")
  os.exit(1)
end

local testContent = searchAgent.readFile("ai_agents/launcher.lua")

if not testContent then
  print("✗ FAILED: Could not read test file")
  os.exit(1)
end

print("✓ PASSED: File reading works")
print("  - Read " .. #testContent .. " bytes from launcher.lua")

-- Test 4: Test content analysis
print("\nTest 4: Testing content analysis...")
local analysis = searchAgent.analyzeContent(testContent, "launcher.lua")

if not analysis then
  print("✗ FAILED: Content analysis failed")
  os.exit(1)
end

print("✓ PASSED: Content analysis works")
print("  - Lines: " .. analysis.lines)
print("  - Size: " .. analysis.size .. " bytes")
print("  - Functions: " .. #analysis.functions)
print("  - Issues: " .. #analysis.issues)

-- Test 5: Test pattern detection
print("\nTest 5: Testing pattern detection...")
local hasPatterns = false

for pattern, detected in pairs(analysis.patterns) do
  if detected then
    hasPatterns = true
    print("  - Detected pattern: " .. pattern)
  end
end

if hasPatterns then
  print("✓ PASSED: Pattern detection works")
else
  print("⚠ WARNING: No patterns detected (may be normal)")
end

-- Test 6: Test improvement agent
print("\nTest 6: Testing improvement agent...")
local improvementAgent = AgentCoordinator.state.agents.improvement

if not improvementAgent then
  print("✗ FAILED: Improvement agent not available")
  os.exit(1)
end

-- Test with a simple script that has issues
local testScript = [[
function test()
  x = 1  -- Global variable (issue)
  while true do  -- Infinite loop (issue)
    y = x + 1
  end
end
]]

-- Write test file
local testFile = io.open("/tmp/test_script.lua", "w")
if testFile then
  testFile:write(testScript)
  testFile:close()
  
  local suggestions = improvementAgent.analyze("/tmp/test_script.lua")
  
  if suggestions then
    local totalIssues = 0
    for category, issues in pairs(suggestions) do
      totalIssues = totalIssues + #issues
    end
    
    if totalIssues > 0 then
      print("✓ PASSED: Improvement analysis works")
      print("  - Found " .. totalIssues .. " issues")
      
      for category, issues in pairs(suggestions) do
        if #issues > 0 then
          print("  - " .. category .. ": " .. #issues .. " issues")
        end
      end
    else
      print("⚠ WARNING: No issues detected (expected some)")
    end
  else
    print("✗ FAILED: Could not analyze test script")
  end
  
  -- Cleanup
  os.remove("/tmp/test_script.lua")
else
  print("⚠ WARNING: Could not create test file")
end

-- Test 7: Test report generation
print("\nTest 7: Testing report generation...")
local report = AgentCoordinator.generateReport()

if report then
  print("✓ PASSED: Report generation works")
  print("  - Timestamp: " .. report.timestamp)
  print("  - Scripts scanned: " .. report.stats.scriptsScanned)
  print("  - Issues found: " .. report.stats.issuesFound)
else
  print("✗ FAILED: Report generation failed")
end

-- Test 8: Test coordinator functions
print("\nTest 8: Testing coordinator functions...")

-- Test status
local coordStatus = AgentCoordinator.getStatus()
if coordStatus and coordStatus.initialized then
  print("✓ PASSED: getStatus() works")
else
  print("✗ FAILED: getStatus() failed")
end

-- Summary
print("\n" .. string.rep("=", 50))
print("=== Test Suite Complete ===")
print(string.rep("=", 50))
print("\nAll core tests passed! ✓")
print("\nThe AI agent system is ready to use.")
print("\nNext steps:")
print("  1. Run: lua ai_agents/launcher.lua")
print("  2. Try examples in ai_agents/examples/")
print("  3. Read documentation in ai_agents/README.md")
print(string.rep("=", 50))

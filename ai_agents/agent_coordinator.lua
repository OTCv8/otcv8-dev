-- Agent Coordinator for OTCv8
-- Manages and coordinates AI agents for script management

-- Load required agents
local searchAgentPath = "ai_agents/script_search_agent.lua"
local improvementAgentPath = "ai_agents/script_improvement_agent.lua"

-- Try to load agents with error handling
local ScriptSearchAgent
local ScriptImprovementAgent

local function loadAgent(path)
  local success, agent = pcall(dofile, path)
  if success then
    return agent
  else
    print("[AgentCoordinator] Warning: Could not load " .. path)
    return nil
  end
end

ScriptSearchAgent = loadAgent(searchAgentPath)
ScriptImprovementAgent = loadAgent(improvementAgentPath)

-- Agent Coordinator
AgentCoordinator = {}

-- Configuration
AgentCoordinator.config = {
  enableSearch = true,
  enableImprovement = true,
  autoInitialize = true,
  logLevel = "info" -- debug, info, warning, error
}

-- State
AgentCoordinator.state = {
  initialized = false,
  agents = {
    search = nil,
    improvement = nil
  },
  stats = {
    scriptsScanned = 0,
    issuesFound = 0,
    improvementsApplied = 0
  }
}

-- Initialize the coordinator
function AgentCoordinator.init(config)
  if AgentCoordinator.state.initialized then
    print("[AgentCoordinator] Already initialized")
    return true
  end
  
  if config then
    for k, v in pairs(config) do
      AgentCoordinator.config[k] = v
    end
  end
  
  print("[AgentCoordinator] Initializing...")
  
  -- Initialize search agent
  if AgentCoordinator.config.enableSearch and ScriptSearchAgent then
    ScriptSearchAgent.init()
    AgentCoordinator.state.agents.search = ScriptSearchAgent
    print("[AgentCoordinator] Search agent ready")
  end
  
  -- Initialize improvement agent
  if AgentCoordinator.config.enableImprovement and ScriptImprovementAgent then
    ScriptImprovementAgent.init()
    AgentCoordinator.state.agents.improvement = ScriptImprovementAgent
    print("[AgentCoordinator] Improvement agent ready")
  end
  
  AgentCoordinator.state.initialized = true
  print("[AgentCoordinator] Initialization complete")
  
  return true
end

-- Log message based on level
function AgentCoordinator.log(level, message)
  local levels = {debug = 1, info = 2, warning = 3, error = 4}
  local configLevel = levels[AgentCoordinator.config.logLevel] or 2
  local msgLevel = levels[level] or 2
  
  if msgLevel >= configLevel then
    print("[AgentCoordinator] [" .. level:upper() .. "] " .. message)
  end
end

-- Search for scripts
function AgentCoordinator.searchScripts(basePath, filters)
  if not AgentCoordinator.state.initialized then
    AgentCoordinator.init()
  end
  
  local searchAgent = AgentCoordinator.state.agents.search
  if not searchAgent then
    return nil, "Search agent not available"
  end
  
  AgentCoordinator.log("info", "Searching scripts in: " .. (basePath or "/"))
  
  local results = searchAgent.search(basePath, filters)
  AgentCoordinator.state.stats.scriptsScanned = #results
  
  AgentCoordinator.log("info", "Found " .. #results .. " scripts")
  
  return results
end

-- Analyze a specific script
function AgentCoordinator.analyzeScript(filepath, options)
  if not AgentCoordinator.state.initialized then
    AgentCoordinator.init()
  end
  
  options = options or {}
  
  local searchAgent = AgentCoordinator.state.agents.search
  local improvementAgent = AgentCoordinator.state.agents.improvement
  
  local analysis = {
    filepath = filepath,
    structure = nil,
    improvements = nil,
    timestamp = os.date("%Y-%m-%d %H:%M:%S")
  }
  
  -- Structural analysis
  if searchAgent and options.analyzeStructure ~= false then
    local content = searchAgent.readFile(filepath)
    if content then
      analysis.structure = searchAgent.analyzeContent(content, filepath)
    end
  end
  
  -- Improvement analysis
  if improvementAgent and options.analyzeImprovements ~= false then
    analysis.improvements = improvementAgent.analyze(filepath)
    
    if analysis.improvements then
      local report = improvementAgent.generateReport(analysis.improvements)
      AgentCoordinator.state.stats.issuesFound = 
        AgentCoordinator.state.stats.issuesFound + report.totalIssues
    end
  end
  
  return analysis
end

-- Get improvement suggestions for a script
function AgentCoordinator.suggestImprovements(filepath)
  if not AgentCoordinator.state.initialized then
    AgentCoordinator.init()
  end
  
  local improvementAgent = AgentCoordinator.state.agents.improvement
  if not improvementAgent then
    return nil, "Improvement agent not available"
  end
  
  AgentCoordinator.log("info", "Analyzing improvements for: " .. filepath)
  
  local suggestions = improvementAgent.analyze(filepath)
  
  if suggestions then
    local report = improvementAgent.generateReport(suggestions)
    AgentCoordinator.log("info", "Found " .. report.totalIssues .. " improvement suggestions")
  end
  
  return suggestions
end

-- Apply improvements to a script
function AgentCoordinator.applyImprovements(filepath, suggestions)
  if not AgentCoordinator.state.initialized then
    AgentCoordinator.init()
  end
  
  local improvementAgent = AgentCoordinator.state.agents.improvement
  if not improvementAgent then
    return nil, "Improvement agent not available"
  end
  
  AgentCoordinator.log("info", "Applying improvements to: " .. filepath)
  
  local success, message = improvementAgent.applyFixes(filepath, suggestions)
  
  if success then
    AgentCoordinator.state.stats.improvementsApplied = 
      AgentCoordinator.state.stats.improvementsApplied + 1
  end
  
  return success, message
end

-- Batch improvement operation
function AgentCoordinator.batchImprove(options)
  if not AgentCoordinator.state.initialized then
    AgentCoordinator.init()
  end
  
  options = options or {}
  local scripts = options.scripts or {}
  local autoApply = options.autoApply or false
  local backupFirst = options.backupFirst or true
  
  local results = {}
  
  for _, scriptPath in ipairs(scripts) do
    AgentCoordinator.log("info", "Processing: " .. scriptPath)
    
    local suggestions = AgentCoordinator.suggestImprovements(scriptPath)
    
    if suggestions then
      local result = {
        script = scriptPath,
        suggestions = suggestions,
        applied = false
      }
      
      if autoApply then
        local success, message = AgentCoordinator.applyImprovements(scriptPath, suggestions)
        result.applied = success
        result.message = message
      end
      
      table.insert(results, result)
    end
  end
  
  return results
end

-- Generate comprehensive report
function AgentCoordinator.generateReport()
  local searchAgent = AgentCoordinator.state.agents.search
  local improvementAgent = AgentCoordinator.state.agents.improvement
  
  local report = {
    timestamp = os.date("%Y-%m-%d %H:%M:%S"),
    stats = AgentCoordinator.state.stats,
    searchReport = nil,
    topIssues = {}
  }
  
  -- Add search report if available
  if searchAgent and searchAgent.cache.scripts and #searchAgent.cache.scripts > 0 then
    report.searchReport = searchAgent.generateReport()
  end
  
  -- Find scripts with most issues
  if searchAgent and searchAgent.cache.scripts then
    local scriptsWithIssues = searchAgent.findWithIssues()
    report.topIssues = scriptsWithIssues
  end
  
  return report
end

-- Print comprehensive report
function AgentCoordinator.printReport()
  local report = AgentCoordinator.generateReport()
  
  print("\n" .. string.rep("=", 60))
  print("           AI AGENT COORDINATOR REPORT")
  print(string.rep("=", 60))
  print("Timestamp: " .. report.timestamp)
  
  print("\n--- Statistics ---")
  print("Scripts Scanned: " .. report.stats.scriptsScanned)
  print("Issues Found: " .. report.stats.issuesFound)
  print("Improvements Applied: " .. report.stats.improvementsApplied)
  
  if report.searchReport then
    print("\n--- Search Report ---")
    print("Total Scripts: " .. report.searchReport.totalScripts)
    print("Total Lines: " .. report.searchReport.totalLines)
    print("Average Quality: " .. string.format("%.1f", report.searchReport.qualityMetrics.average) .. "%")
  end
  
  if #report.topIssues > 0 then
    print("\n--- Scripts Needing Attention ---")
    for i, script in ipairs(report.topIssues) do
      if i <= 5 then -- Top 5
        print(string.format("  %d. %s (%d issues)", i, script.filename, script.issueCount))
      end
    end
  end
  
  print("\n" .. string.rep("=", 60) .. "\n")
end

-- Find scripts by pattern
function AgentCoordinator.findByPattern(patternType)
  if not AgentCoordinator.state.initialized then
    AgentCoordinator.init()
  end
  
  local searchAgent = AgentCoordinator.state.agents.search
  if not searchAgent then
    return {}
  end
  
  return searchAgent.findByPattern(patternType)
end

-- Find scripts with security issues
function AgentCoordinator.findSecurityIssues()
  if not AgentCoordinator.state.initialized then
    AgentCoordinator.init()
  end
  
  local searchAgent = AgentCoordinator.state.agents.search
  local improvementAgent = AgentCoordinator.state.agents.improvement
  
  if not searchAgent or not improvementAgent then
    return {}
  end
  
  local scripts = searchAgent.cache.scripts or {}
  local securityIssues = {}
  
  for _, script in ipairs(scripts) do
    if script.path then
      local suggestions = improvementAgent.analyze(script.path)
      
      if suggestions and suggestions.security and #suggestions.security > 0 then
        table.insert(securityIssues, {
          script = script.filename,
          path = script.path,
          issues = suggestions.security
        })
      end
    end
  end
  
  return securityIssues
end

-- Get agent status
function AgentCoordinator.getStatus()
  return {
    initialized = AgentCoordinator.state.initialized,
    searchAgentAvailable = AgentCoordinator.state.agents.search ~= nil,
    improvementAgentAvailable = AgentCoordinator.state.agents.improvement ~= nil,
    stats = AgentCoordinator.state.stats
  }
end

-- Auto-initialize if configured
if AgentCoordinator.config.autoInitialize then
  AgentCoordinator.init()
end

return AgentCoordinator

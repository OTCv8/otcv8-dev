-- Script Search Agent for OTCv8
-- Searches, analyzes, and catalogs Lua scripts in the project

ScriptSearchAgent = {}

-- Configuration
ScriptSearchAgent.config = {
  recursive = true,
  maxDepth = 10,
  extensions = {".lua"},
  excludeDirs = {".git", "node_modules", "build", "vc16"},
  cacheEnabled = true
}

-- Cache for search results
ScriptSearchAgent.cache = {
  scripts = {},
  lastUpdate = 0,
  index = {}
}

-- Script patterns to detect
ScriptSearchAgent.patterns = {
  macro = "macro%s*%(.*%)",
  ui = "setupUI%s*%(%[%[",
  botswitch = "BotSwitch",
  event = "on%w+%s*%(function",
  storage = "storage%.%w+",
  attack = "g_game%.attack",
  spell = "say%s*%(.*exori",
  heal = "exura",
  follow = "follow",
  party = "party"
}

-- Initialize the agent
function ScriptSearchAgent.init(config)
  if config then
    for k, v in pairs(config) do
      ScriptSearchAgent.config[k] = v
    end
  end
  
  print("[ScriptSearchAgent] Initialized with config:")
  for k, v in pairs(ScriptSearchAgent.config) do
    print("  " .. k .. ": " .. tostring(v))
  end
  
  return true
end

-- Check if file should be excluded
function ScriptSearchAgent.shouldExclude(path)
  for _, excludeDir in ipairs(ScriptSearchAgent.config.excludeDirs) do
    if path:find(excludeDir, 1, true) then
      return true
    end
  end
  return false
end

-- Check if file has valid extension
function ScriptSearchAgent.hasValidExtension(filename)
  for _, ext in ipairs(ScriptSearchAgent.config.extensions) do
    if filename:match(ext .. "$") then
      return true
    end
  end
  return false
end

-- Read file content
function ScriptSearchAgent.readFile(filepath)
  local file = io.open(filepath, "r")
  if not file then
    return nil, "Could not open file: " .. filepath
  end
  
  local content = file:read("*all")
  file:close()
  
  return content
end

-- Analyze script content
function ScriptSearchAgent.analyzeContent(content, filename)
  local analysis = {
    filename = filename,
    size = #content,
    lines = 0,
    patterns = {},
    functions = {},
    issues = {},
    metrics = {}
  }
  
  -- Count lines
  for _ in content:gmatch("[^\r\n]+") do
    analysis.lines = analysis.lines + 1
  end
  
  -- Detect patterns
  for patternName, pattern in pairs(ScriptSearchAgent.patterns) do
    if content:find(pattern) then
      analysis.patterns[patternName] = true
    end
  end
  
  -- Extract function names
  for funcName in content:gmatch("function%s+([%w_%.]+)%s*%(") do
    table.insert(analysis.functions, funcName)
  end
  
  -- Detect potential issues
  if content:find("while%s+true%s+do") then
    table.insert(analysis.issues, "Infinite loop detected (while true)")
  end
  
  if content:find("goto%s+") then
    table.insert(analysis.issues, "Uses goto statement (consider refactoring)")
  end
  
  if analysis.lines > 500 then
    table.insert(analysis.issues, "Large file (" .. analysis.lines .. " lines, consider splitting)")
  end
  
  -- Check for code duplication indicators
  local lineSet = {}
  for line in content:gmatch("[^\r\n]+") do
    local trimmed = line:gsub("^%s+", ""):gsub("%s+$", "")
    if #trimmed > 10 then
      lineSet[trimmed] = (lineSet[trimmed] or 0) + 1
    end
  end
  
  local duplicateLines = 0
  for _, count in pairs(lineSet) do
    if count > 2 then
      duplicateLines = duplicateLines + count
    end
  end
  
  if duplicateLines > 20 then
    table.insert(analysis.issues, "Potential code duplication detected")
  end
  
  -- Calculate metrics
  analysis.metrics.codeQuality = math.max(0, 100 - (#analysis.issues * 10))
  analysis.metrics.complexity = math.min(100, analysis.lines / 10 + #analysis.functions * 2)
  
  return analysis
end

-- Search for scripts in a directory
function ScriptSearchAgent.searchDirectory(basePath, depth)
  depth = depth or 0
  
  if depth > ScriptSearchAgent.config.maxDepth then
    return {}
  end
  
  if ScriptSearchAgent.shouldExclude(basePath) then
    return {}
  end
  
  local results = {}
  local files = {}
  
  -- Try to list directory files
  local success, err = pcall(function()
    if g_resources and g_resources.listDirectoryFiles then
      files = g_resources.listDirectoryFiles(basePath, true, false)
    end
  end)
  
  if not success or #files == 0 then
    -- Fallback to common locations
    return results
  end
  
  for _, file in ipairs(files) do
    local fullPath = basePath .. "/" .. file
    
    if ScriptSearchAgent.hasValidExtension(file) and not ScriptSearchAgent.shouldExclude(fullPath) then
      local content, err = ScriptSearchAgent.readFile(fullPath)
      
      if content then
        local analysis = ScriptSearchAgent.analyzeContent(content, file)
        analysis.path = fullPath
        table.insert(results, analysis)
      end
    end
  end
  
  return results
end

-- Search all scripts with filters
function ScriptSearchAgent.search(basePath, filters)
  basePath = basePath or "/"
  filters = filters or {}
  
  print("[ScriptSearchAgent] Searching scripts in: " .. basePath)
  
  local results = ScriptSearchAgent.searchDirectory(basePath, 0)
  
  -- Apply filters
  if filters.type then
    local filtered = {}
    for _, script in ipairs(results) do
      if script.patterns[filters.type] then
        table.insert(filtered, script)
      end
    end
    results = filtered
  end
  
  if filters.minSize then
    local filtered = {}
    for _, script in ipairs(results) do
      if script.size >= filters.minSize then
        table.insert(filtered, script)
      end
    end
    results = filtered
  end
  
  if filters.maxSize then
    local filtered = {}
    for _, script in ipairs(results) do
      if script.size <= filters.maxSize then
        table.insert(filtered, script)
      end
    end
    results = filtered
  end
  
  -- Update cache
  if ScriptSearchAgent.config.cacheEnabled then
    ScriptSearchAgent.cache.scripts = results
    ScriptSearchAgent.cache.lastUpdate = os.time()
    ScriptSearchAgent.buildIndex(results)
  end
  
  print("[ScriptSearchAgent] Found " .. #results .. " scripts")
  
  return results
end

-- Build searchable index
function ScriptSearchAgent.buildIndex(scripts)
  local index = {
    byPattern = {},
    byFunction = {},
    byIssue = {}
  }
  
  for _, script in ipairs(scripts) do
    -- Index by pattern
    for pattern, _ in pairs(script.patterns) do
      if not index.byPattern[pattern] then
        index.byPattern[pattern] = {}
      end
      table.insert(index.byPattern[pattern], script.filename)
    end
    
    -- Index by function
    for _, func in ipairs(script.functions) do
      if not index.byFunction[func] then
        index.byFunction[func] = {}
      end
      table.insert(index.byFunction[func], script.filename)
    end
    
    -- Index by issue
    for _, issue in ipairs(script.issues) do
      if not index.byIssue[issue] then
        index.byIssue[issue] = {}
      end
      table.insert(index.byIssue[issue], script.filename)
    end
  end
  
  ScriptSearchAgent.cache.index = index
  return index
end

-- Find scripts by pattern
function ScriptSearchAgent.findByPattern(patternType)
  if not ScriptSearchAgent.cache.index.byPattern then
    return {}
  end
  
  return ScriptSearchAgent.cache.index.byPattern[patternType] or {}
end

-- Find scripts with issues
function ScriptSearchAgent.findWithIssues()
  local scriptsWithIssues = {}
  
  for _, script in ipairs(ScriptSearchAgent.cache.scripts) do
    if #script.issues > 0 then
      table.insert(scriptsWithIssues, {
        filename = script.filename,
        path = script.path,
        issues = script.issues,
        issueCount = #script.issues
      })
    end
  end
  
  -- Sort by issue count
  table.sort(scriptsWithIssues, function(a, b)
    return a.issueCount > b.issueCount
  end)
  
  return scriptsWithIssues
end

-- Generate search report
function ScriptSearchAgent.generateReport(scripts)
  scripts = scripts or ScriptSearchAgent.cache.scripts
  
  local report = {
    totalScripts = #scripts,
    totalLines = 0,
    totalSize = 0,
    patternStats = {},
    issueStats = {},
    qualityMetrics = {
      average = 0,
      min = 100,
      max = 0
    }
  }
  
  for _, script in ipairs(scripts) do
    report.totalLines = report.totalLines + script.lines
    report.totalSize = report.totalSize + script.size
    
    -- Pattern statistics
    for pattern, _ in pairs(script.patterns) do
      report.patternStats[pattern] = (report.patternStats[pattern] or 0) + 1
    end
    
    -- Issue statistics
    for _, issue in ipairs(script.issues) do
      report.issueStats[issue] = (report.issueStats[issue] or 0) + 1
    end
    
    -- Quality metrics
    local quality = script.metrics.codeQuality or 0
    report.qualityMetrics.average = report.qualityMetrics.average + quality
    report.qualityMetrics.min = math.min(report.qualityMetrics.min, quality)
    report.qualityMetrics.max = math.max(report.qualityMetrics.max, quality)
  end
  
  if #scripts > 0 then
    report.qualityMetrics.average = report.qualityMetrics.average / #scripts
  end
  
  return report
end

-- Print formatted report
function ScriptSearchAgent.printReport(report)
  print("\n=== Script Search Report ===")
  print("Total Scripts: " .. report.totalScripts)
  print("Total Lines: " .. report.totalLines)
  print("Total Size: " .. report.totalSize .. " bytes")
  
  print("\n--- Pattern Statistics ---")
  for pattern, count in pairs(report.patternStats) do
    print("  " .. pattern .. ": " .. count)
  end
  
  if next(report.issueStats) then
    print("\n--- Issue Statistics ---")
    for issue, count in pairs(report.issueStats) do
      print("  " .. issue .. ": " .. count)
    end
  end
  
  print("\n--- Quality Metrics ---")
  print("  Average: " .. string.format("%.1f", report.qualityMetrics.average))
  print("  Min: " .. string.format("%.1f", report.qualityMetrics.min))
  print("  Max: " .. string.format("%.1f", report.qualityMetrics.max))
  print("========================\n")
end

return ScriptSearchAgent

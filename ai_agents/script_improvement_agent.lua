-- Script Improvement Agent for OTCv8
-- Analyzes scripts and suggests improvements for code quality, performance, and security

ScriptImprovementAgent = {}

-- Configuration
ScriptImprovementAgent.config = {
  autoFix = false,
  createBackup = true,
  suggestions = {
    performance = true,
    security = true,
    style = true,
    documentation = true,
    refactoring = true
  },
  backupDir = "ai_agents/backups/"
}

-- Improvement categories
ScriptImprovementAgent.categories = {
  PERFORMANCE = "performance",
  SECURITY = "security",
  STYLE = "style",
  DOCUMENTATION = "documentation",
  REFACTORING = "refactoring"
}

-- Initialize the agent
function ScriptImprovementAgent.init(config)
  if config then
    for k, v in pairs(config) do
      ScriptImprovementAgent.config[k] = v
    end
  end
  
  print("[ScriptImprovementAgent] Initialized")
  return true
end

-- Read file content
function ScriptImprovementAgent.readFile(filepath)
  local file = io.open(filepath, "r")
  if not file then
    return nil, "Could not open file: " .. filepath
  end
  
  local content = file:read("*all")
  file:close()
  
  return content
end

-- Write file content
function ScriptImprovementAgent.writeFile(filepath, content)
  local file = io.open(filepath, "w")
  if not file then
    return false, "Could not write to file: " .. filepath
  end
  
  file:write(content)
  file:close()
  
  return true
end

-- Create backup of a file
function ScriptImprovementAgent.createBackup(filepath)
  if not ScriptImprovementAgent.config.createBackup then
    return true
  end
  
  local content, err = ScriptImprovementAgent.readFile(filepath)
  if not content then
    return false, err
  end
  
  local timestamp = os.date("%Y%m%d_%H%M%S")
  local filename = filepath:match("([^/]+)$")
  local backupPath = ScriptImprovementAgent.config.backupDir .. filename .. "." .. timestamp .. ".bak"
  
  return ScriptImprovementAgent.writeFile(backupPath, content)
end

-- Analyze script for improvements
function ScriptImprovementAgent.analyze(filepath)
  local content, err = ScriptImprovementAgent.readFile(filepath)
  if not content then
    return nil, err
  end
  
  local suggestions = {
    performance = {},
    security = {},
    style = {},
    documentation = {},
    refactoring = {}
  }
  
  -- Performance improvements
  if ScriptImprovementAgent.config.suggestions.performance then
    suggestions.performance = ScriptImprovementAgent.analyzePerformance(content)
  end
  
  -- Security improvements
  if ScriptImprovementAgent.config.suggestions.security then
    suggestions.security = ScriptImprovementAgent.analyzeSecurity(content)
  end
  
  -- Style improvements
  if ScriptImprovementAgent.config.suggestions.style then
    suggestions.style = ScriptImprovementAgent.analyzeStyle(content)
  end
  
  -- Documentation improvements
  if ScriptImprovementAgent.config.suggestions.documentation then
    suggestions.documentation = ScriptImprovementAgent.analyzeDocumentation(content)
  end
  
  -- Refactoring opportunities
  if ScriptImprovementAgent.config.suggestions.refactoring then
    suggestions.refactoring = ScriptImprovementAgent.analyzeRefactoring(content)
  end
  
  return suggestions
end

-- Analyze performance issues
function ScriptImprovementAgent.analyzePerformance(content)
  local issues = {}
  
  -- Check for inefficient loops
  if content:find("for%s+.-%s+do.-for%s+") then
    table.insert(issues, {
      severity = "medium",
      message = "Nested loops detected - consider optimization",
      suggestion = "Review nested loops for potential optimization or caching"
    })
  end
  
  -- Check for repeated function calls in loops
  if content:find("for.-do.-#[%w_]+%(%)") then
    table.insert(issues, {
      severity = "low",
      message = "Function called repeatedly in loop",
      suggestion = "Cache function results outside loop when possible"
    })
  end
  
  -- Check for string concatenation in loops
  if content:find("for.-do.-..\".\"") or content:find("for.-do.-..%s*['\"]") then
    table.insert(issues, {
      severity = "medium",
      message = "String concatenation in loop",
      suggestion = "Use table.concat() for better performance"
    })
  end
  
  -- Check for global variable access in tight loops
  for varName in content:gmatch("for%s+.-%s+do.-([%w_]+)%s*=") do
    if not content:find("local%s+" .. varName) then
      table.insert(issues, {
        severity = "low",
        message = "Global variable access in loop: " .. varName,
        suggestion = "Use local variables for better performance"
      })
      break -- Only report once
    end
  end
  
  -- Check for missing local declarations
  local globalRefs = {}
  for line in content:gmatch("[^\r\n]+") do
    if not line:find("^%s*%-%-") then -- Skip comments
      for varName in line:gmatch("([%w_]+)%s*=") do
        if not line:find("local%s+" .. varName) and not globalRefs[varName] then
          globalRefs[varName] = true
        end
      end
    end
  end
  
  if next(globalRefs) then
    local count = 0
    for _ in pairs(globalRefs) do count = count + 1 end
    if count > 3 then
      table.insert(issues, {
        severity = "medium",
        message = count .. " variables without local declaration",
        suggestion = "Add 'local' keyword to variable declarations"
      })
    end
  end
  
  return issues
end

-- Analyze security issues
function ScriptImprovementAgent.analyzeSecurity(content)
  local issues = {}
  
  -- Check for eval-like patterns
  if content:find("loadstring") or content:find("load%(") then
    table.insert(issues, {
      severity = "high",
      message = "Dynamic code execution detected (loadstring/load)",
      suggestion = "Avoid dynamic code execution - use safer alternatives"
    })
  end
  
  -- Check for os.execute usage
  if content:find("os%.execute") then
    table.insert(issues, {
      severity = "high",
      message = "System command execution detected (os.execute)",
      suggestion = "Validate and sanitize all inputs before system calls"
    })
  end
  
  -- Check for potential SQL injection
  if content:find("SELECT%s+.*%s+%.%.") or content:find("INSERT%s+.*%s+%.%.") or 
     content:find("UPDATE%s+.*%s+%.%.") or content:find("DELETE%s+.*%s+%.%.") then
    table.insert(issues, {
      severity = "high",
      message = "Potential SQL injection vulnerability",
      suggestion = "Use parameterized queries instead of string concatenation"
    })
  end
  
  -- Check for hardcoded credentials
  if content:find("[Pp]assword%s*=%s*['\"]") or content:find("[Aa]pi[Kk]ey%s*=%s*['\"]") then
    table.insert(issues, {
      severity = "critical",
      message = "Hardcoded credentials detected",
      suggestion = "Move credentials to secure configuration or environment variables"
    })
  end
  
  -- Check for unsafe file operations
  if content:find("io%.open.*%.%.") then
    table.insert(issues, {
      severity = "medium",
      message = "File path concatenation detected",
      suggestion = "Validate file paths to prevent directory traversal attacks"
    })
  end
  
  return issues
end

-- Analyze style issues
function ScriptImprovementAgent.analyzeStyle(content)
  local issues = {}
  
  -- Check for inconsistent indentation
  local indentTypes = {tabs = 0, spaces = 0}
  for line in content:gmatch("[^\r\n]+") do
    if line:match("^%s+") then
      if line:match("^\t") then
        indentTypes.tabs = indentTypes.tabs + 1
      elseif line:match("^  ") then
        indentTypes.spaces = indentTypes.spaces + 1
      end
    end
  end
  
  if indentTypes.tabs > 0 and indentTypes.spaces > 0 then
    table.insert(issues, {
      severity = "low",
      message = "Mixed tabs and spaces for indentation",
      suggestion = "Use consistent indentation (prefer spaces)"
    })
  end
  
  -- Check for long lines
  for line in content:gmatch("[^\r\n]+") do
    if #line > 120 then
      table.insert(issues, {
        severity = "low",
        message = "Lines exceed 120 characters",
        suggestion = "Break long lines for better readability"
      })
      break -- Only report once
    end
  end
  
  -- Check for missing spaces around operators
  if content:find("[%w_]+=[%w_]+") or content:find("[%w_]+%+[%w_]+") then
    table.insert(issues, {
      severity = "low",
      message = "Missing spaces around operators",
      suggestion = "Add spaces around operators for readability"
    })
  end
  
  -- Check for magic numbers
  local magicNumbers = {}
  for num in content:gmatch("%s([0-9]+)%s") do
    local n = tonumber(num)
    if n and n > 10 and n ~= 100 and n ~= 1000 then
      magicNumbers[num] = true
    end
  end
  
  local magicCount = 0
  for _ in pairs(magicNumbers) do magicCount = magicCount + 1 end
  
  if magicCount > 5 then
    table.insert(issues, {
      severity = "low",
      message = "Magic numbers detected",
      suggestion = "Define constants for numeric literals"
    })
  end
  
  return issues
end

-- Analyze documentation
function ScriptImprovementAgent.analyzeDocumentation(content)
  local issues = {}
  
  -- Count functions
  local functionCount = 0
  local documentedFunctions = 0
  
  for funcDef in content:gmatch("function%s+([%w_%.]+)%s*%(") do
    functionCount = functionCount + 1
    
    -- Check if previous line is a comment
    local pattern = "%-%-.-\n%s*function%s+" .. funcDef:gsub("%.", "%%.") .. "%s*%("
    if content:find(pattern) then
      documentedFunctions = documentedFunctions + 1
    end
  end
  
  if functionCount > 3 then
    local docRatio = documentedFunctions / functionCount
    if docRatio < 0.3 then
      table.insert(issues, {
        severity = "low",
        message = "Low documentation coverage (" .. math.floor(docRatio * 100) .. "%)",
        suggestion = "Add documentation comments for functions"
      })
    end
  end
  
  -- Check for file header
  if not content:find("^%s*%-%-") then
    table.insert(issues, {
      severity = "low",
      message = "Missing file header comment",
      suggestion = "Add header comment describing the script purpose"
    })
  end
  
  -- Check for TODO/FIXME comments
  local todoCount = 0
  for _ in content:gmatch("TODO") do todoCount = todoCount + 1 end
  for _ in content:gmatch("FIXME") do todoCount = todoCount + 1 end
  
  if todoCount > 0 then
    table.insert(issues, {
      severity = "info",
      message = todoCount .. " TODO/FIXME comments found",
      suggestion = "Review and address pending tasks"
    })
  end
  
  return issues
end

-- Analyze refactoring opportunities
function ScriptImprovementAgent.analyzeRefactoring(content)
  local issues = {}
  
  -- Check for long functions
  local currentFunction = nil
  local functionLines = {}
  local lineCount = 0
  
  for line in content:gmatch("[^\r\n]+") do
    lineCount = lineCount + 1
    
    local funcName = line:match("function%s+([%w_%.]+)%s*%(")
    if funcName then
      currentFunction = funcName
      functionLines[funcName] = {start = lineCount, lines = 0}
    elseif currentFunction and line:match("^end%s*$") then
      if functionLines[currentFunction] then
        functionLines[currentFunction].lines = lineCount - functionLines[currentFunction].start
        if functionLines[currentFunction].lines > 50 then
          -- Escape the function name for display (not used in pattern matching)
          local safeFuncName = currentFunction:gsub("%%", "%%%%")
          table.insert(issues, {
            severity = "medium",
            message = "Long function: " .. safeFuncName .. " (" .. functionLines[currentFunction].lines .. " lines)",
            suggestion = "Consider breaking into smaller functions"
          })
        end
      end
      currentFunction = nil
    end
  end
  
  -- Check for duplicate code patterns
  local codeBlocks = {}
  local duplicates = {}
  
  for block in content:gmatch("if%s+.-%s+then(.-)end") do
    local normalized = block:gsub("%s+", " ")
    if #normalized > 30 then
      if codeBlocks[normalized] then
        duplicates[normalized] = true
      else
        codeBlocks[normalized] = true
      end
    end
  end
  
  local dupCount = 0
  for _ in pairs(duplicates) do dupCount = dupCount + 1 end
  
  if dupCount > 0 then
    table.insert(issues, {
      severity = "medium",
      message = "Duplicate code blocks detected (" .. dupCount .. ")",
      suggestion = "Extract common code into reusable functions"
    })
  end
  
  -- Check for complex conditionals
  if content:find("if%s+.-%s+and%s+.-%s+and%s+.-%s+and") or 
     content:find("if%s+.-%s+or%s+.-%s+or%s+.-%s+or") then
    table.insert(issues, {
      severity = "low",
      message = "Complex conditional expressions",
      suggestion = "Simplify conditions or extract to named variables"
    })
  end
  
  return issues
end

-- Generate improvement report
function ScriptImprovementAgent.generateReport(suggestions)
  local report = {
    totalIssues = 0,
    bySeverity = {
      critical = 0,
      high = 0,
      medium = 0,
      low = 0,
      info = 0
    },
    byCategory = {
      performance = 0,
      security = 0,
      style = 0,
      documentation = 0,
      refactoring = 0
    }
  }
  
  for category, issues in pairs(suggestions) do
    report.byCategory[category] = #issues
    report.totalIssues = report.totalIssues + #issues
    
    for _, issue in ipairs(issues) do
      local severity = issue.severity or "low"
      report.bySeverity[severity] = (report.bySeverity[severity] or 0) + 1
    end
  end
  
  return report
end

-- Print formatted improvement report
function ScriptImprovementAgent.printReport(suggestions, scriptName)
  print("\n=== Improvement Report: " .. scriptName .. " ===")
  
  local report = ScriptImprovementAgent.generateReport(suggestions)
  
  print("\nTotal Issues: " .. report.totalIssues)
  
  print("\n--- By Severity ---")
  for severity, count in pairs(report.bySeverity) do
    if count > 0 then
      print("  " .. severity:upper() .. ": " .. count)
    end
  end
  
  print("\n--- By Category ---")
  for category, count in pairs(report.byCategory) do
    if count > 0 then
      print("  " .. category .. ": " .. count)
    end
  end
  
  print("\n--- Detailed Suggestions ---")
  for category, issues in pairs(suggestions) do
    if #issues > 0 then
      print("\n" .. category:upper() .. ":")
      for _, issue in ipairs(issues) do
        print("  [" .. issue.severity:upper() .. "] " .. issue.message)
        print("    → " .. issue.suggestion)
      end
    end
  end
  
  print("\n========================\n")
end

-- Apply automatic fixes (placeholder for future implementation)
function ScriptImprovementAgent.applyFixes(filepath, suggestions)
  if not ScriptImprovementAgent.config.autoFix then
    return false, "Auto-fix is disabled"
  end
  
  -- Create backup first
  local success, err = ScriptImprovementAgent.createBackup(filepath)
  if not success then
    return false, "Backup failed: " .. err
  end
  
  print("[ScriptImprovementAgent] Auto-fix is not yet implemented")
  print("  Backup created for: " .. filepath)
  
  return true, "Manual fixes required - see suggestions"
end

return ScriptImprovementAgent

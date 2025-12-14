# AI Agents for OTCv8 Script Management

This directory contains AI agents designed to search, analyze, and improve Lua scripts in the OTCv8 project.

## Overview

The AI agent system consists of three main components:

1. **Script Search Agent** (`script_search_agent.lua`) - Searches and catalogs Lua scripts
2. **Script Improvement Agent** (`script_improvement_agent.lua`) - Analyzes and suggests improvements
3. **Agent Coordinator** (`agent_coordinator.lua`) - Manages and coordinates the agents

## Features

### Script Search Agent
- Recursively scans directories for Lua scripts
- Analyzes script structure and content
- Identifies script types (macros, UI, game logic, etc.)
- Creates searchable index of scripts
- Detects common patterns and issues

### Script Improvement Agent
- Code quality analysis
- Performance optimization suggestions
- Security vulnerability detection
- Code style consistency checks
- Best practice recommendations
- Automated refactoring suggestions

## Usage

### Basic Usage

```lua
-- Load the agent system
dofile("ai_agents/agent_coordinator.lua")

-- Search for all scripts
local results = AgentCoordinator.searchScripts("/")

-- Analyze a specific script
local analysis = AgentCoordinator.analyzeScript("SuperDash.lua")

-- Get improvement suggestions
local improvements = AgentCoordinator.suggestImprovements("SuperDash.lua")

-- Apply improvements
AgentCoordinator.applyImprovements("SuperDash.lua", improvements)
```

### Advanced Usage

```lua
-- Search with filters
local botScripts = AgentCoordinator.searchScripts("/", {
  type = "macro",
  minSize = 100,
  maxSize = 10000
})

-- Custom analysis
local customAnalysis = ScriptSearchAgent.analyze("script.lua", {
  checkPerformance = true,
  checkSecurity = true,
  checkStyle = true
})

-- Batch improvements
AgentCoordinator.batchImprove({
  scripts = {"SuperDash.lua", "magebomb.lua"},
  autoApply = false,
  backupFirst = true
})
```

## Agent Configuration

Each agent can be configured through storage variables:

```lua
storage.aiAgents = {
  searchAgent = {
    recursive = true,
    maxDepth = 10,
    extensions = {".lua"},
    excludeDirs = {".git", "node_modules"}
  },
  improvementAgent = {
    autoFix = false,
    createBackup = true,
    suggestions = {
      performance = true,
      security = true,
      style = true,
      documentation = true
    }
  }
}
```

## Safety Features

- **Automatic Backups**: Creates backups before applying changes
- **Dry Run Mode**: Preview changes without applying them
- **Rollback Support**: Revert changes if issues occur
- **Change Log**: Track all modifications made by agents

## Examples

See the `examples/` directory for detailed examples:
- `example_search.lua` - Script search examples
- `example_improve.lua` - Script improvement examples
- `example_batch.lua` - Batch processing examples

## Contributing

When adding new agent capabilities:
1. Update the relevant agent file
2. Add tests to verify functionality
3. Update this documentation
4. Add examples for new features

## License

Part of the OTCv8 project. See main repository LICENSE file.

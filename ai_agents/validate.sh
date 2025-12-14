#!/usr/bin/env bash

# Validation script for AI Agents
# Checks that all required files exist and have proper structure

echo "=== AI Agents Validation Script ==="
echo

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PASS=0
FAIL=0

# Function to check file exists
check_file() {
  if [ -f "$1" ]; then
    echo -e "${GREEN}✓${NC} File exists: $1"
    PASS=$((PASS + 1))
    return 0
  else
    echo -e "${RED}✗${NC} Missing file: $1"
    FAIL=$((FAIL + 1))
    return 1
  fi
}

# Function to check directory exists
check_dir() {
  if [ -d "$1" ]; then
    echo -e "${GREEN}✓${NC} Directory exists: $1"
    PASS=$((PASS + 1))
    return 0
  else
    echo -e "${RED}✗${NC} Missing directory: $1"
    FAIL=$((FAIL + 1))
    return 1
  fi
}

# Function to check file contains text
check_content() {
  if grep -q "$2" "$1" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Found '$2' in $1"
    PASS=$((PASS + 1))
    return 0
  else
    echo -e "${RED}✗${NC} Missing '$2' in $1"
    FAIL=$((FAIL + 1))
    return 1
  fi
}

echo "--- Checking Directory Structure ---"
check_dir "ai_agents"
check_dir "ai_agents/examples"
check_dir "ai_agents/backups"
echo

echo "--- Checking Core Agent Files ---"
check_file "ai_agents/agent_coordinator.lua"
check_file "ai_agents/script_search_agent.lua"
check_file "ai_agents/script_improvement_agent.lua"
check_file "ai_agents/launcher.lua"
echo

echo "--- Checking Documentation ---"
check_file "ai_agents/README.md"
check_file "ai_agents/INSTRUKCJA_PL.md"
echo

echo "--- Checking Examples ---"
check_file "ai_agents/examples/quick_start.lua"
check_file "ai_agents/examples/example_search.lua"
check_file "ai_agents/examples/example_improve.lua"
echo

echo "--- Checking File Content (Agent Coordinator) ---"
check_content "ai_agents/agent_coordinator.lua" "AgentCoordinator"
check_content "ai_agents/agent_coordinator.lua" "function AgentCoordinator.init"
check_content "ai_agents/agent_coordinator.lua" "searchScripts"
check_content "ai_agents/agent_coordinator.lua" "suggestImprovements"
echo

echo "--- Checking File Content (Search Agent) ---"
check_content "ai_agents/script_search_agent.lua" "ScriptSearchAgent"
check_content "ai_agents/script_search_agent.lua" "function ScriptSearchAgent.search"
check_content "ai_agents/script_search_agent.lua" "function ScriptSearchAgent.analyzeContent"
echo

echo "--- Checking File Content (Improvement Agent) ---"
check_content "ai_agents/script_improvement_agent.lua" "ScriptImprovementAgent"
check_content "ai_agents/script_improvement_agent.lua" "function ScriptImprovementAgent.analyze"
check_content "ai_agents/script_improvement_agent.lua" "analyzePerformance"
check_content "ai_agents/script_improvement_agent.lua" "analyzeSecurity"
echo

echo "--- Checking Documentation Content ---"
check_content "ai_agents/README.md" "AI Agents for OTCv8"
check_content "ai_agents/README.md" "Script Search Agent"
check_content "ai_agents/README.md" "Script Improvement Agent"
check_content "ai_agents/INSTRUKCJA_PL.md" "Instrukcja"
check_content "ai_agents/INSTRUKCJA_PL.md" "Szybki Start"
echo

echo "--- File Statistics ---"
echo "Total Lua files in ai_agents:"
find ai_agents -name "*.lua" -type f | wc -l

echo "Total lines of code in agents:"
find ai_agents -name "*.lua" -type f -exec cat {} \; | wc -l

echo "Total documentation size:"
find ai_agents -name "*.md" -type f -exec cat {} \; | wc -c | awk '{print $1 " bytes"}'
echo

echo "==================================="
echo "Validation Results:"
echo -e "${GREEN}Passed: $PASS${NC}"
echo -e "${RED}Failed: $FAIL${NC}"
echo "==================================="

if [ $FAIL -eq 0 ]; then
  echo -e "${GREEN}✓ All validations passed!${NC}"
  echo
  echo "The AI Agent system is properly installed."
  echo
  echo "Usage:"
  echo "  1. Load in your Lua scripts with: dofile('ai_agents/launcher.lua')"
  echo "  2. See examples in ai_agents/examples/"
  echo "  3. Read documentation in ai_agents/README.md"
  exit 0
else
  echo -e "${RED}✗ Some validations failed!${NC}"
  exit 1
fi

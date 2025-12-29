# AI Agents System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    OTCv8 AI Agent System                    │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                      User Interface                          │
├─────────────────────────────────────────────────────────────┤
│  • launcher.lua (Interactive menu)                          │
│  • Examples (quick_start, search, improve)                  │
│  • Direct API calls from user scripts                       │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                   Agent Coordinator                          │
├─────────────────────────────────────────────────────────────┤
│  • Manages both agents                                       │
│  • Provides unified API                                      │
│  • Handles batch operations                                  │
│  • Tracks statistics                                         │
│  • Generates comprehensive reports                           │
│                                                              │
│  Main Functions:                                             │
│  ├─ searchScripts(path, filters)                            │
│  ├─ analyzeScript(filepath, options)                        │
│  ├─ suggestImprovements(filepath)                           │
│  ├─ applyImprovements(filepath, suggestions)                │
│  ├─ batchImprove(options)                                   │
│  ├─ findSecurityIssues()                                    │
│  └─ printReport()                                            │
└───────────┬────────────────────────────┬────────────────────┘
            │                            │
            ▼                            ▼
┌───────────────────────────┐  ┌───────────────────────────────┐
│  Script Search Agent      │  │  Script Improvement Agent     │
├───────────────────────────┤  ├───────────────────────────────┤
│                           │  │                               │
│ Functions:                │  │ Analysis Categories:          │
│ • search()                │  │ • Performance                 │
│ • analyzeContent()        │  │   - Nested loops              │
│ • findByPattern()         │  │   - Global variables          │
│ • findWithIssues()        │  │   - String concatenation      │
│ • buildIndex()            │  │                               │
│ • generateReport()        │  │ • Security                    │
│                           │  │   - SQL injection             │
│ Pattern Detection:        │  │   - Hardcoded credentials     │
│ • macro                   │  │   - Unsafe file operations    │
│ • ui                      │  │   - Dynamic code execution    │
│ • event                   │  │                               │
│ • storage                 │  │ • Style                       │
│ • attack                  │  │   - Indentation               │
│ • spell                   │  │   - Line length               │
│ • heal                    │  │   - Operator spacing          │
│ • follow                  │  │   - Magic numbers             │
│ • party                   │  │                               │
│                           │  │ • Documentation               │
│ Metrics:                  │  │   - Function comments         │
│ • Code quality score      │  │   - File headers              │
│ • Complexity level        │  │   - TODO tracking             │
│ • Issue count             │  │                               │
│                           │  │ • Refactoring                 │
│                           │  │   - Long functions            │
│                           │  │   - Code duplication          │
│                           │  │   - Complex conditionals      │
└───────────────────────────┘  └───────────────────────────────┘
            │                            │
            │                            │
            ▼                            ▼
┌─────────────────────────────────────────────────────────────┐
│                        File System                           │
├─────────────────────────────────────────────────────────────┤
│  • Lua script files (*.lua)                                 │
│  • Backup directory (ai_agents/backups/)                    │
│  • Search cache and index                                   │
└─────────────────────────────────────────────────────────────┘


┌─────────────────────────────────────────────────────────────┐
│                       Data Flow                              │
└─────────────────────────────────────────────────────────────┘

User Request
    │
    ├─→ Search Request
    │       │
    │       ├─→ Agent Coordinator
    │       │       │
    │       │       └─→ Script Search Agent
    │       │               │
    │       │               ├─→ Scan directories
    │       │               ├─→ Read files
    │       │               ├─→ Analyze content
    │       │               ├─→ Detect patterns
    │       │               ├─→ Find issues
    │       │               └─→ Build index
    │       │
    │       └─→ Results + Report
    │
    └─→ Improvement Request
            │
            ├─→ Agent Coordinator
            │       │
            │       └─→ Script Improvement Agent
            │               │
            │               ├─→ Read script
            │               ├─→ Analyze performance
            │               ├─→ Analyze security
            │               ├─→ Analyze style
            │               ├─→ Analyze documentation
            │               ├─→ Analyze refactoring
            │               └─→ Generate suggestions
            │
            └─→ Suggestions + Report


┌─────────────────────────────────────────────────────────────┐
│                     Output Examples                          │
└─────────────────────────────────────────────────────────────┘

Search Report:
  ╔══════════════════════════════════════╗
  ║   Script Search Report               ║
  ╠══════════════════════════════════════╣
  ║ Total Scripts: 15                    ║
  ║ Total Lines: 5,432                   ║
  ║ Total Size: 128,456 bytes            ║
  ║                                      ║
  ║ Pattern Statistics:                  ║
  ║   macro: 8                           ║
  ║   ui: 5                              ║
  ║   event: 12                          ║
  ║                                      ║
  ║ Quality Metrics:                     ║
  ║   Average: 78.5                      ║
  ║   Min: 45.0                          ║
  ║   Max: 95.0                          ║
  ╚══════════════════════════════════════╝

Improvement Report:
  ╔══════════════════════════════════════╗
  ║ Improvement Report: script.lua       ║
  ╠══════════════════════════════════════╣
  ║ Total Issues: 12                     ║
  ║                                      ║
  ║ By Severity:                         ║
  ║   CRITICAL: 1                        ║
  ║   HIGH: 2                            ║
  ║   MEDIUM: 4                          ║
  ║   LOW: 5                             ║
  ║                                      ║
  ║ By Category:                         ║
  ║   performance: 3                     ║
  ║   security: 3                        ║
  ║   style: 4                           ║
  ║   documentation: 2                   ║
  ╚══════════════════════════════════════╝


┌─────────────────────────────────────────────────────────────┐
│                   Integration Points                         │
└─────────────────────────────────────────────────────────────┘

  OTCv8 Client
       │
       ├─→ Load via dofile("ai_agents/launcher.lua")
       │
       ├─→ Use in bot scripts for self-analysis
       │
       ├─→ Integrate with development workflow
       │
       └─→ Automated quality checks


┌─────────────────────────────────────────────────────────────┐
│                    Safety Features                           │
└─────────────────────────────────────────────────────────────┘

  ┌────────────────────┐
  │ Before Changes     │
  └──────┬─────────────┘
         │
         ├─→ Create Backup
         ├─→ Validate Input
         └─→ Dry Run Mode
                │
                ▼
  ┌────────────────────┐
  │ Apply Changes      │
  └──────┬─────────────┘
         │
         ├─→ Track Changes
         ├─→ Log Actions
         └─→ Enable Rollback
                │
                ▼
  ┌────────────────────┐
  │ After Changes      │
  └──────┬─────────────┘
         │
         ├─→ Verify Success
         ├─→ Generate Report
         └─→ Cleanup Temp Files

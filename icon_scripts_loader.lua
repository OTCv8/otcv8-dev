-- Icon Scripts Master Loader
-- Automatically loads all modern icon-based scripts
-- Created by AI Agents System

print([[
╔════════════════════════════════════════════════════════════════╗
║            Icon-Based Scripts - Master Loader                  ║
║                   Latest Version 2024                          ║
╚════════════════════════════════════════════════════════════════╝
]])

-- Configuration
local iconScripts = {
  {name = "Icon Healer", file = "icon_healer.lua", enabled = true},
  {name = "Icon Combat", file = "icon_combat.lua", enabled = true},
  {name = "Icon Utility", file = "icon_utility.lua", enabled = true},
  {name = "Icon Loot", file = "icon_loot.lua", enabled = true},
  {name = "Icon Cavebot", file = "icon_cavebot.lua", enabled = true}
}

-- Storage for loader
if not storage.iconLoader then
  storage.iconLoader = {
    autoLoad = true,
    loadedScripts = {}
  }
end

-- Load scripts function
local function loadIconScript(scriptInfo)
  if not scriptInfo.enabled then
    print(string.format("⊘ %s - Disabled", scriptInfo.name))
    return false
  end
  
  local success, error = pcall(function()
    dofile(scriptInfo.file)
  end)
  
  if success then
    print(string.format("✓ %s - Loaded successfully", scriptInfo.name))
    table.insert(storage.iconLoader.loadedScripts, scriptInfo.name)
    return true
  else
    print(string.format("✗ %s - Failed to load", scriptInfo.name))
    if error then
      print(string.format("  Error: %s", tostring(error)))
    end
    return false
  end
end

-- Main loading process
print("\n--- Loading Icon Scripts ---")

local loadedCount = 0
local totalCount = 0

for _, script in ipairs(iconScripts) do
  totalCount = totalCount + 1
  if loadIconScript(script) then
    loadedCount = loadedCount + 1
  end
end

print(string.rep("─", 60))
print(string.format("Loaded %d/%d scripts successfully", loadedCount, totalCount))
print(string.rep("─", 60))

-- Create UI for loader control
setDefaultTab("Loader")
UI.Label("Icon Scripts Loader")
UI.Separator()

UI.Label(string.format("Status: %d/%d scripts loaded", loadedCount, totalCount))
UI.Separator()

-- Reload button
addButton("Reload All Scripts", function()
  print("\n[Loader] Reloading all scripts...")
  storage.iconLoader.loadedScripts = {}
  
  for _, script in ipairs(iconScripts) do
    loadIconScript(script)
  end
  
  print("[Loader] Reload complete!")
end)

-- Show loaded scripts
addButton("Show Loaded Scripts", function()
  print("\n[Loader] Currently loaded scripts:")
  for i, scriptName in ipairs(storage.iconLoader.loadedScripts) do
    print(string.format("  %d. %s", i, scriptName))
  end
end)

UI.Separator()

-- Individual script toggles
UI.Label("Script Control:")

for i, script in ipairs(iconScripts) do
  addSwitch("script_" .. i, script.name, function(widget)
    iconScripts[i].enabled = not iconScripts[i].enabled
    widget:setOn(iconScripts[i].enabled)
    
    if iconScripts[i].enabled then
      loadIconScript(iconScripts[i])
    else
      print(string.format("[Loader] %s disabled", script.name))
    end
  end)
end

UI.Separator()

-- Help section
UI.Label("Quick Guide:")
addButton("Show Help", function()
  print([[

╔════════════════════════════════════════════════════════════════╗
║                   ICON SCRIPTS QUICK GUIDE                     ║
╚════════════════════════════════════════════════════════════════╝

📦 LOADED SCRIPTS:

1. Icon Healer (icon_healer.lua)
   • Auto Health/Mana Potions
   • Auto Healing Spells (Exura Gran/San)
   • Emergency Ring System
   • Customizable HP/MP thresholds

2. Icon Combat (icon_combat.lua)
   • Smart Targeting (closest/lowest HP)
   • Keep Target
   • Auto Area Spells
   • Auto Single Target Spells
   • Rune Attacks (SD)
   • Exori Combo System

3. Icon Utility (icon_utility.lua)
   • Auto Haste
   • Auto Food
   • Auto Cure Poison/Paralyze
   • Auto Light
   • Training Mode (Utamo Vita)
   • Equipment Manager (Soft Boots, Rings, Amulets)

4. Icon Loot (icon_loot.lua)
   • Loot All Items
   • Loot Gold Only
   • Loot Rare Items
   • Auto Open Corpses
   • Container Stacking
   • Depot Depositing

5. Icon Cavebot (icon_cavebot.lua)
   • Waypoint Recording
   • Auto Walk Path
   • Auto Fight
   • Priority Targeting
   • Auto Refiller

═══════════════════════════════════════════════════════════════

🎮 HOW TO USE:

1. Click on any icon to toggle that feature ON/OFF
2. Icons are MOVABLE - drag them anywhere on screen
3. Icons show visual feedback when active
4. Configure settings in each script's tab
5. All settings are auto-saved to storage

═══════════════════════════════════════════════════════════════

⚙️ CONFIGURATION:

• Each script has its own settings tab
• Edit thresholds, spell names, item IDs
• Changes take effect immediately
• Settings persist across sessions

═══════════════════════════════════════════════════════════════

💡 TIPS:

• Organize icons on screen for quick access
• Use tooltips (hover over icons) for info
• Combine multiple scripts for full automation
• Start with basic features, then add more
• Monitor console for status messages

═══════════════════════════════════════════════════════════════

📝 EXAMPLES:

Hunt Setup:
  1. Enable Icon Combat for targeting
  2. Enable Icon Healer for survival
  3. Enable Icon Loot for collecting items
  4. Adjust thresholds in settings

Training Setup:
  1. Enable Icon Utility - Training Mode
  2. Enable Icon Healer with high thresholds
  3. Disable combat features

PvP Setup:
  1. Enable Icon Combat with manual targeting
  2. Enable Icon Healer with low thresholds
  3. Enable Icon Utility for buffs

═══════════════════════════════════════════════════════════════

All scripts created by AI Agents System
Version: 2024 Latest
For more info, check individual script tabs

╚════════════════════════════════════════════════════════════════╝
  ]])
end)

UI.Separator()

print([[

╔════════════════════════════════════════════════════════════════╗
║                    LOADING COMPLETE                            ║
╚════════════════════════════════════════════════════════════════╝

✓ All icon-based scripts are ready to use!
✓ Check each tab for settings and controls
✓ Click icons to toggle features ON/OFF
✓ Icons are movable - organize them as you like!

Click "Show Help" button for full guide

Happy botting! 🤖

]])

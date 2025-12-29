-- 10 Most Useful Icon Scripts - Master Loader
-- Organized by Profession and Usefulness
-- Latest version with focused functionality

print([[
╔════════════════════════════════════════════════════════════════╗
║         10 Most Useful Icon Scripts - Master Loader           ║
╚════════════════════════════════════════════════════════════════╝
]])

local scripts = {
  -- PROFESSION-SPECIFIC (By Vocation)
  {name = "1. Knight Healer", file = "icon_1_knight_healer.lua", category = "Knight", enabled = true},
  {name = "2. Paladin Healer", file = "icon_2_paladin_healer.lua", category = "Paladin", enabled = true},
  {name = "3. Mage Healer", file = "icon_3_mage_healer.lua", category = "Mage", enabled = true},
  {name = "8. Sorcerer Spells", file = "icon_8_sorcerer_spells.lua", category = "Sorcerer", enabled = true},
  {name = "9. Druid Spells", file = "icon_9_druid_spells.lua", category = "Druid", enabled = true},
  
  -- UNIVERSAL UTILITY (Most Useful for All)
  {name = "4. Smart Combat", file = "icon_4_smart_combat.lua", category = "Combat", enabled = true},
  {name = "5. Auto Loot Gold", file = "icon_5_auto_loot.lua", category = "Loot", enabled = true},
  {name = "6. Emergency System", file = "icon_6_emergency.lua", category = "Safety", enabled = true},
  {name = "7. Auto Buffs", file = "icon_7_auto_buffs.lua", category = "Utility", enabled = true},
  {name = "10. Equipment Manager", file = "icon_10_equipment.lua", category = "Utility", enabled = true}
}

local function loadScript(scriptInfo)
  if not scriptInfo.enabled then
    print(string.format("⊘ %s - Disabled", scriptInfo.name))
    return false
  end
  
  local success, error = pcall(function()
    dofile(scriptInfo.file)
  end)
  
  if success then
    print(string.format("✓ %s [%s]", scriptInfo.name, scriptInfo.category))
    return true
  else
    print(string.format("✗ %s - Failed", scriptInfo.name))
    return false
  end
end

print("\n--- Loading by Category ---")

-- Load by category
local categories = {"Knight", "Paladin", "Mage", "Sorcerer", "Druid", "Combat", "Loot", "Safety", "Utility"}
local loaded = 0

for _, category in ipairs(categories) do
  local categoryLoaded = false
  for _, script in ipairs(scripts) do
    if script.category == category then
      if not categoryLoaded then
        print("\n" .. category .. ":")
        categoryLoaded = true
      end
      if loadScript(script) then
        loaded = loaded + 1
      end
    end
  end
end

print(string.rep("─", 60))
print(string.format("✓ Loaded %d/10 scripts successfully", loaded))
print(string.rep("─", 60))

-- Quick Guide
print([[

╔════════════════════════════════════════════════════════════════╗
║                      QUICK GUIDE                               ║
╚════════════════════════════════════════════════════════════════╝

PROFESSION-SPECIFIC HEALERS:
  #1 Knight  - HP potions + Exura Ico
  #2 Paladin - HP/MP potions + Exura San
  #3 Mage    - MP potions + Exura Gran/Vita
  #8 Sorcerer - Attack spells (area/single)
  #9 Druid    - Support spells (sio/cure)

UNIVERSAL UTILITIES (Most Useful):
  #4 Smart Combat - Auto targeting (lowest HP)
  #5 Auto Loot    - Gold and corpse looting
  #6 Emergency    - Ring/SSA protection
  #7 Auto Buffs   - Haste, food, light
  #10 Equipment   - Auto soft boots, amulets, rings

USAGE:
  • Click icons to toggle ON/OFF
  • Drag icons anywhere on screen
  • Configure in each script's tab
  • All settings auto-saved

LOAD INDIVIDUAL:
  dofile("icon_1_knight_healer.lua")  -- For your vocation

╚════════════════════════════════════════════════════════════════╝
]])

setDefaultTab("Loader")
UI.Label("Icon Scripts Loader")
UI.Separator()
UI.Label(string.format("Loaded: %d/10 scripts", loaded))
UI.Separator()

addButton("Reload All", function()
  print("[Loader] Reloading...")
  for _, script in ipairs(scripts) do
    loadScript(script)
  end
end)

addButton("Show Categories", function()
  print("\n=== Scripts by Category ===")
  for _, category in ipairs(categories) do
    print("\n" .. category .. ":")
    for _, script in ipairs(scripts) do
      if script.category == category then
        print("  • " .. script.name)
      end
    end
  end
end)

print("\n[Master Loader] Ready! Click icons to use features.")

-- COMPRESSED SCRIPT #3: All-In-One Complete Package
-- Everything in a single file - all 10 icon scripts combined
-- Load this one file for complete functionality

print([[
╔════════════════════════════════════════════════════════════════╗
║              ALL-IN-ONE ICON SCRIPTS PACKAGE                   ║
║                   Complete 10 Scripts                          ║
╚════════════════════════════════════════════════════════════════╝
]])

-- Load profession-specific scripts
print("\n--- Loading Profession Scripts (5/10) ---")
dofile("compressed_1_professions.lua")

-- Load universal utilities
print("\n--- Loading Universal Utilities (5/10) ---")
dofile("compressed_2_utilities.lua")

-- Summary
print([[

╔════════════════════════════════════════════════════════════════╗
║                    LOADING COMPLETE                            ║
╚════════════════════════════════════════════════════════════════╝

✓ Loaded 10 icon scripts successfully!

PROFESSION-SPECIFIC:
  • Knight Healer (2 icons)
  • Paladin Healer (3 icons)
  • Mage Healer (3 icons)
  • Sorcerer Spells (2 icons)
  • Druid Spells (2 icons)

UNIVERSAL UTILITIES:
  • Smart Combat (2 icons)
  • Auto Loot Gold (2 icons)
  • Emergency System (2 icons)
  • Auto Buffs (3 icons)
  • Equipment Manager (3 icons)

TOTAL: 24 movable icons ready to use!

Click icons to toggle features ON/OFF
Drag icons anywhere on screen
All settings auto-saved to storage

Happy botting! 🤖

]])

-- Create simple control panel
setDefaultTab("Control")
UI.Label("All-In-One Loaded")
UI.Separator()
UI.Label("✓ 10 scripts active")
UI.Label("✓ 24 icons ready")
UI.Separator()

addButton("Reload All", function()
  print("[All-In-One] Reloading all scripts...")
  dofile("compressed_3_all_in_one.lua")
end)

addButton("Show Status", function()
  print("\n=== Icon Scripts Status ===")
  print("Profession Scripts: Knight, Paladin, Mage, Sorcerer, Druid")
  print("Universal Scripts: Combat, Loot, Emergency, Buffs, Equipment")
  print("Total Icons: 24 movable")
  print("All features active and ready!")
end)

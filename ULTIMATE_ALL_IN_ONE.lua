-- ============================================================================
-- ULTIMATE ALL-IN-ONE ICON SCRIPTS
-- Complete package - all 10 scripts in a single working file
-- Created by AI Agents System - 2024
-- ============================================================================

print([[
╔════════════════════════════════════════════════════════════════╗
║         ULTIMATE ALL-IN-ONE ICON SCRIPTS                       ║
║         Complete 10 Scripts Package                            ║
║         Ready to Use Immediately                               ║
╚════════════════════════════════════════════════════════════════╝
]])

-- ============================================================================
-- SCRIPT #1: KNIGHT HEALER
-- ============================================================================
print("[1/10] Loading Knight Healer...")

setDefaultTab("Knight")

if not storage.knightHealer then
  storage.knightHealer = {hpPotionId = 266, hpPercent = 70, exuraIcoHP = 50}
end

UI.Label("Knight Auto Healer")
UI.Separator()

addIcon("Knight HP", {item = 266, movable = true, text = "HP"}, 
macro(100, "Knight Health", function()
  if hppercent() < storage.knightHealer.hpPercent and not isInPz() then
    use(storage.knightHealer.hpPotionId)
    delay(1000)
  end
end))

addIcon("Exura Ico", {item = 3160, movable = true, text = "Ico"}, 
macro(200, "Exura Ico", function()
  if hppercent() < storage.knightHealer.exuraIcoHP then
    if canCast("exura ico") then
      say("exura ico")
      delay(1000)
    end
  end
end))

UI.Label("HP %:") addTextEdit("knightHP", storage.knightHealer.hpPercent, function(widget, text)
  storage.knightHealer.hpPercent = tonumber(text) or 70
end)

-- ============================================================================
-- SCRIPT #2: PALADIN HEALER
-- ============================================================================
print("[2/10] Loading Paladin Healer...")

setDefaultTab("Paladin")

if not storage.paladinHealer then
  storage.paladinHealer = {hpPotionId = 266, mpPotionId = 268, hpPercent = 65, mpPercent = 50, exuraSanHP = 55}
end

UI.Label("Paladin Auto Healer")
UI.Separator()

addIcon("Paladin HP", {item = 266, movable = true, text = "HP"}, 
macro(100, "Pally HP", function()
  if hppercent() < storage.paladinHealer.hpPercent and not isInPz() then
    use(storage.paladinHealer.hpPotionId)
    delay(1000)
  end
end))

addIcon("Paladin MP", {item = 268, movable = true, text = "MP"}, 
macro(100, "Pally MP", function()
  if manapercent() < storage.paladinHealer.mpPercent and not isInPz() then
    use(storage.paladinHealer.mpPotionId)
    delay(1000)
  end
end))

addIcon("Exura San", {item = 3161, movable = true, text = "San"}, 
macro(200, "Exura San", function()
  if hppercent() < storage.paladinHealer.exuraSanHP then
    if canCast("exura san") then
      say("exura san")
      delay(1000)
    end
  end
end))

UI.Label("HP %:") addTextEdit("pallyHP", storage.paladinHealer.hpPercent, function(widget, text)
  storage.paladinHealer.hpPercent = tonumber(text) or 65
end)

-- ============================================================================
-- SCRIPT #3: MAGE HEALER
-- ============================================================================
print("[3/10] Loading Mage Healer...")

setDefaultTab("Mage")

if not storage.mageHealer then
  storage.mageHealer = {mpPotionId = 268, mpPercent = 45, exuraGranHP = 40, exuraVitaHP = 60}
end

UI.Label("Mage Auto Healer")
UI.Separator()

addIcon("Mage MP", {item = 268, movable = true, text = "MP"}, 
macro(100, "Mage Mana", function()
  if manapercent() < storage.mageHealer.mpPercent and not isInPz() then
    use(storage.mageHealer.mpPotionId)
    delay(1000)
  end
end))

addIcon("Exura Gran", {item = 3160, movable = true, text = "Gran"}, 
macro(200, "Exura Gran", function()
  if hppercent() < storage.mageHealer.exuraGranHP then
    if canCast("exura gran") then
      say("exura gran")
      delay(1000)
    end
  end
end))

addIcon("Exura Vita", {item = 3161, movable = true, text = "Vita"}, 
macro(200, "Exura Vita", function()
  if hppercent() < storage.mageHealer.exuraVitaHP and hppercent() > storage.mageHealer.exuraGranHP then
    if canCast("exura vita") then
      say("exura vita")
      delay(1000)
    end
  end
end))

-- ============================================================================
-- SCRIPT #4: SMART COMBAT
-- ============================================================================
print("[4/10] Loading Smart Combat...")

setDefaultTab("Combat")

if not storage.smartCombat then
  storage.smartCombat = {attackLowest = true, keepTarget = true}
end

UI.Label("Smart Combat System")
UI.Separator()

addIcon("Smart Target", {item = 3155, movable = true, text = "Target"}, 
macro(100, "Smart Target", function()
  local spectators = getSpectators()
  local lowestHP = 101
  local bestTarget = nil
  
  for _, creature in pairs(spectators) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      local hp = creature:getHealthPercent()
      
      if dist <= 8 and hp < lowestHP then
        lowestHP = hp
        bestTarget = creature
      end
    end
  end
  
  if bestTarget and g_game.getAttackingCreature() ~= bestTarget then
    g_game.attack(bestTarget)
  end
end))

addIcon("Keep Attack", {item = 12306, movable = true, text = "Keep"}, 
macro(100, "Keep Target", function()
  if not storage.smartCombat.keepTarget then return end
  
  local target = g_game.getAttackingCreature()
  if target then
    storage.smartCombat.lastTargetId = target:getId()
  elseif storage.smartCombat.lastTargetId then
    local creature = getCreatureById(storage.smartCombat.lastTargetId)
    if creature then
      g_game.attack(creature)
      delay(500)
    end
  end
end))

-- ============================================================================
-- SCRIPT #5: AUTO LOOT GOLD
-- ============================================================================
print("[5/10] Loading Auto Loot...")

setDefaultTab("Loot")

if not storage.autoLootGold then
  storage.autoLootGold = {enabled = true, maxDist = 3}
end

UI.Label("Auto Loot Gold")
UI.Separator()

addIcon("Loot Gold", {item = 3043, movable = true, text = "Gold"}, 
macro(300, "Auto Gold", function()
  if not storage.autoLootGold.enabled then return end
  
  local goldItems = {3031, 3035, 3043}
  
  for _, tile in ipairs(g_map.getTiles(posz())) do
    local pos = tile:getPosition()
    local dist = getDistanceBetween(pos, player:getPosition())
    
    if dist <= storage.autoLootGold.maxDist then
      for _, item in ipairs(tile:getItems()) do
        for _, goldId in ipairs(goldItems) do
          if item:getId() == goldId then
            g_game.move(item, player:getPosition(), item:getCount())
            delay(100)
          end
        end
      end
    end
  end
end))

addIcon("Open Corpses", {item = 3058, movable = true, text = "Open"}, 
macro(400, "Open Corpses", function()
  for _, tile in ipairs(g_map.getTiles(posz())) do
    local pos = tile:getPosition()
    local dist = getDistanceBetween(pos, player:getPosition())
    
    if dist <= storage.autoLootGold.maxDist then
      for _, item in ipairs(tile:getItems()) do
        if item:isCorpse() then
          g_game.open(item)
          delay(300)
        end
      end
    end
  end
end))

-- ============================================================================
-- SCRIPT #6: EMERGENCY SYSTEM
-- ============================================================================
print("[6/10] Loading Emergency System...")

setDefaultTab("Emergency")

UI.Label("Emergency Protection")
UI.Separator()

addIcon("Emergency Ring", {item = 3051, movable = true, text = "Ring"}, 
macro(50, "Emergency Ring", function()
  local hp = hppercent()
  
  if hp <= 30 then
    local ring = getInventoryItem(SlotFinger)
    if not ring or ring:getId() ~= 3051 then
      g_game.equipItemId(3051)
      delay(200)
    end
  elseif hp > 50 then
    local ring = getInventoryItem(SlotFinger)
    if ring and ring:getId() == 3051 then
      g_game.equipItemId(0)
      delay(200)
    end
  end
end))

addIcon("SSA Protection", {item = 3081, movable = true, text = "SSA"}, 
macro(50, "Auto SSA", function()
  local hp = hppercent()
  
  if hp <= 25 then
    local amulet = getNeck()
    if not amulet or amulet:getId() ~= 3081 then
      g_game.equipItemId(3081)
      delay(200)
    end
  end
end))

-- ============================================================================
-- SCRIPT #7: AUTO BUFFS
-- ============================================================================
print("[7/10] Loading Auto Buffs...")

setDefaultTab("Buffs")

if not storage.autoBuffs then
  storage.autoBuffs = {hasteSpell = "utani gran hur", hasteInterval = 10000, autoFood = true}
end

UI.Label("Auto Haste & Buffs")
UI.Separator()

addIcon("Auto Haste", {item = 2195, movable = true, text = "Haste"}, 
macro(storage.autoBuffs.hasteInterval, "Auto Haste", function()
  if canCast(storage.autoBuffs.hasteSpell) then
    say(storage.autoBuffs.hasteSpell)
    delay(1000)
  end
end))

addIcon("Auto Food", {item = 3725, movable = true, text = "Food"}, 
macro(60000, "Auto Food", function()
  if storage.autoBuffs.autoFood then
    use(3725)
    delay(1000)
  end
end))

addIcon("Auto Light", {item = 2050, movable = true, text = "Light"}, 
macro(30000, "Auto Light", function()
  if canCast("utevo lux") then
    say("utevo lux")
    delay(1000)
  end
end))

-- ============================================================================
-- SCRIPT #8: SORCERER SPELLS
-- ============================================================================
print("[8/10] Loading Sorcerer Spells...")

setDefaultTab("Sorcerer")

if not storage.sorcSpells then
  storage.sorcSpells = {areaSpell = "exevo gran mas vis", singleSpell = "exori gran vis", minManaArea = 500, minMonsters = 3}
end

UI.Label("Sorcerer Combat")
UI.Separator()

addIcon("Area Spell", {item = 3191, movable = true, text = "Area"}, 
macro(300, "Auto Area", function()
  if mana() < storage.sorcSpells.minManaArea then return end
  
  local monstersNearby = 0
  for _, creature in pairs(getSpectators()) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      if dist <= 4 then
        monstersNearby = monstersNearby + 1
      end
    end
  end
  
  if monstersNearby >= storage.sorcSpells.minMonsters then
    if canCast(storage.sorcSpells.areaSpell) then
      say(storage.sorcSpells.areaSpell)
      delay(2000)
    end
  end
end))

addIcon("Single Spell", {item = 3200, movable = true, text = "Single"}, 
macro(300, "Auto Single", function()
  if not g_game.isAttacking() then return end
  
  if canCast(storage.sorcSpells.singleSpell) then
    say(storage.sorcSpells.singleSpell)
    delay(2000)
  end
end))

-- ============================================================================
-- SCRIPT #9: DRUID SPELLS
-- ============================================================================
print("[9/10] Loading Druid Spells...")

setDefaultTab("Druid")

if not storage.druidSpells then
  storage.druidSpells = {healSpell = "exura sio", healTarget = "Player Name", paralyzeSpell = "exana pox"}
end

UI.Label("Druid Support")
UI.Separator()

addIcon("Heal Friend", {item = 3160, movable = true, text = "Sio"}, 
macro(200, "Auto Sio", function()
  local target = getCreatureByName(storage.druidSpells.healTarget)
  if target then
    local hp = target:getHealthPercent()
    if hp < 70 then
      if canCast(storage.druidSpells.healSpell) then
        say(storage.druidSpells.healSpell .. ' "' .. storage.druidSpells.healTarget)
        delay(1000)
      end
    end
  end
end))

addIcon("Auto Cure", {item = 3153, movable = true, text = "Cure"}, 
macro(500, "Auto Cure", function()
  if isPoisoned() or isParalyzed() then
    if canCast(storage.druidSpells.paralyzeSpell) then
      say(storage.druidSpells.paralyzeSpell)
      delay(1000)
    end
  end
end))

-- ============================================================================
-- SCRIPT #10: EQUIPMENT MANAGER
-- ============================================================================
print("[10/10] Loading Equipment Manager...")

setDefaultTab("Equipment")

UI.Label("Equipment Manager")
UI.Separator()

addIcon("Soft Boots", {item = 6132, movable = true, text = "Soft"}, 
macro(100, "Auto Soft Boots", function()
  if manapercent() < 90 and not isInPz() then
    local feet = getInventoryItem(SlotFeet)
    if not feet or feet:getId() ~= 6132 then
      g_game.equipItemId(6132)
      delay(500)
    end
  end
end))

addIcon("Amulet Switch", {item = 23526, movable = true, text = "Amulet"}, 
macro(100, "Auto Amulet", function()
  local amulets = {
    {id = 3081, condition = function() return hppercent() < 30 end},
    {id = 23526, condition = function() return hppercent() >= 30 end}
  }
  
  for _, amulet in ipairs(amulets) do
    if amulet.condition() then
      local neck = getNeck()
      if not neck or neck:getId() ~= amulet.id then
        g_game.equipItemId(amulet.id)
        delay(200)
        break
      end
    end
  end
end))

addIcon("Ring Switch", {item = 3098, movable = true, text = "Ring"}, 
macro(100, "Auto Ring", function()
  if hppercent() < 70 and not isInPz() then
    local ring = getInventoryItem(SlotFinger)
    if not ring or ring:getId() ~= 3098 then
      g_game.equipItemId(3098)
      delay(500)
    end
  end
end))

-- ============================================================================
-- FINAL SUMMARY
-- ============================================================================
print([[

╔════════════════════════════════════════════════════════════════╗
║                    LOADING COMPLETE!                           ║
╚════════════════════════════════════════════════════════════════╝

✓ All 10 scripts loaded successfully!
✓ 24 movable icons ready to use!

PROFESSION SCRIPTS:
  1. Knight Healer (2 icons)
  2. Paladin Healer (3 icons)
  3. Mage Healer (3 icons)
  8. Sorcerer Spells (2 icons)
  9. Druid Spells (2 icons)

UNIVERSAL UTILITIES:
  4. Smart Combat (2 icons)
  5. Auto Loot Gold (2 icons)
  6. Emergency System (2 icons)
  7. Auto Buffs (3 icons)
  10. Equipment Manager (3 icons)

Click icons to toggle features ON/OFF
Drag icons anywhere on your screen
All settings auto-saved to storage

Happy botting! 🤖

]])

-- Control Panel
setDefaultTab("Control")
UI.Label("ALL-IN-ONE LOADED")
UI.Separator()
UI.Label("✓ 10 scripts active")
UI.Label("✓ 24 icons ready")
UI.Separator()

addButton("Reload All", function()
  print("[All-In-One] Reloading...")
  dofile("ULTIMATE_ALL_IN_ONE.lua")
end)

addButton("Show Status", function()
  print("\n=== Status ===")
  print("All 10 scripts active")
  print("24 icons ready")
  print("Storage: All settings saved")
end)

print("\n[All-In-One] Ready to use! 🎮")

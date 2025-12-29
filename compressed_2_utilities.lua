-- COMPRESSED SCRIPT #2: Universal Utilities
-- All universal scripts in one file
-- Smart Combat, Auto Loot, Emergency, Buffs, Equipment

print("=== Loading Universal Utilities ===")

-- ============================================================================
-- #4 SMART COMBAT
-- ============================================================================
setDefaultTab("Combat")

if not storage.smartCombat then
  storage.smartCombat = {
    attackLowest = true,
    keepTarget = true
  }
end

UI.Label("Smart Combat System")
UI.Separator()

addIcon("Smart Target", {
  item = 3155,
  movable = true,
  text = "Target"
}, macro(100, "Smart Target", function()
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

addIcon("Keep Attack", {
  item = 12306,
  movable = true,
  text = "Keep"
}, macro(100, "Keep Target", function()
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

addSwitch("attackLowest", "Attack Lowest HP", function(widget)
  storage.smartCombat.attackLowest = not storage.smartCombat.attackLowest
  widget:setOn(storage.smartCombat.attackLowest)
end)

print("[1/5] Smart Combat loaded")

-- ============================================================================
-- #5 AUTO LOOT GOLD
-- ============================================================================
setDefaultTab("Loot")

if not storage.autoLootGold then
  storage.autoLootGold = {
    enabled = true,
    maxDist = 3
  }
end

UI.Label("Auto Loot Gold")
UI.Separator()

addIcon("Loot Gold", {
  item = 3043,
  movable = true,
  text = "Gold"
}, macro(300, "Auto Gold", function()
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

addIcon("Open Corpses", {
  item = 3058,
  movable = true,
  text = "Open"
}, macro(400, "Open Corpses", function()
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

UI.Label("Max Distance:")
addTextEdit("goldDist", storage.autoLootGold.maxDist, function(widget, text)
  storage.autoLootGold.maxDist = tonumber(text) or 3
end)

print("[2/5] Auto Loot loaded")

-- ============================================================================
-- #6 EMERGENCY SYSTEM
-- ============================================================================
setDefaultTab("Emergency")

UI.Label("Emergency Protection")
UI.Separator()

addIcon("Emergency Ring", {
  item = 3051,
  movable = true,
  text = "Ring"
}, macro(50, "Emergency Ring", function()
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

addIcon("SSA Protection", {
  item = 3081,
  movable = true,
  text = "SSA"
}, macro(50, "Auto SSA", function()
  local hp = hppercent()
  
  if hp <= 25 then
    local amulet = getNeck()
    if not amulet or amulet:getId() ~= 3081 then
      g_game.equipItemId(3081)
      delay(200)
    end
  end
end))

UI.Label("Emergency at HP% < 30")
UI.Label("SSA at HP% < 25")

print("[3/5] Emergency System loaded")

-- ============================================================================
-- #7 AUTO BUFFS
-- ============================================================================
setDefaultTab("Buffs")

if not storage.autoBuffs then
  storage.autoBuffs = {
    hasteSpell = "utani gran hur",
    hasteInterval = 10000,
    autoFood = true
  }
end

UI.Label("Auto Haste & Buffs")
UI.Separator()

addIcon("Auto Haste", {
  item = 2195,
  movable = true,
  text = "Haste"
}, macro(storage.autoBuffs.hasteInterval, "Auto Haste", function()
  if canCast(storage.autoBuffs.hasteSpell) then
    say(storage.autoBuffs.hasteSpell)
    delay(1000)
  end
end))

addIcon("Auto Food", {
  item = 3725,
  movable = true,
  text = "Food"
}, macro(60000, "Auto Food", function()
  if storage.autoBuffs.autoFood then
    use(3725)
    delay(1000)
  end
end))

addIcon("Auto Light", {
  item = 2050,
  movable = true,
  text = "Light"
}, macro(30000, "Auto Light", function()
  if canCast("utevo lux") then
    say("utevo lux")
    delay(1000)
  end
end))

UI.Label("Haste Spell:")
addTextEdit("hasteSpell", storage.autoBuffs.hasteSpell, function(widget, text)
  storage.autoBuffs.hasteSpell = text
end)

print("[4/5] Auto Buffs loaded")

-- ============================================================================
-- #10 EQUIPMENT MANAGER
-- ============================================================================
setDefaultTab("Equipment")

UI.Label("Equipment Manager")
UI.Separator()

addIcon("Soft Boots", {
  item = 6132,
  movable = true,
  text = "Soft"
}, macro(100, "Auto Soft Boots", function()
  if manapercent() < 90 and not isInPz() then
    local feet = getInventoryItem(SlotFeet)
    if not feet or feet:getId() ~= 6132 then
      g_game.equipItemId(6132)
      delay(500)
    end
  end
end))

addIcon("Amulet Switch", {
  item = 23526,
  movable = true,
  text = "Amulet"
}, macro(100, "Auto Amulet", function()
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

addIcon("Ring Switch", {
  item = 3098,
  movable = true,
  text = "Ring"
}, macro(100, "Auto Ring", function()
  if hppercent() < 70 and not isInPz() then
    local ring = getInventoryItem(SlotFinger)
    if not ring or ring:getId() ~= 3098 then
      g_game.equipItemId(3098)
      delay(500)
    end
  end
end))

UI.Label("Auto-equips best items")
UI.Label("based on HP/MP status")

print("[5/5] Equipment Manager loaded")

print("✓ All universal utilities loaded successfully!")

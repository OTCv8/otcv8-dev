-- ===============================================
-- ROYAL PALADIN 900 SKILL - ADVANCED SCRIPTS
-- ===============================================
-- Zaawansowane skrypty dla doswiadczonego RP
-- Funkcje: Energy Ring priority, zaawansowany combat, 
-- inteligentne healowanie, auto equipment, special attacks
-- ===============================================

setDefaultTab("RP 900")

if not storage.rp900 then
  storage.rp900 = {
    energyRingHP = 40,
    energyRingMonsters = 3,
    emergencyHP = 30,
    ssaHP = 20,
    hpPotionPercent = 70,
    mpPotionPercent = 55,
    exuraSanHP = 60,
    exuraGranHP = 50,
    masResHP = 85,
    divineMissileMP = 30,
    divineCalderaMP = 35,
    etherealSpearMP = 25,
    autoHaste = true,
    autoUtamo = true,
    utamoHP = 60,
    priorityTargeting = true,
    autoSoftBoots = true,
    softBootsMP = 85
  }
end

UI.Label("=== RP 900 SKILL ADVANCED ===")
UI.Separator()

-- ===============================================
-- ENERGY RING PRIORITY SYSTEM
-- ===============================================
-- Automatycznie zalozy Energy Ring gdy:
-- 1. HP spadnie ponizej progu ORAZ sa potwory w poblizu
-- 2. Jest wiecej potworow niz limit
-- 3. Zdejmie gdy HP wysoki i bezpiecznie
-- ===============================================

addIcon("Energy Ring Priority", {
  item = 3088,
  movable = true,
  text = "E-Ring"
}, macro(50, "Energy Ring Priority", function()
  local hp = hppercent()
  local ring = getInventoryItem(SlotFinger)
  local ringId = ring and ring:getId() or 0
  
  local nearbyMonsters = 0
  for _, creature in pairs(getSpectators()) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      if dist <= 6 then
        nearbyMonsters = nearbyMonsters + 1
      end
    end
  end
  
  if hp <= storage.rp900.energyRingHP or nearbyMonsters >= storage.rp900.energyRingMonsters then
    if ringId ~= 3088 then
      g_game.equipItemId(3088)
      delay(200)
    end
  elseif hp > 70 and nearbyMonsters < 2 then
    if ringId == 3088 then
      g_game.equipItemId(0)
      delay(200)
    end
  end
end))

-- ===============================================
-- ULTIMATE EMERGENCY SYSTEM
-- ===============================================
-- 3-poziomowy system bezpieczenstwa:
-- Level 1: Emergency Ring (HP < 30%)
-- Level 2: SSA (HP < 20%)
-- Level 3: Might Ring backup (HP < 15%)
-- ===============================================

addIcon("Ultimate Emergency", {
  item = 3051,
  movable = true,
  text = "Emerg"
}, macro(40, "Ultimate Emergency", function()
  local hp = hppercent()
  local ring = getInventoryItem(SlotFinger)
  local ringId = ring and ring:getId() or 0
  local amulet = getNeck()
  local amuletId = amulet and amulet:getId() or 0
  
  if hp <= 15 then
    if ringId ~= 3097 and ringId ~= 3088 then
      g_game.equipItemId(3097)
      delay(150)
    end
  elseif hp <= storage.rp900.ssaHP then
    if amuletId ~= 3081 then
      g_game.equipItemId(3081)
      delay(150)
    end
  elseif hp <= storage.rp900.emergencyHP then
    if ringId ~= 3051 and ringId ~= 3088 then
      g_game.equipItemId(3051)
      delay(150)
    end
  end
end))

-- ===============================================
-- ADVANCED HEALING SYSTEM
-- ===============================================
-- Multi-level healing z priorytetem:
-- 1. Exura Gran (krytyczne HP)
-- 2. Exura San (srednie HP)  
-- 3. HP/MP potions (standardowe)
-- 4. Mas Res (wielu potworow)
-- ===============================================

addIcon("Advanced HP", {
  item = 266,
  movable = true,
  text = "HP+"
}, macro(80, "Advanced HP Heal", function()
  local hp = hppercent()
  
  if hp < storage.rp900.exuraGranHP and not isInPz() then
    if canCast("exura gran") then
      say("exura gran")
      delay(1000)
      return
    end
  end
  
  if hp < storage.rp900.exuraSanHP and not isInPz() then
    if canCast("exura san") then
      say("exura san")
      delay(1000)
      return
    end
  end
  
  if hp < storage.rp900.hpPotionPercent and not isInPz() then
    use(266)
    delay(800)
  end
end))

addIcon("Advanced MP", {
  item = 268,
  movable = true,
  text = "MP+"
}, macro(80, "Advanced MP Restore", function()
  if manapercent() < storage.rp900.mpPotionPercent and not isInPz() then
    use(268)
    delay(800)
  end
end))

addIcon("Mas Res", {
  item = 3161,
  movable = true,
  text = "Res"
}, macro(100, "Mas Res Auto", function()
  local hp = hppercent()
  
  if hp < storage.rp900.masResHP then
    local nearbyMonsters = 0
    for _, creature in pairs(getSpectators()) do
      if creature:isMonster() then
        local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
        if dist <= 5 then
          nearbyMonsters = nearbyMonsters + 1
        end
      end
    end
    
    if nearbyMonsters >= 3 and canCast("exura mas res") then
      say("exura mas res")
      delay(1200)
    end
  end
end))

-- ===============================================
-- PRIORITY TARGETING SYSTEM
-- ===============================================
-- Inteligentny wybor celow:
-- 1. Priorytet: najnizsze HP w zasiegu
-- 2. Dystans < 8 pol
-- 3. Auto-switch przy smierci targetu
-- ===============================================

addIcon("Priority Target", {
  item = 3155,
  movable = true,
  text = "Prior"
}, macro(90, "Priority Targeting", function()
  if not storage.rp900.priorityTargeting then return end
  
  local spectators = getSpectators()
  local lowestHP = 101
  local bestTarget = nil
  local closestDist = 999
  
  for _, creature in pairs(spectators) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      local hp = creature:getHealthPercent()
      
      if dist <= 8 then
        if hp < lowestHP or (hp == lowestHP and dist < closestDist) then
          lowestHP = hp
          closestDist = dist
          bestTarget = creature
        end
      end
    end
  end
  
  if bestTarget then
    local currentTarget = g_game.getAttackingCreature()
    if not currentTarget or currentTarget:getId() ~= bestTarget:getId() then
      g_game.attack(bestTarget)
    end
  end
end))

-- ===============================================
-- DIVINE MISSILE AUTO-CAST
-- ===============================================
-- Automatyczny Divine Missile na silne potwory
-- Priorytet: Target z najwieksza iloscia HP
-- ===============================================

addIcon("Divine Missile", {
  item = 3198,
  movable = true,
  text = "Div"
}, macro(300, "Divine Missile Auto", function()
  if manapercent() < storage.rp900.divineMissileMP then return end
  
  local target = g_game.getAttackingCreature()
  if target and target:isMonster() then
    local dist = getDistanceBetween(player:getPosition(), target:getPosition())
    if dist >= 3 and dist <= 7 then
      if canCast("exori gran con") then
        say("exori gran con")
        delay(2000)
      end
    end
  end
end))

-- ===============================================
-- DIVINE CALDERA (AOE)
-- ===============================================
-- Auto AOE gdy 3+ potworow w zasiegu
-- ===============================================

addIcon("Divine Caldera", {
  item = 3155,
  movable = true,
  text = "AOE"
}, macro(400, "Divine Caldera Auto", function()
  if manapercent() < storage.rp900.divineCalderaMP then return end
  
  local nearbyMonsters = 0
  for _, creature in pairs(getSpectators()) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      if dist <= 3 then
        nearbyMonsters = nearbyMonsters + 1
      end
    end
  end
  
  if nearbyMonsters >= 3 then
    if canCast("exevo mas san") then
      say("exevo mas san")
      delay(2000)
    end
  end
end))

-- ===============================================
-- ETHEREAL SPEAR
-- ===============================================
-- Auto ethereal spear na distant targets
-- ===============================================

addIcon("Ethereal Spear", {
  item = 7367,
  movable = true,
  text = "Spear"
}, macro(250, "Ethereal Spear Auto", function()
  if manapercent() < storage.rp900.etherealSpearMP then return end
  
  local target = g_game.getAttackingCreature()
  if target and target:isMonster() then
    local dist = getDistanceBetween(player:getPosition(), target:getPosition())
    if dist >= 4 and dist <= 7 then
      if canCast("exori con") then
        say("exori con")
        delay(1500)
      end
    end
  end
end))

-- ===============================================
-- BUFF MANAGER
-- ===============================================
-- Auto haste + utamo vita
-- ===============================================

addIcon("Auto Haste", {
  item = 3052,
  movable = true,
  text = "Haste"
}, macro(1000, "Auto Haste RP", function()
  if not storage.rp900.autoHaste then return end
  if isInPz() then return end
  
  if not hasHaste() then
    if canCast("utani gran hur") then
      say("utani gran hur")
      delay(1500)
    end
  end
end))

addIcon("Auto Utamo", {
  item = 3083,
  movable = true,
  text = "Utamo"
}, macro(500, "Auto Utamo Vita", function()
  if not storage.rp900.autoUtamo then return end
  if isInPz() then return end
  
  local hp = hppercent()
  if hp < storage.rp900.utamoHP then
    local nearbyMonsters = 0
    for _, creature in pairs(getSpectators()) do
      if creature:isMonster() then
        local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
        if dist <= 4 then
          nearbyMonsters = nearbyMonsters + 1
        end
      end
    end
    
    if nearbyMonsters >= 2 then
      if canCast("utamo vita") then
        say("utamo vita")
        delay(1500)
      end
    end
  end
end))

-- ===============================================
-- SOFT BOOTS MANAGER
-- ===============================================
-- Auto equip soft boots gdy MP niskie
-- ===============================================

addIcon("Auto Soft Boots", {
  item = 6132,
  movable = true,
  text = "Boots"
}, macro(200, "Auto Soft Boots", function()
  if not storage.rp900.autoSoftBoots then return end
  
  local mp = manapercent()
  local boots = getInventoryItem(SlotFeet)
  local bootsId = boots and boots:getId() or 0
  
  if mp < storage.rp900.softBootsMP then
    if bootsId ~= 6132 then
      g_game.equipItemId(6132)
      delay(300)
    end
  elseif mp > 95 then
    if bootsId == 6132 then
      g_game.equipItemId(3982)
      delay(300)
    end
  end
end))

-- ===============================================
-- CONFIGURATION PANEL
-- ===============================================

UI.Separator()
UI.Label("--- Energy Ring Config ---")

UI.Label("E-Ring HP %:")
addTextEdit("eringHP", storage.rp900.energyRingHP, function(widget, text)
  storage.rp900.energyRingHP = tonumber(text) or 40
end)

UI.Label("E-Ring Monsters:")
addTextEdit("eringMon", storage.rp900.energyRingMonsters, function(widget, text)
  storage.rp900.energyRingMonsters = tonumber(text) or 3
end)

UI.Separator()
UI.Label("--- Healing Config ---")

UI.Label("HP Potion %:")
addTextEdit("rpHP", storage.rp900.hpPotionPercent, function(widget, text)
  storage.rp900.hpPotionPercent = tonumber(text) or 70
end)

UI.Label("MP Potion %:")
addTextEdit("rpMP", storage.rp900.mpPotionPercent, function(widget, text)
  storage.rp900.mpPotionPercent = tonumber(text) or 55
end)

UI.Label("Exura Gran HP %:")
addTextEdit("granHP", storage.rp900.exuraGranHP, function(widget, text)
  storage.rp900.exuraGranHP = tonumber(text) or 50
end)

UI.Separator()
UI.Label("--- Spell Config ---")

UI.Label("Divine Missile MP %:")
addTextEdit("divMP", storage.rp900.divineMissileMP, function(widget, text)
  storage.rp900.divineMissileMP = tonumber(text) or 30
end)

UI.Label("Soft Boots MP %:")
addTextEdit("softMP", storage.rp900.softBootsMP, function(widget, text)
  storage.rp900.softBootsMP = tonumber(text) or 85
end)

UI.Separator()

addSwitch("autoHasteSwitch", "Auto Haste", function(widget)
  storage.rp900.autoHaste = not storage.rp900.autoHaste
  widget:setOn(storage.rp900.autoHaste)
end)

addSwitch("autoUtamoSwitch", "Auto Utamo", function(widget)
  storage.rp900.autoUtamo = not storage.rp900.autoUtamo
  widget:setOn(storage.rp900.autoUtamo)
end)

addSwitch("prioritySwitch", "Priority Targeting", function(widget)
  storage.rp900.priorityTargeting = not storage.rp900.priorityTargeting
  widget:setOn(storage.rp900.priorityTargeting)
end)

addSwitch("softBootsSwitch", "Auto Soft Boots", function(widget)
  storage.rp900.autoSoftBoots = not storage.rp900.autoSoftBoots
  widget:setOn(storage.rp900.autoSoftBoots)
end)

print("[RP 900 SKILL ADVANCED] Zaladowano! 12 ikon dostepnych.")

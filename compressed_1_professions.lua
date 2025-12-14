-- COMPRESSED SCRIPT #1: Profession Healers & Combat
-- All vocation-specific scripts in one file
-- Knight, Paladin, Mage, Sorcerer, Druid

print("=== Loading Profession Scripts ===")

-- ============================================================================
-- #1 KNIGHT HEALER
-- ============================================================================
setDefaultTab("Knight")

if not storage.knightHealer then
  storage.knightHealer = {
    hpPotionId = 266,
    hpPercent = 70,
    exuraIcoHP = 50
  }
end

UI.Label("Knight Auto Healer")
UI.Separator()

addIcon("Knight HP", {
  item = 266,
  movable = true,
  text = "HP"
}, macro(100, "Knight Health", function()
  if hppercent() < storage.knightHealer.hpPercent and not isInPz() then
    use(storage.knightHealer.hpPotionId)
    delay(1000)
  end
end))

addIcon("Exura Ico", {
  item = 3160,
  movable = true,
  text = "Ico"
}, macro(200, "Exura Ico", function()
  if hppercent() < storage.knightHealer.exuraIcoHP then
    if canCast("exura ico") then
      say("exura ico")
      delay(1000)
    end
  end
end))

UI.Label("HP Potion %:")
addTextEdit("knightHP", storage.knightHealer.hpPercent, function(widget, text)
  storage.knightHealer.hpPercent = tonumber(text) or 70
end)

UI.Label("Exura Ico %:")
addTextEdit("exuraIcoHP", storage.knightHealer.exuraIcoHP, function(widget, text)
  storage.knightHealer.exuraIcoHP = tonumber(text) or 50
end)

print("[1/5] Knight Healer loaded")

-- ============================================================================
-- #2 PALADIN HEALER
-- ============================================================================
setDefaultTab("Paladin")

if not storage.paladinHealer then
  storage.paladinHealer = {
    hpPotionId = 266,
    mpPotionId = 268,
    hpPercent = 65,
    mpPercent = 50,
    exuraSanHP = 55
  }
end

UI.Label("Paladin Auto Healer")
UI.Separator()

addIcon("Paladin HP", {
  item = 266,
  movable = true,
  text = "HP"
}, macro(100, "Pally HP", function()
  if hppercent() < storage.paladinHealer.hpPercent and not isInPz() then
    use(storage.paladinHealer.hpPotionId)
    delay(1000)
  end
end))

addIcon("Paladin MP", {
  item = 268,
  movable = true,
  text = "MP"
}, macro(100, "Pally MP", function()
  if manapercent() < storage.paladinHealer.mpPercent and not isInPz() then
    use(storage.paladinHealer.mpPotionId)
    delay(1000)
  end
end))

addIcon("Exura San", {
  item = 3161,
  movable = true,
  text = "San"
}, macro(200, "Exura San", function()
  if hppercent() < storage.paladinHealer.exuraSanHP then
    if canCast("exura san") then
      say("exura san")
      delay(1000)
    end
  end
end))

UI.Label("HP %:")
addTextEdit("pallyHP", storage.paladinHealer.hpPercent, function(widget, text)
  storage.paladinHealer.hpPercent = tonumber(text) or 65
end)

UI.Label("MP %:")
addTextEdit("pallyMP", storage.paladinHealer.mpPercent, function(widget, text)
  storage.paladinHealer.mpPercent = tonumber(text) or 50
end)

print("[2/5] Paladin Healer loaded")

-- ============================================================================
-- #3 MAGE HEALER
-- ============================================================================
setDefaultTab("Mage")

if not storage.mageHealer then
  storage.mageHealer = {
    mpPotionId = 268,
    mpPercent = 45,
    exuraGranHP = 40,
    exuraVitaHP = 60
  }
end

UI.Label("Mage Auto Healer")
UI.Separator()

addIcon("Mage MP", {
  item = 268,
  movable = true,
  text = "MP"
}, macro(100, "Mage Mana", function()
  if manapercent() < storage.mageHealer.mpPercent and not isInPz() then
    use(storage.mageHealer.mpPotionId)
    delay(1000)
  end
end))

addIcon("Exura Gran", {
  item = 3160,
  movable = true,
  text = "Gran"
}, macro(200, "Exura Gran", function()
  if hppercent() < storage.mageHealer.exuraGranHP then
    if canCast("exura gran") then
      say("exura gran")
      delay(1000)
    end
  end
end))

addIcon("Exura Vita", {
  item = 3161,
  movable = true,
  text = "Vita"
}, macro(200, "Exura Vita", function()
  if hppercent() < storage.mageHealer.exuraVitaHP and hppercent() > storage.mageHealer.exuraGranHP then
    if canCast("exura vita") then
      say("exura vita")
      delay(1000)
    end
  end
end))

UI.Label("MP %:")
addTextEdit("mageMP", storage.mageHealer.mpPercent, function(widget, text)
  storage.mageHealer.mpPercent = tonumber(text) or 45
end)

print("[3/5] Mage Healer loaded")

-- ============================================================================
-- #8 SORCERER SPELLS
-- ============================================================================
setDefaultTab("Sorcerer")

if not storage.sorcSpells then
  storage.sorcSpells = {
    areaSpell = "exevo gran mas vis",
    singleSpell = "exori gran vis",
    minManaArea = 500,
    minMonsters = 3
  }
end

UI.Label("Sorcerer Combat")
UI.Separator()

addIcon("Area Spell", {
  item = 3191,
  movable = true,
  text = "Area"
}, macro(300, "Auto Area", function()
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

addIcon("Single Spell", {
  item = 3200,
  movable = true,
  text = "Single"
}, macro(300, "Auto Single", function()
  if not g_game.isAttacking() then return end
  
  if canCast(storage.sorcSpells.singleSpell) then
    say(storage.sorcSpells.singleSpell)
    delay(2000)
  end
end))

UI.Label("Area Spell:")
addTextEdit("sorcArea", storage.sorcSpells.areaSpell, function(widget, text)
  storage.sorcSpells.areaSpell = text
end)

print("[4/5] Sorcerer Spells loaded")

-- ============================================================================
-- #9 DRUID SPELLS
-- ============================================================================
setDefaultTab("Druid")

if not storage.druidSpells then
  storage.druidSpells = {
    healSpell = "exura sio",
    healTarget = "Player Name",
    paralyzeSpell = "exana pox"
  }
end

UI.Label("Druid Support")
UI.Separator()

addIcon("Heal Friend", {
  item = 3160,
  movable = true,
  text = "Sio"
}, macro(200, "Auto Sio", function()
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

addIcon("Auto Cure", {
  item = 3153,
  movable = true,
  text = "Cure"
}, macro(500, "Auto Cure", function()
  if isPoisoned() or isParalyzed() then
    if canCast(storage.druidSpells.paralyzeSpell) then
      say(storage.druidSpells.paralyzeSpell)
      delay(1000)
    end
  end
end))

UI.Label("Heal Target Name:")
addTextEdit("healTarget", storage.druidSpells.healTarget, function(widget, text)
  storage.druidSpells.healTarget = text
end)

print("[5/5] Druid Spells loaded")

print("✓ All profession scripts loaded successfully!")

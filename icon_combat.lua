-- Icon-Based Combat System
-- Modern PvP and PvM combat with icon controls
-- Created by AI Agents System

setDefaultTab("Combat")

-- Configuration storage
if not storage.iconCombat then
  storage.iconCombat = {
    attackClosest = true,
    attackLowestHP = true,
    keepTarget = true,
    useAreaSpells = true,
    useSingleSpells = true,
    areaSpell = "exevo gran mas vis",
    singleSpell = "exori gran",
    minManaForArea = 500,
    minManaForSingle = 200,
    minMonstersForArea = 3
  }
end

UI.Label("Icon-Based Combat System")
UI.Separator()

-- Smart Targeting Icon
local smartTargetIcon = addIcon("Smart Target", {
  item = 3155, -- SD rune
  movable = true,
  text = "Target"
}, macro(100, "Smart Targeting", function()
  if not storage.iconCombat.attackClosest then return end
  
  local spectators = getSpectators()
  local closestDist = 999
  local lowestHP = 101
  local bestTarget = nil
  
  for _, creature in pairs(spectators) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      local hp = creature:getHealthPercent()
      
      if storage.iconCombat.attackLowestHP then
        if dist <= 8 and hp < lowestHP then
          lowestHP = hp
          bestTarget = creature
        end
      else
        if dist < closestDist then
          closestDist = dist
          bestTarget = creature
        end
      end
    end
  end
  
  if bestTarget and g_game.getAttackingCreature() ~= bestTarget then
    g_game.attack(bestTarget)
  end
end))

-- Keep Target Icon
local keepTargetIcon = addIcon("Keep Target", {
  item = 12306, -- Target icon
  movable = true,
  text = "Keep"
}, macro(100, "Keep Target", function()
  if not storage.iconCombat.keepTarget then return end
  
  local target = g_game.getAttackingCreature()
  if target then
    storage.iconCombat.lastTargetId = target:getId()
  elseif storage.iconCombat.lastTargetId then
    local creature = getCreatureById(storage.iconCombat.lastTargetId)
    if creature then
      g_game.attack(creature)
      delay(500)
    end
  end
end))

-- Area Spell Icon
local areaSpellIcon = addIcon("Area Spell", {
  item = 3191, -- GFB rune
  movable = true,
  text = "Area"
}, macro(300, "Auto Area Spell", function()
  if not storage.iconCombat.useAreaSpells then return end
  if mana() < storage.iconCombat.minManaForArea then return end
  
  local spectators = getSpectators()
  local monstersNearby = 0
  
  for _, creature in pairs(spectators) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      if dist <= 4 then
        monstersNearby = monstersNearby + 1
      end
    end
  end
  
  if monstersNearby >= storage.iconCombat.minMonstersForArea then
    if canCast(storage.iconCombat.areaSpell) then
      say(storage.iconCombat.areaSpell)
      delay(2000)
    end
  end
end))

-- Single Target Spell Icon
local singleSpellIcon = addIcon("Single Spell", {
  item = 3200, -- Strike rune
  movable = true,
  text = "Single"
}, macro(300, "Auto Single Spell", function()
  if not storage.iconCombat.useSingleSpells then return end
  if not g_game.isAttacking() then return end
  if mana() < storage.iconCombat.minManaForSingle then return end
  
  if canCast(storage.iconCombat.singleSpell) then
    say(storage.iconCombat.singleSpell)
    delay(2000)
  end
end))

-- Rune Attack Icon (SD)
local runeAttackIcon = addIcon("SD Attack", {
  item = 3155, -- SD
  movable = true,
  text = "SD"
}, macro(200, "Auto SD", function()
  if g_game.isAttacking() then
    local target = g_game.getAttackingCreature()
    if target then
      usewith(3155, target)
      delay(1000)
    end
  end
end))

-- Exori Combo Icon
local exoriComboIcon = addIcon("Exori Combo", {
  item = 3147, -- Power bolt
  movable = true,
  text = "Combo"
}, macro(400, "Exori Combo", function()
  if not g_game.isAttacking() then return end
  
  local spells = {"exori gran", "exori min", "exori"}
  
  for _, spell in ipairs(spells) do
    if canCast(spell) then
      say(spell)
      delay(1500)
      break
    end
  end
end))

UI.Separator()
UI.Label("Combat Settings:")

-- Attack Mode
addSwitch("attackClosest", "Attack Closest", function(widget)
  storage.iconCombat.attackClosest = not storage.iconCombat.attackClosest
  widget:setOn(storage.iconCombat.attackClosest)
end)

addSwitch("attackLowest", "Attack Lowest HP", function(widget)
  storage.iconCombat.attackLowestHP = not storage.iconCombat.attackLowestHP
  widget:setOn(storage.iconCombat.attackLowestHP)
end)

UI.Separator()

-- Area Spell Settings
UI.Label("Area Spell Name:")
addTextEdit("areaSpell", storage.iconCombat.areaSpell, function(widget, text)
  storage.iconCombat.areaSpell = text
end)

UI.Label("Min Monsters for Area:")
addTextEdit("minMonstersArea", storage.iconCombat.minMonstersForArea, function(widget, text)
  storage.iconCombat.minMonstersForArea = tonumber(text) or 3
end)

UI.Separator()

-- Single Spell Settings
UI.Label("Single Spell Name:")
addTextEdit("singleSpell", storage.iconCombat.singleSpell, function(widget, text)
  storage.iconCombat.singleSpell = text
end)

UI.Separator()
print("[Icon Combat] Loaded successfully! Use icons to control combat features.")

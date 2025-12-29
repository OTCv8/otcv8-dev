-- Icon Script #8: Sorcerer Spells
-- Offensive spells for Master Sorcerer
-- Profession-specific combat

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

print("[Sorcerer Spells] Loaded!")

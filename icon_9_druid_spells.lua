-- Icon Script #9: Druid Spells
-- Support and healing spells for Elder Druid
-- Profession-specific support

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

print("[Druid Spells] Loaded!")

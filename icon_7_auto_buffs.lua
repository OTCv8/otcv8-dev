-- Icon Script #7: Auto Haste & Buffs
-- Essential movement and support spells
-- Universal utility for all vocations

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

print("[Auto Buffs] Loaded!")

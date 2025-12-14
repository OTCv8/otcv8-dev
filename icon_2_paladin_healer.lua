-- Icon Script #2: Paladin Healer
-- For Royal Paladin / Paladin vocation
-- Balanced HP and Mana management

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

print("[Paladin Healer] Loaded!")

-- Icon Script #3: Mage Healer
-- For Elder Druid / Master Sorcerer
-- Mana-focused with emergency healing

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

print("[Mage Healer] Loaded!")

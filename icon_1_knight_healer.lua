-- Icon Script #1: Knight Healer
-- For Elite Knight / Knight vocation
-- Auto healing optimized for melee fighters

setDefaultTab("Knight")

if not storage.knightHealer then
  storage.knightHealer = {
    hpPotionId = 266,  -- Ultimate Health Potion
    hpPercent = 70,    -- Higher threshold for knights
    exuraIcoHP = 50
  }
end

UI.Label("Knight Auto Healer")
UI.Separator()

-- Ultimate Health Potion Icon
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

-- Exura Ico Icon
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

print("[Knight Healer] Loaded!")

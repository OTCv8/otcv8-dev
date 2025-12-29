-- Icon Script #10: Equipment Manager
-- Auto-equip items based on situation
-- Universal utility for optimization

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

print("[Equipment Manager] Loaded!")

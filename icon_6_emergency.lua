-- Icon Script #6: Emergency System
-- Critical HP protection with rings
-- Essential for survival

setDefaultTab("Emergency")

UI.Label("Emergency Protection")
UI.Separator()

addIcon("Emergency Ring", {
  item = 3051,
  movable = true,
  text = "Ring"
}, macro(50, "Emergency Ring", function()
  local hp = hppercent()
  
  if hp <= 30 then
    local ring = getInventoryItem(SlotFinger)
    if not ring or ring:getId() ~= 3051 then
      g_game.equipItemId(3051)
      delay(200)
    end
  elseif hp > 50 then
    local ring = getInventoryItem(SlotFinger)
    if ring and ring:getId() == 3051 then
      g_game.equipItemId(0)
      delay(200)
    end
  end
end))

addIcon("SSA Protection", {
  item = 3081,
  movable = true,
  text = "SSA"
}, macro(50, "Auto SSA", function()
  local hp = hppercent()
  
  if hp <= 25 then
    local amulet = getNeck()
    if not amulet or amulet:getId() ~= 3081 then
      g_game.equipItemId(3081)
      delay(200)
    end
  end
end))

UI.Label("Emergency at HP% < 30")
UI.Label("SSA at HP% < 25")

print("[Emergency System] Loaded!")

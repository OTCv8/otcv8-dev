-- Icon Script #5: Auto Loot Gold
-- Essential gold and platinum looting
-- Most useful utility for all players

setDefaultTab("Loot")

if not storage.autoLootGold then
  storage.autoLootGold = {
    enabled = true,
    maxDist = 3
  }
end

UI.Label("Auto Loot Gold")
UI.Separator()

addIcon("Loot Gold", {
  item = 3043,
  movable = true,
  text = "Gold"
}, macro(300, "Auto Gold", function()
  if not storage.autoLootGold.enabled then return end
  
  local goldItems = {3031, 3035, 3043}
  
  for _, tile in ipairs(g_map.getTiles(posz())) do
    local pos = tile:getPosition()
    local dist = getDistanceBetween(pos, player:getPosition())
    
    if dist <= storage.autoLootGold.maxDist then
      for _, item in ipairs(tile:getItems()) do
        for _, goldId in ipairs(goldItems) do
          if item:getId() == goldId then
            g_game.move(item, player:getPosition(), item:getCount())
            delay(100)
          end
        end
      end
    end
  end
end))

addIcon("Open Corpses", {
  item = 3058,
  movable = true,
  text = "Open"
}, macro(400, "Open Corpses", function()
  for _, tile in ipairs(g_map.getTiles(posz())) do
    local pos = tile:getPosition()
    local dist = getDistanceBetween(pos, player:getPosition())
    
    if dist <= storage.autoLootGold.maxDist then
      for _, item in ipairs(tile:getItems()) do
        if item:isCorpse() then
          g_game.open(item)
          delay(300)
        end
      end
    end
  end
end))

UI.Label("Max Distance:")
addTextEdit("goldDist", storage.autoLootGold.maxDist, function(widget, text)
  storage.autoLootGold.maxDist = tonumber(text) or 3
end)

print("[Auto Loot Gold] Loaded!")

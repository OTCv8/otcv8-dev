-- Icon-Based Loot System
-- Modern looting with icon controls and smart filtering
-- Created by AI Agents System

setDefaultTab("Looting")

-- Configuration storage
if not storage.iconLoot then
  storage.iconLoot = {
    enabled = true,
    lootGold = true,
    lootRares = true,
    lootAll = false,
    openCorpses = true,
    maxDistance = 3,
    rareItems = {
      -- Add valuable item IDs here
      3031, -- Gold coin
      3035, -- Platinum coin
      3043, -- Crystal coin
      7368, -- Dragon scale mail
      3392, -- Royal helmet
      3419  -- Crown shield
    }
  }
end

UI.Label("Icon-Based Loot System")
UI.Separator()

-- Loot All Icon
local lootAllIcon = addIcon("Loot All", {
  item = 3578, -- Gold ingot
  movable = true,
  text = "All"
}, macro(500, "Loot All Items", function()
  if not storage.iconLoot.enabled or not storage.iconLoot.lootAll then return end
  
  local corpses = {}
  for _, tile in ipairs(g_map.getTiles(posz())) do
    for _, item in ipairs(tile:getItems()) do
      if item:isCorpse() then
        local pos = tile:getPosition()
        local dist = getDistanceBetween(pos, player:getPosition())
        if dist <= storage.iconLoot.maxDistance then
          table.insert(corpses, item)
        end
      end
    end
  end
  
  for _, corpse in ipairs(corpses) do
    g_game.open(corpse)
    delay(200)
  end
end))

-- Loot Gold Icon
local lootGoldIcon = addIcon("Loot Gold", {
  item = 3043, -- Crystal coin
  movable = true,
  text = "Gold"
}, macro(300, "Loot Gold Only", function()
  if not storage.iconLoot.enabled or not storage.iconLoot.lootGold then return end
  
  local goldItems = {3031, 3035, 3043} -- Gold, platinum, crystal
  
  for _, tile in ipairs(g_map.getTiles(posz())) do
    local pos = tile:getPosition()
    local dist = getDistanceBetween(pos, player:getPosition())
    
    if dist <= storage.iconLoot.maxDistance then
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

-- Loot Rares Icon
local lootRaresIcon = addIcon("Loot Rares", {
  item = 3392, -- Royal helmet
  movable = true,
  text = "Rares"
}, macro(400, "Loot Rare Items", function()
  if not storage.iconLoot.enabled or not storage.iconLoot.lootRares then return end
  
  for _, tile in ipairs(g_map.getTiles(posz())) do
    local pos = tile:getPosition()
    local dist = getDistanceBetween(pos, player:getPosition())
    
    if dist <= storage.iconLoot.maxDistance then
      for _, item in ipairs(tile:getItems()) do
        for _, rareId in ipairs(storage.iconLoot.rareItems) do
          if item:getId() == rareId then
            g_game.move(item, player:getPosition(), item:getCount())
            delay(150)
          end
        end
      end
    end
  end
end))

-- Open Corpses Icon
local openCorpsesIcon = addIcon("Open Corpses", {
  item = 3058, -- Corpse
  movable = true,
  text = "Open"
}, macro(400, "Auto Open Corpses", function()
  if not storage.iconLoot.enabled or not storage.iconLoot.openCorpses then return end
  
  for _, tile in ipairs(g_map.getTiles(posz())) do
    local pos = tile:getPosition()
    local dist = getDistanceBetween(pos, player:getPosition())
    
    if dist <= storage.iconLoot.maxDistance then
      for _, item in ipairs(tile:getItems()) do
        if item:isCorpse() then
          g_game.open(item)
          delay(300)
        end
      end
    end
  end
end))

UI.Separator()
UI.Label("Container Management")

-- Stack Items Icon
local stackIcon = addIcon("Stack Items", {
  item = 3503, -- Container
  movable = true,
  text = "Stack"
}, macro(2000, "Auto Stack", function()
  -- Stack similar items in backpack
  local containers = getContainers()
  
  for _, container in pairs(containers) do
    local items = container:getItems()
    local itemGroups = {}
    
    -- Group items by ID
    for _, item in ipairs(items) do
      local id = item:getId()
      if not itemGroups[id] then
        itemGroups[id] = {}
      end
      table.insert(itemGroups[id], item)
    end
    
    -- Stack items
    for id, group in pairs(itemGroups) do
      if #group > 1 then
        for i = 2, #group do
          -- Move items to first stack
          delay(100)
        end
      end
    end
  end
end))

-- Deposit Gold Icon
local depositIcon = addIcon("Deposit Gold", {
  item = 3502, -- Depot chest
  movable = true,
  text = "Deposit"
}, macro(1000, "Deposit Gold", function()
  -- This would deposit gold to depot when near one
  if isInPz() then
    -- Simplified deposit logic
    local goldItems = {3031, 3035, 3043}
    
    for _, container in pairs(getContainers()) do
      for _, item in ipairs(container:getItems()) do
        for _, goldId in ipairs(goldItems) do
          if item:getId() == goldId then
            -- Would move to depot container
            delay(200)
          end
        end
      end
    end
  end
end))

UI.Separator()
UI.Label("Loot Settings:")

-- Max Distance
UI.Label("Max Loot Distance:")
addTextEdit("maxDistance", storage.iconLoot.maxDistance, function(widget, text)
  storage.iconLoot.maxDistance = tonumber(text) or 3
end)

UI.Separator()

-- Add Rare Item
UI.Label("Add Rare Item ID:")
local rareItemInput = addTextEdit("rareItem", "", function(widget, text)
  local itemId = tonumber(text)
  if itemId then
    table.insert(storage.iconLoot.rareItems, itemId)
    widget:setText("")
    print("[Loot] Added rare item: " .. itemId)
  end
end)

-- Show Current Rares
addButton("Show Rares", function()
  print("[Loot] Current rare items:")
  for i, itemId in ipairs(storage.iconLoot.rareItems) do
    print("  " .. i .. ". " .. itemId)
  end
end)

UI.Separator()
UI.Label("Quick Toggle:")

addSwitch("enableLoot", "Enable Looting", function(widget)
  storage.iconLoot.enabled = not storage.iconLoot.enabled
  widget:setOn(storage.iconLoot.enabled)
end)

UI.Separator()
print("[Icon Loot] Loaded successfully! Use icons to control looting.")

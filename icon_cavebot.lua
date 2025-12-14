-- Icon-Based Cavebot
-- Modern automated hunting with icon controls
-- Created by AI Agents System

setDefaultTab("Cavebot")

-- Configuration storage
if not storage.iconCavebot then
  storage.iconCavebot = {
    enabled = false,
    currentWaypoint = 1,
    waypoints = {},
    precision = 1,
    maxDistance = 20,
    returnToWaypoint = true,
    fightMode = true,
    lootMode = true
  }
end

UI.Label("Icon-Based Cavebot")
UI.Separator()

-- Start/Stop Cavebot Icon
local cavebotIcon = addIcon("Cavebot", {
  item = 3598, -- Compass
  movable = true,
  text = "Cave"
}, macro(100, "Cavebot Runner", function()
  if not storage.iconCavebot.enabled then return end
  
  if #storage.iconCavebot.waypoints == 0 then
    return
  end
  
  local currentWP = storage.iconCavebot.waypoints[storage.iconCavebot.currentWaypoint]
  if not currentWP then
    storage.iconCavebot.currentWaypoint = 1
    return
  end
  
  local playerPos = player:getPosition()
  local dist = getDistanceBetween(playerPos, currentWP)
  
  if dist <= storage.iconCavebot.precision then
    -- Move to next waypoint
    storage.iconCavebot.currentWaypoint = storage.iconCavebot.currentWaypoint + 1
    if storage.iconCavebot.currentWaypoint > #storage.iconCavebot.waypoints then
      storage.iconCavebot.currentWaypoint = 1
    end
  else
    -- Walk to current waypoint
    if not player:isWalking() then
      autoWalk(currentWP, storage.iconCavebot.maxDistance, {
        precision = storage.iconCavebot.precision
      })
    end
  end
end))

-- Add Waypoint Icon
local addWPIcon = addIcon("Add Waypoint", {
  item = 1946, -- Torch (off)
  movable = true,
  text = "Add WP"
}, macro(500, "Add Waypoint", function()
  local pos = player:getPosition()
  table.insert(storage.iconCavebot.waypoints, pos)
  print(string.format("[Cavebot] Added waypoint #%d: %d,%d,%d", 
    #storage.iconCavebot.waypoints, pos.x, pos.y, pos.z))
  delay(1000)
end))

-- Clear Waypoints Icon
local clearWPIcon = addIcon("Clear WP", {
  item = 2050, -- Torch (on)
  movable = true,
  text = "Clear"
}, macro(1000, "Clear Waypoints", function()
  storage.iconCavebot.waypoints = {}
  storage.iconCavebot.currentWaypoint = 1
  print("[Cavebot] All waypoints cleared!")
  delay(2000)
end))

-- Fight Mode Icon
local fightIcon = addIcon("Fight Mode", {
  item = 3289, -- Sword
  movable = true,
  text = "Fight"
}, macro(200, "Auto Fight", function()
  if not storage.iconCavebot.fightMode then return end
  
  local monsters = getSpectators()
  local nearestMonster = nil
  local minDist = 999
  
  for _, creature in pairs(monsters) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      if dist < minDist and dist <= 8 then
        minDist = dist
        nearestMonster = creature
      end
    end
  end
  
  if nearestMonster and not g_game.isAttacking() then
    g_game.attack(nearestMonster)
  end
end))

UI.Separator()
UI.Label("Waypoint System")

-- Show Waypoints
addButton("Show Waypoints", function()
  print(string.format("[Cavebot] Total waypoints: %d", #storage.iconCavebot.waypoints))
  print(string.format("[Cavebot] Current waypoint: %d", storage.iconCavebot.currentWaypoint))
  
  for i, wp in ipairs(storage.iconCavebot.waypoints) do
    print(string.format("  %d. Position: %d,%d,%d", i, wp.x, wp.y, wp.z))
  end
end)

-- Reset to First Waypoint
addButton("Reset to Start", function()
  storage.iconCavebot.currentWaypoint = 1
  print("[Cavebot] Reset to first waypoint")
end)

UI.Separator()
UI.Label("Settings:")

-- Enable/Disable
addSwitch("enableCavebot", "Enable Cavebot", function(widget)
  storage.iconCavebot.enabled = not storage.iconCavebot.enabled
  widget:setOn(storage.iconCavebot.enabled)
  if storage.iconCavebot.enabled then
    print("[Cavebot] Started!")
  else
    print("[Cavebot] Stopped!")
  end
end)

addSwitch("fightMode", "Auto Fight", function(widget)
  storage.iconCavebot.fightMode = not storage.iconCavebot.fightMode
  widget:setOn(storage.iconCavebot.fightMode)
end)

UI.Separator()

-- Precision
UI.Label("Waypoint Precision:")
addTextEdit("precision", storage.iconCavebot.precision, function(widget, text)
  storage.iconCavebot.precision = tonumber(text) or 1
end)

-- Max Distance
UI.Label("Max Walk Distance:")
addTextEdit("maxDist", storage.iconCavebot.maxDistance, function(widget, text)
  storage.iconCavebot.maxDistance = tonumber(text) or 20
end)

UI.Separator()
UI.Label("Advanced Features")

-- Refiller Icon (Return to depot when supplies low)
local refillerIcon = addIcon("Refiller", {
  item = 3502, -- Depot
  movable = true,
  text = "Refill"
}, macro(5000, "Auto Refiller", function()
  -- Check if supplies are low
  local potions = itemAmount(266) -- Health potions
  local mana = itemAmount(268) -- Mana potions
  
  if potions < 10 or mana < 10 then
    print("[Cavebot] Low on supplies! Need refill")
    -- Would trigger depot return logic here
  end
end))

-- Targeting Priority Icon
local targetIcon = addIcon("Target Priority", {
  item = 3148, -- Crossbow bolt
  movable = true,
  text = "Priority"
}, macro(100, "Priority Targeting", function()
  if not storage.iconCavebot.fightMode then return end
  
  -- Priority monster list
  local priorityMonsters = {
    "dragon lord",
    "dragon",
    "demon"
  }
  
  local spectators = getSpectators()
  
  for _, monsterName in ipairs(priorityMonsters) do
    for _, creature in pairs(spectators) do
      if creature:isMonster() and creature:getName():lower():find(monsterName) then
        local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
        if dist <= 8 then
          g_game.attack(creature)
          return
        end
      end
    end
  end
end))

UI.Separator()
print("[Icon Cavebot] Loaded successfully!")
print("Use 'Add WP' icon to record your path, then enable Cavebot to start!")

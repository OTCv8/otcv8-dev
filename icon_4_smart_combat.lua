-- Icon Script #4: Smart Combat
-- Universal targeting and attack system
-- Works for all vocations

setDefaultTab("Combat")

if not storage.smartCombat then
  storage.smartCombat = {
    attackLowest = true,
    keepTarget = true
  }
end

UI.Label("Smart Combat System")
UI.Separator()

addIcon("Smart Target", {
  item = 3155,
  movable = true,
  text = "Target"
}, macro(100, "Smart Target", function()
  local spectators = getSpectators()
  local lowestHP = 101
  local bestTarget = nil
  
  for _, creature in pairs(spectators) do
    if creature:isMonster() then
      local dist = getDistanceBetween(player:getPosition(), creature:getPosition())
      local hp = creature:getHealthPercent()
      
      if dist <= 8 and hp < lowestHP then
        lowestHP = hp
        bestTarget = creature
      end
    end
  end
  
  if bestTarget and g_game.getAttackingCreature() ~= bestTarget then
    g_game.attack(bestTarget)
  end
end))

addIcon("Keep Attack", {
  item = 12306,
  movable = true,
  text = "Keep"
}, macro(100, "Keep Target", function()
  if not storage.smartCombat.keepTarget then return end
  
  local target = g_game.getAttackingCreature()
  if target then
    storage.smartCombat.lastTargetId = target:getId()
  elseif storage.smartCombat.lastTargetId then
    local creature = getCreatureById(storage.smartCombat.lastTargetId)
    if creature then
      g_game.attack(creature)
      delay(500)
    end
  end
end))

addSwitch("attackLowest", "Attack Lowest HP", function(widget)
  storage.smartCombat.attackLowest = not storage.smartCombat.attackLowest
  widget:setOn(storage.smartCombat.attackLowest)
end)

print("[Smart Combat] Loaded!")

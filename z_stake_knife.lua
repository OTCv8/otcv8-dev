setDefaultTab("Cave")

UI.Separator()
local knifeBodies = {4272, 27495, 4173, 4011, 4025, 4047, 4052, 4057, 4062, 4112, 4212, 4321, 4324, 4327, 10352, 10356, 10360, 10364} 
local stakeBodies = {4097, 4137, 8738, 18958}
local fishingBodies = {9582}


macro(500,"Stake Bodies", function()
    if not CaveBot.isOn() then return end
    for i, tile in ipairs(g_map.getTiles(posz())) do
        for u,item in ipairs(tile:getItems()) do
            if table.find(knifeBodies, item:getId()) and findItem(27498) then
                CaveBot.delay(550)
                useWith(27498, item)
                return
            end
            if table.find(stakeBodies, item:getId()) and findItem(5942) then
                CaveBot.delay(5500)
                useWith(5942, item)
                return
            end
            if table.find(fishingBodies, item:getId()) and findItem(3483) then
                CaveBot.delay(550)
                useWith(3483, item)
                return
            end
        end
    end

end)



macro(500, "exana amp res", function()
    if isInPz() then return end
    local monsters = 0
    for i, mob in ipairs(getSpectators(posz())) do
        if mob:isMonster() and getDistanceBetween(player:getPosition(), mob:getPosition()) >= 2 and getDistanceBetween(player:getPosition(), mob:getPosition()) <= 6 then
            monsters = monsters + 1
        end
    end

    if (monsters >= 2 and manapercent() > 20 and not modules.game_cooldown.isCooldownIconActive(1601)) then
       say("exana amp res")
    end
end)
---------------------------
-- Definicja ID runy "Magic Wall" i ID ikony
local magicWallRuneId = 3180  -- ID runy "Magic Wall"
local magicWallIconImageID = 3180  -- Zakładamy, że ID obrazu ikony jest takie samo jak ID runy; dostosuj w razie potrzeby

-- Funkcja do używania "Magic Wall" pod postacią gracza
local function useMagicWall()
  local player = g_game.getLocalPlayer()
  if player then
    local playerPos = player:getPosition()
    g_game.useInventoryItemWith(magicWallRuneId, playerPos)
  end
end

-- Dodanie ikony "Magic Wall" z makrem do interfejsu użytkownika
addIcon("Magic Wall", 
  {item=magicWallIconImageID, movable=true, text = "MW"}, 
  macro(1000, function()  -- Makro wykonywane co sekundę
    useMagicWall()
  end)
)

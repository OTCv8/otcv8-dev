-- load all otui files, order doesn't matter
local configName = modules.game_bot.contentsPanel.config:getCurrentOption().text

local configFiles = g_resources.listDirectoryFiles("/bot/" .. configName .. "/vBot", true, false)
for i, file in ipairs(configFiles) do
  local ext = file:split(".")
  if ext[#ext]:lower() == "ui" or ext[#ext]:lower() == "otui" then
    g_ui.importStyle(file)
  end
end

local function loadScript(name)
  return dofile("/vBot/" .. name .. ".lua")
end

-- here you can set manually order of scripts
-- libraries should be loaded first
local luaFiles = {
  "main",
  "items",
  "vlib",
  "new_cavebot_lib",
  "configs", -- do not change this and above
  "extras",
  "cavebot",
  "playerlist",
  "BotServer",
  "alarms",
  "Conditions",
  "Equipper",
  "pushmax",
  "combo",
  "HealBot",
  "new_healer",
  "AttackBot", -- last of major modules
  "ingame_editor",
  "Dropper",
  "Containers",
  "quiver_manager",
  "quiver_label",
  "tools",
  "antiRs",
  "depot_withdraw",
  "cast_food",
  "eat_food",
  "equip",
  "exeta",
  "analyzer",
  "spy_level",
  "supplies",
  "depositer_config",
  "npc_talk",
  "xeno_menu",
  "hold_target",
  "cavebot_control_panel"
}

for i, file in ipairs(luaFiles) do
  loadScript(file)
end

setDefaultTab("Main")
UI.Separator()
UI.Label("Private Scripts:")
UI.Separator()
macro(100, "Smarter targeting", function() 
  local battlelist = getSpectators();
  local closest = 500
  local lowesthpc = 101
  for key, val in pairs(battlelist) do
    if val:isMonster() then
      if getDistanceBetween(player:getPosition(), val:getPosition()) <= closest then
        closest = getDistanceBetween(player:getPosition(), val:getPosition())
        if val:getHealthPercent() < lowesthpc then
          lowesthpc = val:getHealthPercent()
        end
      end
    end
  end
  for key, val in pairs(battlelist) do
    if val:isMonster() then
      if getDistanceBetween(player:getPosition(), val:getPosition()) <= closest then
        if g_game.getAttackingCreature() ~= val and val:getHealthPercent() <= lowesthpc then 
          g_game.attack(val)
          break
        end
      end
    end
  end
end)
------------------------------------------------------------------------------------------------------------------------
-- config

local Spells = {
  {name = "exevo mas san", cast = true, range = 4, manaCost = 300, level = 110},
  {name = "exori gran con", cast = true, range = 6, manaCost = 300, level = 110},
}

-- script

macro(500, "PVP", function()

  if not g_game.isAttacking() then
   return
  end

  local target = g_game.getAttackingCreature()
  local distance = getDistanceBetween(player:getPosition(), target:getPosition())

  for _, spell in ipairs(Spells) do
   if mana() >= spell.manaCost and lvl() >= spell.level and distance <= spell.range and spell.cast then
    if not spell.buffSpell then
     say(spell.name)
    end
   end
  end

end)
  -- Ikona dla makra "Biegam"
local iconImageID = 31617
addIcon("Biegam", 
{item=iconImageID, movable=true, text = "Biegam"}, 

macro(10000, "Biegam", function(icon)
  local haste = "utamo tempo san"
  say(haste)
end))
  
-------------------------------------------------------------------------------
addSeparator("separator")

macro(10, "Potrawka EK", function()
  if hppercent() < 20 and not isInPz() then
    use(9079)
  end
end)

--------------------------------------------------------------------------------------
addSeparator("separator")
setDefaultTab("Main")

local monumentumEffectActive = false

onTextMessage(function(mode, text)
    if text:lower():find("momentum effect activated") then
        monumentumEffectActive = true
        schedule(3000, function()
            monumentumEffectActive = false
        end)
    elseif text:lower():find("momentum effect ended") then
        monumentumEffectActive = false
    end
end)

local paladinSpells = {
    {name = "exura gran san", condition = function() return hppercent() < storage.spellSettings.paladin.exuraGranSanHp end},
    {name = "exura san", condition = function() return hppercent() < storage.spellSettings.paladin.exuraSanHp end},
    {name = "exori san", condition = function() return g_game.isAttacking() and storage.spellSettings.paladin.useExoriSan end},
    {name = "exevo mas san", condition = function() return g_game.isAttacking() and storage.spellSettings.paladin.useExevoMasSan end}
}

macro(200, "Smart Spell Handling - Paladin", function()
    for _, spell in ipairs(paladinSpells) do
        if spell.condition() then
            if monumentumEffectActive and canCast(spell.name, true) then
                say(spell.name)
            elseif not monumentumEffectActive and canCast(spell.name) then
                say(spell.name)
            end
        end
    end
end)


------------------------------------------------
setDefaultTab("Main")

local energyRingId = 3051 -- ID Energy Ring
local previousRing = nil

macro(100, "Auto Energy Ring", function()
    local currentHp = hppercent()
    local ring = getInventoryItem(SlotFinger)

    -- Jeśli HP jest poniżej 30%, zakładamy Energy Ring
    if currentHp <= 30 then
        if not ring or ring:getId() ~= energyRingId then
            previousRing = ring and ring:getId() or nil -- Zapamiętaj poprzedni pierścień
            g_game.equipItemId(energyRingId, SlotFinger)
        end
    end

    -- Jeśli HP przekroczy 40%, zdejmujemy Energy Ring i przywracamy poprzedni pierścień
    if currentHp > 40 and ring and ring:getId() == energyRingId then
        if previousRing and previousRing > 0 then
            g_game.equipItemId(previousRing, SlotFinger)
        else
            g_game.equipItemId(0, SlotFinger) -- Zdjęcie pierścienia, jeśli nie było wcześniejszego
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------


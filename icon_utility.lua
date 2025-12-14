-- Icon-Based Utility Scripts
-- Modern utility features with icon controls
-- Created by AI Agents System

setDefaultTab("Utilities")

-- Configuration storage
if not storage.iconUtility then
  storage.iconUtility = {
    autoHaste = true,
    hasteSpell = "utani gran hur",
    hasteInterval = 10000,
    autoFood = true,
    foodId = 3725, -- Brown mushroom
    eatAt = 5, -- minutes
    autoUth = true,
    uthSpell = "exana pox",
    autoLight = true,
    lightSpell = "utevo lux"
  }
end

UI.Label("Icon-Based Utilities")
UI.Separator()

-- Auto Haste Icon
local hasteIcon = addIcon("Auto Haste", {
  item = 2195, -- Boots of Haste
  movable = true,
  text = "Haste"
}, macro(storage.iconUtility.hasteInterval, "Auto Haste", function()
  if storage.iconUtility.autoHaste and canCast(storage.iconUtility.hasteSpell) then
    say(storage.iconUtility.hasteSpell)
    delay(1000)
  end
end))

-- Auto Food Icon
local foodIcon = addIcon("Auto Food", {
  item = 3725, -- Brown mushroom
  movable = true,
  text = "Food"
}, macro(1000, "Auto Eat", function()
  if storage.iconUtility.autoFood then
    local minutes = math.floor(timems() / 60000)
    if minutes % storage.iconUtility.eatAt == 0 then
      use(storage.iconUtility.foodId)
      delay(1000)
    end
  end
end))

-- Auto Cure Poison Icon
local cureIcon = addIcon("Auto Cure", {
  item = 3153, -- Antidote potion
  movable = true,
  text = "Cure"
}, macro(500, "Auto Cure Poison", function()
  if storage.iconUtility.autoUth and isPoisoned() then
    if canCast(storage.iconUtility.uthSpell) then
      say(storage.iconUtility.uthSpell)
      delay(1000)
    end
  end
end))

-- Auto Light Icon
local lightIcon = addIcon("Auto Light", {
  item = 2050, -- Torch
  movable = true,
  text = "Light"
}, macro(30000, "Auto Light", function()
  if storage.iconUtility.autoLight and canCast(storage.iconUtility.lightSpell) then
    say(storage.iconUtility.lightSpell)
    delay(1000)
  end
end))

UI.Separator()
UI.Label("Buff Management")

-- Training Icon (Magic Shield + Utamo)
local trainingIcon = addIcon("Training Mode", {
  item = 3081, -- Stone Skin Amulet
  movable = true,
  text = "Train"
}, macro(100, "Training Buffs", function()
  -- Cast utamo vita if needed
  if not hasManaShield() and canCast("utamo vita") then
    say("utamo vita")
    delay(1000)
  end
end))

-- Support Spells Icon
local supportIcon = addIcon("Support Spells", {
  item = 3029, -- Small sapphire
  movable = true,
  text = "Support"
}, macro(500, "Auto Support", function()
  local spells = {
    {name = "utamo tempo", condition = function() return lvl() >= 10 end},
    {name = "utevo gran lux", condition = function() return lvl() >= 13 end}
  }
  
  for _, spell in ipairs(spells) do
    if spell.condition() and canCast(spell.name) then
      say(spell.name)
      delay(2000)
      break
    end
  end
end))

UI.Separator()
UI.Label("Equipment Manager")

-- Auto Equip Soft Boots Icon
local softBootsIcon = addIcon("Soft Boots", {
  item = 6132, -- Soft Boots
  movable = true,
  text = "Soft"
}, macro(100, "Auto Soft Boots", function()
  if manapercent() < 90 then
    local feet = getInventoryItem(SlotFeet)
    if not feet or feet:getId() ~= 6132 then
      g_game.equipItemId(6132)
      delay(500)
    end
  end
end))

-- Auto Equip Ring Icon
local ringIcon = addIcon("Auto Ring", {
  item = 3008, -- Ring of Healing
  movable = true,
  text = "Ring"
}, macro(100, "Auto Ring", function()
  if hppercent() < 70 then
    local ring = getInventoryItem(SlotFinger)
    if not ring or ring:getId() ~= 3098 then
      g_game.equipItemId(3098) -- Ring of Healing
      delay(500)
    end
  end
end))

-- Auto Amulet Switcher Icon
local amuletIcon = addIcon("Amulet Switch", {
  item = 3081, -- Stone Skin Amulet
  movable = true,
  text = "Amulet"
}, macro(100, "Auto Amulet", function()
  local amulets = {
    {id = 3081, condition = function() return hppercent() < 30 end}, -- SSA
    {id = 23526, condition = function() return hppercent() >= 30 end} -- Plasma
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

UI.Separator()
UI.Label("Settings:")

-- Haste Settings
UI.Label("Haste Spell:")
addTextEdit("hasteSpell", storage.iconUtility.hasteSpell, function(widget, text)
  storage.iconUtility.hasteSpell = text
end)

UI.Label("Haste Interval (ms):")
addTextEdit("hasteInterval", storage.iconUtility.hasteInterval, function(widget, text)
  storage.iconUtility.hasteInterval = tonumber(text) or 10000
end)

UI.Separator()

-- Food Settings
UI.Label("Food ID:")
addTextEdit("foodId", storage.iconUtility.foodId, function(widget, text)
  storage.iconUtility.foodId = tonumber(text) or 3725
end)

UI.Label("Eat Every X Minutes:")
addTextEdit("eatAt", storage.iconUtility.eatAt, function(widget, text)
  storage.iconUtility.eatAt = tonumber(text) or 5
end)

UI.Separator()
print("[Icon Utility] Loaded successfully! Use icons to toggle utilities.")

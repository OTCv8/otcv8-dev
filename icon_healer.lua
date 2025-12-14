-- Icon-Based Auto Healer Script
-- Modern version with movable icons and smart healing
-- Created by AI Agents System

setDefaultTab("Healing")

-- Configuration storage
if not storage.iconHealer then
  storage.iconHealer = {
    healthPotionId = 266, -- Ultimate Health Potion
    manaPotionId = 268,   -- Ultimate Mana Potion
    healthPercent = 60,
    manaPercent = 40,
    useSpells = true,
    exuraGranHP = 40,
    exuraSanHP = 70
  }
end

UI.Label("Icon-Based Auto Healer")
UI.Separator()

-- Health Potion Icon
local healthPotionIcon = addIcon("Health Potion", {
  item = storage.iconHealer.healthPotionId,
  movable = true,
  text = "HP Pot"
}, macro(100, "Auto Health Potion", function()
  if hppercent() < storage.iconHealer.healthPercent and not isInPz() then
    use(storage.iconHealer.healthPotionId)
    delay(1000)
  end
end))

-- Mana Potion Icon
local manaPotionIcon = addIcon("Mana Potion", {
  item = storage.iconHealer.manaPotionId,
  movable = true,
  text = "MP Pot"
}, macro(100, "Auto Mana Potion", function()
  if manapercent() < storage.iconHealer.manaPercent and not isInPz() then
    use(storage.iconHealer.manaPotionId)
    delay(1000)
  end
end))

-- Exura Gran Icon (Strong Healing)
local exuraGranIcon = addIcon("Exura Gran", {
  item = 3160, -- Healing rune icon
  movable = true,
  text = "Exura Gran"
}, macro(200, "Auto Exura Gran", function()
  if storage.iconHealer.useSpells and hppercent() < storage.iconHealer.exuraGranHP then
    if canCast("exura gran") then
      say("exura gran")
      delay(1000)
    end
  end
end))

-- Exura San Icon (Medium Healing)
local exuraSanIcon = addIcon("Exura San", {
  item = 3161, -- Light healing rune icon
  movable = true,
  text = "Exura San"
}, macro(200, "Auto Exura San", function()
  if storage.iconHealer.useSpells and hppercent() < storage.iconHealer.exuraSanHP and hppercent() > storage.iconHealer.exuraGranHP then
    if canCast("exura san") then
      say("exura san")
      delay(1000)
    end
  end
end))

UI.Separator()
UI.Label("Settings:")

-- HP Threshold
UI.Label("Health Potion %:")
addTextEdit("hpPercent", storage.iconHealer.healthPercent, function(widget, text)
  storage.iconHealer.healthPercent = tonumber(text) or 60
end)

-- MP Threshold
UI.Label("Mana Potion %:")
addTextEdit("mpPercent", storage.iconHealer.manaPercent, function(widget, text)
  storage.iconHealer.manaPercent = tonumber(text) or 40
end)

-- Exura Gran HP
UI.Label("Exura Gran HP %:")
addTextEdit("exuraGranHP", storage.iconHealer.exuraGranHP, function(widget, text)
  storage.iconHealer.exuraGranHP = tonumber(text) or 40
end)

-- Exura San HP
UI.Label("Exura San HP %:")
addTextEdit("exuraSanHP", storage.iconHealer.exuraSanHP, function(widget, text)
  storage.iconHealer.exuraSanHP = tonumber(text) or 70
end)

UI.Separator()
UI.Label("Emergency Ring System")

-- Emergency Ring (Might Ring & SSA combo)
local emergencyRingIcon = addIcon("Emergency Ring", {
  item = 3051, -- Energy Ring
  movable = true,
  text = "Emergency"
}, macro(50, "Emergency Ring System", function()
  local hp = hppercent()
  
  -- Critical HP - equip energy ring
  if hp <= 30 then
    local ring = getInventoryItem(SlotFinger)
    if not ring or ring:getId() ~= 3051 then
      g_game.equipItemId(3051) -- Energy Ring
      delay(200)
    end
  -- Safe HP - remove energy ring
  elseif hp > 50 then
    local ring = getInventoryItem(SlotFinger)
    if ring and ring:getId() == 3051 then
      g_game.equipItemId(0) -- Remove ring
      delay(200)
    end
  end
end))

UI.Separator()
print("[Icon Healer] Loaded successfully! Use icons to toggle features.")

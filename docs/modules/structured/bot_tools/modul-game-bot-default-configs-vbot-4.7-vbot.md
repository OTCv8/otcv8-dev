# Moduł: | Moduł: `game_bot/default_configs/vBot_4.7/vBot`
```lua

setDefaultTab('main')

-- locales

local panelName = "AttackBot"

local currentSettings

local showSettings = false

local showItem = false

local category = 1

local patternCategory = 1

local pattern = 1

local mainWindow

-- label library

local categories = {

  "Targeted Spell (exori hur, exori flam, etc)",

  "Area Rune (avalanche, great fireball, etc)",

  "Targeted Rune (sudden death, icycle, etc)",

  "Empowerment (utito tempo, etc)",

  "Absolute Spell (exori, hells core, etc)",

}

local patterns = {

  -- targeted spells

{

    "1 Sqm Range (exori ico)",

    "2 Sqm Range",

    "3 Sqm Range (strike spells)",

    "4 Sqm Range (exori san)",

    "5 Sqm Range (exori hur)",

    "6 Sqm Range",

    "7 Sqm Range (exori con)",

    "8 Sqm Range",

    "9 Sqm Range",

    "10 Sqm Range"

},

  -- area runes

{

    "Cross (explosion)",

    "Bomb (fire bomb)",

    "Ball (gfb, avalanche)"

},

  -- empowerment/targeted rune

{

    "1 Sqm Range",

    "2 Sqm Range",

    "3 Sqm Range",

    "4 Sqm Range",

    "5 Sqm Range",

    "6 Sqm Range",

    "7 Sqm Range",

    "8 Sqm Range",

    "9 Sqm Range",

    "10 Sqm Range",

},

  -- absolute

{

    "Adjacent (exori, exori gran)",

    "3x3 Wave (vis hur, tera hur)",

    "Small Area (mas san, exori mas)",

    "Medium Area (mas flam, mas frigo)",

    "Large Area (mas vis, mas tera)",

    "Short Beam (vis lux)",

    "Large Beam (gran vis lux)",

    "Sweep (exori min)", -- 8

    "Small Wave (gran frigo hur)",

    "Big Wave (flam hur, frigo hur)",

    "Huge Wave (gran flam hur)",

}

}

  -- spellPatterns[category][pattern][1 - normal, 2 - safe]

local spellPatterns = {

  {}, -- blank, wont be used

  -- Area Runes,

{

    {     -- cross

[[

      010

      111

      010

     ]],

     -- cross SAFE

[[

       01110

       01110

       11111

       11111

       11111

       01110

       01110

]]

},

    { -- bomb

[[

        111

        111

        111

      ]],

      -- bomb SAFE

[[

        11111

        11111

        11111

        11111

        11111

]]

},

    { -- ball

[[

        0011100

        0111110

        1111111

        1111111

        1111111

        0111110

        0011100

      ]],

      -- ball SAFE

[[

        000111000

        001111100

        011111110

        111111111

        111111111

        111111111

        011111110

        001111100

        000111000

]]

},

},

  {}, -- blank, wont be used

  -- Absolute

{

    {-- adjacent

[[

        111

        111

        111

      ]],

      -- adjacent SAFE

[[

        11111

        11111

        11111

        11111

        11111

]]

},

    { -- 3x3 Wave

[[

        0000NNN0000

        0000NNN0000

        0000NNN0000

        00000N00000

        WWW00N00EEE

        WWWWW0EEEEE

        WWW00S00EEE

        00000S00000

        0000SSS0000

        0000SSS0000

        0000SSS0000

      ]],

      -- 3x3 Wave SAFE

[[

        0000NNNNN0000

        0000NNNNN0000

        0000NNNNN0000

        0000NNNNN0000

        WWWW0NNN0EEEE

        WWWWWNNNEEEEE

        WWWWWW0EEEEEE

        WWWWWSSSEEEEE

        WWWW0SSS0EEEE

        0000SSSSS0000

        0000SSSSS0000

        0000SSSSS0000

        0000SSSSS0000

]]

},

    { -- small area

[[

        0011100

        0111110

        1111111

        1111111

        1111111

        0111110

        0011100

      ]],

      -- small area SAFE

[[

        000111000

        001111100

        011111110

        111111111

        111111111

        111111111

        011111110

        001111100

        000111000

]]

},

    { -- medium area

[[

        00000100000

        00011111000

        00111111100

        01111111110

        01111111110

        11111111111

        01111111110

        01111111110

        00111111100

        00001110000

        00000100000

      ]],

      -- medium area SAFE

[[

        0000011100000

        0000111110000

        0001111111000

        0011111111100

        0111111111110

        0111111111110

        1111111111111

        0111111111110

        0111111111110

        0011111111100

        0001111111000

        0000111110000

        0000011100000

]]

},

    { -- large area

[[

        0000001000000

        0000011100000

        0000111110000

        0001111111000

        0011111111100

        0111111111110

        1111111111111

        0111111111110

        0011111111100

        0001111111000

        0000111110000

        0000011100000

        0000001000000

      ]],

      -- large area SAFE

[[

        000000010000000

        000000111000000

        000001111100000

        000011111110000

        000111111111000

        001111111111100

        011111111111110

        111111111111111

        011111111111110

        001111111111100

        000111111111000

        000011111110000

        000001111100000

        000000111000000

        000000010000000

]]

},

    { -- short beam

[[

        00000N00000

        00000N00000

        00000N00000

        00000N00000

        00000N00000

        WWWWW0EEEEE

        00000S00000

        00000S00000

        00000S00000

        00000S00000

        00000S00000

      ]],

      -- short beam SAFE

[[

        00000NNN00000

        00000NNN00000

        00000NNN00000

        00000NNN00000

        00000NNN00000

        WWWWWNNNEEEEE

        WWWWWW0EEEEEE

        00000SSS00000

        00000SSS00000

        00000SSS00000

        00000SSS00000

        00000SSS00000

        00000SSS00000

]]

},

    { -- large beam

[[

        0000000N0000000

        0000000N0000000

        0000000N0000000

        0000000N0000000

        0000000N0000000

        0000000N0000000

        0000000N0000000

        WWWWWWW0EEEEEEE

        0000000S0000000

        0000000S0000000

        0000000S0000000

        0000000S0000000

        0000000S0000000

        0000000S0000000

        0000000S0000000

      ]],

      -- large beam SAFE

[[

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        WWWWWWWNNNEEEEEEE

        WWWWWWWW0EEEEEEEE

        WWWWWWWSSSEEEEEEE

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

      ]],

},

    {}, -- sweep, wont be used

    { -- small wave

[[

        00NNN00

        00NNN00

        WW0N0EE

        WWW0EEE

        WW0S0EE

        00SSS00

        00SSS00

      ]],

      -- small wave SAFE

[[

        00NNNNN00

        00NNNNN00

        WWNNNNNEE

        WWWWNEEEE

        WWWW0EEEE

        WWWWSEEEE

        WWSSSSSEE

        00SSSSS00

        00SSSSS00

]]

},

    { -- large wave

[[

        000NNNNN000

        000NNNNN000

        0000NNN0000

        WW00NNN00EE

        WWWW0N0EEEE

        WWWWW0EEEEE

        WWWW0S0EEEE

        WW00SSS00EE

        0000SSS0000

        000SSSSS000

        000SSSSS000

      ]],

[[

        000NNNNNNN000

        000NNNNNNN000

        000NNNNNNN000

        WWWWNNNNNEEEE

        WWWWNNNNNEEEE

        WWWWWNNNEEEEE

        WWWWWW0EEEEEE

        WWWWWSSSEEEEE

        WWWWSSSSSEEEE

        WWWWSSSSSEEEE

        000SSSSSSS000

        000SSSSSSS000

        000SSSSSSS000

]]

},

    { -- huge wave

[[

        0000NNNNN0000

        0000NNNNN0000

        00000NNN00000

        00000NNN00000

        WW0000N0000EE

        WWWW00N00EEEE

        WWWWWW0EEEEEE

        WWWW00S00EEEE

        WW0000S0000EE

        00000SSS00000

        00000SSS00000

        0000SSSSS0000

        0000SSSSS0000

      ]],

[[

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        0000000NNN0000000

        WWWWWWWNNNEEEEEEE

        WWWWWWWW0EEEEEEEE

        WWWWWWWSSSEEEEEEE

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

        0000000SSS0000000

]]

}

}

}

-- direction patterns

local ek = (voc() == 1 or voc() == 11) and true

local posN = ek and [[

  111

  000

  000

]] or [[

  00011111000

  00011111000

  00011111000

  00011111000

  00000100000

  00000000000

  00000000000

  00000000000

  00000000000

  00000000000

  00000000000

]]

local posE = ek and [[

  001

  001

  001

]] or   [[

  00000000000

  00000000000

  00000000000

  00000001111

  00000001111

  00000011111

  00000001111

  00000001111

  00000000000

  00000000000

  00000000000

]]

local posS = ek and [[

  000

  000

  111

]] or   [[

  00000000000

  00000000000

  00000000000

  00000000000

  00000000000

  00000000000

  00000100000

  00011111000

  00011111000

  00011111000

  00011111000

]]

local posW = ek and [[

  100

  100

  100

]] or   [[

  00000000000

  00000000000

  00000000000

  11110000000

  11110000000

  11111000000

  11110000000

  11110000000

  00000000000

  00000000000

  00000000000

]]

-- AttackBotConfig

-- create blank profiles

if not AttackBotConfig[panelName] or not AttackBotConfig[panelName][1] or #AttackBotConfig[panelName] ~= 5 then

  AttackBotConfig[panelName] = {

    [1] = {

      enabled = false,

      attackTable = {},

      ignoreMana = true,

      Kills = false,

      Rotate = false,

      name = "Profile #1",

      Cooldown = true,

      Visible = true,

      pvpMode = false,

      KillsAmount = 1,

      PvpSafe = true,

      BlackListSafe = false,

      AntiRsRange = 5

},

    [2] = {

      enabled = false,

      attackTable = {},

      ignoreMana = true,

      Kills = false,

      Rotate = false,

      name = "Profile #2",

      Cooldown = true,

      Visible = true,

      pvpMode = false,

      KillsAmount = 1,

      PvpSafe = true,

      BlackListSafe = false,

      AntiRsRange = 5

},

    [3] = {

      enabled = false,

      attackTable = {},

      ignoreMana = true,

      Kills = false,

      Rotate = false,

      name = "Profile #3",

      Cooldown = true,

      Visible = true,

      pvpMode = false,

      KillsAmount = 1,

      PvpSafe = true,

      BlackListSafe = false,

      AntiRsRange = 5

},

    [4] = {

      enabled = false,

      attackTable = {},

      ignoreMana = true,

      Kills = false,

      Rotate = false,

      name = "Profile #4",

      Cooldown = true,

      Visible = true,

      pvpMode = false,

      KillsAmount = 1,

      PvpSafe = true,

      BlackListSafe = false,

      AntiRsRange = 5

},

    [5] = {

      enabled = false,

      attackTable = {},

      ignoreMana = true,

      Kills = false,

      Rotate = false,

      name = "Profile #5",

      Cooldown = true,

      Visible = true,

      pvpMode = false,

      KillsAmount = 1,

      PvpSafe = true,

      BlackListSafe = false,

      AntiRsRange = 5

},

}

end

if not AttackBotConfig.currentBotProfile or AttackBotConfig.currentBotProfile == 0 or AttackBotConfig.currentBotProfile > 5 then

  AttackBotConfig.currentBotProfile = 1

end

-- create panel UI

ui = UI.createWidget("AttackBotBotPanel")

-- finding correct table, manual unfortunately

local setActiveProfile = function()

  local n = AttackBotConfig.currentBotProfile

  currentSettings = AttackBotConfig[panelName][n]

end

setActiveProfile()

if not currentSettings.AntiRsRange then

  currentSettings.AntiRsRange = 5

end

local setProfileName = function()

  ui.name:setText(currentSettings.name)

end

-- small UI elements

ui.title.onClick = function(widget)

  currentSettings.enabled = not currentSettings.enabled

  widget:setOn(currentSettings.enabled)

  vBotConfigSave("atk")

end

ui.settings.onClick = function(widget)

  mainWindow:show()

  mainWindow:raise()

  mainWindow:focus()

end

  mainWindow = UI.createWindow("AttackBotWindow")

  mainWindow:hide()

  local panel = mainWindow.mainPanel

  local settingsUI = mainWindow.settingsPanel

  mainWindow.onVisibilityChange = function(widget, visible)

    if not visible then

      currentSettings.attackTable = {}

      for i, child in ipairs(panel.entryList:getChildren()) do

        table.insert(currentSettings.attackTable, child.params)

      end

      vBotConfigSave("atk")

    end

  end

  -- main panel

    -- functions

    function toggleSettings()

      panel:setVisible(not showSettings)

      mainWindow.shooterLabel:setVisible(not showSettings)

      settingsUI:setVisible(showSettings)

      mainWindow.settingsLabel:setVisible(showSettings)

      mainWindow.settings:setText(showSettings and "Back" or "Settings")

    end

    toggleSettings()

    mainWindow.settings.onClick = function()

      showSettings = not showSettings

      toggleSettings()

    end

    function toggleItem()

      panel.monsters:setWidth(showItem and 405 or 341)

      panel.itemId:setVisible(showItem)

      panel.spellName:setVisible(not showItem)

    end

    toggleItem()

    function setCategoryText()

      panel.category.description:setText(categories[category])

    end

    setCategoryText()

    function setPatternText()

      panel.range.description:setText(patterns[patternCategory][pattern])

    end

    setPatternText()

    -- in/de/crementation buttons

    panel.previousCategory.onClick = function()

      if category == 1 then

        category = #categories

      else

        category = category - 1

      end

      showItem = (category == 2 or category == 3) and true or false

      patternCategory = category == 4 and 3 or category == 5 and 4 or category

      pattern = 1

      toggleItem()

      setPatternText()

      setCategoryText()

    end

    panel.nextCategory.onClick = function()

      if category == #categories then

        category = 1

      else

        category = category + 1

      end

      showItem = (category == 2 or category == 3) and true or false

      patternCategory = category == 4 and 3 or category == 5 and 4 or category

      pattern = 1

      toggleItem()

      setPatternText()

      setCategoryText()

    end

    panel.previousSource.onClick = function()

      warn("[AttackBot] TODO, reserved for future use.")

    end

    panel.nextSource.onClick = function()

      warn("[AttackBot] TODO, reserved for future use.")

    end

    panel.previousRange.onClick = function()

      local t = patterns[patternCategory]

      if pattern == 1 then

        pattern = #t

      else

        pattern = pattern - 1

      end

      setPatternText()

    end

    panel.nextRange.onClick = function()

      local t = patterns[patternCategory]

      if pattern == #t then

        pattern = 1

      else

        pattern = pattern + 1

      end

      setPatternText()

    end

    -- eo in/de/crementation

  ------- [[core table function]] -------

    function setupWidget(widget)

      local params = widget.params

      widget:setText(params.description)

      if params.itemId > 0 then

        widget.spell:setVisible(false)

        widget.id:setVisible(true)

        widget.id:setItemId(params.itemId)

      end

      widget:setTooltip(params.tooltip)

      widget.remove.onClick = function()

        panel.up:setEnabled(false)

        panel.down:setEnabled(false)

        widget:destroy()

      end

      widget.enabled:setChecked(params.enabled)

      widget.enabled.onClick = function()

        params.enabled = not params.enabled

        widget.enabled:setChecked(params.enabled)

      end

      -- will serve as edit

      widget.onDoubleClick = function(widget)

        panel.manaPercent:setValue(params.mana)

        panel.creatures:setValue(params.count)

        panel.minHp:setValue(params.minHp)

        panel.maxHp:setValue(params.maxHp)

        panel.cooldown:setValue(params.cooldown)

        showItem = params.itemId > 100 and true or false

        panel.itemId:setItemId(params.itemId)

        panel.spellName:setText(params.spell or "")

        panel.orMore:setChecked(params.orMore)

        toggleItem()

        category = params.category

        patternCategory = params.patternCategory

        pattern = params.pattern

        setPatternText()

        setCategoryText()

        widget:destroy()

      end

      widget.onClick = function(widget)

        if #panel.entryList:getChildren() == 1 then

          panel.up:setEnabled(false)

          panel.down:setEnabled(false)

        elseif panel.entryList:getChildIndex(widget) == 1 then

          panel.up:setEnabled(false)

          panel.down:setEnabled(true)

        elseif panel.entryList:getChildIndex(widget) == panel.entryList:getChildCount() then

          panel.up:setEnabled(true)

          panel.down:setEnabled(false)

        else

          panel.up:setEnabled(true)

          panel.down:setEnabled(true)

        end

      end

    end

    -- refreshing values

    function refreshAttacks()

      if not currentSettings.attackTable then return end

      panel.entryList:destroyChildren()

      for i, entry in pairs(currentSettings.attackTable) do

        local label = UI.createWidget("AttackEntry", panel.entryList)

        label.params = entry

        setupWidget(label)

      end

    end

    refreshAttacks()

    panel.up:setEnabled(false)

    panel.down:setEnabled(false)

    -- adding values

    panel.addEntry.onClick = function(wdiget)

      -- first variables

      local creatures = panel.monsters:getText():lower()

      local monsters = (creatures:len() == 0 or creatures == "*" or creatures == "monster names") and true or string.split(creatures, ",")

      local mana = panel.manaPercent:getValue()

      local count = panel.creatures:getValue()

      local minHp = panel.minHp:getValue()

      local maxHp = panel.maxHp:getValue()

      local cooldown = panel.cooldown:getValue()

      local itemId = panel.itemId:getItemId()

      local spell = panel.spellName:getText()

      local tooltip = monsters ~= true and creatures

      local orMore = panel.orMore:isChecked()

      -- validation

      if showItem and itemId < 100 then

        return warn("[AttackBot]: please fill item ID!")

      elseif not showItem and (spell:lower() == "spell name" or spell:len() == 0) then

        return warn("[AttackBot]: please fill spell name!")

      end

      local regex = patternCategory ~= 1 and [[^[^\(]+]] or [[^[^R]+]]

      local type = regexMatch(patterns[patternCategory][pattern], regex)[1][1]:trim()

      regex = [[^[^ ]+]]

      local categoryName = regexMatch(categories[category], regex)[1][1]:trim():lower()

      local specificMonsters = monsters == true and "Any Creatures" or "Creatures"

      local attackType = showItem and "rune "..itemId or spell

      local countDescription = orMore and count.."+" or count

      local params = {

        creatures = creatures,

        monsters = monsters,

        mana = mana,

        count = count,

        minHp = minHp,

        maxHp = maxHp,

        cooldown = cooldown,

        itemId = itemId,

        spell = spell,

        enabled = true,

        category = category,

        patternCategory = patternCategory,

        pattern = pattern,

        tooltip = tooltip,

        orMore = orMore,

        description = '['..type..'] '..countDescription.. ' '..specificMonsters..': '..attackType..', '..categoryName..' ('..minHp..'%-'..maxHp..'%)'

}

      local label = UI.createWidget("AttackEntry", panel.entryList)

      label.params = params

      setupWidget(label)

      resetFields()

    end

    -- moving values

    -- up

    panel.up.onClick = function(widget)

      local focused = panel.entryList:getFocusedChild()

      local n = panel.entryList:getChildIndex(focused)

      if n-1 == 1 then

        widget:setEnabled(false)

      end

      panel.down:setEnabled(true)

      panel.entryList:moveChildToIndex(focused, n-1)

      panel.entryList:ensureChildVisible(focused)

    end

    -- down

    panel.down.onClick = function(widget)

      local focused = panel.entryList:getFocusedChild()

      local n = panel.entryList:getChildIndex(focused)

      if n + 1 == panel.entryList:getChildCount() then

        widget:setEnabled(false)

      end

      panel.up:setEnabled(true)

      panel.entryList:moveChildToIndex(focused, n+1)

      panel.entryList:ensureChildVisible(focused)

    end

  -- [[settings panel]] --

  settingsUI.profileName.onTextChange = function(widget, text)

    currentSettings.name = text

    setProfileName()

  end

  settingsUI.IgnoreMana.onClick = function(widget)

    currentSettings.ignoreMana = not currentSettings.ignoreMana

    settingsUI.IgnoreMana:setChecked(currentSettings.ignoreMana)

  end

  settingsUI.Rotate.onClick = function(widget)

    currentSettings.Rotate = not currentSettings.Rotate

    settingsUI.Rotate:setChecked(currentSettings.Rotate)

  end

  settingsUI.Kills.onClick = function(widget)

    currentSettings.Kills = not currentSettings.Kills

    settingsUI.Kills:setChecked(currentSettings.Kills)

  end

  settingsUI.Cooldown.onClick = function(widget)

    currentSettings.Cooldown = not currentSettings.Cooldown

    settingsUI.Cooldown:setChecked(currentSettings.Cooldown)

  end

  settingsUI.Visible.onClick = function(widget)

    currentSettings.Visible = not currentSettings.Visible

    settingsUI.Visible:setChecked(currentSettings.Visible)

  end

  settingsUI.PvpMode.onClick = function(widget)

    currentSettings.pvpMode = not currentSettings.pvpMode

    settingsUI.PvpMode:setChecked(currentSettings.pvpMode)

  end

  settingsUI.PvpSafe.onClick = function(widget)

    currentSettings.PvpSafe = not currentSettings.PvpSafe

    settingsUI.PvpSafe:setChecked(currentSettings.PvpSafe)

  end

  settingsUI.Training.onClick = function(widget)

    currentSettings.Training = not currentSettings.Training

    settingsUI.Training:setChecked(currentSettings.Training)

  end

  settingsUI.BlackListSafe.onClick = function(widget)

    currentSettings.BlackListSafe = not currentSettings.BlackListSafe

    settingsUI.BlackListSafe:setChecked(currentSettings.BlackListSafe)

  end

  settingsUI.KillsAmount.onValueChange = function(widget, value)

    currentSettings.KillsAmount = value

  end

  settingsUI.AntiRsRange.onValueChange = function(widget, value)

    currentSettings.AntiRsRange = value

  end

   -- window elements

  mainWindow.closeButton.onClick = function()

    showSettings = false

    toggleSettings()

    resetFields()

    mainWindow:hide()

  end

  -- core functions

  function resetFields()

    showItem = false

    toggleItem()

    pattern = 1

    patternCategory = 1

    category = 1

    setPatternText()

    setCategoryText()

    panel.manaPercent:setText(1)

    panel.creatures:setText(1)

    panel.minHp:setValue(0)

    panel.maxHp:setValue(100)

    panel.cooldown:setText(1)

    panel.monsters:setText("monster names")

    panel.itemId:setItemId(0)

    panel.spellName:setText("spell name")

    panel.orMore:setChecked(false)

  end

  resetFields()

  function loadSettings()

    -- BOT panel

    ui.title:setOn(currentSettings.enabled)

    setProfileName()

    -- main panel

    refreshAttacks()

    -- settings

    settingsUI.profileName:setText(currentSettings.name)

    settingsUI.Visible:setChecked(currentSettings.Visible)

    settingsUI.Cooldown:setChecked(currentSettings.Cooldown)

    settingsUI.PvpMode:setChecked(currentSettings.pvpMode)

    settingsUI.PvpSafe:setChecked(currentSettings.PvpSafe)

    settingsUI.BlackListSafe:setChecked(currentSettings.BlackListSafe)

    settingsUI.AntiRsRange:setValue(currentSettings.AntiRsRange)

    settingsUI.IgnoreMana:setChecked(currentSettings.ignoreMana)

    settingsUI.Rotate:setChecked(currentSettings.Rotate)

    settingsUI.Kills:setChecked(currentSettings.Kills)

    settingsUI.KillsAmount:setValue(currentSettings.KillsAmount)

    settingsUI.Training:setChecked(currentSettings.Training)

  end

  loadSettings()

  local activeProfileColor = function()

    for i=1,5 do

      if i == AttackBotConfig.currentBotProfile then

        ui[i]:setColor("green")

      else

        ui[i]:setColor("white")

      end

    end

  end

  activeProfileColor()

  local profileChange = function()

    setActiveProfile()

    activeProfileColor()

    loadSettings()

    resetFields()

    vBotConfigSave("atk")

  end

  for i=1,5 do

    local button = ui[i]

      button.onClick = function()

      AttackBotConfig.currentBotProfile = i

      profileChange()

    end

  end

    -- public functions

    AttackBot = {} -- global table

    AttackBot.isOn = function()

      return currentSettings.enabled

    end

    AttackBot.isOff = function()

      return not currentSettings.enabled

    end

    AttackBot.setOff = function()

      currentSettings.enabled = false

      ui.title:setOn(currentSettings.enabled)

      vBotConfigSave("atk")

    end

    AttackBot.setOn = function()

      currentSettings.enabled = true

      ui.title:setOn(currentSettings.enabled)

      vBotConfigSave("atk")

    end

    AttackBot.getActiveProfile = function()

      return AttackBotConfig.currentBotProfile -- returns number 1-5

    end

    AttackBot.setActiveProfile = function(n)

      if not n or not tonumber(n) or n < 1 or n > 5 then

        return error("[AttackBot] wrong profile parameter! should be 1 to 5 is " .. n)

      else

        AttackBotConfig.currentBotProfile = n

        profileChange()

      end

    end

    AttackBot.show = function()

      mainWindow:show()

      mainWindow:raise()

      mainWindow:focus()

    end

-- otui covered, now support functions

function getPattern(category, pattern, safe)

  safe = safe and 2 or 1

  return spellPatterns[category][pattern][safe]

end

function getMonstersInArea(category, posOrCreature, pattern, minHp, maxHp, safePattern, monsterNamesTable)

  -- monsterNamesTable can be nil

  local monsters = 0

  local t = {}

  if monsterNamesTable == true or not monsterNamesTable then

    t = {}

  else

    t = monsterNamesTable

  end

  if safePattern then

    for i, spec in pairs(getSpectators(posOrCreature, safePattern)) do

      if spec ~= player and (spec:isPlayer() and not spec:isPartyMember()) then

        return 0

      end

    end

  end

  if category == 1 or category == 3 or category == 4 then

    for i, spec in pairs(getSpectators()) do

      local specHp = spec:getHealthPercent()

      local name = spec:getName():lower()

      monsters = spec:isMonster() and specHp >= minHp and specHp <= maxHp and (#t == 0 or table.find(t, name)) and

                 (g_game.getClientVersion() < 960 or spec:getType() < 3) and monsters + 1 or monsters

    end

    return monsters

  end

  for i, spec in pairs(getSpectators(posOrCreature, pattern)) do

      if spec ~= player then

        local specHp = spec:getHealthPercent()

        local name = spec:getName():lower()

        monsters = spec:isMonster() and specHp >= minHp and specHp <= maxHp and (#t == 0 or table.find(t, name)) and

                   (g_game.getClientVersion() < 960 or spec:getType() < 3) and monsters + 1 or monsters

      end

  end

  return monsters

end

-- for area runes only

-- should return valid targets number (int) and position

function getBestTileByPattern(pattern, minHp, maxHp, safePattern, monsterNamesTable)

  local tiles = g_map.getTiles(posz())

  local targetTile = {amount=0,pos=false}

  for i, tile in pairs(tiles) do

    local tPos = tile:getPosition()

    local distance = distanceFromPlayer(tPos)

    if tile:canShoot() and tile:isWalkable() and distance < 4 then

      local amount = getMonstersInArea(2, tPos, pattern, minHp, maxHp, safePattern, monsterNamesTable)

      if amount > targetTile.amount then

        targetTile = {amount=amount,pos=tPos}

      end

    end

  end

  return targetTile.amount > 0 and targetTile or false

end

function executeAttackBotAction(categoryOrPos, idOrFormula, cooldown)

  cooldown = cooldown or 0

  if categoryOrPos == 4 or categoryOrPos == 5 or categoryOrPos == 1 then

    cast(idOrFormula, cooldown)

  elseif categoryOrPos == 3 then

    useWith(idOrFormula, target())

  end

end

-- support function covered, now the main loop

macro(100, function()

  if not currentSettings.enabled then return end

  if #currentSettings.attackTable == 0 or isInPz() or not target() or modules.game_cooldown.isGroupCooldownIconActive(1) then return end

  if currentSettings.Training and target() and target():getName():lower():find("training") then return end

  if g_game.getClientVersion() < 960 or not currentSettings.Cooldown then

    delay(400)

  end

  local monstersN = 0

  local monstersE = 0

  local monstersS = 0

  local monstersW = 0

  monstersN = getCreaturesInArea(pos(), posN, 2)

  monstersE = getCreaturesInArea(pos(), posE, 2)

  monstersS = getCreaturesInArea(pos(), posS, 2)

  monstersW = getCreaturesInArea(pos(), posW, 2)

  local posTable = {monstersE, monstersN, monstersS, monstersW}

  local bestSide = 0

  local bestDir

  -- pulling out the biggest number

  for i, v in pairs(posTable) do

    if v > bestSide then

        bestSide = v

    end

  end

  -- associate biggest number with turn direction

  if monstersN == bestSide then bestDir = 0

    elseif monstersE == bestSide then bestDir = 1

    elseif monstersS == bestSide then bestDir = 2

    elseif monstersW == bestSide then bestDir = 3

  end

  if currentSettings.Rotate then

    if player:getDirection() ~= bestDir and bestSide > 0 then

      turn(bestDir)

      return

    end

  end

  -- support functions done, main spells now

          --[[

           entry = {

              creatures = creatures,

              monsters = monsters, (formatted creatures)

              mana = mana,

              count = count,

              minHp = minHp,

              maxHp = maxHp,

              cooldown = cooldown,

              itemId = itemId,

              spell = spell,

              enabled = true,

              category = category,

              patternCategory = patternCategory,

              pattern = pattern,

              tooltip = tooltip,

              description = '['..type..'] '..count.. 'x '..specificMonsters..': '..attackType..', '..categoryName..' ('..minHp..'%-'..maxHp..'%)'

}

]]

  for i, child in ipairs(panel.entryList:getChildren()) do

    local entry = child.params

    local attackData = entry.itemId > 100 and entry.itemId or entry.spell

    if entry.enabled and manapercent() >= entry.mana then

      if (type(attackData) == "string" and canCast(entry.spell, not currentSettings.ignoreMana, not currentSettings.Cooldown)) or (entry.itemId > 100 and (not currentSettings.Visible or findItem(entry.itemId))) then

        -- first PVP scenario

        if currentSettings.pvpMode and target():getHealthPercent() >= entry.minHp and target():getHealthPercent() <= entry.maxHp and target():canShoot() then

          if entry.category == 2 then

            return warn("[AttackBot] Area Runes cannot be used in PVP situation!")

          else

            return executeAttackBotAction(entry.category, attackData, entry.cooldown)

          end

        end

        -- empowerment

        if entry.category == 4 and not isBuffed() then

          local monsterAmount = getMonstersInArea(entry.category, nil, nil, entry.minHp, entry.maxHp, false, entry.monsters)

          if (entry.orMore and monsterAmount >= entry.count or not entry.orMore and monsterAmount == entry.count) and distanceFromPlayer(target():getPosition()) <= entry.pattern then

            return executeAttackBotAction(entry.category, attackData, entry.cooldown)

          end

--

        elseif entry.category == 1 or entry.category == 3 then

          local monsterAmount = getMonstersInArea(entry.category, nil, nil, entry.minHp, entry.maxHp, false, entry.monsters)

          if (entry.orMore and monsterAmount >= entry.count or not entry.orMore and monsterAmount == entry.count) and distanceFromPlayer(target():getPosition()) <= entry.pattern then

            return executeAttackBotAction(entry.category, attackData, entry.cooldown)

          end

        elseif entry.category == 5 then

          local pCat = entry.patternCategory

          local pattern = entry.pattern

          local anchorParam = (pattern == 2 or pattern == 6 or pattern == 7 or pattern > 9) and player or pos()

          local safe = currentSettings.PvpSafe and spellPatterns[pCat][entry.pattern][2] or false

          local monsterAmount = pCat ~= 8 and getMonstersInArea(entry.category, anchorParam, spellPatterns[pCat][entry.pattern][1], entry.minHp, entry.maxHp, safe, entry.monsters)

          if (pattern ~= 8 and (entry.orMore and monsterAmount >= entry.count or not entry.orMore and monsterAmount == entry.count)) or (pattern == 8 and bestSide >= entry.count and (not currentSettings.PvpSafe or getPlayers(2) == 0)) then

            if (not currentSettings.BlackListSafe or not isBlackListedPlayerInRange(currentSettings.AntiRsRange)) and (not currentSettings.Kills or killsToRs() > currentSettings.KillsAmount) then

              return executeAttackBotAction(entry.category, attackData, entry.cooldown)

            end

          end

        elseif entry.category == 2 then

          local pCat = entry.patternCategory

          local safe = currentSettings.PvpSafe and spellPatterns[pCat][entry.pattern][2] or false

          local data = getBestTileByPattern(spellPatterns[pCat][entry.pattern][1], entry.minHp, entry.maxHp, safe, entry.monsters)

          local monsterAmount

          local pos

          if data then

            monsterAmount = data.amount

            pos = data.pos

          end

          if monsterAmount and (entry.orMore and monsterAmount >= entry.count or not entry.orMore and monsterAmount == entry.count) then

            if (not currentSettings.BlackListSafe or not isBlackListedPlayerInRange(currentSettings.AntiRsRange)) and (not currentSettings.Kills or killsToRs() > currentSettings.KillsAmount) then

              return useWith(attackData, g_map.getTile(pos):getTopUseThing())

            end

          end

        end

      end

    end

  end

end)

```

---
# AttackBot.otui
```otui

AttackEntry < UIWidget

  background-color: alpha

  text-offset: 35 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  text-align: left

  CheckBox

    id: enabled

    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter

    width: 15

    height: 15

    margin-top: 2

    margin-left: 3

  UIItem

    id: id

    anchors.left: prev.right

    anchors.verticalCenter: parent.verticalCenter

    size: 16 16

    focusable: false

    visible: false

  UIWidget

    id: spell

    anchors.left: enabled.right

    anchors.verticalCenter: parent.verticalCenter

    size: 12 12

    margin-left: 1

    image-source: /images/game/dangerous

  $focus:

    background-color: #00000055

  Button

    id: remove

    !text: tr('x')

    anchors.right: parent.right

    margin-right: 15

    width: 15

    height: 15

AttackBotBotPanel < Panel

  height: 38

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('AttackBot')

  Button

    id: settings

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

  Button

    id: 1

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: 1

    margin-right: 2

    margin-top: 4

    size: 17 17

  Button

    id: 2

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 2

    margin-left: 4

    size: 17 17

  Button

    id: 3

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 3

    margin-left: 4

    size: 17 17

  Button

    id: 4

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 4

    margin-left: 4

    size: 17 17

  Button

    id: 5

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 5

    margin-left: 4

    size: 17 17

  Label

    id: name

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    anchors.right: parent.right

    text-align: center

    margin-left: 4

    height: 17

    text: Profile #1

    background: #292A2A

CategoryLabel < Panel

  size: 315 15

  image-source: /images/ui/panel_flat

  image-border: 5

  padding: 1

  Label

    id: description

    anchors.fill: parent

    text-align: center

    text: Area Rune (avalanche, great fireball, etc)

    font: verdana-11px-rounded

    background: #363636

SourceLabel < Panel

  size: 105 15

  image-source: /images/ui/panel_flat

  image-border: 5

  padding: 1

  Label

    id: description

    anchors.fill: parent

    text-align: center

    text: Monster Name

    font: verdana-11px-rounded

    background: #363636

RangeLabel < Panel

  size: 323 15

  image-source: /images/ui/panel_flat

  image-border: 5

  padding: 1

  Label

    id: description

    anchors.fill: parent

    text-align: center

    text: 5 Sqm

    font: verdana-11px-rounded

    background: #363636

PreButton < PreviousButton

  background: #363636

  height: 15

NexButton < NextButton

  background: #363636

  height: 15

AttackBotPanel < Panel

  size: 500 200

  image-source: /images/ui/panel_flat

  image-border: 5

  padding: 5

  TextList

    id: entryList

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    margin-top: 3

    size: 430 100

    vertical-scrollbar: entryListScrollBar

  VerticalScrollBar

    id: entryListScrollBar

    anchors.top: entryList.top

    anchors.bottom: entryList.bottom

    anchors.right: entryList.right

    step: 14

    pixels-scroll: true

  PreButton

    id: previousCategory

    anchors.left: entryList.left

    anchors.top: entryList.bottom

    margin-top: 8

  NexButton

    id: nextCategory

    anchors.left: category.right

    anchors.top: entryList.bottom

    margin-top: 8

    margin-left: 2

  CategoryLabel

    id: category

    anchors.top: entryList.bottom

    anchors.left: previousCategory.right

    anchors.verticalCenter: previousCategory.verticalCenter

    margin-left: 3

  PreButton

    id: previousSource

    anchors.left: entryList.left

    anchors.top: category.bottom

    margin-top: 8

  NexButton

    id: nextSource

    anchors.left: source.right

    anchors.top: category.bottom

    margin-top: 8

    margin-left: 2

  SourceLabel

    id: source

    anchors.top: category.bottom

    anchors.left: previousSource.right

    anchors.verticalCenter: previousSource.verticalCenter

    margin-left: 3

  PreButton

    id: previousRange

    anchors.left: nextSource.right

    anchors.verticalCenter: nextSource.verticalCenter

    margin-left: 8

  NexButton

    id: nextRange

    anchors.left: range.right

    anchors.verticalCenter: range.verticalCenter

    margin-left: 2

  RangeLabel

    id: range

    anchors.left: previousRange.right

    anchors.verticalCenter: previousRange.verticalCenter

    margin-left: 3

  TextEdit

    id: monsters

    anchors.left: entryList.left

    anchors.top: range.bottom

    margin-top: 5

    size: 405 15

    text: monster names

    font: cipsoftFont

    background: #363636

  Label

    anchors.left: prev.left

    anchors.top: prev.bottom

    margin-top: 6

    margin-left: 3

    text-align: center

    text: Mana%:

    font: verdana-11px-rounded

  SpinBox

    id: manaPercent

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 4

    size: 30 20

    minimum: 0

    maximum: 99

    step: 1

    editable: true

    focusable: true

  Label

    anchors.left: prev.right

    margin-left: 7

    anchors.verticalCenter: prev.verticalCenter

    text: Creatures:

    font: verdana-11px-rounded

  SpinBox

    id: creatures

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 4

    size: 30 20

    minimum: 1

    maximum: 99

    step: 1

    editable: true

    focusable: true

  CheckBox

    id: orMore

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    tooltip: or more creatures

  Label

    anchors.left: prev.right

    margin-left: 7

    anchors.verticalCenter: prev.verticalCenter

    text: HP:

    font: verdana-11px-rounded

  SpinBox

    id: minHp

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 4

    size: 40 20

    minimum: 0

    maximum: 99

    value: 0

    editable: true

    focusable: true

  Label

    anchors.left: prev.right

    margin-left: 4

    anchors.verticalCenter: prev.verticalCenter

    text: -

    font: verdana-11px-rounded

  SpinBox

    id: maxHp

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 4

    size: 40 20

    minimum: 1

    maximum: 100

    value: 100

    editable: true

    focusable: true

  Label

    anchors.left: prev.right

    margin-left: 7

    anchors.verticalCenter: prev.verticalCenter

    text: CD:

    font: verdana-11px-rounded

  SpinBox

    id: cooldown

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 4

    size: 60 20

    minimum: 0

    maximum: 999999

    step: 100

    value: 0

    editable: true

    focusable: true

  Button

    id: up

    anchors.right: parent.right

    anchors.top: entryList.bottom

    size: 60 17

    text: Move Up

    text-align: center

    font: cipsoftFont

    margin-top: 7

    margin-right: 8

  Button

    id: down

    anchors.right: prev.left

    anchors.verticalCenter: prev.verticalCenter

    size: 60 17

    margin-right: 5

    text: Move Down

    text-align: center

    font: cipsoftFont

  Button

    id: addEntry

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 40 19

    text-align: center

    text: New

    font: cipsoftFont

  BotItem

    id: itemId

    anchors.right: addEntry.left

    margin-right: 5

    anchors.bottom: parent.bottom

    margin-bottom: 2

    tooltip: drag item here on press to open window

  TextEdit

    id: spellName

    anchors.top: monsters.top

    anchors.left: monsters.right

    anchors.right: parent.right

    margin-left: 5

    height: 15

    text: spell name

    background: #363636

    font: cipsoftFont

    visible: false

SettingsPanel < Panel

  size: 500 200

  image-source: /images/ui/panel_flat

  image-border: 5

  padding: 10

  VerticalSeparator

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.left: Visible.right

    margin-left: 10

    margin-top: 5

    margin-bottom: 5

  Label

    anchors.top: parent.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 10

    text-align: center

    font: verdana-11px-rounded

    text: Profile:

  TextEdit

    id: profileName

    anchors.top: prev.bottom

    margin-top: 3

    anchors.left: prev.left

    anchors.right: prev.right

    margin-left: 20

    margin-right: 20

  Button

    id: resetSettings

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    text-align: center

    text: Reset Settings

  CheckBox

    id: IgnoreMana

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 5

    width: 200

    text: Check RL Tibia conditions

  CheckBox

    id: Kills

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 8

    width: 200

    height: 22

    text: Don't use area attacks if less than kills to red skull

    text-wrap: true

    text-align: left

  SpinBox

    id: KillsAmount

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.left: prev.right

    text-align: left

    width: 30

    minimum: 1

    maximum: 10

    focusable: true

    margin-left: 5

  CheckBox

    id: Rotate

    anchors.top: Kills.bottom

    anchors.left: Kills.left

    margin-top: 8

    width: 220

    text: Turn to side with most monsters

  CheckBox

    id: Cooldown

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 8

    width: 220

    text: Check spell cooldowns

  CheckBox

    id: Visible

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 8

    width: 245

    text: Items must be visible (recommended)

  CheckBox

    id: PvpMode

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 8

    width: 245

    text: PVP mode

  CheckBox

    id: PvpSafe

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 8

    width: 245

    text: PVP safe

  CheckBox

    id: Training

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 8

    width: 245

    text: Stop when attacking trainers

  CheckBox

    id: BlackListSafe

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 8

    width: 200

    height: 18

    text: Stop if Anti-RS player in range

  SpinBox

    id: AntiRsRange

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.left: prev.right

    text-align: center

    width: 50

    minimum: 1

    maximum: 10

    focusable: true

    margin-left: 5

AttackBotWindow < MainWindow

  size: 535 300

  padding: 15

  text: AttackBot v2

  @onEscape: self:hide()

  Label

    id: mainLabel

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    margin-top: 10

    margin-left: 2

    !text: tr('More important methods come first (Example: Exori gran above Exori)')

    text-align: left

    font: verdana-11px-rounded

    color: #aeaeae

  SettingsPanel

    id: settingsPanel

    anchors.top: prev.bottom

    margin-top: 10

    anchors.left: parent.left

    margin-left: 2

  Label

    id: settingsLabel

    anchors.verticalCenter: prev.top

    anchors.left: prev.left

    margin-left: 3

    text: Settings

    color: #fe4400

    font: verdana-11px-rounded

  AttackBotPanel

    id: mainPanel

    anchors.top: mainLabel.bottom

    margin-top: 10

    anchors.left: parent.left

    margin-left: 2

    visible: false

  Label

    id: shooterLabel

    anchors.verticalCenter: prev.top

    anchors.left: prev.left

    margin-left: 3

    text: Spell Shooter

    color: #fe4400

    font: verdana-11px-rounded

    visible: false

  HorizontalSeparator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: closeButton.top

    margin-bottom: 10

  Button

    id: closeButton

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    text: Close

    font: cipsoftFont

  Button

    id: settings

    anchors.left: parent.left

    anchors.verticalCenter: prev.verticalCenter

    size: 50 21

    font: cipsoftFont

    text: Settings

```

---
# BotServer.lua
```lua

setDefaultTab("Main")

local panelName = "BOTserver"

local ui = setupUI([[

Panel

  height: 18

  Button

    id: botServer

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: center

    height: 18

    !text: tr('BotServer')

]])

ui:setId(panelName)

if not storage[panelName] then

  storage[panelName] = {

  manaInfo = true,

  mwallInfo = true,

  vocation = true,

  outfit = false,

  broadcasts = true

}

end

local config = storage[panelName]

if not storage.BotServerChannel then

  math.randomseed(os.time())

  storage.BotServerChannel = tostring(math.random(1000000000000,9999999999999))

end

local channel = tostring(storage.BotServerChannel)

BotServer.init(name(), channel)

vBot.BotServerMembers = {}

rootWidget = g_ui.getRootWidget()

if rootWidget then

  botServerWindow = g_ui.createWidget('BotServerWindow', rootWidget)

  botServerWindow:hide()

  botServerWindow.Data.Channel:setText(storage.BotServerChannel)

  botServerWindow.Data.Channel.onTextChange = function(widget, text)

    storage.BotServerChannel = text

  end

  botServerWindow.Data.Random.onClick = function(widget)

    storage.BotServerChannel = tostring(math.random(1000000000000,9999999999999))

    botServerWindow.Data.Channel:setText(storage.BotServerChannel)

  end

  botServerWindow.Features.Feature1:setOn(config.manaInfo)

  botServerWindow.Features.Feature1.onClick = function(widget)

    config.manaInfo = not config.manaInfo

    widget:setOn(config.manaInfo)

  end

  botServerWindow.Features.Feature2:setOn(config.mwallInfo)

  botServerWindow.Features.Feature2.onClick = function(widget)

    config.mwallInfo = not config.mwallInfo

    widget:setOn(config.mwallInfo)

  end

  botServerWindow.Features.Feature3:setOn(config.vocation)

  botServerWindow.Features.Feature3.onClick = function(widget)

    config.vocation = not config.vocation

    if config.vocation then

      BotServer.send("voc", player:getVocation())

    end

    widget:setOn(config.vocation)

  end

  botServerWindow.Features.Feature4:setOn(config.outfit)

  botServerWindow.Features.Feature4.onClick = function(widget)

    config.outfit = not config.outfit

    widget:setOn(config.outfit)

  end

  botServerWindow.Features.Feature5:setOn(config.broadcasts)

  botServerWindow.Features.Feature5.onClick = function(widget)

    config.broadcasts = not config.broadcasts

    widget:setOn(config.broadcasts)

  end

  botServerWindow.Features.Broadcast.onClick = function(widget)

    if BotServer._websocket then

      BotServer.send("broadcast", botServerWindow.Features.broadcastText:getText())

    end

    botServerWindow.Features.broadcastText:setText('')

  end

end

function updateStatusText()

  if BotServer._websocket then

    botServerWindow.Data.ServerStatus:setText("CONNECTED")

    if serverCount then

      botServerWindow.Data.Members:setText("Members: "..#serverCount)

      if ServerMembers then

        local text = ""

        local regex = [["([a-z 'A-z-]*)"*]]

        local re = regexMatch(ServerMembers, regex)

        --re[name][2]

        for i=1,#re do

          if i == 1 then

            text = re[i][2]

          else

            text = text .. "\n" .. re[i][2]

          end

        end

        botServerWindow.Data.Members:setTooltip(text)

      end

    end

  else

    botServerWindow.Data.ServerStatus:setText("DISCONNECTED")

    botServerWindow.Data.Participants:setText("-")

  end

end

macro(2000, function()

  if BotServer._websocket then

    BotServer.send("list")

  end

  updateStatusText()

end)

local regex = [["(.*?)"]]

BotServer.listen("list", function(name, data)

  serverCount = regexMatch(json.encode(data), regex)

  ServerMembers = json.encode(data)

end)

ui.botServer.onClick = function(widget)

    botServerWindow:show()

    botServerWindow:raise()

    botServerWindow:focus()

end

botServerWindow.closeButton.onClick = function(widget)

    botServerWindow:hide()

end

-- scripts

-- mwalls

config.mwalls = {}

BotServer.listen("mwall", function(name, message)

  if config.mwallInfo then

    if not config.mwalls[message["pos"]] or config.mwalls[message["pos"]] < now then

      config.mwalls[message["pos"]] = now + message["duration"] - 150 -- 150 is latency correction

    end

  end

end)

onAddThing(function(tile, thing)

  if config.mwallInfo then

    if thing:isItem() and thing:getId() == 2129 then

      local pos = tile:getPosition().x .. "," .. tile:getPosition().y .. "," .. tile:getPosition().z

      if not config.mwalls[pos] or config.mwalls[pos] < now then

        config.mwalls[pos] = now + 20000

        BotServer.send("mwall", {pos=pos, duration=20000})

      end

    end

  end

end)

-- mana

local lastMana = 0

macro(500, function()

  if config.manaInfo then

    if manapercent() ~= lastMana then

      lastMana = manapercent()

      BotServer.send("mana", {mana=lastMana})

    end

  end

end)

BotServer.listen("mana", function(name, message)

  if config.manaInfo then

    local creature = getPlayerByName(name)

    if creature then

      creature:setManaPercent(message["mana"])

    end

  end

end)

-- vocation

if config.vocation then

  BotServer.send("voc", player:getVocation())

  BotServer.send("voc", "yes")

end

BotServer.listen("voc", function(name, message)

  if message == "yes" and config.vocation then

    BotServer.send("voc", player:getVocation())

  else

    vBot.BotServerMembers[name] = message

  end

end)

-- broadcast

BotServer.listen("broadcast", function(name, message)

  if config.broadcasts then

    broadcastMessage(name..": "..message)

  end

end)

addSeparator()

```

---
# BotServer.otui
```otui

BotServerData < Panel

  size: 340 70

  image-source: /images/ui/window

  image-border: 6

  padding: 3

  Label

    id: label

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: center

    !text: tr("BotServer Data")

  Label

    id: label

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 23

    text-align: center

    text: Channel Name:

    margin-left: 6

  TextEdit

    id: Channel

    anchors.top: parent.top

    anchors.left: prev.right

    margin-top: 20

    width: 150

    margin-left: 5

    text-align: center

  Button

    id: Random

    anchors.left: prev.right

    anchors.top: prev.top

    anchors.right: parent.right

    text-align: center

    text: Randomize

    margin-left: 6

    margin-right: 6

  Label

    id: label

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    margin-left: 6

    margin-bottom: 4

    text-align: center

    text: Status:

  BotLabel

    id: ServerStatus

    anchors.left: prev.right

    anchors.bottom: parent.bottom

    margin-left: 10

    margin-bottom: 4

    text-align: center

    text: CONNECTED

  BotLabel

    id: Participants

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    margin-right: 8

    margin-bottom: 4

    text-align: center

  UIWidget

    id: Members

    anchors.right: Participants.left

    anchors.bottom: parent.bottom

    size: 80 21

    text-align: center

    text: Members:

FeaturePanel < Panel

  size: 340 150

  image-source: /images/ui/panel_flat

  image-border: 5

  padding: 3

  Label

    id: title

    anchors.top: parent.top

    anchors.horizontalCenter: parent.horizontalCenter

    text-align: center

    text: Features

  HorizontalSeparator

    id: sep

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 2

  BotSwitch

    id: Feature1

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-left: 3

    margin-top: 5

    text: Mana info

  BotSwitch

    id: Feature2

    anchors.top: sep.bottom

    anchors.left: prev.right

    margin-top: 5

    margin-left: 5

    text: MWall info

  BotSwitch

    id: Feature3

    anchors.top: sep.bottom

    anchors.left: prev.right

    margin-top: 5

    margin-left: 5

    text: Send Vocation

  BotSwitch

    id: Feature4

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-top: 3

    margin-left: 3

    text: Outfit Vocation

  BotSwitch

    id: Feature5

    anchors.bottom: prev.bottom

    anchors.left: prev.right

    margin-top: 3

    margin-left: 5

    text: Broadcasts

  TextEdit

    id: broadcastText

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-left: 3

    margin-bottom: 3

    margin-right: 80

  Button

    id: Broadcast

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-right: 3

    margin-left: 3

    height: 22

    text: Broadcast

BotServerWindow < MainWindow

  !text: tr('BotServer')

  size: 370 310

  @onEscape: self:hide()

  BotServerData

    id: Data

    anchors.top: parent.top

    anchors.horizontalCenter: parent.horizontalCenter

  FeaturePanel

    id: Features

    anchors.top: prev.bottom

    anchors.horizontalCenter: parent.horizontalCenter

    margin-top: 10

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

```

---
# Conditions.lua
```lua

setDefaultTab("HP")

local panelName = "ConditionPanel"

local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('Conditions')

  Button

    id: conditionList

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

  ]])

  ui:setId(panelName)

  if not HealBotConfig[panelName] then

    HealBotConfig[panelName] = {

      enabled = false,

      curePosion = false,

      poisonCost = 20,

      cureCurse = false,

      curseCost = 80,

      cureBleed = false,

      bleedCost = 45,

      cureBurn = false,

      burnCost = 30,

      cureElectrify = false,

      electrifyCost = 22,

      cureParalyse = false,

      paralyseCost = 40,

      paralyseSpell = "utani hur",

      holdHaste = false,

      hasteCost = 40,

      hasteSpell = "utani hur",

      holdUtamo = false,

      utamoCost = 40,

      holdUtana = false,

      utanaCost = 440,

      holdUtura = false,

      uturaType = "",

      uturaCost = 100,

      ignoreInPz = true,

      stopHaste = false

}

  end

  local config = HealBotConfig[panelName]

  ui.title:setOn(config.enabled)

  ui.title.onClick = function(widget)

    config.enabled = not config.enabled

    widget:setOn(config.enabled)

    vBotConfigSave("heal")

  end

  ui.conditionList.onClick = function(widget)

    conditionsWindow:show()

    conditionsWindow:raise()

    conditionsWindow:focus()

  end

  local rootWidget = g_ui.getRootWidget()

  if rootWidget then

    conditionsWindow = UI.createWindow('ConditionsWindow', rootWidget)

    conditionsWindow:hide()

    conditionsWindow.onVisibilityChange = function(widget, visible)

      if not visible then

        vBotConfigSave("heal")

      end

    end

    -- text edits

    conditionsWindow.Cure.PoisonCost:setText(config.poisonCost)

    conditionsWindow.Cure.PoisonCost.onTextChange = function(widget, text)

      config.poisonCost = tonumber(text)

    end

    conditionsWindow.Cure.CurseCost:setText(config.curseCost)

    conditionsWindow.Cure.CurseCost.onTextChange = function(widget, text)

      config.curseCost = tonumber(text)

    end

    conditionsWindow.Cure.BleedCost:setText(config.bleedCost)

    conditionsWindow.Cure.BleedCost.onTextChange = function(widget, text)

      config.bleedCost = tonumber(text)

    end

    conditionsWindow.Cure.BurnCost:setText(config.burnCost)

    conditionsWindow.Cure.BurnCost.onTextChange = function(widget, text)

      config.burnCost = tonumber(text)

    end

    conditionsWindow.Cure.ElectrifyCost:setText(config.electrifyCost)

    conditionsWindow.Cure.ElectrifyCost.onTextChange = function(widget, text)

      config.electrifyCost = tonumber(text)

    end

    conditionsWindow.Cure.ParalyseCost:setText(config.paralyseCost)

    conditionsWindow.Cure.ParalyseCost.onTextChange = function(widget, text)

      config.paralyseCost = tonumber(text)

    end

    conditionsWindow.Cure.ParalyseSpell:setText(config.paralyseSpell)

    conditionsWindow.Cure.ParalyseSpell.onTextChange = function(widget, text)

      config.paralyseSpell = text

    end

    conditionsWindow.Hold.HasteSpell:setText(config.hasteSpell)

    conditionsWindow.Hold.HasteSpell.onTextChange = function(widget, text)

      config.hasteSpell = text

    end

    conditionsWindow.Hold.HasteCost:setText(config.hasteCost)

    conditionsWindow.Hold.HasteCost.onTextChange = function(widget, text)

      config.hasteCost = tonumber(text)

    end

    conditionsWindow.Hold.UtamoCost:setText(config.utamoCost)

    conditionsWindow.Hold.UtamoCost.onTextChange = function(widget, text)

      config.utamoCost = tonumber(text)

    end

    conditionsWindow.Hold.UtanaCost:setText(config.utanaCost)

    conditionsWindow.Hold.UtanaCost.onTextChange = function(widget, text)

      config.utanaCost = tonumber(text)

    end

    conditionsWindow.Hold.UturaCost:setText(config.uturaCost)

    conditionsWindow.Hold.UturaCost.onTextChange = function(widget, text)

      config.uturaCost = tonumber(text)

    end

    -- combo box

    conditionsWindow.Hold.UturaType:setOption(config.uturaType)

    conditionsWindow.Hold.UturaType.onOptionChange = function(widget)

      config.uturaType = widget:getCurrentOption().text

    end

    -- checkboxes

    conditionsWindow.Cure.CurePoison:setChecked(config.curePoison)

    conditionsWindow.Cure.CurePoison.onClick = function(widget)

      config.curePoison = not config.curePoison

      widget:setChecked(config.curePoison)

    end

    conditionsWindow.Cure.CureCurse:setChecked(config.cureCurse)

    conditionsWindow.Cure.CureCurse.onClick = function(widget)

      config.cureCurse = not config.cureCurse

      widget:setChecked(config.cureCurse)

    end

    conditionsWindow.Cure.CureBleed:setChecked(config.cureBleed)

    conditionsWindow.Cure.CureBleed.onClick = function(widget)

      config.cureBleed = not config.cureBleed

      widget:setChecked(config.cureBleed)

    end

    conditionsWindow.Cure.CureBurn:setChecked(config.cureBurn)

    conditionsWindow.Cure.CureBurn.onClick = function(widget)

      config.cureBurn = not config.cureBurn

      widget:setChecked(config.cureBurn)

    end

    conditionsWindow.Cure.CureElectrify:setChecked(config.cureElectrify)

    conditionsWindow.Cure.CureElectrify.onClick = function(widget)

      config.cureElectrify = not config.cureElectrify

      widget:setChecked(config.cureElectrify)

    end

    conditionsWindow.Cure.CureParalyse:setChecked(config.cureParalyse)

    conditionsWindow.Cure.CureParalyse.onClick = function(widget)

      config.cureParalyse = not config.cureParalyse

      widget:setChecked(config.cureParalyse)

    end

    conditionsWindow.Hold.HoldHaste:setChecked(config.holdHaste)

    conditionsWindow.Hold.HoldHaste.onClick = function(widget)

      config.holdHaste = not config.holdHaste

      widget:setChecked(config.holdHaste)

    end

    conditionsWindow.Hold.HoldUtamo:setChecked(config.holdUtamo)

    conditionsWindow.Hold.HoldUtamo.onClick = function(widget)

      config.holdUtamo = not config.holdUtamo

      widget:setChecked(config.holdUtamo)

    end

    conditionsWindow.Hold.HoldUtana:setChecked(config.holdUtana)

    conditionsWindow.Hold.HoldUtana.onClick = function(widget)

      config.holdUtana = not config.holdUtana

      widget:setChecked(config.holdUtana)

    end

    conditionsWindow.Hold.HoldUtura:setChecked(config.holdUtura)

    conditionsWindow.Hold.HoldUtura.onClick = function(widget)

      config.holdUtura = not config.holdUtura

      widget:setChecked(config.holdUtura)

    end

    conditionsWindow.Hold.IgnoreInPz:setChecked(config.ignoreInPz)

    conditionsWindow.Hold.IgnoreInPz.onClick = function(widget)

      config.ignoreInPz = not config.ignoreInPz

      widget:setChecked(config.ignoreInPz)

    end

    conditionsWindow.Hold.StopHaste:setChecked(config.stopHaste)

    conditionsWindow.Hold.StopHaste.onClick = function(widget)

      config.stopHaste = not config.stopHaste

      widget:setChecked(config.stopHaste)

    end

    -- buttons

    conditionsWindow.closeButton.onClick = function(widget)

      conditionsWindow:hide()

    end

    Conditions = {}

    Conditions.show = function()

      conditionsWindow:show()

      conditionsWindow:raise()

      conditionsWindow:focus()

    end

  end

  local utanaCast = nil

  macro(500, function()

    if not config.enabled or modules.game_cooldown.isGroupCooldownIconActive(2) then return end

    if hppercent() > 95 then

      if config.curePoison and mana() >= config.poisonCost and isPoisioned() then say("exana pox")

      elseif config.cureCurse and mana() >= config.curseCost and isCursed() then say("exana mort")

      elseif config.cureBleed and mana() >= config.bleedCost and isBleeding() then say("exana kor")

      elseif config.cureBurn and mana() >= config.burnCost and isBurning() then say("exana flam")

      elseif config.cureElectrify and mana() >= config.electrifyCost and isEnergized() then say("exana vis")

      end

    end

    if (not config.ignoreInPz or not isInPz()) and config.holdUtura and mana() >= config.uturaCost and canCast(config.uturaType) and hppercent() < 90 then say(config.uturaType)

    elseif (not config.ignoreInPz or not isInPz()) and config.holdUtana and mana() >= config.utanaCost and (not utanaCast or (now - utanaCast > 120000)) then say("utana vid") utanaCast = now

    end

  end)

  macro(50, function()

    if not config.enabled then return end

    if (not config.ignoreInPz or not isInPz()) and config.holdUtamo and mana() >= config.utamoCost and not hasManaShield() then say("utamo vita")

    elseif ((not config.ignoreInPz or not isInPz()) and standTime() < 5000 and config.holdHaste and mana() >= config.hasteCost and not hasHaste() and not getSpellCoolDown(config.hasteSpell) and (not target() or not config.stopHaste or TargetBot.isCaveBotActionAllowed())) and standTime() < 3000 then say(config.hasteSpell)

    elseif config.cureParalyse and mana() >= config.paralyseCost and isParalyzed() and not getSpellCoolDown(config.paralyseSpell) then say(config.paralyseSpell)

    end

  end)

```

---
# Conditions.otui
```otui

UturaComboBoxPopupMenu < ComboBoxPopupMenu

UturaComboBoxPopupMenuButton < ComboBoxPopupMenuButton

UturaComboBox < ComboBox

  @onSetup: |

    self:addOption("Utura")

    self:addOption("Utura Gran")

CureConditions < Panel

  id: Cure

  image-source: /images/ui/panel_flat

  image-border: 6

  padding: 3

  size: 200 190

  Label

    id: label1

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 10

    margin-left: 5

    text: Poison

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label11

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 40

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: PoisonCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: CurePoison

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label2

    anchors.left: label1.left

    anchors.top: label1.bottom

    margin-top: 10

    text: Curse

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label22

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 44

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: CurseCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: CureCurse

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label3

    anchors.left: label2.left

    anchors.top: label2.bottom

    margin-top: 10

    text: Bleed

    color: #ffaa00

  font: verdana-11px-rounded

  Label

    id: label33

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 46

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: BleedCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: CureBleed

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label4

    anchors.left: label3.left

    anchors.top: label3.bottom

    margin-top: 10

    text: Burn

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label44

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 50

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: BurnCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: CureBurn

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label5

    anchors.left: label4.left

    anchors.top: label4.bottom

    margin-top: 10

    text: Electify

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label55

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 33

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: ElectrifyCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: CureElectrify

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label6

    anchors.left: label5.left

    anchors.top: label5.bottom

    margin-top: 10

    text: Paralyse

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label66

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 26

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: ParalyseCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: CureParalyse

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label7

    anchors.left: label6.left

    anchors.top: label6.bottom

    margin-top: 10

    margin-left: 12

    text: Spell:

    font: verdana-11px-rounded

  TextEdit

    id: ParalyseSpell

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 10

    width: 100

    font: verdana-11px-rounded

HoldConditions < Panel

  id: Hold

  image-source: /images/ui/panel_flat

  image-border: 6

  padding: 3

  size: 200 190

  Label

    id: label1

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 10

    margin-left: 5

    text: Haste

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label11

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 44

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: HasteCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: HoldHaste

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label2

    anchors.left: label1.left

    anchors.top: label1.bottom

    margin-top: 10

    margin-left: 12

    text: Spell:

    font: verdana-11px-rounded

  TextEdit

    id: HasteSpell

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 10

    width: 100

    font: verdana-11px-rounded

  Label

    id: label3

    anchors.left: label1.left

    anchors.top: label2.bottom

    margin-top: 10

    text: Utana Vid

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label33

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 21

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: UtanaCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: HoldUtana

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label4

    anchors.left: label3.left

    anchors.top: label3.bottom

    margin-top: 10

    text: Utamo Vita

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label44

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 12

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: UtamoCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: HoldUtamo

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label5

    anchors.left: label4.left

    anchors.top: label4.bottom

    margin-top: 10

    text: Recovery

    color: #ffaa00

    font: verdana-11px-rounded

  Label

    id: label55

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 20

    text: Mana:

    font: verdana-11px-rounded

  TextEdit

    id: UturaCost

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 40

    font: verdana-11px-rounded

  CheckBox

    id: HoldUtura

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: parent.right

    margin-right: 10

  Label

    id: label6

    anchors.left: label5.left

    anchors.top: label5.bottom

    margin-top: 10

    margin-left: 12

    text: Spell:

    font: verdana-11px-rounded

  UturaComboBox

    id: UturaType

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 10

    width: 100

    font: verdana-11px-rounded

  CheckBox

    id: IgnoreInPz

    anchors.left: label5.left

    anchors.top: label6.bottom

    margin-top: 12

  Label

    anchors.verticalCenter: IgnoreInPz.verticalCenter

    anchors.left: prev.right

    margin-top: 3

    margin-left: 5

    text: Don't Cast in Protection Zones

    font: cipsoftFont

  CheckBox

    id: StopHaste

    anchors.horizontalCenter: IgnoreInPz.horizontalCenter

    anchors.top: IgnoreInPz.bottom

    margin-top: 8

  Label

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-top: 3

    margin-left: 5

    text: Stop Haste if TargetBot Is Active

    font: cipsoftFont

ConditionsWindow < MainWindow

  !text: tr('Condition Manager')

  size: 445 280

  @onEscape: self:hide()

  CureConditions

    id: Cure

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 7

  Label

    id: label

    anchors.top: parent.top

    anchors.left: parent.left

    text: Cure Conditions

    color: #88e3dd

    margin-left: 10

    font: verdana-11px-rounded

  HoldConditions

    id: Hold

    anchors.top: parent.top

    anchors.right: parent.right

    margin-top: 7

  Label

    id: label

    anchors.top: parent.top

    anchors.right: parent.right

    text: Hold Conditions

    color: #88e3dd

    margin-right: 100

    font: verdana-11px-rounded

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

```

---
# Containers.lua
```lua

setDefaultTab("Tools")

local panelName = "renameContainers"

if type(storage[panelName]) ~= "table" then

    storage[panelName] = {

        enabled = false;

        height = 170,

        purse = true;

        list = {

{

                value = "Main Backpack",

                enabled = true,

                item = 9601,

                min = false,

                items = { 3081, 3048 }

},

{

                value = "Runes",

                enabled = true,

                item = 2866,

                min = true,

                items = { 3161, 3180 }

},

{

                value = "Money",

                enabled = true,

                item = 2871,

                min = true,

                items = { 3031, 3035, 3043 }

},

{

                value = "Purse",

                enabled = true,

                item = 23396,

                min = true,

                items = {}

},

}

}

end

local config = storage[panelName]

UI.Separator()

local renameContui = setupUI([[

Panel

  height: 50

  Label

    text-align: center

    text: Container Panel

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    font: verdana-11px-rounded

  BotSwitch

    id: title

    anchors.top: prev.bottom

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('Open Minimised')

    font: verdana-11px-rounded

  Button

    id: editContList

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

    font: verdana-11px-rounded

  Button

    id: reopenCont

    !text: tr('Reopen All')

    anchors.left: parent.left

    anchors.top: prev.bottom

    anchors.right: parent.horizontalCenter

    margin-right: 2

    height: 17

    margin-top: 3

    font: verdana-11px-rounded

  Button

    id: minimiseCont

    !text: tr('Minimise All')

    anchors.top: prev.top

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    margin-right: 2

    height: 17

    font: verdana-11px-rounded

  ]])

renameContui:setId(panelName)

g_ui.loadUIFromString([[

BackpackName < Label

  background-color: alpha

  text-offset: 18 2

  focusable: true

  height: 17

  font: verdana-11px-rounded

  CheckBox

    id: enabled

    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter

    width: 15

    height: 15

    margin-top: 1

    margin-left: 3

  $focus:

    background-color: #00000055

  Button

    id: state

    !text: tr('M')

    anchors.right: remove.left

    anchors.verticalCenter: parent.verticalCenter

    margin-right: 1

    width: 15

    height: 15

  Button

    id: remove

    !text: tr('X')

    !tooltip: tr('Remove')

    anchors.right: parent.right

    anchors.verticalCenter: parent.verticalCenter

    margin-right: 15

    width: 15

    height: 15

  Button

    id: openNext

    !text: tr('N')

    anchors.right: state.left

    anchors.verticalCenter: parent.verticalCenter

    margin-right: 1

    width: 15

    height: 15

    tooltip: Open container inside with the same ID.

ContListsWindow < MainWindow

  !text: tr('Container Names')

  size: 465 170

  @onEscape: self:hide()

  TextList

    id: itemList

    anchors.left: parent.left

    anchors.top: parent.top

    anchors.bottom: separator.top

    width: 200

    margin-bottom: 6

    margin-top: 3

    margin-left: 3

    vertical-scrollbar: itemListScrollBar

  VerticalScrollBar

    id: itemListScrollBar

    anchors.top: itemList.top

    anchors.bottom: itemList.bottom

    anchors.right: itemList.right

    step: 14

    pixels-scroll: true

  VerticalSeparator

    id: sep

    anchors.top: parent.top

    anchors.left: itemList.right

    anchors.bottom: separator.top

    margin-top: 3

    margin-bottom: 6

    margin-left: 10

  Label

    id: lblName

    anchors.left: sep.right

    anchors.top: sep.top

    width: 70

    text: Name:

    margin-left: 10

    margin-top: 3

    font: verdana-11px-rounded

  TextEdit

    id: contName

    anchors.left: lblName.right

    anchors.top: sep.top

    anchors.right: parent.right

    font: verdana-11px-rounded

  Label

    id: lblCont

    anchors.left: lblName.left

    anchors.verticalCenter: contId.verticalCenter

    width: 70

    text: Container:

    font: verdana-11px-rounded

  BotItem

    id: contId

    anchors.left: contName.left

    anchors.top: contName.bottom

    margin-top: 3

  BotContainer

    id: sortList

    anchors.left: prev.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    anchors.bottom: separator.top

    margin-bottom: 6

    margin-top: 3

  Label

    anchors.left: lblCont.left

    anchors.verticalCenter: sortList.verticalCenter

    width: 70

    text: Items:

    font: verdana-11px-rounded

  Button

    id: addItem

    anchors.right: contName.right

    anchors.top: contName.bottom

    margin-top: 5

    text: Add

    width: 40

    font: cipsoftFont

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  CheckBox

    id: purse

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    text: Open Purse

    tooltip: Opens Store/Charm Purse

    width: 85

    height: 15

    margin-top: 2

    margin-left: 3

    font: verdana-11px-rounded

  CheckBox

    id: sort

    anchors.left: prev.right

    anchors.bottom: parent.bottom

    text: Sort Items

    tooltip: Sort items based on items widget

    width: 85

    height: 15

    margin-top: 2

    margin-left: 15

    font: verdana-11px-rounded

  CheckBox

    id: forceOpen

    anchors.left: prev.right

    anchors.bottom: parent.bottom

    text: Keep Open

    tooltip: Will keep open containers all the time

    width: 85

    height: 15

    margin-top: 2

    margin-left: 15

    font: verdana-11px-rounded

  CheckBox

    id: lootBag

    anchors.left: prev.right

    anchors.bottom: parent.bottom

    text: Loot Bag

    tooltip: Open Loot Bag (gunzodus franchaise)

    width: 85

    height: 15

    margin-top: 2

    margin-left: 15

    font: verdana-11px-rounded

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

  ResizeBorder

    id: bottomResizeBorder

    anchors.fill: separator

    height: 3

    minimum: 170

    maximum: 245

    margin-left: 3

    margin-right: 3

    background: #ffffff88

]])

function findItemsInArray(t, tfind)

    local tArray = {}

    for x,v in pairs(t) do

        if type(v) == "table" then

            local aItem = t[x].item

            local aEnabled = t[x].enabled

                if aItem then

                    if tfind and aItem == tfind then

                        return x

                    elseif not tfind then

                        if aEnabled then

                            table.insert(tArray, aItem)

                        end

                    end

                end

            end

        end

    if not tfind then return tArray end

end

local lstBPs

local openContainer = function(id)

    local t = {getRight(), getLeft(), getAmmo()} -- if more slots needed then add them here

    for i=1,#t do

        local slotItem = t[i]

        if slotItem and slotItem:getId() == id then

            return g_game.open(slotItem, nil)

        end

    end

    for i, container in pairs(g_game.getContainers()) do

        for i, item in ipairs(container:getItems()) do

            if item:isContainer() and item:getId() == id then

                return g_game.open(item, nil)

            end

        end

    end

end

function reopenBackpacks()

    lstBPs = findItemsInArray(config.list)

    for _, container in pairs(g_game.getContainers()) do g_game.close(container) end

    bpItem = getBack()

    if bpItem ~= nil then

        g_game.open(bpItem)

    end

    schedule(500, function()

        local delay = 200

        if config.purse then

            local item = getPurse()

            if item then

                use(item)

            end

        end

        for i=1,#lstBPs do

            schedule(delay, function()

                openContainer(lstBPs[i])

            end)

            delay = delay + 250

        end

    end)

end

rootWidget = g_ui.getRootWidget()

if rootWidget then

    contListWindow = UI.createWindow('ContListsWindow', rootWidget)

    contListWindow:hide()

    contListWindow.onGeometryChange = function(widget, old, new)

        if old.height == 0 then return end

        config.height = new.height

    end

    contListWindow:setHeight(config.height or 170)

    renameContui.editContList.onClick = function(widget)

        contListWindow:show()

        contListWindow:raise()

        contListWindow:focus()

    end

    renameContui.reopenCont.onClick = function(widget)

        reopenBackpacks()

    end

    renameContui.minimiseCont.onClick = function(widget)

        for i, container in ipairs(getContainers()) do

            local containerWindow = container.window

            containerWindow:setContentHeight(34)

        end

    end

    renameContui.title:setOn(config.enabled)

    renameContui.title.onClick = function(widget)

        config.enabled = not config.enabled

        widget:setOn(config.enabled)

    end

    contListWindow.closeButton.onClick = function(widget)

        contListWindow:hide()

    end

    contListWindow.purse.onClick = function(widget)

        config.purse = not config.purse

        contListWindow.purse:setChecked(config.purse)

    end

    contListWindow.purse:setChecked(config.purse)

    contListWindow.sort.onClick = function(widget)

        config.sort = not config.sort

        contListWindow.sort:setChecked(config.sort)

    end

    contListWindow.sort:setChecked(config.sort)

    contListWindow.forceOpen.onClick = function(widget)

        config.forceOpen = not config.forceOpen

        contListWindow.forceOpen:setChecked(config.forceOpen)

    end

    contListWindow.forceOpen:setChecked(config.forceOpen)

    contListWindow.lootBag.onClick = function(widget)

        config.lootBag = not config.lootBag

        contListWindow.lootBag:setChecked(config.lootBag)

    end

    contListWindow.lootBag:setChecked(config.lootBag)

    local function refreshSortList(k, t)

        t = t or {}

        UI.Container(function()

            t = contListWindow.sortList:getItems()

            config.list[k].items = t

            end, true, nil, contListWindow.sortList)

        contListWindow.sortList:setItems(t)

    end

    refreshSortList(t)

    local refreshContNames = function(tFocus)

        local storageVal = config.list

        if storageVal and #storageVal > 0 then

            for i, child in pairs(contListWindow.itemList:getChildren()) do

                child:destroy()

            end

            for k, entry in pairs(storageVal) do

                local label = g_ui.createWidget("BackpackName", contListWindow.itemList)

                label.onMouseRelease = function()

                    contListWindow.contId:setItemId(entry.item)

                    contListWindow.contName:setText(entry.value)

                    if not entry.items then

                        entry.items = {}

                    end

                    contListWindow.sortList:setItems(entry.items)

                    refreshSortList(k, entry.items)

                end

                label.enabled.onClick = function(widget)

                    entry.enabled = not entry.enabled

                    label.enabled:setChecked(entry.enabled)

                    label.enabled:setTooltip(entry.enabled and 'Disable' or 'Enable')

                    label.enabled:setImageColor(entry.enabled and '#00FF00' or '#FF0000')

                end

                label.remove.onClick = function(widget)

                    table.removevalue(config.list, entry)

                    label:destroy()

                end

                label.state:setChecked(entry.min)

                label.state.onClick = function(widget)

                    entry.min = not entry.min

                    label.state:setChecked(entry.min)

                    label.state:setColor(entry.min and '#00FF00' or '#FF0000')

                    label.state:setTooltip(entry.min and 'Open Minimised' or 'Do not minimise')

                end

                label.openNext.onClick = function(widget)

                    entry.openNext = not entry.openNext

                    label.openNext:setChecked(entry.openNext)

                    label.openNext:setColor(entry.openNext and '#00FF00' or '#FF0000')

                end

                label:setText(entry.value)

                label.enabled:setChecked(entry.enabled)

                label.enabled:setTooltip(entry.enabled and 'Disable' or 'Enable')

                label.enabled:setImageColor(entry.enabled and '#00FF00' or '#FF0000')

                label.state:setColor(entry.min and '#00FF00' or '#FF0000')

                label.state:setTooltip(entry.min and 'Open Minimised' or 'Do not minimise')

                label.openNext:setColor(entry.openNext and '#00FF00' or '#FF0000')

                if tFocus and entry.item == tFocus then

                    tFocus = label

                end

            end

            if tFocus then contListWindow.itemList:focusChild(tFocus) end

        end

    end

    contListWindow.addItem.onClick = function(widget)

        local id = contListWindow.contId:getItemId()

        local trigger = contListWindow.contName:getText()

        if id > 100 and trigger:len() > 0 then

            local ifind = findItemsInArray(config.list, id)

            if ifind then

                config.list[ifind] = { item = id, value = trigger, enabled = config.list[ifind].enabled, min = config.list[ifind].min, items = config.list[ifind].items}

            else

                table.insert(config.list, { item = id, value = trigger, enabled = true, min = false, items = {} })

            end

            contListWindow.contId:setItemId(0)

            contListWindow.contName:setText('')

            contListWindow.contName:setColor('white')

            contListWindow.contName:setImageColor('#ffffff')

            contListWindow.contId:setImageColor('#ffffff')

            refreshContNames(id)

        else

            contListWindow.contId:setImageColor('red')

            contListWindow.contName:setImageColor('red')

            contListWindow.contName:setColor('red')

        end

    end

    refreshContNames()

end

onContainerOpen(function(container, previousContainer)

    if not container.window then return end

    local containerWindow = container.window

    if not previousContainer then

        containerWindow:setContentHeight(34)

    end

    local storageVal = config.list

    if storageVal and #storageVal > 0 then

        for _, entry in pairs(storageVal) do

            if entry.enabled and string.find(container:getContainerItem():getId(), entry.item) then

                if entry.min then

                    containerWindow:minimize()

                end

                if renameContui.title:isOn() then

                    containerWindow:setText(entry.value)

                end

                if entry.openNext then

                    for i, item in ipairs(container:getItems()) do

                        if item:getId() == entry.item then

                            local time = #storageVal * 250

                            schedule(time, function()

                                time = time + 250

                                g_game.open(item)

                            end)

                        end

                    end

                end

            end

        end

    end

end)

local function nameContainersOnLogin()

    for i, container in ipairs(getContainers()) do

        if renameContui.title:isOn() then

            if not container.window then return end

            local containerWindow = container.window

            local storageVal = config.list

            if storageVal and #storageVal > 0 then

                for _, entry in pairs(storageVal) do

                    if entry.enabled and string.find(container:getContainerItem():getId(), entry.item) then

                        containerWindow:setText(entry.value)

                    end

                end

            end

        end

    end

end

nameContainersOnLogin()

local function moveItem(item, destination)

    return g_game.move(item, destination:getSlotPosition(destination:getItemsCount()), item:getCount())

end

local function properTable(t)

    local r = {}

    for _, entry in pairs(t) do

      if type(entry) == "number" then

        table.insert(r, entry)

      else

        table.insert(r, entry.id)

      end

    end

    return r

end

local mainLoop = macro(150, function(macro)

    if not config.sort and not config.purse then return end

    local storageVal = config.list

    for _, entry in pairs(storageVal) do

        local dId = entry.item

        local items = properTable(entry.items)

        -- sorting

        if config.sort then

            for _, container in pairs(getContainers()) do

                local cName = container:getName():lower()

                if not cName:find("depot") and not cName:find("depot") and not cName:find("quiver") then

                    local cId = container:getContainerItem():getId()

                    for __, item in ipairs(container:getItems()) do

                        local id = item:getId()

                        if table.find(items, id) and cId ~= dId then

                            local destination = getContainerByItem(dId, true)

                            if destination and not containerIsFull(destination) then

                                return moveItem(item, destination)

                            end

                        end

                    end

                end

            end

        end

        -- keep open / purse 23396

        if config.forceOpen then

            local container = getContainerByItem(dId)

            if not container then

                local t = {getBack(), getAmmo(), getFinger(), getNeck(), getLeft(), getRight()}

                for i=1,#t do

                    local slot = t[i]

                    if slot and slot:getId() == dId then

                        return g_game.open(slot)

                    end

                end

                local cItem = findItem(dId)

                if cItem then

                    return g_game.open(cItem)

                end

            end

        end

    end

    if config.purse and config.forceOpen and not getContainerByItem(23396) then

        return use(getPurse())

    end

    if config.lootBag and config.forceOpen and not getContainerByItem(23721) then

        if findItem(23721) then

            g_game.open(findItem(23721), getContainerByItem(23396))

        else

            return use(getPurse())

        end

    end

    macro:setOff()

end)

onContainerOpen(function(container, previousContainer)

    mainLoop:setOn()

end)

onAddItem(function(container, slot, item, oldItem)

    mainLoop:setOn()

end)

onPlayerInventoryChange(function(slot, item, oldItem)

    mainLoop:setOn()

end)

onContainerClose(function(container)

    if not container.lootContainer then

        mainLoop:setOn()

    end

end)

```

---
# Dropper.lua
```lua

setDefaultTab("Tools")

local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('Dropper')

  Button

    id: edit

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Edit

]])

local edit = setupUI([[

Panel

  height: 150

  Label

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 5

    text-align: center

    text: Trash:

  BotContainer

    id: TrashItems

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    height: 32

  Label

    anchors.top: prev.bottom

    margin-top: 5

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: center

    text: Use:

  BotContainer

    id: UseItems

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    height: 32

  Label

    anchors.top: prev.bottom

    margin-top: 5

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: center

    text: Drop if below 150 cap:

  BotContainer

    id: CapItems

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    height: 32

]])

edit:hide()

if not storage.dropper then

    storage.dropper = {

      enabled = false,

      trashItems = { 283, 284, 285 },

      useItems = { 21203, 14758 },

      capItems = { 21175 }

}

end

local config = storage.dropper

local showEdit = false

ui.edit.onClick = function(widget)

  showEdit = not showEdit

  if showEdit then

    edit:show()

  else

    edit:hide()

  end

end

ui.title:setOn(config.enabled)

ui.title.onClick = function(widget)

  config.enabled = not config.enabled

  ui.title:setOn(config.enabled)

end

UI.Container(function()

    config.trashItems = edit.TrashItems:getItems()

    end, true, nil, edit.TrashItems)

edit.TrashItems:setItems(config.trashItems)

UI.Container(function()

    config.useItems = edit.UseItems:getItems()

    end, true, nil, edit.UseItems)

edit.UseItems:setItems(config.useItems)

UI.Container(function()

    config.capItems = edit.CapItems:getItems()

    end, true, nil, edit.CapItems)

edit.CapItems:setItems(config.capItems)

local function properTable(t)

    local r = {}

    for _, entry in pairs(t) do

      table.insert(r, entry.id)

    end

    return r

end

macro(200, function()

    if not config.enabled then return end

    local tables = {properTable(config.capItems), properTable(config.useItems), properTable(config.trashItems)}

    local containers = getContainers()

    for i=1,3 do

        for _, container in pairs(containers) do

            for __, item in ipairs(container:getItems()) do

                for ___, userItem in ipairs(tables[i]) do

                    if item:getId() == userItem then

                        return i == 1 and freecap() < 150 and dropItem(item) or

                               i == 2 and use(item) or

                               i == 3 and dropItem(item)

                    end

                end

            end

        end

    end

end)

```

---
# Equipper.lua
```lua

local panelName = "EquipperPanel"

local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: switch

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('EQ Manager')

  Button

    id: setup

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

]])

ui:setId(panelName)

if not storage[panelName] or not storage[panelName].bosses then -- no bosses - old ver

    storage[panelName] = {

        enabled = false,

        rules = {},

        bosses = {}

}

end

local config = storage[panelName]

ui.switch:setOn(config.enabled)

ui.switch.onClick = function(widget)

  config.enabled = not config.enabled

  widget:setOn(config.enabled)

end

local conditions = { -- always add new conditions at the bottom

    "Item is available and not worn.", -- nothing 1

    "Monsters around is more than: ", -- spinbox 2

    "Monsters around is less than: ", -- spinbox 3

    "Health precent is below:", -- spinbox 4

    "Health precent is above:", -- spinbox 5

    "Mana precent is below:", -- spinbox 6

    "Mana precent is above:", -- spinbox 7

    "Target name is:", -- BotTextEdit 8

    "Hotkey is being pressed:", -- BotTextEdit 9

    "Player is paralyzed", -- nothing 10

    "Player is in protection zone", -- nothing 11

    "Players around is more than:", -- spinbox 12

    "Players around is less than:", -- spinbox 13

    "TargetBot Danger is Above:", -- spinbox 14

    "Blacklist player in range (sqm)", -- spinbox 15

    "Target is Boss" -- nothing

}

local conditionNumber = 1

local optionalConditionNumber = 2

local mainWindow = UI.createWindow("EquipWindow")

mainWindow:hide()

ui.setup.onClick = function()

    mainWindow:show()

    mainWindow:raise()

    mainWindow:focus()

end

local inputPanel = mainWindow.inputPanel

local listPanel = mainWindow.listPanel

local namePanel = mainWindow.profileName

local eqPanel = mainWindow.setup

local bossPanel = mainWindow.bossPanel

local slotWidgets = {eqPanel.head, eqPanel.body, eqPanel.legs, eqPanel.feet, eqPanel.neck, eqPanel["left-hand"], eqPanel["right-hand"], eqPanel.finger, eqPanel.ammo} -- back is disabled

local function setCondition(first, n)

    local widget

    local spinBox

    local textEdit

    if first then

        widget = inputPanel.condition.description.text

        spinBox = inputPanel.condition.spinbox

        textEdit = inputPanel.condition.text

    else

        widget = inputPanel.optionalCondition.description.text

        spinBox = inputPanel.optionalCondition.spinbox

        textEdit = inputPanel.optionalCondition.text

    end

    -- reset values after change

    spinBox:setValue(0)

    textEdit:setText('')

    if n == 1 or n == 10 or n == 11 or n == 16 then

        spinBox:hide()

        textEdit:hide()

    elseif n == 9 or n == 8 then

        spinBox:hide()

        textEdit:show()

        if n == 9 then

            textEdit:setWidth(75)

        else

            textEdit:setWidth(200)

        end

    else

        spinBox:show()

        textEdit:hide()

    end

    widget:setText(conditions[n])

end

local function resetFields()

    conditionNumber = 1

    optionalConditionNumber = 2

    setCondition(false, optionalConditionNumber)

    setCondition(true, conditionNumber)

    for i, widget in ipairs(slotWidgets) do

        widget:setItemId(0)

        widget:setChecked(false)

    end

    for i, child in ipairs(listPanel.list:getChildren()) do

        child.display = false

    end

    namePanel.profileName:setText("")

    inputPanel.condition.text:setText('')

    inputPanel.condition.spinbox:setValue(0)

    inputPanel.useSecondCondition:setText('-')

    inputPanel.optionalCondition.text:setText('')

    inputPanel.optionalCondition.spinbox:setValue(0)

    inputPanel.optionalCondition:hide()

    bossPanel:hide()

    listPanel:show()

    mainWindow.bossList:setText('Boss List')

    bossPanel.name:setText('')

end

resetFields()

mainWindow.closeButton.onClick = function()

    resetFields()

    mainWindow:hide()

end

inputPanel.optionalCondition:hide()

inputPanel.useSecondCondition.onOptionChange = function(widget, option, data)

    if option ~= "-" then

        inputPanel.optionalCondition:show()

    else

        inputPanel.optionalCondition:hide()

    end

end

-- add default text & windows

setCondition(true, 1)

setCondition(false, 2)

-- in/de/crementation buttons

inputPanel.condition.nex.onClick = function()

    local max = #conditions

    if inputPanel.optionalCondition:isVisible() then

        if conditionNumber == max then

            if optionalConditionNumber == 1 then

                conditionNumber = 2

            else

                conditionNumber = 1

            end

        else

            local futureNumber = conditionNumber + 1

            local safeFutureNumber = conditionNumber + 2 > max and 1 or conditionNumber + 2

            conditionNumber = futureNumber ~= optionalConditionNumber and futureNumber or safeFutureNumber

        end

    else

        conditionNumber = conditionNumber == max and 1 or conditionNumber + 1

        if optionalConditionNumber == conditionNumber then

            optionalConditionNumber = optionalConditionNumber == max and 1 or optionalConditionNumber + 1

            setCondition(false, optionalConditionNumber)

        end

    end

    setCondition(true, conditionNumber)

end

inputPanel.condition.pre.onClick = function()

    local max = #conditions

    if inputPanel.optionalCondition:isVisible() then

        if conditionNumber == 1 then

            if optionalConditionNumber == max then

                conditionNumber = max-1

            else

                conditionNumber = max

            end

        else

            local futureNumber = conditionNumber - 1

            local safeFutureNumber = conditionNumber - 2 < 1 and max or conditionNumber - 2

            conditionNumber = futureNumber ~= optionalConditionNumber and futureNumber or safeFutureNumber

        end

    else

        conditionNumber = conditionNumber == 1 and max or conditionNumber - 1

        if optionalConditionNumber == conditionNumber then

            optionalConditionNumber = optionalConditionNumber == 1 and max or optionalConditionNumber - 1

            setCondition(false, optionalConditionNumber)

        end

    end

    setCondition(true, conditionNumber)

end

inputPanel.optionalCondition.nex.onClick = function()

    local max = #conditions

    if optionalConditionNumber == max then

        if conditionNumber == 1 then

            optionalConditionNumber = 2

        else

            optionalConditionNumber = 1

        end

    else

        local futureNumber = optionalConditionNumber + 1

        local safeFutureNumber = optionalConditionNumber + 2 > max and 1 or optionalConditionNumber + 2

        optionalConditionNumber = futureNumber ~= conditionNumber and futureNumber or safeFutureNumber

    end

    setCondition(false, optionalConditionNumber)

end

inputPanel.optionalCondition.pre.onClick = function()

    local max = #conditions

    if optionalConditionNumber == 1 then

        if conditionNumber == max then

            optionalConditionNumber = max-1

        else

            optionalConditionNumber = max

        end

    else

        local futureNumber = optionalConditionNumber - 1

        local safeFutureNumber = optionalConditionNumber - 2 < 1 and max or optionalConditionNumber - 2

        optionalConditionNumber = futureNumber ~= conditionNumber and futureNumber or safeFutureNumber

    end

    setCondition(false, optionalConditionNumber)

end

listPanel.up.onClick = function(widget)

    local focused = listPanel.list:getFocusedChild()

    local n = listPanel.list:getChildIndex(focused)

    local t = config.rules

    t[n], t[n-1] = t[n-1], t[n]

    if n-1 == 1 then

      widget:setEnabled(false)

    end

    listPanel.down:setEnabled(true)

    listPanel.list:moveChildToIndex(focused, n-1)

    listPanel.list:ensureChildVisible(focused)

end

listPanel.down.onClick = function(widget)

    local focused = listPanel.list:getFocusedChild()

    local n = listPanel.list:getChildIndex(focused)

    local t = config.rules

    t[n], t[n+1] = t[n+1], t[n]

    if n + 1 == listPanel.list:getChildCount() then

      widget:setEnabled(false)

    end

    listPanel.up:setEnabled(true)

    listPanel.list:moveChildToIndex(focused, n+1)

    listPanel.list:ensureChildVisible(focused)

end

eqPanel.cloneEq.onClick = function(widget)

    eqPanel.head:setItemId(getHead() and getHead():getId() or 0)

    eqPanel.body:setItemId(getBody() and getBody():getId() or 0)

    eqPanel.legs:setItemId(getLeg() and getLeg():getId() or 0)

    eqPanel.feet:setItemId(getFeet() and getFeet():getId() or 0)

    eqPanel.neck:setItemId(getNeck() and getNeck():getId() or 0)

    eqPanel["left-hand"]:setItemId(getLeft() and getLeft():getId() or 0)

    eqPanel["right-hand"]:setItemId(getRight() and getRight():getId() or 0)

    eqPanel.finger:setItemId(getFinger() and getFinger():getId() or 0)

    eqPanel.ammo:setItemId(getAmmo() and getAmmo():getId() or 0)

end

eqPanel.default.onClick = resetFields

-- buttons disabled by default

listPanel.up:setEnabled(false)

listPanel.down:setEnabled(false)

-- correct background image

for i, widget in ipairs(slotWidgets) do

    widget:setTooltip("Right click to set as slot to unequip")

    widget.onItemChange = function(widget)

        local selfId = widget:getItemId()

        widget:setOn(selfId > 100)

        if widget:isChecked() then

            widget:setChecked(selfId < 100)

        end

    end

    widget.onMouseRelease = function(widget, mousePos, mouseButton)

        if mouseButton == 2 then

            local clearItem = widget:isChecked() == false

            widget:setChecked(not widget:isChecked())

            if clearItem then

                widget:setItemId(0)

            end

        end

    end

end

inputPanel.condition.description.onMouseWheel = function(widget, mousePos, scroll)

    if scroll == 1 then

        inputPanel.condition.nex.onClick()

    else

        inputPanel.condition.pre.onClick()

    end

end

inputPanel.optionalCondition.description.onMouseWheel = function(widget, mousePos, scroll)

    if scroll == 1 then

        inputPanel.optionalCondition.nex.onClick()

    else

        inputPanel.optionalCondition.pre.onClick()

    end

end

namePanel.profileName.onTextChange = function(widget, text)

    local button = inputPanel.add

    text = text:lower()

    for i, child in ipairs(listPanel.list:getChildren()) do

        local name = child:getText():lower()

        button:setText(name == text and "Overwrite" or "Add Rule")

        button:setTooltip(name == text and "Overwrite existing rule named: "..name, "Add new rule to the list: "..name)

    end

end

local function setupPreview(display, data)

    namePanel.profileName:setText('')

    if not display then

        resetFields()

    else

        for i, value in ipairs(data) do

            local widget = slotWidgets[i]

            if value == false then

                widget:setChecked(false)

                widget:setItemId(0)

            elseif value == true then

                widget:setChecked(true)

                widget:setItemId(0)

            else

                widget:setChecked(false)

                widget:setItemId(value)

            end

        end

    end

end

local function refreshRules()

    local list = listPanel.list

    list:destroyChildren()

    for i,v in ipairs(config.rules) do

        local widget = UI.createWidget('Rule', list)

        widget:setId(v.name)

        widget:setText(v.name)

        widget.ruleData = v

        widget.remove.onClick = function()

            widget:destroy()

            table.remove(config.rules, table.find(config.rules, v))

            listPanel.up:setEnabled(false)

            listPanel.down:setEnabled(false)

            refreshRules()

        end

        widget.visible:setColor(v.visible and "green" or "red")

        widget.visible.onClick = function()

            v.visible = not v.visible

            widget.visible:setColor(v.visible and "green" or "red")

        end

        widget.enabled:setChecked(v.enabled)

        widget.enabled.onClick = function()

            v.enabled = not v.enabled

            widget.enabled:setChecked(v.enabled)

        end

        widget.onHoverChange = function(widget, hover)

            for i, child in ipairs(list:getChildren()) do

                if child.display then return end

            end

            setupPreview(hover, widget.ruleData.data)

        end

        widget.onDoubleClick = function(widget)

            local ruleData = widget.ruleData

            widget.display = true

            setupPreview(true, ruleData.data)

            conditionNumber = ruleData.mainCondition

            optionalConditionNumber = ruleData.optionalCondition

            setCondition(false, optionalConditionNumber)

            setCondition(true, conditionNumber)

            inputPanel.useSecondCondition:setOption(ruleData.relation)

            namePanel.profileName:setText(v.name)

            if type(ruleData.mainValue) == "string" then

                inputPanel.condition.text:setText(ruleData.mainValue)

            elseif type(ruleData.mainValue) == "number" then

                inputPanel.condition.spinbox:setValue(ruleData.mainValue)

            end

            if type(ruleData.optValue) == "string" then

                inputPanel.optionalCondition.text:setText(ruleData.optValue)

            elseif type(ruleData.optValue) == "number" then

                inputPanel.optionalCondition.spinbox:setValue(ruleData.optValue)

            end

        end

        widget.onClick = function()

            local panel = listPanel

            if #panel.list:getChildren() == 1 then

                panel.up:setEnabled(false)

                panel.down:setEnabled(false)

            elseif panel.list:getChildIndex(panel.list:getFocusedChild()) == 1 then

                panel.up:setEnabled(false)

                panel.down:setEnabled(true)

            elseif panel.list:getChildIndex(panel.list:getFocusedChild()) == #panel.list:getChildren() then

                panel.up:setEnabled(true)

                panel.down:setEnabled(false)

            else

                panel.up:setEnabled(true)

                panel.down:setEnabled(true)

            end

        end

    end

end

refreshRules()

inputPanel.add.onClick = function(widget)

    local mainVal

    local optVal

    local t = {}

    local relation = inputPanel.useSecondCondition:getText()

    local profileName = namePanel.profileName:getText()

    if profileName:len() == 0 then

        return warn("Please fill profile name!")

    end

    for i, widget in ipairs(slotWidgets) do

        local checked = widget:isChecked()

        local id = widget:getItemId()

        if checked then

            table.insert(t, true) -- unequip selected slot

        elseif id then

            table.insert(t, id) -- equip selected item

        else

            table.insert(t, false) -- ignore slot

        end

    end

    if conditionNumber == 1 then

        mainVal = nil

    elseif conditionNumber == 8 then

        mainVal = inputPanel.condition.text:getText()

        if mainVal:len() == 0 then

            return warn("[vBot Equipper] Please fill the name of the creature.")

        end

    elseif conditionNumber == 9 then

        mainVal = inputPanel.condition.text:getText()

        if mainVal:len() == 0 then

            return warn("[vBot Equipper] Please set correct hotkey.")

        end

    else

        mainVal = inputPanel.condition.spinbox:getValue()

    end

    if relation ~= "-" then

        if optionalConditionNumber == 1 then

            optVal = nil

        elseif optionalConditionNumber == 8 then

            optVal = inputPanel.optionalCondition.text:getText()

            if optVal:len() == 0 then

                return warn("[vBot Equipper] Please fill the name of the creature.")

            end

        elseif optionalConditionNumber == 9 then

            optVal = inputPanel.optionalCondition.text:getText()

            if optVal:len() == 0 then

                return warn("[vBot Equipper] Please set correct hotkey.")

            end

        else

            optVal = inputPanel.optionalCondition.spinbox:getValue()

        end

    end

    local index

    for i, v in ipairs(config.rules) do

        if v.name == profileName then

            index = i   -- search if there's already rule with this name

        end

    end

    local ruleData = {

        name = profileName,

        data = t,

        enabled = true,

        visible = true,

        mainCondition = conditionNumber,

        optionalCondition = optionalConditionNumber,

        mainValue = mainVal,

        optValue = optVal,

        relation = relation,

}

    if index then

        config.rules[index] = ruleData -- overwrite

    else

        table.insert(config.rules, ruleData) -- create new one

    end

    for i, child in ipairs(listPanel.list:getChildren()) do

        child.display = false

    end

    resetFields()

    refreshRules()

end

mainWindow.bossList.onClick = function(widget)

    if bossPanel:isVisible() then

        bossPanel:hide()

        listPanel:show()

        widget:setText('Boss List')

    else

        bossPanel:show()

        listPanel:hide()

        widget:setText('Rule List')

    end

end

-- create boss labels

for i, v in ipairs(config.bosses) do

    local widget = UI.createWidget("BossLabel", bossPanel.list)

    widget:setText(v)

    widget.remove.onClick = function()

        table.remove(config.bosses, table.find(config.bosses, v))

        widget:destroy()

    end

end

bossPanel.add.onClick = function()

    local name = bossPanel.name:getText()

    if name:len() == 0 then

        return warn("[Equipped] Please enter boss name!")

    elseif table.find(config.bosses, name:lower(), true) then

        return warn("[Equipper] Boss already added!")

    end

    local widget = UI.createWidget("BossLabel", bossPanel.list)

    widget:setText(name)

    widget.remove.onClick = function()

        table.remove(config.bosses, table.find(config.bosses, name))

        widget:destroy()

    end

    table.insert(config.bosses, name)

    bossPanel.name:setText('')

end

local function interpreteCondition(n, v)

    if n == 1 then

        return true

    elseif n == 2 then

        return getMonsters() > v

    elseif n == 3 then

        return getMonsters() < v

    elseif n == 4 then

        return hppercent() < v

    elseif n == 5 then

        return hppercent() > v

    elseif n == 6 then

        return manapercent() < v

    elseif n == 7 then

        return manapercent() > v

    elseif n == 8 then

        return target() and target():getName():lower() == v:lower() or false

    elseif n == 9 then

        return g_keyboard.isKeyPressed(v)

    elseif n == 10 then

        return isParalyzed()

    elseif n == 11 then

        return isInPz()

    elseif n == 12 then

        return getPlayers() > v

    elseif n == 13 then

        return getPlayers() < v

    elseif n == 14 then

        return TargetBot.Danger() > v and TargetBot.isOn()

    elseif n == 15 then

        return isBlackListedPlayerInRange(v)

    elseif n == 16 then

        return target() and table.find(config.bosses, target():getName():lower(), true) and true or false

    end

end

local function finalCheck(first,relation,second)

    if relation == "-" then

        return first

    elseif relation == "and" then

        return first and second

    elseif relation == "or" then

        return first or second

    end

end

local function isEquipped(id)

    local t = {getNeck(), getHead(), getBody(), getRight(), getLeft(), getLeg(), getFeet(), getFinger(), getAmmo()}

    local ids = {id, getInactiveItemId(id), getActiveItemId(id)}

    for i, slot in pairs(t) do

        if slot and table.find(ids, slot:getId()) then

            return true

        end

    end

    return false

end

local function unequipItem(table)

    local slots = {getHead(), getBody(), getLeg(), getFeet(), getNeck(), getLeft(), getRight(), getFinger(), getAmmo()}

    if type(table) ~= "table" then return end

    for i, slot in ipairs(table) do

        local physicalSlot = slots[i]

        if slot == true and physicalSlot then

            local id = physicalSlot:getId()

            if g_game.getClientVersion() >= 910 then

                -- new tibia

                g_game.equipItemId(id)

            else

                -- old tibia

                local dest

                for i, container in ipairs(getContainers()) do

                    local cname = container:getName()

                    if not containerIsFull(container) then

                        if not cname:find("loot") and (cname:find("backpack") or cname:find("bag") or cname:find("chess")) then

                            dest = container

                        end

                        break

                    end

                end

                if not dest then return true end

                local pos = dest:getSlotPosition(dest:getItemsCount())

                g_game.move(physicalSlot, pos, physicalSlot:getCount())

            end

            return true

        end

    end

    return false

end

local function equipItem(id, slot)

    -- need to correct slots...

    if slot == 2 then

        slot = 4

    elseif slot == 3 then

        slot = 7

    elseif slot == 8 then

        slot = 9

    elseif slot == 5 then

        slot = 2

    elseif slot == 4 then

        slot = 8

    elseif slot == 9 then

        slot = 10

    elseif slot == 7 then

        slot = 5

    end

    if g_game.getClientVersion() >= 910 then

        -- new tibia

        return g_game.equipItemId(id)

    else

        -- old tibia

        local item = findItem(id)

        return moveToSlot(item, slot)

    end

end

local function markChild(child)

    if mainWindow:isVisible() then

        for i, child in ipairs(listPanel.list:getChildren()) do

            if child ~= widget then

                child:setColor('white')

            end

        end

        widget:setColor('green')

    end

end

local missingItem = false

local lastRule = false

local correctEq = false

EquipManager = macro(50, function()

    if not config.enabled then return end

    if #config.rules == 0 then return end

    for i, widget in ipairs(listPanel.list:getChildren()) do

        local rule = widget.ruleData

        if rule.enabled then

            -- conditions

            local firstCondition = interpreteCondition(rule.mainCondition, rule.mainValue)

            local optionalCondition = nil

            if rule.relation ~= "-" then

                optionalCondition = interpreteCondition(rule.optionalCondition, rule.optValue)

            end

            -- checks

            if finalCheck(firstCondition, rule.relation, optionalCondition) then

                -- performance edits, loop reset

                local resetLoop = not missingItem and correctEq and lastRule ==  rule

                if resetLoop then return end

                -- reset executed rule

                -- first check unequip

                if unequipItem(rule.data) == true then

                    delay(200)

                    return

                end

                -- equiploop

                for slot, item in ipairs(rule.data) do

                    if type(item) == "number" and item > 100 then

                        if not isEquipped(item) then

                            if rule.visible then

                                if findItem(item) then

                                    missingItem = false

                                    delay(200)

                                    return equipItem(item, slot)

                                else

                                    missingItem = true

                                end

                            else

                                missingItem = false

                                delay(200)

                                return equipItem(item, slot)

                            end

                        end

                    end

                end

                correctEq = not missingItem and true or false

                -- even if nothing was done, exit function to hold rule

                return

            end

        end

    end

end)

```

---
# HealBot.lua
```lua

local standBySpells = false

local standByItems = false

local red = "#ff0800" -- "#ff0800" / #ea3c53 best

local blue = "#7ef9ff"

setDefaultTab("HP")

local healPanelName = "healbot"

local ui = setupUI([[

Panel

  height: 38

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('HealBot')

  Button

    id: settings

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

  Button

    id: 1

    anchors.top: prev.bottom

    anchors.left: parent.left

    text: 1

    margin-right: 2

    margin-top: 4

    size: 17 17

  Button

    id: 2

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 2

    margin-left: 4

    size: 17 17

  Button

    id: 3

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 3

    margin-left: 4

    size: 17 17

  Button

    id: 4

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 4

    margin-left: 4

    size: 17 17

  Button

    id: 5

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    text: 5

    margin-left: 4

    size: 17 17

  Label

    id: name

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    anchors.right: parent.right

    text-align: center

    margin-left: 4

    height: 17

    text: Profile #1

    background: #292A2A

]])

ui:setId(healPanelName)

if not HealBotConfig[healPanelName] or not HealBotConfig[healPanelName][1] or #HealBotConfig[healPanelName] ~= 5 then

  HealBotConfig[healPanelName] = {

    [1] = {

      enabled = false,

      spellTable = {},

      itemTable = {},

      name = "Profile #1",

      Visible = true,

      Cooldown = true,

      Interval = true,

      Conditions = true,

      Delay = true,

      MessageDelay = false

},

    [2] = {

      enabled = false,

      spellTable = {},

      itemTable = {},

      name = "Profile #2",

      Visible = true,

      Cooldown = true,

      Interval = true,

      Conditions = true,

      Delay = true,

      MessageDelay = false

},

    [3] = {

      enabled = false,

      spellTable = {},

      itemTable = {},

      name = "Profile #3",

      Visible = true,

      Cooldown = true,

      Interval = true,

      Conditions = true,

      Delay = true,

      MessageDelay = false

},

    [4] = {

      enabled = false,

      spellTable = {},

      itemTable = {},

      name = "Profile #4",

      Visible = true,

      Cooldown = true,

      Interval = true,

      Conditions = true,

      Delay = true,

      MessageDelay = false

},

    [5] = {

      enabled = false,

      spellTable = {},

      itemTable = {},

      name = "Profile #5",

      Visible = true,

      Cooldown = true,

      Interval = true,

      Conditions = true,

      Delay = true,

      MessageDelay = false

},

}

end

if not HealBotConfig.currentHealBotProfile or HealBotConfig.currentHealBotProfile == 0 or HealBotConfig.currentHealBotProfile > 5 then

  HealBotConfig.currentHealBotProfile = 1

end

-- finding correct table, manual unfortunately

local currentSettings

local setActiveProfile = function()

  local n = HealBotConfig.currentHealBotProfile

  currentSettings = HealBotConfig[healPanelName][n]

end

setActiveProfile()

local activeProfileColor = function()

  for i=1,5 do

    if i == HealBotConfig.currentHealBotProfile then

      ui[i]:setColor("green")

    else

      ui[i]:setColor("white")

    end

  end

end

activeProfileColor()

ui.title:setOn(currentSettings.enabled)

ui.title.onClick = function(widget)

  currentSettings.enabled = not currentSettings.enabled

  widget:setOn(currentSettings.enabled)

  vBotConfigSave("heal")

end

ui.settings.onClick = function(widget)

  healWindow:show()

  healWindow:raise()

  healWindow:focus()

end

rootWidget = g_ui.getRootWidget()

if rootWidget then

  healWindow = UI.createWindow('HealWindow', rootWidget)

  healWindow:hide()

  healWindow.onVisibilityChange = function(widget, visible)

    if not visible then

      vBotConfigSave("heal")

      healWindow.healer:show()

      healWindow.settings:hide()

      healWindow.settingsButton:setText("Settings")

    end

  end

  healWindow.settingsButton.onClick = function(widget)

    if healWindow.healer:isVisible() then

      healWindow.healer:hide()

      healWindow.settings:show()

      widget:setText("Back")

    else

      healWindow.healer:show()

      healWindow.settings:hide()

      widget:setText("Settings")

    end

  end

  local setProfileName = function()

    ui.name:setText(currentSettings.name)

  end

  healWindow.settings.profiles.Name.onTextChange = function(widget, text)

    currentSettings.name = text

    setProfileName()

  end

  healWindow.settings.list.Visible.onClick = function(widget)

    currentSettings.Visible = not currentSettings.Visible

    healWindow.settings.list.Visible:setChecked(currentSettings.Visible)

  end

  healWindow.settings.list.Cooldown.onClick = function(widget)

    currentSettings.Cooldown = not currentSettings.Cooldown

    healWindow.settings.list.Cooldown:setChecked(currentSettings.Cooldown)

  end

  healWindow.settings.list.Interval.onClick = function(widget)

    currentSettings.Interval = not currentSettings.Interval

    healWindow.settings.list.Interval:setChecked(currentSettings.Interval)

  end

  healWindow.settings.list.Conditions.onClick = function(widget)

    currentSettings.Conditions = not currentSettings.Conditions

    healWindow.settings.list.Conditions:setChecked(currentSettings.Conditions)

  end

  healWindow.settings.list.Delay.onClick = function(widget)

    currentSettings.Delay = not currentSettings.Delay

    healWindow.settings.list.Delay:setChecked(currentSettings.Delay)

  end

  healWindow.settings.list.MessageDelay.onClick = function(widget)

    currentSettings.MessageDelay = not currentSettings.MessageDelay

    healWindow.settings.list.MessageDelay:setChecked(currentSettings.MessageDelay)

  end

  local refreshSpells = function()

    if currentSettings.spellTable then

      healWindow.healer.spells.spellList:destroyChildren()

      for _, entry in pairs(currentSettings.spellTable) do

        local label = UI.createWidget("SpellEntry", healWindow.healer.spells.spellList)

        label.enabled:setChecked(entry.enabled)

        label.enabled.onClick = function(widget)

          standBySpells = false

          standByItems = false

          entry.enabled = not entry.enabled

          label.enabled:setChecked(entry.enabled)

        end

        label.remove.onClick = function(widget)

          standBySpells = false

          standByItems = false

          table.removevalue(currentSettings.spellTable, entry)

          reindexTable(currentSettings.spellTable)

          label:destroy()

        end

        label:setText("(MP>" .. entry.cost .. ") " .. entry.origin .. entry.sign .. entry.value .. ": " .. entry.spell)

      end

    end

  end

  refreshSpells()

  local refreshItems = function()

    if currentSettings.itemTable then

      healWindow.healer.items.itemList:destroyChildren()

      for _, entry in pairs(currentSettings.itemTable) do

        local label = UI.createWidget("ItemEntry", healWindow.healer.items.itemList)

        label.enabled:setChecked(entry.enabled)

        label.enabled.onClick = function(widget)

          standBySpells = false

          standByItems = false

          entry.enabled = not entry.enabled

          label.enabled:setChecked(entry.enabled)

        end

        label.remove.onClick = function(widget)

          standBySpells = false

          standByItems = false

          table.removevalue(currentSettings.itemTable, entry)

          reindexTable(currentSettings.itemTable)

          label:destroy()

        end

        label.id:setItemId(entry.item)

        label:setText(entry.origin .. entry.sign .. entry.value .. ": " .. entry.item)

      end

    end

  end

  refreshItems()

  healWindow.healer.spells.MoveUp.onClick = function(widget)

    local input = healWindow.healer.spells.spellList:getFocusedChild()

    if not input then return end

    local index = healWindow.healer.spells.spellList:getChildIndex(input)

    if index < 2 then return end

    local t = currentSettings.spellTable

    t[index],t[index-1] = t[index-1], t[index]

    healWindow.healer.spells.spellList:moveChildToIndex(input, index - 1)

    healWindow.healer.spells.spellList:ensureChildVisible(input)

  end

  healWindow.healer.spells.MoveDown.onClick = function(widget)

    local input = healWindow.healer.spells.spellList:getFocusedChild()

    if not input then return end

    local index = healWindow.healer.spells.spellList:getChildIndex(input)

    if index >= healWindow.healer.spells.spellList:getChildCount() then return end

    local t = currentSettings.spellTable

    t[index],t[index+1] = t[index+1],t[index]

    healWindow.healer.spells.spellList:moveChildToIndex(input, index + 1)

    healWindow.healer.spells.spellList:ensureChildVisible(input)

  end

  healWindow.healer.items.MoveUp.onClick = function(widget)

    local input = healWindow.healer.items.itemList:getFocusedChild()

    if not input then return end

    local index = healWindow.healer.items.itemList:getChildIndex(input)

    if index < 2 then return end

    local t = currentSettings.itemTable

    t[index],t[index-1] = t[index-1], t[index]

    healWindow.healer.items.itemList:moveChildToIndex(input, index - 1)

    healWindow.healer.items.itemList:ensureChildVisible(input)

  end

  healWindow.healer.items.MoveDown.onClick = function(widget)

    local input = healWindow.healer.items.itemList:getFocusedChild()

    if not input then return end

    local index = healWindow.healer.items.itemList:getChildIndex(input)

    if index >= healWindow.healer.items.itemList:getChildCount() then return end

    local t = currentSettings.itemTable

    t[index],t[index+1] = t[index+1],t[index]

    healWindow.healer.items.itemList:moveChildToIndex(input, index + 1)

    healWindow.healer.items.itemList:ensureChildVisible(input)

  end

  healWindow.healer.spells.addSpell.onClick = function(widget)

    local spellFormula = healWindow.healer.spells.spellFormula:getText():trim()

    local manaCost = tonumber(healWindow.healer.spells.manaCost:getText())

    local spellTrigger = tonumber(healWindow.healer.spells.spellValue:getText())

    local spellSource = healWindow.healer.spells.spellSource:getCurrentOption().text

    local spellEquasion = healWindow.healer.spells.spellCondition:getCurrentOption().text

    local source

    local equasion

    if not manaCost then

      warn("HealBot: incorrect mana cost value!")

      healWindow.healer.spells.spellFormula:setText('')

      healWindow.healer.spells.spellValue:setText('')

      healWindow.healer.spells.manaCost:setText('')

      return

    end

    if not spellTrigger then

      warn("HealBot: incorrect condition value!")

      healWindow.healer.spells.spellFormula:setText('')

      healWindow.healer.spells.spellValue:setText('')

      healWindow.healer.spells.manaCost:setText('')

      return

    end

    if spellSource == "Current Mana" then

      source = "MP"

    elseif spellSource == "Current Health" then

      source = "HP"

    elseif spellSource == "Mana Percent" then

      source = "MP%"

    elseif spellSource == "Health Percent" then

      source = "HP%"

    else

      source = "burst"

    end

    if spellEquasion == "Above" then

      equasion = ">"

    elseif spellEquasion == "Below" then

      equasion = "<"

    else

      equasion = "="

    end

    if spellFormula:len() > 0 then

      table.insert(currentSettings.spellTable,  {index = #currentSettings.spellTable+1, spell = spellFormula, sign = equasion, origin = source, cost = manaCost, value = spellTrigger, enabled = true})

      healWindow.healer.spells.spellFormula:setText('')

      healWindow.healer.spells.spellValue:setText('')

      healWindow.healer.spells.manaCost:setText('')

    end

    standBySpells = false

    standByItems = false

    refreshSpells()

  end

  healWindow.healer.items.addItem.onClick = function(widget)

    local id = healWindow.healer.items.itemId:getItemId()

    local trigger = tonumber(healWindow.healer.items.itemValue:getText())

    local src = healWindow.healer.items.itemSource:getCurrentOption().text

    local eq = healWindow.healer.items.itemCondition:getCurrentOption().text

    local source

    local equasion

    if not trigger then

      warn("HealBot: incorrect trigger value!")

      healWindow.healer.items.itemId:setItemId(0)

      healWindow.healer.items.itemValue:setText('')

      return

    end

    if src == "Current Mana" then

      source = "MP"

    elseif src == "Current Health" then

      source = "HP"

    elseif src == "Mana Percent" then

      source = "MP%"

    elseif src == "Health Percent" then

      source = "HP%"

    else

      source = "burst"

    end

    if eq == "Above" then

      equasion = ">"

    elseif eq == "Below" then

      equasion = "<"

    else

      equasion = "="

    end

    if id > 100 then

      table.insert(currentSettings.itemTable, {index = #currentSettings.itemTable+1,item = id, sign = equasion, origin = source, value = trigger, enabled = true})

      standBySpells = false

      standByItems = false

      refreshItems()

      healWindow.healer.items.itemId:setItemId(0)

      healWindow.healer.items.itemValue:setText('')

    end

  end

  healWindow.closeButton.onClick = function(widget)

    healWindow:hide()

  end

  local loadSettings = function()

    ui.title:setOn(currentSettings.enabled)

    setProfileName()

    healWindow.settings.profiles.Name:setText(currentSettings.name)

    refreshSpells()

    refreshItems()

    healWindow.settings.list.Visible:setChecked(currentSettings.Visible)

    healWindow.settings.list.Cooldown:setChecked(currentSettings.Cooldown)

    healWindow.settings.list.Delay:setChecked(currentSettings.Delay)

    healWindow.settings.list.MessageDelay:setChecked(currentSettings.MessageDelay)

    healWindow.settings.list.Interval:setChecked(currentSettings.Interval)

    healWindow.settings.list.Conditions:setChecked(currentSettings.Conditions)

  end

  loadSettings()

  local profileChange = function()

    setActiveProfile()

    activeProfileColor()

    loadSettings()

    vBotConfigSave("heal")

  end

  local resetSettings = function()

    currentSettings.enabled = false

    currentSettings.spellTable = {}

    currentSettings.itemTable = {}

    currentSettings.Visible = true

    currentSettings.Cooldown = true

    currentSettings.Delay = true

    currentSettings.MessageDelay = false

    currentSettings.Interval = true

    currentSettings.Conditions = true

    currentSettings.name = "Profile #" .. HealBotConfig.currentBotProfile

  end

  -- profile buttons

  for i=1,5 do

    local button = ui[i]

      button.onClick = function()

      HealBotConfig.currentHealBotProfile = i

      profileChange()

    end

  end

  healWindow.settings.profiles.ResetSettings.onClick = function()

    resetSettings()

    loadSettings()

  end

  -- public functions

  HealBot = {} -- global table

  HealBot.isOn = function()

    return currentSettings.enabled

  end

  HealBot.isOff = function()

    return not currentSettings.enabled

  end

  HealBot.setOff = function()

    currentSettings.enabled = false

    ui.title:setOn(currentSettings.enabled)

    vBotConfigSave("atk")

  end

  HealBot.setOn = function()

    currentSettings.enabled = true

    ui.title:setOn(currentSettings.enabled)

    vBotConfigSave("atk")

  end

  HealBot.getActiveProfile = function()

    return HealBotConfig.currentHealBotProfile -- returns number 1-5

  end

  HealBot.setActiveProfile = function(n)

    if not n or not tonumber(n) or n < 1 or n > 5 then

      return error("[HealBot] wrong profile parameter! should be 1 to 5 is " .. n)

    else

      HealBotConfig.currentHealBotProfile = n

      profileChange()

    end

  end

  HealBot.show = function()

    healWindow:show()

    healWindow:raise()

    healWindow:focus()

  end

end

-- spells

macro(100, function()

  if standBySpells then return end

  if not currentSettings.enabled then return end

  local somethingIsOnCooldown = false

  for _, entry in pairs(currentSettings.spellTable) do

    if entry.enabled and entry.cost < mana() then

      if canCast(entry.spell, not currentSettings.Conditions, not currentSettings.Cooldown) then

        if entry.origin == "HP%" then

          if entry.sign == "=" and hppercent() == entry.value then

            say(entry.spell)

            return

          elseif entry.sign == ">" and hppercent() >= entry.value then

            say(entry.spell)

            return

          elseif entry.sign == "<" and hppercent() <= entry.value then

            say(entry.spell)

            return

          end

        elseif entry.origin == "HP" then

          if entry.sign == "=" and hp() == entry.value then

            say(entry.spell)

            return

          elseif entry.sign == ">" and hp() >= entry.value then

            say(entry.spell)

            return

          elseif entry.sign == "<" and hp() <= entry.value then

            say(entry.spell)

            return

          end

        elseif entry.origin == "MP%" then

          if entry.sign == "=" and manapercent() == entry.value then

            say(entry.spell)

            return

          elseif entry.sign == ">" and manapercent() >= entry.value then

            say(entry.spell)

            return

          elseif entry.sign == "<" and manapercent() <= entry.value then

            say(entry.spell)

            return

          end

        elseif entry.origin == "MP" then

          if entry.sign == "=" and mana() == entry.value then

            say(entry.spell)

            return

          elseif entry.sign == ">" and mana() >= entry.value then

            say(entry.spell)

            return

          elseif entry.sign == "<" and mana() <= entry.value then

            say(entry.spell)

            return

          end

        elseif entry.origin == "burst" then

          if entry.sign == "=" and burstDamageValue() == entry.value then

            say(entry.spell)

            return

          elseif entry.sign == ">" and burstDamageValue() >= entry.value then

            say(entry.spell)

            return

          elseif entry.sign == "<" and burstDamageValue() <= entry.value then

            say(entry.spell)

            return

          end

        end

      else

        somethingIsOnCooldown = true

      end

    end

  end

  if not somethingIsOnCooldown then

    standBySpells = true

  end

end)

-- items

macro(100, function()

  if standByItems then return end

  if not currentSettings.enabled or #currentSettings.itemTable == 0 then return end

  if currentSettings.Delay and vBot.isUsing then return end

  if currentSettings.MessageDelay and vBot.isUsingPotion then return end

  if not currentSettings.MessageDelay then

    delay(400)

  end

  if TargetBot.isOn() and TargetBot.Looting.getStatus():len() > 0 and currentSettings.Interval then

    if not currentSettings.MessageDelay then

      delay(700)

    else

      delay(200)

    end

  end

  for _, entry in pairs(currentSettings.itemTable) do

    local item = findItem(entry.item)

    if (not currentSettings.Visible or item) and entry.enabled then

      if entry.origin == "HP%" then

        if entry.sign == "=" and hppercent() == entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == ">" and hppercent() >= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == "<" and hppercent() <= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        end

      elseif entry.origin == "HP" then

        if entry.sign == "=" and hp() == tonumberentry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == ">" and hp() >= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == "<" and hp() <= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        end

      elseif entry.origin == "MP%" then

        if entry.sign == "=" and manapercent() == entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == ">" and manapercent() >= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == "<" and manapercent() <= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        end

      elseif entry.origin == "MP" then

        if entry.sign == "=" and mana() == entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == ">" and mana() >= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == "<" and mana() <= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        end

      elseif entry.origin == "burst" then

        if entry.sign == "=" and burstDamageValue() == entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == ">" and burstDamageValue() >= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        elseif entry.sign == "<" and burstDamageValue() <= entry.value then

          g_game.useInventoryItemWith(entry.item, player)

          return

        end

      end

    end

  end

  standByItems = true

end)

UI.Separator()

onPlayerHealthChange(function(healthPercent)

  standByItems = false

  standBySpells = false

end)

onManaChange(function(player, mana, maxMana, oldMana, oldMaxMana)

  standByItems = false

  standBySpells = false

end)

```

---
# HealBot.otui
```otui

SettingCheckBox < CheckBox

  text-wrap: true

  text-auto-resize: true

  margin-top: 3

  font: verdana-11px-rounded

SpellSourceBoxPopupMenu < ComboBoxPopupMenu

SpellSourceBoxPopupMenuButton < ComboBoxPopupMenuButton

SpellSourceBox < ComboBox

  @onSetup: |

    self:addOption("Current Mana")

    self:addOption("Current Health")

    self:addOption("Mana Percent")

    self:addOption("Health Percent")

    self:addOption("Burst Damage")

SpellConditionBoxPopupMenu < ComboBoxPopupMenu

SpellConditionBoxPopupMenuButton < ComboBoxPopupMenuButton

SpellConditionBox < ComboBox

  @onSetup: |

    self:addOption("Below")

    self:addOption("Above")

    self:addOption("Equal To")

SpellEntry < Label

  background-color: alpha

  text-offset: 18 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  CheckBox

    id: enabled

    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter

    width: 15

    height: 15

    margin-top: 2

    margin-left: 3

  $focus:

    background-color: #00000055

  Button

    id: remove

    !text: tr('x')

    anchors.right: parent.right

    margin-right: 15

    text-offset: 1 0

    width: 15

    height: 15

ItemEntry < Label

  background-color: alpha

  text-offset: 40 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  CheckBox

    id: enabled

    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter

    width: 15

    height: 15

    margin-top: 2

    margin-left: 3

  UIItem

    id: id

    anchors.left: prev.right

    margin-left: 3

    anchors.verticalCenter: parent.verticalCenter

    size: 15 15

    focusable: false

  $focus:

    background-color: #00000055

  Button

    id: remove

    !text: tr('x')

    anchors.right: parent.right

    margin-right: 15

    text-offset: 1 0

    width: 15

    height: 15

SpellHealing < FlatPanel

  size: 490 130

  Label

    id: title

    anchors.verticalCenter: parent.top

    anchors.left: parent.left

    margin-left: 5

    text: Spell Healing

    color: #269e26

    font: verdana-11px-rounded

  SpellSourceBox

    id: spellSource

    anchors.top: spellList.top

    anchors.left: spellList.right

    margin-left: 80

    width: 125

    font: verdana-11px-rounded

  Label

    id: whenSpell

    anchors.left: spellList.right

    anchors.verticalCenter: prev.verticalCenter

    text: When

    margin-left: 7

    font: verdana-11px-rounded

  Label

    id: isSpell

    anchors.left: spellList.right

    anchors.top: whenSpell.bottom

    text: Is

    margin-top: 9

    margin-left: 7

    font: verdana-11px-rounded

  SpellConditionBox

    id: spellCondition

    anchors.left: spellSource.left

    anchors.top: spellSource.bottom

    marin-top: 15

    width: 80

    font: verdana-11px-rounded

  TextEdit

    id: spellValue

    anchors.left: spellCondition.right

    anchors.top: spellCondition.top

    anchors.bottom: spellCondition.bottom

    anchors.right: spellSource.right

    font: verdana-11px-rounded

  Label

    id: castSpell

    anchors.left: isSpell.left

    anchors.top: isSpell.bottom

    text: Cast

    margin-top: 9

    font: verdana-11px-rounded

  TextEdit

    id: spellFormula

    anchors.left: spellCondition.left

    anchors.top: spellCondition.bottom

    anchors.right: spellValue.right

    font: verdana-11px-rounded

  Label

    id: manaSpell

    anchors.left: castSpell.left

    anchors.top: castSpell.bottom

    text: Mana Cost:

    margin-top: 8

    font: verdana-11px-rounded

  TextEdit

    id: manaCost

    anchors.left: spellFormula.left

    anchors.top: spellFormula.bottom

    width: 40

    font: verdana-11px-rounded

  TextList

    id: spellList

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    anchors.top: parent.top

    padding: 1

    padding-top: 2

    width: 270

    margin-bottom: 7

    margin-left: 7

    margin-top: 10

    vertical-scrollbar: spellListScrollBar

  VerticalScrollBar

    id: spellListScrollBar

    anchors.top: spellList.top

    anchors.bottom: spellList.bottom

    anchors.right: spellList.right

    step: 14

    pixels-scroll: true

  Button

    id: addSpell

    anchors.right: spellFormula.right

    anchors.bottom: spellList.bottom

    text: Add

    size: 40 17

    font: cipsoftFont

  Button

    id: MoveUp

    anchors.right: prev.left

    anchors.bottom: prev.bottom

    margin-right: 5

    text: Move Up

    size: 55 17

    font: cipsoftFont

  Button

    id: MoveDown

    anchors.right: prev.left

    anchors.bottom: prev.bottom

    margin-right: 5

    text: Move Down

    size: 55 17

    font: cipsoftFont

ItemHealing < FlatPanel

  size: 490 120

  Label

    id: title

    anchors.verticalCenter: parent.top

    anchors.left: parent.left

    margin-left: 5

    text: Item Healing

    color: #ff4513

    font: verdana-11px-rounded

  SpellSourceBox

    id: itemSource

    anchors.top: itemList.top

    anchors.right: parent.right

    margin-right: 10

    width: 128

    font: verdana-11px-rounded

  Label

    id: whenItem

    anchors.left: itemList.right

    anchors.verticalCenter: prev.verticalCenter

    text: When

    margin-left: 7

    font: verdana-11px-rounded

  Label

    id: isItem

    anchors.left: itemList.right

    anchors.top: whenItem.bottom

    text: Is

    margin-top: 9

    margin-left: 7

    font: verdana-11px-rounded

  SpellConditionBox

    id: itemCondition

    anchors.left: itemSource.left

    anchors.top: itemSource.bottom

    marin-top: 15

    width: 80

    font: verdana-11px-rounded

  TextEdit

    id: itemValue

    anchors.left: itemCondition.right

    anchors.top: itemCondition.top

    anchors.bottom: itemCondition.bottom

    width: 49

    font: verdana-11px-rounded

  Label

    id: useItem

    anchors.left: isItem.left

    anchors.top: isItem.bottom

    text: Use

    margin-top: 15

    font: verdana-11px-rounded

  BotItem

    id: itemId

    anchors.left: itemCondition.left

    anchors.top: itemCondition.bottom

  TextList

    id: itemList

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    anchors.top: parent.top

    padding: 1

    padding-top: 2

    width: 270

    margin-top: 10

    margin-bottom: 7

    margin-left: 8

    vertical-scrollbar: itemListScrollBar

  VerticalScrollBar

    id: itemListScrollBar

    anchors.top: itemList.top

    anchors.bottom: itemList.bottom

    anchors.right: itemList.right

    step: 14

    pixels-scroll: true

  Button

    id: addItem

    anchors.right: itemValue.right

    anchors.bottom: itemList.bottom

    text: Add

    size: 40 17

    font: cipsoftFont

  Button

    id: MoveUp

    anchors.right: prev.left

    anchors.bottom: prev.bottom

    margin-right: 5

    text: Move Up

    size: 55 17

    font: cipsoftFont

  Button

    id: MoveDown

    anchors.right: prev.left

    anchors.bottom: prev.bottom

    margin-right: 5

    text: Move Down

    size: 55 17

    font: cipsoftFont

HealerPanel < Panel

  size: 510 275

  SpellHealing

    id: spells

    anchors.top: parent.top

    margin-top: 8

    anchors.left: parent.left

  ItemHealing

    id: items

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-top: 10

HealBotSettingsPanel < Panel

  size: 500 267

  padding-top: 8

  FlatPanel

    id: list

    anchors.fill: parent

    margin-right: 240

    padding-left: 6

    padding-right: 6

    padding-top: 6

    layout:

      type: verticalBox

    Label

      text: Additional Settings

      text-align: center

      font: verdana-11px-rounded

    HorizontalSeparator

    SettingCheckBox

      id: Cooldown

      text: Check spell cooldowns

      margin-top: 10

    SettingCheckBox

      id: Visible

      text: Items must be visible (recommended)

    SettingCheckBox

      id: Delay

      text: Don't use items when interacting

    SettingCheckBox

      id: Interval

      text: Additional delay when looting corpses

    SettingCheckBox

      id: Conditions

      text: Also check conditions from RL Tibia

    SettingCheckBox

      id: MessageDelay

      text: Cooldown based on "Aaaah..." message

  VerticalSeparator

    anchors.top: prev.top

    anchors.bottom: prev.bottom

    anchors.left: prev.right

    margin-left: 8

  FlatPanel

    id: profiles

    anchors.fill: parent

    anchors.left: prev.left

    margin-left: 8

    margin-right: 8

    padding: 8

    Label

      text: Profile Settings

      text-align: center

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.right

      font: verdana-11px-rounded

    HorizontalSeparator

      anchors.top: prev.bottom

      anchors.left: parent.left

      anchors.right: parent.right

    Label

      anchors.top: prev.bottom

      margin-top: 30

      anchors.left: parent.left

      anchors.right: parent.right

      text-align: center

      font: verdana-11px-rounded

      text: Profile Name:

    TextEdit

      id: Name

      anchors.top: prev.bottom

      margin-top: 3

      anchors.left: parent.left

      anchors.right: parent.right

    Button

      id: ResetSettings

      anchors.bottom: parent.bottom

      anchors.horizontalCenter: parent.horizontalCenter

      text: Reset Current Profile

      text-auto-resize: true

      color: #ff4513

HealWindow < MainWindow

  !text: tr('Self Healer')

  size: 520 360

  @onEscape: self:hide()

  Label

    id: title

    anchors.left: parent.left

    anchors.top: parent.top

    margin-left: 2

    !text: tr('More important methods come first (Example: Exura gran above Exura)')

    text-align: left

    font: verdana-11px-rounded

    color: #aeaeae

  HealerPanel

    id: healer

    anchors.top: prev.bottom

    anchors.left: parent.left

  HealBotSettingsPanel

    id: settings

    anchors.top: title.bottom

    anchors.left: parent.left

    visible: false

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-right: 5

  Button

    id: settingsButton

    !text: tr('Settings')

    font: cipsoftFont

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    size: 45 21

```

---
# Sio.lua
```lua

setDefaultTab("Main")

  local panelName = "advancedFriendHealer"

  local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('Friend Healer')

  Button

    id: editList

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

  ]], parent)

  ui:setId(panelName)

  if not storage[panelName] then

    storage[panelName] = {

      minMana = 60,

      minFriendHp = 40,

      customSpellName = "exura max sio",

      customSpell = false,

      distance = 8,

      itemHeal = false,

      id = 3160,

      exuraSio = false,

      exuraGranSio = false,

      exuraMasRes = false,

      healEk = false,

      healRp = false,

      healEd = false,

      healMs = false

}

  end

  local config = storage[panelName]

  -- basic elements

  ui.title:setOn(config.enabled)

  ui.title.onClick = function(widget)

    config.enabled = not config.enabled

    widget:setOn(config.enabled)

  end

  ui.editList.onClick = function(widget)

    sioListWindow:show()

    sioListWindow:raise()

    sioListWindow:focus()

  end

  rootWidget = g_ui.getRootWidget()

  if rootWidget then

    sioListWindow = UI.createWindow('SioListWindow', rootWidget)

    sioListWindow:hide()

    -- TextWindow

    sioListWindow.spellName:setText(config.customSpellName)

    sioListWindow.spellName.onTextChange = function(widget, text)

      config.customSpellName = text

    end

    -- botswitches

    sioListWindow.spell:setOn(config.customSpell)

    sioListWindow.spell.onClick = function(widget)

      config.customSpell = not config.customSpell

      widget:setOn(config.customSpell)

    end

    sioListWindow.item:setOn(config.itemHeal)

    sioListWindow.item.onClick = function(widget)

      config.itemHeal = not config.itemHeal

      widget:setOn(config.itemHeal)

    end

    sioListWindow.exuraSio:setOn(config.exuraSio)

    sioListWindow.exuraSio.onClick = function(widget)

      config.exuraSio = not config.exuraSio

      widget:setOn(config.exuraSio)

    end

    sioListWindow.exuraGranSio:setOn(config.exuraGranSio)

    sioListWindow.exuraGranSio.onClick = function(widget)

      config.exuraGranSio = not config.exuraGranSio

      widget:setOn(config.exuraGranSio)

    end

    sioListWindow.exuraMasRes:setOn(config.exuraMasRes)

    sioListWindow.exuraMasRes.onClick = function(widget)

      config.exuraMasRes = not config.exuraMasRes

      widget:setOn(config.exuraMasRes)

    end

    sioListWindow.vocation.ED:setOn(config.healEd)

    sioListWindow.vocation.ED.onClick = function(widget)

      config.healEd = not config.healEd

      widget:setOn(config.healEd)

    end

    sioListWindow.vocation.MS:setOn(config.healMs)

    sioListWindow.vocation.MS.onClick = function(widget)

      config.healMs = not config.healMs

      widget:setOn(config.healMs)

    end

    sioListWindow.vocation.EK:setOn(config.healEk)

    sioListWindow.vocation.EK.onClick = function(widget)

      config.healEk = not config.healEk

      widget:setOn(config.healEk)

    end

    sioListWindow.vocation.RP:setOn(config.healRp)

    sioListWindow.vocation.RP.onClick = function(widget)

      config.healRp = not config.healRp

      widget:setOn(config.healRp)

    end

    -- functions

    local updateMinManaText = function()

      sioListWindow.manaInfo:setText("Minimum Mana >= " .. config.minMana .. "%")

    end

    local updateFriendHpText = function()

      sioListWindow.friendHp:setText("Heal Friend Below " .. config.minFriendHp .. "% hp")

    end

    local updateDistanceText = function()

      sioListWindow.distText:setText("Max Distance: " .. config.distance)

    end

    -- scrollbars and text updates

    sioListWindow.Distance:setValue(config.distance)

    sioListWindow.Distance.onValueChange = function(scroll, value)

      config.distance = value

      updateDistanceText()

    end

    updateDistanceText()

    sioListWindow.minMana:setValue(config.minMana)

    sioListWindow.minMana.onValueChange = function(scroll, value)

      config.minMana = value

      updateMinManaText()

    end

    updateMinManaText()

    sioListWindow.minFriendHp:setValue(config.minFriendHp)

    sioListWindow.minFriendHp.onValueChange = function(scroll, value)

      config.minFriendHp = value

      updateFriendHpText()

    end

    updateFriendHpText()

    sioListWindow.itemId:setItemId(config.id)

    sioListWindow.itemId.onItemChange = function(widget)

      config.id = widget:getItemId()

    end

    sioListWindow.closeButton.onClick = function(widget)

      sioListWindow:hide()

    end

  end

  -- local variables

  local newTibia = g_game.getClientVersion() >= 960

  local function isValid(name)

    if not newTibia then return true end

    local voc = vBot.BotServerMembers[name]

    if not voc then return true end

    if voc == 11 then voc = 1

    elseif voc == 12 then voc = 2

    elseif voc == 13 then voc = 3

    elseif voc == 14 then voc = 4

    end

    local isOk = false

    if voc == 1 and config.healEk then

      isOk = true

    elseif voc == 2 and config.healRp then

      isOk = true

    elseif voc == 3 and config.healMs then

      isOk = true

    elseif voc == 4 and config.healEd then

      isOk = true

    end

    return isOk

  end

  macro(200, function()

    if not config.enabled then return end

    if modules.game_cooldown.isGroupCooldownIconActive(2) then return end

    --[[

      1. custom spell

      2. exura gran sio - at 50% of minHpValue

      3. exura gran mas res

      4. exura sio

      5. item healing

    --]]

    -- exura gran sio & custom spell

    if config.customSpell or config.exuraGranSio then

      for i, spec in ipairs(getSpectators()) do

        if spec:isPlayer() and spec ~= player and isValid(spec:getName()) and spec:canShoot() then

          if isFriend(spec) then

            if config.customSpell and spec:getHealthPercent() <= config.minFriendHp then

              return cast(config.customSpellName .. ' "' .. spec:getName() .. '"', 1000)

            end

            if config.exuraGranSio and spec:getHealthPercent() <= config.minFriendHp/3 then

              if canCast('exura gran sio "' .. spec:getName() ..'"') then

                return cast('exura gran sio "' .. spec:getName() ..'"', 60000)

              end

            end

          end

        end

      end

    end

    -- exura gran mas res and standard sio

    local friends = 0

    if config.exuraMasRes then

      for i, spec in ipairs(getSpectators(player, largeRuneArea)) do

        if spec:isPlayer() and spec ~= player and isValid(spec:getName()) and spec:canShoot() then

          if isFriend(spec) and spec:getHealthPercent() <= config.minFriendHp then

            friends = friends + 1

          end

        end

      end

      if friends > 1 then

        return cast('exura gran mas res', 2000)

      end

    end

    if config.exuraSio or config.itemHeal then

      for i, spec in ipairs(getSpectators()) do

        if spec:isPlayer() and spec ~= player and isValid(spec:getName()) and spec:canShoot() then

          if isFriend(spec) then

            if spec:getHealthPercent() <= config.minFriendHp then

              if config.exuraSio then

                return cast('exura sio "' .. spec:getName() .. '"', 1000)

              elseif findItem(config.id) and distanceFromPlayer(spec:getPosition()) <= config.distance then

                return useWith(config.id, spec)

              end

            end

          end

        end

      end

    end

  end)

addSeparator()

```

---
# alarms.lua
```lua

local panelName = "alarms"

local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('Alarms')

  Button

    id: alerts

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Edit

]])

ui:setId(panelName)

if not storage[panelName] then

  storage[panelName] = {

    enabled = false,

    playerAttack = false,

    playerDetected = false,

    playerDetectedLogout = false,

    creatureDetected = false,

    healthBelow = false,

    healthValue = 40,

    manaBelow = false,

    manaValue = 50,

    privateMessage = false,

    ignoreFriends = true,

    warnBoss = false,

    bossName = '[B]'

}

end

local config = storage[panelName]

ui.title:setOn(config.enabled)

ui.title.onClick = function(widget)

config.enabled = not config.enabled

widget:setOn(config.enabled)

end

-- new var's validation

config.messageText = config.messageText or ""

config.bossName = config.bossName or ""

rootWidget = g_ui.getRootWidget()

if rootWidget then

  alarmsWindow = UI.createWindow('AlarmsWindow', rootWidget)

  alarmsWindow:hide()

  alarmsWindow.closeButton.onClick = function(widget)

    alarmsWindow:hide()

  end

  alarmsWindow.playerAttack:setOn(config.playerAttack)

  alarmsWindow.playerAttack.onClick = function(widget)

    config.playerAttack = not config.playerAttack

    widget:setOn(config.playerAttack)

  end

  alarmsWindow.playerDetected:setOn(config.playerDetected)

  alarmsWindow.playerDetected.onClick = function(widget)

    config.playerDetected = not config.playerDetected

    widget:setOn(config.playerDetected)

  end

  alarmsWindow.playerDetectedLogout:setChecked(config.playerDetectedLogout)

  alarmsWindow.playerDetectedLogout.onClick = function(widget)

    config.playerDetectedLogout = not config.playerDetectedLogout

    widget:setChecked(config.playerDetectedLogout)

  end

  alarmsWindow.creatureDetected:setOn(config.creatureDetected)

  alarmsWindow.creatureDetected.onClick = function(widget)

    config.creatureDetected = not config.creatureDetected

    widget:setOn(config.creatureDetected)

  end

  alarmsWindow.healthBelow:setOn(config.healthBelow)

  alarmsWindow.healthBelow.onClick = function(widget)

    config.healthBelow = not config.healthBelow

    widget:setOn(config.healthBelow)

  end

  alarmsWindow.healthValue.onValueChange = function(scroll, value)

    config.healthValue = value

    alarmsWindow.healthBelow:setText("Health < " .. config.healthValue .. "%")

  end

  alarmsWindow.healthValue:setValue(config.healthValue)

  alarmsWindow.manaBelow:setOn(config.manaBelow)

  alarmsWindow.manaBelow.onClick = function(widget)

    config.manaBelow = not config.manaBelow

    widget:setOn(config.manaBelow)

  end

  alarmsWindow.manaValue.onValueChange = function(scroll, value)

    config.manaValue = value

    alarmsWindow.manaBelow:setText("Mana < " .. config.manaValue .. "%")

  end

  alarmsWindow.manaValue:setValue(config.manaValue)

  alarmsWindow.privateMessage:setOn(config.privateMessage)

  alarmsWindow.privateMessage.onClick = function(widget)

    config.privateMessage = not config.privateMessage

    widget:setOn(config.privateMessage)

  end

  alarmsWindow.ignoreFriends:setOn(config.ignoreFriends)

  alarmsWindow.ignoreFriends.onClick = function(widget)

    config.ignoreFriends = not config.ignoreFriends

    widget:setOn(config.ignoreFriends)

  end

  alarmsWindow.warnBoss:setOn(config.warnBoss)

  alarmsWindow.warnBoss.onClick = function(widget)

    config.warnBoss = not config.warnBoss

    widget:setOn(config.warnBoss)

  end

  alarmsWindow.bossName:setText(config.bossName)

  alarmsWindow.bossName.onTextChange = function(widget, text)

    config.bossName = text

  end

  alarmsWindow.warnMessage:setOn(config.warnMessage)

  alarmsWindow.warnMessage.onClick = function(widget)

    config.warnMessage = not config.warnMessage

    widget:setOn(config.warnMessage)

  end

  alarmsWindow.messageText:setText(config.messageText)

  alarmsWindow.messageText.onTextChange = function(widget, text)

    config.messageText = text

  end

  local pName = player:getName()

  onTextMessage(function(mode, text)

    if config.enabled and config.playerAttack and string.match(text, "hitpoints due to an attack") and not string.match(text, "hitpoints due to an attack by a ") then

      playSound("/sounds/Player_Attack.ogg")

      g_window.setTitle(pName .. " - Player Attacks!")

      return

    end

    if config.warnMessage and config.messageText:len() > 0 then

      text = text:lower()

      local parts = string.split(config.messageText, ",")

      for i=1,#parts do

        local part = parts[i]

        part = part:trim()

        part = part:lower()

        if text:find(part) then

          delay(1500)

          playSound(g_resources.fileExists("/sounds/Special_Message.ogg") and "/sounds/Special_Message.ogg" or "/sounds/Private_Message.ogg")

          g_window.setTitle(pName .. " - Special Message Detected: "..part)

          return

        end

      end

    end

  end)

  macro(100, function()

    if not config.enabled then

      return

    end

    local specs = getSpectators()

    if config.playerDetected then

      for _, spec in ipairs(specs) do

        if spec:isPlayer() and spec:getName() ~= name() then

          local specPos = spec:getPosition()

          if (not config.ignoreFriends or not isFriend(spec)) and math.max(math.abs(posx()-specPos.x), math.abs(posy()-specPos.y)) <= 8 then

            playSound("/sounds/Player_Detected.ogg")

            delay(1500)

            g_window.setTitle(pName .. " - Player Detected! "..spec:getName())

            if config.playerDetectedLogout then

              modules.game_interface.tryLogout(false)

            end

            return

          end

        end

      end

    end

    if config.creatureDetected then

      for _, spec in ipairs(specs) do

        if not spec:isPlayer() then

          local specPos = spec:getPosition()

          if math.max(math.abs(posx()-specPos.x), math.abs(posy()-specPos.y)) <= 8 then

            playSound("/sounds/Creature_Detected.ogg")

            delay(1500)

            g_window.setTitle(pName .. " - Creature Detected! "..spec:getName())

            return

          end

        end

      end

    end

    if config.warnBoss then

      -- experimental, but since we check only names i think the best way would be to combine all spec's names into one string and then check it to avoid multiple loops

      if config.bossName:len() > 0 then

        local names = string.split(config.bossName, ",")

        local combinedString = ""

        for _, spec in ipairs(specs) do

          local specPos = spec:getPosition()

          if math.max(math.abs(posx() - specPos.x), math.abs(posy() - specPos.y)) <= 8 then

            local name = spec:getName():lower()

            -- add special sign between names to avoid unwanted combining mistakes

            combinedString = combinedString .."&"..name

          end

        end

        for i=1,#names do

          local name = names[i]

          name = name:trim()

          name = name:lower()

          if combinedString:find(name) then

            playSound(g_resources.fileExists("/sounds/Special_Creature.ogg") and "/sounds/Special_Creature.ogg" or "/sounds/Creature_Detected.ogg")

            delay(1500)

            g_window.setTitle(pName .. " - Special Creature Detected: "..name)

            return

          end

        end

      end

    end

    if config.healthBelow then

      if hppercent() <= config.healthValue then

        playSound("/sounds/Low_Health.ogg")

        delay(1500)

        g_window.setTitle(pName .. " - Low Health! only: "..hppercent().."%")

        return

      end

    end

    if config.manaBelow then

      if manapercent() <= config.manaValue then

        playSound("/sounds/Low_Mana.ogg")

        delay(1500)

        g_window.setTitle(pName .. " - Low Mana! only: "..manapercent().."%")

        return

      end

    end

  end)

  onTalk(function(name, level, mode, text, channelId, pos)

    if mode == 4 and config.enabled and config.privateMessage then

      playSound("/sounds/Private_Message.ogg")

      g_window.setTitle(pName .. " - Private Message from: " .. name)

      return

    end

  end)

end

ui.alerts.onClick = function(widget)

  alarmsWindow:show()

  alarmsWindow:raise()

  alarmsWindow:focus()

end

```

---
# alarms.otui
```otui

AlarmsWindow < MainWindow

  !text: tr('Alarms')

  size: 300 280

  @onEscape: self:hide()

  BotSwitch

    id: playerAttack

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

    text: Player Attack

    !tooltip: tr('Alerts when attacked by player.')

  BotSwitch

    id: playerDetected

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 4

    text-align: center

    text: Player Detected

    !tooltip: tr('Alerts when a player is detected on screen.')

  CheckBox

    id: playerDetectedLogout

    anchors.top: playerDetected.top

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    margin-top: 3

    margin-left: 4

    text: Logout

    !tooltip: tr('Attempts to logout when a player is detected on screen.')

  BotSwitch

    id: ignoreFriends

    anchors.left: parent.left

    anchors.top: playerDetected.bottom

    anchors.right: parent.right

    text-align: center

    margin-top: 4

    text: Ignore Friends

    !tooltip: tr('Player detection alerts will ignore friends.')

  HorizontalSeparator

    id: sepPlayer

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 4

  BotSwitch

    id: creatureDetected

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: sepPlayer.bottom

    margin-top: 4

    text-align: center

    text: Creature Detected

    !tooltip: tr('Alerts when a creature is detected on screen.')

  BotSwitch

    id: warnBoss

    anchors.left: parent.left

    anchors.top: prev.bottom

    anchors.right: parent.horizontalCenter

    text-align: center

    margin-top: 5

    text: Creature Name

    !tooltip: tr('Alerts when a creature/npc with name is detected on screen. \n eg: Benjamin or [boss] would detect a creature with [boss] in name. \n You can add many examples, just separate them by comma.')

  BotTextEdit

    id: bossName

    anchors.left: prev.right

    margin-left: 4

    anchors.top: prev.top

    anchors.right: parent.right

    margin-top: 1

    height: 17

    font: terminus-10px

  HorizontalSeparator

    id: sepCreature

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 4

  BotSwitch

    id: healthBelow

    anchors.left: parent.left

    anchors.top: prev.bottom

    anchors.right: parent.horizontalCenter

    text-align: center

    margin-top: 4

    text: Health < 50%

  HorizontalScrollBar

    id: healthValue

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: healthBelow.top

    margin-left: 3

    margin-top: 2

    minimum: 1

    maximum: 100

    step: 1

  BotSwitch

    id: manaBelow

    anchors.left: parent.left

    anchors.top: healthBelow.bottom

    anchors.right: parent.horizontalCenter

    text-align: center

    margin-top: 4

    text: Mana < 50%

  HorizontalScrollBar

    id: manaValue

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: manaBelow.top

    margin-left: 3

    margin-top: 2

    minimum: 1

    maximum: 100

    step: 1

  HorizontalSeparator

    id: sepMessages

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 4

  BotSwitch

    id: privateMessage

    anchors.left: parent.left

    anchors.top: prev.bottom

    anchors.right: parent.right

    text-align: center

    margin-top: 4

    text: Private Message

    !tooltip: tr('Alerts when recieving a private message.')

  BotSwitch

    id: warnMessage

    anchors.left: parent.left

    anchors.top: prev.bottom

    anchors.right: parent.horizontalCenter

    text-align: center

    margin-top: 5

    text: Message Alert

    !tooltip: tr('Alerts when players receive a message that contains given part. \n Eg. event - will trigger alert whenever a message with word event appears. \n You can give many examples, just separate them by comma.')

  BotTextEdit

    id: messageText

    anchors.left: prev.right

    margin-left: 4

    anchors.top: prev.top

    anchors.right: parent.right

    margin-top: 1

    height: 17

    font: terminus-10px

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

```

---
# analyzer.lua
```lua

--[[

  Bot-based Tibia 12 features v1.1

  made by Vithrax

  Credits also to:

  - Lee#7725

  Thanks for ideas, graphics, functions, design tips!

  br, Vithrax

]]

vBot.CaveBotData = vBot.CaveBotData or {

  refills = 0,

  rounds = 0,

  time = {},

  lastRefill = os.time(),

  refillTime = {}

}

local lootWorth = 0

local wasteWorth = 0

local balance = 0

local balanceDesc = ""

local hourDesc = ""

local desc = ""

local hour = ""

local launchTime = now

local startExp = exp()

local dmgTable = {}

local healTable = {}

local expTable = {}

local totalDmg = 0

local totalHeal = 0

local dmgDistribution = {}

local first = {l="-", r="0"}

local second = {l="-", r="0"}

local third = {l="-", r="0"}

local fourth = {l="-", r="0"}

local five = {l="-", r="0"}

storage.bestHit = storage.bestHit or 0

storage.bestHeal = storage.bestHeal or 0

local lootedItems = {}

local useData = {}

local usedItems ={}

local lastDataSend = {0, 0}

local analyzerButton

local killList = {}

local membersData = {}

HuntingSessionStart = os.date('%Y-%m-%d, %H:%M:%S')

if not storage.analyzers then

  storage.analyzers = {

    trackedLoot = {},

    customPrices = {},

    lootChannel = true,

    rarityFrames = true

}

end

storage.analyzers = storage.analyzers or {}

storage.analyzers.trackedLoot = storage.analyzers.trackedLoot or {}

local trackedLoot = storage.analyzers.trackedLoot

--destroy old windows

local windowsTable = {"MainAnalyzerWindow",

                      "HuntingAnalyzerWindow",

                      "LootAnalyzerWindow",

                      "SupplyAnalyzerWindow",

                      "ImpactAnalyzerWindow",

                      "XPAnalyzerWindow",

                      "PartyAnalyzerWindow",

                      "DropTracker",

                      "CaveBotStats"

}

                      for i, window in ipairs(windowsTable) do

  local element = g_ui.getRootWidget():recursiveGetChildById(window)

  if element then

    element:destroy()

  end

end

local mainWindow = UI.createMiniWindow("MainAnalyzerWindow")

mainWindow:hide()

mainWindow:setContentMaximumHeight(240)

local huntingWindow = UI.createMiniWindow("HuntingAnalyzer")

huntingWindow:hide()

local lootWindow = UI.createMiniWindow("LootAnalyzer")

lootWindow:hide()

local supplyWindow = UI.createMiniWindow("SupplyAnalyzer")

supplyWindow:hide()

local impactWindow = UI.createMiniWindow("ImpactAnalyzer")

impactWindow:hide()

impactWindow:setContentMaximumHeight(615)

local xpWindow = UI.createMiniWindow("XPAnalyzer")

xpWindow:hide()

xpWindow:setContentMaximumHeight(230)

local settingsWindow = UI.createWindow("FeaturesWindow")

settingsWindow:hide()

local partyHuntWindow = UI.createMiniWindow("PartyAnalyzerWindow")

partyHuntWindow:hide()

local dropTrackerWindow = UI.createMiniWindow("DropTracker")

dropTrackerWindow:hide()

local statsWindow = UI.createMiniWindow("CaveBotStats")

statsWindow:hide()

--f

local toggle = function()

    if mainWindow:isVisible() then

        analyzerButton:setOn(false)

        mainWindow:close()

    else

        analyzerButton:setOn(true)

        mainWindow:open()

    end

end

local drawGraph = function(graph, value)

    graph:addValue(value)

end

local toggleAnalyzer = function(window)

    if window:isVisible() then

        window:hide()

    else

        window:show()

    end

end

local function getSumStats()

  local totalWaste = 0

  local totalLoot = 0

  for k,v in pairs(membersData) do

    totalWaste = totalWaste + v.waste

    totalLoot = totalLoot + v.loot

  end

  local totalBalance = totalLoot - totalWaste

  return totalWaste, totalLoot, totalBalance

end

local function clipboardData()

  local totalWaste, totalLoot, totalBalance = getSumStats()

  local final = ""

  local first = "Session data: From " .. HuntingSessionStart .." to ".. os.date('%Y-%m-%d, %H:%M:%S')

  local second = "Session: " .. sessionTime()

  local third = "Loot Type: Market"

  local fourth = "Loot " .. format_thousand(totalLoot, true)

  local fifth = "Supplies " .. format_thousand(totalWaste, true)

  local six = "Balance " .. format_thousand(totalBalance, true)

  local t = {first, second, third, fourth, fifth, six}

  for i, string in ipairs(t) do

    final = final.. "\n"..string

  end

  --user data now

  for k,v in pairs(membersData) do

    final = final.. "\n".. k

    final = final.. "\n\tLoot "..v.loot

    final = final.. "\n\tSupplies "..v.waste

    final = final.. "\n\tBalance "..v.balance

    final = final.. "\n\tDamage "..v.damage

    final = final.. "\n\tHealing "..v.heal

  end

  g_window.setClipboardText(final)

end

-- create analyzers button

analyzerButton = modules.game_buttons.buttonsWindow.contentsPanel and modules.game_buttons.buttonsWindow.contentsPanel.buttons.botAnalyzersButton

analyzerButton = analyzerButton or modules.client_topmenu.getButton("botAnalyzersButton")

if analyzerButton then

    analyzerButton:destroy()

end

--button

analyzerButton = modules.client_topmenu.addRightGameToggleButton('botAnalyzersButton', 'vBot Analyzers', '/images/topbuttons/analyzers', toggle, false, 999999)

analyzerButton:setOn(false)

--toggles window

mainWindow.contentsPanel.HuntingAnalyzer.onClick = function()

    toggleAnalyzer(huntingWindow)

end

mainWindow.onClose = function()

  analyzerButton:setOn(false)

end

mainWindow.contentsPanel.LootAnalyzer.onClick = function()

    toggleAnalyzer(lootWindow)

end

mainWindow.contentsPanel.SupplyAnalyzer.onClick = function()

    toggleAnalyzer(supplyWindow)

end

mainWindow.contentsPanel.ImpactAnalyzer.onClick = function()

    toggleAnalyzer(impactWindow)

end

mainWindow.contentsPanel.XPAnalyzer.onClick = function()

    toggleAnalyzer(xpWindow)

end

mainWindow.contentsPanel.PartyHunt.onClick = function()

  toggleAnalyzer(partyHuntWindow)

end

mainWindow.contentsPanel.DropTracker.onClick = function()

  toggleAnalyzer(dropTrackerWindow)

end

mainWindow.contentsPanel.Stats.onClick = function()

  toggleAnalyzer(statsWindow)

end

--stats window

local totalRounds = UI.DualLabel("Total Rounds:", "0", {}, statsWindow.contentsPanel).right

local avRoundTime = UI.DualLabel("Time by Round:", "00:00h", {}, statsWindow.contentsPanel).right

UI.Separator(statsWindow.contentsPanel)

local totalRefills = UI.DualLabel("Total Refills:", "0", {}, statsWindow.contentsPanel).right

local avRefillTime = UI.DualLabel("Time by Refill:", "00:00h", {}, statsWindow.contentsPanel).right

local lastRefill = UI.DualLabel("Time since Refill:", "00:00h", {maxWidth = 200}, statsWindow.contentsPanel).right

UI.Separator(statsWindow.contentsPanel)

local label = UI.DualLabel("Supplies by Round:", "", {maxWidth = 200}, statsWindow.contentsPanel).left

label:setColor('#EC9706')

local suppliesByRound = UI.createWidget("AnalyzerItemsPanel", statsWindow.contentsPanel)

UI.Separator(statsWindow.contentsPanel)

label = UI.DualLabel("Supplies by Refill:", "", {maxWidth = 200}, statsWindow.contentsPanel).left

label:setColor('#ED7117')

local suppliesByRefill = UI.createWidget("AnalyzerItemsPanel", statsWindow.contentsPanel)

UI.Separator(statsWindow.contentsPanel)

--huntig

local sessionTimeLabel = UI.DualLabel("Session:", "00:00h", {}, huntingWindow.contentsPanel).right

local xpGainLabel = UI.DualLabel("XP Gain:", "0", {}, huntingWindow.contentsPanel).right

local xpHourLabel = UI.DualLabel("XP/h:", "0", {}, huntingWindow.contentsPanel).right

local lootLabel = UI.DualLabel("Loot:", "0", {}, huntingWindow.contentsPanel).right

local suppliesLabel = UI.DualLabel("Supplies:", "0", {}, huntingWindow.contentsPanel).right

local balanceLabel = UI.DualLabel("Balance:", "0", {}, huntingWindow.contentsPanel).right

local damageLabel = UI.DualLabel("Damage:", "0", {}, huntingWindow.contentsPanel).right

local damageHourLabel = UI.DualLabel("Damage/h:", "0", {}, huntingWindow.contentsPanel).right

local healingLabel = UI.DualLabel("Healing:", "0", {}, huntingWindow.contentsPanel).right

local healingHourLabel = UI.DualLabel("Healing/h:", "0", {}, huntingWindow.contentsPanel).right

UI.DualLabel("Killed Monsters:", "", {maxWidth = 200}, huntingWindow.contentsPanel)

local killedList = UI.createWidget("AnalyzerListPanel", huntingWindow.contentsPanel)

UI.DualLabel("Looted items:", "", {maxWidth = 200}, huntingWindow.contentsPanel)

local lootList = UI.createWidget("AnalyzerListPanel", huntingWindow.contentsPanel)

--party

UI.Button("Copy to Clipboard", function() clipboardData() end, partyHuntWindow.contentsPanel)

UI.Button("Reset Sessions", function()

  if BotServer._websocket then

    BotServer.send("partyHunt", false)

  end

end, partyHuntWindow.contentsPanel)

local switch = addSwitch("sendData", "Send Analyzer Data", function(widget)

  widget:setOn(not widget:isOn())

  storage.sendPartyAnalyzerData = widget:isOn()

end, partyHuntWindow.contentsPanel)

switch:setOn(storage.sendPartyAnalyzerData)

UI.Separator(partyHuntWindow.contentsPanel)

local partySessionTimeLabel = UI.DualLabel("Session:", "00:00h", {}, partyHuntWindow.contentsPanel).right

local partyLootLabel = UI.DualLabel("Loot:", "0", {}, partyHuntWindow.contentsPanel).right

local partySuppliesLabel = UI.DualLabel("Supplies:", "0", {}, partyHuntWindow.contentsPanel).right

local partyBalanceLabel = UI.DualLabel("Balance:", "0", {}, partyHuntWindow.contentsPanel).right

UI.Separator(partyHuntWindow.contentsPanel)

local function maintainDropTable()

  local panel = dropTrackerWindow.contentsPanel

  for k,v in pairs(trackedLoot) do

    local widget = panel[k]

    if not widget then

      trackedLoot[k] = nil

    end

  end

end

local function createTrackedItems()

  local panel = dropTrackerWindow.contentsPanel

  for i, child in ipairs(panel:getChildren()) do

    if i > 2 then

      child:destroy()

    end

  end

  for k,v in pairs(trackedLoot) do

    local dropLoot = UI.createWidget("TrackerItem", dropTrackerWindow.contentsPanel)

    local item = dropLoot.item

    local name = dropLoot.name

    local drops = dropLoot.drops

    local id = tonumber(k)

    local itemName = id == 3031 and "gold coin" or id == 3035 and "platinum coin" or id == 3043 and "crystal coin" or Item.create(id):getMarketData().name

    dropLoot:setId(id)

    item:setItemId(id)

    if item:getItemCount() > 1 then

      item:setItemCount(1)

    end

    name:setText(itemName)

    drops:setText("Loot Drops: "..v)

    dropLoot.onDoubleClick = function()

      local id = dropLoot.item:getItemId()

      trackedLoot[tostring(id)] = 0

      drops:setText("Loot Drops: 0")

    end

    for i, child in pairs(dropLoot:getChildren()) do

      child:setTooltip("Double click to reset or clear item to remove.")

    end

    item.onItemChange = function(widget)

      local id = widget:getItemId()

      if id == 0 then

        trackedLoot[widget:getParent():getId()] = nil

        if tonumber(widget:getParent():getId()) then

          widget:getParent():destroy()

          return

        end

        widget:setImageSource('/images/ui/item')

        widget:getParent():setId("blank")

        name:setText("Set Item to start track.")

        drops:setText("Loot Drops: 0")

        return

      end

    -- only amount have changed, ignore

      if tonumber(widget:getParent():getId()) == id then return end

      local itemName = id == 3031 and "gold coin" or id == 3035 and "platinum coin" or id == 3043 and "crystal coin" or Item.create(id):getMarketData().name

      if trackedLoot[tostring(id)] then

        warn("vBot[Drop Tracker]: Item already added!")

        name:setText("Set Item to start track.")

        widget:setItemId(0)

        return

      end

      widget:setImageSource('')

      drops:setText("Loot Drops: 0")

      name:setText(itemName)

      trackedLoot[tostring(id)] = trackedLoot[tostring(id)] or 0

      widget:getParent():setId(id)

      maintainDropTable()

    end

  end

end

--drop tracker

UI.Button("Add item to track drops", function()

  local dropLoot = UI.createWidget("TrackerItem", dropTrackerWindow.contentsPanel)

  local item = dropLoot.item

  local name = dropLoot.name

  local drops = dropLoot.drops

  item:setImageSource('/images/ui/item')

  dropLoot.onDoubleClick = function()

    local id = dropLoot.item:getItemId()

    trackedLoot[tostring(id)] = 0

    drops:setText("Loot Drops: 0")

  end

  for i, child in pairs(dropLoot:getChildren()) do

    child:setTooltip("Double click to reset or clear item to remove.")

  end

  item.onItemChange = function(widget)

    local id = widget:getItemId()

    if id == 0 then

      trackedLoot[widget:getParent():getId()] = nil

      if tonumber(widget:getParent():getId()) then

        widget:getParent():destroy()

        return

      end

      widget:setImageSource('/images/ui/item')

      widget:getParent():setId("blank")

      name:setText("Set Item to start track.")

      drops:setText("Loot Drops: 0")

      return

    end

    -- only amount have changed, ignore

    if tonumber(widget:getParent():getId()) == id then return end

    local itemName = id == 3031 and "gold coin" or id == 3035 and "platinum coin" or id == 3043 and "crystal coin" or Item.create(id):getMarketData().name

    if trackedLoot[tostring(id)] then

      warn("vBot[Drop Tracker]: Item already added!")

      name:setText("Set Item to start track.")

      widget:setItemId(0)

      return

    end

    widget:setImageSource('')

    drops:setText("Loot Drops: 0")

    name:setText(itemName)

    trackedLoot[tostring(id)] = trackedLoot[tostring(id)] or 0

    widget:getParent():setId(id)

    maintainDropTable()

  end

end, dropTrackerWindow.contentsPanel)

UI.Separator(dropTrackerWindow.contentsPanel)

createTrackedItems()

--loot

local lootInLootAnalyzerLabel = UI.DualLabel("Gold Value:", "0", {}, lootWindow.contentsPanel).right

local lootHourInLootAnalyzerLabel = UI.DualLabel("Per Hour:", "0", {}, lootWindow.contentsPanel).right

UI.Separator(lootWindow.contentsPanel)

--//items panel

local lootItems = UI.createWidget("AnalyzerItemsPanel", lootWindow.contentsPanel)

UI.Separator(lootWindow.contentsPanel)

--//graph

local lootGraph = UI.createWidget("AnalyzerGraph", lootWindow.contentsPanel)

      lootGraph:setTitle("Loot/h")

      drawGraph(lootGraph, 0)

--supplies

local suppliesInSuppliesAnalyzerLabel = UI.DualLabel("Gold Value:", "0", {}, supplyWindow.contentsPanel).right

local suppliesHourInSuppliesAnalyzerLabel = UI.DualLabel("Per Hour:", "0", {}, supplyWindow.contentsPanel).right

UI.Separator(supplyWindow.contentsPanel)

--//items panel

local supplyItems = UI.createWidget("AnalyzerItemsPanel", supplyWindow.contentsPanel)

UI.Separator(supplyWindow.contentsPanel)

--//graph

local supplyGraph = UI.createWidget("AnalyzerGraph", supplyWindow.contentsPanel)

      supplyGraph:setTitle("Waste/h")

      drawGraph(supplyGraph, 0)

-- impact

--- damage

local title = UI.DualLabel("Damage", "", {}, impactWindow.contentsPanel).left

title:setColor('#E3242B')

local totalDamageLabel = UI.DualLabel("Total:", "0", {}, impactWindow.contentsPanel).right

local maxDpsLabel = UI.DualLabel("Max-DPS:", "0", {}, impactWindow.contentsPanel).right

local bestHitLabel = UI.DualLabel("All-Time High:", "0", {}, impactWindow.contentsPanel).right

UI.Separator(impactWindow.contentsPanel)

local dmgGraph = UI.createWidget("AnalyzerGraph", impactWindow.contentsPanel)

      dmgGraph:setTitle("DPS")

      drawGraph(dmgGraph, 0)

--- distribution

UI.Separator(impactWindow.contentsPanel)

local title2 = UI.DualLabel("Damage Distribution", "", {maxWidth = 150}, impactWindow.contentsPanel).left

title2:setColor('#FABD02')

local top1 = UI.DualLabel("-", "0", {maxWidth = 200}, impactWindow.contentsPanel)

local top2 = UI.DualLabel("-", "0", {maxWidth = 200}, impactWindow.contentsPanel)

local top3 = UI.DualLabel("-", "0", {maxWidth = 200}, impactWindow.contentsPanel)

local top4 = UI.DualLabel("-", "0", {maxWidth = 200}, impactWindow.contentsPanel)

local top5 = UI.DualLabel("-", "0", {maxWidth = 200}, impactWindow.contentsPanel)

top1.left:setWidth(135)

top2.left:setWidth(135)

top3.left:setWidth(135)

top4.left:setWidth(135)

top5.left:setWidth(135)

--- healing

UI.Separator(impactWindow.contentsPanel)

local title3 = UI.DualLabel("Healing", "", {}, impactWindow.contentsPanel).left

title3:setColor('#03C04A')

local totalHealingLabel = UI.DualLabel("Total:", "0", {}, impactWindow.contentsPanel).right

local maxHpsLabel = UI.DualLabel("Max-HPS:", "0", {}, impactWindow.contentsPanel).right

local bestHealLabel = UI.DualLabel("All-Time High:", "0", {}, impactWindow.contentsPanel).right

UI.Separator(impactWindow.contentsPanel)

--//graph

local healGraph = UI.createWidget("AnalyzerGraph", impactWindow.contentsPanel)

      healGraph:setTitle("HPS")

      drawGraph(healGraph, 0)

--xp

local xpGrainInXpLabel = UI.DualLabel("XP Gain:", "0", {}, xpWindow.contentsPanel).right

local xpHourInXpLabel = UI.DualLabel("XP/h:", "0", {}, xpWindow.contentsPanel).right

local nextLevelLabel = UI.DualLabel("Next Level:", "-", {}, xpWindow.contentsPanel).right

local progressBar = UI.createWidget("AnalyzerProgressBar", xpWindow.contentsPanel)

progressBar:setPercent(modules.game_skills.skillsWindow.contentsPanel.level.percent:getPercent())

UI.Separator(xpWindow.contentsPanel)

--//graph

local xpGraph = UI.createWidget("AnalyzerGraph", xpWindow.contentsPanel)

      xpGraph:setTitle("XP/h")

      drawGraph(xpGraph, 0)

--#############################################

--#############################################   UI DONE

--#############################################

--#############################################

--#############################################

--#############################################

setDefaultTab("Main")

-- first, the variables

local console = modules.game_console

local regex = [[ ([^,|^.]+)]]

local noData = {}

local data = {}

local function getColor(v)

    if v >= 10000000 then -- 10kk, red

        return "#FF0000"

    elseif v >= 5000000 then -- 5kk, orange

        return "#FFA500"

    elseif v >= 1000000 then -- 1kk, yellow

        return "#FFFF00"

    elseif v >= 100000 then -- 100k, purple

        return "#F25AED"

    elseif v >= 10000 then -- 10k, blue

        return "#5F8DF7"

    elseif v >= 1000 then -- 1k, green

        return "#00FF00"

    elseif v >= 50 then

        return "#FFFFFF" -- 50gp, white

    else

      return "#aaaaaa" -- less than 100gp, grey

    end

end

local function formatStr(str)

    if string.starts(str, "a ") then

        str = str:sub(2, #str)

    elseif string.starts(str, "an ") then

      str = str:sub(3, #str)

    end

    local n = getFirstNumberInText(str)

    if n then

        str = string.split(str, tostring(n))[1]

        str = str:sub(1,#str-1)

    end

    return str:trim()

end

local function getPrice(name)

    name = formatStr(name)

    name = name:lower()

    -- first check custom prices

    if storage.analyzers.customPrices[name] then

      return storage.analyzers.customPrices[name]

    end

    -- if already checked and no data skip looping items.lua

    if noData[name] then

        return 0

    end

    -- maybe was already checked, if so, skip looping items.lua

    if data[name] then

        return data[name]

    end

    -- searching in items.lua - big table, if possible skip

    for k,v in pairs(LootItems) do

        if name == k then

            data[name] = v

            return v

        end

    end

    -- if no data, save it and return 0

    noData[name] = true

    return 0

end

local expGained = function()

  return exp() - startExp

end

function format_thousand(v, comma)

  comma = comma and "," or "."

  if not v then return 0 end

  local s = string.format("%d", math.floor(v))

  local pos = string.len(s) % 3

  if pos == 0 then pos = 3 end

  return string.sub(s, 1, pos)

  .. string.gsub(string.sub(s, pos+1), "(...)", comma.."%1")

end

local expLeft = function()

  local level = lvl()+1

  return math.floor((50*level*level*level)/3 - 100*level*level + (850*level)/3 - 200) - exp()

end

niceTimeFormat = function(v, seconds) -- v in seconds

  local hours = string.format("%02.f", math.floor(v/3600))

  local mins = string.format("%02.f", math.floor(v/60 - (hours*60)))

  local secs = string.format("%02.f", math.floor(math.mod(v, 60)))

  local final = string.format('%s:%s%s',hours,mins,seconds and ":"..secs or "")

 return final

end

local uptime

sessionTime = function()

  uptime = math.floor((now - launchTime)/1000)

  return niceTimeFormat(uptime)

end

sessionTime()

local expPerHour = function(calculation)

  local r = 0

  if #expTable > 0 then

      r = exp() - expTable[1]

  else

      return "-"

  end

  if uptime < 15*60 then

      r = math.ceil((r/uptime)*60*60)

  else

      r = math.ceil(r*8)

  end

  if calculation then

      return r

  else

      return format_thousand(r)

  end

end

local function add(t, text, color, last)

    table.insert(t, text)

    table.insert(t, color)

    if not last then

        table.insert(t, ", ")

        table.insert(t, "#FFFFFF")

    end

end

-- Bot Server

local function sendData()

  if BotServer._websocket then

    local totalDmg, totalHeal, lootWorth, wasteWorth, balance = getHuntingData()

    local outfit = player:getOutfit()

    outfit.mount = 0

    local t = {

      totalDmg,

      totalHeal,

      balance,

      hppercent(),

      manapercent(),

      outfit,

      player:isPartyLeader(),

      lootWorth,

      wasteWorth,

      modules.game_skills.skillsWindow.contentsPanel.stamina.value:getText(),

      format_thousand(expGained()),

      expPerHour(),

      balanceDesc .. " (" .. hourDesc .. ")",

      sessionTime()

}

    -- validation

    if lastDataSend.totalDmg ~= t[1] and lastDataSend.totalHeal ~= t[2] then

      BotServer.send("partyHunt", t)

      lastDataSend[1] = t[1]

      lastDataSend[2] = t[2]

    end

  end

end

-- process data

BotServer.listen("partyHunt", function(name, message)

  if message == true then

    sendData()

  elseif message == false then

    resetAnalyzerSessionData()

  else

    membersData[name] = {

      damage = message[1],

      heal = message[2],

      balance = message[3],

      hp = message[4],

      mana = message[5],

      outfit = message[6],

      leader = message[7],

      loot = message[8],

      waste = message[9],

      stamina = message[10],

      expGained = message[11],

      expH = message[12],

      balanceH = message[13],

      session = message[14]

}

    local widgetName = "Widget"..name

    local widget = partyHuntWindow.contentsPanel[widgetName] or UI.createWidget("MemberWidget", partyHuntWindow.contentsPanel)

    widget:setId(widgetName)

    widget.lastUpdate = now

    local t = membersData[name]

    widget.name:setText(name)

    widget.name:setColor("white")

    if t.leader then

      widget.name:setColor('#f8db38')

    end

    schedule(10*1000, function()

      if widget and widget.lastUpdate and now - widget.lastUpdate > 10000 then

        widget.name:setText(widget.name:getText().. " [inactive]")

        widget.name:setColor("#aeaeae")

        widget.health:setBackgroundColor("#aeaeae")

        widget.mana:setBackgroundColor("#aeaeae")

        widget.balance.value:setText("-")

        widget.damage.value:setText("-")

        widget.healing.value:setText("-")

        widget.creature:disable()

      end

    end)

    widget.creature:setOutfit(t.outfit)

    widget.health:setPercent(t.hp)

    widget.health:setBackgroundColor("#00c000")

    widget.mana:setPercent(t.mana)

    widget.mana:setBackgroundColor("#0000FF")

    widget.balance.value:setText(format_thousand(t.balance))

    if t.balance < 0 then

      widget.balance.value:setColor('#ff9854')

    elseif t.balance > 0 then

      widget.balance.value:setColor('#45ad25')

    else

      widget.balance.value:setColor('white')

    end

    widget.damage.value:setText(format_thousand(t.damage))

    widget.healing.value:setText(format_thousand(t.heal))

    widget.onDoubleClick = function()

      membersData[name] = nil

      widget:destroy()

    end

    --tooltip

    local tooltip = "Session: "..t.session.."\n"..

                    "Stamina: "..t.stamina.."\n"..

                    "Exp Gained: "..t.expGained.."\n"..

                    "Exp per Hour: "..t.expH.."\n"..

                    "Balance: "..t.balanceH

    widget.creature:setTooltip(tooltip)

  end

end)

function hightlightText(widget, color, duration)

  for i=0,duration do

    schedule(i * 250, function()

      if i == duration or (i > 0 and i % 2 == 0) then

        widget:setColor("#FFFFFF")

      else

        widget:setColor(color)

      end

    end)

  end

end

local nameRegex = [[Loot of (?:an |a |the |)([^:]+)]]

onTextMessage(function(mode, text)

    if not storage.analyzers.lootChannel then return end

    if not text:find("Loot of") and not text:find("The following items are available in your reward chest") then return end

    local name

    -- adding monster to killed list

    if text:find("Loot of") then

      name = regexMatch(text, nameRegex)[1][2]

      if not killList[name] then

        killList[name] = 1

      else

        killList[name] = killList[name] + 1

      end

      refreshKills()

    end

    -- variables

    local split = string.split(text, ":")

    local re = regexMatch(split[2], regex)

    local combinedWorth = 0

    local formatted

    local div

    local t = {}

    local messageT = {}

    -- add timestamp, creature part and color it as white

    add(t, os.date('%H:%M') .. ' ' .. split[1]..": ", "#FFFFFF", true)

    add(messageT, split[1]..": ", "#FFFFFF", true)

    -- main part

    if re ~= 0 then

        for i=1,#re do

            local data = re[i][2] -- each looted item

            local formattedLoot = regexMatch(data, [[(^[^(]+)]])[1][1]

            formattedLoot = formattedLoot:trim()

            local amount = getFirstNumberInText(formattedLoot) -- amount found in data

            local price = amount and getPrice(formattedLoot) * amount or getPrice(formattedLoot) -- if amount then multity price, else just take price

            local color = getColor(price) -- generate hex string based off price

            local messageColor = getColor(getPrice(formattedLoot))

            combinedWorth = combinedWorth + price -- add all prices to calculate total worth

            add(t, data, color, i==#re)

            add(messageT, data, color, i==#re)

            --drop tracker

            for i, child in ipairs(dropTrackerWindow.contentsPanel:getChildren()) do

              local childName = child.name

              childName = childName and childName:getText()

              if childName and formattedLoot:find(childName) then

                trackedLoot[tostring(child.item:getItemId())] = trackedLoot[tostring(child.item:getItemId())] + (amount or 1)

                child.drops:setText("Loot Drops: "..trackedLoot[tostring(child.item:getItemId())])

                hightlightText(child.name,"#f0b400", 8)

                modules.game_textmessage.messagesPanel.statusLabel:setVisible(true)

                modules.game_textmessage.messagesPanel.statusLabel:setColoredText({

                  "Valuable loot: ", "#f0b400",

                  childName.."", messageColor,

                  " dropped by "..name.."!", "#f0b400"

})

                schedule(3000, function()

                  modules.game_textmessage.messagesPanel.statusLabel:setVisible(false)

                end)

              end

            end

        end

    end

    -- format total worth so it wont look obnoxious

    if combinedWorth >= 1000000 then

        div = combinedWorth/1000000

        formatted = math.floor(div) .. "." .. math.floor(div * 10) % 10 .. "kk"

    elseif combinedWorth >= 1000 then

        div = combinedWorth/1000

        formatted = math.floor(div) .. "." .. math.floor(div * 10) % 10 .. "k"

    else

        formatted = combinedWorth .. "gp"

    end

    if modules.game_textmessage.messagesPanel.centerTextMessagePanel.highCenterLabel:getText() == text then

      modules.game_textmessage.messagesPanel.centerTextMessagePanel.highCenterLabel:setColoredText(messageT)

      schedule(math.max(#text * 50, 2000), function()

        modules.game_textmessage.messagesPanel.centerTextMessagePanel.highCenterLabel:setVisible(false)

      end)

    end

    -- add total worth to string

    add(t, " - (", "#FFFFFF", true)

    add(t, formatted, getColor(combinedWorth), true)

    add(t, ")", "#FFFFFF", true)

    -- get/create tab and write raw message

    local tabName = "vBot Loot"

    local tab = console.getTab(tabName) or console.addTab(tabName, true)

    console.addText(text, console.SpeakTypesSettings, tabName, "")

    -- find last message in given tab and rewrite it with formatted string

    local panel = console.consoleTabBar:getTabPanel(tab)

    local consoleBuffer = panel:getChildById('consoleBuffer')

    local message = consoleBuffer:getLastChild()

    message:setColoredText(t)

end)

local function niceFormat(v)

  local div

  local formatted

    if v >= 10000000 then

      div = v/10000000

      formatted = math.ceil(div) .. "M"

    elseif v >= 1000000 then

      div = v/1000000

      formatted = math.floor(div) .. "." .. math.floor(div * 10) % 10 .. "M"

    elseif v >= 10000 then

      div = v/1000

      formatted = math.floor(div) .. "k"

    elseif v >= 1000 then

        div = v/1000

        formatted = math.floor(div) .. "." .. math.floor(div * 10) % 10 .. "k"

    else

        formatted = v

    end

    return formatted

end

resetAnalyzerSessionData = function()

    vBot.CaveBotData = vBot.CaveBotData or {

      refills = 0,

      rounds = 0,

      time = {},

      lastRefill = os.time(),

      refillTime = {}

}

    launchTime = now

    startExp = exp()

    dmgTable = {}

    healTable = {}

    expTable = {}

    totalDmg = 0

    totalHeal = 0

    dmgDistribution = {}

    first = {l="-", r="0"}

    second = {l="-", r="0"}

    third = {l="-", r="0"}

    fourth = {l="-", r="0"}

    five = {l="-", r="0"}

    lootedItems = {}

    useData = {}

    usedItems ={}

    refreshLoot()

    refreshWaste()

    xpGraph:clear()

    drawGraph(xpGraph, 0)

    lootGraph:clear()

    drawGraph(lootGraph, 0)

    supplyGraph:clear()

    drawGraph(supplyGraph, 0)

    dmgGraph:clear()

    drawGraph(dmgGraph, 0)

    healGraph:clear()

    drawGraph(healGraph, 0)

    killList = {}

    refreshKills()

    HuntingSessionStart = os.date('%Y-%m-%d, %H:%M:%S')

end

mainWindow.contentsPanel.ResetSession.onClick = function()

  resetAnalyzerSessionData()

end

mainWindow.contentsPanel.Settings.onClick = function()

  settingsWindow:show()

  settingsWindow:raise()

  settingsWindow:focus()

end

-- extras window

settingsWindow.closeButton.onClick = function()

  settingsWindow:hide()

end

local function getFrame(v)

  if v >= 1000000 then

      return '/images/ui/rarity_gold'

  elseif v >= 100000 then

      return '/images/ui/rarity_purple'

  elseif v >= 10000 then

      return '/images/ui/rarity_blue'

  elseif v >= 1000 then

      return '/images/ui/rarity_green'

  else

      return '/images/ui/item'

  end

end

displayCondition = function(menuPosition, lookThing, useThing, creatureThing)

  if lookThing and not lookThing:isCreature() and not lookThing:isNotMoveable() and lookThing:isPickupable() then

    return true

  end

end

local interface = modules.game_interface

local function setFrames()

  if not storage.analyzers.rarityFrames then return end

  for _, container in pairs(getContainers()) do

      local window = container.itemsPanel

      for i, child in pairs(window:getChildren()) do

          local id = child:getItemId()

          local price = 0

          if id ~= 0 then -- there's item

              local item = Item.create(id)

              local name = item:getMarketData().name:lower()

              price = getPrice(name)

              -- set rarity frame

              child:setImageSource(getFrame(price))

          else -- empty widget

              -- revert any possible changes

              child:setImageSource("/images/ui/item")

          end

          child.onHoverChange = function(widget, hovered)

            if id == 0 or not hovered then

              return interface.removeMenuHook('analyzer')

            end

            interface.addMenuHook('analyzer', 'Price:', function() end, displayCondition, price)

        end

      end

  end

end

setFrames()

onContainerOpen(function(container, previousContainer)

  setFrames()

end)

onAddItem(function(container, slot, item, oldItem)

  setFrames()

end)

onRemoveItem(function(container, slot, item)

  setFrames()

end)

onContainerUpdateItem(function(container, slot, item, oldItem)

  setFrames()

end)

function smallNumbers(n)

  if n >= 10 ^ 6 then

      return string.format("%.1fkk", n / 10 ^ 6)

  elseif n >= 10 ^ 3 then

      return string.format("%.1fk", n / 10 ^ 3)

  else

      return tostring(n)

  end

end

function refreshList()

  local list = settingsWindow.CustomPrices

  list:destroyChildren()

  for name, price in pairs(storage.analyzers.customPrices) do

    local label = UI.createWidget("AnalyzerPriceLabel", list)

    label.remove.onClick = function()

      storage.analyzers.customPrices[name] = nil

      label:destroy()

      schedule(5, function()

        setFrames()

      end)

    end

    label:setText("["..name.."] = "..smallNumbers(price).." gp")

  end

end

refreshList()

settingsWindow.addItem.onClick = function()

  local newPrices = storage.analyzers.customPrices

  local id = settingsWindow.ID:getItemId()

  local newPrice = tonumber(settingsWindow.NewPrice:getText())

  if id < 100 then

    return warn("No item added!")

  end

  local name = Item.create(id):getMarketData().name

  if newPrices[name] then

    return warn("Item already added! Remove it from the list to set a new price!")

  end

  newPrices[name] = newPrice

  settingsWindow.ID:setItemId(0)

  settingsWindow.NewPrice:setText(0)

  schedule(5, function()

    setFrames()

  end)

  refreshList()

end

settingsWindow.LootChannel:setOn(storage.analyzers.lootChannel)

settingsWindow.LootChannel.onClick = function(widget)

  storage.analyzers.lootChannel = not storage.analyzers.lootChannel

  widget:setOn(storage.analyzers.lootChannel)

end

settingsWindow.RarityFrames:setOn(storage.analyzers.rarityFrames)

settingsWindow.RarityFrames.onClick = function(widget)

  storage.analyzers.rarityFrames = not storage.analyzers.rarityFrames

  widget:setOn(storage.analyzers.rarityFrames)

  setFrames()

end

local timeToLevel = function()

    local t = 0

    if expPerHour(true) == 0 or expPerHour() == "-" then

        return "-"

    else

        t = expLeft()/expPerHour(true)

        return niceTimeFormat(math.ceil(t*60*60))

    end

end

local sumT = function(t)

    local s = 0

    for i,v in pairs(t) do

        s = s + v.d

    end

    return s

end

local valueInSeconds = function(t)

    local d = 0

    local time = 0

    if #t > 0 then

        for i, v in ipairs(t) do

            if now - v.t <= 3000 then

                if time == 0 then

                    time = v.t

                end

                d = d + v.d

            else

              table.remove(t, 1)

            end

        end

    end

    return math.ceil(d/((now-time)/1000))

end

local regex = "You lose ([0-9]*) hitpoints due to an attack by ([a-z]*) ([a-z A-z-]*)"

onTextMessage(function(mode, text)

  local value = getFirstNumberInText(text)

    if mode == 21 then -- damage dealt

      totalDmg = totalDmg + value

        table.insert(dmgTable, {d = value, t = now})

        if value > storage.bestHit then

            storage.bestHit = value

        end

    end

    if mode == 23 then -- healing

      totalHeal = totalHeal + value

        table.insert(healTable, {d = value, t = now})

        if value > storage.bestHeal then

            storage.bestHeal = value

        end

    end

    -- damage distribution part

    if text:find("You lose") then

      local data = regexMatch(text, regex)[1]

      if data then

        local monster = data[4]

        local val = data[2]

        table.insert(dmgDistribution, {v=val,m=monster,t=now})

      end

    end

end)

function capitalFistLetter(str)

  return (string.gsub(str, "^%l", string.upper))

end

-- tables maintance

macro(500, function()

  local dmgFinal = {}

  local labelTable = {}

  local dmgSum = 0

    table.insert(expTable, exp())

    if #expTable > 15*60 then

        for i,v in pairs(expTable) do

            if i == 1 then

              table.remove(expTable, i)

            end

        end

    end

    for i,v in pairs(dmgDistribution) do

      if now - v.t > 60*1000*10 then

        table.remove(dmgDistribution, i)

      else

        dmgSum = dmgSum + v.v

        if not dmgFinal[v.m] then

          dmgFinal[v.m] = v.v

        else

          dmgFinal[v.m] = dmgFinal[v.m] + v.v

        end

      end

    end

    first = dmgFinal[1] or {l="-", r="0"}

    second = dmgFinal[2] or {l="-", r="0"}

    third = dmgFinal[3] or {l="-", r="0"}

    fourth = dmgFinal[4] or {l="-", r="0"}

    five = dmgFinal[5] or {l="-", r="0"}

    for k,v in pairs(dmgFinal) do

      table.insert(labelTable, {m=k, d=tonumber(v)})

    end

    table.sort(labelTable, function(a,b) return a.d > b.d end)

    for i,v in pairs(labelTable) do

      local val = math.floor((v.d/dmgSum)*100) .. "%"

      local words = string.split(v.m, " ")

      local name = ""

      for i, word in ipairs(words) do

        name = name .. " " .. capitalFistLetter(word)

      end

      name = name:len() < 20 and name or name:sub(1,17).."..."

      name = name:trim()..": "

      if i == 1 then

        first = {l=name, r=val}

      elseif i == 2 then

        second = {l=name, r=val}

      elseif i == 3 then

        third = {l=name, r=val}

      elseif i == 4 then

        fourth = {l=name, r=val}

      elseif i == 5 then

        five = {l=name, r=val}

      else

        break

      end

    end

end)

function getPanelHeight(panel)

  local elements = panel.List:getChildCount()

  if elements == 0 then

    return 0

  else

    local rows = math.ceil(elements/5)

    local height = rows * 35

    return height

  end

end

function refreshLoot()

    lootItems:destroyChildren()

    lootList:destroyChildren()

    for k,v in pairs(lootedItems) do

      local label1 = UI.createWidget("AnalyzerLootItem", lootItems)

      local price = v.count and getPrice(v.name) * v.count or getPrice(v.name)

      label1:setItemId(k)

      label1:setItemCount(50)

      label1:setShowCount(false)

      label1.count:setText(niceFormat(v.count))

      label1.count:setColor(getColor(price))

      local tooltipName = v.count > 1 and v.name.."s" or v.name

      label1:setTooltip(v.count .. "x " .. tooltipName .. " (Value: "..format_thousand(getPrice(v.name)).."gp, Sum: "..format_thousand(price).."gp)")

      --hunting window loot list

      local label2 = UI.createWidget("ListLabel", lootList)

      label2:setText(v.count .. "x " .. v.name)

    end

    if lootItems:getChildCount() == 0 then

      local label = UI.createWidget("ListLabel", lootList)

      label:setText("None")

    end

end

refreshLoot()

function refreshKills()

    killedList:destroyChildren()

    local kills = 0

    for k,v in pairs(killList) do

      kills = kills + 1

      local label = UI.createWidget("ListLabel", killedList)

      label:setText(v .. "x " .. k)

    end

    if kills == 0 then

      local label = UI.createWidget("ListLabel", killedList)

      label:setText("None")

    end

end

refreshKills()

function refreshWaste()

    supplyItems:destroyChildren()

    suppliesByRefill:destroyChildren()

    suppliesByRound:destroyChildren()

    local parents = {supplyItems, suppliesByRound, suppliesByRefill}

    for k,v in pairs(usedItems) do

      for i=1,#parents do

        local amount = i == 1 and v.count or

                       i == 2 and v.count/(vBot.CaveBotData.rounds + 1) or

                       i == 3 and v.count/(vBot.CaveBotData.refills + 1)

        amount = math.floor(amount)

        local label1 = UI.createWidget("AnalyzerLootItem", parents[i])

        local price = amount and getPrice(v.name) * amount or getPrice(v.name)

        label1:setItemId(k)

        label1:setItemCount(50)

        label1:setShowCount(false)

        label1.count:setText(niceFormat(amount))

        label1.count:setColor(getColor(price))

        local tooltipName = amount > 1 and v.name.."s" or v.name

        label1:setTooltip(amount .. "x " .. tooltipName .. " (Value: "..format_thousand(getPrice(v.name)).."gp, Sum: "..format_thousand(price).."gp)")

      end

    end

end

-- loot analyzer

-- adding

local containers = CaveBot.GetLootContainers()

local lastCap = freecap()

onAddItem(function(container, slot, item, oldItem)

  if not table.find(containers, container:getContainerItem():getId()) then return end

  if isInPz() then return end

  if slot > 0 then return end

  if freecap() >= lastCap then return end

  local name = item:getId()

  local tmpname = item:getId() == 3031 and "gold coin" or item:getId() == 3035 and "platinum coin" or item:getId() == 3043 and "crystal coin" or item:getMarketData().name

  if not lootedItems[name] then

    lootedItems[name] = { count = item:getCount(), name = tmpname }

  else

    lootedItems[name].count =  lootedItems[name].count + item:getCount()

  end

  lastCap = freecap()

  refreshLoot()

  -- drop tracker

end)

onContainerUpdateItem(function(container, slot, item, oldItem)

  if not table.find(containers, container:getContainerItem():getId()) then return end

  if not oldItem then return end

  if isInPz() then return end

  if freecap() == lastCap then return end

  local tmpname = item:getId() == 3031 and "gold coin" or item:getId() == 3035 and "platinum coin" or item:getId() == 3043 and "crystal coin" or item:getMarketData().name

  local amount = item:getCount() - oldItem:getCount()

  if amount < 0 then

    return

  end

  local name = item:getId()

  if not lootedItems[name] then

      lootedItems[name] = { count = amount, name = tmpname }

  else

      lootedItems[name].count = lootedItems[name].count + amount

  end

  lastCap = freecap()

  refreshLoot()

end)

-- ammo

local ammo = {16143, 763, 761, 7365, 3448, 762, 21470, 7364, 14251, 3447, 3449, 15793, 25757, 774, 35901, 6528, 7363, 3450, 16141, 25758, 14252, 3446, 16142, 35902}

onContainerUpdateItem(function(container, slot, item, oldItem)

  local id = item:getId()

  if not table.find(ammo, id) then return end

  local newCount = item:getCount()

  local oldCount = oldItem:getCount()

  local name = item:getMarketData().name

  if oldCount - newCount == 1 then

    if not usedItems[id] then

      usedItems[id] = { count = 1, name = name}

    else

      usedItems[id].count = usedItems[id].count + 1

    end

    refreshWaste()

  end

end)

-- waste

local regex3 = [[\d ([a-z A-Z]*)s...]]

local lackOfData = {}

onTextMessage(function(mode, text)

  text = text:lower()

  if not text:find("using one of") then return end

  local amount = getFirstNumberInText(text)

  local re = regexMatch(text, regex3)

  local name = re[1][2]

  local id = WasteItems[name]

  if not id then

    if not lackOfData[name] then

      lackOfData[name] = true

      print("[Analyzer] no data for item: "..name.. "inside items.lua → WasteItems")

    end

    return

  end

  if not useData[name] then

    useData[name] = amount

  else

    if math.abs(useData[name]-amount) == 1 then

      useData[name] = amount

      if not usedItems[id] then

        usedItems[id] = { count = 1, name = name}

      else

        usedItems[id].count = usedItems[id].count + 1

      end

    else

      useData[name] = amount

    end

    refreshWaste()

  end

end)

function hourVal(v)

  v = v or 0

  return (v/uptime)*3600

end

function bottingStats()

  lootWorth = 0

  wasteWorth = 0

  for k, v in pairs(lootedItems) do

    if LootItems[v.name] then

      lootWorth = lootWorth + (LootItems[v.name]*v.count)

    end

  end

  for k, v in pairs(usedItems) do

    if LootItems[v.name] then

      wasteWorth = wasteWorth + (LootItems[v.name]*v.count)

    end

  end

  balance = lootWorth - wasteWorth

  return lootWorth, wasteWorth, balance

end

function bottingLabels(lootWorth, wasteWorth, balance)

  balanceDesc = nil

  hourDesc = nil

  desc = nil

  if balance >= 1000000 or balance <= -1000000 then

    desc = balance / 1000000

    balanceDesc = math.floor(desc) .. "." .. math.floor(desc * 10) % 10 .. "kk"

  elseif balance >= 1000 or balance <= -1000 then

    desc = balance / 1000

    balanceDesc = math.floor(desc) .. "." .. math.floor(desc * 10) % 10 .."k"

  else

    balanceDesc = balance .. "gp"

  end

  hour = hourVal(balance)

  if hour >= 1000000 or hour <= -1000000 then

    desc = balance / 1000000

    hourDesc = math.floor(hourVal(desc)) .. "." .. math.floor(hourVal(desc) * 10) % 10 .. "kk/h"

  elseif hour >= 1000 or hour <= -1000 then

    desc = balance / 1000

    hourDesc = math.floor(hourVal(desc)) .. "." .. math.floor(hourVal(desc) * 10) % 10 .. "k/h"

  else

    hourDesc = math.floor(hourVal(balance)) .. "gp/h"

  end

  return balanceDesc, hourDesc

end

function reportStats()

  local lootWorth, wasteWorth, balance = bottingStats()

  local balanceDesc, hourDesc = bottingLabels(lootWorth, wasteWorth, balance)

  local a, b, c

  a = "Session Time: " .. sessionTime() .. ", Exp Gained: " .. format_thousand(expGained()) .. ", Exp/h: " .. expPerHour()

  b = " | Balance: " .. balanceDesc .. " (" .. hourDesc .. ")"

  c = a..b

  return c

end

function damageHour()

  if uptime < 5*60 then

    return totalDmg

  else

    return hourVal(totalDmg)

  end

end

function healHour()

  if uptime < 5*60 then

    return totalHeal

  else

    return hourVal(totalHeal)

  end

end

function wasteHour()

  local lootWorth, wasteWorth, balance = bottingStats()

  if uptime < 5*60 then

    return wasteWorth

  else

    return hourVal(wasteWorth)

  end

end

function lootHour()

  local lootWorth, wasteWorth, balance = bottingStats()

  if uptime < 5*60 then

    return lootWorth

  else

    return hourVal(lootWorth)

  end

end

function getHuntingData()

  local lootWorth, wasteWorth, balance = bottingStats()

  return totalDmg, totalHeal, lootWorth, wasteWorth, balance

end

function avgTable(t)

  if type(t) ~= 'table' then return 0 end

  local val = 0

  for i,v in pairs(t) do

    val = val + v

  end

  if #t == 0 then

    return 0

  else

    return val/#t

  end

end

--bestdps/hps

local bestDPS = 0

local bestHPS = 0

--main loop

macro(500, function()

    local lootWorth, wasteWorth, balance = bottingStats()

    local balanceDesc, hourDesc = bottingLabels(lootWorth, wasteWorth, balance)

    -- hps and dps

    local curHPS = valueInSeconds(healTable)

    local curDPS = valueInSeconds(dmgTable)

    bestHPS = bestHPS > curHPS and bestHPS or curHPS

    bestDPS = bestDPS > curDPS and bestDPS or curDPS

    --hunt window

    sessionTimeLabel:setText(sessionTime())

    xpGainLabel:setText(format_thousand(expGained()))

    xpHourLabel:setText(expPerHour())

    lootLabel:setText(format_thousand(lootWorth))

    suppliesLabel:setText(format_thousand(wasteWorth))

    balanceLabel:setColor(balance >= 0 and "#45ad25" or "#ff9854")

    balanceLabel:setText(balanceDesc .. " (" .. hourDesc .. ")")

    damageLabel:setText(format_thousand(totalDmg))

    damageHourLabel:setText(format_thousand(damageHour()))

    healingLabel:setText(format_thousand(totalHeal))

    healingHourLabel:setText(format_thousand(healHour()))

    --loot window

    lootInLootAnalyzerLabel:setText(format_thousand(lootWorth))

    lootHourInLootAnalyzerLabel:setText(format_thousand(lootHour()))

    --supply window

    suppliesInSuppliesAnalyzerLabel:setText(format_thousand(wasteWorth))

    suppliesHourInSuppliesAnalyzerLabel:setText(format_thousand(wasteHour()))

    --impact window

    totalDamageLabel:setText(format_thousand(totalDmg))

    maxDpsLabel:setText(format_thousand(bestDPS))

    bestHitLabel:setText(storage.bestHit)

    top1.left:setText(first.l)

    top1.right:setText(first.r)

    top2.left:setText(second.l)

    top2.right:setText(second.r)

    top3.left:setText(third.l)

    top3.right:setText(third.r)

    top4.left:setText(fourth.l)

    top4.right:setText(fourth.r)

    top5.left:setText(five.l)

    top5.right:setText(five.r)

    totalHealingLabel:setText(format_thousand(totalHeal))

    maxHpsLabel:setText(format_thousand(bestHPS))

    bestHealLabel:setText(storage.bestHeal)

    --xp window

    xpGrainInXpLabel:setText(format_thousand(expGained()))

    xpHourInXpLabel:setText(expPerHour())

    nextLevelLabel:setText(timeToLevel())

    progressBar:setPercent(modules.game_skills.skillsWindow.contentsPanel.level.percent:getPercent())

    --stats

    totalRounds:setText(vBot.CaveBotData.rounds)

    avRoundTime:setText(niceTimeFormat(avgTable(vBot.CaveBotData.time),true))

    totalRefills:setText(vBot.CaveBotData.refills)

    avRefillTime:setText(niceTimeFormat(avgTable(vBot.CaveBotData.refillTime),true))

    lastRefill:setText(niceTimeFormat(os.difftime(os.time()-vBot.CaveBotData.lastRefill),true))

end)

--graphs, draw each minute

macro(60*1000, function()

  drawGraph(xpGraph, expPerHour(true) or 0)

  drawGraph(lootGraph, lootHour() or 0)

  drawGraph(supplyGraph, wasteHour() or 0)

  drawGraph(dmgGraph, valueInSeconds(dmgTable) or 0)

  drawGraph(healGraph, valueInSeconds(healTable) or 0)

end)

--party hunt analyzer

macro(2000, function()

  if not BotServer._websocket then return end

  -- send data

  if storage.sendPartyAnalyzerData then

    sendData()

  end

  local totalWaste, totalLoot, totalBalance = getSumStats()

  partySessionTimeLabel:setText(sessionTime())

  partyLootLabel:setText(format_thousand(totalLoot))

  partySuppliesLabel:setText(format_thousand(totalWaste))

  partyBalanceLabel:setText(format_thousand(totalBalance))

  if totalBalance < 0 then

    partyBalanceLabel:setColor('#ff9854')

  elseif totalBalance > 0 then

    partyBalanceLabel:setColor('#45ad25')

  else

    partyBalanceLabel:setColor('white')

  end

end)

-- public functions

-- global namespace

Analyzer = {}

Analyzer.getKillsAmount = function(name)

  return killList[name] or 0

end

Analyzer.getLootedAmount = function(nameOrId)

  if type(nameOrId) == "number" then

    return lootedItems[nameOrId].count or 0

  else

    local nameOrId = nameOrId:lower()

    for k,v in pairs(lootedItems) do

      if v.name == nameOrId then

        return v.count

      end

    end

  end

  return 0

end

Analyzer.getTotalProfit = function()

  local lootWorth, wasteWorth, balance = bottingStats()

  return lootWorth

end

Analyzer.getTotalWaste = function()

  local lootWorth, wasteWorth, balance = bottingStats()

  return wasteWorth

end

Analyzer.getBalance = function()

  local lootWorth, wasteWorth, balance = bottingStats()

  return balance

end

Analyzer.getXpGained = function()

  return expGained()

end

Analyzer.getXpHour = function()

  return expPerHour()

end

Analyzer.getTimeToNextLevel = function()

  return timeToLevel()

end

Analyzer.getCaveBotStats = function()

  local parents = {suppliesByRound, suppliesByRefill}

  local round = {}

  local refill = {}

  for i=1,2 do

    local data = parents[i]

    for j, child in ipairs(data:getChildren()) do

      local id = child:getItemId()

      local count = child.count

      if i == 1 then

        round[id] = count

      else

        refill[id] = count

      end

    end

  end

  return {

    totalRounds = totalRounds:getText(),

    avRoundTime = avRoundTime:getText(),

    totalRefills = totalRefills:getText(),

    avRefillTime = avRefillTime:getText(),

    lastRefill = lastRefill:getText(),

    roundSupplies = round, -- { [id] = amount, [id2] = amount ...}

    refillSupplies = refill -- { [id] = amount, [id2] = amount ...}

}

end

```

---
# analyzer.otui
```otui

TrackerItem < Panel

  height: 40

  BotItem

    id: item

    anchors.top: parent.top

    margin-top: 2

    anchors.left: parent.left

    image-source:

  UIWidget

    id: name

    anchors.top: prev.top

    margin-top: 1

    anchors.bottom: prev.verticalCenter

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 5

    text: Set Item to start track.

    text-align:left

    font: verdana-11px-rounded

    color: #FFFFFF

  UIWidget

    id: drops

    anchors.top: prev.bottom

    margin-top: 3

    anchors.bottom: Item.bottom

    anchors.left: prev.left

    anchors.right: parent.right

    font: verdana-11px-rounded

    text-align:left

    text: Loot Drops: 0

    color: #CCCCCC

DualLabel < Label

  height: 15

  text-offset: 4 0

  font: verdana-11px-rounded

  text-align: left

  width: 50

  Label

    id: value

    anchors.right: parent.right

    margin-right: 4

    anchors.verticalCenter: parent.verticalCenter

    width: 200

    font: verdana-11px-rounded

    text-align: right

    text: 0

MemberWidget < Panel

  height: 85

  margin-top: 3

  UICreature

    id: creature

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    size: 28 28

  UIWidget

    id: name

    anchors.left: prev.right

    margin-left: 5

    anchors.top: parent.top

    height: 12

    anchors.right: parent.right

    text: Player Name

    font: verdana-11px-rounded

    text-align: left

  ProgressBar

    id: health

    anchors.left: prev.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 2

    height: 7

    background-color: #00c000

    phantom: false

  ProgressBar

    id: mana

    anchors.left: prev.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    height: 7

    background-color: #0000FF

    phantom: false

  DualLabel

    id: balance

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 5

    text: Balance:

  DualLabel

    id: damage

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 2

    text: Damage:

  DualLabel

    id: healing

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 2

    text: Healing:

AnalyzerPriceLabel < Label

  background-color: alpha

  text-offset: 2 0

  focusable: true

  height: 16

  $focus:

    background-color: #00000055

  Button

    id: remove

    !text: tr('x')

    anchors.right: parent.right

    margin-right: 15

    width: 15

    height: 15

AnalyzerListPanel < Panel

  padding-left: 4

  padding-right: 4

  layout:

    type: verticalBox

    fit-children: true

ListLabel < Label

  height: 15

  font: verdana-11px-rounded

  text-offset: 15 0

AnalyzerItemsPanel < Panel

  id: List

  padding: 2

  layout:

    type: grid

    cell-size: 33 33

    cell-spacing: 1

    num-columns: 5

    fit-children: true

AnalyzerLootItem < UIItem

  opacity: 0.87

  height: 37

  margin-left: 1

  virtual: true

  background-color: alpha

  Label

    id: count

    font: verdana-11px-rounded

    color: white

    opacity: 0.87

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    margin-right: 2

    text-align: right

    text: 0

AnalyzerGraph < UIGraph

  height: 140

  capacity: 400

  line-width: 1

  color: red

  margin-top: 5

  margin-left: 5

  margin-right: 5

  background-color: #383636

  padding: 5

  font: verdana-11px-rounded

  image-source: /images/ui/graph_background

AnalyzerProgressBar < ProgressBar

  background-color: green

  height: 5

  margin-top: 3

  phantom: false

  margin-left: 3

  margin-right: 3

  border: 1 black

AnalyzerButton < Button

  height: 22

  margin-bottom: 2

  font: verdana-11px-rounded

  text-offset: 0 4

MainAnalyzerWindow < MiniWindow

  id: MainAnalyzerWindow

  text: Analytics Selector

  height: 266

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-left: 5

    padding-right: 5

    padding-top: 5

    layout: verticalBox

    AnalyzerButton

      id: HuntingAnalyzer

      text: Hunting Analyzer

    AnalyzerButton

      id: LootAnalyzer

      text: Loot Analyzer

    AnalyzerButton

      id: SupplyAnalyzer

      text: Supply Analyzer

    AnalyzerButton

      id: ImpactAnalyzer

      text: Impact Analyzer

    AnalyzerButton

      id: XPAnalyzer

      text: XP Analyzer

    AnalyzerButton

      id: DropTracker

      text: Drop Tracker

    AnalyzerButton

      id: Stats

      text: CaveBot Stats

      color: #74B73E

    AnalyzerButton

      id: PartyHunt

      text: Party Hunt

      color: #3895D3

    AnalyzerButton

      id: Settings

      text: Features & Settings

      color: #FABD02

    AnalyzerButton

      id: ResetSession

      text: Reset Session

      color: #FF0000

HuntingAnalyzer < MiniWindow

  id: HuntingAnalyzerWindow

  text: Hunt Analyzer

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-top: 3

    layout: verticalBox

LootAnalyzer < MiniWindow

  id: LootAnalyzerWindow

  text: Loot Analyzer

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-top: 3

    layout: verticalBox

SupplyAnalyzer < MiniWindow

  id: SupplyAnalyzerWindow

  text: Supply Analyzer

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-top: 3

    layout: verticalBox

ImpactAnalyzer < MiniWindow

  id: ImpactAnalyzerWindow

  text: Impact Analyzer

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-top: 3

    layout: verticalBox

XPAnalyzer < MiniWindow

  id: XPAnalyzerWindow

  text: XP Analyzer

  height: 150

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-top: 3

    layout: verticalBox

PartyAnalyzerWindow < MiniWindow

  id: PartyAnalyzerWindow

  text: Party Hunt

  height: 200

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-left: 3

    padding-right: 3

    padding-top: 1

    layout: verticalBox

DropTracker < MiniWindow

  id: DropTracker

  text: Drop Tracker

  height: 200

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-left: 3

    padding-right: 3

    padding-top: 1

    layout: verticalBox

CaveBotStats < MiniWindow

  id: CaveBotStats

  text: CaveBot Stats

  height: 200

  icon: /images/topbuttons/analyzers

  MiniWindowContents

    padding-left: 3

    padding-right: 3

    padding-top: 1

    layout: verticalBox

FeaturesWindow < MainWindow

  id: FeaturesWindow

  size: 250 370

  padding: 15

  text: Analyzers Features

  @onEscape: self:hide()

  TextList

    id: CustomPrices

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 10

    padding: 1

    height: 220

    vertical-scrollbar: CustomPricesScrollBar

  VerticalScrollBar

    id: CustomPricesScrollBar

    anchors.top: CustomPrices.top

    anchors.bottom: CustomPrices.bottom

    anchors.right: CustomPrices.right

    step: 14

    pixels-scroll: true

  BotItem

    id: ID

    anchors.left: CustomPrices.left

    anchors.top: CustomPrices.bottom

    margin-top: 5

  SpinBox

    id: NewPrice

    anchors.left: prev.right

    margin-left: 5

    anchors.verticalCenter: prev.verticalCenter

    width: 100

    minimum: 0

    maximum: 1000000000

    step: 1

    text-align: center

    focusable: true

  Button

    id: addItem

    anchors.left: prev.right

    margin-left: 5

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: CustomPrices.right

    text: Add

    font: verdana-11px-rounded

  HorizontalSeparator

    anchors.left: ID.right

    margin-left: 5

    anchors.right: CustomPrices.right

    anchors.verticalCenter: ID.top

  HorizontalSeparator

    id: secondSeparator

    anchors.left: ID.right

    margin-left: 5

    anchors.right: CustomPrices.right

    anchors.bottom: ID.bottom

  BotSwitch

    id: LootChannel

    anchors.left: CustomPrices.left

    anchors.right: parent.horizontalCenter

    margin-right: 2

    anchors.top: prev.top

    margin-top: 20

    text: Loot Channel

    font: verdana-11px-rounded

  BotSwitch

    id: RarityFrames

    anchors.left: parent.horizontalCenter

    margin-left: 2

    anchors.right: CustomPrices.right

    anchors.top: secondSeparator.top

    margin-top: 20

    text: Rarity Frames

    font: verdana-11px-rounded

  HorizontalSeparator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

```

---
# antiRs.lua
```lua

setDefaultTab("Tools")

g_game.cancelAttackAndFollow()

local frags = 0

local unequip = false

local m = macro(50, "AntiRS & Msg", function() end)

function safeExit()

    CaveBot.setOff()

    TargetBot.setOff()

    g_game.cancelAttackAndFollow()

    g_game.cancelAttackAndFollow()

    g_game.cancelAttackAndFollow()

    modules.game_interface.forceExit()

end

onTextMessage(function(mode, text)

    if not m.isOn() then return end

    if not text:find("Warning! The murder of") then return end

    frags = frags + 1

    if killsToRs() < 6 or frags > 1 then

        EquipManager.setOff()

        schedule(100, function()

            local id = getLeft() and getLeft():getId()

            if id and not unequip then

                unequip = true

                g_game.equipItemId(id)

            end

            safeExit()

        end)

    end

end)

```

---
# cast_food.lua
```lua

setDefaultTab("HP")

if voc() ~= 1 and voc() ~= 11 then

    if storage.foodItems then

        local t = {}

        for i, v in pairs(storage.foodItems) do

            if not table.find(t, v.id) then

                table.insert(t, v.id)

            end

        end

        local foodItems = { 3607, 3585, 3592, 3600, 3601 }

        for i, item in pairs(foodItems) do

            if not table.find(t, item) then

                table.insert(storage.foodItems, item)

            end

        end

    end

    macro(500, "Cast Food", function()

        if player:getRegenerationTime() <= 400 then

            cast("exevo pan", 5000)

        end

    end)

end

```

---
# cavebot.lua
```lua

-- Cavebot by otclient@otclient.ovh

-- visit http://bot.otclient.ovh/

local cavebotTab = "Cave"

local targetingTab = storage.extras.joinBot and "Cave" or "Target"

setDefaultTab(cavebotTab)

CaveBot.Extensions = {}

importStyle("/cavebot/cavebot.otui")

importStyle("/cavebot/config.otui")

importStyle("/cavebot/editor.otui")

dofile("/cavebot/actions.lua")

dofile("/cavebot/config.lua")

dofile("/cavebot/editor.lua")

dofile("/cavebot/example_functions.lua")

dofile("/cavebot/recorder.lua")

dofile("/cavebot/walking.lua")

dofile("/cavebot/minimap.lua")

-- in this section you can add extensions, check extension_template.lua

--dofile("/cavebot/extension_template.lua")

dofile("/cavebot/sell_all.lua")

dofile("/cavebot/depositor.lua")

dofile("/cavebot/buy_supplies.lua")

dofile("/cavebot/d_withdraw.lua")

dofile("/cavebot/supply_check.lua")

dofile("/cavebot/travel.lua")

dofile("/cavebot/doors.lua")

dofile("/cavebot/pos_check.lua")

dofile("/cavebot/withdraw.lua")

dofile("/cavebot/inbox_withdraw.lua")

dofile("/cavebot/lure.lua")

dofile("/cavebot/bank.lua")

dofile("/cavebot/clear_tile.lua")

dofile("/cavebot/tasker.lua")

dofile("/cavebot/imbuing.lua")

dofile("/cavebot/stand_lure.lua")

-- main cavebot file, must be last

dofile("/cavebot/cavebot.lua")

setDefaultTab(targetingTab)

if storage.extras.joinBot then UI.Label("-- [[ TargetBot ]] --") end

TargetBot = {} -- global namespace

importStyle("/targetbot/looting.otui")

importStyle("/targetbot/target.otui")

importStyle("/targetbot/creature_editor.otui")

dofile("/targetbot/creature.lua")

dofile("/targetbot/creature_attack.lua")

dofile("/targetbot/creature_editor.lua")

dofile("/targetbot/creature_priority.lua")

dofile("/targetbot/looting.lua")

dofile("/targetbot/walking.lua")

-- main targetbot file, must be last

dofile("/targetbot/target.lua")

```

---
# cavebot_control_panel.lua
```lua

setDefaultTab("Cave")

g_ui.loadUIFromString([[

CaveBotControlPanel < Panel

  margin-top: 5

  layout:

    type: verticalBox

    fit-children: true

  HorizontalSeparator

  Label

    text-align: center

    text: CaveBot Control Panel

    font: verdana-11px-rounded

    margin-top: 3

  HorizontalSeparator

  Panel

    id: buttons

    margin-top: 2

    layout:

      type: grid

      cell-size: 86 20

      cell-spacing: 1

      flow: true

      fit-children: true

  HorizontalSeparator

    margin-top: 3

]])

local panel = UI.createWidget("CaveBotControlPanel")

storage.caveBot = {

  forceRefill = false,

  backStop = false,

  backTrainers = false,

  backOffline = false

}

-- [[ B U T T O N S ]] --

local forceRefill = UI.Button("Force Refill", function(widget)

    storage.caveBot.forceRefill = true

    print("[CaveBot] Going back on refill on next supply check.")

end, panel.buttons)

local backStop = UI.Button("Back & Stop", function(widget)

    storage.caveBot.backStop = true

    print("[CaveBot] Going back to city on next supply check and turning off CaveBot on depositer action.")

end, panel.buttons)

local backTrainers = UI.Button("To Trainers", function(widget)

    storage.caveBot.backTrainers = true

    print("[CaveBot] Going back to city on next supply check and going to label 'toTrainers' on depositer action.")

end, panel.buttons)

local backOffline = UI.Button("Offline", function(widget)

    storage.caveBot.backOffline = true

    print("[CaveBot] Going back to city on next supply check and going to label 'toOfflineTraining' on depositer action.")

end, panel.buttons)

```

---
# combo.lua
```lua

setDefaultTab("Main")

local panelName = "combobot"

local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('ComboBot')

  Button

    id: combos

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

]])

ui:setId(panelName)

if not storage[panelName] then

  storage[panelName] = {

    enabled = false,

    onSayEnabled = false,

    onShootEnabled = false,

    onCastEnabled = false,

    followLeaderEnabled = false,

    attackLeaderTargetEnabled = false,

    attackSpellEnabled = false,

    attackItemToggle = false,

    sayLeader = "",

    shootLeader = "",

    castLeader = "",

    sayPhrase = "",

    spell = "",

    serverLeader = "",

    item = 3155,

    attack = "",

    follow = "",

    commandsEnabled = true,

    serverEnabled = false,

    serverLeaderTarget = false,

    serverTriggers = true

}

end

local config = storage[panelName]

ui.title:setOn(config.enabled)

ui.title.onClick = function(widget)

config.enabled = not config.enabled

widget:setOn(config.enabled)

end

ui.combos.onClick = function(widget)

  comboWindow:show()

  comboWindow:raise()

  comboWindow:focus()

end

rootWidget = g_ui.getRootWidget()

if rootWidget then

  comboWindow = UI.createWindow('ComboWindow', rootWidget)

  comboWindow:hide()

  -- bot item

  comboWindow.actions.attackItem:setItemId(config.item)

  comboWindow.actions.attackItem.onItemChange = function(widget)

    config.item = widget:getItemId()

  end

  -- switches

  comboWindow.actions.commandsToggle:setOn(config.commandsEnabled)

  comboWindow.actions.commandsToggle.onClick = function(widget)

    config.commandsEnabled = not config.commandsEnabled

    widget:setOn(config.commandsEnabled)

  end

  comboWindow.server.botServerToggle:setOn(config.serverEnabled)

  comboWindow.server.botServerToggle.onClick = function(widget)

    config.serverEnabled = not config.serverEnabled

    widget:setOn(config.serverEnabled)

  end

  comboWindow.server.Triggers:setOn(config.serverTriggers)

  comboWindow.server.Triggers.onClick = function(widget)

    config.serverTriggers = not config.serverTriggers

    widget:setOn(config.serverTriggers)

  end

  comboWindow.server.targetServerLeaderToggle:setOn(config.serverLeaderTarget)

  comboWindow.server.targetServerLeaderToggle.onClick = function(widget)

    config.serverLeaderTarget = not config.serverLeaderTarget

    widget:setOn(config.serverLeaderTarget)

  end

  -- buttons

  comboWindow.closeButton.onClick = function(widget)

    comboWindow:hide()

  end

  -- combo boxes

  comboWindow.actions.followLeader:setOption(config.follow)

  comboWindow.actions.followLeader.onOptionChange = function(widget)

    config.follow = widget:getCurrentOption().text

  end

  comboWindow.actions.attackLeaderTarget:setOption(config.attack)

  comboWindow.actions.attackLeaderTarget.onOptionChange = function(widget)

    config.attack = widget:getCurrentOption().text

  end

  -- checkboxes

  comboWindow.trigger.onSayToggle:setChecked(config.onSayEnabled)

  comboWindow.trigger.onSayToggle.onClick = function(widget)

    config.onSayEnabled = not config.onSayEnabled

    widget:setChecked(config.onSayEnabled)

  end

  comboWindow.trigger.onShootToggle:setChecked(config.onShootEnabled)

  comboWindow.trigger.onShootToggle.onClick = function(widget)

    config.onShootEnabled = not config.onShootEnabled

    widget:setChecked(config.onShootEnabled)

  end

  comboWindow.trigger.onCastToggle:setChecked(config.onCastEnabled)

  comboWindow.trigger.onCastToggle.onClick = function(widget)

    config.onCastEnabled = not config.onCastEnabled

    widget:setChecked(config.onCastEnabled)

  end

  comboWindow.actions.followLeaderToggle:setChecked(config.followLeaderEnabled)

  comboWindow.actions.followLeaderToggle.onClick = function(widget)

    config.followLeaderEnabled = not config.followLeaderEnabled

    widget:setChecked(config.followLeaderEnabled)

  end

  comboWindow.actions.attackLeaderTargetToggle:setChecked(config.attackLeaderTargetEnabled)

  comboWindow.actions.attackLeaderTargetToggle.onClick = function(widget)

    config.attackLeaderTargetEnabled = not config.attackLeaderTargetEnabled

    widget:setChecked(config.attackLeaderTargetEnabled)

  end

  comboWindow.actions.attackSpellToggle:setChecked(config.attackSpellEnabled)

  comboWindow.actions.attackSpellToggle.onClick = function(widget)

    config.attackSpellEnabled = not config.attackSpellEnabled

    widget:setChecked(config.attackSpellEnabled)

  end

  comboWindow.actions.attackItemToggle:setChecked(config.attackItemEnabled)

  comboWindow.actions.attackItemToggle.onClick = function(widget)

    config.attackItemEnabled = not config.attackItemEnabled

    widget:setChecked(config.attackItemEnabled)

  end

  -- text edits

  comboWindow.trigger.onSayLeader:setText(config.sayLeader)

  comboWindow.trigger.onSayLeader.onTextChange = function(widget, text)

    config.sayLeader = text

  end

  comboWindow.trigger.onShootLeader:setText(config.shootLeader)

  comboWindow.trigger.onShootLeader.onTextChange = function(widget, text)

    config.shootLeader = text

  end

  comboWindow.trigger.onCastLeader:setText(config.castLeader)

  comboWindow.trigger.onCastLeader.onTextChange = function(widget, text)

    config.castLeader = text

  end

  comboWindow.trigger.onSayPhrase:setText(config.sayPhrase)

  comboWindow.trigger.onSayPhrase.onTextChange = function(widget, text)

    config.sayPhrase = text

  end

  comboWindow.actions.attackSpell:setText(config.spell)

  comboWindow.actions.attackSpell.onTextChange = function(widget, text)

    config.spell = text

  end

  comboWindow.server.botServerLeader:setText(config.serverLeader)

  comboWindow.server.botServerLeader.onTextChange = function(widget, text)

    config.serverLeader = text

  end

end

-- bot server

-- [[ join party made by Frosty ]] --

local shouldCloseWindow = false

local firstInvitee = true

local isInComboTeam = false

macro(10, function()

  if shouldCloseWindow and config.serverEnabled and config.enabled then

    local channelsWindow = modules.game_console.channelsWindow

    if channelsWindow then

      local child = channelsWindow:getChildById("buttonCancel")

      if child then

        child:onClick()

        shouldCloseWindow = false

        isInComboTeam = true

      end

    end

  end

end)

comboWindow.server.partyButton.onClick = function(widget)

  if config.serverEnabled and config.enabled then

    if config.serverLeader:len() > 0 and storage.BotServerChannel:len() > 0 then

      talkPrivate(config.serverLeader, "request invite " .. storage.BotServerChannel)

    else

      error("Request failed. Lack of data.")

    end

  end

end

onTextMessage(function(mode, text)

  if config.serverEnabled and config.enabled then

    if mode == 20 then

      if string.find(text, "invited you to") then

        local regex = "[a-zA-Z]*"

        local regexData = regexMatch(text, regex)

        if regexData[1][1]:lower() == config.serverLeader:lower() then

          local leader = getCreatureByName(regexData[1][1])

          if leader then

            g_game.partyJoin(leader:getId())

            g_game.requestChannels()

            g_game.joinChannel(1)

            shouldCloseWindow = true

          end

        end

      end

    end

  end

end)

onTalk(function(name, level, mode, text, channelId, pos)

  if config.serverEnabled and config.enabled then

    if mode == 4 then

      if string.find(text, "request invite") then

        local access = string.match(text, "%d.*")

        if access and access == storage.BotServerChannel then

          local minion = getCreatureByName(name)

          if minion then

            g_game.partyInvite(minion:getId())

            if firstInvitee then

              g_game.requestChannels()

              g_game.joinChannel(1)

              shouldCloseWindow = true

              firstInvitee = false

            end

          end

        else

          talkPrivate(name, "Incorrect access key!")

        end

      end

    end

  end

  -- [[ End of Frosty's Code ]] --

  if config.enabled and config.enabled then

    if name:lower() == config.sayLeader:lower() and string.find(text, config.sayPhrase) and config.onSayEnabled then

      startCombo = true

    end

    if (config.castLeader and name:lower() == config.castLeader:lower()) and isAttSpell(text) and config.onCastEnabled then

      startCombo = true

    end

  end

  if config.enabled and config.commandsEnabled and (config.shootLeader and name:lower() == config.shootLeader:lower()) or (config.sayLeader and name:lower() == config.sayLeader:lower()) or (config.castLeader and name:lower() == config.castLeader:lower()) then

    if string.find(text, "ue") then

      say(config.spell)

    elseif string.find(text, "sd") then

      local params = string.split(text, ",")

      if #params == 2 then

        local target = params[2]:trim()

        if getCreatureByName(target) then

          useWith(3155, getCreatureByName(target))

        end

      end

    elseif string.find(text, "att") then

      local attParams = string.split(text, ",")

      if #attParams == 2 then

        local atTarget = attParams[2]:trim()

        if getCreatureByName(atTarget) and config.attack == "COMMAND TARGET" then

          g_game.attack(getCreatureByName(atTarget))

        end

      end

    end

  end

  if isAttSpell(text) and config.enabled and config.serverEnabled then

    BotServer.send("trigger", "start")

  end

end)

onMissle(function(missle)

  if config.enabled and config.onShootEnabled then

    if not config.shootLeader or config.shootLeader:len() == 0 then

      return

    end

    local src = missle:getSource()

    if src.z ~= posz() then

      return

    end

    local from = g_map.getTile(src)

    local to = g_map.getTile(missle:getDestination())

    if not from or not to then

      return

    end

    local fromCreatures = from:getCreatures()

    local toCreatures = to:getCreatures()

    if #fromCreatures ~= 1 or #toCreatures ~= 1 then

      return

    end

    local c1 = fromCreatures[1]

    local t1 = toCreatures[1]

    leaderTarget = t1

    if c1:getName():lower() == config.shootLeader:lower() then

      if config.attackItemEnabled and config.item and config.item > 100 and findItem(config.item) then

        useWith(config.item, t1)

      end

      if config.attackSpellEnabled and config.spell:len() > 1 then

        say(config.spell)

      end

    end

  end

end)

macro(10, function()

  if not config.enabled or not config.attackLeaderTargetEnabled then return end

  if leaderTarget and config.attack == "LEADER TARGET" then

    if not getTarget() or (getTarget() and getTarget():getName() ~= leaderTarget:getName()) then

      g_game.attack(leaderTarget)

    end

  end

  if config.enabled and config.serverEnabled and config.attack == "SERVER LEADER TARGET" and serverTarget then

    if serverTarget and not getTarget() or (getTarget() and getTarget():getname() ~= serverTarget)

    then

      g_game.attack(serverTarget)

    end

  end

end)

local toFollow

local toFollowPos = {}

macro(100, function()

  toFollow = nil

  if not config.enabled or not config.followLeaderEnabled then return end

  if leaderTarget and config.follow == "LEADER TARGET" and leaderTarget:isPlayer() then

    toFollow = leaderTarget:getName()

  elseif config.follow == "SERVER LEADER TARGET" and config.serverLeader:len() ~= 0 then

    toFollow = serverTarget

  elseif config.follow == "SERVER LEADER" and config.serverLeader:len() ~= 0 then

    toFollow = config.serverLeader

  elseif config.follow == "LEADER" then

    if config.onSayEnabled and config.sayLeader:len() ~= 0 then

      toFollow = config.sayLeader

    elseif config.onCastEnabled and config.castLeader:len() ~= 0 then

      toFollow = config.castLeader

    elseif config.onShootEnabled and config.shootLeader:len() ~= 0 then

      toFollow = config.shootLeader

    end

  end

  if not toFollow then return end

  local target = getCreatureByName(toFollow)

  if target then

    local tpos = target:getPosition()

    toFollowPos[tpos.z] = tpos

  end

  if player:isWalking() then return end

  local p = toFollowPos[posz()]

  if not p then return end

  if CaveBot.walkTo(p, 20, {ignoreNonPathable=true, precision=1, ignoreStairs=false}) then

    delay(100)

  end

end)

onCreaturePositionChange(function(creature, oldPos, newPos)

  if creature:getName() == toFollow and newPos then

    toFollowPos[newPos.z] = newPos

  end

end)

local timeout = now

macro(10, function()

  if config.enabled and startCombo then

    if config.attackItemEnabled and config.item and config.item > 100 and findItem(config.item) then

      useWith(config.item, getTarget())

    end

    if config.attackSpellEnabled and config.spell:len() > 1 then

      say(config.spell)

    end

    startCombo = false

  end

  -- attack part / server

  if BotServer._websocket and config.enabled and config.serverEnabled then

    if target() and now - timeout > 500 then

      targetPos = target():getName()

      BotServer.send("target", targetPos)

      timeout = now

    end

  end

end)

onUseWith(function(pos, itemId, target, subType)

  if BotServer._websocket and itemId == 3155 then

    BotServer.send("useWith", target:getPosition())

  end

end)

if BotServer._websocket and config.enabled and config.serverEnabled then

  BotServer.listen("trigger", function(name, message)

    if message == "start" and name:lower() ~= player:getName():lower() and name:lower() == config.serverLeader:lower() and config.serverTriggers then

      startCombo = true

    end

  end)

  BotServer.listen("target", function(name, message)

    if name:lower() ~= player:getName():lower() and name:lower() == config.serverLeader:lower() then

      if not target() or target():getName() == getCreatureByName(message) then

        if config.serverLeaderTarget then

          serverTarget = getCreatureByName(message)

          g_game.attack(getCreatureByName(message))

        end

      end

    end

  end)

  BotServer.listen("useWith", function(name, message)

   local tile = g_map.getTile(message)

   if config.serverTriggers and name:lower() ~= player:getName():lower() and name:lower() == config.serverLeader:lower() and config.attackItemEnabled and config.item and findItem(config.item) then

    useWith(config.item, tile:getTopUseThing())

   end

  end)

end

```

---
# combo.otui
```otui

AttackComboBoxPopupMenu < ComboBoxPopupMenu

AttackComboBoxPopupMenuButton < ComboBoxPopupMenuButton

AttackComboBox < ComboBox

  @onSetup: |

    self:addOption("LEADER TARGET")

    self:addOption("COMMAND TARGET")

FollowComboBoxPopupMenu < ComboBoxPopupMenu

FollowComboBoxPopupMenuButton < ComboBoxPopupMenuButton

FollowComboBox < ComboBox

  @onSetup: |

    self:addOption("LEADER TARGET")

    self:addOption("SERVER LEADER TARGET")

    self:addOption("LEADER")

    self:addOption("SERVER LEADER")

ComboTrigger < Panel

  id: trigger

  image-source: /images/ui/panel_flat

  image-border: 6

  padding: 3

  size: 450 72

  Label

    id: triggerLabel1

    anchors.left: parent.left

    anchors.top: parent.top

    text: On Say

    margin-top: 8

    margin-left: 5

    color: #ffaa00

  Label

    id: leaderLabel

    anchors.left: triggerLabel1.right

    anchors.top: triggerLabel1.top

    text: Leader:

    margin-left: 35

  TextEdit

    id: onSayLeader

    anchors.left: leaderLabel.right

    anchors.top: leaderLabel.top

    anchors.bottom: leaderLabel.bottom

    margin-left: 5

    width: 120

    font: cipsoftFont

  Label

    id: phrase

    anchors.left: onSayLeader.right

    anchors.top: onSayLeader.top

    text: Phrase:

    margin-left: 5

  TextEdit

    id: onSayPhrase

    anchors.left: phrase.right

    anchors.top: leaderLabel.top

    anchors.bottom: leaderLabel.bottom

    margin-left: 5

    width: 120

    font: cipsoftFont

  CheckBox

    id: onSayToggle

    anchors.left: onSayPhrase.right

    anchors.top: onSayPhrase.top

    margin-top: 1

    margin-left: 5

  Label

    id: triggerLabel2

    anchors.left: triggerLabel1.left

    anchors.top: triggerLabel1.bottom

    text: On Shoot

    margin-top: 5

    color: #ffaa00

  Label

    id: leaderLabel1

    anchors.left: triggerLabel2.right

    anchors.top: triggerLabel2.top

    text: Leader:

    margin-left: 24

  TextEdit

    id: onShootLeader

    anchors.left: leaderLabel1.right

    anchors.top: leaderLabel1.top

    anchors.bottom: leaderLabel1.bottom

    anchors.right: onSayPhrase.right

    margin-left: 5

    width: 120

    font: cipsoftFont

  CheckBox

    id: onShootToggle

    anchors.left: onShootLeader.right

    anchors.top: onShootLeader.top

    margin-top: 1

    margin-left: 5

  Label

    id: triggerLabel3

    anchors.left: triggerLabel2.left

    anchors.top: triggerLabel2.bottom

    text: On Cast

    margin-top: 5

    color: #ffaa00

  Label

    id: leaderLabel2

    anchors.left: triggerLabel3.right

    anchors.top: triggerLabel3.top

    text: Leader:

    margin-left: 32

  TextEdit

    id: onCastLeader

    anchors.left: leaderLabel2.right

    anchors.top: leaderLabel2.top

    anchors.bottom: leaderLabel2.bottom

    anchors.right: onSayPhrase.right

    margin-left: 5

    width: 120

    font: cipsoftFont

  CheckBox

    id: onCastToggle

    anchors.left: onCastLeader.right

    anchors.top: onCastLeader.top

    margin-top: 1

    margin-left: 5

ComboActions < Panel

  id: actions

  image-source: /images/ui/panel_flat

  image-border: 6

  padding: 3

  size: 220 100

  Label

    id: label1

    anchors.left: parent.left

    anchors.top: parent.top

    text: Follow:

    margin-top: 5

    margin-left: 3

    height: 15

    color: #ffaa00

  FollowComboBox

    id: followLeader

    anchors.left: prev.right

    anchors.top: prev.top

    margin-left: 7

    height: 15

    width: 145

    font: cipsoftFont

  CheckBox

    id: followLeaderToggle

    anchors.left: followLeader.right

    anchors.top: followLeader.top

    margin-top: 2

    margin-left: 5

  Label

    id: label2

    anchors.left: label1.left

    anchors.top: label1.bottom

    margin-top: 5

    text: Attack:

    color: #ffaa00

  AttackComboBox

    id: attackLeaderTarget

    anchors.left: prev.right

    anchors.top: prev.top

    margin-left: 5

    height: 15

    width: 145

    font: cipsoftFont

  CheckBox

    id: attackLeaderTargetToggle

    anchors.left: attackLeaderTarget.right

    anchors.top: attackLeaderTarget.top

    margin-top: 2

    margin-left: 5

  Label

    id: label3

    anchors.left: label2.left

    anchors.top: label2.bottom

    margin-top: 5

    text: Spell:

    color: #ffaa00

  TextEdit

    id: attackSpell

    anchors.left: prev.right

    anchors.top: prev.top

    anchors.right: attackLeaderTarget.right

    margin-left: 17

    height: 15

    width: 145

    font: cipsoftFont

  CheckBox

    id: attackSpellToggle

    anchors.left: attackSpell.right

    anchors.top: attackSpell.top

    margin-top: 2

    margin-left: 5

  Label

    id: label4

    anchors.left: label3.left

    anchors.top: label3.bottom

    margin-top: 15

    text: Attack Item:

    color: #ffaa00

  BotItem

    id: attackItem

    anchors.left: prev.right

    anchors.verticalCenter: prev.verticalCenter

    margin-left: 10

  CheckBox

    id: attackItemToggle

    anchors.left: prev.right

    anchors.verticalCenter: prev.verticalCenter

    margin-left: 5

  BotSwitch

    id: commandsToggle

    anchors.left: prev.right

    anchors.top: attackItem.top

    anchors.right: attackSpellToggle.right

    anchors.bottom: attackItem.bottom

    margin-left: 5

    text: Leader Commands

    text-wrap: true

    multiline: true

BotServer < Panel

  id: server

  image-source: /images/ui/panel_flat

  image-border: 6

  padding: 3

  size: 220 100

  Label

    id: labelX

    anchors.left: parent.left

    anchors.top: parent.top

    text: Leader:

    height: 15

    color: #ffaa00

    margin-left: 3

    margin-top: 5

  TextEdit

    id: botServerLeader

    anchors.left: prev.right

    anchors.top: prev.top

    anchors.right: parent.right

    margin-right: 3

    margin-left: 9

    height: 15

    font: cipsoftFont

  Button

    id: partyButton

    anchors.left: labelX.left

    anchors.top: botServerLeader.bottom

    margin-top: 5

    height: 30

    text: Join Party

    text-wrap: true

    multiline: true

  BotSwitch

    id: botServerToggle

    anchors.left: prev.right

    anchors.top: botServerLeader.bottom

    anchors.right: parent.right

    height: 30

    margin-left: 3

    margin-right: 3

    margin-top: 5

    text: Server Enabled

  BotSwitch

    id: targetServerLeaderToggle

    anchors.left: partyButton.left

    anchors.top: partyButton.bottom

    anchors.right: partyButton.right

    margin-top: 3

    height: 30

    text: Leader Targets

  BotSwitch

    id: Triggers

    anchors.left: prev.right

    anchors.top: partyButton.bottom

    anchors.right: parent.right

    margin-top: 3

    height: 30

    margin-left: 3

    margin-right: 3

    text: Triggers

ComboWindow < MainWindow

  !text: tr('Combo Options')

  size: 500 280

  @onEscape: self:hide()

  ComboTrigger

    id: trigger

    anchors.top: parent.top

    anchors.horizontalCenter: parent.horizontalCenter

    margin-top: 7

  Label

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    margin-left: 10

    text: Combo Trigger

    color: #ff7700

  ComboActions

    id: actions

    anchors.top: trigger.bottom

    anchors.left: trigger.left

    margin-top: 15

  Label

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    margin-left: 10

    margin-top: 85

    text: Combo Actions

    color: #ff7700

  BotServer

    id: server

    anchors.top: actions.top

    anchors.left: actions.right

    margin-left: 10

  Label

    id: title

    anchors.top: parent.top

    anchors.left: server.left

    margin-left: 3

    margin-top: 85

    text: BotServer

    color: #ff7700

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

  Button

    id: toolsButton

    !text: tr('Help')

    font: cipsoftFont

    anchors.right: closeButton.left

    anchors.top: closeButton.top

    margin-right: 10

    size: 45 21

    @onClick: g_platform.openUrl("http://bot.otclient.ovh/books/scripts/page/combobot")

```

---
# configs.lua
```lua

--[[

    Configs for modules

    Based on Kondrah storage method

--]]

local configName = modules.game_bot.contentsPanel.config:getCurrentOption().text

-- make vBot config dir

if not g_resources.directoryExists("/bot/".. configName .."/vBot_configs/") then

  g_resources.makeDir("/bot/".. configName .."/vBot_configs/")

end

-- make profile dirs

for i=1,10 do

  local path = "/bot/".. configName .."/vBot_configs/profile_"..i

  if not g_resources.directoryExists(path) then

    g_resources.makeDir(path)

  end

end

local profile = g_settings.getNumber('profile')

HealBotConfig = {}

local healBotFile = "/bot/" .. configName .. "/vBot_configs/profile_".. profile .. "/HealBot.json"

AttackBotConfig = {}

local attackBotFile = "/bot/" .. configName .. "/vBot_configs/profile_".. profile .. "/AttackBot.json"

SuppliesConfig = {}

local suppliesFile = "/bot/" .. configName .. "/vBot_configs/profile_".. profile .. "/Supplies.json"

--healbot

if g_resources.fileExists(healBotFile) then

    local status, result = pcall(function()

      return json.decode(g_resources.readFileContents(healBotFile))

    end)

    if not status then

      return onError("Error while reading config file (" .. healBotFile .. "). To fix this problem you can delete HealBot.json. Details: " .. result)

    end

    HealBotConfig = result

end

--attackbot

if g_resources.fileExists(attackBotFile) then

    local status, result = pcall(function()

      return json.decode(g_resources.readFileContents(attackBotFile))

    end)

    if not status then

      return onError("Error while reading config file (" .. attackBotFile .. "). To fix this problem you can delete HealBot.json. Details: " .. result)

    end

    AttackBotConfig = result

end

--supplies

if g_resources.fileExists(suppliesFile) then

    local status, result = pcall(function()

      return json.decode(g_resources.readFileContents(suppliesFile))

    end)

    if not status then

      return onError("Error while reading config file (" .. suppliesFile .. "). To fix this problem you can delete HealBot.json. Details: " .. result)

    end

    SuppliesConfig = result

end

function vBotConfigSave(file)

  -- file can be either

  --- heal

  --- atk

  --- supply

  local configFile

  local configTable

  if not file then return end

  file = file:lower()

  if file == "heal" then

      configFile = healBotFile

      configTable = HealBotConfig

  elseif file == "atk" then

      configFile = attackBotFile

      configTable = AttackBotConfig

  elseif file == "supply" then

      configFile = suppliesFile

      configTable = SuppliesConfig

  else

    return

  end

  local status, result = pcall(function()

    return json.encode(configTable, 2)

  end)

  if not status then

    return onError("Error while saving config. it won't be saved. Details: " .. result)

  end

  if result:len() > 100 * 1024 * 1024 then

    return onError("config file is too big, above 100MB, it won't be saved")

  end

  g_resources.writeFileContents(configFile, result)

end

```

---
# depositer_config.lua
```lua

setDefaultTab("Cave")

local panelName = "specialDeposit"

local depositerPanel

UI.Button("Stashing Settings", function()

    depositerPanel:show()

    depositerPanel:raise()

    depositerPanel:focus()

end)

if not storage[panelName] then

    storage[panelName] = {

        items = {},

        height = 380

}

end

local config = storage[panelName]

depositerPanel = UI.createWindow('DepositerPanel', rootWidget)

depositerPanel:hide()

-- basic one

depositerPanel.CloseButton.onClick = function()

    depositerPanel:hide()

end

depositerPanel:setHeight(config.height or 380)

depositerPanel.onGeometryChange = function(widget, old, new)

    if old.height == 0 then return end

    config.height = new.height

end

function arabicToRoman(n)

    local t = {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XI", "XII", "XIV", "XV", "XVI", "XVII"}

    return t[n]

end

local function refreshEntries()

    depositerPanel.DepositerList:destroyChildren()

    for _, entry in ipairs(config.items) do

      local panel = g_ui.createWidget("StashItem", depositerPanel.DepositerList)

      panel.name:setText(Item.create(entry.id):getMarketData().name)

      for i, child in ipairs(panel:getChildren()) do

          if child:getId() ~= "slot" then

            child:setTooltip("Clear item or double click to remove entry.")

            child.onDoubleClick = function(widget)

              table.remove(config.items, table.find(entry))

              panel:destroy()

            end

          end

      end

      panel.item:setItemId(entry.id)

      if entry.id > 0 then

        panel.item:setImageSource('')

      end

      panel.item.onItemChange = function(widget)

        local id = widget:getItemId()

        if id < 100 then

            table.remove(config.items, table.find(entry))

            panel:destroy()

        else

            for i, data in ipairs(config.items) do

                if data.id == id then

                    warn("[Depositer Panel] Item already added!")

                    return

                end

            end

            entry.id = id

            panel.item:setImageSource('')

            panel.name:setText(Item.create(entry.id):getMarketData().name)

            if entry.index == 0 then

                local window = modules.client_textedit.show(panel.slot, {

                    title = "Set depot for "..panel.name:getText(),

                    description = "Select depot to which item should be stashed, choose between 3 and 17",

                    validation = [[^([3-9]|1[0-7])$]]

})

                window.text:setText(entry.index)

                schedule(50, function()

                  window:raise()

                  window:focus()

                end)

            end

        end

      end

      if entry.id > 0 then

        panel.slot:setText("Stash to depot: ".. entry.index)

      end

      panel.slot:setTooltip("Click to set stashing destination.")

      panel.slot.onClick = function(widget)

        local window = modules.client_textedit.show(widget, {

            title = "Set depot for "..panel.name:getText(),

            description = "Select depot to which item should be stashed, choose between 3 and 17",

            validation = [[^([3-9]|1[0-7])$]]

})

        window.text:setText(entry.index)

        schedule(50, function()

          window:raise()

          window:focus()

        end)

      end

      panel.slot.onTextChange = function(widget, text)

        local n = tonumber(text)

        if n then

            entry.index = n

            widget:setText("Stash to depot: "..entry.index)

        end

      end

    end

end

refreshEntries()

depositerPanel.title.onDoubleClick = function(widget)

    table.insert(config.items, {id=0, index=0})

    refreshEntries()

end

function getStashingIndex(id)

    for _, v in pairs(config.items) do

        if v.id == id then

            return v.index - 1

        end

    end

end

```

---
# depositer_config.otui
```otui

StashItem < Panel

  height: 40

  BotItem

    id: item

    anchors.top: parent.top

    margin-top: 2

    anchors.left: parent.left

  UIWidget

    id: name

    anchors.top: prev.top

    margin-top: 1

    anchors.bottom: prev.verticalCenter

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 5

    text-align:left

    text: item name

    font: verdana-11px-rounded

    color: #FFFFFF

  UIWidget

    id: slot

    anchors.top: prev.bottom

    margin-top: 3

    anchors.bottom: Item.bottom

    anchors.left: prev.left

    anchors.right: parent.right

    font: verdana-11px-rounded

    text-align:left

    text: Add item to select locker.

    color: #CCCCCC

DepositerPanel < MainWindow

  size: 230 380

  !text: tr('Depositer Panel')

  @onEscape: self:hide()

  UIWidget

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text: Double click here to add item.

    text-align: left

    font: verdana-11px-rounded

    color: #aeaeae

  ScrollablePanel

    id: DepositerList

    image-source: /images/ui/panel_flat

    image-border: 1

    anchors.top: prev.bottom

    margin-top: 5

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: sep.top

    margin-bottom: 10

    padding: 2

    padding-left: 4

    vertical-scrollbar: DepositerScrollBar

    layout:

      type: verticalBox

  VerticalScrollBar

    id: DepositerScrollBar

    anchors.top: DepositerList.top

    anchors.bottom: DepositerList.bottom

    anchors.right: DepositerList.right

    step: 14

    pixels-scroll: true

    visible: false

  ResizeBorder

    id: bottomResizeBorder

    anchors.fill: next

    height: 3

    minimum: 180

    maximum: 800

    margin-left: 3

    margin-right: 3

    background: #ffffff88

  HorizontalSeparator

    id: sep

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: CloseButton.top

    margin-bottom: 8

  Button

    id: CloseButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-right: 5

```

---
# depot_withdraw.lua
```lua

-- config

setDefaultTab("Tools")

local defaultBp = "shopping bag"

local id = 21411

-- script

local playerContainer = nil

local depotContainer = nil

local mailContainer = nil

function reopenLootContainer()

  for _, container in pairs(getContainers()) do

    if container:getName():lower() == defaultBp:lower() then

      g_game.close(container)

    end

  end

  local lootItem = findItem(id)

  if lootItem then

    schedule(500, function() g_game.open(lootItem) end)

  end

end

macro(50, "Depot Withdraw", function()

  -- set the containers

  if not potionsContainer or not runesContainer or not ammoContainer then

    for i, container in pairs(getContainers()) do

      if container:getName() == defaultBp then

        playerContainer = container

      elseif string.find(container:getName(), "Depot") then

        depotContainer = container

      elseif string.find(container:getName(), "your inbox") then

        mailContainer = container

      end

    end

  end

  if playerContainer and #playerContainer:getItems() == 20 then

    for j, item in pairs(playerContainer:getItems()) do

      if item:getId() == id then

        g_game.open(item, playerContainer)

       return

      end

    end

  end

if playerContainer and freecap() >= 200 then

  local time = 500

    if depotContainer then

      for i, container in pairs(getContainers()) do

        if string.find(container:getName(), "Depot") then

          for j, item in pairs(container:getItems()) do

            g_game.move(item, playerContainer:getSlotPosition(playerContainer:getItemsCount()), item:getCount())

            return

          end

        end

      end

    end

    if mailContainer then

      for i, container in pairs(getContainers()) do

        if string.find(container:getName(), "your inbox") then

          for j, item in pairs(container:getItems()) do

            g_game.move(item, playerContainer:getSlotPosition(playerContainer:getItemsCount()), item:getCount())

            return

          end

        end

      end

    end

end

end)

```

---
# eat_food.lua
```lua

setDefaultTab("HP")

UI.Label("Eatable items:")

if type(storage.foodItems) ~= "table" then

  storage.foodItems = {3582, 3577}

end

local foodContainer = UI.Container(function(widget, items)

  storage.foodItems = items

end, true)

foodContainer:setHeight(35)

foodContainer:setItems(storage.foodItems)

macro(500, "Eat Food", function()

  if player:getRegenerationTime() > 400 or not storage.foodItems[1] then return end

  -- search for food in containers

  for _, container in pairs(g_game.getContainers()) do

    for __, item in ipairs(container:getItems()) do

      for i, foodItem in ipairs(storage.foodItems) do

        if item:getId() == foodItem.id then

          return g_game.use(item)

        end

      end

    end

  end

end)

UI.Separator()

```

---
# equip.lua
```lua

-- config

setDefaultTab("HP")

local scripts = 2 -- if you want more auto equip panels you can change 2 to higher value

-- script by kondrah, don't edit below unless you know what you are doing

UI.Label("Auto equip")

if type(storage.autoEquip) ~= "table" then

  storage.autoEquip = {}

end

for i=1,scripts do

  if not storage.autoEquip[i] then

    storage.autoEquip[i] = {on=false, title="Auto Equip", item1=i == 1 and 3052 or 0, item2=i == 1 and 3089 or 0, slot=i == 1 and 9 or 0}

  end

  UI.TwoItemsAndSlotPanel(storage.autoEquip[i], function(widget, newParams)

    storage.autoEquip[i] = newParams

  end)

end

macro(250, function()

  local containers = g_game.getContainers()

  for index, autoEquip in ipairs(storage.autoEquip) do

    if autoEquip.on then

      local slotItem = getSlot(autoEquip.slot)

      if not slotItem or (slotItem:getId() ~= autoEquip.item1 and slotItem:getId() ~= autoEquip.item2) then

        for _, container in pairs(containers) do

          for __, item in ipairs(container:getItems()) do

            if item:getId() == autoEquip.item1 or item:getId() == autoEquip.item2 then

              g_game.move(item, {x=65535, y=autoEquip.slot, z=0}, item:getCount())

              delay(1000) -- don't call it too often

              return

            end

          end

        end

      end

    end

  end

end)

```

---
# equipper.otui
```otui

SlotBotItem < BotItem

  border-width: 0

  $on:

    image-source: /images/ui/item

  $checked:

    border-width: 1

    border-color: #FF0000

BossLabel < UIWidget

  background-color: alpha

  text-offset: 3 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  text-align: left

  $focus:

    background-color: #00000055

  Button

    id: remove

    !text: tr('X')

    anchors.right: parent.right

    anchors.verticalCenter: parent.verticalCenter

    width: 14

    height: 14

    margin-right: 15

    text-align: center

    text-offset: 0 1

    tooltip: Remove profile from the list.

ConditionBoxPopupMenu < ComboBoxPopupMenu

ConditionBoxPopupMenuButton < ComboBoxPopupMenuButton

ConditionBox < ComboBox

  @onSetup: |

    self:addOption("-")

    self:addOption("and")

    self:addOption("or")

PreButton < PreviousButton

  background: #363636

  height: 15

NexButton < NextButton

  background: #363636

  height: 15

CondidionLabel < FlatPanel

  padding: 1

  height: 15

  Label

    id: text

    anchors.fill: parent

    text-align: center

    font: verdana-11px-rounded

    background: #363636

Rule < UIWidget

  background-color: alpha

  text-offset: 18 2

  focusable: true

  height: 16

  text-align: left

  font: verdana-11px-rounded

  CheckBox

    id: enabled

    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter

    width: 15

    height: 15

    margin-top: 2

    margin-left: 3

    tooltip: Entry enabled/disabled

  $focus:

    background-color: #00000055

  Button

    id: remove

    text: X

    anchors.right: parent.right

    margin-right: 15

    width: 14

    height: 14

    text-align: center

    tooltip: Remove entry

    anchors.verticalCenter: parent.verticalCenter

  Button

    id: visible

    text: V

    anchors.right: prev.left

    margin-right: 3

    width: 14

    height: 14

    text-align: center

    tooltip: Items must be visible

    anchors.verticalCenter: parent.verticalCenter

ConditionPanel < Panel

  height: 58

  NexButton

    id: nex

    anchors.top: parent.top

    margin-top: 5

    anchors.right: parent.right

  PreButton

    id: pre

    anchors.top: parent.top

    margin-top: 5

    anchors.left: parent.left

  CondidionLabel

    id: description

    anchors.top: parent.top

    margin-top: 5

    anchors.left: prev.right

    anchors.right: nex.left

    margin-left: 3

    margin-right: 3

  SpinBox

    id: spinbox

    anchors.top: description.bottom

    margin-top: 10

    anchors.horizontalCenter: parent.horizontalCenter

    width: 100

    text-align: center

    minimum: 0

    maximum: 100

    step: 1

    focusable: true

  BotTextEdit

    id: text

    anchors.top: description.bottom

    margin-top: 10

    anchors.horizontalCenter: parent.horizontalCenter

    width: 200

    text-align: center

ListPanel < FlatPanel

  size: 270 300

  padding-left: 10

  padding-right: 10

  padding-bottom: 10

  Label

    id: title

    anchors.verticalCenter: parent.top

    anchors.left: parent.left

    text: Rules List

    font: verdana-11px-rounded

    color: #FABD02

  Label

    id: mainLabel

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    margin-top: 10

    margin-left: 2

    !text: tr('More important methods come first.')

    text-align: left

    font: verdana-11px-rounded

    color: #aeaeae

  TextList

    id: list

    anchors.fill: parent

    margin-top: 25

    margin-bottom: 18

    vertical-scrollbar: listScrollBar

    padding: 2

  VerticalScrollBar

    id: listScrollBar

    anchors.top: list.top

    anchors.bottom: list.bottom

    anchors.right: list.right

    step: 14

    pixels-scroll: true

  Button

    id: up

    anchors.right: parent.right

    anchors.top: list.bottom

    size: 60 17

    text: Move Up

    text-align: center

    font: cipsoftFont

    margin-top: 5

    tooltip: Increase priority of selected rule.

  Button

    id: down

    anchors.right: prev.left

    anchors.verticalCenter: prev.verticalCenter

    size: 60 17

    margin-right: 5

    text: Move Down

    text-align: center

    font: cipsoftFont

    tooltip: Decrease priority of selected rule.

InputPanel < FlatPanel

  size: 270 300

  padding-left: 10

  padding-right: 10

  padding-bottom: 10

  Label

    id: title

    anchors.verticalCenter: parent.top

    anchors.left: parent.left

    text: Condition Panel

    font: verdana-11px-rounded

    color: #FF0000

  Label

    id: mainLabel

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 10

    text: Equip selected items when:

    text-align: center

    font: verdana-11px-rounded

    color: #aeaeae

  HorizontalSeparator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 4

  ConditionPanel

    id: condition

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: mainLabel.bottom

    margin-top: 15

  HorizontalSeparator

    anchors.verticalCenter: next.verticalCenter

    anchors.left: parent.left

    anchors.right: parent.right

  ConditionBox

    id: useSecondCondition

    anchors.top: condition.bottom

    margin-top: 10

    anchors.horizontalCenter: parent.horizontalCenter

    width: 50

  ConditionPanel

    id: optionalCondition

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 10

  HorizontalSeparator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

  BotButton

    id: add

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.bottom: parent.bottom

    margin-bottom: 10

    text: Add Rule

EQPanel < FlatPanel

  size: 160 230

  padding-left: 10

  padding-right: 10

  padding-bottom: 10

  Label

    id: title

    anchors.verticalCenter: parent.top

    anchors.left: parent.left

    text: Equipment Setup

    font: verdana-11px-rounded

    color: #03C04A

  SlotBotItem

    id: head

    image-source: /images/game/slots/head

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 15

    $on:

      image-source: /images/ui/item

  SlotBotItem

    id: body

    image-source: /images/game/slots/body

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 5

    $on:

      image-source: /images/ui/item

  SlotBotItem

    id: legs

    image-source: /images/game/slots/legs

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 5

    $on:

      image-source: /images/ui/item

  SlotBotItem

    id: feet

    image-source: /images/game/slots/feet

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 5

    $on:

      image-source: /images/ui/item

  SlotBotItem

    id: neck

    image-source: /images/game/slots/neck

    anchors.top: head.top

    margin-top: 13

    anchors.right: head.left

    margin-right: 5

    $on:

      image-source: /images/ui/item

  SlotBotItem

    id: left-hand

    image-source: /images/game/slots/left-hand

    anchors.horizontalCenter: prev.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 5

    $on:

      image-source: /images/ui/item

  SlotBotItem

    id: finger

    image-source: /images/game/slots/finger

    anchors.horizontalCenter: prev.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 5

    $on:

      image-source: /images/ui/item

  Item

    id: back

    image-source: /images/game/slots/back-blessed

    anchors.top: head.top

    margin-top: 13

    anchors.left: head.right

    margin-left: 5

    tooltip: Main back container modifications are unavailable.

  SlotBotItem

    id: right-hand

    image-source: /images/game/slots/right-hand

    anchors.horizontalCenter: prev.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 5

    $on:

      image-source: /images/ui/item

  SlotBotItem

    id: ammo

    image-source: /images/game/slots/ammo

    anchors.horizontalCenter: prev.horizontalCenter

    anchors.top: prev.bottom

    margin-top: 5

  BotButton

    id: cloneEq

    anchors.top: feet.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 15

    text: Clone Current EQ

    font: verdana-11px-rounded

    tooltip: Copy currently equipped and non-equipped items.

  BotButton

    id: default

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 3

    text: Reset fields

    font: verdana-11px-rounded

    tooltip: Reset all fields to the blank state

Profile < FlatPanel

  size: 160 35

  Label

    id: title

    anchors.verticalCenter: parent.top

    anchors.left: parent.left

    margin-left: 10

    text: Profile Name

    font: verdana-11px-rounded

  BotTextEdit

    id: profileName

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    margin: 5

BossList < FlatPanel

  padding-left: 10

  padding-right: 10

  padding-bottom: 10

  Label

    id: title

    anchors.verticalCenter: parent.top

    anchors.left: parent.left

    text: Boss List

    font: verdana-11px-rounded

    color: #FABD02

  TextList

    id: list

    anchors.fill: parent

    margin-top: 10

    margin-bottom: 20

    vertical-scrollbar: listScrollBar

    padding: 2

  VerticalScrollBar

    id: listScrollBar

    anchors.top: list.top

    anchors.bottom: list.bottom

    anchors.right: list.right

    step: 14

    pixels-scroll: true

  BotTextEdit

    id: name

    anchors.left: list.left

    anchors.top: list.bottom

    margin-top: 4

    anchors.right: next.left

  Button

    id: add

    anchors.right: list.right

    anchors.top: list.bottom

    margin-top: 3

    height: 21

    text: Add Boss

    text-align: center

    font: verdana-11px-rounded

    tooltip: Creature with given name will be considered as boss.

EquipWindow < MainWindow

  size: 750 350

  text: Equipment Manager

  @onEscape: self:hide()

  ListPanel

    id: listPanel

    anchors.left: parent.left

    anchors.top: parent.top

    anchors.bottom: bottomSep.top

    margin-bottom: 5

    margin-left: -2

    visible: false

  BossList

    id: bossPanel

    anchors.fill: prev

    visible: true

  VerticalSeparator

    anchors.top: parent.top

    anchors.bottom: bottomSep.top

    margin-bottom: 5

    anchors.left: prev.right

    margin-left: 10

  Profile

    id: profileName

    anchors.top: parent.top

    anchors.left: prev.right

    margin-left: 10

  EQPanel

    id: setup

    anchors.left: prev.left

    anchors.top: prev.bottom

    anchors.bottom: bottomSep.top

    margin-bottom: 5

    margin-top: 10

  InputPanel

    id: inputPanel

    anchors.left: prev.right

    anchors.top: parent.top

    anchors.bottom: bottomSep.top

    margin-bottom: 5

    margin-left: 5

  HorizontalSeparator

    id: bottomSep

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

  Button

    id: bossList

    !text: tr('Boss list')

    font: cipsoftFont

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    size: 65 21

```

---
# exeta.lua
```lua

local voc = player:getVocation()

if voc == 1 or voc == 11 then

    setDefaultTab("Cave")

    UI.Separator()

    local m = macro(100000, "Exeta when low hp", function() end)

    local lastCast = now

    onCreatureHealthPercentChange(function(creature, healthPercent)

        if m.isOff() then return end

        if healthPercent > 15 then return end

        if CaveBot.isOff() or TargetBot.isOff() then return end

        if modules.game_cooldown.isGroupCooldownIconActive(3) then return end

        if creature:getPosition() and getDistanceBetween(pos(),creature:getPosition()) > 1 then return end

        if canCast("exeta res") and now - lastCast > 6000 then

            say("exeta res")

            lastCast = now

        end

    end)

    macro(500, "ExetaIfPlayer", function()

        if CaveBot.isOff() then return end

    	if getMonsters(1) >= 1 and getPlayers(6) > 0 then

    		say("exeta res")

    		delay(6000)

    	end

    end)

    UI.Separator()

end

```

---
# extras.lua
```lua

setDefaultTab("Main")

-- securing storage namespace

local panelName = "extras"

if not storage[panelName] then

  storage[panelName] = {}

end

local settings = storage[panelName]

-- basic elements

extrasWindow = UI.createWindow('ExtrasWindow', rootWidget)

extrasWindow:hide()

extrasWindow.closeButton.onClick = function(widget)

  extrasWindow:hide()

end

extrasWindow.onGeometryChange = function(widget, old, new)

  if old.height == 0 then return end

  settings.height = new.height

end

extrasWindow:setHeight(settings.height or 360)

-- available options for dest param

local rightPanel = extrasWindow.content.right

local leftPanel = extrasWindow.content.left

-- objects made by Kondrah - taken from creature editor, minor changes to adapt

local addCheckBox = function(id, title, defaultValue, dest, tooltip)

  local widget = UI.createWidget('ExtrasCheckBox', dest)

  widget.onClick = function()

    widget:setOn(not widget:isOn())

    settings[id] = widget:isOn()

    if id == "checkPlayer" then

      local label = rootWidget.newHealer.targetSettings.vocations.title

      if not widget:isOn() then

        label:setColor("#d9321f")

        label:setTooltip("! WARNING ! \nTurn on check players in extras to use this feature!")

      else

          label:setColor("#dfdfdf")

          label:setTooltip("")

      end

    end

  end

  widget:setText(title)

  widget:setTooltip(tooltip)

  if settings[id] == nil then

    widget:setOn(defaultValue)

  else

    widget:setOn(settings[id])

  end

  settings[id] = widget:isOn()

end

local addItem = function(id, title, defaultItem, dest, tooltip)

  local widget = UI.createWidget('ExtrasItem', dest)

  widget.text:setText(title)

  widget.text:setTooltip(tooltip)

  widget.item:setTooltip(tooltip)

  widget.item:setItemId(settings[id] or defaultItem)

  widget.item.onItemChange = function(widget)

    settings[id] = widget:getItemId()

  end

  settings[id] = settings[id] or defaultItem

end

local addTextEdit = function(id, title, defaultValue, dest, tooltip)

  local widget = UI.createWidget('ExtrasTextEdit', dest)

  widget.text:setText(title)

  widget.textEdit:setText(settings[id] or defaultValue or "")

  widget.text:setTooltip(tooltip)

  widget.textEdit.onTextChange = function(widget,text)

    settings[id] = text

  end

  settings[id] = settings[id] or defaultValue or ""

end

local addScrollBar = function(id, title, min, max, defaultValue, dest, tooltip)

  local widget = UI.createWidget('ExtrasScrollBar', dest)

  widget.text:setTooltip(tooltip)

  widget.scroll.onValueChange = function(scroll, value)

    widget.text:setText(title .. ": " .. value)

    if value == 0 then

      value = 1

    end

    settings[id] = value

  end

  widget.scroll:setRange(min, max)

  widget.scroll:setTooltip(tooltip)

  if max-min > 1000 then

    widget.scroll:setStep(100)

  elseif max-min > 100 then

    widget.scroll:setStep(10)

  end

  widget.scroll:setValue(settings[id] or defaultValue)

  widget.scroll.onValueChange(widget.scroll, widget.scroll:getValue())

end

UI.Button("vBot Settings and Scripts", function()

  extrasWindow:show()

  extrasWindow:raise()

  extrasWindow:focus()

end)

UI.Separator()

---- to maintain order, add options right after another:

--- add object

--- add variables for function (optional)

--- add callback (optional)

--- optionals should be addionaly sandboxed (if true then end)

addItem("rope", "Rope Item", 9596, leftPanel, "This item will be used in various bot related scripts as default rope item.")

addItem("shovel", "Shovel Item", 9596, leftPanel, "This item will be used in various bot related scripts as default shovel item.")

addItem("machete", "Machete Item", 9596, leftPanel, "This item will be used in various bot related scripts as default machete item.")

addItem("scythe", "Scythe Item", 9596, leftPanel, "This item will be used in various bot related scripts as default scythe item.")

addCheckBox("pathfinding", "CaveBot Pathfinding", true, leftPanel, "Cavebot will automatically search for first reachable waypoint after missing 10 goto's.")

addScrollBar("talkDelay", "Global NPC Talk Delay", 0, 2000, 1000, leftPanel, "Breaks between each talk action in cavebot (time in miliseconds).")

addScrollBar("looting", "Max Loot Distance", 0, 50, 40, leftPanel, "Every loot corpse futher than set distance (in sqm) will be ignored and forgotten.")

addScrollBar("huntRoutes", "Hunting Rounds Limit", 0, 300, 50, leftPanel, "Round limit for supply check, if character already made more rounds than set, on next supply check will return to city.")

addScrollBar("killUnder", "Kill monsters below", 0, 100, 1, leftPanel, "Force TargetBot to kill added creatures when they are below set percentage of health - will ignore all other TargetBot settings.")

addScrollBar("gotoMaxDistance", "Max GoTo Distance", 0, 127, 30, leftPanel, "Maximum distance to next goto waypoint for the bot to try to reach.")

addCheckBox("lootLast", "Start loot from last corpse", true, leftPanel, "Looting sequence will be reverted and bot will start looting newest bodies.")

addCheckBox("joinBot", "Join TargetBot and CaveBot", false, leftPanel, "Cave and Target tabs will be joined into one.")

addCheckBox("reachable", "Target only pathable mobs", false, leftPanel, "Ignore monsters that can't be reached.")

addCheckBox("title", "Custom Window Title", true, rightPanel, "Personalize OTCv8 window name according to character specific.")

if true then

  local vocText = ""

  if voc() == 1 or voc() == 11 then

      vocText = "- EK"

  elseif voc() == 2 or voc() == 12 then

      vocText = "- RP"

  elseif voc() == 3 or voc() == 13 then

      vocText = "- MS"

  elseif voc() == 4 or voc() == 14 then

      vocText = "- ED"

  end

  macro(5000, function()

    if settings.title then

      if hppercent() > 0 then

          g_window.setTitle("Tibia - " .. name() .. " - " .. lvl() .. "lvl " .. vocText)

      else

          g_window.setTitle("Tibia - " .. name() .. " - DEAD")

      end

    else

      g_window.setTitle("Tibia - " .. name())

    end

  end)

end

addCheckBox("separatePm", "Open PM's in new Window", false, rightPanel, "PM's will be automatically opened in new tab after receiving one.")

if true then

  onTalk(function(name, level, mode, text, channelId, pos)

    if mode == 4 and settings.separatePm then

        local g_console = modules.game_console

        local privateTab = g_console.getTab(name)

        if privateTab == nil then

            privateTab = g_console.addTab(name, true)

            g_console.addPrivateText(g_console.applyMessagePrefixies(name, level, text), g_console.SpeakTypesSettings['private'], name, false, name)

        end

        return

    end

  end)

end

addTextEdit("useAll", "Use All Hotkey", "space", rightPanel, "Set hotkey for universal actions - rope, shovel, scythe, use, open doors")

if true then

  local useId = { 34847, 1764, 21051, 30823, 6264, 5282, 20453, 20454, 20474, 11708, 11705,

                  6257, 6256, 2772, 27260, 2773, 1632, 1633, 1948, 435, 6252, 6253, 5007, 4911,

                  1629, 1630, 5108, 5107, 5281, 1968, 435, 1948, 5542, 31116, 31120, 30742, 31115,

                  31118, 20474, 5737, 5736, 5734, 5733, 31202, 31228, 31199, 31200, 33262, 30824,

                  5125, 5126, 5116, 5117, 8257, 8258, 8255, 8256, 5120, 30777, 30776, 23873, 23877,

                  5736, 6264, 31262, 31130, 31129, 6250, 6249, 5122, 30049, 7131, 7132, 7727 }

  local shovelId = { 606, 593, 867, 608 }

  local ropeId = { 17238, 12202, 12935, 386, 421, 21966, 14238 }

  local macheteId = { 2130, 3696 }

  local scytheId = { 3653 }

  setDefaultTab("Tools")

  -- script

  if settings.useAll and settings.useAll:len() > 0 then

    hotkey(settings.useAll, function()

        if not modules.game_walking.wsadWalking then return end

        for _, tile in pairs(g_map.getTiles(posz())) do

            if distanceFromPlayer(tile:getPosition()) < 2 then

                for _, item in pairs(tile:getItems()) do

                    -- use

                    if table.find(useId, item:getId()) then

                        use(item)

                        return

                    elseif table.find(shovelId, item:getId()) then

                        useWith(settings.shovel, item)

                        return

                    elseif table.find(ropeId, item:getId()) then

                        useWith(settings.rope, item)

                        return

                    elseif table.find(macheteId, item:getId()) then

                        useWith(settings.machete, item)

                        return

                    elseif table.find(scytheId, item:getId()) then

                        useWith(settings.scythe, item)

                        return

                    end

                end

            end

        end

    end)

  end

end

addCheckBox("timers", "MW & WG Timers", true, rightPanel, "Show times for Magic Walls and Wild Growths.")

if true then

  local activeTimers = {}

  onAddThing(function(tile, thing)

    if not settings.timers then return end

    if not thing:isItem() then

      return

    end

    local timer = 0

    if thing:getId() == 2129 then -- mwall id

      timer = 20000 -- mwall time

    elseif thing:getId() == 2130 then -- wg id

      timer = 45000 -- wg time

    else

      return

    end

    local pos = tile:getPosition().x .. "," .. tile:getPosition().y .. "," .. tile:getPosition().z

    if not activeTimers[pos] or activeTimers[pos] < now then

      activeTimers[pos] = now + timer

    end

    tile:setTimer(activeTimers[pos] - now)

  end)

  onRemoveThing(function(tile, thing)

    if not settings.timers then return end

    if not thing:isItem() then

      return

    end

    if (thing:getId() == 2129 or thing:getId() == 2130) and tile:getGround() then

      local pos = tile:getPosition().x .. "," .. tile:getPosition().y .. "," .. tile:getPosition().z

      activeTimers[pos] = nil

      tile:setTimer(0)

    end

  end)

end

addCheckBox("antiKick", "Anti - Kick", true, rightPanel, "Turn every 10 minutes to prevent kick.")

if true then

  macro(600*1000, function()

    if not settings.antiKick then return end

    local dir = player:getDirection()

    turn((dir + 1) % 4)

    schedule(50, function() turn(dir) end)

  end)

end

addCheckBox("stake", "Skin Monsters", false, leftPanel, "Automatically skin & stake corpses when cavebot is enabled")

if true then

  local knifeBodies = {4286, 4272, 4173, 4011, 4025, 4047, 4052, 4057, 4062, 4112, 4212, 4321, 4324, 4327, 10352, 10356, 10360, 10364}

  local stakeBodies = {4097, 4137, 8738, 18958}

  local fishingBodies = {9582}

  macro(500, function()

      if not CaveBot.isOn() or not settings.stake then return end

      for i, tile in ipairs(g_map.getTiles(posz())) do

        local item = tile:getTopThing()

        if item and item:isContainer() then

          if table.find(knifeBodies, item:getId()) and findItem(5908) then

              CaveBot.delay(550)

              useWith(5908, item)

              return

          end

          if table.find(stakeBodies, item:getId()) and findItem(5942) then

              CaveBot.delay(550)

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

end

addCheckBox("oberon", "Auto Reply Oberon", true, rightPanel, "Auto reply to Grand Master Oberon talk minigame.")

if true then

  onTalk(function(name, level, mode, text, channelId, pos)

    if not settings.oberon then return end

    if mode == 34 then

        if string.find(text, "world will suffer for") then

            say("Are you ever going to fight or do you prefer talking?")

        elseif string.find(text, "feet when they see me") then

            say("Even before they smell your breath?")

        elseif string.find(text, "from this plane") then

            say("Too bad you barely exist at all!")

        elseif string.find(text, "ESDO LO") then

            say("SEHWO ASIMO, TOLIDO ESD")

        elseif string.find(text, "will soon rule this world") then

            say("Excuse me but I still do not get the message!")

        elseif string.find(text, "honourable and formidable") then

            say("Then why are we fighting alone right now?")

        elseif string.find(text, "appear like a worm") then

            say("How appropriate, you look like something worms already got the better of!")

        elseif string.find(text, "will be the end of mortal") then

            say("Then let me show you the concept of mortality before it!")

        elseif string.find(text, "virtues of chivalry") then

            say("Dare strike up a Minnesang and you will receive your last accolade!")

        end

    end

  end)

end

addCheckBox("autoOpenDoors", "Auto Open Doors", true, rightPanel, "Open doors when trying to step on them.")

if true then

  local doorsIds = { 5007, 8265, 1629, 1632, 5129, 6252, 6249, 7715, 7712, 7714,

                     7719, 6256, 1669, 1672, 5125, 5115, 5124, 17701, 17710, 1642,

                     6260, 5107, 4912, 6251, 5291, 1683, 1696, 1692, 5006, 2179, 5116,

                     1632, 11705, 30772, 30774, 6248, 5735, 5732, 5120, 23873, 5736,

                     6264, 5122, 30049, 30042, 7727 }

  function checkForDoors(pos)

    local tile = g_map.getTile(pos)

    if tile then

      local useThing = tile:getTopUseThing()

      if useThing and table.find(doorsIds, useThing:getId()) then

        g_game.use(useThing)

      end

    end

  end

  onKeyPress(function(keys)

    local wsadWalking = modules.game_walking.wsadWalking

    if not settings.autoOpenDoors then return end

    local pos = player:getPosition()

    if keys == 'Up' or (wsadWalking and keys == 'W') then

      pos.y = pos.y - 1

    elseif keys == 'Down' or (wsadWalking and keys == 'S') then

      pos.y = pos.y + 1

    elseif keys == 'Left' or (wsadWalking and keys == 'A') then

      pos.x = pos.x - 1

    elseif keys == 'Right' or (wsadWalking and keys == 'D') then

      pos.x = pos.x + 1

    elseif wsadWalking and keys == "Q" then

      pos.y = pos.y - 1

      pos.x = pos.x - 1

    elseif wsadWalking and keys == "E" then

      pos.y = pos.y - 1

      pos.x = pos.x + 1

    elseif wsadWalking and keys == "Z" then

      pos.y = pos.y + 1

      pos.x = pos.x - 1

    elseif wsadWalking and keys == "C" then

      pos.y = pos.y + 1

      pos.x = pos.x + 1

    end

    checkForDoors(pos)

  end)

end

addCheckBox("bless", "Buy bless at login", true, rightPanel, "Say !bless at login.")

if true then

  local blessed = false

  onTextMessage(function(mode,text)

    if not settings.bless then return end

    text = text:lower()

    if text == "you already have all blessings." then

      blessed = true

    end

  end)

  if settings.bless then

    if player:getBlessings() == 0 then

      say("!bless")

      schedule(2000, function()

          if g_game.getClientVersion() > 1000 then

            if not blessed and player:getBlessings() == 0 then

                warn("!! Blessings not bought !!")

            end

          end

      end)

    end

  end

end

addCheckBox("reUse", "Keep Crosshair", false, rightPanel, "Keep crosshair after using with item")

if true then

  local excluded = {268, 237, 238, 23373, 266, 236, 239, 7643, 23375, 7642, 23374, 5908, 5942}

  onUseWith(function(pos, itemId, target, subType)

    if settings.reUse and not table.find(excluded, itemId) then

      schedule(50, function()

        item = findItem(itemId)

        if item then

          modules.game_interface.startUseWith(item)

        end

      end)

    end

  end)

end

addCheckBox("suppliesControl", "TargetBot off if low supply", false, leftPanel, "Turn off TargetBot if either one of supply amount is below 50% of minimum.")

if true then

  macro(500, function()

    if not settings.suppliesControl then return end

    if TargetBot.isOff() then return end

    if CaveBot.isOff() then return end

    if type(hasSupplies()) == 'table' then

        TargetBot.setOff()

    end

  end)

end

addCheckBox("holdMwall", "Hold MW/WG", true, rightPanel, "Mark tiles with below hotkeys to automatically use Magic Wall or Wild Growth")

addTextEdit("holdMwHot", "Magic Wall Hotkey: ", "F5", rightPanel)

addTextEdit("holdWgHot", "Wild Growth Hotkey: ", "F6", rightPanel)

if true then

  local hold = 0

  local mwHot

  local wgHot

  local candidates = {}

  local m = macro(20, function()

    mwHot = settings.holdMwHot

    wgHot = settings.holdWgHot

    if not settings.holdMwall then return end

      if #candidates == 0 then return end

      for i, pos in pairs(candidates) do

        local tile = g_map.getTile(pos)

        if tile then

          if tile:getText():len() == 0 then

            table.remove(candidates, i)

          end

          local rune = tile:getText() == "HOLD MW" and 3180 or tile:getText() == "HOLD WG" and 3156

          if tile:canShoot() and not isInPz() and tile:isWalkable() and tile:getTopUseThing():getId() ~= 2130 then

            if math.abs(player:getPosition().x-tile:getPosition().x) < 8 and math.abs(player:getPosition().y-tile:getPosition().y) < 6 then

              return useWith(rune, tile:getTopUseThing())

            end

          end

        end

      end

  end)

  onRemoveThing(function(tile, thing)

    if not settings.holdMwall then return end

      if thing:getId() ~= 2129 then return end

      if tile:getText():find("HOLD") then

          table.insert(candidates, tile:getPosition())

          local rune = tile:getText() == "HOLD MW" and 3180 or tile:getText() == "HOLD WG" and 3156

          if math.abs(player:getPosition().x-tile:getPosition().x) < 8 and math.abs(player:getPosition().y-tile:getPosition().y) < 6 then

            return useWith(rune, tile:getTopUseThing())

          end

      end

  end)

  onAddThing(function(tile, thing)

    if not settings.holdMwall then return end

      if m.isOff() then return end

      if thing:getId() ~= 2129 then return end

      if tile:getText():len() > 0 then

          table.remove(candidates, table.find(candidates,tile))

      end

  end)

  onKeyDown(function(keys)

    local wsadWalking = modules.game_walking.wsadWalking

    if not wsadWalking then return end

    if not settings.holdMwall then return end

    if m.isOff() then return end

    if keys ~= mwHot and keys ~= wgHot then return end

    hold = now

    local tile = getTileUnderCursor()

    if not tile then return end

    if tile:getText():len() > 0 then

        tile:setText("")

    else

        if keys == mwHot then

            tile:setText("HOLD MW")

        else

            tile:setText("HOLD WG")

        end

        table.insert(candidates, tile:getPosition())

    end

  end)

  onKeyPress(function(keys)

    local wsadWalking = modules.game_walking.wsadWalking

    if not wsadWalking then return end

    if not settings.holdMwall then return end

    if m.isOff() then return end

    if keys ~= mwHot and keys ~= wgHot then return end

    if (hold - now) < -1000 then

      candidates = {}

      for i, tile in ipairs(g_map.getTiles(posz())) do

        local text = tile:getText()

        if text:find("HOLD") then

          tile:setText("")

        end

      end

    end

  end)

end

addCheckBox("checkPlayer", "Check Players", true, rightPanel, "Auto look on players and mark level and vocation on character model")

if true then

  local found

  local function checkPlayers()

    for i, spec in ipairs(getSpectators()) do

      if spec:isPlayer() and spec:getText() == "" and spec:getPosition().z == posz() and spec ~= player then

          g_game.look(spec)

          found = now

      end

    end

  end

  if settings.checkPlayer then

    schedule(500, function()

      checkPlayers()

    end)

  end

  onPlayerPositionChange(function(x,y)

    if not settings.checkPlayer then return end

    if x.z ~= y.z then

      schedule(20, function() checkPlayers() end)

    end

  end)

  onCreatureAppear(function(creature)

    if not settings.checkPlayer then return end

    if creature:isPlayer() and creature:getText() == "" and creature:getPosition().z == posz() and creature ~= player then

        g_game.look(creature)

        found = now

    end

  end)

  local regex = [[You see ([^\(]*) \(Level ([0-9]*)\)((?:.)* of the ([\w ]*),|)]]

  onTextMessage(function(mode, text)

    if not settings.checkPlayer then return end

    local re = regexMatch(text, regex)

    if #re ~= 0 then

        local name = re[1][2]

        local level = re[1][3]

        local guild = re[1][5] or ""

        if guild:len() > 10 then

          guild = guild:sub(1,10) -- change to proper (last) values

          guild = guild.."..."

        end

        local voc

        if text:lower():find("sorcerer") then

            voc = "MS"

        elseif text:lower():find("druid") then

            voc = "ED"

        elseif text:lower():find("knight") then

            voc = "EK"

        elseif text:lower():find("paladin") then

            voc = "RP"

        end

        local creature = getCreatureByName(name)

        if creature then

            creature:setText("\n"..level..voc.."\n"..guild)

        end

        if found and now - found < 500 then

          modules.game_textmessage.clearMessages()

        end

    end

  end)

end

addCheckBox("nextBackpack", "Open Next Loot Container", true, leftPanel, "Auto open next loot container if full - has to have the same ID.")

  local function openNextLootContainer()

    if not settings.nextBackpack then return end

    local containers = getContainers()

    local lootCotaniersIds = CaveBot.GetLootContainers()

    for i, container in ipairs(containers) do

      local cId = container:getContainerItem():getId()

      if containerIsFull(container) then

        if table.find(lootCotaniersIds, cId) then

          for _, item in ipairs(container:getItems()) do

            if item:getId() == cId then

              return g_game.open(item, container)

            end

          end

        end

      end

    end

  end

if true then

  onContainerOpen(function(container, previousContainer)

    schedule(100, function()

      openNextLootContainer()

    end)

  end)

  onAddItem(function(container, slot, item, oldItem)

    schedule(100, function()

      openNextLootContainer()

    end)

  end)

end

addCheckBox("highlightTarget", "Highlight Current Target", true, rightPanel, "Additionaly hightlight current target with red glow")

if true then

  local function forceMarked(creature)

    if target() == creature then

        creature:setMarked("red")

        return schedule(333, function() forceMarked(creature) end)

    end

  end

  onAttackingCreatureChange(function(newCreature, oldCreature)

    if not settings.highlightTarget then return end

      if oldCreature then

          oldCreature:setMarked('')

      end

      if newCreature then

          forceMarked(newCreature)

      end

  end)

end

```

---
# extras.otui
```otui

ExtrasScrollBar < Panel

  height: 28

  margin-top: 3

  UIWidget

    id: text

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

  HorizontalScrollBar

    id: scroll

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 3

    minimum: 0

    maximum: 10

    step: 1

ExtrasTextEdit < Panel

  height: 40

  margin-top: 7

  UIWidget

    id: text

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

  TextEdit

    id: textEdit

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 5

    minimum: 0

    maximum: 10

    step: 1

    text-align: center

ExtrasItem < Panel

  height: 34

  margin-top: 7

  margin-left: 25

  margin-right: 25

  UIWidget

    id: text

    anchors.left: parent.left

    anchors.verticalCenter: next.verticalCenter

  BotItem

    id: item

    anchors.top: parent.top

    anchors.right: parent.right

ExtrasCheckBox < BotSwitch

  height: 20

  margin-top: 7

ExtrasWindow < MainWindow

  !text: tr('Extras')

  size: 440 360

  padding: 25

  Label

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    anchors.top: parent.top

    text-align: center

    text: < CaveBot >

  Label

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

    text: < Miscellaneous >

  VerticalScrollBar

    id: contentScroll

    anchors.top: prev.bottom

    margin-top: 3

    anchors.right: parent.right

    anchors.bottom: separator.top

    step: 28

    pixels-scroll: true

    margin-right: -10

    margin-top: 5

    margin-bottom: 5

  ScrollablePanel

    id: content

    anchors.top: prev.top

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: separator.top

    vertical-scrollbar: contentScroll

    margin-bottom: 10

    Panel

      id: left

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.horizontalCenter

      margin-top: 5

      margin-left: 10

      margin-right: 10

      layout:

        type: verticalBox

        fit-children: true

    Panel

      id: right

      anchors.top: parent.top

      anchors.left: parent.horizontalCenter

      anchors.right: parent.right

      margin-top: 5

      margin-left: 10

      margin-right: 10

      layout:

        type: verticalBox

        fit-children: true

    VerticalSeparator

      anchors.top: parent.top

      anchors.bottom: parent.bottom

      anchors.left: parent.horizontalCenter

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  ResizeBorder

    id: bottomResizeBorder

    anchors.fill: separator

    height: 3

    minimum: 260

    maximum: 600

    margin-left: 3

    margin-right: 3

    background: #ffffff88

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-right: 5

```

---
# hold_target.lua
```lua

setDefaultTab("Tools")

local targetID = nil

-- escape when attacking will reset hold target

onKeyPress(function(keys)

    if keys == "Escape" and targetID then

        targetID = nil

    end

end)

macro(100, "Hold Target", function()

    -- if attacking then save it as target, but check pos z in case of marking by mistake on other floor

    if target() and target():getPosition().z == posz() and not target():isNpc() then

        targetID = target():getId()

    elseif not target() then

        -- there is no saved data, do nothing

        if not targetID then return end

        -- look for target

        for i, spec in ipairs(getSpectators()) do

            local sameFloor = spec:getPosition().z == posz()

            local oldTarget = spec:getId() == targetID

            if sameFloor and oldTarget then

                attack(spec)

            end

        end

    end

end)

```

---
# ingame_editor.lua
```lua

setDefaultTab("Tools")

-- allows to test/edit bot lua scripts ingame, you can have multiple scripts like this, just change storage.ingame_lua

UI.Button("Ingame script editor", function(newText)

    UI.MultilineEditorWindow(storage.ingame_hotkeys or "", {title="Hotkeys editor", description="You can add your custom scrupts here"}, function(text)

      storage.ingame_hotkeys = text

      reload()

    end)

  end)

  UI.Separator()

  for _, scripts in pairs({storage.ingame_hotkeys}) do

    if type(scripts) == "string" and scripts:len() > 3 then

      local status, result = pcall(function()

        assert(load(scripts, "ingame_editor"))()

      end)

      if not status then

        error("Ingame edior error:\n" .. result)

      end

    end

  end

  UI.Separator()

```

---
# items.lua
```lua

LootItems = {

    ["gold coin"] = 1,

    ["platinum coin"] = 100,

    ["crystal coin"] = 10000,

    ["abyss hammer"] = 20000,

    ["acorn"] = 10,

    ["albino plate"] = 1500,

    ["alloy legs"] = 11000,

    ["alptramun's toothbrush"] = 270000,

    ["amber"] = 20000,

    ["amber staff"] = 8000,

    ["amber with a bug"] = 41000,

    ["amber with a dragonfly"] = 56000,

    ["ancient amulet"] = 200,

    ["ancient belt buckle"] = 260,

    ["ancient coin"] = 350,

    ["ancient liche bone"] = 28000,

    ["ancient shield"] = 900,

    ["ancient stone"] = 200,

    ["angel figurine"] = 36000,

    ["angelic axe"] = 5000,

    ["ankh"] = 100,

    ["antlers"] = 50,

    ["ape fur"] = 120,

    ["apron"] = 1300,

    ["arbalest"] = 42000,

    ["arcane staff"] = 42000,

    ["assassin dagger"] = 20000,

    ["axe"] = 7,

    ["axe ring"] = 100,

    ["baby seal doll"] = 20000,

    ["badger boots"] = 7500,

    ["badger fur"] = 15,

    ["bamboo stick"] = 30,

    ["banana sash"] = 55,

    ["banana staff"] = 1000,

    ["bandana"] = 150,

    ["bar of gold"] = 10000,

    ["basalt fetish"] = 210,

    ["basalt figurine"] = 160,

    ["bast skirt"] = 750,

    ["bat decoration"] = 2000,

    ["bat wing"] = 50,

    ["battle axe"] = 80,

    ["battle hammer"] = 120,

    ["battle shield"] = 95,

    ["battle stone"] = 290,

    ["batwing hat"] = 8000,

    ["bear paw"] = 100,

    ["beast's nightmare-cushion"] = 630000,

    ["beastslayer axe"] = 1500,

    ["bed of nails"] = 500,

    ["beer tap"] = 50,

    ["beetle carapace"] = 200,

    ["beetle necklace"] = 1500,

    ["behemoth claw"] = 2000,

    ["behemoth trophy"] = 20000,

    ["bejeweled ship's telescope"] = 20000,

    ["berserk potion"] = 500,

    ["berserker"] = 40000,

    ["black hood"] = 190,

    ["black pearl"] = 280,

    ["black shield"] = 800,

    ["black wool"] = 300,

    ["blacksteel sword"] = 6000,

    ["blade of corruption"] = 60000,

    ["blazing bone"] = 610,

    ["blessed sceptre"] = 40000,

    ["blood preservation"] = 320,

    ["blood tincture in a vial"] = 360,

    ["bloody dwarven beard"] = 110,

    ["bloody edge"] = 30000,

    ["bloody pincers"] = 100,

    ["bloody tears"] = 70000,

    ["blue crystal shard"] = 1500,

    ["blue crystal splinter"] = 400,

    ["blue gem"] = 5000,

    ["blue glass plate"] = 60,

    ["blue goanna scale"] = 230,

    ["blue legs"] = 15000,

    ["blue piece of cloth"] = 200,

    ["blue robe"] = 10000,

    ["blue rose"] = 250,

    ["boggy dreads"] = 200,

    ["bola"] = 35,

    ["bone club"] = 5,

    ["bone fetish"] = 150,

    ["bone shield"] = 80,

    ["bone shoulderplate"] = 150,

    ["bone sword"] = 20,

    ["bone toothpick"] = 150,

    ["bonebeast trophy3"] = 6000,

    ["bonebreaker"] = 10000,

    ["bonecarving knife"] = 190,

    ["bonelord eye"] = 80,

    ["bonelord helmet"] = 2200,

    ["bonelord shield"] = 1200,

    ["bones of zorvorax"] = 10000,

    ["bony tail"] = 210,

    ["book of necromantic rituals"] = 180,

    ["book of prayers"] = 120,

    ["book page"] = 640,

    ["boots of haste"] = 30000,

    ["bow"] = 100,

    ["bowl of terror sweat"] = 500,

    ["brain head's giant neuron"] = 100000,

    ["brain head's left hemisphere"] = 90000,

    ["brain head's right hemisphere"] = 50000,

    ["brass armor"] = 150,

    ["brass helmet"] = 30,

    ["brass legs"] = 49,

    ["brass shield"] = 25,

    ["bright bell"] = 220,

    ["bright sword"] = 6000,

    ["brimstone fangs"] = 380,

    ["brimstone shell"] = 210,

    ["broadsword"] = 500,

    ["broken crossbow"] = 30,

    ["broken draken mail"] = 340,

    ["broken gladiator shield"] = 190,

    ["broken halberd"] = 100,

    ["broken helmet"] = 20,

    ["broken key ring"] = 8000,

    ["broken longbow"] = 120,

    ["broken ring of ending"] = 4000,

    ["broken shamanic staff"] = 35,

    ["broken slicer"] = 120,

    ["broken throwing axe"] = 230,

    ["broken visor"] = 1900,

    ["bronze amulet"] = 50,

    ["brooch of embracement"] = 14000,

    ["brown crystal splinter"] = 400,

    ["brown piece of cloth"] = 100,

    ["brutetamer's staff"] = 1500,

    ["buckle"] = 7000,

    ["bullseye potion"] = 500,

    ["bunch of ripe rice"] = 75,

    ["bunch of troll hair"] = 30,

    ["bundle of cursed straw"] = 800,

    ["butcher's axe"] = 18000,

    ["calopteryx cape"] = 15000,

    ["capricious heart"] = 2100,

    ["capricious robe"] = 1200,

    ["carapace shield"] = 32000,

    ["carlin sword"] = 118,

    ["carniphila seeds"] = 50,

    ["carrion worm fang"] = 35,

    ["castle shield"] = 5000,

    ["cat's paw"] = 2000,

    ["cave devourer eyes"] = 550,

    ["cave devourer legs"] = 350,

    ["cave devourer maw"] = 600,

    ["cavebear skull"] = 550,

    ["centipede leg"] = 28,

    ["ceremonial ankh"] = 20000,

    ["chain armor"] = 70,

    ["chain bolter"] = 40000,

    ["chain helmet"] = 17,

    ["chain legs"] = 25,

    ["chaos mace"] = 9000,

    ["charmer's tiara"] = 900,

    ["chasm spawn abdomen"] = 240,

    ["chasm spawn head"] = 850,

    ["chasm spawn tail"] = 120,

    ["cheese cutter"] = 50,

    ["cheesy figurine"] = 150,

    ["chicken feather"] = 30,

    ["chitinous mouth"] = 10000,

    ["claw of 'the noxious spawn'"] = 15000,

    ["cliff strider claw"] = 800,

    ["closed trap"] = 75,

    ["club"] = 1,

    ["club ring"] = 100,

    ["coal"] = 20,

    ["coat"] = 1,

    ["cobra crest"] = 650,

    ["cobra crown"] = 50000,

    ["cobra tongue"] = 15,

    ["coconut shoes"] = 500,

    ["collar of blue plasma"] = 6000,

    ["collar of green plasma"] = 6000,

    ["collar of red plasma"] = 6000,

    ["colourful feather"] = 110,

    ["colourful feathers"] = 400,

    ["colourful snail shell"] = 250,

    ["compass"] = 45,

    ["composite hornbow"] = 25000,

    ["compound eye"] = 150,

    ["condensed energy"] = 260,

    ["copper shield"] = 50,

    ["coral brooch"] = 750,

    ["corrupted flag"] = 700,

    ["countess sorrow's frozen tear"] = 50000,

    ["cow bell"] = 120,

    ["cowtana"] = 2500,

    ["crab pincers"] = 35,

    ["cracked alabaster vase"] = 180,

    ["cranial basher"] = 30000,

    ["crawler head plating"] = 210,

    ["crawler's essence"] = 3700,

    ["crest of the deep seas"] = 10000,

    ["crocodile boots"] = 1000,

    ["crossbow"] = 120,

    ["crowbar"] = 50,

    ["crown"] = 2700,

    ["crown armor"] = 12000,

    ["crown helmet"] = 2500,

    ["crown legs"] = 12000,

    ["crown shield"] = 8000,

    ["cruelty's chest"] = 720000,

    ["cruelty's claw"] = 640000,

    ["crunor idol"] = 30000,

    ["crusader helmet"] = 6000,

    ["crystal bone"] = 250,

    ["crystal crossbow"] = 35000,

    ["crystal mace"] = 12000,

    ["crystal necklace"] = 400,

    ["crystal of balance"] = 1000,

    ["crystal of focus"] = 2000,

    ["crystal of power"] = 3000,

    ["crystal pedestal"] = 500,

    ["crystal ring"] = 250,

    ["crystal sword"] = 600,

    ["crystal wand"] = 10000,

    ["crystalline armor"] = 16000,

    ["crystalline spikes"] = 440,

    ["crystallized anger"] = 400,

    ["cultish mask"] = 280,

    ["cultish robe"] = 150,

    ["cultish symbol"] = 500,

    ["curious matter"] = 430,

    ["cursed bone"] = 6000,

    ["cursed shoulder spikes"] = 320,

    ["cyan crystal fragment"] = 800,

    ["cyclops toe"] = 55,

    ["cyclops trophy"] = 500,

    ["dagger"] = 2,

    ["damaged armor plates"] = 280,

    ["damaged worm head"] = 8000,

    ["damselfly eye"] = 25,

    ["damselfly wing"] = 20,

    ["dandelion seeds"] = 200,

    ["dangerous proto matter"] = 300,

    ["daramian mace"] = 110,

    ["daramian waraxe"] = 1000,

    ["dark armor"] = 400,

    ["dark bell"] = 250,

    ["dark helmet"] = 250,

    ["dark mushroom"] = 100,

    ["dark rosary"] = 48,

    ["dark shield"] = 400,

    ["dead rat"] = 1,

    ["dead weight"] = 450,

    ["death ring"] = 1000,

    ["deepling axe"] = 40000,

    ["deepling breaktime snack"] = 90,

    ["deepling claw"] = 430,

    ["deepling guard belt buckle"] = 230,

    ["deepling ridge"] = 360,

    ["deepling scales"] = 80,

    ["deepling squelcher"] = 7000,

    ["deepling staff"] = 4000,

    ["deepling warts"] = 180,

    ["deeptags"] = 290,

    ["deepworm jaws"] = 500,

    ["deepworm spike roots"] = 650,

    ["deepworm spikes"] = 800,

    ["deer trophy3"] = 3000,

    ["demon dust"] = 300,

    ["demon helmet"] = 40000,

    ["demon horn"] = 1000,

    ["demon shield"] = 30000,

    ["demon trophy"] = 40000,

    ["demonbone amulet"] = 32000,

    ["demonic essence"] = 1000,

    ["demonic finger"] = 1000,

    ["demonic skeletal hand"] = 80,

    ["demonrage sword"] = 36000,

    ["depth calcei"] = 25000,

    ["depth galea"] = 35000,

    ["depth lorica"] = 30000,

    ["depth ocrea"] = 16000,

    ["depth scutum"] = 36000,

    ["devil helmet"] = 1000,

    ["diabolic skull"] = 19000,

    ["diamond"] = 15000,

    ["diamond sceptre"] = 3000,

    ["diremaw brainpan"] = 350,

    ["diremaw legs"] = 270,

    ["dirty turban"] = 120,

    ["disgusting trophy"] = 3000,

    ["distorted heart"] = 2100,

    ["distorted robe"] = 1200,

    ["divine plate"] = 55000,

    ["djinn blade"] = 15000,

    ["doll"] = 200,

    ["double axe"] = 260,

    ["doublet"] = 3,

    ["downy feather"] = 20,

    ["dowser"] = 35,

    ["drachaku"] = 10000,

    ["dracola's eye"] = 50000,

    ["dracoyle statue"] = 5000,

    ["dragon blood"] = 700,

    ["dragon claw"] = 8000,

    ["dragon figurine"] = 45000,

    ["dragon hammer"] = 2000,

    ["dragon lance"] = 9000,

    ["dragon lord trophy"] = 10000,

    ["dragon necklace"] = 100,

    ["dragon priest's wandtip"] = 175,

    ["dragon robe"] = 50000,

    ["dragon scale mail"] = 40000,

    ["dragon shield"] = 4000,

    ["dragon slayer"] = 15000,

    ["dragon tongue"] = 550,

    ["dragonbone staff"] = 3000,

    ["dragon's tail"] = 100,

    ["draken boots"] = 40000,

    ["draken sulphur"] = 550,

    ["draken trophy"] = 15000,

    ["draken wristbands"] = 430,

    ["drakinata"] = 10000,

    ["draptor scales"] = 800,

    ["dreaded cleaver"] = 10000,

    ["dream essence egg"] = 205,

    ["dung ball"] = 130,

    ["dwarven armor"] = 30000,

    ["dwarven axe"] = 1500,

    ["dwarven legs"] = 40000,

    ["dwarven ring"] = 100,

    ["dwarven shield"] = 100,

    ["earflap"] = 40,

    ["earth blacksteel sword"] = 6000,

    ["earth cranial basher"] = 30000,

    ["earth crystal mace"] = 12000,

    ["earth dragon slayer"] = 15000,

    ["earth headchopper"] = 6000,

    ["earth heroic axe"] = 30000,

    ["earth knight axe"] = 2000,

    ["earth mystic blade"] = 30000,

    ["earth orcish maul"] = 6000,

    ["earth relic sword"] = 25000,

    ["earth spike sword"] = 1000,

    ["earth war axe"] = 12000,

    ["earth war hammer"] = 1200,

    ["ectoplasmic sushi"] = 300,

    ["egg of the many"] = 15000,

    ["elder bonelord tentacle"] = 150,

    ["elite draken mail"] = 50000,

    ["elven amulet"] = 100,

    ["elven astral observer"] = 90,

    ["elven hoof"] = 115,

    ["elven scouting glass"] = 50,

    ["elvish bow"] = 2000,

    ["elvish talisman"] = 45,

    ["emerald bangle"] = 800,

    ["empty honey glass"] = 270,

    ["empty potion flask"] = 5,

    ["enchanted chicken wing"] = 20000,

    ["energy ball"] = 300,

    ["energy blacksteel sword"] = 6000,

    ["energy cranial basher"] = 30000,

    ["energy crystal mace"] = 12000,

    ["energy dragon slayer"] = 15000,

    ["energy headchopper"] = 6000,

    ["energy heroic axe"] = 30000,

    ["energy knight axe"] = 2000,

    ["energy mystic blade"] = 30000,

    ["energy orcish maul"] = 6000,

    ["energy relic sword"] = 25000,

    ["energy ring"] = 100,

    ["energy spike sword"] = 1000,

    ["energy vein"] = 270,

    ["energy war axe"] = 12000,

    ["energy war hammer"] = 1200,

    ["ensouled essence"] = 820,

    ["epee"] = 8000,

    ["essence of a bad dream"] = 360,

    ["ethno coat"] = 200,

    ["execowtioner axe"] = 12000,

    ["executioner"] = 55000,

    ["explorer brooch"] = 50,

    ["eye of a deepling"] = 150,

    ["eye of a weeper"] = 650,

    ["eye of corruption"] = 390,

    ["fafnar symbol"] = 950,

    ["fairy wings"] = 200,

    ["falcon crest"] = 650,

    ["feather headdress"] = 850,

    ["fern"] = 20,

    ["fiery blacksteel sword"] = 6000,

    ["fiery cranial basher"] = 30000,

    ["fiery crystal mace"] = 12000,

    ["fiery dragon slayer"] = 15000,

    ["fiery headchopper"] = 6000,

    ["fiery heart"] = 375,

    ["fiery heroic axe"] = 30000,

    ["fiery knight axe"] = 2000,

    ["fiery mystic blade"] = 30000,

    ["fiery orcish maul"] = 6000,

    ["fiery relic sword"] = 25000,

    ["fiery spike sword"] = 1000,

    ["fiery war axe"] = 12000,

    ["fiery war hammer"] = 1200,

    ["fig leaf"] = 200,

    ["figurine of cruelty"] = 3100000,

    ["figurine of greed"] = 2900000,

    ["figurine of hatred"] = 2700000,

    ["figurine of malice"] = 2800000,

    ["figurine of megalomania"] = 5000000,

    ["figurine of spite"] = 3000000,

    ["fir cone"] = 25,

    ["fire axe"] = 8000,

    ["fire mushroom"] = 200,

    ["fire sword"] = 1000,

    ["fish fin"] = 150,

    ["fishing rod"] = 40,

    ["flask of embalming fluid"] = 30,

    ["flask of warrior's sweat"] = 10000,

    ["flintstone"] = 800,

    ["flower dress"] = 1000,

    ["flower wreath"] = 500,

    ["focus cape"] = 6000,

    ["fox paw"] = 100,

    ["frazzle skin"] = 400,

    ["frazzle tongue"] = 700,

    ["frost giant pelt"] = 160,

    ["frosty ear of a troll"] = 30,

    ["frosty heart"] = 280,

    ["frozen lightning"] = 270,

    ["frozen starlight"] = 20000,

    ["fur armor"] = 5000,

    ["fur boots"] = 2000,

    ["fur shred"] = 200,

    ["furry club"] = 1000,

    ["garlic necklace"] = 50,

    ["gauze bandage"] = 90,

    ["gear crystal"] = 200,

    ["gear wheel"] = 500,

    ["gearwheel chain"] = 5000,

    ["gemmed figurine"] = 3500,

    ["geomancer's robe"] = 80,

    ["geomancer's staff"] = 120,

    ["ghastly dragon head"] = 700,

    ["ghostly tissue"] = 90,

    ["ghoul snack"] = 60,

    ["giant amethyst"] = 60000,

    ["giant crab pincer"] = 950,

    ["giant emerald"] = 90000,

    ["giant eye"] = 380,

    ["giant ruby"] = 70000,

    ["giant sapphire"] = 50000,

    ["giant shimmering pearl"] = 3000,

    ["giant smithhammer"] = 250,

    ["giant sword"] = 17000,

    ["giant tentacle"] = 10000,

    ["giant topaz"] = 80000,

    ["girlish hair decoration"] = 30,

    ["glacial rod"] = 6500,

    ["glacier amulet"] = 1500,

    ["glacier kilt"] = 11000,

    ["glacier mask"] = 2500,

    ["glacier robe"] = 11000,

    ["glacier shoes"] = 2500,

    ["gland"] = 500,

    ["glistening bone"] = 250,

    ["glob of acid slime"] = 25,

    ["glob of mercury"] = 20,

    ["glob of tar"] = 30,

    ["gloom wolf fur"] = 70,

    ["glooth amulet"] = 2000,

    ["glooth axe"] = 1500,

    ["glooth blade"] = 1500,

    ["glooth cape"] = 7000,

    ["glooth club"] = 1500,

    ["glooth whip"] = 2500,

    ["glorious axe"] = 3000,

    ["glowing rune"] = 350,

    ["goanna claw"] = 260,

    ["goanna meat"] = 190,

    ["goat grass"] = 50,

    ["goblet of gloom"] = 12000,

    ["goblin ear"] = 20,

    ["gold ingot"] = 5000,

    ["gold nugget"] = 850,

    ["gold ring"] = 8000,

    ["golden amulet"] = 2000,

    ["golden armor"] = 20000,

    ["golden brush"] = 250,

    ["golden fafnar trophy"] = 10000,

    ["golden figurine"] = 3000,

    ["golden legs"] = 30000,

    ["golden lotus brooch"] = 270,

    ["golden mask"] = 38000,

    ["golden mug"] = 250,

    ["golden sickle"] = 1000,

    ["goo shell"] = 4000,

    ["goosebump leather"] = 650,

    ["grant of arms"] = 950,

    ["grasshopper legs"] = 15000,

    ["grave flower"] = 25,

    ["greed's arm"] = 950000,

    ["green bandage"] = 180,

    ["green crystal fragment"] = 800,

    ["green crystal shard"] = 1500,

    ["green crystal splinter"] = 400,

    ["green dragon leather"] = 100,

    ["green dragon scale"] = 100,

    ["green gem"] = 5000,

    ["green glass plate"] = 180,

    ["green mushroom"] = 100,

    ["green piece of cloth"] = 200,

    ["greenwood coat"] = 50000,

    ["griffin shield"] = 3000,

    ["grimace"] = 120000,

    ["gruesome fan"] = 15000,

    ["guardian axe"] = 9000,

    ["guardian boots"] = 35000,

    ["guardian halberd"] = 11000,

    ["guardian shield"] = 2000,

    ["guidebook"] = 200,

    ["hailstorm rod"] = 3000,

    ["hair of a banshee"] = 350,

    ["halberd"] = 400,

    ["half-digested piece of meat"] = 55,

    ["half-digested stones"] = 40,

    ["half-eaten brain"] = 85,

    ["ham"] = 4,

    ["hammer of wrath"] = 30000,

    ["hand"] = 1450,

    ["hand axe"] = 4,

    ["hardened bone"] = 70,

    ["harpoon of a giant snail"] = 15000,

    ["hatched rorc egg"] = 30,

    ["hatchet"] = 25,

    ["haunted blade"] = 8000,

    ["haunted piece of wood"] = 115,

    ["hazardous heart"] = 5000,

    ["hazardous robe"] = 3000,

    ["head"] = 3500,

    ["headchopper"] = 6000,

    ["heat core"] = 10000,

    ["heaven blossom"] = 50,

    ["heavy mace"] = 50000,

    ["heavy machete"] = 90,

    ["heavy trident"] = 2000,

    ["hellhound slobber"] = 500,

    ["hellspawn tail"] = 475,

    ["helmet of the lost"] = 2000,

    ["hemp rope"] = 350,

    ["heroic axe"] = 30000,

    ["hexagonal ruby"] = 30000,

    ["hibiscus dress"] = 3000,

    ["hideous chunk"] = 510,

    ["hieroglyph banner"] = 500,

    ["high guard flag"] = 550,

    ["high guard shoulderplates"] = 130,

    ["hive bow"] = 28000,

    ["hive scythe"] = 17000,

    ["hollow stampor hoof"] = 400,

    ["holy ash"] = 160,

    ["holy orchid"] = 90,

    ["honeycomb"] = 40,

    ["horn"] = 300,

    ["horn of kalyassa"] = 10000,

    ["horoscope"] = 40,

    ["horseman helmet"] = 280,

    ["huge chunk of crude iron"] = 15000,

    ["huge shell"] = 15000,

    ["huge spiky snail shell"] = 8000,

    ["humongous chunk"] = 540,

    ["hunter's quiver"] = 80,

    ["hunting spear"] = 25,

    ["hydra egg"] = 500,

    ["hydra head"] = 600,

    ["ice flower"] = 370,

    ["ice rapier"] = 1000,

    ["icy blacksteel sword"] = 6000,

    ["icy cranial basher"] = 30000,

    ["icy crystal mace"] = 12000,

    ["icy dragon slayer"] = 15000,

    ["icy headchopper"] = 6000,

    ["icy heroic axe"] = 30000,

    ["icy knight axe"] = 2000,

    ["icy mystic blade"] = 30000,

    ["icy orcish maul"] = 6000,

    ["icy relic sword"] = 25000,

    ["icy spike sword"] = 1000,

    ["icy war axe"] = 12000,

    ["icy war hammer"] = 1200,

    ["incantation notes"] = 90,

    ["infernal heart"] = 2100,

    ["infernal robe"] = 1200,

    ["inkwell"] = 8,

    ["instable proto matter"] = 300,

    ["iron helmet"] = 150,

    ["iron ore"] = 500,

    ["ivory carving"] = 300,

    ["ivory comb"] = 8000,

    ["izcandar's snow globe"] = 180000,

    ["izcandar's sundial"] = 225000,

    ["jacket"] = 1,

    ["jade hammer"] = 25000,

    ["jade hat"] = 9000,

    ["jagged sickle"] = 150000,

    ["jaws"] = 3900,

    ["jewelled belt"] = 180,

    ["katana"] = 35,

    ["katex' blood"] = 210,

    ["key to the drowned library"] = 330,

    ["knight armor"] = 5000,

    ["knight axe"] = 2000,

    ["knight legs"] = 5000,

    ["kollos shell"] = 420,

    ["kongra's shoulderpad"] = 100,

    ["krimhorn helmet"] = 200,

    ["lamassu hoof"] = 330,

    ["lamassu horn"] = 240,

    ["lancer beetle shell"] = 80,

    ["lancet"] = 90,

    ["lavos armor"] = 16000,

    ["leaf legs"] = 500,

    ["leather armor"] = 12,

    ["leather boots"] = 2,

    ["leather harness"] = 750,

    ["leather helmet"] = 4,

    ["leather legs"] = 9,

    ["legion helmet"] = 22,

    ["legionnaire flags"] = 500,

    ["leopard armor"] = 300,

    ["leviathan's amulet"] = 3000,

    ["life crystal"] = 50,

    ["life preserver"] = 300,

    ["life ring"] = 50,

    ["light shovel"] = 300,

    ["lightning boots"] = 2500,

    ["lightning headband"] = 2500,

    ["lightning legs"] = 11000,

    ["lightning pendant"] = 1500,

    ["lightning robe"] = 11000,

    ["lion cloak patch"] = 190,

    ["lion crest"] = 270,

    ["lion figurine"] = 10000,

    ["lion seal"] = 210,

    ["lion trophy3"] = 3000,

    ["lion's mane"] = 60,

    ["little bowl of myrrh"] = 500,

    ["lizard essence"] = 300,

    ["lizard heart"] = 530,

    ["lizard leather"] = 150,

    ["lizard scale"] = 120,

    ["lizard trophy"] = 8000,

    ["longing eyes"] = 8000,

    ["longsword"] = 51,

    ["lost basher's spike"] = 280,

    ["lost bracers"] = 140,

    ["lost husher's staff"] = 250,

    ["lost soul"] = 120,

    ["luminescent crystal pickaxe"] = 50,

    ["luminous orb"] = 1000,

    ["lump of dirt"] = 10,

    ["lump of earth"] = 130,

    ["lunar staff"] = 5000,

    ["mace"] = 30,

    ["machete"] = 6,

    ["mad froth"] = 80,

    ["magic light wand"] = 35,

    ["magic plate armor"] = 90000,

    ["magic sulphur"] = 8000,

    ["magma amulet"] = 1500,

    ["magma boots"] = 2500,

    ["magma clump"] = 570,

    ["magma coat"] = 11000,

    ["magma legs"] = 11000,

    ["magma monocle"] = 2500,

    ["malice's horn"] = 620000,

    ["malice's spine"] = 850000,

    ["malofur's lunchbox"] = 240000,

    ["mammoth fur cape"] = 6000,

    ["mammoth fur shorts"] = 850,

    ["mammoth tusk"] = 100,

    ["mammoth whopper"] = 300,

    ["mantassin tail"] = 280,

    ["manticore ear"] = 310,

    ["manticore tail"] = 220,

    ["marlin trophy"] = 5000,

    ["marsh stalker beak"] = 65,

    ["marsh stalker feather"] = 50,

    ["mastermind potion"] = 500,

    ["mastermind shield"] = 50000,

    ["maxilla"] = 250,

    ["maxxenius head"] = 500000,

    ["meat"] = 2,

    ["meat hammer"] = 60,

    ["medal of valiance"] = 410000,

    ["medusa shield"] = 9000,

    ["megalomania's essence"] = 1900000,

    ["megalomania's skull"] = 1500000,

    ["mercenary sword"] = 12000,

    ["metal bat"] = 9000,

    ["metal spats"] = 2000,

    ["metal spike"] = 320,

    ["might ring"] = 250,

    ["milk churn"] = 100,

    ["mind stone"] = 100,

    ["mino lance"] = 7000,

    ["mino shield"] = 3000,

    ["minotaur horn"] = 75,

    ["minotaur leather"] = 80,

    ["minotaur trophy"] = 500,

    ["miraculum"] = 60,

    ["mirror"] = 10,

    ["model ship"] = 1000,

    ["modified crossbow"] = 10000,

    ["mooh'tah plate"] = 6000,

    ["moohtant cudgel"] = 14000,

    ["moonlight rod"] = 200,

    ["moonstone"] = 13000,

    ["morbid tapestry"] = 30000,

    ["morgaroth's heart"] = 15000,

    ["morning star"] = 100,

    ["mould heart"] = 2100,

    ["mould robe"] = 1200,

    ["mr. punish's handcuffs"] = 50000,

    ["muck rod"] = 6000,

    ["mucus plug"] = 500,

    ["mutated bat ear"] = 420,

    ["mutated flesh"] = 50,

    ["mutated rat tail"] = 150,

    ["mycological bow"] = 35000,

    ["mysterious fetish"] = 50,

    ["mystic blade"] = 30000,

    ["mystic turban"] = 150,

    ["mystical hourglass"] = 700,

    ["naginata"] = 2000,

    ["necklace of the deep"] = 3000,

    ["necromantic robe"] = 250,

    ["necrotic rod"] = 1000,

    ["nettle blossom"] = 75,

    ["nettle spit"] = 25,

    ["nightmare blade"] = 35000,

    ["noble amulet"] = 430000,

    ["noble armor"] = 900,

    ["noble axe"] = 10000,

    ["noble cape"] = 425000,

    ["noble turban"] = 430,

    ["norse shield"] = 1500,

    ["northwind rod"] = 1500,

    ["nose ring"] = 2000,

    ["obsidian lance"] = 500,

    ["odd organ"] = 410,

    ["ogre ear stud"] = 180,

    ["ogre nose ring"] = 210,

    ["old parchment"] = 500,

    ["onyx chip"] = 500,

    ["onyx flail"] = 22000,

    ["onyx pendant"] = 3500,

    ["opal"] = 500,

    ["orange mushroom"] = 150,

    ["orb"] = 750,

    ["orc leather"] = 30,

    ["orc tooth"] = 150,

    ["orc trophy3"] = 1000,

    ["orcish axe"] = 350,

    ["orcish gear"] = 85,

    ["orcish maul"] = 6000,

    ["orichalcum pearl"] = 40,

    ["oriental shoes"] = 15000,

    ["ornamented axe"] = 20000,

    ["ornamented shield"] = 1500,

    ["ornate chestplate"] = 60000,

    ["ornate crossbow"] = 12000,

    ["ornate legs"] = 40000,

    ["ornate locket"] = 18000,

    ["ornate mace"] = 42000,

    ["ornate shield"] = 42000,

    ["orshabaal's brain"] = 12000,

    ["pair of hellflayer horns"] = 1300,

    ["pair of iron fists"] = 4000,

    ["pair of old bracers"] = 500,

    ["paladin armor"] = 15000,

    ["pale worm's scalp"] = 489000,

    ["panda teddy"] = 30000,

    ["panther head"] = 750,

    ["panther paw"] = 300,

    ["patch of fine cloth"] = 1350,

    ["patched boots"] = 2000,

    ["peacock feather fan"] = 350,

    ["pelvis bone"] = 30,

    ["perfect behemoth fang"] = 250,

    ["pet pig"] = 1500,

    ["petrified scream"] = 250,

    ["phantasmal hair"] = 500,

    ["pharaoh banner"] = 1000,

    ["pharaoh sword"] = 23000,

    ["phoenix shield"] = 16000,

    ["pick"] = 15,

    ["piece of archer armor"] = 20,

    ["piece of crocodile leather"] = 15,

    ["piece of dead brain"] = 420,

    ["piece of draconian steel"] = 3000,

    ["piece of hell steel"] = 500,

    ["piece of hellfire armor"] = 550,

    ["piece of massacre's shell"] = 50000,

    ["piece of royal steel"] = 10000,

    ["piece of scarab shell"] = 45,

    ["piece of swampling wood"] = 30,

    ["piece of warrior armor"] = 50,

    ["pieces of magic chalk"] = 210,

    ["pig foot"] = 10,

    ["pile of grave earth"] = 25,

    ["pirate boots"] = 3000,

    ["pirate hat"] = 1000,

    ["pirate knee breeches"] = 200,

    ["pirate shirt"] = 500,

    ["pirate voodoo doll"] = 500,

    ["plagueroot offshoot"] = 280000,

    ["plasma pearls"] = 250,

    ["plasmatic lightning"] = 270,

    ["plate armor"] = 400,

    ["plate legs"] = 115,

    ["plate shield"] = 45,

    ["platinum amulet"] = 2500,

    ["poison dagger"] = 50,

    ["poison gland"] = 210,

    ["poison spider shell"] = 10,

    ["poisonous slime"] = 50,

    ["polar bear paw"] = 30,

    ["pool of chitinous glue"] = 480,

    ["porcelain mask"] = 2000,

    ["powder herb"] = 10,

    ["power ring"] = 50,

    ["prismatic quartz"] = 450,

    ["pristine worm head"] = 15000,

    ["protection amulet"] = 100,

    ["protective charm"] = 60,

    ["pulverized ore"] = 400,

    ["purified soul"] = 530,

    ["purple robe"] = 110,

    ["purple tome"] = 2000,

    ["quara bone"] = 500,

    ["quara eye"] = 350,

    ["quara pincers"] = 410,

    ["quara tentacle"] = 140,

    ["queen's sceptre"] = 20000,

    ["quill"] = 1100,

    ["rabbit's foot"] = 50,

    ["ragnir helmet"] = 400,

    ["rainbow quartz"] = 500,

    ["rapier"] = 5,

    ["rare earth"] = 80,

    ["ratana"] = 500,

    ["ravenous circlet"] = 220000,

    ["red crystal fragment"] = 800,

    ["red dragon leather"] = 200,

    ["red dragon scale"] = 200,

    ["red gem"] = 1000,

    ["red goanna scale"] = 270,

    ["red hair dye"] = 40,

    ["red lantern"] = 250,

    ["red piece of cloth"] = 300,

    ["red tome"] = 2000,

    ["relic sword"] = 25000,

    ["rhino hide"] = 175,

    ["rhino horn"] = 265,

    ["rhino horn carving"] = 300,

    ["rift bow"] = 45000,

    ["rift crossbow"] = 45000,

    ["rift lance"] = 30000,

    ["rift shield"] = 50000,

    ["ring of blue plasma"] = 8000,

    ["ring of green plasma"] = 8000,

    ["ring of healing"] = 100,

    ["ring of red plasma"] = 8000,

    ["ring of the sky"] = 30000,

    ["ripper lance"] = 500,

    ["rod"] = 2200,

    ["roots"] = 1200,

    ["rope"] = 15,

    ["rope belt"] = 66,

    ["rorc egg"] = 120,

    ["rorc feather"] = 70,

    ["rotten heart"] = 74000,

    ["rotten piece of cloth"] = 30,

    ["royal axe"] = 40000,

    ["royal helmet"] = 30000,

    ["royal tapestry"] = 1000,

    ["rubber cap"] = 11000,

    ["ruby necklace"] = 2000,

    ["runed sword"] = 45000,

    ["ruthless axe"] = 45000,

    ["sabre"] = 12,

    ["sabretooth"] = 400,

    ["sacred tree amulet"] = 3000,

    ["safety pin"] = 120,

    ["sai"] = 16500,

    ["salamander shield"] = 280,

    ["sample of monster blood"] = 250,

    ["sandcrawler shell"] = 20,

    ["sapphire hammer"] = 7000,

    ["scale armor"] = 75,

    ["scale of corruption"] = 680,

    ["scale of gelidrazah"] = 10000,

    ["scarab amulet"] = 200,

    ["scarab pincers"] = 280,

    ["scarab shield"] = 2000,

    ["scimitar"] = 150,

    ["scorpion tail"] = 25,

    ["scroll of heroic deeds"] = 230,

    ["scythe"] = 10,

    ["scythe leg"] = 450,

    ["sea horse figurine"] = 42000,

    ["sea serpent scale"] = 520,

    ["sea serpent trophy"] = 10000,

    ["seeds"] = 150,

    ["sentinel shield"] = 120,

    ["serpent sword"] = 900,

    ["shadow herb"] = 20,

    ["shadow sceptre"] = 10000,

    ["shaggy tail"] = 25,

    ["shamanic hood"] = 45,

    ["shamanic talisman"] = 200,

    ["shard"] = 2000,

    ["shimmering beetles"] = 150,

    ["shiny stone"] = 500,

    ["shockwave amulet"] = 3000,

    ["short sword"] = 10,

    ["shovel"] = 8,

    ["sickle"] = 3,

    ["sight of surrender's eye"] = 3000,

    ["signet ring"] = 480000,

    ["silencer claws"] = 390,

    ["silencer resonating chamber"] = 600,

    ["silken bookmark"] = 1300,

    ["silkweaver bow"] = 12000,

    ["silky fur"] = 35,

    ["silver amulet"] = 50,

    ["silver brooch"] = 150,

    ["silver dagger"] = 500,

    ["silver fafnar trophy"] = 1000,

    ["silver hand mirror"] = 10000,

    ["simple dress"] = 50,

    ["single human eye"] = 1000,

    ["skeleton decoration"] = 3000,

    ["skull belt"] = 80,

    ["skull coin"] = 12000,

    ["skull fetish"] = 250,

    ["skull helmet"] = 40000,

    ["skull of ratha"] = 250,

    ["skull shatterer"] = 170,

    ["skull staff"] = 6000,

    ["skullcracker armor"] = 18000,

    ["skunk tail"] = 50,

    ["slime mould"] = 175,

    ["slimy leg"] = 4500,

    ["sling herb"] = 10,

    ["small amethyst"] = 200,

    ["small axe"] = 5,

    ["small diamond"] = 300,

    ["small emerald"] = 250,

    ["small enchanted amethyst"] = 200,

    ["small enchanted emerald"] = 250,

    ["small enchanted ruby"] = 250,

    ["small enchanted sapphire"] = 250,

    ["small energy ball"] = 250,

    ["small flask of eyedrops"] = 95,

    ["small notebook"] = 480,

    ["small oil lamp"] = 150,

    ["small pitchfork"] = 70,

    ["small ruby"] = 250,

    ["small sapphire"] = 250,

    ["small topaz"] = 200,

    ["snake skin"] = 400,

    ["snakebite rod"] = 100,

    ["sniper gloves"] = 2000,

    ["soldier helmet"] = 16,

    ["solid rage"] = 310,

    ["some grimeleech wings"] = 1200,

    ["soul orb"] = 25,

    ["soul stone"] = 6000,

    ["souleater trophy"] = 7500,

    ["spark sphere"] = 350,

    ["sparkion claw"] = 290,

    ["sparkion legs"] = 310,

    ["sparkion stings"] = 280,

    ["sparkion tail"] = 300,

    ["spear"] = 3,

    ["spectral gold nugget"] = 500,

    ["spectral silver nugget"] = 250,

    ["spellsinger's seal"] = 280,

    ["spellweaver's robe"] = 12000,

    ["sphinx feather"] = 470,

    ["sphinx tiara"] = 360,

    ["spider fangs"] = 10,

    ["spider silk"] = 100,

    ["spidris mandible"] = 450,

    ["spike shield"] = 250,

    ["spike sword"] = 240,

    ["spiked iron ball"] = 100,

    ["spiked squelcher"] = 5000,

    ["spiky club"] = 300,

    ["spirit cloak"] = 350,

    ["spirit container"] = 40000,

    ["spite's spirit"] = 840000,

    ["spitter nose"] = 340,

    ["spooky blue eye"] = 95,

    ["spool of yarn"] = 1000,

    ["springsprout rod"] = 3600,

    ["srezz' eye"] = 300,

    ["stampor horn"] = 280,

    ["stampor talons"] = 150,

    ["star amulet"] = 500,

    ["star herb"] = 15,

    ["statue of abyssador"] = 4000,

    ["statue of deathstrike"] = 3000,

    ["statue of devovorga"] = 1500,

    ["statue of gnomevil"] = 2000,

    ["stealth ring"] = 200,

    ["steel boots"] = 30000,

    ["steel helmet"] = 293,

    ["steel shield"] = 80,

    ["stone herb"] = 20,

    ["stone nose"] = 590,

    ["stone skin amulet"] = 500,

    ["stone wing"] = 120,

    ["stonerefiner's skull"] = 100,

    ["strand of medusa hair"] = 600,

    ["strange helmet"] = 500,

    ["strange proto matter"] = 300,

    ["strange symbol"] = 200,

    ["strange talisman"] = 30,

    ["striped fur"] = 50,

    ["studded armor"] = 25,

    ["studded club"] = 10,

    ["studded helmet"] = 20,

    ["studded legs"] = 15,

    ["studded shield"] = 16,

    ["stuffed dragon"] = 6000,

    ["sulphurous stone"] = 100,

    ["swamp grass"] = 20,

    ["swamplair armor"] = 16000,

    ["swampling club"] = 40,

    ["swampling moss"] = 20,

    ["swarmer antenna"] = 130,

    ["sword"] = 25,

    ["sword ring"] = 100,

    ["tail of corruption"] = 240,

    ["talon"] = 320,

    ["tarantula egg"] = 80,

    ["tarnished rhino figurine"] = 320,

    ["tattered piece of robe"] = 120,

    ["taurus mace"] = 500,

    ["telescope eye"] = 1600,

    ["tempest shield"] = 35000,

    ["templar scytheblade"] = 200,

    ["tentacle piece"] = 5000,

    ["terra amulet"] = 1500,

    ["terra boots"] = 2500,

    ["terra hood"] = 2500,

    ["terra legs"] = 11000,

    ["terra mantle"] = 11000,

    ["terra rod"] = 2000,

    ["terramite eggs"] = 50,

    ["terramite legs"] = 60,

    ["terramite shell"] = 170,

    ["terrorbird beak"] = 95,

    ["thaian sword"] = 16000,

    ["the avenger"] = 42000,

    ["the handmaiden's protector"] = 50000,

    ["the imperor's trident"] = 50000,

    ["the ironworker"] = 50000,

    ["the justice seeker"] = 40000,

    ["the plasmother's remains"] = 50000,

    ["thick fur"] = 150,

    ["thorn"] = 100,

    ["throwing knife"] = 2,

    ["tiger eye"] = 350,

    ["time ring"] = 100,

    ["titan axe"] = 4000,

    ["token of love"] = 440000,

    ["tooth file"] = 60,

    ["tooth of tazhadur"] = 10000,

    ["torn shirt"] = 250,

    ["tortoise shield"] = 150,

    ["tower shield"] = 8000,

    ["trapped bad dream monster"] = 900,

    ["trashed draken boots"] = 40000,

    ["tribal mask"] = 250,

    ["troll green"] = 25,

    ["trollroot"] = 50,

    ["trophy of jaul"] = 4000,

    ["trophy of obujos"] = 3000,

    ["trophy of tanjis"] = 2000,

    ["tunnel tyrant head"] = 500,

    ["tunnel tyrant shell"] = 700,

    ["turtle shell"] = 90,

    ["tusk"] = 100,

    ["tusk shield"] = 850,

    ["twiceslicer"] = 28000,

    ["twin hooks"] = 500,

    ["two handed sword"] = 450,

    ["undead heart"] = 200,

    ["underworld rod"] = 4400,

    ["unholy bone"] = 480,

    ["unholy book"] = 30000,

    ["unicorn figurine"] = 50000,

    ["urmahlullu's mane"] = 490000,

    ["urmahlullu's paw"] = 245000,

    ["urmahlullu's tail"] = 210000,

    ["utua's poison"] = 230,

    ["vampire dust"] = 100,

    ["vampire shield"] = 15000,

    ["vampire teeth"] = 275,

    ["vampire's cape chain"] = 150,

    ["veal"] = 40,

    ["vein of ore"] = 330,

    ["velvet tapestry"] = 800,

    ["venison"] = 55,

    ["vexclaw talon"] = 1100,

    ["vial"] = 5,

    ["vial of hatred"] = 737000,

    ["vibrant heart"] = 2100,

    ["vibrant robe"] = 1200,

    ["viking helmet"] = 66,

    ["viking shield"] = 85,

    ["vile axe"] = 30000,

    ["violet crystal shard"] = 1500,

    ["violet gem"] = 10000,

    ["violet glass plate"] = 2150,

    ["volatile proto matter"] = 300,

    ["voodoo doll"] = 400,

    ["wailing widow's necklace"] = 3000,

    ["walnut"] = 80,

    ["wand of cosmic energy"] = 2000,

    ["wand of decay"] = 1000,

    ["wand of defiance"] = 6500,

    ["wand of draconia"] = 1500,

    ["wand of dragonbreath"] = 200,

    ["wand of everblazing"] = 6000,

    ["wand of inferno"] = 3000,

    ["wand of starstorm"] = 3600,

    ["wand of voodoo"] = 4400,

    ["wand of vortex"] = 100,

    ["war axe"] = 12000,

    ["war crystal"] = 460,

    ["war hammer"] = 470,

    ["war horn"] = 8000,

    ["warmaster's wristguards"] = 200,

    ["warrior helmet"] = 5000,

    ["warrior's axe"] = 11000,

    ["warrior's shield"] = 9000,

    ["warwolf fur"] = 30,

    ["waspoid claw"] = 320,

    ["waspoid wing"] = 190,

    ["watch"] = 6,

    ["watermelon tourmaline"] = 30000,

    ["weaver's wandtip"] = 250,

    ["wedding ring"] = 100,

    ["werebadger claws"] = 160,

    ["werebadger skull"] = 185,

    ["werebadger trophy"] = 9000,

    ["werebear fur"] = 185,

    ["werebear skull"] = 195,

    ["werebear trophy"] = 11000,

    ["wereboar hooves"] = 175,

    ["wereboar loincloth"] = 1500,

    ["wereboar trophy"] = 10000,

    ["wereboar tusks"] = 165,

    ["werefox tail"] = 200,

    ["werefox trophy"] = 9000,

    ["werehyaena nose"] = 220,

    ["werehyaena talisman"] = 350,

    ["werehyaena trophy"] = 12000,

    ["werewolf amulet"] = 3000,

    ["werewolf fangs"] = 180,

    ["werewolf fur"] = 380,

    ["white deer antlers"] = 400,

    ["white deer skin"] = 245,

    ["white gem"] = 12000,

    ["white pearl"] = 160,

    ["white piece of cloth"] = 100,

    ["white silk flower"] = 9000,

    ["widow's mandibles"] = 110,

    ["wild flowers"] = 120,

    ["wimp tooth chain"] = 120,

    ["windborn colossus armor"] = 50000,

    ["winged tail"] = 800,

    ["winter wolf fur"] = 20,

    ["witch broom"] = 60,

    ["witch hat"] = 5000,

    ["withered pauldrons"] = 850,

    ["withered scalp"] = 900,

    ["wolf paw"] = 70,

    ["wolf tooth chain"] = 100,

    ["wolf trophy"] = 3000,

    ["wood"] = 5,

    ["wood mushroom"] = 15,

    ["wooden hammer"] = 15,

    ["wooden shield"] = 5,

    ["wool"] = 15,

    ["writhing brain"] = 370000,

    ["writhing heart"] = 185000,

    ["wyrm scale"] = 400,

    ["wyvern fang"] = 1500,

    ["wyvern talisman"] = 265,

    ["yellow gem"] = 1000,

    ["yellow piece of cloth"] = 150,

    ["yielocks"] = 600,

    ["yielowax"] = 600,

    ["yirkas' egg"] = 280,

    ["young lich worm"] = 25000,

    ["zaoan armor"] = 14000,

    ["zaoan halberd"] = 500,

    ["zaoan helmet"] = 45000,

    ["zaoan legs"] = 14000,

    ["zaoan robe"] = 12000,

    ["zaoan shoes"] = 5000,

    ["zaoan sword"] = 30000,

    ["zaogun flag"] = 600,

    ["zaogun shoulderplates"] = 150,

    -- 12.70

    ["carnisylvan bark"] = 230,

    ["carnisylvan finger"] = 250,

    ["human teeth"] = 2000,

    ["abomination's eye"] = 650000,

    ["abomination's tail"] = 700000,

    ["abomination's tongue"] = 950000,

    ["afflicted strider head"] = 900,

    ["afflicted strider worms"] = 500,

    ["bashmu fang"] = 600,

    ["bashmu feather"] = 350,

    ["bashmu tongue"] = 400,

    ["blemished spawn abdomen"] = 550,

    ["blemished spawn head"] = 800,

    ["blemished spawn tail"] = 1000,

    ["brainstealer's brain"] = 300000,

    ["brainstealer's brainwave"] = 440000,

    ["brainstealer's tissue"] = 240000,

    ["cave chimera head"] = 1200,

    ["cave chimera leg"] = 650,

    ["curl of hair"] = 320000,

    ["eyeless devourer legs"] = 650,

    ["eyeless devourer maw"] = 420,

    ["eyeless devourer tongue"] = 900,

    ["girtablilu warrior carapace"] = 520,

    ["lavafungus head"] = 900,

    ["lavafungus ring"] = 390,

    ["lavaworm jaws"] = 1100,

    ["lavaworm spike roots"] = 600,

    ["lavaworm spikes"] = 750,

    ["old girtablilu carapace"] = 570,

    ["old royal diary"] = 220000,

    ["scorpion charm"] = 620,

    ["tremendous tyrant head"] = 930,

    ["tremendous tyrant shell"] = 740,

    ["varnished diremaw brainpan"] = 750,

    ["varnished diremaw legs"] = 670,

    ["streaked devourer eyes"] = 500,

    ["streaked devourer legs"] = 600,

    ["streaked devourer maw"] = 400,

    ["eldritch crystal"] = 48000,

    -- supplies

    ["mana potion"] = 56,

    ["strong mana potion"] = 93,

    ["great mana potion"] = 144,

    ["ultimate mana potion"] = 438,

    ["health potion"] = 50,

    ["strong health potion"] = 115,

    ["great health potion"] = 225,

    ["ultimate health potion"] = 379,

    ["supreme health potion"] = 625,

    ["great spirit potion"] = 228,

    ["ultimate spirit potion"] = 438,

    -- runes

    ["cure poison rune"] = 65,

    ["poison field rune"] = 21,

    ["fire field rune"] = 28,

    ["intense healing rune"] = 95,

    ["destroy field rune"] = 15,

    ["energy field rune"] = 38,

    ["stalagmite rune"] = 12,

    ["heavy magic missile rune"] = 12,

    ["disintegrate rune"] = 26,

    ["ultimate healing rune"] = 175,

    ["poison bomb rune"] = 85,

    ["animate death rune"] = 375,

    ["chameleon rune"] = 210,

    ["fireball rune"] = 30,

    ["holy missile rune"] = 16,

    ["icicle rune"] = 30,

    ["stone shower rune"] = 37,

    ["thunderstorm rune"] = 47,

    ["avalanche rune"] = 57,

    ["great fireball rune"] = 57,

    ["convince creature rune"] = 80,

    ["fire bomb rune"] = 147,

    ["poison wall rune"] = 52,

    ["explosion rune"] = 31,

    ["fire wall rune"] = 61,

    ["soulfire rune"] = 46,

    ["wild growth rune"] = 160,

    ["magic wall rune"] = 116,

    ["energy wall rune"] = 85,

    ["energy bomb rune"] = 203,

    ["sudden death rune"] = 135,

    ["paralyse rune"] = 700,

    ["envenomed arrow"] = 12,

    ["flaming arrow"] = 5,

    ["flash arrow"] = 5,

    ["onyx arrow"] = 7,

    ["poison arrow"] = 1,

    ["shiver arrow"] = 5,

    ["simple arrow"] = 2,

    ["sniper arrow"] = 5,

    ["tarsal arrow"] = 6,

    ["arrow"] = 3,

    ["burst arrow"] = 0,

    ["crystalline arrow"] = 20,

    ["diamond arrow"] = 100,

    ["earth arrow"] = 5,

    ["infernal bolt"] = 12,

    ["piercing bolt"] = 5,

    ["power bolt"] = 7,

    ["prismatic bolt"] = 20,

    ["spectral bolt"] = 70,

    ["vortex bolt"] = 6,

    ["bolt"] = 4,

    ["drill bolt"] = 12,

}

WasteItems = {

    -- supplies

    ["mana potion"] = 268,

    ["strong mana potion"] = 237,

    ["great mana potion"] = 238,

    ["ultimate mana potion"] = 23373,

    ["health potion"] = 266,

    ["strong health potion"] = 236,

    ["great health potion"] = 239,

    ["ultimate health potion"] = 7643,

    ["supreme health potion"] = 23375,

    ["great spirit potion"] = 7642,

    ["ultimate spirit potion"] = 23374,

    -- ammo

    ["envenomed arrow"] = 16143,

    ["flaming arrow"] = 763,

    ["flash arrow"] = 761,

    ["onyx arrow"] = 7365,

    ["poison arrow"] = 3448,

    ["shiver arrow"] = 762,

    ["simple arrow"] = 21470,

    ["sniper arrow"] = 7364,

    ["tarsal arrow"] = 14251,

    ["arrow"] = 3447,

    ["burst arrow"] = 3449,

    ["crystalline arrow"] = 15793,

    ["diamond arrow"] = 35901,

    ["earth arrow"] = 774,

    ["infernal bolt"] = 6528,

    ["piercing bolt"] = 7363,

    ["power bolt"] = 3450,

    ["prismatic bolt"] = 16141,

    ["spectral bolt"] = 35902,

    ["vortex bolt"] = 14252,

    ["bolt"] = 3446,

    ["drill bolt"] = 16142,

    -- runes

    ["cure poison rune"] = 3153,

    ["poison field rune"] = 3172,

    ["fire field rune"] = 3188,

    ["intense healing rune"] = 3152,

    ["destroy field rune"] = 3148,

    ["energy field rune"] = 3164,

    ["stalagmite rune"] = 3179,

    ["heavy magic missile rune"] = 3198,

    ["disintegrate rune"] = 3197,

    ["ultimate healing rune"] = 3160,

    ["poison bomb rune"] = 3173,

    ["animate death rune"] = 3203,

    ["chameleon rune"] = 3178,

    ["fireball rune"] = 3189,

    ["holy missile rune"] = 3182,

    ["icicle rune"] = 3158,

    ["stone shower rune"] = 3175,

    ["thunderstorm rune"] = 3202,

    ["avalanche rune"] = 3161,

    ["great fireball rune"] = 3191,

    ["convince creature rune"] = 3177,

    ["fire bomb rune"] = 3192,

    ["poison wall rune"] = 3176,

    ["explosion rune"] = 3200,

    ["fire wall rune"] = 3190,

    ["soulfire rune"] = 3195,

    ["wild growth rune"] = 3156,

    ["magic wall rune"] = 3180,

    ["energy wall rune"] = 3166,

    ["energy bomb rune"] = 3149,

    ["sudden death rune"] = 3155,

    ["paralyse rune"] = 3165

}

```

---
# main.lua
```lua

local version = "4.7"

local currentVersion

local available = false

storage.checkVersion = storage.checkVersion or 0

-- check max once per 12hours

if os.time() > storage.checkVersion + (12 * 60 * 60) then

    storage.checkVersion = os.time()

    HTTP.get("https://raw.githubusercontent.com/Vithrax/vBot/main/vBot/version.txt", function(data, err)

        if err then

          warn("[vBot updater]: Unable to check version:\n" .. err)

          return

        end

        currentVersion = data

        available = true

    end)

end

UI.Label("vBot v".. version .." \n Vithrax#5814")

UI.Button("Official OTCv8 Discord!", function() g_platform.openUrl("https://discord.gg/yhqBE4A") end)

UI.Separator()

schedule(5000, function()

    if not available then return end

    if currentVersion ~= version then

        UI.Separator()

        UI.Label("New vBot is available for download! v"..currentVersion)

        UI.Button("Go to vBot GitHub Page", function() g_platform.openUrl("https://github.com/Vithrax/vBot") end)

        UI.Separator()

    end

end)

```

---
# new_cavebot_lib.lua
```lua

CaveBot = {} -- global namespace

-------------------------------------------------------------------

-- CaveBot lib 1.0

-- Contains a universal set of functions to be used in CaveBot

----------------------[[ basic assumption ]]-----------------------

-- in general, functions cannot be slowed from within, only externally, by event calls, delays etc.

-- considering that and the fact that there is no while loop, every function return action

-- thus, functions will need to be verified outside themselfs or by another function

-- overall tips to creating extension:

--   - functions return action(nil) or true(done)

--   - extensions are controlled by retries var

-------------------------------------------------------------------

-- local variables, constants and functions, used by global functions

local LOCKERS_LIST = {3497, 3498, 3499, 3500}

local LOCKER_ACCESSTILE_MODIFIERS = {

    [3497] = {0,-1},

    [3498] = {1,0},

    [3499] = {0,1},

    [3500] = {-1,0}

}

local function CaveBotConfigParse()

	local name = storage["_configs"]["targetbot_configs"]["selected"]

    if not name then

        return warn("[vBot] Please create a new TargetBot config and reset bot")

    end

	local file = configDir .. "/targetbot_configs/" .. name .. ".json"

	local data = g_resources.readFileContents(file)

	return Config.parse(data)['looting']

end

local function getNearTiles(pos)

    if type(pos) ~= "table" then

        pos = pos:getPosition()

    end

    local tiles = {}

    local dirs = {

        {-1, 1},

        {0, 1},

        {1, 1},

        {-1, 0},

        {1, 0},

        {-1, -1},

        {0, -1},

        {1, -1}

}

    for i = 1, #dirs do

        local tile =

            g_map.getTile(

{

                x = pos.x - dirs[i][1],

                y = pos.y - dirs[i][2],

                z = pos.z

}

)

        if tile then

            table.insert(tiles, tile)

        end

    end

    return tiles

end

-- ##################### --

-- [[ Information class ]] --

-- ##################### --

--- global variable to reflect current CaveBot status

CaveBot.Status = "waiting"

--- Parses config and extracts loot list.

-- @return table

function CaveBot.GetLootItems()

    local t = CaveBotConfigParse() and CaveBotConfigParse()["items"] or nil

    local returnTable = {}

    if type(t) == "table" then

        for i, item in pairs(t) do

            table.insert(returnTable, item["id"])

        end

    end

    return returnTable

end

--- Checks whether player has any visible items to be stashed

-- @return boolean

function CaveBot.HasLootItems()

    for _, container in pairs(getContainers()) do

        local name = container:getName():lower()

        if not name:find("depot") and not name:find("your inbox") then

            for _, item in pairs(container:getItems()) do

                local id = item:getId()

                if table.find(CaveBot.GetLootItems(), id) then

                    return true

                end

            end

        end

    end

end

--- Parses config and extracts loot containers.

-- @return table

function CaveBot.GetLootContainers()

    local t = CaveBotConfigParse() and CaveBotConfigParse()["containers"] or nil

    local returnTable = {}

    if type(t) == "table" then

        for i, container in pairs(t) do

            table.insert(returnTable, container["id"])

        end

    end

    return returnTable

end

--- Information about open containers.

-- @param amount is boolean

-- @return table or integer

function CaveBot.GetOpenedLootContainers(containerTable)

    local containers = CaveBot.GetLootContainers()

    local t = {}

    for i, container in pairs(getContainers()) do

        local containerId = container:getContainerItem():getId()

        if table.find(containers, containerId) then

            table.insert(t, container)

        end

    end

    return containerTable and t or #t

end

--- Some actions needs to be additionally slowed down in case of high ping.

-- Maximum at 2000ms in case of lag spike.

-- @param multiplayer is integer

-- @return void

function CaveBot.PingDelay(multiplayer)

    multiplayer = multiplayer or 1

    if ping() and ping() > 150 then -- in most cases ping above 150 affects CaveBot

        local value = math.min(ping() * multiplayer, 2000)

        return delay(value)

    end

end

-- ##################### --

-- [[ Container class ]] --

-- ##################### --

--- Closes any loot container that is open.

-- @return void or boolean

function CaveBot.CloseLootContainer()

    local containers = CaveBot.GetLootContainers()

    for i, container in pairs(getContainers()) do

        local containerId = container:getContainerItem():getId()

        if table.find(containers, containerId) then

            return g_game.close(container)

        end

    end

    return true

end

function CaveBot.CloseAllLootContainers()

    local containers = CaveBot.GetLootContainers()

    for i, container in pairs(getContainers()) do

        local containerId = container:getContainerItem():getId()

        if table.find(containers, containerId) then

            g_game.close(container)

        end

    end

    return true

end

--- Opens any loot container that isn't already opened.

-- @return void or boolean

function CaveBot.OpenLootContainer()

    local containers = CaveBot.GetLootContainers()

    local t = {}

    for i, container in pairs(getContainers()) do

        local containerId = container:getContainerItem():getId()

        table.insert(t, containerId)

    end

    for _, container in pairs(getContainers()) do

        for _, item in pairs(container:getItems()) do

            local id = item:getId()

            if table.find(containers, id) and not table.find(t, id) then

                return g_game.open(item)

            end

        end

    end

    return true

end

-- ##################### --

-- [[[ Position class ]] --

-- ##################### --

--- Compares distance between player position and given pos.

-- @param position is table

-- @param distance is integer

-- @return boolean

function CaveBot.MatchPosition(position, distance)

    local pPos = player:getPosition()

    distance = distance or 1

    return getDistanceBetween(pPos, position) <= distance

end

--- Stripped down to take less space.

-- Use only to safe position, like pz movement or reaching npc.

-- Needs to be called between 200-500ms to achieve fluid movement.

-- @param position is table

-- @param distance is integer

-- @return void

function CaveBot.GoTo(position, precision)

    if not precision then

        precision = 3

    end

    return CaveBot.walkTo(position, 20, {ignoreCreatures = true, precision = precision})

end

--- Finds position of npc by name and reaches its position.

-- @return void(acion) or boolean

function CaveBot.ReachNPC(name)

    name = name:lower()

    local npc = nil

    for i, spec in pairs(getSpectators()) do

        if spec:isNpc() and spec:getName():lower() == name then

            npc = spec

        end

    end

    if not CaveBot.MatchPosition(npc:getPosition(), 3) then

        CaveBot.GoTo(npc:getPosition())

    else

        return true

    end

end

-- ##################### --

-- [[[[ Depot class ]]]] --

-- ##################### --

--- Reaches closest locker.

-- @return void(acion) or boolean

local depositerLockerTarget = nil

local depositerLockerReachRetries = 0

function CaveBot.ReachDepot()

    local pPos = player:getPosition()

    local tiles = getNearTiles(player:getPosition())

    for i, tile in pairs(tiles) do

        for i, item in pairs(tile:getItems()) do

            if table.find(LOCKERS_LIST, item:getId()) then

                depositerLockerTarget = nil

                depositerLockerReachRetries = 0

                return true -- if near locker already then return function

            end

        end

    end

    if depositerLockerReachRetries > 20 then

        depositerLockerTarget = nil

        depositerLockerReachRetries = 0

    end

    local candidates = {}

    if not depositerLockerTarget or distanceFromPlayer(depositerLockerTarget, pPos) > 12 then

        for i, tile in pairs(g_map.getTiles(posz())) do

            local tPos = tile:getPosition()

            for i, item in pairs(tile:getItems()) do

                if table.find(LOCKERS_LIST, item:getId()) then

                    local lockerTilePos = tile:getPosition()

                          lockerTilePos.x = lockerTilePos.x + LOCKER_ACCESSTILE_MODIFIERS[item:getId()][1]

                          lockerTilePos.y = lockerTilePos.y + LOCKER_ACCESSTILE_MODIFIERS[item:getId()][2]

                    local lockerTile = g_map.getTile(lockerTilePos)

                    if not lockerTile:hasCreature() then

                        if findPath(pos(), tPos, 20, {ignoreNonPathable = false, precision = 1, ignoreCreatures = true}) then

                            local distance = getDistanceBetween(tPos, pPos)

                            table.insert(candidates, {pos=tPos, dist=distance})

                        end

                    end

                end

            end

        end

        if #candidates > 1 then

            table.sort(candidates, function(a,b) return a.dist < b.dist end)

        end

    end

    depositerLockerTarget = depositerLockerTarget or candidates[1].pos

    if depositerLockerTarget then

        if not CaveBot.MatchPosition(depositerLockerTarget) then

            depositerLockerReachRetries = depositerLockerReachRetries + 1

            return CaveBot.GoTo(depositerLockerTarget, 1)

        else

            depositerLockerReachRetries = 0

            depositerLockerTarget = nil

            return true

        end

    end

end

--- Opens locker item.

-- @return void(acion) or boolean

function CaveBot.OpenLocker()

    local pPos = player:getPosition()

    local tiles = getNearTiles(player:getPosition())

    local locker = getContainerByName("Locker")

    if not locker then

        for i, tile in pairs(tiles) do

            for i, item in pairs(tile:getItems()) do

                if table.find(LOCKERS_LIST, item:getId()) then

                    local topThing = tile:getTopUseThing()

                    if not topThing:isNotMoveable() then

                        g_game.move(topThing, pPos, topThing:getCount())

                    else

                        return g_game.open(item)

                    end

                end

            end

        end

    else

        return true

    end

end

--- Opens depot chest.

-- @return void(acion) or boolean

function CaveBot.OpenDepotChest()

    local depot = getContainerByName("Depot chest")

    if not depot then

        local locker = getContainerByName("Locker")

        if not locker then

            return CaveBot.OpenLocker()

        end

        for i, item in pairs(locker:getItems()) do

            if item:getId() == 3502 then

                return g_game.open(item, locker)

            end

        end

    else

        return true

    end

end

--- Opens inbox inside locker.

-- @return void(acion) or boolean

function CaveBot.OpenInbox()

    local inbox = getContainerByName("Your inbox")

    if not inbox then

        local locker = getContainerByName("Locker")

        if not locker then

            return CaveBot.OpenLocker()

        end

        for i, item in pairs(locker:getItems()) do

            if item:getId() == 12902 then

                return g_game.open(item)

            end

        end

    else

        return true

    end

end

--- Opens depot box of given number.

-- @param index is integer

-- @return void or boolean

function CaveBot.OpenDepotBox(index)

    local depot = getContainerByName("Depot chest")

    if not depot then

        return CaveBot.ReachAndOpenDepot()

    end

    local foundParent = false

    for i, container in pairs(getContainers()) do

        if container:getName():lower():find("depot box") then

            foundParent = container

            break

        end

    end

    if foundParent then return true end

    for i, container in pairs(depot:getItems()) do

        if i == index then

            return g_game.open(container)

        end

    end

end

--- Reaches and opens depot.

-- Combined for shorthand usage.

-- @return boolean whether succeed to reach and open depot

function CaveBot.ReachAndOpenDepot()

    if CaveBot.ReachDepot() and CaveBot.OpenDepotChest() then

        return true

    end

    return false

end

--- Reaches and opens imbox.

-- Combined for shorthand usage.

-- @return boolean whether succeed to reach and open depot

function CaveBot.ReachAndOpenInbox()

    if CaveBot.ReachDepot() and CaveBot.OpenInbox() then

        return true

    end

    return false

end

--- Stripped down function to stash item.

-- @param item is object

-- @param index is integer

-- @param destination is object

-- @return void

function CaveBot.StashItem(item, index, destination)

    destination = destination or getContainerByName("Depot chest")

    if not destination then return false end

    return g_game.move(item, destination:getSlotPosition(index), item:getCount())

end

--- Withdraws item from depot chest or mail inbox.

-- main function for depositer/withdrawer

-- @param id is integer

-- @param amount is integer

-- @param fromDepot is boolean or integer

-- @param destination is object

-- @return void

function CaveBot.WithdrawItem(id, amount, fromDepot, destination)

    if destination and type(destination) == "string" then

        destination = getContainerByName(destination)

    end

    local itemCount = itemAmount(id)

    local depot

    for i, container in pairs(getContainers()) do

        if container:getName():lower():find("depot box") or container:getName():lower():find("your inbox") then

            depot = container

            break

        end

    end

    if not depot then

        if fromDepot then

            if not CaveBot.OpenDepotBox(fromDepot) then return end

        else

            return CaveBot.ReachAndOpenInbox()

        end

        return

    end

    if not destination then

        for i, container in pairs(getContainers()) do

            if container:getCapacity() > #container:getItems() and not string.find(container:getName():lower(), "quiver") and not string.find(container:getName():lower(), "depot") and not string.find(container:getName():lower(), "loot") and not string.find(container:getName():lower(), "inbox") then

                destination = container

            end

        end

    end

    if itemCount >= amount then

        return true

    end

    local toMove = amount - itemCount

    for i, item in pairs(depot:getItems()) do

        if item:getId() == id then

            return g_game.move(item, destination:getSlotPosition(destination:getItemsCount()), math.min(toMove, item:getCount()))

        end

    end

end

-- ##################### --

-- [[[[[ Talk class ]]]] --

-- ##################### --

--- Controlled by event caller.

-- Simple way to build npc conversations instead of multiline overcopied code.

-- @return void

function CaveBot.Conversation(...)

    local expressions = {...}

    local delay = storage.extras.talkDelay or 1000

    local talkDelay = 0

    for i, expr in ipairs(expressions) do

        schedule(talkDelay, function() NPC.say(expr) end)

        talkDelay = talkDelay + delay

    end

end

--- Says hi trade to NPC.

-- Used as shorthand to open NPC trade window.

-- @return void

function CaveBot.OpenNpcTrade()

    return CaveBot.Conversation("hi", "trade")

end

--- Says hi destination yes to NPC.

-- Used as shorthand to travel.

-- @param destination is string

-- @return void

function CaveBot.Travel(destination)

    return CaveBot.Conversation("hi", destination, "yes")

end

```

---
# new_healer.lua
```lua

setDefaultTab("Main")

local panelName = "newHealer"

local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('Friend Healer')

  Button

    id: edit

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

]])

ui:setId(panelName)

-- validate current settings

if not storage[panelName] or not storage[panelName].priorities then

    storage[panelName] = nil

end

if not storage[panelName] then

    storage[panelName] = {

        enabled = false,

        customPlayers = {},

        vocations = {},

        groups = {},

        priorities = {

            {name="Custom Spell",           enabled=false, custom=true},

            {name="Exura Gran Sio",         enabled=true,              strong = true},

            {name="Exura Sio",              enabled=true,                            normal = true},

            {name="Exura Gran Mas Res",     enabled=true,                                          area = true},

            {name="Health Item",            enabled=true,                                                      health=true},

            {name="Mana Item",              enabled=true,                                                                  mana=true}

},

        settings = {

            {type="HealItem",       text="Mana Item ",                   value=268},

            {type="HealScroll",     text="Item Range: ",                 value=6},

            {type="HealItem",       text="Health Item ",                 value=3160},

            {type="HealScroll",     text="Mas Res Players: ",            value=2},

            {type="HealScroll",     text="Heal Friend at: ",             value=80},

            {type="HealScroll",     text="Use Gran Sio at: ",            value=80},

            {type="HealScroll",     text="Min Player HP%: ",             value=80},

            {type="HealScroll",     text="Min Player MP%: ",             value=50},

},

        conditions = {

            knights = true,

            paladins = true,

            druids = false,

            sorcerers = false,

            party = true,

            guild = false,

            botserver = false,

            friends = false

}

}

end

local config = storage[panelName]

local healerWindow = UI.createWindow('FriendHealer')

healerWindow:hide()

healerWindow:setId(panelName)

ui.title:setOn(config.enabled)

ui.title.onClick = function(widget)

    config.enabled = not config.enabled

    widget:setOn(config.enabled)

end

ui.edit.onClick = function()

    healerWindow:show()

    healerWindow:raise()

    healerWindow:focus()

end

local conditions = healerWindow.conditions

local targetSettings = healerWindow.targetSettings

local customList = healerWindow.customList

local priority = healerWindow.priority

-- customList

-- create entries on the list

for name, health in pairs(config.customPlayers) do

    local widget = UI.createWidget("HealerPlayerEntry", customList.playerList.list)

    widget.remove.onClick = function()

        config.customPlayers[name] = nil

        widget:destroy()

    end

    widget:setText("["..health.."%]  "..name)

end

customList.playerList.onDoubleClick = function()

    customList.playerList:hide()

end

local function clearFields()

    customList.addPanel.name:setText("friend name")

    customList.addPanel.health:setText("1")

    customList.playerList:show()

end

local function capitalFistLetter(str)

    return (string.gsub(str, "^%l", string.upper))

  end

customList.addPanel.add.onClick = function()

    local name = ""

    local words = string.split(customList.addPanel.name:getText(), " ")

    local health = tonumber(customList.addPanel.health:getText())

    for i, word in ipairs(words) do

      name = name .. " " .. capitalFistLetter(word)

    end

    if not health then

        clearFields()

        return warn("[Friend Healer] Please enter health percent value!")

    end

    if name:len() == 0 or name:lower() == "friend name" then

        clearFields()

        return warn("[Friend Healer] Please enter friend name to be added!")

    end

    if config.customPlayers[name] or config.customPlayers[name:lower()] then

        clearFields()

        return warn("[Friend Healer] Player already added to custom list.")

    else

        config.customPlayers[name] = health

        local widget = UI.createWidget("HealerPlayerEntry", customList.playerList.list)

        widget.remove.onClick = function()

            config.customPlayers[name] = nil

            widget:destroy()

        end

        widget:setText("["..health.."%]  "..name)

    end

    clearFields()

end

local function validate(widget, category)

    local list = widget:getParent()

    local label = list:getParent().title

    -- 1 - priorities | 2 - vocation

    category = category or 0

    if category == 2 and not storage.extras.checkPlayer then

        label:setColor("#d9321f")

        label:setTooltip("! WARNING ! \nTurn on check players in extras to use this feature!")

        return

    else

        label:setColor("#dfdfdf")

        label:setTooltip("")

    end

    local checked = false

    for i, child in ipairs(list:getChildren()) do

        if category == 1 and child.enabled:isChecked() or child:isChecked() then

            checked = true

        end

    end

    if not checked then

        label:setColor("#d9321f")

        label:setTooltip("! WARNING ! \nNo category selected!")

    else

        label:setColor("#dfdfdf")

        label:setTooltip("")

    end

end

-- targetSettings

targetSettings.vocations.box.knights:setChecked(config.conditions.knights)

targetSettings.vocations.box.knights.onClick = function(widget)

    config.conditions.knights = not config.conditions.knights

    widget:setChecked(config.conditions.knights)

    validate(widget, 2)

end

targetSettings.vocations.box.paladins:setChecked(config.conditions.paladins)

targetSettings.vocations.box.paladins.onClick = function(widget)

    config.conditions.paladins = not config.conditions.paladins

    widget:setChecked(config.conditions.paladins)

    validate(widget, 2)

end

targetSettings.vocations.box.druids:setChecked(config.conditions.druids)

targetSettings.vocations.box.druids.onClick = function(widget)

    config.conditions.druids = not config.conditions.druids

    widget:setChecked(config.conditions.druids)

    validate(widget, 2)

end

targetSettings.vocations.box.sorcerers:setChecked(config.conditions.sorcerers)

targetSettings.vocations.box.sorcerers.onClick = function(widget)

    config.conditions.sorcerers = not config.conditions.sorcerers

    widget:setChecked(config.conditions.sorcerers)

    validate(widget, 2)

end

targetSettings.groups.box.friends:setChecked(config.conditions.friends)

targetSettings.groups.box.friends.onClick = function(widget)

    config.conditions.friends = not config.conditions.friends

    widget:setChecked(config.conditions.friends)

    validate(widget)

end

targetSettings.groups.box.party:setChecked(config.conditions.party)

targetSettings.groups.box.party.onClick = function(widget)

    config.conditions.party = not config.conditions.party

    widget:setChecked(config.conditions.party)

    validate(widget)

end

targetSettings.groups.box.guild:setChecked(config.conditions.guild)

targetSettings.groups.box.guild.onClick = function(widget)

    config.conditions.guild = not config.conditions.guild

    widget:setChecked(config.conditions.guild)

    validate(widget)

end

targetSettings.groups.box.botserver:setChecked(config.conditions.botserver)

targetSettings.groups.box.botserver.onClick = function(widget)

    config.conditions.botserver = not config.conditions.botserver

    widget:setChecked(config.conditions.botserver)

    validate(widget)

end

validate(targetSettings.vocations.box.knights)

validate(targetSettings.groups.box.friends)

validate(targetSettings.vocations.box.sorcerers, 2)

-- conditions

for i, setting in ipairs(config.settings) do

    local widget = UI.createWidget(setting.type, conditions.box)

    local text = setting.text

    local val = setting.value

    widget.text:setText(text)

    if setting.type == "HealScroll" then

        widget.text:setText(widget.text:getText()..val)

        if not (text:find("Range") or text:find("Mas Res")) then

            widget.text:setText(widget.text:getText().."%")

        end

        widget.scroll:setValue(val)

        widget.scroll.onValueChange = function(scroll, value)

            setting.value = value

            widget.text:setText(text..value)

            if not (text:find("Range") or text:find("Mas Res")) then

                widget.text:setText(widget.text:getText().."%")

            end

        end

        if text:find("Range") or text:find("Mas Res") then

            widget.scroll:setMaximum(10)

        end

    else

        widget.item:setItemId(val)

        widget.item:setShowCount(false)

        widget.item.onItemChange = function(widget)

            setting.value = widget:getItemId()

        end

    end

end

-- priority and toggles

local function setCrementalButtons()

    for i, child in ipairs(priority.list:getChildren()) do

        if i == 1 then

            child.increment:disable()

        elseif i == 6 then

            child.decrement:disable()

        else

            child.increment:enable()

            child.decrement:enable()

        end

    end

end

for i, action in ipairs(config.priorities) do

    local widget = UI.createWidget("PriorityEntry", priority.list)

    widget:setText(action.name)

    widget.increment.onClick = function()

        local index = priority.list:getChildIndex(widget)

        local table = config.priorities

        priority.list:moveChildToIndex(widget, index-1)

        table[index], table[index-1] = table[index-1], table[index]

        setCrementalButtons()

    end

    widget.decrement.onClick = function()

        local index = priority.list:getChildIndex(widget)

        local table = config.priorities

        priority.list:moveChildToIndex(widget, index+1)

        table[index], table[index+1] = table[index+1], table[index]

        setCrementalButtons()

    end

    widget.enabled:setChecked(action.enabled)

    widget:setColor(action.enabled and "#98BF64" or "#dfdfdf")

    widget.enabled.onClick = function()

        action.enabled = not action.enabled

        widget:setColor(action.enabled and "#98BF64" or "#dfdfdf")

        widget.enabled:setChecked(action.enabled)

        validate(widget, 1)

    end

    if action.custom then

        widget.onDoubleClick = function()

            local window = modules.client_textedit.show(widget, {title = "Custom Spell", description = "Enter below formula for a custom healing spell"})

            schedule(50, function()

              window:raise()

              window:focus()

            end)

        end

        widget.onTextChange = function(widget,text)

            action.name = text

        end

        widget:setTooltip("Double click to set spell formula.")

    end

    if i == #config.priorities then

        validate(widget, 1)

        setCrementalButtons()

    end

end

local lastItemUse = now

local function friendHealerAction(spec, targetsInRange)

    local name = spec:getName()

    local health = spec:getHealthPercent()

    local mana = spec:getManaPercent()

    local dist = distanceFromPlayer(spec:getPosition())

    targetsInRange = targetsInRange or 0

    local masResAmount = config.settings[4].value

    local itemRange = config.settings[2].value

    local healItem = config.settings[3].value

    local manaItem = config.settings[1].value

    local normalHeal = config.customPlayers[name] or config.settings[5].value

    local strongHeal = config.customPlayers[name] and normalHeal/2 or config.settings[6].value

    for i, action in ipairs(config.priorities) do

        if action.enabled then

            if action.area and masResAmount <= targetsInRange and canCast("exura gran mas res") then

                return say("exura gran mas res")

            end

            if action.mana and findItem(manaItem) and mana <= normalHeal and dist <= itemRange and now - lastItemUse > 1000 then

                lastItemUse = now

                return useWith(manaItem, spec)

            end

            if action.health and findItem(healItem) and health <= normalHeal and dist <= itemRange and now - lastItemUse > 1000 then

                lastItemUse = now

                return useWith(healItem, spec)

            end

            if action.strong and health <= strongHeal and not modules.game_cooldown.isCooldownIconActive(101) then

                return say('exura gran sio "'..name)

            end

            if (action.normal or action.custom) and health <= normalHeal and canCast('exura sio "'..name) then

                return say('exura sio "'..name)

            end

        end

    end

end

macro(100, function()

    if not config.enabled then return end

    if modules.game_cooldown.isGroupCooldownIconActive(2) then return end

    local minHp = config.settings[7].value

    local minMp = config.settings[8].value

    -- first index will be heal target

    local finalTable = {}

    local inMasResRange = 0

    -- check basic

    if hppercent() <= minHp or manapercent() <= minMp then return end

    -- get all spectators

    local spectators = getSpectators()

    -- clear table from irrelevant spectators

    for i, spec in ipairs(getSpectators()) do

        if spec:isLocalPlayer() or not spec:isPlayer() or not spec:canShoot() then

            if not config.customPlayers[name] then

                table.remove(spectators, table.find(spectators, spec))

            end

        else

            local specText = spec:getText()

            -- check players is enabled and spectator already verified

            if storage.extras.checkPlayer and specText:len() > 0 then

                if specText:find("EK") and not config.conditions.knights or

                   specText:find("RP") and not config.conditions.paladins or

                   specText:find("ED") and not config.conditions.druids or

                   specText:find("MS") and not config.conditions.sorcerers then

                    if not config.customPlayers[name] then

                        table.remove(spectators, table.find(spectators, spec))

                    end

                end

            end

            local okParty = config.conditions.party and spec:isPartyMember()

            local okFriend = config.conditions.friends and isFriend(spec)

            local okGuild = config.conditions.guild and spec:getEmblem() == 1

            local okBotServer = config.conditions.botserver and vBot.BotServerMembers[spec:getName()]

            if not (okParty or okFriend or okGuild or okBotServer) then

                if not config.customPlayers[name] then

                    table.remove(spectators, table.find(spectators, spec))

                end

            end

        end

    end

    -- no targets, return

    if #spectators == 0 then return end

    for name, health in pairs(config.customPlayers) do

        for i, spec in ipairs(spectators) do

            local specHp = spec:getHealthPercent()

            if spec:getName() == name and specHp <= health then

                if distanceFromPlayer(spec:getPosition()) <= 2 then

                    inMasResRange = inMasResRange + 1

                end

                table.insert(finalTable, spec)

                table.remove(spectators, i)

            end

        end

    end

    for i=1,#spectators do

        local spec = spectators[i]

        if distanceFromPlayer(spec:getPosition()) <= 3 then

            inMasResRange = inMasResRange + 1

        end

        table.insert(finalTable, spec)

    end

    -- no targets, return

    if #finalTable == 0 then return end

    friendHealerAction(finalTable[1], inMasResRange)

end)

```

---
# new_healer.otui
```otui

CategoryCheckBox < CheckBox

  font: verdana-11px-rounded

  margin-top: 3

  $checked:

    color: #98BF64

HealScroll < Panel

  ToolTipLabel

    id: text

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    text-align: center

    text: test

  HorizontalScrollBar

    id: scroll

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 3

    minimum: 0

    maximum: 100

    step: 1

HealItem < Panel

  BotItem

    id: item

    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter

    size: 34 34

  ToolTipLabel

    id: text

    anchors.fill: parent

    anchors.left: prev.right

    margin-left: 8

    text-wrap: true

    text-align: left

ToolTipLabel < UIWidget

  font: verdana-11px-rounded

  color: #dfdfdf

  height: 14

  text-align: center

HealerPlayerEntry < Label

  background-color: alpha

  text-offset: 5 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  text-align: left

  $focus:

    background-color: #00000055

  Button

    id: remove

    anchors.right: parent.right

    margin-right: 2

    anchors.verticalCenter: parent.verticalCenter

    size: 15 15

    margin-right: 15

    text: X

    tooltip: Remove player from the list

PriorityEntry < ToolTipLabel

  background-color: alpha

  text-offset: 18 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  text-align: left

  $focus:

    background-color: #00000055

  CheckBox

    id: enabled

    anchors.left: parent.left

    anchors.verticalCenter: parent.verticalCenter

    size: 15 15

    margin-top: 2

    margin-left: 3

  Button

    id: increment

    anchors.right: parent.right

    margin-right: 2

    anchors.verticalCenter: parent.verticalCenter

    size: 14 14

    text: +

    tooltip: Increase Priority

  Button

    id: decrement

    anchors.right: prev.left

    margin-right: 2

    anchors.verticalCenter: parent.verticalCenter

    size: 14 14

    text: -

    tooltip: Decrease Priority

TargetSettings < Panel

  size: 280 125

  padding: 3

  image-source: /images/ui/window

  image-border: 6

  Label

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: parent.top

    font: verdana-11px-rounded

    text: Heal Target Settings

  Groups

    id: groups

    anchors.top: prev.bottom

    margin-top: 8

    anchors.left: parent.left

    margin-left: 9

  Vocations

    id: vocations

    anchors.left: prev.right

    margin-left: 5

    anchors.verticalCenter: prev.verticalCenter

Groups < FlatPanel

  size: 150 90

  padding: 3

  padding-top: 5

  ToolTipLabel

    id: title

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: parent.top

    text: Groups

    tooltip: Players added in custom list will always be in scope

  HorizontalSeparator

    anchors.top: prev.bottom

    margin-top: 2

    anchors.left: parent.left

    anchors.right: parent.right

  Panel

    id: box

    anchors.top: prev.bottom

    margin-top: 2

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    padding: 2

    layout:

      type: verticalBox

    CategoryCheckBox

      id: friends

      text: Friends

    CategoryCheckBox

      id: party

      text: Party Members

    CategoryCheckBox

      id: guild

      text: Guild Members

    CategoryCheckBox

      id: botserver

      text: BotServer Members

Vocations < FlatPanel

  size: 100 90

  padding: 3

  padding-top: 5

  ToolTipLabel

    id: title

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: parent.top

    font: verdana-11px-rounded

    text: Vocations

  HorizontalSeparator

    anchors.top: prev.bottom

    margin-top: 2

    anchors.left: parent.left

    anchors.right: parent.right

  Panel

    id: box

    anchors.top: prev.bottom

    margin-top: 2

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    padding: 2

    layout:

      type: verticalBox

    CategoryCheckBox

      id: knights

      text: Knights

    CategoryCheckBox

      id: paladins

      text: Paladins

    CategoryCheckBox

      id: druids

      text: Druids

    CategoryCheckBox

      id: sorcerers

      text: Sorcerers

Priority < Panel

  size: 190 123

  padding: 6

  padding-top: 3

  image-source: /images/ui/window

  image-border: 6

  ToolTipLabel

    id: title

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: parent.top

    font: verdana-11px-rounded

    text: Priority & Toggles

  TextList

    id: list

    anchors.top: prev.bottom

    margin-top: 3

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    fit-children: true

    padding-top: 1

AddPlayer < FlatPanel

  padding: 5

  Label

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    font: verdana-11px-rounded

    text: Add Player to Custom List

    text-align: center

    text-wrap: true

  HorizontalSeparator

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 2

  SpinBox

    id: health

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 20

    width: 50

    minimum: 1

    maximum: 99

    step: 1

    focusable: true

    text-align: center

  Label

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    font: verdana-11px-rounded

    text: %HP - heal if below

  TextEdit

    id: name

    anchors.top: health.bottom

    margin-top: 5

    anchors.left: health.left

    anchors.right: parent.right

    font: verdana-11px-rounded

    text-align: center

    text: friend name

  Button

    id: add

    anchors.left: health.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 5

    font: verdana-11px-rounded

    text: Add Player

PlayerList < Panel

  TextList

    id: list

    anchors.fill: parent

    fit-children: true

    padding-top: 2

    vertical-scrollbar: listScrollBar

  VerticalScrollBar

    id: listScrollBar

    anchors.top: list.top

    anchors.bottom: list.bottom

    anchors.right: list.right

    step: 14

    pixels-scroll: true

CustomList < Panel

  size: 190 172

  padding: 6

  padding-top: 3

  image-source: /images/ui/window

  image-border: 6

  ToolTipLabel

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: parent.top

    font: verdana-11px-rounded

    text: Custom Player List

    tooltip: Double click on the list below to add new player.

  AddPlayer

    id: addPanel

    anchors.top: prev.bottom

    margin-top: 3

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

  PlayerList

    id: playerList

    anchors.fill: prev

Conditions < Panel

  size: 280 170

  padding: 3

  image-source: /images/ui/window

  image-border: 6

  Label

    anchors.horizontalCenter: parent.horizontalCenter

    anchors.top: parent.top

    font: verdana-11px-rounded

    text: Player Conditions

  Panel

    id: box

    anchors.fill: parent

    margin-top: 16

    padding: 5

    padding-top: 3

    layout:

      type: grid

      cell-size: 128 31

      cell-spacing: 5

      num-columns: 2

FriendHealer < MainWindow

  !text: tr('Friend Healer')

  size: 512 390

  padding-top: 30

  @onEscape: self:hide()

  Conditions

    id: conditions

    anchors.top: parent.top

    anchors.right: parent.right

  TargetSettings

    id: targetSettings

    anchors.top: prev.bottom

    margin-top: 10

    anchors.left: prev.left

  Priority

    id: priority

    anchors.top: parent.top

    anchors.left: parent.left

  CustomList

    id: customList

    anchors.top: priority.bottom

    margin-top: 10

    anchors.left: priority.left

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    @onClick: self:getParent():hide()

```

---
# npc_talk.lua
```lua

onAttackingCreatureChange(function(creature, OldCreature)

    if creature and creature:isNpc() and distanceFromPlayer(creature:getPosition()) <= 3 then

        CaveBot.Conversation("hi", "trade")

    end

end)

```

---
# playerlist.lua
```lua

--[[

  configuration for check players

  example made on server Gunzodus

  example link for player overview:

  https://www.gunzodus.net/character/show/Sir_Vithrax

  *note that space in character name was replaced with underscore (_) - this character will be important

  in this case:

  link = "https://www.gunzodus.net/character/show/" -- everything with all the characters up to the start of the name

  spacing = "_" -- space replacement in character name

]]

local link = "https://www.gunzodus.net/character/show/"

local spacing = "_"

-- do not edit below

setDefaultTab("Main")

local tabs = {"Friends", "Enemies", "BlackList"}

local panelName = "playerList"

local colors = {"#03C04A", "#fc4c4e", "orange"}

if not storage[panelName] then

    storage[panelName] = {

      enemyList = {},

      friendList = {},

      blackList = {},

      groupMembers = true,

      outfits = false,

      marks = false,

      highlight = false

}

end

local config = storage[panelName]

local playerTables = {config.friendList, config.enemyList, config.blackList}

-- functions

local function clearCachedPlayers()

  CachedFriends = {}

  CachedEnemies = {}

end

local refreshStatus = function()

    for _, spec in ipairs(getSpectators()) do

      if spec:isPlayer() and not spec:isLocalPlayer() then

        if config.outfits then

          local specOutfit = spec:getOutfit()

          if isFriend(spec:getName()) then

            if config.highlight then

              spec:setMarked('#0000FF')

            end

            specOutfit.head = 88

            specOutfit.body = 88

            specOutfit.legs = 88

            specOutfit.feet = 88

            if storage.BOTserver.outfit then

              local voc = vBot.BotServerMembers[spec:getName()]

              specOutfit.addons = 3

              if voc == 1 then

                specOutfit.type = 131

              elseif voc == 2 then

                specOutfit.type = 129

              elseif voc == 3 then

                specOutfit.type = 130

              elseif voc == 4 then

                specOutfit.type = 144

              end

            end

            spec:setOutfit(specOutfit)

          elseif isEnemy(spec:getName()) then

            if config.highlight then

              spec:setMarked('#FF0000')

            end

            specOutfit.head = 94

            specOutfit.body = 94

            specOutfit.legs = 94

            specOutfit.feet = 94

            spec:setOutfit(specOutfit)

          end

        end

      end

    end

end

refreshStatus()

local checkStatus = function(creature)

    if not creature:isPlayer() or creature:isLocalPlayer() then return end

    local specName = creature:getName()

    local specOutfit = creature:getOutfit()

    if isFriend(specName) then

      if config.highlight then

        creature:setMarked('#0000FF')

      end

      if config.outfits then

        specOutfit.head = 88

        specOutfit.body = 88

        specOutfit.legs = 88

        specOutfit.feet = 88

        if storage.BOTserver.outfit then

          local voc = vBot.BotServerMembers[creature:getName()]

          specOutfit.addons = 3

          if voc == 1 then

            specOutfit.type = 131

          elseif voc == 2 then

            specOutfit.type = 129

          elseif voc == 3 then

            specOutfit.type = 130

          elseif voc == 4 then

            specOutfit.type = 144

          end

        end

        creature:setOutfit(specOutfit)

      end

    elseif isEnemy(specName) then

      if config.highlight then

        creature:setMarked('#FF0000')

      end

      if config.outfits then

        specOutfit.head = 94

        specOutfit.body = 94

        specOutfit.legs = 94

        specOutfit.feet = 94

        creature:setOutfit(specOutfit)

      end

    end

end

rootWidget = g_ui.getRootWidget()

if rootWidget then

    local ListWindow = UI.createWindow('PlayerListWindow', rootWidget)

    ListWindow:hide()

    UI.Button("Player Lists", function()

        ListWindow:show()

        ListWindow:raise()

        ListWindow:focus()

    end)

    -- settings

    ListWindow.settings.Members:setChecked(config.groupMembers)

    ListWindow.settings.Members.onClick = function(widget)

      config.groupMembers = not config.groupMembers

      if not config.groupMembers then

        clearCachedPlayers()

      end

      refreshStatus()

      widget:setChecked(config.groupMembers)

    end

    ListWindow.settings.Outfit:setChecked(config.outfits)

    ListWindow.settings.Outfit.onClick = function(widget)

      config.outfits = not config.outfits

      widget:setChecked(config.outfits)

      refreshStatus()

    end

    ListWindow.settings.NeutralsAreEnemy:setChecked(config.marks)

    ListWindow.settings.NeutralsAreEnemy.onClick = function(widget)

      config.marks = not config.marks

      widget:setChecked(config.marks)

    end

    ListWindow.settings.Highlight:setChecked(config.highlight)

    ListWindow.settings.Highlight.onClick = function(widget)

      config.highlight = not config.highlight

      widget:setChecked(config.highlight)

    end

    ListWindow.settings.AutoAdd:setChecked(config.autoAdd)

    ListWindow.settings.AutoAdd.onClick = function(widget)

      config.autoAdd = not config.autoAdd

      widget:setChecked(config.autoAdd)

    end

    local TabBar = ListWindow.tmpTabBar

    TabBar:setContentWidget(ListWindow.tmpTabContent)

    local blacklistList

    for v = 1, 3 do

        local listPanel = g_ui.createWidget("tPanel") -- Creates Panel

        local playerList = playerTables[v]

        listPanel:setId(tabs[v].."Tab")

        TabBar:addTab(tabs[v], listPanel)

        -- elements

        local addButton = listPanel.add

        local nameTab = listPanel.name

        local list = listPanel.list

        if v == 3 then

          blacklistList = list

        end

        for i, name in ipairs(playerList) do

            local label = UI.createWidget("PlayerLabel", list)

            label:setText(name)

            label.remove.onClick = function()

                table.remove(playerList, table.find(playerList, name))

                label:destroy()

                clearCachedPlayers()

                refreshStatus()

            end

            label.onMouseRelease = function(widget, mousePos, mouseButton)

              if mouseButton == 2 then

                local child = rootWidget:recursiveGetChildByPos(mousePos)

                if child == widget then

                  local menu = g_ui.createWidget('PopupMenu')

                  menu:setId("blzMenu")

                  menu:setGameMenu(true)

                  menu:addOption('Check Player', function()

                    local name = widget:getText():gsub(" ", spacing)

                    g_platform.openUrl(link..name)

                  end, "")

                  menu:addOption('Copy Name', function()

                    g_window.setClipboardText(widget:getText())

                  end, "")

                  menu:display(mousePos)

                  return true

                end

              end

            end

        end

        local tabButton = TabBar.buttonsPanel:getChildren()[v]

        tabButton.onStyleApply = function(widget)

            if TabBar:getCurrentTab() == widget then

                widget:setColor(colors[v])

            end

        end

        -- callbacks

        addButton.onClick = function()

            local names = string.split(nameTab:getText(), ",")

            if #names == 0 then

              warn("vBot[PlayerList]: Name is missing!")

              return

            end

            for i=1,#names do

              local name = names[i]:trim()

              if name:len() == 0 then

                  warn("vBot[PlayerList]: Name is missing!")

              else

                  if not table.find(playerList, name) then

                      table.insert(playerList, name)

                      local label = UI.createWidget("PlayerLabel", list)

                      label:setText(name)

                      label.remove.onClick = function()

                          table.remove(playerList, table.find(playerList, name))

                          label:destroy()

                      end

                      label.onMouseRelease = function(widget, mousePos, mouseButton)

                        if mouseButton == 2 then

                          local child = rootWidget:recursiveGetChildByPos(mousePos)

                          if child == widget then

                            local menu = g_ui.createWidget('PopupMenu')

                            menu:setId("blzMenu")

                            menu:setGameMenu(true)

                            menu:addOption('Check Player', function()

                              local name = widget:getText():gsub(" ", "_")

                              local link = "https://www.gunzodus.net/character/show/"

                              g_platform.openUrl(link..name)

                            end, "")

                            menu:addOption('Copy Name', function()

                              g_window.setClipboardText(widget:getText())

                            end, "")

                            menu:display(mousePos)

                            return true

                          end

                        end

                      end

                      nameTab:setText("")

                  else

                      warn("vBot[PlayerList]: Player ".. name .." is already added!")

                      nameTab:setText("")

                  end

                  clearCachedPlayers()

                  refreshStatus()

              end

            end

        end

        nameTab.onKeyPress = function(widget, keyCode, keyboardModifiers)

          if keyCode ~= 5 then

            return false

          end

          addButton.onClick()

          return true

        end

    end

    function addBlackListPlayer(name)

      if table.find(config.blackList, name) then return end

      table.insert(config.blackList, name)

      local label = UI.createWidget("PlayerLabel", blacklistList)

      label:setText(name)

      label.remove.onClick = function()

          table.remove(playerList, table.find(playerList, name))

          label:destroy()

      end

      label.onMouseRelease = function(widget, mousePos, mouseButton)

        if mouseButton == 2 then

          local child = rootWidget:recursiveGetChildByPos(mousePos)

          if child == widget then

            local menu = g_ui.createWidget('PopupMenu')

            menu:setId("blzMenu")

            menu:setGameMenu(true)

            menu:addOption('Check Player', function()

              local name = widget:getText():gsub(" ", "_")

              local link = "https://www.gunzodus.net/character/show/"

              g_platform.openUrl(link..name)

            end, "")

            menu:addOption('Copy Name', function()

              g_window.setClipboardText(widget:getText())

            end, "")

            menu:display(mousePos)

            return true

          end

        end

      end

    end

end

onTextMessage(function(mode,text)

  if not config.autoAdd then return end

  if CaveBot.isOff() or TargetBot.isOff() then return end

  if not text:find("Warning! The murder of") then return end

    text = string.split(text, "Warning! The murder of ")[1]

    text = string.split(text, " was not justified.")[1]

    addBlackListPlayer(text)

end)

onCreatureAppear(function(creature)

    checkStatus(creature)

  end)

onPlayerPositionChange(function(x,y)

  if x.z ~= y.z then

    schedule(20, function()

      refreshStatus()

    end)

  end

end)

```

---
# playerlist.otui
```otui

PlayerLabel < UIWidget

  background-color: alpha

  text-offset: 3 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  text-align: left

  $focus:

    background-color: #00000055

  Button

    id: remove

    !text: tr('X')

    anchors.right: parent.right

    anchors.verticalCenter: parent.verticalCenter

    width: 14

    height: 14

    margin-right: 15

    text-align: center

    text-offset: 0 1

    tooltip: Remove profile from the list.

SettingCheckBox < CheckBox

  text-wrap: true

  text-auto-resize: true

  margin-top: 3

  font: verdana-11px-rounded

Settings < FlatPanel

  padding: 6

  layout:

    type: verticalBox

  Label

    text: Additional Settings

    text-align: center

    font: verdana-11px-rounded

  HorizontalSeparator

  SettingCheckBox

    id: Members

    margin-top: 6

    text: Consider group members as friends.

  SettingCheckBox

    id: Outfit

    text: Color listed player outfits to red or blue.

  SettingCheckBox

    id: NeutralsAreEnemy

    text: Consider every non friend player as enemy.

  SettingCheckBox

    id: Highlight

    text: Hightlight listed players in red or blue color.

  SettingCheckBox

    id: AutoAdd

    text: Automatically add killed players while cave botting to blacklist.

tPanel < Panel

  margin: 3

  padding: 3

  TextList

    id: list

    height: 200

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: parent.top

    vertical-scrollbar: listScrollBar

  VerticalScrollBar

    id: listScrollBar

    anchors.top: list.top

    anchors.bottom: list.bottom

    anchors.right: list.right

    step: 14

    pixels-scroll: true

  TextEdit

    id: name

    anchors.top: list.bottom

    margin-top: 3

    anchors.left: parent.left

    anchors.right: parent.right

  Button

    id: add

    text: Add Player

    anchors.top: prev.bottom

    margin-top: 3

    anchors.left: parent.left

    anchors.right: parent.right

    font: verdana-11px-rounded

PlayerListWindow < MainWindow

  !text: tr('Player List')

  size: 405 356

  @onEscape: self:hide()

  TabBar

    id: tmpTabBar

    anchors.top: parent.top

    anchors.left: parent.left

    width: 180

  FlatPanel

    id: tmpTabContent

    anchors.top: tmpTabBar.bottom

    anchors.left: parent.left

    width: 180

    anchors.bottom: separator.top

    margin-bottom: 5

  VerticalSeparator

    id: verticalSep

    anchors.top: parent.top

    anchors.bottom: separator.top

    margin-bottom: 5

    anchors.horizontalCenter: parent.horizontalCenter

  Settings

    id: settings

    anchors.left: prev.right

    anchors.top: parent.top

    anchors.right: parent.right

    anchors.bottom: next.top

    margin: 3

    margin-left: 6

    margin-bottom: 4

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

    @onClick: self:getParent():hide()

```

---
# pushmax.lua
```lua

---@diagnostic disable: undefined-global

setDefaultTab("Main")

local panelName = "pushmax"

local ui = setupUI([[

Panel

  height: 19

  BotSwitch

    id: title

    anchors.top: parent.top

    anchors.left: parent.left

    text-align: center

    width: 130

    !text: tr('PUSHMAX')

  Button

    id: push

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-left: 3

    height: 17

    text: Setup

]])

ui:setId(panelName)

if not storage[panelName] then

  storage[panelName] = {

    enabled = true,

    pushDelay = 1060,

    pushMaxRuneId = 3188,

    mwallBlockId = 2128,

    pushMaxKey = "PageUp"

}

end

local config = storage[panelName]

ui.title:setOn(config.enabled)

ui.title.onClick = function(widget)

config.enabled = not config.enabled

widget:setOn(config.enabled)

end

ui.push.onClick = function(widget)

  pushWindow:show()

  pushWindow:raise()

  pushWindow:focus()

end

rootWidget = g_ui.getRootWidget()

if rootWidget then

  pushWindow = UI.createWindow('PushMaxWindow', rootWidget)

  pushWindow:hide()

  pushWindow.closeButton.onClick = function(widget)

    pushWindow:hide()

  end

  local updateDelayText = function()

    pushWindow.delayText:setText("Push Delay: ".. config.pushDelay)

  end

  updateDelayText()

  pushWindow.delay.onValueChange = function(scroll, value)

    config.pushDelay = value

    updateDelayText()

  end

  pushWindow.delay:setValue(config.pushDelay)

  pushWindow.runeId.onItemChange = function(widget)

    config.pushMaxRuneId = widget:getItemId()

  end

  pushWindow.runeId:setItemId(config.pushMaxRuneId)

  pushWindow.mwallId.onItemChange = function(widget)

    config.mwallBlockId = widget:getItemId()

  end

  pushWindow.mwallId:setItemId(config.mwallBlockId)

  pushWindow.hotkey.onTextChange = function(widget, text)

    config.pushMaxKey = text

  end

  pushWindow.hotkey:setText(config.pushMaxKey)

end

-- variables for config

local fieldTable = {2118, 105, 2122}

local cleanTile = nil

-- scripts

local targetTile

local pushTarget

local resetData = function()

  for i, tile in pairs(g_map.getTiles(posz())) do

    if tile:getText() == "TARGET" or tile:getText() == "DEST" or tile:getText() == "CLEAR" then

      tile:setText('')

    end

  end

  pushTarget = nil

  targetTile = nil

  cleanTile = nil

end

local getCreatureById = function(id)

  for i, spec in ipairs(getSpectators()) do

    if spec:getId() == id then

      return spec

    end

  end

  return false

end

local isNotOk = function(t,tile)

  local tileItems = {}

  for i, item in pairs(tile:getItems()) do

    table.insert(tileItems, item:getId())

  end

  for i, field in ipairs(t) do

    if table.find(tileItems, field) then

      return true

    end

  end

  return false

end

local isOk = function(a,b)

  return getDistanceBetween(a,b) == 1

end

-- to mark

local hold = 0

onKeyDown(function(keys)

  if not config.enabled then return end

  if keys ~= config.pushMaxKey then return end

  hold = now

  local tile = getTileUnderCursor()

  if not tile then return end

  if pushTarget and targetTile then

    resetData()

    return

  end

  local creature = tile:getCreatures()[1]

  if not pushTarget and creature then

    pushTarget = creature

    if pushTarget then

      tile:setText('TARGET')

      pushTarget:setMarked('#00FF00')

    end

  elseif not targetTile and pushTarget then

    if pushTarget and getDistanceBetween(tile:getPosition(),pushTarget:getPosition()) ~= 1 then

      resetData()

      return

    else

      tile:setText('DEST')

      targetTile = tile

    end

  end

end)

-- mark tile to throw anything from it

onKeyPress(function(keys)

  if not config.enabled then return end

  if keys ~= config.pushMaxKey then return end

  local tile = getTileUnderCursor()

  if not tile then return end

  if (hold - now) < -2500 then

    if cleanTile and tile ~= cleanTile then

      resetData()

    elseif not cleanTile then

      cleanTile = tile

      tile:setText("CLEAR")

    end

  end

  hold = 0

end)

onCreaturePositionChange(function(creature, newPos, oldPos)

  if not config.enabled then return end

  if creature == player then

    resetData()

  end

  if not pushTarget or not targetTile then return end

  if creature == pushTarget and newPos == targetTile then

    resetData()

  end

end)

macro(50, function()

  if not config.enabled then return end

  local pushDelay = tonumber(config.pushDelay)

  local rune = tonumber(config.pushMaxRuneId)

  local customMwall = config.mwallBlockId

  if cleanTile then

    local tilePos = cleanTile:getPosition()

    local pPos = player:getPosition()

    if not isOk(tilePos, pPos) then

      resetData()

      return

    end

    if not cleanTile:hasCreature() then return end

    local tiles = getNearTiles(tilePos)

    local destTile

    local forbidden = {}

    -- unfortunately double loop

    for i, tile in pairs(tiles) do

      local minimapColor = g_map.getMinimapColor(tile:getPosition())

      local stairs = (minimapColor >= 210 and minimapColor <= 213)

      if stairs then

        table.insert(forbidden, tile:getPosition())

      end

    end

    for i, tile in pairs(tiles) do

      local minimapColor = g_map.getMinimapColor(tile:getPosition())

      local stairs = (minimapColor >= 210 and minimapColor <= 213)

      if tile:isWalkable() and not isNotOk(fieldTable, tile) and not tile:hasCreature() and not stairs then

        local tooClose = false

        if #forbidden ~= 0 then

          for i=1,#forbidden do

            local pos = forbidden[i]

            if isOk(pos, tile:getPosition()) then

              tooClose = true

              break

            end

          end

        end

        if not tooClose then

          destTile = tile

          break

        end

      end

    end

    if not destTile then return end

    local parcel = cleanTile:getCreatures()[1]

    if parcel then

      test()

      g_game.move(parcel,destTile:getPosition())

      delay(2000)

    end

  else

    if not pushTarget or not targetTile then return end

    local tilePos = targetTile:getPosition()

    local targetPos = pushTarget:getPosition()

    if not isOk(tilePos,targetPos) then return end

    local tileOfTarget = g_map.getTile(targetPos)

    if not targetTile:isWalkable() then

      local topThing = targetTile:getTopUseThing():getId()

      if topThing == 2129 or topThing == 2130 or topThing == customMwall then

        if targetTile:getTimer() < pushDelay+500 then

          vBot.isUsing = true

          schedule(pushDelay+700, function()

            vBot.isUsing = false

          end)

        end

        if targetTile:getTimer() > pushDelay then

          return

        end

      else

        return resetData()

      end

    end

    if not tileOfTarget:getTopUseThing():isNotMoveable() and targetTile:getTimer() < pushDelay+500 then

      return useWith(rune, pushTarget)

    end

    if isNotOk(fieldTable, targetTile) then

      if targetTile:canShoot() then

        return useWith(3148, targetTile:getTopUseThing())

      else

        return

      end

    end

      g_game.move(pushTarget,tilePos)

      delay(2000)

  end

end)

```

---
# pushmax.otui
```otui

PushMaxWindow < MainWindow

  !text: tr('Pushmax Settings')

  size: 200 240

  @onEscape: self:hide()

  BotLabel

    id: delayText

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: center

  HorizontalScrollBar

    id: delay

    anchors.left: delayText.left

    anchors.right: delayText.right

    anchors.top: delayText.bottom

    margin-top: 5

    minimum: 800

    maximum: 2000

    step: 10

  Label

    id: label2

    anchors.top: delay.bottom

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    text-align: center

    text: Custom WallID

    margin-top: 5

  Label

    id: label3

    anchors.top: delay.bottom

    anchors.right: parent.horizontalCenter

    anchors.left: parent.left

    text-align: center

    text: VS AntiPush

    margin-top: 5

  BotItem

    id: runeId

    anchors.horizontalCenter: label3.horizontalCenter

    anchors.top: label3.bottom

    margin-top: 5

  BotItem

    id: mwallId

    anchors.horizontalCenter: label2.horizontalCenter

    anchors.top: label2.bottom

    margin-top: 5

  Label

    id: label1

    anchors.top: mwallId.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 10

    text-align: center

    text: Hotkey for PUSHMAX

  TextEdit

    id: hotkey

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: label1.bottom

    margin-top: 5

    text-align: center

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

```

---
# quiver_label.lua
```lua

local quiverSlot = modules.game_inventory.inventoryWindow:recursiveGetChildById('slot5')

local label = quiverSlot.count

label = label or g_ui.loadUIFromString([[

Label

  id: count

  color: #bfbfbf

  font: verdana-11px-rounded

  anchors.left: parent.left

  anchors.right: parent.right

  anchors.bottom: parent.bottom

  text-align: right

  margin-right: 3

  margin-left: 3

  text:

]], quiverSlot)

function getQuiverAmount()

    -- old tibia

    if g_game.getClientVersion() < 1000 then return end

    local isQuiverEquipped = getRight() and getRight():isContainer() or false

    local quiver = isQuiverEquipped and getContainerByItem(getRight():getId())

    local count = 0

    if quiver then

        for i, item in ipairs(quiver:getItems()) do

            count = count + item:getCount()

        end

    else

        return label:setText("")

    end

    return label:setText(count)

end

getQuiverAmount()

onContainerOpen(function(container, previousContainer)

    getQuiverAmount()

end)

onContainerClose(function(container)

    getQuiverAmount()

end)

onAddItem(function(container, slot, item, oldItem)

    getQuiverAmount()

end)

onRemoveItem(function(container, slot, item)

    getQuiverAmount()

end)

onContainerUpdateItem(function(container, slot, item, oldItem)

    getQuiverAmount()

end)

```

---
# quiver_manager.lua
```lua

if voc() == 2 or voc() == 12 then

    local bows = { 3350, 31581, 27455, 8027, 20082, 36664, 7438, 28718, 36665, 14246, 19362, 35518, 34150, 29417, 9378, 16164, 22866, 12733, 8029, 20083, 20084, 8026, 8028, 34088}

    local xbows = { 30393, 3349, 27456, 20085, 16163, 5947, 8021, 14247, 22867, 8023, 22711, 19356, 20086, 20087, 34089}

    local arrows = { 16143, 763, 761, 7365, 3448, 762, 21470, 7364, 14251, 3447, 3449, 15793, 25757, 774, 35901 }

    local bolts = { 6528, 7363, 3450, 16141, 25758, 14252, 3446, 16142, 35902 }

    local hold = false

    onContainerOpen(function(container, previousContainer)

        hold = false

    end)

    onContainerClose(function(container)

        hold = false

    end)

    onAddItem(function(container, slot, item, oldItem)

        hold = false

    end)

    onRemoveItem(function(container, slot, item)

        hold = false

    end)

    onContainerUpdateItem(function(container, slot, item, oldItem)

        hold = false

    end)

    local function manageQuiver(isBowEquipped, quiverContainer)

        local ammo = isBowEquipped and arrows or bolts

        local dest = nil

        local containers = getContainers()

        for i, container in ipairs(containers) do

            if container ~= quiverContainer and not containerIsFull(container) then

                local cname = container:getName():lower()

                if not cname:find("loot") and (cname:find("backpack") or cname:find("bag") or cname:find("chess")) then

                    dest = container

                end

            end

        end

        -- clearing

        if dest then

            for i, item in ipairs(quiverContainer:getItems()) do

                if not table.find(ammo, item:getId()) then

                    local pos = dest:getSlotPosition(dest:getItemsCount())

                    return g_game.move(item, pos, item:getCount())

                end

            end

        end

        if not containerIsFull(quiverContainer) then

            for i, container in ipairs(containers) do

                if container ~= quiverContainer then

                    for j, item in ipairs(container:getItems()) do

                        if table.find(ammo, item:getId()) then

                            local pos = quiverContainer:getSlotPosition(quiverContainer:getItemsCount())

                            return g_game.move(item, pos, item:getCount())

                        end

                    end

                end

            end

        end

        return true

    end

    UI.Separator()

    macro(100, "Quiver Manager", function()

        if hold then return end -- do nothing if nothing to do

        local hand = getLeft() and getLeft():getId()

        local quiverEquipped = getRight() and getRight():isContainer()

        if not hand then return end

        if not quiverEquipped then return end

        local quiverContainer = getContainerByItem(getRight():getId())

        if not quiverContainer then return end

        local isBowEquipped = getLeft() and table.find(bows, hand) and true or false

        if not isBowEquipped then

            if not table.find(xbows, hand) then

                return -- neither bow and xbow is equipped

            end

        end

        if manageQuiver(isBowEquipped, quiverContainer) then -- if true then it didn't do anything

            hold = true

        end

    end)

end

```

---
# siolist.otui
```otui

VocationPanel < Panel

  padding: 3

  image-source: /images/ui/panel_flat

  image-border: 6

  size: 190 55

  Label

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: center

    text: for BotServer, Heal only:

  BotSwitch

    id: ED

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    text: Druids

  BotSwitch

    id: MS

    anchors.bottom: parent.bottom

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    text: Sorcerers

  BotSwitch

    id: EK

    anchors.bottom: ED.top

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    text: Knights

  BotSwitch

    id: RP

    anchors.bottom: ED.top

    anchors.left: parent.horizontalCenter

    anchors.right: parent.right

    text: Paladins

SioListWindow < MainWindow

  !text: tr('Healer Options')

  size: 220 360

  @onEscape: self:hide()

  BotSwitch

    id: exuraSio

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.horizontalCenter

    text: Exura Sio

    margin-right: 2

  BotSwitch

    id: exuraGranSio

    anchors.top: parent.top

    anchors.left: prev.right

    anchors.right: parent.right

    text: Exura Gran Sio

    margin-left: 2

  BotSwitch

    id: exuraMasRes

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    text: Exura Gran Mas Res

    margin-top: 3

  BotSwitch

    id: spell

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    text: Custom Spell

    margin-top: 3

    text-align: center

  BotTextEdit

    id: spellName

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 3

  HorizontalSeparator

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 10

  BotItem

    id: itemId

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-top: 10

  BotSwitch

    id: item

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.bottom: prev.verticalCenter

    text-align: center

    text: Item Healing

    margin-left: 2

  BotLabel

    id: distText

    anchors.top: itemId.verticalCenter

    anchors.left: itemId.right

    anchors.right: parent.right

    anchors.bottom: itemId.bottom

    text-align: center

    text: Max Distance

  HorizontalScrollBar

    id: Distance

    anchors.left: parent.left

    anchors.top: itemId.bottom

    anchors.right: parent.right

    margin-top: 3

    minimum: 1

    maximum: 10

    step: 1

  HorizontalSeparator

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 8

  BotLabel

    id: manaInfo

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    text-align: center

    margin-top: 5

  HorizontalScrollBar

    id: minMana

    anchors.left: spellName.left

    anchors.right: spellName.right

    anchors.top: manaInfo.bottom

    margin-top: 2

    minimum: 1

    maximum: 100

    step: 1

  BotLabel

    id: friendHp

    anchors.left: spellName.left

    anchors.right: spellName.right

    anchors.top: prev.bottom

    text-align: center

    margin-top: 5

  HorizontalScrollBar

    id: minFriendHp

    anchors.left: spellName.left

    anchors.right: spellName.right

    anchors.top: friendHp.bottom

    margin-top: 2

    minimum: 1

    maximum: 100

    step: 1

  VocationPanel

    id: vocation

    anchors.top: prev.bottom

    margin-top: 6

  HorizontalSeparator

    id: separator

    anchors.right: parent.right

    anchors.left: parent.left

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    margin-right: 5

```

---
# spy_level.lua
```lua

-- config

local keyUp = "="

local keyDown = "-"

setDefaultTab("Tools")

-- script

local lockedLevel = pos().z

onPlayerPositionChange(function(newPos, oldPos)

    lockedLevel = pos().z

    modules.game_interface.getMapPanel():unlockVisibleFloor()

end)

onKeyPress(function(keys)

    if keys == keyDown then

        lockedLevel = lockedLevel + 1

        modules.game_interface.getMapPanel():lockVisibleFloor(lockedLevel)

    elseif keys == keyUp then

        lockedLevel = lockedLevel - 1

        modules.game_interface.getMapPanel():lockVisibleFloor(lockedLevel)

    end

end)

```

---
# supplies.lua
```lua

setDefaultTab("Cave")

local panelName = "supplies"

if not SuppliesConfig[panelName] or SuppliesConfig[panelName].item1 then

  SuppliesConfig[panelName] = {

    currentProfile = "Default",

    ["Default"] = {}

}

end

local function convertOldConfig(config)

  if config and config.items then

    return config

  end -- config is new

  local newConfig = {

    items = {},

    capSwitch = config.capSwitch,

    SoftBoots = config.SoftBoots,

    imbues = config.imbues,

    staminaSwitch = config.staminaSwitch,

    capValue = config.capValue,

    staminaValue = config.staminaValue

}

  local items = {

    config.item1,

    config.item2,

    config.item3,

    config.item4,

    config.item5,

    config.item6

}

  local mins = {

    config.item1Min,

    config.item2Min,

    config.item3Min,

    config.item4Min,

    config.item5Min,

    config.item6Min

}

  local maxes = {

    config.item1Max,

    config.item2Max,

    config.item3Max,

    config.item4Max,

    config.item5Max,

    config.item6Max

}

  for i, item in ipairs(items) do

    if item > 100 then

      local min = mins[i]

      local max = maxes[i]

      newConfig.items[tostring(item)] = {

        min = min,

        max = max,

        avg = 0

}

    end

  end

  return newConfig

end

-- convert old configs

for k, profile in pairs(SuppliesConfig[panelName]) do

  if type(profile) == 'table' then

    SuppliesConfig[panelName][k] = convertOldConfig(profile)

  end

end

local currentProfile = SuppliesConfig[panelName].currentProfile

local config = SuppliesConfig[panelName][currentProfile]

vBotConfigSave("supply")

if not config then

  for k, v in pairs(SuppliesConfig[panelName]) do

    if type(v) == "table" then

      SuppliesConfig[panelName].currentProfile = k

      config = SuppliesConfig[panelName][k]

      break

    end

  end

end

function getEmptyItemPanels()

  local panel = SuppliesWindow.items

  local count = 0

  for i, child in ipairs(panel:getChildren()) do

    count = child:getId() == "blank" and count + 1 or count

  end

  return count

end

function deleteFirstEmptyPanel()

  local panel = SuppliesWindow.items

  for i, child in ipairs(panel:getChildren()) do

    if child:getId() == "blank" then

      child:destroy()

      break

    end

  end

end

function clearEmptyPanels()

  local panel = SuppliesWindow.items

  if panel:getChildCount() > 1 then

    if getEmptyItemPanels() > 1 then

      deleteFirstEmptyPanel()

    end

  end

end

function addItemPanel()

  local parent = SuppliesWindow.items

  local childs = parent:getChildCount()

  local panel = UI.createWidget("ItemPanel", parent)

  local item = panel.id

  local min = panel.min

  local max = panel.max

  local avg = panel.avg

  panel:setId("blank")

  item:setShowCount(false)

  item.onItemChange = function(widget)

    local id = widget:getItemId()

    local panelId = panel:getId()

    -- empty, verify

    if id < 100 then

      config.items[panelId] = nil

      panel:setId("blank")

      clearEmptyPanels() -- clear empty panels if any

      return

    end

    -- itemId was not changed, ignore

    if tonumber(panelId) == id then

      return

    end

    -- check if isnt already added

    if config[tostring(id)] then

      warn("vBot[Drop Tracker]: Item already added!")

      widget:setItemId(0)

      return

    end

    -- new item id

    config.items[tostring(id)] = config.items[tostring(id)] or {} -- min, max, avg

    panel:setId(id)

    addItemPanel() -- add new panel

  end

  return panel

end

SuppliesWindow = UI.createWindow("SuppliesWindow")

SuppliesWindow:hide()

UI.Button(

  "Supply Settings",

  function()

    SuppliesWindow:setVisible(not SuppliesWindow:isVisible())

  end

)

-- load settings

local function loadSettings()

  -- panels

  SuppliesWindow.items:destroyChildren()

  for id, data in pairs(config.items) do

    local widget = addItemPanel()

    widget:setId(id)

    widget.id:setItemId(tonumber(id))

    widget.min:setText(data.min)

    widget.max:setText(data.max)

    widget.avg:setText(data.avg)

  end

  addItemPanel() -- add empty panel

  -- switches and values

  SuppliesWindow.capSwitch:setOn(config.capSwitch)

  SuppliesWindow.SoftBoots:setOn(config.SoftBoots)

  SuppliesWindow.imbues:setOn(config.imbues)

  SuppliesWindow.staminaSwitch:setOn(config.staminaSwitch)

  SuppliesWindow.capValue:setText(config.capValue or 0)

  SuppliesWindow.staminaValue:setText(config.staminaValue or 0)

end

loadSettings()

-- save settings

SuppliesWindow.onVisibilityChange = function(widget, visible)

  if not visible then

    local currentProfile = SuppliesConfig[panelName].currentProfile

    SuppliesConfig[panelName][currentProfile].items = {}

    local parent = SuppliesWindow.items

    -- items

    for i, panel in ipairs(parent:getChildren()) do

      if panel.id:getItemId() > 100 then

        local id = tostring(panel.id:getItemId())

        local min = panel.min:getValue()

        local max = panel.max:getValue()

        local avg = panel.avg:getValue()

        SuppliesConfig[panelName][currentProfile].items[id] = {

          min = min,

          max = max,

          avg = avg

}

      end

    end

    vBotConfigSave("supply")

  end

end

local function refreshProfileList()

  local profiles = SuppliesConfig[panelName]

  SuppliesWindow.profiles:destroyChildren()

  for k, v in pairs(profiles) do

    if type(v) == "table" then

      local label = UI.createWidget("ProfileLabel", SuppliesWindow.profiles)

      label:setText(k)

      label:setTooltip("Click to load this profile. \nDouble click to change the name.")

      label.remove.onClick = function()

        local childs = SuppliesWindow.profiles:getChildCount()

        if childs == 1 then

          return info("vBot[Supplies] You need at least one profile!")

        end

        profiles[k] = nil

        label:destroy()

        vBotConfigSave("supply")

      end

      label.onDoubleClick = function(widget)

        local window =

          modules.client_textedit.show(

          widget,

          {title = "Set Profile Name", description = "Enter a new name for selected profile"}

)

        schedule(

          50,

          function()

            window:raise()

            window:focus()

          end

)

      end

      label.onClick = function()

        SuppliesConfig[panelName].currentProfile = label:getText()

        config = SuppliesConfig[panelName][label:getText()]

        loadSettings()

        vBotConfigSave("supply")

      end

      label.onTextChange = function(widget, text)

        currentProfile = text

        SuppliesConfig[panelName].currentProfile = text

        profiles[text] = profiles[k]

        profiles[k] = nil

        vBotConfigSave("supply")

      end

    end

  end

end

refreshProfileList()

local function setProfileFocus()

  for i, v in ipairs(SuppliesWindow.profiles:getChildren()) do

    local name = v:getText()

    if name == SuppliesConfig[panelName].currentProfile then

      return v:focus()

    end

  end

end

setProfileFocus()

SuppliesWindow.newProfile.onClick = function()

  local n = SuppliesWindow.profiles:getChildCount()

  if n > 6 then

    return info("vBot[Supplies] - max profile count reached!")

  end

  local name = "Profile #" .. n + 1

  SuppliesConfig[panelName][name] = {items = {}}

  refreshProfileList()

  setProfileFocus()

  vBotConfigSave("supply")

end

SuppliesWindow.capSwitch.onClick = function(widget)

  config.capSwitch = not config.capSwitch

  widget:setOn(config.capSwitch)

end

SuppliesWindow.SoftBoots.onClick = function(widget)

  config.SoftBoots = not config.SoftBoots

  widget:setOn(config.SoftBoots)

end

SuppliesWindow.imbues.onClick = function(widget)

  config.imbues = not config.imbues

  widget:setOn(config.imbues)

end

SuppliesWindow.staminaSwitch.onClick = function(widget)

  config.staminaSwitch = not config.staminaSwitch

  widget:setOn(config.staminaSwitch)

end

SuppliesWindow.capValue.onTextChange = function(widget, text)

  local value = tonumber(SuppliesWindow.capValue:getText())

  if not value then

    SuppliesWindow.capValue:setText(0)

    config.capValue = 0

  else

    text = text:match("0*(%d+)")

    config.capValue = text

  end

end

SuppliesWindow.staminaValue.onTextChange = function(widget, text)

  local value = tonumber(SuppliesWindow.staminaValue:getText())

  if not value then

    SuppliesWindow.staminaValue:setText(0)

    config.staminaValue = 0

  else

    text = text:match("0*(%d+)")

    config.staminaValue = text

  end

end

SuppliesWindow.increment.onClick = function(widget)

  for i, panel in ipairs(SuppliesWindow.items:getChildren()) do

    if panel.id:getItemId() > 100 then

      local max = panel.max:getValue()

      local avg = panel.avg:getValue()

      if avg > 0 then

        panel.max:setText(max + avg)

      end

    end

  end

end

SuppliesWindow.decrement.onClick = function(widget)

  for i, panel in ipairs(SuppliesWindow.items:getChildren()) do

    if panel.id:getItemId() > 100 then

      local max = panel.max:getValue()

      local avg = panel.avg:getValue()

      if avg > 0 then

        panel.max:setText(math.max(0, max - avg)) -- dont go below 0

      end

    end

  end

end

SuppliesWindow.increment.onMouseWheel = function(widget, mousePos, dir)

  if dir == 1 then

    SuppliesWindow.increment.onClick()

  elseif dir == 2 then

    SuppliesWindow.decrement.onClick()

  end

end

SuppliesWindow.decrement.onMouseWheel = SuppliesWindow.increment.onMouseWheel

Supplies = {} -- public functions

Supplies.show = function()

  SuppliesWindow:show()

  SuppliesWindow:raise()

  SuppliesWindow:focus()

end

Supplies.getItemsData = function()

  local t = {}

  -- items

  for i, panel in ipairs(SuppliesWindow.items:getChildren()) do

    if panel.id:getItemId() > 100 then

      local id = tostring(panel.id:getItemId())

      local min = panel.min:getValue()

      local max = panel.max:getValue()

      local avg = panel.avg:getValue()

      t[id] = {

        min = min,

        max = max,

        avg = avg

}

    end

  end

  return t

end

Supplies.isSupplyItem = function(id)

  local data = Supplies.getItemsData()

  id = tostring(id)

  if data[id] then

    return data[id]

  else

    return false

  end

end

Supplies.hasEnough = function()

  local data = Supplies.getItemsData()

  for id, values in pairs(data) do

    id = tonumber(id)

    local minimum = values.min

    local current = player:getItemsCount(id) or 0

    if current < minimum then

      return {id=id, amount=current}

    end

  end

  return true

end

hasSupplies = Supplies.hasEnough

Supplies.setAverageValues = function(data)

  for id, amount in pairs(data) do

    local widget = SuppliesWindow.items[id]

    if widget then

      widget.avg:setText(amount)

    end

  end

end

Supplies.addSupplyItem = function(id, min, max, avg)

  if not id then

    return

  end

  local widget = addItemPanel()

  widget:setId(id)

  widget.id:setItemId(tonumber(id))

  widget.min:setText(min or 0)

  widget.max:setText(max or 0)

  widget.avg:setText(avg or 0)

end

Supplies.getAdditionalData = function()

  local data = {

    stamina = {enabled = config.staminaSwitch, value = config.staminaValue},

    capacity = {enabled = config.capSwitch, value = config.capValue},

    softBoots = {enabled = config.SoftBoots},

    imbues = {enabled = config.imbues}

}

  return data

end

Supplies.getFullData = function()

  local data = {

    items = Supplies.getItemsData(),

    additional = Supplies.getAdditionalData()

}

  return data

end

```

---
# supplies.otui
```otui

ProfileLabel < UIWidget

  background-color: alpha

  text-offset: 3 1

  focusable: true

  height: 16

  font: verdana-11px-rounded

  text-align: left

  $focus:

    background-color: #00000055

  Button

    id: remove

    !text: tr('X')

    anchors.right: parent.right

    anchors.verticalCenter: parent.verticalCenter

    width: 14

    height: 14

    margin-right: 3

    text-align: center

    text-offset: 0 1

    tooltip: Remove profile from the list.

SupplySpinBox < SpinBox

  height: 20

  margin-left: 3

  width: 75

  minimum: 0

  maximum: 9999

  text-align: center

  focusable: true

  text: 0

ItemPanel < Panel

  height: 38

  BotItem

    id: id

    anchors.left: parent.left

    anchors.bottom: parent.bottom

  SupplySpinBox

    id: min

    anchors.left: prev.right

    anchors.bottom: parent.bottom

  SupplySpinBox

    id: max

    anchors.left: prev.right

    anchors.bottom: parent.bottom

  SupplySpinBox

    id: avg

    anchors.left: prev.right

    anchors.bottom: parent.bottom

    width: 50

  UIWidget

    anchors.left: min.left

    anchors.bottom: min.top

    width: 75

    text-align: center

    font: verdana-11px-rounded

    text: Min

    tooltip: Amount of given supplies for bot to leave the spawn.

  UIWidget

    anchors.left: max.left

    anchors.bottom: max.top

    width: 75

    text-align: center

    font: verdana-11px-rounded

    text: Max

    tooltip: Amount of given supplies to purchase

  UIWidget

    anchors.left: avg.left

    anchors.bottom: avg.top

    width: 55

    text-align: center

    font: verdana-11px-rounded

    text: AVG

    !tooltip: ("This is average consumption of supplies by round to help calculate the amount to purchase\n (info provided by CaveBot Stats)")

SuppliesWindow < MainWindow

  !text: tr('Supplies')

  size: 430 330

  @onEscape: self:hide()

  VerticalSeparator

    id: sep

    anchors.top: parent.top

    anchors.right: parent.right

    margin-right: 140

    anchors.bottom: bottomSep.top

    margin-bottom: 5

    margin-left: 10

    visible: false

  Label

    anchors.left: sep.right

    anchors.right: parent.right

    anchors.top: parent.top

    margin-left: 10

    margin-top: 3

    text-align: center

    text: Additional Conditions:

  HorizontalSeparator

    anchors.top: prev.bottom

    anchors.left: prev.left

    anchors.right: prev.right

    margin-top: 3

  BotSwitch

    id: SoftBoots

    anchors.top: prev.bottom

    anchors.left: sep.right

    anchors.right: parent.right

    margin-top: 5

    margin-left: 10

    text: No Soft

    tooltip: Go refill if there's no more active soft boots.

  BotSwitch

    id: capSwitch

    height: 20

    anchors.left: SoftBoots.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 5

    margin-right: 50

    text-align: center

    text: Cap Below:

    tooltip: Go refill if capacity is below set value.

  BotTextEdit

    id: capValue

    size: 40 20

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.top: prev.top

    margin-left: 5

  BotSwitch

    id: staminaSwitch

    height: 20

    anchors.left: SoftBoots.left

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 5

    margin-right: 50

    text-align: center

    text: Stamina:

    tooltip: Go refill if stamina is below set value. (in minutes)

  BotTextEdit

    id: staminaValue

    size: 40 20

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.top: prev.top

    margin-left: 5

  BotSwitch

    id: imbues

    anchors.top: prev.bottom

    anchors.left: sep.right

    anchors.right: parent.right

    margin-top: 5

    margin-left: 10

    text: No Imbues

    tooltip: Go refill when mana leech imbue has worn off.

  TextList

    id: profiles

    anchors.top: prev.bottom

    margin-top: 5

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.bottom: bottomSep.top

    margin-bottom: 25

  BotButton

    id: newProfile

    anchors.left: prev.left

    anchors.top: prev.bottom

    size: 35 15

    text: New

    font: cipsoftFont

    tooltip: Create new supplies profile.

  VerticalScrollBar

    id: itemsScrollBar

    anchors.top: items.top

    anchors.bottom: items.bottom

    anchors.right: items.right

    step: 14

    pixels-scroll: true

  ScrollablePanel

    id: items

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: sep.left

    anchors.bottom: bottomSep.top

    margin-bottom: 8

    vertical-scrollbar: itemsScrollBar

    layout: verticalBox

  HorizontalSeparator

    id: bottomSep

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: closeButton.top

    margin-bottom: 8

  Button

    id: closeButton

    !text: tr('Close')

    font: cipsoftFont

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    size: 45 21

    margin-top: 15

    tooltip: Close supplies window and save settings.

    @onClick: self:getParent():hide()

  Button

    id: increment

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: items.right

    text: +

    width: 50

    tooltip: increase all max supplies amount by average

  Button

    id: decrement

    anchors.verticalCenter: prev.verticalCenter

    anchors.right: prev.left

    margin-right: 3

    text: -

    width: 50

    tooltip: decrease all max supplies amount by average

```

---
# tools.lua
```lua

-- tools tab

setDefaultTab("Tools")

if type(storage.moneyItems) ~= "table" then

  storage.moneyItems = {3031, 3035}

end

macro(1000, "Exchange money", function()

  if not storage.moneyItems[1] then return end

  local containers = g_game.getContainers()

  for index, container in pairs(containers) do

    if not container.lootContainer then -- ignore monster containers

      for i, item in ipairs(container:getItems()) do

        if item:getCount() == 100 then

          for m, moneyId in ipairs(storage.moneyItems) do

            if item:getId() == moneyId.id then

              return g_game.use(item)

            end

          end

        end

      end

    end

  end

end)

local moneyContainer = UI.Container(function(widget, items)

  storage.moneyItems = items

end, true)

moneyContainer:setHeight(35)

moneyContainer:setItems(storage.moneyItems)

UI.Separator()

macro(60000, "Send message on trade", function()

  local trade = getChannelId("advertising")

  if not trade then

    trade = getChannelId("trade")

  end

  if trade and storage.autoTradeMessage:len() > 0 then

    sayChannel(trade, storage.autoTradeMessage)

  end

end)

UI.TextEdit(storage.autoTradeMessage or "I'm using OTClientV8!", function(widget, text)

  storage.autoTradeMessage = text

end)

UI.Separator()

```

---
# version.txt
```text

4.7

```

---
# vlib.lua
```lua

-- Author: Vithrax

-- contains mostly basic function shortcuts and code shorteners

-- initial global variables declaration

vBot = {} -- global namespace for bot variables

vBot.BotServerMembers = {}

vBot.standTime = now

vBot.isUsingPotion = false

vBot.isUsing = false

vBot.customCooldowns = {}

function logInfo(text)

    local timestamp = os.date("%H:%M:%S")

    text = tostring(text)

    local start = timestamp.." [vBot]"

    return modules.client_terminal.addLine(start..text, "orange")

end

-- scripts / functions

onPlayerPositionChange(function(x,y)

    vBot.standTime = now

end)

function standTime()

    return now - vBot.standTime

end

function relogOnCharacter(charName)

    local characters = g_ui.getRootWidget().charactersWindow.characters

    for index, child in ipairs(characters:getChildren()) do

        local name = child:getChildren()[1]:getText()

        if name:lower():find(charName:lower()) then

            child:focus()

            schedule(100, modules.client_entergame.CharacterList.doLogin)

        end

    end

end

function castSpell(text)

    if canCast(text) then

        say(text)

    end

end

local dmgTable = {}

local lastDmgMessage = now

onTextMessage(function(mode, text)

    if not text:lower():find("you lose") or not text:lower():find("due to") then

        return

    end

    local dmg = string.match(text, "%d+")

    if #dmgTable > 0 then

        for k, v in ipairs(dmgTable) do

            if now - v.t > 3000 then table.remove(dmgTable, k) end

        end

    end

    lastDmgMessage = now

    table.insert(dmgTable, {d = dmg, t = now})

    schedule(3050, function()

        if now - lastDmgMessage > 3000 then dmgTable = {} end

    end)

end)

-- based on data collected by callback calculates per second damage

-- returns number

function burstDamageValue()

    local d = 0

    local time = 0

    if #dmgTable > 1 then

        for i, v in ipairs(dmgTable) do

            if i == 1 then time = v.t end

            d = d + v.d

        end

    end

    return math.ceil(d / ((now - time) / 1000))

end

-- simplified function from modules

-- displays string as white colour message

function whiteInfoMessage(text)

    return modules.game_textmessage.displayGameMessage(text)

end

function statusMessage(text, logInConsole)

    return not logInConsole and modules.game_textmessage.displayFailureMessage(text) or modules.game_textmessage.displayStatusMessage(text)

end

-- same as above but red message

function broadcastMessage(text)

    return modules.game_textmessage.displayBroadcastMessage(text)

end

-- almost every talk action inside cavebot has to be done by using schedule

-- therefore this is simplified function that doesn't require to build a body for schedule function

function scheduleNpcSay(text, delay)

    if not text or not delay then return false end

    return schedule(delay, function() NPC.say(text) end)

end

-- returns first number in string, already formatted as number

-- returns number or nil

function getFirstNumberInText(text)

    local n = nil

    if string.match(text, "%d+") then n = tonumber(string.match(text, "%d+")) end

    return n

end

-- function to search if item of given ID can be found on certain tile

-- first argument is always ID

-- the rest of aguments can be:

-- - tile

-- - position

-- - or x,y,z coordinates as p1, p2 and p3

-- returns boolean

function isOnTile(id, p1, p2, p3)

    if not id then return end

    local tile

    if type(p1) == "table" then

        tile = g_map.getTile(p1)

    elseif type(p1) ~= "number" then

        tile = p1

    else

        local p = getPos(p1, p2, p3)

        tile = g_map.getTile(p)

    end

    if not tile then return end

    local item = false

    if #tile:getItems() ~= 0 then

        for i, v in ipairs(tile:getItems()) do

            if v:getId() == id then item = true end

        end

    else

        return false

    end

    return item

end

-- position is a special table, impossible to compare with normal one

-- this is translator from x,y,z to proper position value

-- returns position table

function getPos(x, y, z)

    if not x or not y or not z then return nil end

    local pos = pos()

    pos.x = x

    pos.y = y

    pos.z = z

    return pos

end

-- opens purse... that's it

function openPurse()

    return g_game.use(g_game.getLocalPlayer():getInventoryItem(

                          InventorySlotPurse))

end

-- check's whether container is full

-- c has to be container object

-- returns boolean

function containerIsFull(c)

    if not c then return false end

    if c:getCapacity() > #c:getItems() then

        return false

    else

        return true

    end

end

function dropItem(idOrObject)

    if type(idOrObject) == "number" then

        idOrObject = findItem(idOrObject)

    end

    g_game.move(idOrObject, pos(), idOrObject:getCount())

end

-- not perfect function to return whether character has utito tempo buff

-- known to be bugged if received debuff (ie. roshamuul)

-- TODO: simply a better version

-- returns boolean

function isBuffed()

    local var = false

    if not hasPartyBuff() then return var end

    local skillId = 0

    for i = 1, 4 do

        if player:getSkillBaseLevel(i) > player:getSkillBaseLevel(skillId) then

            skillId = i

        end

    end

    local premium = (player:getSkillLevel(skillId) - player:getSkillBaseLevel(skillId))

    local base = player:getSkillBaseLevel(skillId)

    if (premium / 100) * 305 > base then

        var = true

    end

    return var

end

-- if using index as table element, this can be used to properly assign new idex to all values

-- table needs to contain "index" as value

-- if no index in tables, it will create one

function reindexTable(t)

    if not t or type(t) ~= "table" then return end

    local i = 0

    for _, e in pairs(t) do

        i = i + 1

        e.index = i

    end

end

-- supports only new tibia, ver 10+

-- returns how many kills left to get next skull - can be red skull, can be black skull!

-- reutrns number

function killsToRs()

    return math.min(g_game.getUnjustifiedPoints().killsDayRemaining,

                    g_game.getUnjustifiedPoints().killsWeekRemaining,

                    g_game.getUnjustifiedPoints().killsMonthRemaining)

end

-- calculates exhaust for potions based on "Aaaah..." message

-- changes state of vBot variable, can be used in other scripts

-- already used in pushmax, healbot, etc

onTalk(function(name, level, mode, text, channelId, pos)

    if name ~= player:getName() then return end

    if mode ~= 34 then return end

    if text == "Aaaah..." then

        vBot.isUsingPotion = true

        schedule(950, function() vBot.isUsingPotion = false end)

    end

end)

-- [[ canCast and cast functions ]] --

-- callback connected to cast and canCast function

-- detects if a given spell was in fact casted based on player's text messages

-- Cast text and message text must match

-- checks only spells inserted in SpellCastTable by function cast

SpellCastTable = {}

onTalk(function(name, level, mode, text, channelId, pos)

    if name ~= player:getName() then return end

    text = text:lower()

    if SpellCastTable[text] then SpellCastTable[text].t = now end

end)

-- if delay is nil or delay is lower than 100 then this function will act as a normal say function

-- checks or adds a spell to SpellCastTable and updates cast time if exist

function cast(text, delay)

    text = text:lower()

    if type(text) ~= "string" then return end

    if not delay or delay < 100 then

        return say(text) -- if not added delay or delay is really low then just treat it like casual say

    end

    if not SpellCastTable[text] or SpellCastTable[text].d ~= delay then

        SpellCastTable[text] = {t = now - delay, d = delay}

        return say(text)

    end

    local lastCast = SpellCastTable[text].t

    local spellDelay = SpellCastTable[text].d

    if now - lastCast > spellDelay then return say(text) end

end

-- canCast is a base for AttackBot and HealBot

-- checks if spell is ready to be casted again

-- ignoreRL - if true, aparat from cooldown will also check conditions inside gamelib SpellInfo table

-- ignoreCd - it true, will ignore cooldown

-- returns boolean

local Spells = modules.gamelib.SpellInfo['Default']

function canCast(spell, ignoreRL, ignoreCd)

    if type(spell) ~= "string" then return end

    spell = spell:lower()

    if SpellCastTable[spell] then

        if now - SpellCastTable[spell].t > SpellCastTable[spell].d or ignoreCd then

            return true

        else

            return false

        end

    end

    if getSpellData(spell) then

        if (ignoreCd or not getSpellCoolDown(spell)) and

            (ignoreRL or level() >= getSpellData(spell).level and mana() >=

                getSpellData(spell).mana) then

            return true

        else

            return false

        end

    end

    -- if no data nor spell table then return true

    return true

end

local lastPhrase = ""

onTalk(function(name, level, mode, text, channelId, pos)

    if name == player:getName() then

        lastPhrase = text:lower()

    end

end)

if onSpellCooldown and onGroupSpellCooldown then

    onSpellCooldown(function(iconId, duration)

        schedule(1, function()

            if not vBot.customCooldowns[lastPhrase] then

                vBot.customCooldowns[lastPhrase] = {id = iconId}

            end

        end)

    end)

    onGroupSpellCooldown(function(iconId, duration)

        schedule(2, function()

            if vBot.customCooldowns[lastPhrase] then

                vBot.customCooldowns[lastPhrase] = {id = vBot.customCooldowns[lastPhrase].id, group = {[iconId] = duration}}

            end

        end)

    end)

else

    warn("Outdated OTClient! update to newest version to take benefits from all scripts!")

end

-- exctracts data about spell from gamelib SpellInfo table

-- returns table

-- ie:['Spell Name'] = {id, words, exhaustion, premium, type, icon, mana, level, soul, group, vocations}

-- cooldown detection module

function getSpellData(spell)

    if not spell then return false end

    spell = spell:lower()

    local t = nil

    local c = nil

    for k, v in pairs(Spells) do

        if v.words == spell then

            t = k

            break

        end

    end

    if not t then

        for k, v in pairs(vBot.customCooldowns) do

            if k == spell then

                c = {id = v.id, mana = 1, level = 1, group = v.group}

                break

            end

        end

    end

    if t then

        return Spells[t]

    elseif c then

        return c

    else

        return false

    end

end

-- based on info extracted by getSpellData checks if spell is on cooldown

-- returns boolean

function getSpellCoolDown(text)

    if not text then return nil end

    text = text:lower()

    local data = getSpellData(text)

    if not data then return false end

    local icon = modules.game_cooldown.isCooldownIconActive(data.id)

    local group = false

    for groupId, duration in pairs(data.group) do

        if modules.game_cooldown.isGroupCooldownIconActive(groupId) then

            group = true

            break

        end

    end

    if icon or group then

        return true

    else

        return false

    end

end

-- global var to indicate that player is trying to do something

-- prevents action blocking by scripts

-- below callbacks are triggers to changing the var state

local isUsingTime = now

macro(100, function()

    vBot.isUsing = now < isUsingTime and true or false

end)

onUse(function(pos, itemId, stackPos, subType)

    if pos.x > 65000 then return end

    if getDistanceBetween(player:getPosition(), pos) > 1 then return end

    local tile = g_map.getTile(pos)

    if not tile then return end

    local topThing = tile:getTopUseThing()

    if topThing:isContainer() then return end

    isUsingTime = now + 1000

end)

onUseWith(function(pos, itemId, target, subType)

    if pos.x < 65000 then isUsingTime = now + 1000 end

end)

-- returns first word in string

function string.starts(String, Start)

    return string.sub(String, 1, string.len(Start)) == Start

end

-- global tables for cached players to prevent unnecesary resource consumption

-- probably still can be improved, TODO in future

-- c can be creature or string

-- if exected then adds name or name and creature to tables

-- returns boolean

CachedFriends = {}

CachedEnemies = {}

function isFriend(c)

    local name = c

    if type(c) ~= "string" then

        if c == player then return true end

        name = c:getName()

    end

    if CachedFriends[c] then return true end

    if CachedEnemies[c] then return false end

    if table.find(storage.playerList.friendList, name) then

        CachedFriends[c] = true

        return true

    elseif vBot.BotServerMembers[name] ~= nil then

        CachedFriends[c] = true

        return true

    elseif storage.playerList.groupMembers then

        local p = c

        if type(c) == "string" then p = getCreatureByName(c, true) end

        if not p then return false end

        if p:isLocalPlayer() then return true end

        if p:isPlayer() then

            if p:isPartyMember() then

                CachedFriends[c] = true

                CachedFriends[p] = true

                return true

            end

        end

    else

        return false

    end

end

-- similar to isFriend but lighter version

-- accepts only name string

-- returns boolean

function isEnemy(c)

    local name = c

    local p

    if type(c) ~= "string" then

        if c == player then return false end

        name = c:getName()

        p = c

    end

    if not name then return false end

    if not p then

        p = getCreatureByName(name, true)

    end

    if not p then return end

    if p:isLocalPlayer() then return end

    if p:isPlayer() and table.find(storage.playerList.enemyList, name) or

        (storage.playerList.marks and not isFriend(name)) or p:getEmblem() == 2 then

        return true

    else

        return false

    end

end

function getPlayerDistribution()

    local friends = {}

    local neutrals = {}

    local enemies = {}

    for i, spec in ipairs(getSpectators()) do

        if spec:isPlayer() and not spec:isLocalPlayer() then

            if isFriend(spec) then

                table.insert(friends, spec)

            elseif isEnemy(spec) then

                table.insert(enemies, spec)

            else

                table.insert(neutrals, spec)

            end

        end

    end

    return friends, neutrals, enemies

end

function getFriends()

    local friends, neutrals, enemies = getPlayerDistribution()

    return friends

end

function getNeutrals()

    local friends, neutrals, enemies = getPlayerDistribution()

    return neutrals

end

function getEnemies()

    local friends, neutrals, enemies = getPlayerDistribution()

    return enemies

end

-- based on first word in string detects if text is a offensive spell

-- returns boolean

function isAttSpell(expr)

    if string.starts(expr, "exori") or string.starts(expr, "exevo") then

        return true

    else

        return false

    end

end

-- returns dressed-up item id based on not dressed id

-- returns number

function getActiveItemId(id)

    if not id then return false end

    if id == 3049 then

        return 3086

    elseif id == 3050 then

        return 3087

    elseif id == 3051 then

        return 3088

    elseif id == 3052 then

        return 3089

    elseif id == 3053 then

        return 3090

    elseif id == 3091 then

        return 3094

    elseif id == 3092 then

        return 3095

    elseif id == 3093 then

        return 3096

    elseif id == 3097 then

        return 3099

    elseif id == 3098 then

        return 3100

    elseif id == 16114 then

        return 16264

    elseif id == 23531 then

        return 23532

    elseif id == 23533 then

        return 23534

    elseif id == 23529 then

        return 23530

    elseif id == 30343 then -- Sleep Shawl

        return 30342

    elseif id == 30344 then -- Enchanted Pendulet

        return 30345

    elseif id == 30403 then -- Enchanted Theurgic Amulet

        return 30402

    elseif id == 31621 then -- Blister Ring

        return 31616

    elseif id == 32621 then -- Ring of Souls

        return 32635

    else

        return id

    end

end

-- returns not dressed item id based on dressed-up id

-- returns number

function getInactiveItemId(id)

    if not id then return false end

    if id == 3086 then

        return 3049

    elseif id == 3087 then

        return 3050

    elseif id == 3088 then

        return 3051

    elseif id == 3089 then

        return 3052

    elseif id == 3090 then

        return 3053

    elseif id == 3094 then

        return 3091

    elseif id == 3095 then

        return 3092

    elseif id == 3096 then

        return 3093

    elseif id == 3099 then

        return 3097

    elseif id == 3100 then

        return 3098

    elseif id == 16264 then

        return 16114

    elseif id == 23532 then

        return 23531

    elseif id == 23534 then

        return 23533

    elseif id == 23530 then

        return 23529

    elseif id == 30342 then -- Sleep Shawl

        return 30343

    elseif id == 30345 then -- Enchanted Pendulet

        return 30344

    elseif id == 30402 then -- Enchanted Theurgic Amulet

        return 30403

    elseif id == 31616 then -- Blister Ring

        return 31621

    elseif id == 32635 then -- Ring of Souls

        return 32621

    else

        return id

    end

end

-- returns amount of monsters within the range of position

-- does not include summons (new tibia)

-- returns number

function getMonstersInRange(pos, range)

    if not pos or not range then return false end

    local monsters = 0

    for i, spec in pairs(getSpectators()) do

        if spec:isMonster() and

            (g_game.getClientVersion() < 960 or spec:getType() < 3) and

            getDistanceBetween(pos, spec:getPosition()) < range then

            monsters = monsters + 1

        end

    end

    return monsters

end

-- shortcut in calculating distance from local player position

-- needs only one argument

-- returns number

function distanceFromPlayer(coords)

    if not coords then return false end

    return getDistanceBetween(pos(), coords)

end

-- returns amount of monsters within the range of local player position

-- does not include summons (new tibia)

-- can also check multiple floors

-- returns number

function getMonsters(range, multifloor)

    if not range then range = 10 end

    local mobs = 0;

    for _, spec in pairs(getSpectators(multifloor)) do

        mobs = (g_game.getClientVersion() < 960 or spec:getType() < 3) and

                   spec:isMonster() and distanceFromPlayer(spec:getPosition()) <=

                   range and mobs + 1 or mobs;

    end

    return mobs;

end

-- returns amount of players within the range of local player position

-- does not include party members

-- can also check multiple floors

-- returns number

function getPlayers(range, multifloor)

    if not range then range = 10 end

    local specs = 0;

    for _, spec in pairs(getSpectators(multifloor)) do

        if not spec:isLocalPlayer() and spec:isPlayer() and distanceFromPlayer(spec:getPosition()) <= range and not ((spec:getShield() ~= 1 and spec:isPartyMember()) or spec:getEmblem() == 1) then

            specs = specs + 1

        end

    end

    return specs;

end

-- this is multifloor function

-- checks if player added in "Anti RS list" in player list is within the given range

-- returns boolean

function isBlackListedPlayerInRange(range)

    if #storage.playerList.blackList == 0 then return end

    if not range then range = 10 end

    local found = false

    for _, spec in pairs(getSpectators(true)) do

        local specPos = spec:getPosition()

        local pPos = player:getPosition()

        if spec:isPlayer() then

            if math.abs(specPos.z - pPos.z) <= 2 then

                if specPos.z ~= pPos.z then specPos.z = pPos.z end

                if distanceFromPlayer(specPos) < range then

                    if table.find(storage.playerList.blackList, spec:getName()) then

                        found = true

                    end

                end

            end

        end

    end

    return found

end

-- checks if there is non-friend player withing the range

-- padding is only for multifloor

-- returns boolean

function isSafe(range, multifloor, padding)

    local onSame = 0

    local onAnother = 0

    if not multifloor and padding then

        multifloor = false

        padding = false

    end

    for _, spec in pairs(getSpectators(multifloor)) do

        if spec:isPlayer() and not spec:isLocalPlayer() and

            not isFriend(spec:getName()) then

            if spec:getPosition().z == posz() and

                distanceFromPlayer(spec:getPosition()) <= range then

                onSame = onSame + 1

            end

            if multifloor and padding and spec:getPosition().z ~= posz() and

                distanceFromPlayer(spec:getPosition()) <= (range + padding) then

                onAnother = onAnother + 1

            end

        end

    end

    if onSame + onAnother > 0 then

        return false

    else

        return true

    end

end

-- returns amount of players within the range of local player position

-- can also check multiple floors

-- returns number

function getAllPlayers(range, multifloor)

    if not range then range = 10 end

    local specs = 0;

    for _, spec in pairs(getSpectators(multifloor)) do

        specs = not spec:isLocalPlayer() and spec:isPlayer() and

                    distanceFromPlayer(spec:getPosition()) <= range and specs +

                    1 or specs;

    end

    return specs;

end

-- returns amount of NPC's within the range of local player position

-- can also check multiple floors

-- returns number

function getNpcs(range, multifloor)

    if not range then range = 10 end

    local npcs = 0;

    for _, spec in pairs(getSpectators(multifloor)) do

        npcs =

            spec:isNpc() and distanceFromPlayer(spec:getPosition()) <= range and

                npcs + 1 or npcs;

    end

    return npcs;

end

-- main function for calculatin item amount in all visible containers

-- also considers equipped items

-- returns number

function itemAmount(id)

    return player:getItemsCount(id)

end

-- self explanatory

-- a is item to use on

-- b is item to use a on

function useOnInvertoryItem(a, b)

    local item = findItem(b)

    if not item then return end

    return useWith(a, item)

end

-- pos can be tile or position

-- returns table of tiles surrounding given POS/tile

function getNearTiles(pos)

    if type(pos) ~= "table" then pos = pos:getPosition() end

    local tiles = {}

    local dirs = {

        {-1, 1}, {0, 1}, {1, 1}, {-1, 0}, {1, 0}, {-1, -1}, {0, -1}, {1, -1}

}

    for i = 1, #dirs do

        local tile = g_map.getTile({

            x = pos.x - dirs[i][1],

            y = pos.y - dirs[i][2],

            z = pos.z

})

        if tile then table.insert(tiles, tile) end

    end

    return tiles

end

-- self explanatory

-- use along with delay, it will only call action

function useGroundItem(id)

    if not id then return false end

    local dest = nil

    for i, tile in ipairs(g_map.getTiles(posz())) do

        for j, item in ipairs(tile:getItems()) do

            if item:getId() == id then

                dest = item

                break

            end

        end

    end

    if dest then

        return use(dest)

    else

        return false

    end

end

-- self explanatory

-- use along with delay, it will only call action

function reachGroundItem(id)

    if not id then return false end

    local dest = nil

    for i, tile in ipairs(g_map.getTiles(posz())) do

        for j, item in ipairs(tile:getItems()) do

            local iPos = item:getPosition()

            local iId = item:getId()

            if iId == id then

                if findPath(pos(), iPos, 20,

                            {ignoreNonPathable = true, precision = 1}) then

                    dest = item

                    break

                end

            end

        end

    end

    if dest then

        return autoWalk(iPos, 20, {ignoreNonPathable = true, precision = 1})

    else

        return false

    end

end

-- self explanatory

-- returns object

function findItemOnGround(id)

    for i, tile in ipairs(g_map.getTiles(posz())) do

        for j, item in ipairs(tile:getItems()) do

            if item:getId() == id then return item end

        end

    end

end

-- self explanatory

-- use along with delay, it will only call action

function useOnGroundItem(a, b)

    if not b then return false end

    local item = findItem(a)

    if not item then return false end

    local dest = nil

    for i, tile in ipairs(g_map.getTiles(posz())) do

        for j, item in ipairs(tile:getItems()) do

            if item:getId() == id then

                dest = item

                break

            end

        end

    end

    if dest then

        return useWith(item, dest)

    else

        return false

    end

end

-- returns target creature

function target()

    if not g_game.isAttacking() then

        return

    else

        return g_game.getAttackingCreature()

    end

end

-- returns target creature

function getTarget() return target() end

-- dist is boolean

-- returns target position/distance from player

function targetPos(dist)

    if not g_game.isAttacking() then return end

    if dist then

        return distanceFromPlayer(target():getPosition())

    else

        return target():getPosition()

    end

end

-- for gunzodus/ezodus only

-- it will reopen loot bag, necessary for depositer

function reopenPurse()

    for i, c in pairs(getContainers()) do

        if c:getName():lower() == "loot bag" or c:getName():lower() ==

            "store inbox" then g_game.close(c) end

    end

    schedule(100, function()

        g_game.use(g_game.getLocalPlayer():getInventoryItem(InventorySlotPurse))

    end)

    schedule(1400, function()

        for i, c in pairs(getContainers()) do

            if c:getName():lower() == "store inbox" then

                for _, i in pairs(c:getItems()) do

                    if i:getId() == 23721 then

                        g_game.open(i, c)

                    end

                end

            end

        end

    end)

    return CaveBot.delay(1500)

end

-- getSpectator patterns

-- param1 - pos/creature

-- param2 - pattern

-- param3 - type of return

-- 1 - everyone, 2 - monsters, 3 - players

-- returns number

function getCreaturesInArea(param1, param2, param3)

    local specs = 0

    local monsters = 0

    local players = 0

    for i, spec in pairs(getSpectators(param1, param2)) do

        if spec ~= player then

            specs = specs + 1

            if spec:isMonster() and

                (g_game.getClientVersion() < 960 or spec:getType() < 3) then

                monsters = monsters + 1

            elseif spec:isPlayer() and not isFriend(spec:getName()) then

                players = players + 1

            end

        end

    end

    if param3 == 1 then

        return specs

    elseif param3 == 2 then

        return monsters

    else

        return players

    end

end

-- can be improved

-- TODO in future

-- uses getCreaturesInArea, specType

-- returns number

function getBestTileByPatern(pattern, specType, maxDist, safe)

    if not pattern or not specType then return end

    if not maxDist then maxDist = 4 end

    local bestTile = nil

    local best = nil

    for _, tile in pairs(g_map.getTiles(posz())) do

        if distanceFromPlayer(tile:getPosition()) <= maxDist then

            local minimapColor = g_map.getMinimapColor(tile:getPosition())

            local stairs = (minimapColor >= 210 and minimapColor <= 213)

            if tile:canShoot() and tile:isWalkable() then

                if getCreaturesInArea(tile:getPosition(), pattern, specType) > 0 then

                    if (not safe or

                        getCreaturesInArea(tile:getPosition(), pattern, 3) == 0) then

                        local candidate =

{

                                pos = tile,

                                count = getCreaturesInArea(tile:getPosition(),

                                                           pattern, specType)

}

                        if not best or best.count <= candidate.count then

                            best = candidate

                        end

                    end

                end

            end

        end

    end

    bestTile = best

    if bestTile then

        return bestTile

    else

        return false

    end

end

-- returns container object based on name

function getContainerByName(name, notFull)

    if type(name) ~= "string" then return nil end

    local d = nil

    for i, c in pairs(getContainers()) do

        if c:getName():lower() == name:lower() and (not notFull or not containerIsFull(c)) then

            d = c

            break

        end

    end

    return d

end

-- returns container object based on container ID

function getContainerByItem(id, notFull)

    if type(id) ~= "number" then return nil end

    local d = nil

    for i, c in pairs(getContainers()) do

        if c:getContainerItem():getId() == id and (not notFull or not containerIsFull(c)) then

            d = c

            break

        end

    end

    return d

end

-- [[ ready to use getSpectators patterns ]] --

LargeUeArea = [[

    0000001000000

    0000011100000

    0000111110000

    0001111111000

    0011111111100

    0111111111110

    1111111111111

    0111111111110

    0011111111100

    0001111111000

    0000111110000

    0000011100000

    0000001000000

]]

NormalUeAreaMs = [[

    00000100000

    00011111000

    00111111100

    01111111110

    01111111110

    11111111111

    01111111110

    01111111110

    00111111100

    00001110000

    00000100000

]]

NormalUeAreaEd = [[

    00000100000

    00001110000

    00011111000

    00111111100

    01111111110

    11111111111

    01111111110

    00111111100

    00011111000

    00001110000

    00000100000

]]

smallUeArea = [[

    0011100

    0111110

    1111111

    1111111

    1111111

    0111110

    0011100

]]

largeRuneArea = [[

    0011100

    0111110

    1111111

    1111111

    1111111

    0111110

    0011100

]]

adjacentArea = [[

    111

    101

    111

]]

longBeamArea = [[

    0000000N0000000

    0000000N0000000

    0000000N0000000

    0000000N0000000

    0000000N0000000

    0000000N0000000

    0000000N0000000

    WWWWWWW0EEEEEEE

    0000000S0000000

    0000000S0000000

    0000000S0000000

    0000000S0000000

    0000000S0000000

    0000000S0000000

    0000000S0000000

]]

shortBeamArea = [[

    00000100000

    00000100000

    00000100000

    00000100000

    00000100000

    EEEEE0WWWWW

    00000S00000

    00000S00000

    00000S00000

    00000S00000

    00000S00000

]]

newWaveArea = [[

    000NNNNN000

    000NNNNN000

    0000NNN0000

    WW00NNN00EE

    WWWW0N0EEEE

    WWWWW0EEEEE

    WWWW0S0EEEE

    WW00SSS00EE

    0000SSS0000

    000SSSSS000

    000SSSSS000

]]

bigWaveArea = [[

    0000NNN0000

    0000NNN0000

    0000NNN0000

    00000N00000

    WWW00N00EEE

    WWWWW0EEEEE

    WWW00S00EEE

    00000S00000

    0000SSS0000

    0000SSS0000

    0000SSS0000

]]

smallWaveArea = [[

    00NNN00

    00NNN00

    WW0N0EE

    WWW0EEE

    WW0S0EE

    00SSS00

    00SSS00

]]

diamondArrowArea = [[

    01110

    11111

    11111

    11111

    01110

]]

```

---
# xeno_menu.lua
```lua

modules.game_interface.gameRootPanel.onMouseRelease = function(widget, mousePos, mouseButton)

    if mouseButton == 2 then

        local child = rootWidget:recursiveGetChildByPos(mousePos)

        if child == widget then

            local menu = g_ui.createWidget('PopupMenu')

            menu:setId("blzMenu")

            menu:setGameMenu(true)

            menu:addOption('AttackBot', AttackBot.show, "OTCv8")

            menu:addOption('HealBot', HealBot.show, "OTCv8")

            menu:addOption('Conditions', Conditions.show, "OTCv8")

            menu:addSeparator()

            menu:addOption('CaveBot', function()

                if CaveBot.isOn() then

                    CaveBot.setOff()

                else

                    CaveBot.setOn()

                end

            end, CaveBot.isOn() and "ON " or "OFF ")

            menu:addOption('TargetBot', function()

                if TargetBot.isOn() then

                    TargetBot.setOff()

                else

                    TargetBot.setOn()

                end

            end, TargetBot.isOn() and "ON " or "OFF ")

            menu:display(mousePos)

            return true

        end

    end

end

```

---


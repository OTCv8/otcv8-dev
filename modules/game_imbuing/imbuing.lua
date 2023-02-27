-- visual improvement by Vithrax#5814

local imbuingWindow
local bankGold = 0
local inventoryGold = 0
local itemImbuements = {}
local emptyImbue
local groupsCombo
local imbueLevelsCombo
local protectionBtn
local clearImbue
local selectedImbue
local imbueItems = {}
local protection = false
local clearConfirmWindow
local imbueConfirmWindow
local radio = UIRadioGroup.create()


local function getImbueImageClip(id)
  -- translate imbue
  local ids = {
    -- crit
    [22] = 1, [23] = 2, [24] = 3,
    -- death damage
    [13] = 4, [14] = 5, [15] = 6,
    -- earth damage
    [4] = 7, [5] = 8, [6] = 9,
    -- energy damage
    [10] = 10, [11] = 11, [12] = 12,
    -- fire damage
    [1] = 13, [2] = 14, [3] = 15,
    -- holy? damage
--    [x] = 16,
--    [x] = 17,
--    [x] = 18,    
    -- ice damage
    [7] = 19, [8] = 20, [9] = 21,
    -- ??? damage
--    [x] = 22,
--    [x] = 23,
--    [x] = 24,
    -- death protection
    [43] = 25, [44] = 26, [45] = 27,
    -- earth protection
    [46] = 28, [47] = 29, [48] = 30,
    -- energy protection
    [55] = 31, [56] = 32, [57] = 33,
    -- fire protection
    [49] = 34, [50] = 35, [51] = 36,
    -- holy protection
    [58] = 37, [59] = 38, [60] = 39,
    -- ice protection
    [52] = 40, [53] = 41, [54] = 42,
    -- ??? protection
--    [x] = 43,
--    [x] = 44,
--    [x] = 45,
    -- life leech
    [16] = 46, [17] = 47, [18] = 48,
    -- mana leech
    [19] = 49, [20] = 50, [21] = 51,
    -- axe 
    [25] = 52, [26] = 53, [27] = 54,
    -- club
    [61] = 55, [62] = 56, [63] = 57,
    -- dist
    [34] = 58, [35] = 59, [36] = 60,
    -- fist ??
--    [x] = 61,
--    [x] = 62,
--    [x] = 63,
    -- magic
    [40] = 64, [41] = 65, [42] = 66,
    -- shield
    [37] = 67, [38] = 68, [39] = 69,
    -- sword
    [31] = 70, [32] = 71, [33] = 72,
    -- speed
    [28] = 73, [29] = 74, [30] = 75,
    -- capacity
    [64] = 76, [65] = 77, [66] = 78,
    -- paralyze (?)
  }

  local n = ids[id]
  if not n then
    return false
  end

  return ({width = 64, height = 64, y = 0, x = n*64})
end

function init()
  connect(g_game, {
    onGameEnd = hide,
    onResourceBalance = onResourceBalance,
    onImbuementWindow = onImbuementWindow,
    onCloseImbuementWindow = onCloseImbuementWindow
  })

  imbuingWindow = g_ui.displayUI('imbuing')
  emptyImbue = imbuingWindow.emptyImbue
  groupsCombo = emptyImbue.groups
  imbueLevelsCombo = emptyImbue.imbuement
  protectionBtn = emptyImbue.protection
  clearImbue = imbuingWindow.clearImbue
  imbuingWindow:hide()

  groupsCombo.onOptionChange = function(widget)
    imbueLevelsCombo:clear()
    if itemImbuements ~= nil then
      local selectedGroup = groupsCombo:getCurrentOption().text
      for _,imbuement in ipairs(itemImbuements) do
        if imbuement["group"] == selectedGroup then
          emptyImbue.imbuement:addOption(imbuement["name"])          
        end
      end
      imbueLevelsCombo.onOptionChange(imbueLevelsCombo) -- update options
    end
  end

  imbueLevelsCombo.onOptionChange = function(widget)
    setProtection(false)
    local selectedGroup = groupsCombo:getCurrentOption().text
    for _,imbuement in ipairs(itemImbuements) do
      if imbuement["group"] == selectedGroup then
        if #imbuement["sources"] == widget.currentIndex then
          selectedImbue = imbuement
          for i,source in ipairs(imbuement["sources"]) do
            local enough = true
            for _,item in ipairs(imbueItems) do
              if item:getId() == source["item"]:getId() then
                if item:getCount() >= source["item"]:getCount() then
                  emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_green")
                  emptyImbue.imbue:setEnabled(true)
                  emptyImbue.requiredItems:getChildByIndex(i).count:setColor("#C0C0C0")
                end
                if item:getCount() < source["item"]:getCount() then
                  enough = false
                  emptyImbue.imbue:setEnabled(false)
                  emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_empty")
                  emptyImbue.requiredItems:getChildByIndex(i).count:setColor("#DD0000")
                end
                emptyImbue.requiredItems:getChildByIndex(i).count:setText(item:getCount() .. "/" .. source["item"]:getCount())
              end
            end
            emptyImbue.requiredItems:getChildByIndex(i).item:setItemId(source["item"]:getId())
            emptyImbue.requiredItems:getChildByIndex(i).item:setTooltip("The imbuement requires " .. source["description"] .. ".".. (enough and "" or " Unforunately you do not own the needed amount."))
          end
          for i = 3, widget.currentIndex + 1, -1 do
            emptyImbue.requiredItems:getChildByIndex(i).count:setText("")
            emptyImbue.requiredItems:getChildByIndex(i).item:setItemId(0)
            emptyImbue.requiredItems:getChildByIndex(i).item:setTooltip("")
          end
          emptyImbue.protectionCost.text:setText(comma_value(imbuement["protectionCost"]))
          emptyImbue.cost.text:setText(comma_value(imbuement["cost"]))
          if not protection and (bankGold + inventoryGold) < imbuement["cost"] then
            emptyImbue.imbue:setEnabled(false)
            emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_empty")
            emptyImbue.cost.text:setColor("#DD0000")
          end
          if not protection and (bankGold + inventoryGold) >= imbuement["cost"] then
            emptyImbue.cost.text:setColor("#C0C0C0")
          end
          if protection and (bankGold + inventoryGold) < (imbuement["cost"] + imbuement["protectionCost"]) then
            emptyImbue.imbue:setEnabled(false)
            emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_empty")
            emptyImbue.cost.text:setColor("#DD0000")
          end
          if protection and (bankGold + inventoryGold) >= (imbuement["cost"] + imbuement["protectionCost"]) then
            emptyImbue.cost.text:setColor("#C0C0C0")
          end
          emptyImbue.successRate:setText(imbuement["successRate"] .. "%")
          if selectedImbue["successRate"] > 50 then
            emptyImbue.successRate:setColor("#C0C0C0")
          else
            emptyImbue.successRate:setColor("#DD0000")
          end
          emptyImbue.description:setText(imbuement["description"])
        end
      end
    end
  end

  protectionBtn.onClick = function()
    setProtection(not protection)
  end
end

function setProtection(value)
  protection = value
  if protection then
    emptyImbue.cost.text:setText(comma_value(selectedImbue["cost"] + selectedImbue["protectionCost"]))
    emptyImbue.successRate:setText("100%")
    emptyImbue.successRate:setColor("#00DD00")
    protectionBtn:setImageClip(torect("66 0 66 66"))
  else
    if selectedImbue then
      emptyImbue.cost.text:setText(comma_value(selectedImbue["cost"]))
      emptyImbue.successRate:setText(selectedImbue["successRate"] .. "%")
      if selectedImbue["successRate"] > 50 then
        emptyImbue.successRate:setColor("#C0C0C0")
      else
        emptyImbue.successRate:setColor("#DD0000")
      end
    end
    protectionBtn:setImageClip(torect("0 0 66 66"))
  end
end

function terminate()
  disconnect(g_game, {
    onGameEnd = hide,
    onResourceBalance = onResourceBalance,
    onImbuementWindow = onImbuementWindow,
    onCloseImbuementWindow = onCloseImbuementWindow
  })
  
  imbuingWindow:destroy()
end

function resetSlots()
  emptyImbue:setVisible(false)
  clearImbue:setVisible(false)
  for i=1,3 do
    local slot = imbuingWindow.itemInfo.slots:getChildByIndex(i)
    slot:setEnabled(false)
    slot.image:setImageSource('/images/game/imbuing/slot_disabled')
    slot.image:setImageClip(torect("0 0 0 0"))
    slot:setTooltip("Items can have up to three imbuements slots. This slot is not available for this item.")
  end
end

function onHoverTooltip(widget)
  if not widget:isVisible() then return end
  local text = widget:getTooltip()
  text = text or ""

  imbuingWindow.tooltip:setText(text)
end

function selectSlot(widget, slotId, activeSlot)
  if activeSlot then
    emptyImbue:setVisible(false)
    clearImbue.title:setText('Clear Imbuement "' .. activeSlot[1]["name"] .. '"')
    clearImbue.groups:clear()
    clearImbue.groups:addOption(activeSlot[1]["group"])
    clearImbue.imbuement:clear()
    clearImbue.imbuement:addOption(activeSlot[1]["name"])
    clearImbue.description:setText(activeSlot[1]["description"])

    hours = string.format("%02.f", math.floor(activeSlot[2]/3600))
    mins = string.format("%02.f", math.floor(activeSlot[2]/60 - (hours*60)))
    clearImbue.time:setText(hours.."h "..mins.."min")
    local percent = (activeSlot[2]/72000) * 100
    clearImbue.time:setPercent(percent)

    clearImbue.cost.text:setText(comma_value(activeSlot[3]))
    if (bankGold + inventoryGold) < activeSlot[3] then
      emptyImbue.clear:setEnabled(false)
      emptyImbue.clear:setImageSource("/images/game/imbuing/imbue_empty")
      emptyImbue.cost.text:setColor("#DD0000")
    end

    local yesCallback = function()
      g_game.clearImbuement(slotId)
      if clearConfirmWindow then
        clearConfirmWindow:destroy()
        clearConfirmWindow=nil
      end
    end
    local noCallback = function()
      imbuingWindow:show()
      if clearConfirmWindow then
        clearConfirmWindow:destroy()
        clearConfirmWindow=nil
      end
    end

    clearImbue.clear.onClick = function()
      imbuingWindow:hide()
      clearConfirmWindow = displayGeneralBox(tr('Confirm Clearing'), tr('Do you wish to spend ' .. activeSlot[3] .. ' gold coins to clear the imbuement "' .. activeSlot[1]["name"] .. '" from your item?'), {
        { text=tr('Yes'), callback=yesCallback },
        { text=tr('No'), callback=noCallback },
        anchor=AnchorHorizontalCenter}, yesCallback, noCallback)
    end

    clearImbue:setVisible(true)
  else
    emptyImbue:setVisible(true)
    clearImbue:setVisible(false)

    local yesCallback = function()
      g_game.applyImbuement(slotId, selectedImbue["id"], protection)
      if clearConfirmWindow then
        clearConfirmWindow:destroy()
        clearConfirmWindow=nil
      end
      imbuingWindow:show()
    end
    local noCallback = function()
      imbuingWindow:show()
      if clearConfirmWindow then
        clearConfirmWindow:destroy()
        clearConfirmWindow=nil
      end
    end

    emptyImbue.imbue.onClick = function()
      imbuingWindow:hide()
      local cost = selectedImbue["cost"]
      local successRate = selectedImbue["successRate"]
      if protection then
        cost = cost + selectedImbue["protectionCost"]
        successRate = "100"
      end
      clearConfirmWindow = displayGeneralBox(tr('Confirm Imbuing Attempt'), 'You are about to imbue your item with "' .. selectedImbue["name"] .. '".\nYour chance to succeed is ' .. successRate .. '%. It will consume the required astral sources and '.. cost ..' gold coins.\nDo you wish to proceed?', {
        { text=tr('Yes'), callback=yesCallback },
        { text=tr('No'), callback=noCallback },
        anchor=AnchorHorizontalCenter}, yesCallback, noCallback)
    end
  end
end

function onImbuementWindow(itemId, slots, activeSlots, imbuements, needItems)
  if not itemId then
    return
  end
  resetSlots()
  imbueItems = table.copy(needItems)
  imbuingWindow.itemInfo.item:setItemId(itemId)

  radio.widgets = {}

  radio.onSelectionChange = function(widget, selected)
    if selected then
      if selected.active then
        selectSlot(selected, selected.n, selected.active)
      else
        selectSlot(selected, selected.n)
      end
    end
  end
  for i=1, slots do
    local slot = imbuingWindow.itemInfo.slots:getChildByIndex(i)
    slot.n = i - 1
    slot:setTooltip("Use this slot to imbue your item. Depending on the item you can have up to three different imbuements.")
    slot:setEnabled(true)
    slot.image:setImageSource('/images/game/imbuing/slot')
    slot.image:setImageClip(torect("1 1 62 62"))

    radio:addWidget(slot)

    if slot:getId() == "slot0" then
      radio:selectWidget(slot)
      selectSlot(slot, i - 1)
    end
  end

  for i, slot in pairs(activeSlots) do
    local activeSlotBtn = imbuingWindow.itemInfo.slots:getChildById("slot" .. i)
    local id = activeSlots[i][1].id

    activeSlotBtn.image:setImageSource('/images/game/imbuing/icons')
    activeSlotBtn.image:setImageClip(getImbueImageClip(id))
    activeSlotBtn.n = i
    activeSlotBtn.active = slot

    radio:addWidget(activeSlotBtn)

    if activeSlotBtn:getId() == "slot0" then
      radio:selectWidget(activeSlotBtn)
      selectSlot(activeSlotBtn, i, slot)
    end
  end

  if imbuements ~= nil then
    groupsCombo:clear()
    imbueLevelsCombo:clear()
    itemImbuements = table.copy(imbuements)
    for _,imbuement in ipairs(itemImbuements) do
      if not groupsCombo:isOption(imbuement["group"]) then
        groupsCombo:addOption(imbuement["group"])
      end
    end
  end
  show()
end

function onResourceBalance(type, balance)
  if type == 0 then
    bankGold = balance
  elseif type == 1 then
    inventoryGold = balance
  end
  if type == 0 or type == 1 then
    imbuingWindow.balance.text:setText(comma_value(bankGold + inventoryGold))
  end
end

function onCloseImbuementWindow()
  resetSlots()
end

function hide()
  g_game.closeImbuingWindow()
  imbuingWindow:hide()
end

function show()
  imbuingWindow:show()
  imbuingWindow:raise()
  imbuingWindow:focus()
end

function toggle()
  if imbuingWindow:isVisible() then
    return hide()
  end
  show()
end
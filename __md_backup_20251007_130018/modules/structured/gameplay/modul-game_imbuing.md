# ¦ Modul: `game_imbuing`

```lua

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

            for _,item in ipairs(imbueItems) do

              if item:getId() == source["item"]:getId() then

                if item:getCount() >= source["item"]:getCount() then

                  emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_green")

                  emptyImbue.imbue:setEnabled(true)

                  emptyImbue.requiredItems:getChildByIndex(i).count:setColor("white")

                end

                if item:getCount() < source["item"]:getCount() then

                  emptyImbue.imbue:setEnabled(false)

                  emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_empty")

                  emptyImbue.requiredItems:getChildByIndex(i).count:setColor("red")

                end

                emptyImbue.requiredItems:getChildByIndex(i).count:setText(item:getCount() .. "/" .. source["item"]:getCount())

              end

            end

            emptyImbue.requiredItems:getChildByIndex(i).item:setItemId(source["item"]:getId())

            emptyImbue.requiredItems:getChildByIndex(i).item:setTooltip("The imbuement requires " .. source["description"] .. ".")

          end

          for i = 3, widget.currentIndex + 1, -1 do

            emptyImbue.requiredItems:getChildByIndex(i).count:setText("")

            emptyImbue.requiredItems:getChildByIndex(i).item:setItemId(0)

            emptyImbue.requiredItems:getChildByIndex(i).item:setTooltip("")

          end

          emptyImbue.protectionCost:setText(imbuement["protectionCost"])

          emptyImbue.cost:setText(imbuement["cost"])

          if not protection and (bankGold + inventoryGold) < imbuement["cost"] then

            emptyImbue.imbue:setEnabled(false)

            emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_empty")

            emptyImbue.cost:setColor("red")

          end

          if not protection and (bankGold + inventoryGold) >= imbuement["cost"] then

            emptyImbue.cost:setColor("white")

          end

          if protection and (bankGold + inventoryGold) < (imbuement["cost"] + imbuement["protectionCost"]) then

            emptyImbue.imbue:setEnabled(false)

            emptyImbue.imbue:setImageSource("/images/game/imbuing/imbue_empty")

            emptyImbue.cost:setColor("red")

          end

          if protection and (bankGold + inventoryGold) >= (imbuement["cost"] + imbuement["protectionCost"]) then

            emptyImbue.cost:setColor("white")

          end

          emptyImbue.successRate:setText(imbuement["successRate"] .. "%")

          if selectedImbue["successRate"] > 50 then

            emptyImbue.successRate:setColor("white")

          else

            emptyImbue.successRate:setColor("red")

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

    emptyImbue.cost:setText(selectedImbue["cost"] + selectedImbue["protectionCost"])

    emptyImbue.successRate:setText("100%")

    emptyImbue.successRate:setColor("green")

    protectionBtn:setImageClip(torect("66 0 66 66"))

  else

    if selectedImbue then

      emptyImbue.cost:setText(selectedImbue["cost"])

      emptyImbue.successRate:setText(selectedImbue["successRate"] .. "%")

      if selectedImbue["successRate"] > 50 then

        emptyImbue.successRate:setColor("white")

      else

        emptyImbue.successRate:setColor("red")

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

    imbuingWindow.itemInfo.slots:getChildByIndex(i):setText("Slot " .. i)

    imbuingWindow.itemInfo.slots:getChildByIndex(i):setEnabled(false)

    imbuingWindow.itemInfo.slots:getChildByIndex(i):setTooltip("Items can have up to three imbuements slots. This slot is not available for this item.")

    imbuingWindow.itemInfo.slots:getChildByIndex(i).onClick = nil

  end

end

function selectSlot(widget, slotId, activeSlot)

  if activeSlot then

    emptyImbue:setVisible(false)

    widget:setText(activeSlot[1]["name"])

    clearImbue.title:setText('Clear Imbuement "' .. activeSlot[1]["name"] .. '"')

    clearImbue.groups:clear()

    clearImbue.groups:addOption(activeSlot[1]["group"])

    clearImbue.imbuement:clear()

    clearImbue.imbuement:addOption(activeSlot[1]["name"])

    clearImbue.description:setText(activeSlot[1]["description"])

    hours = string.format("%02.f", math.floor(activeSlot[2]/3600))

    mins = string.format("%02.f", math.floor(activeSlot[2]/60 - (hours*60)))

    clearImbue.time.timeRemaining:setText(hours..":"..mins.."h")

    clearImbue.cost:setText(activeSlot[3])

    if (bankGold + inventoryGold) < activeSlot[3] then

      emptyImbue.clear:setEnabled(false)

      emptyImbue.clear:setImageSource("/images/game/imbuing/imbue_empty")

      emptyImbue.cost:setColor("red")

    end

    local yesCallback = function()

      g_game.clearImbuement(slotId)

      widget:setText("Slot " .. (slotId + 1))

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

      widget:setText(selectedImbue["name"])

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

  for i=1, slots do

    local slot = imbuingWindow.itemInfo.slots:getChildByIndex(i)

    slot.onClick = function(widget)

      selectSlot(widget, i - 1)

    end

    slot:setTooltip("Use this slot to imbue your item. Depending on the item you can have up to three different imbuements.")

    slot:setEnabled(true)

    if slot:getId() == "slot0" then

      selectSlot(slot, i - 1)

    end

  end

  for i, slot in pairs(activeSlots) do

    local activeSlotBtn = imbuingWindow.itemInfo.slots:getChildById("slot" .. i)

    activeSlotBtn.onClick = function(widget)

      selectSlot(widget, i, slot)

    end

    if activeSlotBtn:getId() == "slot0" then

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

    imbuingWindow.balance:setText(tr("Balance") .. ":\n" .. (bankGold + inventoryGold))

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

```

---
# imbuing.otmod

```text

Module

  name: game_imbuing

  description: imbuing

  author: Vincent#1766 on discord

  website: http://otclient.ovh

  sandboxed: true

  scripts: [ imbuing ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# imbuing.otui

```otui

Slot < Button

  width: 70

  height: 66

  anchors.verticalCenter: parent.verticalCenter

  enabled: false

  text-wrap: true

  !tooltip: tr('Items can have up to three imbuements slots. This slot is not available for this item.')

RequiredItem < Panel

  width: 66

  height: 90

  UIItem

    id: item

    height: 66

    width: 66

    anchors.left: parent.left

    anchors.top: parent.top

  FlatLabel

    id: count

    margin-top: 5

    text-align: center

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

ItemInformation < Panel

  height: 100

  border: 1 black

  padding: 5

  Label

    id: title

    anchors.top: parent.top

    anchors.left: parent.left 

    anchors.right: parent.right

    text-align: center

    !text: tr("Item Information")

  UIItem

    id: item

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.VerticalCenter: parent.VerticalCenter

    margin-left: 10

    margin-top: 5

    height: 64

    width: 64

  Panel

    id: slots

    width: 240

    height: 66

    margin-top: 5

    anchors.VerticalCenter: parent.VerticalCenter

    anchors.top: prev.top

    anchors.right: parent.right

    Slot

      id: slot0

      !text: tr("Slot 1")

      text-align: center

      anchors.left: parent.left

    Slot

      id: slot1

      !text: tr("Slot 2")

      text-align: center

      margin-left: 10

      anchors.left: prev.right

    Slot

      id: slot2

      !text: tr("Slot 3")

      text-align: center

      margin-left: 10

      anchors.left: prev.right

  Label

    id: selectSlot

    margin-right: 15

    anchors.right: slots.left

    anchors.VerticalCenter: parent.VerticalCenter

    !text: tr("Select Slot:")

EmptyImbue < Panel

  height: 240

  border: 1 black

  padding: 5

  Label

    id: title

    anchors.top: parent.top

    anchors.left: parent.left 

    anchors.right: parent.right

    text-align: center

    !text: tr("Imbue Empty Slot")

  ComboBox

    id: groups

    anchors.top: title.bottom

    anchors.left: parent.left

    anchors.right: parent.HorizontalCenter

    margin-right: 3

    margin-top: 5

    isdisabled: true

  ComboBox

    id: imbuement

    anchors.top: prev.top

    anchors.left: groups.right

    anchors.right: parent.right

    margin-left: 3

  Label

    id: description

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 10

    height: 85

  Label

    id: info

    anchors.bottom: prev.bottom

    anchors.left: parent.left

    !text: tr('Requires the following astral sources:')

  Label

    id: successRate

    anchors.top: info.top

    anchors.right: parent.right

    width: 35

    text-align: right

  Label

    id: successRateTitle

    anchors.top: info.top

    anchors.right: successRate.left

    margin-right: 15

    !text: tr('Success Rate:')

  Panel

    id: requiredItems

    width: 210

    height: 90

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    RequiredItem

      id: item1

      anchors.left: parent.left

    RequiredItem

      id: item2

      margin-left: 10

      anchors.left: prev.right

    RequiredItem

      id: item3

      margin-left: 10

      anchors.left: prev.right

  UIButton

    id: protection

    width: 66

    height: 66

    anchors.top: prev.top

    anchors.left: prev.right

    image-source: /images/game/imbuing/100percent

    image-clip: 0 0 66 66

    margin-left: 15

    !tooltip: ("Bribe the fates! Click here to raise your chance to 100%. For guaranteed success use gold.")

  FlatLabel

    id: protectionCost

    margin-top: 5

    text-align: center

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

  UIWidget

    id: horizontalArrow

    anchors.left: prev.right

    anchors.verticalCenter: requiredItems.verticalCenter

    margin-left: 45

    width: 12

    height: 21

    image-source: /images/ui/arrow_horizontal

    image-rect: 0 0 12 21

    image-clip: 12 0 12 21

    phantom: false

  UIButton

    id: imbue

    width: 128

    height: 66

    anchors.top: requiredItems.top

    anchors.right: parent.right

    image-source: /images/game/imbuing/imbue_empty

    image-clip: 0 0 128 66

    margin-left: 15

    !tooltip: tr("Click here to carry out the selected imbuement. This will consume the required astral sources and gold.")

    $pressed:

      image-clip: 0 66 128 66

  FlatLabel

    id: cost

    margin-top: 5

    text-align: center

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

ClearImbue < Panel

  height: 240

  border: 1 black

  padding: 5

  Label

    id: title

    anchors.top: parent.top

    anchors.left: parent.left 

    anchors.right: parent.right

    text-align: center

    !text: tr("Clear Imbuement")

  ComboBox

    id: groups

    anchors.top: title.bottom

    anchors.left: parent.left

    anchors.right: parent.HorizontalCenter

    margin-right: 3

    margin-top: 5

    enabled: false

  ComboBox

    id: imbuement

    anchors.top: prev.top

    anchors.left: groups.right

    anchors.right: parent.right

    margin-left: 3

    enabled: false

  Label

    id: description

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 10

    height: 85

  Label

    id: info

    anchors.bottom: prev.bottom

    anchors.left: parent.left

    !text: tr('Time remaining:')

  Label

    id: clearImbuementTitle

    anchors.top: info.top

    anchors.right: parent.right

    !text: tr('Clear imbuement:')

  Panel

    id: time

    width: 210

    height: 90

    anchors.left: parent.left

    anchors.bottom: parent.bottom

    FlatLabel

      id: timeRemaining

      size: 86 25

      margin-bottom: 20

      text-align: center

      anchors.left: parent.left

      anchors.right: parent.right

      anchors.verticalCenter: parent.verticalCenter

  UIButton

    id: clear

    width: 128

    height: 66

    anchors.top: time.top

    anchors.right: parent.right

    image-source: /images/game/imbuing/clear

    image-clip: 0 0 128 66

    margin-left: 15

    !tooltip: tr("Your needs have changed? Click here to clear the imbuement from your item for a fee.")

    $pressed:

      image-clip: 0 66 128 66

  FlatLabel

    id: cost

    margin-top: 5

    text-align: center

    anchors.left: prev.left

    anchors.right: prev.right

    anchors.top: prev.bottom

MainWindow

  id: imbuingWindow

  !text: tr('Imbue Item')

  size: 550 430

  background-color: #AAAAAA

  @onEscape: modules.game_imbuing.hide()

  ItemInformation

    id: itemInfo

    anchors.left: parent.left

    anchors.top: parent.top

    anchors.right: parent.right

  EmptyImbue

    id: emptyImbue

    anchors.left: parent.left

    anchors.top: prev.bottom

    anchors.right: parent.right

    margin-top: 5

  ClearImbue

    id: clearImbue

    anchors.left: parent.left

    anchors.top: emptyImbue.top

    anchors.right: parent.right

  Button

    id: close

    !text: tr('Close')

    width: 50

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    @onClick: modules.game_imbuing.hide()

  Label

    id: balance

    height: 25

    anchors.right: prev.left

    anchors.left: parent.left

    anchors.bottom: parent.bottom

```

---

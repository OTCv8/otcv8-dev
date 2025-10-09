# ¦ Modul: `gamelib/ui`

```lua

-- @docclass

UICreatureButton = extends(UIWidget, "UICreatureButton")

local CreatureButtonColors = {

  onIdle = {notHovered = '#888888', hovered = '#FFFFFF' },

  onTargeted = {notHovered = '#FF0000', hovered = '#FF8888' },

  onFollowed = {notHovered = '#00FF00', hovered = '#88FF88' }

}

local LifeBarColors = {} -- Must be sorted by percentAbove

table.insert(LifeBarColors, {percentAbove = 92, color = '#00BC00' } )

table.insert(LifeBarColors, {percentAbove = 60, color = '#50A150' } )

table.insert(LifeBarColors, {percentAbove = 30, color = '#A1A100' } )

table.insert(LifeBarColors, {percentAbove = 8, color = '#BF0A0A' } )

table.insert(LifeBarColors, {percentAbove = 3, color = '#910F0F' } )

table.insert(LifeBarColors, {percentAbove = -1, color = '#850C0C' } )

function UICreatureButton.create()

  local button = UICreatureButton.internalCreate()

  button:setFocusable(false)

  button.creature = nil

  button.isHovered = false

  return button

end

function UICreatureButton:setCreature(creature)

    self.creature = creature

end

function UICreatureButton:getCreature()

  return self.creature

end

function UICreatureButton:getCreatureId()

    return self.creature:getId()

end

function UICreatureButton:setup(id)

  self.lifeBarWidget = self:getChildById('lifeBar')

  self.creatureWidget = self:getChildById('creature')

  self.labelWidget = self:getChildById('label')

  self.skullWidget = self:getChildById('skull')

  self.emblemWidget = self:getChildById('emblem')

end

function UICreatureButton:update()

  local color = CreatureButtonColors.onIdle

  local show = false

  if self.creature == g_game.getAttackingCreature() then

    color = CreatureButtonColors.onTargeted

  elseif self.creature == g_game.getFollowingCreature() then

    color = CreatureButtonColors.onFollowed

  end

  color = self.isHovered and color.hovered or color.notHovered

  if self.color == color then

    return

  end

  self.color = color

  if color ~= CreatureButtonColors.onIdle.notHovered then

    self.creatureWidget:setBorderWidth(1)

    self.creatureWidget:setBorderColor(color)

    self.labelWidget:setColor(color)

  else

    self.creatureWidget:setBorderWidth(0)

    self.labelWidget:setColor(color)

  end

end

function UICreatureButton:creatureSetup(creature)

	if self.creature ~= creature then

		self.creature = creature

		self.creatureWidget:setCreature(creature)	

    if self.creatureName ~= creature:getName() then

      self.creatureName = creature:getName()

      self.labelWidget:setText(creature:getName())

    end

	end

	self:updateLifeBarPercent()

	self:updateSkull()

	self:updateEmblem()

  self:update()

end

function UICreatureButton:updateSkull()

  if not self.creature then

    return

  end

  local skullId = self.creature:getSkull()

  if skullId == self.skullId then

    return

  end

  self.skullId = skullId

  if skullId ~= SkullNone then

    self.skullWidget:setWidth(self.skullWidget:getHeight())

    local imagePath = getSkullImagePath(skullId)

    self.skullWidget:setImageSource(imagePath)

    self.labelWidget:setMarginLeft(5)

  else

    self.skullWidget:setWidth(0)

    if self.creature:getEmblem() == EmblemNone then

      self.labelWidget:setMarginLeft(2)

    end

  end

end

function UICreatureButton:updateEmblem()

  if not self.creature then

    return

  end

  local emblemId = self.creature:getEmblem()

  if self.emblemId == emblemId then

    return

  end

  self.emblemId = emblemId

  if emblemId ~= EmblemNone then

    self.emblemWidget:setWidth(self.emblemWidget:getHeight())

    local imagePath = getEmblemImagePath(emblemId)

    self.emblemWidget:setImageSource(imagePath)

    self.emblemWidget:setMarginLeft(5)

    self.labelWidget:setMarginLeft(5)

  else

    self.emblemWidget:setWidth(0)

    self.emblemWidget:setMarginLeft(0)

    if self.creature:getSkull() == SkullNone then

      self.labelWidget:setMarginLeft(2)

    end

  end

end

function UICreatureButton:updateLifeBarPercent()

  if not self.creature then

    return

  end

  local percent = self.creature:getHealthPercent()

  if self.percent == percent then

    return

  end

  self.percent = percent

  self.lifeBarWidget:setPercent(percent)

  local color

  for i, v in pairs(LifeBarColors) do

    if percent > v.percentAbove then

      color = v.color

      break

    end

  end

  self.lifeBarWidget:setBackgroundColor(color)

end

```

---
# uiitem.lua

```lua

function UIItem:onDragEnter(mousePos)

  if self:isVirtual() then return false end

  local item = self:getItem()

  if not item then return false end

  self:setBorderWidth(1)

  self.currentDragThing = item

  g_mouse.pushCursor('target')

  return true

end

function UIItem:onDragLeave(droppedWidget, mousePos)

  if self:isVirtual() then return false end

  self.currentDragThing = nil

  g_mouse.popCursor('target')

  self:setBorderWidth(0)

  self.hoveredWho = nil

  return true

end

function UIItem:onDrop(widget, mousePos, forced)

  if not self:canAcceptDrop(widget, mousePos) and not forced then return false end

  local item = widget.currentDragThing

  if not item or not item:isItem() then return false end

  if self.selectable then

    if item:isPickupable() then

      self:setItem(Item.create(item:getId(), item:getCountOrSubType()))

      return true

    end

    return false

  end

  local toPos = self.position

  local itemPos = item:getPosition()

  if itemPos.x == toPos.x and itemPos.y == toPos.y and itemPos.z == toPos.z then return false end

  if item:getCount() > 1 then

    modules.game_interface.moveStackableItem(item, toPos)

  else

    g_game.move(item, toPos, 1)

  end

  self:setBorderWidth(0)

  return true

end

function UIItem:onDestroy()

  if self == g_ui.getDraggingWidget() and self.hoveredWho then

    self.hoveredWho:setBorderWidth(0)

  end

  if self.hoveredWho then

    self.hoveredWho = nil

  end

end

function UIItem:onHoverChange(hovered)

  UIWidget.onHoverChange(self, hovered)

  if self:isVirtual() or not self:isDraggable() then return end

  local draggingWidget = g_ui.getDraggingWidget()

  if draggingWidget and self ~= draggingWidget then

    local gotMap = draggingWidget:getClassName() == 'UIGameMap'

    local gotItem = draggingWidget:getClassName() == 'UIItem' and not draggingWidget:isVirtual()

    if hovered and (gotItem or gotMap) then

      self:setBorderWidth(1)

      draggingWidget.hoveredWho = self

    else

      self:setBorderWidth(0)

      draggingWidget.hoveredWho = nil

    end

  end

end

function UIItem:onMouseRelease(mousePosition, mouseButton)

  if self.cancelNextRelease then

    self.cancelNextRelease = false

    return true

  end

  if self:isVirtual() then return false end

  local item = self:getItem()

  if not item or not self:containsPoint(mousePosition) then return false end

  if modules.client_options.getOption('classicControl') and not g_app.isMobile() and

     ((g_mouse.isPressed(MouseLeftButton) and mouseButton == MouseRightButton) or

      (g_mouse.isPressed(MouseRightButton) and mouseButton == MouseLeftButton)) then

    g_game.look(item)

    self.cancelNextRelease = true

    return true

  elseif modules.game_interface.processMouseAction(mousePosition, mouseButton, nil, item, item, nil, nil) then

    return true

  end

  return false

end

function UIItem:canAcceptDrop(widget, mousePos)

  if not self.selectable and (self:isVirtual() or not self:isDraggable()) then return false end

  if not widget or not widget.currentDragThing then return false end

  local children = rootWidget:recursiveGetChildrenByPos(mousePos)

  for i=1,#children do

    local child = children[i]

    if child == self then

      return true

    elseif not child:isPhantom() then

      return false

    end

  end

  error('Widget ' .. self:getId() .. ' not in drop list.')

  return false

end

function UIItem:onClick(mousePos)

  if not self.selectable or not self.editable then

    return

  end

  if modules.game_itemselector then

    modules.game_itemselector.show(self)

  end

end

function UIItem:onItemChange()

  local tooltip = nil

  if self:getItem() and self:getItem():getTooltip():len() > 0 then

    tooltip = self:getItem():getTooltip()

  end

  self:setTooltip(tooltip)

end

```

---
# uiminimap.lua

```lua

function UIMinimap:onCreate()

  self.autowalk = true

end

function UIMinimap:onSetup()

  self.flagWindow = nil

  self.flags = {}

  self.alternatives = {}

  self.onAddAutomapFlag = function(pos, icon, description) self:addFlag(pos, icon, description) end

  self.onRemoveAutomapFlag = function(pos, icon, description) self:removeFlag(pos, icon, description) end

  connect(g_game, {

    onAddAutomapFlag = self.onAddAutomapFlag,

    onRemoveAutomapFlag = self.onRemoveAutomapFlag,

})

end

function UIMinimap:onDestroy()

  for _,widget in pairs(self.alternatives) do

    widget:destroy()

  end

  self.alternatives = {}

  disconnect(g_game, {

    onAddAutomapFlag = self.onAddAutomapFlag,

    onRemoveAutomapFlag = self.onRemoveAutomapFlag,

})

  self:destroyFlagWindow()

  self.flags = {}

end

function UIMinimap:onVisibilityChange()

  if not self:isVisible() then

    self:destroyFlagWindow()

  end

end

function UIMinimap:onCameraPositionChange(cameraPos)

  if self.cross then

    self:setCrossPosition(self.cross.pos)

  end

end

function UIMinimap:hideFloor()

  self.floorUpWidget:hide()

  self.floorDownWidget:hide()

end

function UIMinimap:hideZoom()

  self.zoomInWidget:hide()

  self.zoomOutWidget:hide()

end

function UIMinimap:disableAutoWalk()

  self.autowalk = false

end

function UIMinimap:load()

  local settings = g_settings.getNode('Minimap')

  if settings then

    if settings.flags then

      for _,flag in pairs(settings.flags) do

        self:addFlag(flag.position, flag.icon, flag.description)

      end

    end

    self:setZoom(settings.zoom)

  end

end

function UIMinimap:save()

  local settings = { flags={} }

  for _,flag in pairs(self.flags) do

    if not flag.temporary then

      table.insert(settings.flags, {

        position = flag.pos,

        icon = flag.icon,

        description = flag.description,

})

    end

  end

  settings.zoom = self:getZoom()

  g_settings.setNode('Minimap', settings)

end

local function onFlagMouseRelease(widget, pos, button)

  if button == MouseRightButton then

    local menu = g_ui.createWidget('PopupMenu')

    menu:setGameMenu(true)

    menu:addOption(tr('Delete mark'), function() widget:destroy() end)

    menu:display(pos)

    return true

  end

  return false

end

function UIMinimap:setCrossPosition(pos)

  local cross = self.cross

  if not self.cross then

    cross = g_ui.createWidget('MinimapCross', self)

    cross:setIcon('/images/game/minimap/cross')

    self.cross = cross

  end

  pos.z = self:getCameraPosition().z

  cross.pos = pos

  if pos then

    self:centerInPosition(cross, pos)

  else

    cross:breakAnchors()

  end

end

function UIMinimap:addFlag(pos, icon, description, temporary)

  if not pos or not icon then return end

  local flag = self:getFlag(pos, icon, description)

  if flag or not icon then

    return

  end

  temporary = temporary or false

  flag = g_ui.createWidget('MinimapFlag')

  self:insertChild(1, flag)

  flag.pos = pos

  flag.description = description

  flag.icon = icon

  flag.temporary = temporary

  if type(tonumber(icon)) == 'number' then

    flag:setIcon('/images/game/minimap/flag' .. icon)

  else

    flag:setIcon(resolvepath(icon, 1))

  end

  flag:setTooltip(description)

  flag.onMouseRelease = onFlagMouseRelease

  flag.onDestroy = function() table.removevalue(self.flags, flag) end

  table.insert(self.flags, flag)

  self:centerInPosition(flag, pos)

end

function UIMinimap:addAlternativeWidget(widget, pos, maxZoom)

  widget.pos = pos

  widget.maxZoom = maxZoom or 0

  widget.minZoom = minZoom

  table.insert(self.alternatives, widget)

end

function UIMinimap:setAlternativeWidgetsVisible(show)

  local layout = self:getLayout()

  layout:disableUpdates()

  for _,widget in pairs(self.alternatives) do

    if show then

      self:insertChild(1, widget)

      self:centerInPosition(widget, widget.pos)

    else

      self:removeChild(widget)

    end

  end

  layout:enableUpdates()

  layout:update()

end

function UIMinimap:onZoomChange(zoom)

  for _,widget in pairs(self.alternatives) do

    if (not widget.minZoom or widget.minZoom >= zoom) and widget.maxZoom <= zoom then

      widget:show()

    else

      widget:hide()

    end

  end

end

function UIMinimap:getFlag(pos)

  for _,flag in pairs(self.flags) do

    if flag.pos.x == pos.x and flag.pos.y == pos.y and flag.pos.z == pos.z then

      return flag

    end

  end

  return nil

end

function UIMinimap:removeFlag(pos, icon, description)

  local flag = self:getFlag(pos)

  if flag then

    flag:destroy()

  end

end

function UIMinimap:reset()

  self:setZoom(0)

  if self.cross then

    self:setCameraPosition(self.cross.pos)

  end

end

function UIMinimap:move(x, y)

  local cameraPos = self:getCameraPosition()

  local scale = self:getScale()

  if scale > 1 then scale = 1 end

  local dx = x/scale

  local dy = y/scale

  local pos = {x = cameraPos.x - dx, y = cameraPos.y - dy, z = cameraPos.z}

  self:setCameraPosition(pos)

end

function UIMinimap:onMouseWheel(mousePos, direction)

  local keyboardModifiers = g_keyboard.getModifiers()

  if direction == MouseWheelUp and keyboardModifiers == KeyboardNoModifier then

    self:zoomIn()

  elseif direction == MouseWheelDown and keyboardModifiers == KeyboardNoModifier then

    self:zoomOut()

  elseif direction == MouseWheelDown and keyboardModifiers == KeyboardCtrlModifier then

    self:floorUp(1)

  elseif direction == MouseWheelUp and keyboardModifiers == KeyboardCtrlModifier then

    self:floorDown(1)

  end

end

function UIMinimap:onMousePress(pos, button)

  if not self:isDragging() then

    self.allowNextRelease = true

  end

end

function UIMinimap:onMouseRelease(pos, button)

  if not self.allowNextRelease then return true end

  self.allowNextRelease = false

  local mapPos = self:getTilePosition(pos)

  if not mapPos then return end

  if button == MouseLeftButton then

    local player = g_game.getLocalPlayer()

    if self.autowalk then

      player:autoWalk(mapPos)

    end

    return true

  elseif button == MouseRightButton then

    local menu = g_ui.createWidget('PopupMenu')

    menu:setGameMenu(true)

    menu:addOption(tr('Create mark'), function() self:createFlagWindow(mapPos) end)

    menu:display(pos)

    return true

  end

  return false

end

function UIMinimap:onDragEnter(pos)

  self.dragReference = pos

  self.dragCameraReference = self:getCameraPosition()

  return true

end

function UIMinimap:onDragMove(pos, moved)

  local scale = self:getScale()

  local dx = (self.dragReference.x - pos.x)/scale

  local dy = (self.dragReference.y - pos.y)/scale

  local pos = {x = self.dragCameraReference.x + dx, y = self.dragCameraReference.y + dy, z = self.dragCameraReference.z}

  self:setCameraPosition(pos)

  return true

end

function UIMinimap:onDragLeave(widget, pos)

  return true

end

function UIMinimap:onStyleApply(styleName, styleNode)

  for name,value in pairs(styleNode) do

    if name == 'autowalk' then

      self.autowalk = value

    end

  end

end

function UIMinimap:createFlagWindow(pos)

  if self.flagWindow then return end

  if not pos then return end

  self.flagWindow = g_ui.createWidget('MinimapFlagWindow', rootWidget)

  local positionLabel = self.flagWindow:getChildById('position')

  local description = self.flagWindow:getChildById('description')

  local okButton = self.flagWindow:getChildById('okButton')

  local cancelButton = self.flagWindow:getChildById('cancelButton')

  positionLabel:setText(string.format('%i, %i, %i', pos.x, pos.y, pos.z))

  local flagRadioGroup = UIRadioGroup.create()

  for i=0,19 do

    local checkbox = self.flagWindow:getChildById('flag' .. i)

    checkbox.icon = i

    flagRadioGroup:addWidget(checkbox)

  end

  flagRadioGroup:selectWidget(flagRadioGroup:getFirstWidget())

  local successFunc = function()

    self:addFlag(pos, flagRadioGroup:getSelectedWidget().icon, description:getText())

    self:destroyFlagWindow()

  end

  local cancelFunc = function()

    self:destroyFlagWindow()

  end

  okButton.onClick = successFunc

  cancelButton.onClick = cancelFunc

  self.flagWindow.onEnter = successFunc

  self.flagWindow.onEscape = cancelFunc

  self.flagWindow.onDestroy = function() flagRadioGroup:destroy() end

end

function UIMinimap:destroyFlagWindow()

  if self.flagWindow then

    self.flagWindow:destroy()

    self.flagWindow = nil

  end

end

```

---

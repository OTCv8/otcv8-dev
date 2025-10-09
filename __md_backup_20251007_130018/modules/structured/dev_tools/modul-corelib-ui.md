# ¦ Modul: `corelib/ui`

```lua

-- @docclass

g_effects = {}

function g_effects.fadeIn(widget, time, elapsed)

  if not elapsed then elapsed = 0 end

  if not time then time = 300 end

  widget:setOpacity(math.min(elapsed/time, 1))

  removeEvent(widget.fadeEvent)

  if elapsed < time then

    removeEvent(widget.fadeEvent)

    widget.fadeEvent = scheduleEvent(function()

      g_effects.fadeIn(widget, time, elapsed + 30)

    end, 30)

  else

    widget.fadeEvent = nil

  end

end

function g_effects.fadeOut(widget, time, elapsed)

  if not elapsed then elapsed = 0 end

  if not time then time = 300 end

  elapsed = math.max((1 - widget:getOpacity()) * time, elapsed)

  removeEvent(widget.fadeEvent)

  widget:setOpacity(math.max((time - elapsed)/time, 0))

  if elapsed < time then

    widget.fadeEvent = scheduleEvent(function()

      g_effects.fadeOut(widget, time, elapsed + 30)

    end, 30)

  else

    widget.fadeEvent = nil

  end

end

function g_effects.cancelFade(widget)

  removeEvent(widget.fadeEvent)

  widget.fadeEvent = nil

end

function g_effects.startBlink(widget, duration, interval, clickCancel)

  duration = duration or 0 -- until stop is called

  interval = interval or 500

  clickCancel = clickCancel or true

  removeEvent(widget.blinkEvent)

  removeEvent(widget.blinkStopEvent)

  widget.blinkEvent = cycleEvent(function()

    widget:setOn(not widget:isOn())

  end, interval)

  if duration > 0 then

    widget.blinkStopEvent = scheduleEvent(function()

      g_effects.stopBlink(widget)

    end, duration)

  end

  connect(widget, { onClick = g_effects.stopBlink })

end

function g_effects.stopBlink(widget)

  disconnect(widget, { onClick = g_effects.stopBlink })

  removeEvent(widget.blinkEvent)

  removeEvent(widget.blinkStopEvent)

  widget.blinkEvent = nil

  widget.blinkStopEvent = nil

  widget:setOn(false)

end

```

---
# tooltip.lua

```lua

-- @docclass

g_tooltip = {}

-- private variables

local toolTipLabel

local currentHoveredWidget

-- private functions

local function moveToolTip(first)

  if not first and (not toolTipLabel:isVisible() or toolTipLabel:getOpacity() < 0.1) then return end

  local pos = g_window.getMousePosition()

  local windowSize = g_window.getSize()

  local labelSize = toolTipLabel:getSize()

  pos.x = pos.x + 1

  pos.y = pos.y + 1

  if windowSize.width - (pos.x + labelSize.width) < 10 then

    pos.x = pos.x - labelSize.width - 3

  else

    pos.x = pos.x + 10

  end

  if windowSize.height - (pos.y + labelSize.height) < 10 then

    pos.y = pos.y - labelSize.height - 3

  else

    pos.y = pos.y + 10

  end

  toolTipLabel:setPosition(pos)

end

local function onWidgetHoverChange(widget, hovered)

  if hovered then

    if widget.tooltip and not g_mouse.isPressed() then

      g_tooltip.display(widget.tooltip)

      currentHoveredWidget = widget

    end

  else

    if widget == currentHoveredWidget then

      g_tooltip.hide()

      currentHoveredWidget = nil

    end

  end

end

local function onWidgetStyleApply(widget, styleName, styleNode)

  if styleNode.tooltip then

    widget.tooltip = styleNode.tooltip

  end

end

-- public functions

function g_tooltip.init()

  connect(UIWidget, {  onStyleApply = onWidgetStyleApply,

                       onHoverChange = onWidgetHoverChange})

  addEvent(function()

    toolTipLabel = g_ui.createWidget('UILabel', rootWidget)

    toolTipLabel:setId('toolTip')

    toolTipLabel:setBackgroundColor('#111111cc')

    toolTipLabel:setTextAlign(AlignCenter)

    toolTipLabel:hide()

  end)

end

function g_tooltip.terminate()

  disconnect(UIWidget, { onStyleApply = onWidgetStyleApply,

                         onHoverChange = onWidgetHoverChange })

  currentHoveredWidget = nil

  toolTipLabel:destroy()

  toolTipLabel = nil

  g_tooltip = nil

end

function g_tooltip.display(text)

  if text == nil or text:len() == 0 then return end

  if not toolTipLabel then return end

  toolTipLabel:setText(text)

  toolTipLabel:resizeToText()

  toolTipLabel:resize(toolTipLabel:getWidth() + 4, toolTipLabel:getHeight() + 4)

  toolTipLabel:show()

  toolTipLabel:raise()

  toolTipLabel:enable()

  g_effects.fadeIn(toolTipLabel, 100)

  moveToolTip(true)

  connect(rootWidget, {

    onMouseMove = moveToolTip,

})

end

function g_tooltip.hide()

  g_effects.fadeOut(toolTipLabel, 100)

  disconnect(rootWidget, {

    onMouseMove = moveToolTip,

})

end

-- @docclass UIWidget @{

-- UIWidget extensions

function UIWidget:setTooltip(text)

  self.tooltip = text

end

function UIWidget:removeTooltip()

  self.tooltip = nil

end

function UIWidget:getTooltip()

  return self.tooltip

end

-- @}

g_tooltip.init()

connect(g_app, { onTerminate = g_tooltip.terminate })

```

---
# uibutton.lua

```lua

-- @docclass

UIButton = extends(UIWidget, "UIButton")

function UIButton.create()

  local button = UIButton.internalCreate()

  button:setFocusable(false)

  return button

end

function UIButton:onMouseRelease(pos, button)

  return self:isPressed()

end

```

---
# uicheckbox.lua

```lua

-- @docclass

UICheckBox = extends(UIWidget, "UICheckBox")

function UICheckBox.create()

  local checkbox = UICheckBox.internalCreate()

  checkbox:setFocusable(false)

  checkbox:setTextAlign(AlignLeft)

  return checkbox

end

function UICheckBox:onClick()

  self:setChecked(not self:isChecked())

end

```

---
# uicombobox.lua

```lua

-- @docclass

UIComboBox = extends(UIWidget, "UIComboBox")

function UIComboBox.create()

  local combobox = UIComboBox.internalCreate()

  combobox:setFocusable(false)

  combobox.options = {}

  combobox.currentIndex = -1

  combobox.mouseScroll = true

  combobox.menuScroll = false

  combobox.menuHeight = 100

  combobox.menuScrollStep = 0

  return combobox

end

function UIComboBox:clearOptions()

  self.options = {}

  self.currentIndex = -1

  self:clearText()

end

function UIComboBox:clear()

  return self:clearOptions()

end

function UIComboBox:getOptionsCount()

  return #self.options

end

function UIComboBox:isOption(text)

  if not self.options then return false end

  for i,v in ipairs(self.options) do

    if v.text == text then

      return true

    end

  end

  return false

end

function UIComboBox:setOption(text, dontSignal)

  self:setCurrentOption(text, dontSignal)

end

function UIComboBox:setCurrentOption(text, dontSignal)

  if not self.options then return end

  for i,v in ipairs(self.options) do

    if v.text == text and self.currentIndex ~= i then

      self.currentIndex = i

      self:setText(text)

      if not dontSignal then

        signalcall(self.onOptionChange, self, text, v.data)

      end

      return

    end

  end

end

function UIComboBox:updateCurrentOption(newText)

  self.options[self.currentIndex].text = newText

  self:setText(newText)

end

function UIComboBox:setCurrentOptionByData(data, dontSignal)

  if not self.options then return end

  for i,v in ipairs(self.options) do

    if v.data == data and self.currentIndex ~= i then

      self.currentIndex = i

      self:setText(v.text)

      if not dontSignal then

        signalcall(self.onOptionChange, self, v.text, v.data)

      end

      return

    end

  end

end

function UIComboBox:setCurrentIndex(index, dontSignal)

  if index >= 1 and index <= #self.options then

    local v = self.options[index]

    self.currentIndex = index

    self:setText(v.text)

    if not dontSignal then

      signalcall(self.onOptionChange, self, v.text, v.data)

    end

  end

end

function UIComboBox:getCurrentOption()

  if table.haskey(self.options, self.currentIndex) then

    return self.options[self.currentIndex]

  end

end

function UIComboBox:addOption(text, data)

  table.insert(self.options, { text = text, data = data })

  local index = #self.options

  if index == 1 then self:setCurrentOption(text) end

  return index

end

function UIComboBox:removeOption(text)

  for i,v in ipairs(self.options) do

    if v.text == text then

      table.remove(self.options, i)

      if self.currentIndex == i then

        self:setCurrentIndex(1)

      elseif self.currentIndex > i then

        self.currentIndex = self.currentIndex - 1

      end

      return

    end

  end

end

function UIComboBox:onMousePress(mousePos, mouseButton)

  local menu

  if self.menuScroll then

    menu = g_ui.createWidget(self:getStyleName() .. 'PopupScrollMenu')

    menu:setHeight(self.menuHeight)

    if self.menuScrollStep > 0 then

      menu:setScrollbarStep(self.menuScrollStep)

    end

  else

    menu = g_ui.createWidget(self:getStyleName() .. 'PopupMenu')

  end

  menu:setId(self:getId() .. 'PopupMenu')

  for i,v in ipairs(self.options) do

    menu:addOption(v.text, function() self:setCurrentOption(v.text) end)

  end

  menu:setWidth(self:getWidth())

  menu:display({ x = self:getX(), y = self:getY() + self:getHeight() })

  connect(menu, { onDestroy = function() self:setOn(false) end })

  self:setOn(true)

  return true

end

function UIComboBox:onMouseWheel(mousePos, direction)

  if not self.mouseScroll or self.disableScroll then

    return false

  end

  if direction == MouseWheelUp and self.currentIndex > 1 then

    self:setCurrentIndex(self.currentIndex - 1)

  elseif direction == MouseWheelDown and self.currentIndex < #self.options then

    self:setCurrentIndex(self.currentIndex + 1)

  end

  return true

end

function UIComboBox:onStyleApply(styleName, styleNode)

  if styleNode.options then

    for k,option in pairs(styleNode.options) do

      self:addOption(option)

    end

  end

  if styleNode.data then

    for k,data in pairs(styleNode.data) do

      local option = self.options[k]

      if option then

        option.data = data

      end

    end

  end

  for name,value in pairs(styleNode) do

    if name == 'mouse-scroll' then

      self.mouseScroll = value

    elseif name == 'menu-scroll' then

      self.menuScroll = value

    elseif name == 'menu-height' then

      self.menuHeight = value

    elseif name == 'menu-scroll-step' then

      self.menuScrollStep = value

    end

  end

end

function UIComboBox:setMouseScroll(scroll)

  self.mouseScroll = scroll

end

function UIComboBox:canMouseScroll()

  return self.mouseScroll

end

```

---
# uiimageview.lua

```lua

-- @docclass

UIImageView = extends(UIWidget, "UIImageView")

function UIImageView.create()

  local imageView = UIImageView.internalCreate()

  imageView.zoom = 1

  imageView.minZoom = math.pow(10, -2)

  imageView.maxZoom = math.pow(10,  2)

  imageView:setClipping(true)

  return imageView

end

function UIImageView:getDefaultZoom()

  local width = self:getWidth()

  local height = self:getHeight()

  local textureWidth = self:getImageTextureWidth()

  local textureHeight = self:getImageTextureHeight()

  local zoomX = width / textureWidth

  local zoomY = height / textureHeight

  return math.min(zoomX, zoomY)

end

function UIImageView:getImagePosition(x, y)

  x = x or self:getWidth() / 2

  y = y or self:getHeight() / 2

  local offsetX = self:getImageOffsetX()

  local offsetY = self:getImageOffsetY()

  local posX = (x - offsetX) / self.zoom

  local posY = (y - offsetY) / self.zoom

  return posX, posY

end

function UIImageView:setImage(image)

  self:setImageSource(image)

  local zoom = self:getDefaultZoom()

  self:setZoom(zoom)

  self:center()

end

function UIImageView:setZoom(zoom, x, y)

  zoom = math.max(math.min(zoom, self.maxZoom), self.minZoom)

  local posX, posY = self:getImagePosition(x, y)

  local textureWidth = self:getImageTextureWidth()

  local textureHeight = self:getImageTextureHeight()

  local imageWidth = textureWidth * zoom

  local imageHeight = textureHeight * zoom

  self:setImageWidth(imageWidth)

  self:setImageHeight(imageHeight)

  self.zoom = zoom

  self:move(posX, posY, x, y)

end

function UIImageView:zoomIn(x, y)

  local zoom = self.zoom * 1.1

  self:setZoom(zoom, x, y)

end

function UIImageView:zoomOut(x, y)

  local zoom = self.zoom / 1.1

  self:setZoom(zoom, x, y)

end

function UIImageView:center()

  self:move(self:getImageTextureWidth() / 2, self:getImageTextureHeight() / 2)

end

function UIImageView:move(x, y, centerX, centerY)

  x = math.max(math.min(x, self:getImageTextureWidth()), 0)

  y = math.max(math.min(y, self:getImageTextureHeight()), 0)

  local centerX = centerX or self:getWidth() / 2

  local centerY = centerY or self:getHeight() / 2

  local offsetX = centerX - x * self.zoom

  local offsetY = centerY - y * self.zoom

  self:setImageOffset({x=offsetX, y=offsetY})

end

function UIImageView:onDragEnter(pos)

  return true

end

function UIImageView:onDragMove(pos, moved)

  local posX, posY = self:getImagePosition()

  self:move(posX - moved.x / self.zoom, posY - moved.y / self.zoom)

  return true

end

function UIImageView:onDragLeave(widget, pos)

  return true

end

function UIImageView:onMouseWheel(mousePos, direction)

  local x = mousePos.x - self:getX()

  local y = mousePos.y - self:getY()

  if direction == MouseWheelUp then

    self:zoomIn(x, y)

  elseif direction == MouseWheelDown then

    self:zoomOut(x, y)

  end

end

```

---
# uiinputbox.lua

```lua

if not UIWindow then dofile 'uiwindow' end

-- @docclass

UIInputBox = extends(UIWindow, "UIInputBox")

function UIInputBox.create(title, okCallback, cancelCallback)

  local inputBox = UIInputBox.internalCreate()

  inputBox:setText(title)

  inputBox.inputs = {}

  inputBox.onEnter = function()

    local results = {}

    for _,func in pairs(inputBox.inputs) do

      table.insert(results, func())

    end

    okCallback(unpack(results))

    inputBox:destroy()

  end

  inputBox.onEscape = function()

    if cancelCallback then

      cancelCallback()

    end

    inputBox:destroy()

  end

  return inputBox

end

function UIInputBox:addLabel(text)

  local label = g_ui.createWidget('InputBoxLabel', self)

  label:setText(text)

  return label

end

function UIInputBox:addLineEdit(labelText, defaultText, maxLength)

  if labelText then self:addLabel(labelText) end

  local lineEdit = g_ui.createWidget('InputBoxLineEdit', self)

  if defaultText then lineEdit:setText(defaultText) end

  if maxLength then lineEdit:setMaxLength(maxLength) end

  table.insert(self.inputs, function() return lineEdit:getText() end)

  return lineEdit

end

function UIInputBox:addTextEdit(labelText, defaultText, maxLength, visibleLines)

  if labelText then self:addLabel(labelText) end

  local textEdit = g_ui.createWidget('InputBoxTextEdit', self)

  if defaultText then textEdit:setText(defaultText) end

  if maxLength then textEdit:setMaxLength(maxLength) end

  visibleLines = visibleLines or 1

  textEdit:setHeight(textEdit:getHeight() * visibleLines)

  table.insert(self.inputs, function() return textEdit:getText() end)

  return textEdit

end

function UIInputBox:addCheckBox(text, checked)

  local checkBox = g_ui.createWidget('InputBoxCheckBox', self)

  checkBox:setText(text)

  checkBox:setChecked(checked)

  table.insert(self.inputs, function() return checkBox:isChecked() end)

  return checkBox

end

function UIInputBox:addComboBox(labelText, ...)

  if labelText then self:addLabel(labelText) end

  local comboBox = g_ui.createWidget('InputBoxComboBox', self)

  local options = {...}

  for i=1,#options do

    comboBox:addOption(options[i])

  end

  table.insert(self.inputs, function() return comboBox:getCurrentOption() end)

  return comboBox

end

function UIInputBox:addSpinBox(labelText, minimum, maximum, value, step)

  if labelText then self:addLabel(labelText) end

  local spinBox = g_ui.createWidget('InputBoxSpinBox', self)

  spinBox:setMinimum(minimum)

  spinBox:setMaximum(maximum)

  spinBox:setValue(value)

  spinBox:setStep(step)

  table.insert(self.inputs, function() return spinBox:getValue() end)

  return spinBox

end

function UIInputBox:display(okButtonText, cancelButtonText)

  okButtonText = okButtonText or tr('Ok')

  cancelButtonText = cancelButtonText or tr('Cancel')

  local buttonsWidget = g_ui.createWidget('InputBoxButtonsPanel', self)

  local okButton = g_ui.createWidget('InputBoxButton', buttonsWidget)

  okButton:setText(okButtonText)

  okButton.onClick = self.onEnter

  local cancelButton = g_ui.createWidget('InputBoxButton', buttonsWidget)

  cancelButton:setText(cancelButtonText)

  cancelButton.onClick = self.onEscape

  buttonsWidget:setHeight(okButton:getHeight())

  rootWidget:addChild(self)

  self:setStyle('InputBoxWindow')

end

function displayTextInputBox(title, label, okCallback, cancelCallback)

  local inputBox = UIInputBox.create(title, okCallback, cancelCallback)

  inputBox:addLineEdit(label)

  inputBox:display()

end

function displayNumberInputBox(title, label, okCallback, cancelCallback, min, max, value, step)

  local inputBox = UIInputBox.create(title, okCallback, cancelCallback)

  inputBox:addSpinBox(label, min, max, value, step)

  inputBox:display()

end

```

---
# uilabel.lua

```lua

-- @docclass

UILabel = extends(UIWidget, "UILabel")

function UILabel.create()

  local label = UILabel.internalCreate()

  label:setPhantom(true)

  label:setFocusable(false)

  label:setTextAlign(AlignLeft)

  return label

end

```

---
# uimessagebox.lua

{% raw %}
```lua

if not UIWindow then dofile 'uiwindow' end

-- @docclass

UIMessageBox = extends(UIWindow, "UIMessageBox")

-- messagebox cannot be created from otui files

UIMessageBox.create = nil

function UIMessageBox.display(title, message, buttons, onEnterCallback, onEscapeCallback)

  local messageBox = UIMessageBox.internalCreate()

  rootWidget:addChild(messageBox)

  messageBox:setStyle('MainWindow')

  messageBox:setText(title)

  local messageLabel = g_ui.createWidget('MessageBoxLabel', messageBox)

  messageLabel:setText(message)

  local buttonsWidth = 0

  local buttonsHeight = 0

  local anchor = AnchorRight

  if buttons.anchor then anchor = buttons.anchor end

  local buttonHolder = g_ui.createWidget('MessageBoxButtonHolder', messageBox)

  buttonHolder:addAnchor(anchor, 'parent', anchor)

  for i=1,#buttons do

    local button = messageBox:addButton(buttons[i].text, buttons[i].callback)

    if i == 1 then

      button:setMarginLeft(0)

      button:addAnchor(AnchorBottom, 'parent', AnchorBottom)

      button:addAnchor(AnchorLeft, 'parent', AnchorLeft)

      buttonsHeight = button:getHeight()

    else

      button:addAnchor(AnchorBottom, 'prev', AnchorBottom)

      button:addAnchor(AnchorLeft, 'prev', AnchorRight)

    end

    buttonsWidth = buttonsWidth + button:getWidth() + button:getMarginLeft()

  end

  buttonHolder:setWidth(buttonsWidth)

  buttonHolder:setHeight(buttonsHeight)

  if onEnterCallback then connect(messageBox, { onEnter = onEnterCallback }) end

  if onEscapeCallback then connect(messageBox, { onEscape = onEscapeCallback }) end

  messageBox:setWidth(math.max(messageLabel:getWidth(), messageBox:getTextSize().width, buttonHolder:getWidth()) + messageBox:getPaddingLeft() + messageBox:getPaddingRight())

  messageBox:setHeight(messageLabel:getHeight() + messageBox:getPaddingTop() + messageBox:getPaddingBottom() + buttonHolder:getHeight() + buttonHolder:getMarginTop())

  return messageBox

end

function displayInfoBox(title, message)

  local messageBox

  local defaultCallback = function() messageBox:ok() end

  messageBox = UIMessageBox.display(title, message, {{text='Ok', callback=defaultCallback}}, defaultCallback, defaultCallback)

  return messageBox

end

function displayErrorBox(title, message)

  local messageBox

  local defaultCallback = function() messageBox:ok() end

  messageBox = UIMessageBox.display(title, message, {{text='Ok', callback=defaultCallback}}, defaultCallback, defaultCallback)

  return messageBox

end

function displayCancelBox(title, message)

  local messageBox

  local defaultCallback = function() messageBox:cancel() end

  messageBox = UIMessageBox.display(title, message, {{text='Cancel', callback=defaultCallback}}, defaultCallback, defaultCallback)

  return messageBox

end

function displayGeneralBox(title, message, buttons, onEnterCallback, onEscapeCallback)

  return UIMessageBox.display(title, message, buttons, onEnterCallback, onEscapeCallback)

end

function UIMessageBox:addButton(text, callback)

  local buttonHolder = self:getChildById('buttonHolder')

  local button = g_ui.createWidget('MessageBoxButton', buttonHolder)

  button:setText(text)

  connect(button, { onClick = callback })

  return button

end

function UIMessageBox:ok()

  signalcall(self.onOk, self)

  self.onOk = nil

  self:destroy()

end

function UIMessageBox:cancel()

  signalcall(self.onCancel, self)

  self.onCancel = nil

  self:destroy()

end

```
{% endraw %}

---
# uiminiwindow.lua

```lua

-- @docclass

UIMiniWindow = extends(UIWindow, "UIMiniWindow")

function UIMiniWindow.create()

  local miniwindow = UIMiniWindow.internalCreate()

  miniwindow.UIMiniWindowContainer = true

  return miniwindow

end

function UIMiniWindow:open(dontSave)

  self:setVisible(true)

  if not dontSave then

    self:setSettings({closed = false})

  end

  signalcall(self.onOpen, self)

end

function UIMiniWindow:close(dontSave)

  if not self:isExplicitlyVisible() then return end

  if self.forceOpen then return end

  self:setVisible(false)

  if not dontSave then

    self:setSettings({closed = true})

  end

  signalcall(self.onClose, self)

end

function UIMiniWindow:minimize(dontSave)

  self:setOn(true)

  self:getChildById('contentsPanel'):hide()

  self:getChildById('miniwindowScrollBar'):hide()

  self:getChildById('bottomResizeBorder'):hide()

  if self.minimizeButton then

    self.minimizeButton:setOn(true)

  end

  self.maximizedHeight = self:getHeight()

  self:setHeight(self.minimizedHeight)

  if not dontSave then

    self:setSettings({minimized = true})

  end

  signalcall(self.onMinimize, self)

end

function UIMiniWindow:maximize(dontSave)

  self:setOn(false)

  self:getChildById('contentsPanel'):show()

  self:getChildById('miniwindowScrollBar'):show()

  self:getChildById('bottomResizeBorder'):show()

  if self.minimizeButton then

    self.minimizeButton:setOn(false)

  end

  self:setHeight(self:getSettings('height') or self.maximizedHeight)

  if not dontSave then

    self:setSettings({minimized = false})

  end

  local parent = self:getParent()

  if parent and parent:getClassName() == 'UIMiniWindowContainer' then

    parent:fitAll(self)

  end

  signalcall(self.onMaximize, self)

end

function UIMiniWindow:lock(dontSave)

  local lockButton = self:getChildById('lockButton')

  if lockButton then

    lockButton:setOn(true)

  end

  self:setDraggable(false)

  if not dontsave then

    self:setSettings({locked = true})

  end

  signalcall(self.onLockChange, self)

end

function UIMiniWindow:unlock(dontSave)

  local lockButton = self:getChildById('lockButton')

  if lockButton then

    lockButton:setOn(false)

  end

  self:setDraggable(true)

  if not dontsave then

    self:setSettings({locked = false})

  end

  signalcall(self.onLockChange, self)

end

function UIMiniWindow:setup()

  self:getChildById('closeButton').onClick =

    function()

      self:close()

    end

  if self.forceOpen then

      if self.closeButton then

        self.closeButton:hide()

      end

  end

  if(self.minimizeButton) then

    self.minimizeButton.onClick =

      function()

        if self:isOn() then

          self:maximize()

        else

          self:minimize()

        end

      end

  end

  local lockButton = self:getChildById('lockButton')

  if lockButton then

    lockButton.onClick = 

      function ()

        if self:isDraggable() then

          self:lock()

        else

          self:unlock()

        end

      end

  end

  self:getChildById('miniwindowTopBar').onDoubleClick =

    function()

      if self:isOn() then

        self:maximize()

      else

        self:minimize()

      end

    end

  self:getChildById('bottomResizeBorder').onDoubleClick = function()

    local resizeBorder = self:getChildById('bottomResizeBorder')

    self:setHeight(resizeBorder:getMinimum())

  end

  local oldParent = self:getParent()

  local settings = {}

  if g_settings.getNodeSize('MiniWindows') < 50 then

    settings = g_settings.getNode('MiniWindows')

  end

  if settings then

    local selfSettings = settings[self:getId()]

    if selfSettings then

      if selfSettings.parentId then

        local parent = rootWidget:recursiveGetChildById(selfSettings.parentId)

        if parent then

          if parent:getClassName() == 'UIMiniWindowContainer' and selfSettings.index and parent:isOn() then

            self:setParent(parent, true)

            self.miniIndex = selfSettings.index

            parent:scheduleInsert(self, selfSettings.index)

          elseif selfSettings.position then

            self:setParent(parent, true)

            self:setPosition(topoint(selfSettings.position))

          end

        end

      end

      if selfSettings.minimized then

        self:minimize(true)

      else

        if selfSettings.height and self:isResizeable() then

          self:setHeight(selfSettings.height)

        elseif selfSettings.height and not self:isResizeable() then

          self:eraseSettings({height = true})

        end

      end

      if selfSettings.closed and not self.forceOpen and not self.containerWindow then

        self:close(true)

      end

      if selfSettings.locked then

        self:lock(true)

      end

    else 

      if not self.forceOpen and self.autoOpen ~= nil and (self.autoOpen == 0 or self.autoOpen == false) and not self.containerWindow then

        self:close(true)

      end

    end

  end

  local newParent = self:getParent()

  self.miniLoaded = true

  if self.save then

    if oldParent and oldParent:getClassName() == 'UIMiniWindowContainer' and not self.containerWindow then

      addEvent(function() oldParent:order() end)

    end

    if newParent and newParent:getClassName() == 'UIMiniWindowContainer' and newParent ~= oldParent then

      addEvent(function() newParent:order() end)

    end

  end

  self:fitOnParent()

end

function UIMiniWindow:onVisibilityChange(visible)

  self:fitOnParent()

end

function UIMiniWindow:onDragEnter(mousePos)

  local parent = self:getParent()

  if not parent then return false end

  if parent:getClassName() == 'UIMiniWindowContainer' then

    local containerParent = parent:getParent():getParent()

    parent:removeChild(self)

    containerParent:addChild(self)

    parent:saveChildren()

  end

  local oldPos = self:getPosition()

  self.movingReference = { x = mousePos.x - oldPos.x, y = mousePos.y - oldPos.y }

  self:setPosition(oldPos)

  self.free = true

  return true

end

function UIMiniWindow:onDragLeave(droppedWidget, mousePos)

  if self.movedWidget then

    self.setMovedChildMargin(self.movedOldMargin or 0)

    self.movedWidget = nil

    self.setMovedChildMargin = nil

    self.movedOldMargin = nil

    self.movedIndex = nil

  end

  UIWindow:onDragLeave(self, droppedWidget, mousePos)

  self:saveParent(self:getParent())

end

function UIMiniWindow:onDragMove(mousePos, mouseMoved)

  local oldMousePosY = mousePos.y - mouseMoved.y

  local children = rootWidget:recursiveGetChildrenByMarginPos(mousePos)

  local overAnyWidget = false

  for i=1,#children do

    local child = children[i]

    if child:getParent():getClassName() == 'UIMiniWindowContainer' then

      overAnyWidget = true

      local childCenterY = child:getY() + child:getHeight() / 2

      if child == self.movedWidget and mousePos.y < childCenterY and oldMousePosY < childCenterY then

        break

      end

      if self.movedWidget then

        self.setMovedChildMargin(self.movedOldMargin or 0)

        self.setMovedChildMargin = nil

      end

      if mousePos.y < childCenterY then

        self.movedOldMargin = child:getMarginTop()

        self.setMovedChildMargin = function(v) child:setMarginTop(v) end

        self.movedIndex = 0

      else

        self.movedOldMargin = child:getMarginBottom()

        self.setMovedChildMargin = function(v) child:setMarginBottom(v) end

        self.movedIndex = 1

      end

      self.movedWidget = child

      self.setMovedChildMargin(self:getHeight())

      break

    end

  end

  if not overAnyWidget and self.movedWidget then

    self.setMovedChildMargin(self.movedOldMargin or 0)

    self.movedWidget = nil

  end

  return UIWindow.onDragMove(self, mousePos, mouseMoved)

end

function UIMiniWindow:onMousePress()

  local parent = self:getParent()

  if not parent then return false end

  if parent:getClassName() ~= 'UIMiniWindowContainer' then

    self:raise()

    return true

  end

end

function UIMiniWindow:onFocusChange(focused)

  if not focused then return end

  local parent = self:getParent()

  if parent and parent:getClassName() ~= 'UIMiniWindowContainer' then

    self:raise()

  end

end

function UIMiniWindow:onHeightChange(height)

  if not self:isOn() then

    self:setSettings({height = height})

  end

  self:fitOnParent()

end

function UIMiniWindow:getSettings(name)

  if not self.save then return nil end

  local settings = g_settings.getNode('MiniWindows')

  if settings then

    local selfSettings = settings[self:getId()]

    if selfSettings then

      return selfSettings[name]

    end

  end

  return nil

end

function UIMiniWindow:setSettings(data)

  if not self.save then return end

  local settings = g_settings.getNode('MiniWindows')

  if not settings then

    settings = {}

  end

  local id = self:getId()

  if not settings[id] then

    settings[id] = {}

  end

  for key,value in pairs(data) do

    settings[id][key] = value

  end

  g_settings.setNode('MiniWindows', settings)

end

function UIMiniWindow:eraseSettings(data)

  if not self.save then return end

  local settings = g_settings.getNode('MiniWindows')

  if not settings then

    settings = {}

  end

  local id = self:getId()

  if not settings[id] then

    settings[id] = {}

  end

  for key,value in pairs(data) do

    settings[id][key] = nil

  end

  g_settings.setNode('MiniWindows', settings)

end

function UIMiniWindow:clearSettings()

  if not self.save then return end

  local settings = g_settings.getNode('MiniWindows')

  if not settings then

    settings = {}

  end

  local id = self:getId()

  settings[id] = {}

  g_settings.setNode('MiniWindows', settings)

end

function UIMiniWindow:saveParent(parent)

  local parent = self:getParent()

  if parent then

    if parent:getClassName() == 'UIMiniWindowContainer' then

      parent:saveChildren()

    else

      self:saveParentPosition(parent:getId(), self:getPosition())

    end

  end

end

function UIMiniWindow:saveParentPosition(parentId, position)

  local selfSettings = {}

  selfSettings.parentId = parentId

  selfSettings.position = pointtostring(position)

  self:setSettings(selfSettings)

end

function UIMiniWindow:saveParentIndex(parentId, index)

  local selfSettings = {}

  selfSettings.parentId = parentId

  selfSettings.index = index

  self:setSettings(selfSettings)

  self.miniIndex = index

end

function UIMiniWindow:disableResize()

  self:getChildById('bottomResizeBorder'):disable()

end

function UIMiniWindow:enableResize()

  self:getChildById('bottomResizeBorder'):enable()

end

function UIMiniWindow:fitOnParent()

  local parent = self:getParent()

  if self:isVisible() and parent and parent:getClassName() == 'UIMiniWindowContainer' then

    parent:fitAll(self)

  end

end

function UIMiniWindow:setParent(parent, dontsave)

  UIWidget.setParent(self, parent)

  if not dontsave then

    self:saveParent(parent)

  end

  self:fitOnParent()

end

function UIMiniWindow:setHeight(height)

  UIWidget.setHeight(self, height)

  signalcall(self.onHeightChange, self, height)

end

function UIMiniWindow:setContentHeight(height)

  local contentsPanel = self:getChildById('contentsPanel')

  local minHeight = contentsPanel:getMarginTop() + contentsPanel:getMarginBottom() + contentsPanel:getPaddingTop() + contentsPanel:getPaddingBottom()

  local resizeBorder = self:getChildById('bottomResizeBorder')

  resizeBorder:setParentSize(minHeight + height)

end

function UIMiniWindow:setContentMinimumHeight(height)

  local contentsPanel = self:getChildById('contentsPanel')

  local minHeight = contentsPanel:getMarginTop() + contentsPanel:getMarginBottom() + contentsPanel:getPaddingTop() + contentsPanel:getPaddingBottom()

  local resizeBorder = self:getChildById('bottomResizeBorder')

  resizeBorder:setMinimum(minHeight + height)

end

function UIMiniWindow:setContentMaximumHeight(height)

  local contentsPanel = self:getChildById('contentsPanel')

  local minHeight = contentsPanel:getMarginTop() + contentsPanel:getMarginBottom() + contentsPanel:getPaddingTop() + contentsPanel:getPaddingBottom()

  local resizeBorder = self:getChildById('bottomResizeBorder')

  resizeBorder:setMaximum(minHeight + height)

end

function UIMiniWindow:getMinimumHeight()

  local resizeBorder = self:getChildById('bottomResizeBorder')

  return resizeBorder:getMinimum()

end

function UIMiniWindow:getMaximumHeight()

  local resizeBorder = self:getChildById('bottomResizeBorder')

  return resizeBorder:getMaximum()

end

function UIMiniWindow:isResizeable()

  local resizeBorder = self:getChildById('bottomResizeBorder')

  return resizeBorder:isExplicitlyVisible() and resizeBorder:isEnabled()

end

```

---
# uiminiwindowcontainer.lua

```lua

-- @docclass

UIMiniWindowContainer = extends(UIWidget, "UIMiniWindowContainer")

function UIMiniWindowContainer.create()

  local container = UIMiniWindowContainer.internalCreate()

  container.scheduledWidgets = {}

  container:setFocusable(false)

  container:setPhantom(true)

  return container

end

-- TODO: connect to window onResize event

-- TODO: try to resize another widget?

-- TODO: try to find another panel?

function UIMiniWindowContainer:fitAll(noRemoveChild)

  if not self:isVisible() then

    return

  end

  if not noRemoveChild then

    local children = self:getChildren()

    if #children > 0 then

      noRemoveChild = children[#children]

    else

      return

    end

  end

  local sumHeight = 0

  local children = self:getChildren()

  for i=1,#children do

    if children[i]:isVisible() then

      sumHeight = sumHeight + children[i]:getHeight()

    end

  end

  local selfHeight = self:getHeight() - (self:getPaddingTop() + self:getPaddingBottom())

  if sumHeight <= selfHeight then

    return

  end

  local removeChildren = {}

  -- try to resize noRemoveChild

  local maximumHeight = selfHeight - (sumHeight - noRemoveChild:getHeight())

  if noRemoveChild:isResizeable() and noRemoveChild:getMinimumHeight() <= maximumHeight then

    sumHeight = sumHeight - noRemoveChild:getHeight() + maximumHeight

    addEvent(function() noRemoveChild:setHeight(maximumHeight) end)

  end

  -- try to remove no-save widget

  for i=#children,1,-1 do

    if sumHeight <= selfHeight then

      break

    end

    local child = children[i]

    if child ~= noRemoveChild and not child.save then

      local childHeight = child:getHeight()

      sumHeight = sumHeight - childHeight

      table.insert(removeChildren, child)

    end

  end

  -- try to remove save widget, not forceOpen

  for i=#children,1,-1 do

    if sumHeight <= selfHeight then

      break

    end

    local child = children[i]

    if child ~= noRemoveChild and child:isVisible() and not child.forceOpen then

      local childHeight = child:getHeight()

      sumHeight = sumHeight - childHeight

      table.insert(removeChildren, child)

    end

  end

  -- try to remove save widget

  for i=#children,1,-1 do

    if sumHeight <= selfHeight then

      break

    end

    local child = children[i]

    if child ~= noRemoveChild and child:isVisible() then

      local childHeight = child:getHeight() - 50

      sumHeight = sumHeight - childHeight

      table.insert(removeChildren, child)

    end

  end

  -- close widgets

  for i=1,#removeChildren do

    if removeChildren[i].forceOpen then

      removeChildren[i]:minimize(true)

    else

      removeChildren[i]:close()

    end

  end

end

function UIMiniWindowContainer:onDrop(widget, mousePos)

  if widget.UIMiniWindowContainer then

    local oldParent = widget:getParent()

    if oldParent == self then

      return true

    end

    if oldParent then

      oldParent:removeChild(widget)

    end

    if widget.movedWidget then

      local index = self:getChildIndex(widget.movedWidget)

      self:insertChild(index + widget.movedIndex, widget)

    else

      self:addChild(widget)

    end

    self:fitAll(widget)

    return true

  end

end

function UIMiniWindowContainer:moveTo(newPanel)

  if not newPanel or newPanel == self then

    return

  end

  local children = self:getChildByIndex(1)

  while children do

    newPanel:addChild(children)

    children = self:getChildByIndex(1)

  end

  newPanel:fitAll()

end

function UIMiniWindowContainer:swapInsert(widget, index)

  local oldParent = widget:getParent()

  local oldIndex = self:getChildIndex(widget)

  if oldParent == self and oldIndex ~= index then

    local oldWidget = self:getChildByIndex(index)

    if oldWidget then

      self:removeChild(oldWidget)

      self:insertChild(oldIndex, oldWidget)

    end

    self:removeChild(widget)

    self:insertChild(index, widget)

  end

end

function UIMiniWindowContainer:scheduleInsert(widget, index)

  if index - 1 > self:getChildCount() then

    if self.scheduledWidgets[index] then

      pdebug('replacing scheduled widget id ' .. widget:getId())

    end

    self.scheduledWidgets[index] = widget

  else

    local oldParent = widget:getParent()

    if oldParent ~= self then

      if oldParent then

        oldParent:removeChild(widget)

      end

      self:insertChild(index, widget)

      while true do

        local placed = false

        for nIndex,nWidget in pairs(self.scheduledWidgets) do

          if nIndex - 1 <= self:getChildCount() then

            local oldParent = nWidget:getParent()

            if oldParent ~= self then

              if oldParent then

                oldParent:removeChild(nWidget)

              end

              self:insertChild(nIndex, nWidget)

            else

              self:moveChildToIndex(nWidget, nIndex)

            end

            self.scheduledWidgets[nIndex] = nil

            placed = true

            break

          end

        end

        if not placed then break end

      end

    end

  end

end

function UIMiniWindowContainer:order()

  local children = self:getChildren()

  for i=1,#children do

    if not children[i].miniLoaded then return end

  end

  table.sort(children, function(a, b)

    local indexA = a.miniIndex or a.autoOpen or 999

    local indexB = b.miniIndex or b.autoOpen or 999

    return indexA < indexB

  end)

  self:reorderChildren(children)

  local ignoreIndex = 0

  for i=1,#children do

    if children[i].save then

      children[i].miniIndex = i - ignoreIndex

    else

      ignoreIndex = ignoreIndex + 1

    end      

  end

end

function UIMiniWindowContainer:saveChildren()

  local children = self:getChildren()

  local ignoreIndex = 0

  for i=1,#children do

    if children[i].save then

      children[i]:saveParentIndex(self:getId(), i - ignoreIndex)

    else

      ignoreIndex = ignoreIndex + 1

    end

  end

end

function UIMiniWindowContainer:onGeometryChange()

  self:fitAll()

end

```

---
# uimovabletabbar.lua

```lua

-- @docclass

UIMoveableTabBar = extends(UIWidget, "UIMoveableTabBar")

-- private functions

local function onTabClick(tab)

  tab.tabBar:selectTab(tab)

end

local function updateMargins(tabBar)

  if #tabBar.tabs == 0 then return end

  local currentMargin = 0

  for i = 1, #tabBar.tabs do

    tabBar.tabs[i]:setMarginLeft(currentMargin)

    currentMargin = currentMargin + tabBar.tabSpacing + tabBar.tabs[i]:getWidth()

  end

end

local function updateNavigation(tabBar)

  if tabBar.prevNavigation then

    if #tabBar.preTabs > 0 or table.find(tabBar.tabs, tabBar.currentTab) ~= 1 then

      tabBar.prevNavigation:enable()

    else

      tabBar.prevNavigation:disable()

    end

  end

  if tabBar.nextNavigation then

    if #tabBar.postTabs > 0 or table.find(tabBar.tabs, tabBar.currentTab) ~= #tabBar.tabs then

      tabBar.nextNavigation:enable()

    else

      tabBar.nextNavigation:disable()

    end

  end

end

local function updateIndexes(tabBar, tab, xoff)

  local tabs = tabBar.tabs

  local currentMargin = 0

  local prevIndex = table.find(tabs, tab)

  local newIndex = prevIndex

  local xmid = xoff + tab:getWidth()/2

  for i = 1, #tabs do

    local nextTab = tabs[i]

    if xmid >= currentMargin + nextTab:getWidth()/2 then

      newIndex = table.find(tabs, nextTab)

    end

    currentMargin = currentMargin + tabBar.tabSpacing * (i - 1) + tabBar.tabs[i]:getWidth()

  end

  if newIndex ~= prevIndex then

    table.remove(tabs, table.find(tabs, tab))

    table.insert(tabs, newIndex, tab)

  end

  updateNavigation(tabBar)

end

local function getMaxMargin(tabBar, tab)

  if #tabBar.tabs == 0 then return 0 end

  local maxMargin = 0

  for i = 1, #tabBar.tabs do

    if tabBar.tabs[i] ~= tab then

      maxMargin = maxMargin + tabBar.tabs[i]:getWidth()

    end

  end

  return maxMargin + tabBar.tabSpacing * (#tabBar.tabs - 1)

end

local function updateTabs(tabBar)

  if #tabBar.postTabs > 0 then

    local i = 1

    while i <= #tabBar.postTabs do

      local tab = tabBar.postTabs[i]

      if getMaxMargin(tabBar) + tab:getWidth() > tabBar:getWidth() then

        break

      end

      table.remove(tabBar.postTabs, i)

      table.insert(tabBar.tabs, tab)

      tab:setVisible(true)

    end

  end

  if #tabBar.preTabs > 0 then

    for i = #tabBar.preTabs, 1, -1 do

      local tab = tabBar.preTabs[i]

      if getMaxMargin(tabBar) + tab:getWidth() > tabBar:getWidth() then

        break

      end

      table.remove(tabBar.preTabs, i)

      table.insert(tabBar.tabs, 1, tab)

      tab:setVisible(true)

    end

  end

  updateNavigation(tabBar)

  updateMargins(tabBar)

  if not tabBar.currentTab and #tabBar.tabs > 0 then

    tabBar:selectTab(tabBar.tabs[1])

  end

end

local function hideTabs(tabBar, fromBack, toArray, width)

  while #tabBar.tabs > 0 and getMaxMargin(tabBar) + width > tabBar:getWidth() do

    local index = fromBack and #tabBar.tabs or 1

    local tab = tabBar.tabs[index]

    table.remove(tabBar.tabs, index)

    if fromBack then

      table.insert(toArray, 1, tab)

    else

      table.insert(toArray, tab)

    end

    if tabBar.currentTab == tab then

      if #tabBar.tabs > 0 then

        tabBar:selectTab(tabBar.tabs[#tabBar.tabs])

      else

        tabBar.currentTab:setChecked(false)

        tabBar.currentTab = nil

      end

    end

    tab:setVisible(false)

  end

end

local function showPreTab(tabBar)

  if #tabBar.preTabs == 0 then

    return nil

  end

  local tmpTab = tabBar.preTabs[#tabBar.preTabs]

  hideTabs(tabBar, true, tabBar.postTabs, tmpTab:getWidth())

  table.remove(tabBar.preTabs, #tabBar.preTabs)

  table.insert(tabBar.tabs, 1, tmpTab)

  tmpTab:setVisible(true)

  return tmpTab

end

local function showPostTab(tabBar)

  if #tabBar.postTabs == 0 then

    return nil

  end

  local tmpTab = tabBar.postTabs[1]

  hideTabs(tabBar, false, tabBar.preTabs, tmpTab:getWidth())

  table.remove(tabBar.postTabs, 1)

  table.insert(tabBar.tabs, tmpTab)

  tmpTab:setVisible(true)

  return tmpTab

end

local function onTabMousePress(tab, mousePos, mouseButton)

  if mouseButton == MouseRightButton then

    if tab.menuCallback then tab.menuCallback(tab, mousePos, mouseButton) end

    return true

  end

end

local function onTabDragEnter(tab, mousePos)

  tab:raise()

  tab.hotSpot = mousePos.x - tab:getMarginLeft()

  tab.tabBar.selected = tab

  return true

end

local function onTabDragLeave(tab)

  updateMargins(tab.tabBar)

  tab.tabBar.selected = nil

  return true

end

local function onTabDragMove(tab, mousePos, mouseMoved)

  if tab == tab.tabBar.selected then

    local xoff = mousePos.x - tab.hotSpot

    -- update indexes

    updateIndexes(tab.tabBar, tab, xoff)

    updateIndexes(tab.tabBar, tab, xoff)

    -- update margins

    updateMargins(tab.tabBar)

    xoff = math.max(xoff, 0)

    xoff = math.min(xoff, getMaxMargin(tab.tabBar, tab))

    tab:setMarginLeft(xoff)

  end

end

local function tabBlink(tab, step)

  local step = step or 0

  tab:setOn(not tab:isOn())

  removeEvent(tab.blinkEvent)

  if step < 4 then

    tab.blinkEvent = scheduleEvent(function() tabBlink(tab, step+1) end, 500)

  else

    tab:setOn(true)

    tab.blinkEvent = nil

  end

end

-- public functions

function UIMoveableTabBar.create()

  local tabbar = UIMoveableTabBar.internalCreate()

  tabbar:setFocusable(false)

  tabbar.tabs = {}

  tabbar.selected = nil  -- dragged tab

  tabbar.tabSpacing = 0

  tabbar.tabsMoveable = false

  tabbar.preTabs = {}

  tabbar.postTabs = {}

  tabbar.prevNavigation = nil

  tabbar.nextNavigation = nil

  tabbar.onGeometryChange = function()

                              hideTabs(tabbar, true, tabbar.postTabs, 0)

                              updateTabs(tabbar)

                            end

  return tabbar

end

function UIMoveableTabBar:onDestroy()

  if self.prevNavigation then

    self.prevNavigation:disable()

  end

  if self.nextNavigation then

    self.nextNavigation:disable()

  end

  self.nextNavigation = nil

  self.prevNavigation = nil

end

function UIMoveableTabBar:setContentWidget(widget)

  self.contentWidget = widget

  if #self.tabs > 0 then

    self.contentWidget:addChild(self.tabs[1].tabPanel)

  end

end

function UIMoveableTabBar:setTabSpacing(tabSpacing)

  self.tabSpacing = tabSpacing

  updateMargins(self)

end

function UIMoveableTabBar:addTab(text, panel, menuCallback)

  if panel == nil then

    panel = g_ui.createWidget(self:getStyleName() .. 'Panel')

    panel:setId('tabPanel')

  end

  local tab = g_ui.createWidget(self:getStyleName() .. 'Button', self)

  panel.isTab = true

  tab.tabPanel = panel

  tab.tabBar = self

  tab:setId('tab')

  tab:setDraggable(self.tabsMoveable)

  tab:setText(text)

  tab:setWidth(tab:getTextSize().width + tab:getPaddingLeft() + tab:getPaddingRight())

  tab.menuCallback = menuCallback or nil

  tab.onClick = onTabClick

  tab.onMousePress = onTabMousePress

  tab.onDragEnter = onTabDragEnter

  tab.onDragLeave = onTabDragLeave

  tab.onDragMove = onTabDragMove

  tab.onDestroy = function() tab.tabPanel:destroy() end

  if #self.tabs == 0 then

    self:selectTab(tab)

    tab:setMarginLeft(0)

    table.insert(self.tabs, tab)

  else

    local newMargin = self.tabSpacing * #self.tabs

    for i = 1, #self.tabs do

      newMargin = newMargin + self.tabs[i]:getWidth()

    end

    tab:setMarginLeft(newMargin)

    hideTabs(self, true, self.postTabs, tab:getWidth())

    table.insert(self.tabs, tab)

    if #self.tabs == 1 then

      self:selectTab(tab)

    end

    updateMargins(self)

  end

  updateNavigation(self)

  return tab

end

-- Additional function to move the tab by lua

function UIMoveableTabBar:moveTab(tab, units)

  local index = table.find(self.tabs, tab)

  if index == nil then return end

  local focus = false

  if self.currentTab == tab then

    self:selectPrevTab()

    focus = true

  end

  table.remove(self.tabs, index)

  local newIndex = math.min(#self.tabs+1, math.max(index + units, 1))

  table.insert(self.tabs, newIndex, tab)

  if focus then self:selectTab(tab) end

  updateMargins(self)

  return newIndex

end

function UIMoveableTabBar:onStyleApply(styleName, styleNode)

  if styleNode['movable'] then

    self.tabsMoveable = styleNode['movable']

  end

  if styleNode['tab-spacing'] then

    self:setTabSpacing(styleNode['tab-spacing'])

  end

end

function UIMoveableTabBar:clearTabs()

  while #self.tabs > 0 do

    self:removeTab(self.tabs[#self.tabs])

  end

end

function UIMoveableTabBar:removeTab(tab)

  local tabTables = {self.tabs, self.preTabs, self.postTabs}

  local index = nil

  local tabTable = nil

  for i = 1, #tabTables do

    index = table.find(tabTables[i], tab)

    if index ~= nil then

      tabTable = tabTables[i]

      break

    end

  end

  if tabTable == nil then

    return

  end

  table.remove(tabTable, index)

  if self.currentTab == tab then

    self:selectPrevTab()

    if #self.tabs == 1 then

      self.currentTab = nil

    end

  end

  if tab.blinkEvent then

    removeEvent(tab.blinkEvent)

  end

  updateTabs(self)

  tab:destroy()

end

function UIMoveableTabBar:getTab(text)

  for k,tab in pairs(self.tabs) do

    if tab:getText():lower() == text:lower() then

      return tab

    end

  end

  for k,tab in pairs(self.preTabs) do

    if tab:getText():lower() == text:lower() then

      return tab

    end

  end

  for k,tab in pairs(self.postTabs) do

    if tab:getText():lower() == text:lower() then

      return tab

    end

  end

end

function UIMoveableTabBar:selectTab(tab)

  if self.currentTab == tab then return end

  if self.contentWidget then

    local selectedWidget = self.contentWidget:getLastChild()

    if selectedWidget and selectedWidget.isTab then

      self.contentWidget:removeChild(selectedWidget)

    end

    self.contentWidget:addChild(tab.tabPanel)

    tab.tabPanel:fill('parent')

  end

  if self.currentTab then

    self.currentTab:setChecked(false)

  end

  signalcall(self.onTabChange, self, tab)

  self.currentTab = tab

  tab:setChecked(true)

  tab:setOn(false)

  tab.blinking = false

  if tab.blinkEvent then

    removeEvent(tab.blinkEvent)

    tab.blinkEvent = nil

  end

  local parent = tab:getParent()

  parent:focusChild(tab, MouseFocusReason)

  updateNavigation(self)

end

function UIMoveableTabBar:selectNextTab()

  if self.currentTab == nil then

    return

  end

  local index = table.find(self.tabs, self.currentTab)

  if index == nil then

    return

  end

  local newIndex = index + 1

  if newIndex > #self.tabs then

    if #self.postTabs > 0 then

      local widget = showPostTab(self)

      self:selectTab(widget)

    else

      if #self.preTabs > 0 then

        for i = 1, #self.preTabs do

          showPreTab(self)

        end

      end

      self:selectTab(self.tabs[1])

    end

    updateTabs(self)

    return

  end

  local nextTab = self.tabs[newIndex]

  if not nextTab then

    return

  end

  self:selectTab(nextTab)

end

function UIMoveableTabBar:selectPrevTab()

  if self.currentTab == nil then

    return

  end

  local index = table.find(self.tabs, self.currentTab)

  if index == nil then

    return

  end

  local newIndex = index - 1

  if newIndex <= 0 then

    if #self.preTabs > 0 then

      local widget = showPreTab(self)

      self:selectTab(widget)

    else

      if #self.postTabs > 0 then

        for i = 1, #self.postTabs do

          showPostTab(self)

        end

      end

      self:selectTab(self.tabs[#self.tabs])

    end

    updateTabs(self)

    return

  end

  local prevTab = self.tabs[newIndex]

  if not prevTab then

    return

  end

  self:selectTab(prevTab)

end

function UIMoveableTabBar:blinkTab(tab)

  if tab:isChecked() then return end

  tab.blinking = true

  tabBlink(tab)

end

function UIMoveableTabBar:getTabPanel(tab)

  return tab.tabPanel

end

function UIMoveableTabBar:getCurrentTabPanel()

  if self.currentTab then

    return self.currentTab.tabPanel

  end

end

function UIMoveableTabBar:getCurrentTab()

  return self.currentTab

end

function UIMoveableTabBar:setNavigation(prevButton, nextButton)

  self.prevNavigation = prevButton

  self.nextNavigation = nextButton

  if self.prevNavigation then

    self.prevNavigation.onClick = function() self:selectPrevTab() end

  end

  if self.nextNavigation then

    self.nextNavigation.onClick = function() self:selectNextTab() end

  end

  updateNavigation(self)

end

```

---
# uipopupmenu.lua

```lua

-- @docclass

UIPopupMenu = extends(UIWidget, "UIPopupMenu")

local currentMenu

function UIPopupMenu.create()

  local menu = UIPopupMenu.internalCreate()

  local layout = UIVerticalLayout.create(menu)

  layout:setFitChildren(true)

  menu:setLayout(layout)

  menu.isGameMenu = false

  return menu

end

function UIPopupMenu:display(pos)

  -- don't display if not options was added

  if self:getChildCount() == 0 then

    self:destroy()

    return

  end

  if g_ui.isMouseGrabbed() then

    self:destroy()

    return

  end

  if currentMenu then

    currentMenu:destroy()

  end

  if pos == nil then

    pos = g_window.getMousePosition()

  end

  rootWidget:addChild(self)

  self:setPosition(pos)

  self:grabMouse()

  self:focus()

  --self:grabKeyboard()

  currentMenu = self

end

function UIPopupMenu:onGeometryChange(oldRect, newRect)

  local parent = self:getParent()

  if not parent then return end

  local ymax = parent:getY() + parent:getHeight()

  local xmax = parent:getX() + parent:getWidth()

  if newRect.y + newRect.height > ymax then

    local newy = ymax - newRect.height

    if newy > 0 and newy + newRect.height < ymax then self:setY(newy) end

  end

  if newRect.x + newRect.width > xmax then

    local newx = xmax - newRect.width

    if newx > 0 and newx + newRect.width < xmax then self:setX(newx) end

  end

  self:bindRectToParent()

end

function UIPopupMenu:addOption(optionName, optionCallback, shortcut)

  local optionWidget = g_ui.createWidget(self:getStyleName() .. 'Button', self)

  optionWidget.onClick = function(widget)

    self:destroy()

    optionCallback()

  end

  optionWidget:setText(optionName)

  local width = optionWidget:getTextSize().width + optionWidget:getMarginLeft() + optionWidget:getMarginRight() + 15

  if shortcut then

    local shortcutLabel = g_ui.createWidget(self:getStyleName() .. 'ShortcutLabel', optionWidget)

    shortcutLabel:setText(shortcut)

    width = width + shortcutLabel:getTextSize().width + shortcutLabel:getMarginLeft() + shortcutLabel:getMarginRight()

  end

  self:setWidth(math.max(self:getWidth(), width))

end

function UIPopupMenu:addSeparator()

  g_ui.createWidget(self:getStyleName() .. 'Separator', self)

end

function UIPopupMenu:setGameMenu(state)

  self.isGameMenu = state

end

function UIPopupMenu:onDestroy()

  if currentMenu == self then

    currentMenu = nil

  end

  self:ungrabMouse()

end

function UIPopupMenu:onMousePress(mousePos, mouseButton)

  -- clicks outside menu area destroys the menu

  if not self:containsPoint(mousePos) then

    self:destroy()

  end

  return true

end

function UIPopupMenu:onKeyPress(keyCode, keyboardModifiers)

  if keyCode == KeyEscape then

    self:destroy()

    return true

  end

  return false

end

-- close all menus when the window is resized

local function onRootGeometryUpdate()

  if currentMenu then

    currentMenu:destroy()

  end

end

local function onGameEnd()

  if currentMenu and currentMenu.isGameMenu then

    currentMenu:destroy()

  end

end

connect(rootWidget, { onGeometryChange = onRootGeometryUpdate })

connect(g_game, { onGameEnd = onGameEnd } )

```

---
# uipopupscrollmenu.lua

```lua

-- @docclass

UIPopupScrollMenu = extends(UIWidget, "UIPopupScrollMenu")

local currentMenu

function UIPopupScrollMenu.create()

  local menu = UIPopupScrollMenu.internalCreate()

  local scrollArea = g_ui.createWidget('UIScrollArea', menu)

  scrollArea:setLayout(UIVerticalLayout.create(menu))

  scrollArea:setId('scrollArea')

  local scrollBar = g_ui.createWidget('VerticalScrollBar', menu)

  scrollBar:setId('scrollBar')

  scrollBar.pixelsScroll = false

  scrollBar:addAnchor(AnchorRight, 'parent', AnchorRight)

  scrollBar:addAnchor(AnchorTop, 'parent', AnchorTop)

  scrollBar:addAnchor(AnchorBottom, 'parent', AnchorBottom)

  scrollArea:addAnchor(AnchorLeft, 'parent', AnchorLeft)

  scrollArea:addAnchor(AnchorTop, 'parent', AnchorTop)

  scrollArea:addAnchor(AnchorBottom, 'parent', AnchorBottom)

  scrollArea:addAnchor(AnchorRight, 'next', AnchorLeft)

  scrollArea:setVerticalScrollBar(scrollBar)

  menu.scrollArea = scrollArea

  menu.scrollBar = scrollBar

  return menu

end

function UIPopupScrollMenu:setScrollbarStep(step)

  self.scrollBar:setStep(step)

end

function UIPopupScrollMenu:display(pos)

  -- don't display if not options was added

  if self.scrollArea:getChildCount() == 0 then

    self:destroy()

    return

  end

  if g_ui.isMouseGrabbed() then

    self:destroy()

    return

  end

  if currentMenu then

    currentMenu:destroy()

  end

  if pos == nil then

    pos = g_window.getMousePosition()

  end

  rootWidget:addChild(self)

  self:setPosition(pos)

  self:grabMouse()

  currentMenu = self

end

function UIPopupScrollMenu:onGeometryChange(oldRect, newRect)

  local parent = self:getParent()

  if not parent then return end

  local ymax = parent:getY() + parent:getHeight()

  local xmax = parent:getX() + parent:getWidth()

  if newRect.y + newRect.height > ymax then

    local newy = newRect.y - newRect.height

    if newy > 0 and newy + newRect.height < ymax then self:setY(newy) end

  end

  if newRect.x + newRect.width > xmax then

    local newx = newRect.x - newRect.width

    if newx > 0 and newx + newRect.width < xmax then self:setX(newx) end

  end

  self:bindRectToParent()

end

function UIPopupScrollMenu:addOption(optionName, optionCallback, shortcut)

  local optionWidget = g_ui.createWidget(self:getStyleName() .. 'Button', self.scrollArea)

  optionWidget.onClick = function(widget)

    self:destroy()

    optionCallback()

  end

  optionWidget:setText(optionName)

  local width = optionWidget:getTextSize().width + optionWidget:getMarginLeft() + optionWidget:getMarginRight() + 15

  if shortcut then

    local shortcutLabel = g_ui.createWidget(self:getStyleName() .. 'ShortcutLabel', optionWidget)

    shortcutLabel:setText(shortcut)

    width = width + shortcutLabel:getTextSize().width + shortcutLabel:getMarginLeft() + shortcutLabel:getMarginRight()

  end

  self:setWidth(math.max(self:getWidth(), width))

end

function UIPopupScrollMenu:addSeparator()

  g_ui.createWidget(self:getStyleName() .. 'Separator', self.scrollArea)

end

function UIPopupScrollMenu:onDestroy()

  if currentMenu == self then

    currentMenu = nil

  end

  self:ungrabMouse()

end

function UIPopupScrollMenu:onMousePress(mousePos, mouseButton)

  -- clicks outside menu area destroys the menu

  if not self:containsPoint(mousePos) then

    self:destroy()

  end

  return true

end

function UIPopupScrollMenu:onKeyPress(keyCode, keyboardModifiers)

  if keyCode == KeyEscape then

    self:destroy()

    return true

  end

  return false

end

-- close all menus when the window is resized

local function onRootGeometryUpdate()

  if currentMenu then

    currentMenu:destroy()

  end

end

connect(rootWidget, { onGeometryChange = onRootGeometryUpdate} )

```

---
# uiprogressbar.lua

```lua

-- @docclass

UIProgressBar = extends(UIWidget, "UIProgressBar")

function UIProgressBar.create()

  local progressbar = UIProgressBar.internalCreate()

  progressbar:setFocusable(false)

  progressbar:setOn(true)

  progressbar.min = 0

  progressbar.max = 100

  progressbar.value = 0

  progressbar.bgBorderLeft = 0

  progressbar.bgBorderRight = 0

  progressbar.bgBorderTop = 0

  progressbar.bgBorderBottom = 0

  return progressbar

end

function UIProgressBar:setMinimum(minimum)

  self.minimum = minimum

  if self.value < minimum then

    self:setValue(minimum)

  end

end

function UIProgressBar:setMaximum(maximum)

  self.maximum = maximum

  if self.value > maximum then

    self:setValue(maximum)

  end

end

function UIProgressBar:setValue(value, minimum, maximum)

  if minimum then

    self:setMinimum(minimum)

  end

  if maximum then

    self:setMaximum(maximum)

  end

  self.value = math.max(math.min(value, self.maximum), self.minimum)

  self:updateBackground()

end

function UIProgressBar:setPercent(percent)

  self:setValue(percent, 0, 100)

end

function UIProgressBar:getPercent()

  return self.value

end

function UIProgressBar:getPercentPixels()

  return (self.maximum - self.minimum) / self:getWidth()

end

function UIProgressBar:getProgress()

  if self.minimum == self.maximum then return 1 end

  return (self.value - self.minimum) / (self.maximum - self.minimum)

end

function UIProgressBar:updateBackground()

  if self:isOn() then

    local width = math.round(math.max((self:getProgress() * (self:getWidth() - self.bgBorderLeft - self.bgBorderRight)), 1))

    local height = self:getHeight() - self.bgBorderTop - self.bgBorderBottom

    local rect = { x = self.bgBorderLeft, y = self.bgBorderTop, width = width, height = height }

    self:setBackgroundRect(rect)

  end

end

function UIProgressBar:onSetup()

  self:updateBackground()

end

function UIProgressBar:onStyleApply(name, node)

  for name,value in pairs(node) do

    if name == 'background-border-left' then

      self.bgBorderLeft = tonumber(value)

    elseif name == 'background-border-right' then

      self.bgBorderRight = tonumber(value)

    elseif name == 'background-border-top' then

      self.bgBorderTop = tonumber(value)

    elseif name == 'background-border-bottom' then

      self.bgBorderBottom = tonumber(value)

    elseif name == 'background-border' then

      self.bgBorderLeft = tonumber(value)

      self.bgBorderRight = tonumber(value)

      self.bgBorderTop = tonumber(value)

      self.bgBorderBottom = tonumber(value)

    end

  end

end

function UIProgressBar:onGeometryChange(oldRect, newRect)

  if not self:isOn() then

    self:setHeight(0)

  end

  self:updateBackground()

end

```

---
# uiradiogroup.lua

```lua

-- @docclass

UIRadioGroup = newclass("UIRadioGroup")

function UIRadioGroup.create()

  local radiogroup = UIRadioGroup.internalCreate()

  radiogroup.widgets = {}

  radiogroup.selectedWidget = nil

  return radiogroup

end

function UIRadioGroup:destroy()

  for k,widget in pairs(self.widgets) do

    widget.onClick = nil

  end

  self.widgets = {}

end

function UIRadioGroup:addWidget(widget)

  table.insert(self.widgets, widget)

  widget.onClick = function(widget) self:selectWidget(widget) end

end

function UIRadioGroup:removeWidget(widget)

  if self.selectedWidget == widget then

    self:selectWidget(nil)

  end

  widget.onClick = nil

  table.removevalue(self.widgets, widget)

end

function UIRadioGroup:selectWidget(selectedWidget, dontSignal)

  if selectedWidget == self.selectedWidget then return end

  local previousSelectedWidget = self.selectedWidget

  self.selectedWidget = selectedWidget

  if previousSelectedWidget then

    previousSelectedWidget:setChecked(false)

  end

  if selectedWidget then

    selectedWidget:setChecked(true)

  end

  if not dontSignal then

    signalcall(self.onSelectionChange, self, selectedWidget, previousSelectedWidget)

  end

end

function UIRadioGroup:clearSelected()

  if not self.selectedWidget then return end

  local previousSelectedWidget = self.selectedWidget

  self.selectedWidget:setChecked(false)

  self.selectedWidget = nil

  signalcall(self.onSelectionChange, self, nil, previousSelectedWidget)

end

function UIRadioGroup:getSelectedWidget()

  return self.selectedWidget

end

function UIRadioGroup:getFirstWidget()

  return self.widgets[1]

end

```

---
# uiresizeborder.lua

```lua

-- @docclass

UIResizeBorder = extends(UIWidget, "UIResizeBorder")

function UIResizeBorder.create()

  local resizeborder = UIResizeBorder.internalCreate()

  resizeborder:setFocusable(false)

  resizeborder.minimum = 0

  resizeborder.maximum = 1000

  return resizeborder

end

function UIResizeBorder:onSetup()

  if self:getWidth() > self:getHeight() then

    self.vertical = true

  else

    self.vertical = false

  end

end

function UIResizeBorder:onDestroy()

  if self.hovering then

    g_mouse.popCursor(self.cursortype)

  end

end

function UIResizeBorder:onHoverChange(hovered)

  if hovered then

    if g_mouse.isCursorChanged() or g_mouse.isPressed() then return end

    if self:getWidth() > self:getHeight() then

      self.vertical = true

      self.cursortype = 'vertical'

    else

      self.vertical = false

      self.cursortype = 'horizontal'

    end

    g_mouse.pushCursor(self.cursortype)

    self.hovering = true

    if not self:isPressed() then

      g_effects.fadeIn(self)

    end

  else

    if not self:isPressed() and self.hovering then

      g_mouse.popCursor(self.cursortype)

      g_effects.fadeOut(self)

      self.hovering = false

    end

  end

end

function UIResizeBorder:onMouseMove(mousePos, mouseMoved)

  if self:isPressed() then

    local parent = self:getParent()

    local newSize = 0

    if self.vertical then

      local delta = mousePos.y - self:getY() - self:getHeight()/2

      newSize = math.min(math.max(parent:getHeight() + delta, self.minimum), self.maximum)

      parent:setHeight(newSize)

    else

      local delta = mousePos.x - self:getX() - self:getWidth()/2

      newSize = math.min(math.max(parent:getWidth() + delta, self.minimum), self.maximum)

      parent:setWidth(newSize)

    end

    self:checkBoundary(newSize)

    return true

  end

end

function UIResizeBorder:onMouseRelease(mousePos, mouseButton)

  if not self:isHovered() then

    g_mouse.popCursor(self.cursortype)

    g_effects.fadeOut(self)

    self.hovering = false

  end

end

function UIResizeBorder:onStyleApply(styleName, styleNode)

  for name,value in pairs(styleNode) do

    if name == 'maximum' then

      self:setMaximum(tonumber(value))

    elseif name == 'minimum' then

      self:setMinimum(tonumber(value))

    end

  end

end

function UIResizeBorder:onVisibilityChange(visible)

  if visible and self.maximum == self.minimum then

    self:hide()

  end

end

function UIResizeBorder:setMaximum(maximum)

  self.maximum = maximum

  self:checkBoundary()

end

function UIResizeBorder:setMinimum(minimum)

  self.minimum = minimum

  self:checkBoundary()

end

function UIResizeBorder:getMaximum() return self.maximum end

function UIResizeBorder:getMinimum() return self.minimum end

function UIResizeBorder:setParentSize(size)

  local parent = self:getParent()

  if self.vertical then

    parent:setHeight(size)

  else

    parent:setWidth(size)

  end

  self:checkBoundary(size)

end

function UIResizeBorder:getParentSize()

  local parent = self:getParent()

  if self.vertical then

    return parent:getHeight()

  else

    return parent:getWidth()

  end

end

function UIResizeBorder:checkBoundary(size)

  size = size or self:getParentSize()

  if self.maximum == self.minimum and size == self.maximum then

    self:hide()

  else

    self:show()

  end

end

```

---
# uiscrollarea.lua

```lua

-- @docclass

UIScrollArea = extends(UIWidget, "UIScrollArea")

-- public functions

function UIScrollArea.create()

  local scrollarea = UIScrollArea.internalCreate()

  scrollarea:setClipping(true)

  scrollarea.inverted = false

  scrollarea.alwaysScrollMaximum = false

  return scrollarea

end

function UIScrollArea:onStyleApply(styleName, styleNode)

  for name,value in pairs(styleNode) do

    if name == 'vertical-scrollbar' then

      addEvent(function()

        local parent = self:getParent()

        if parent then

          self:setVerticalScrollBar(parent:getChildById(value))

        end

      end)

    elseif name == 'horizontal-scrollbar' then

      addEvent(function()

        local parent = self:getParent()

        if parent then

          self:setHorizontalScrollBar(self:getParent():getChildById(value))

        end

      end)

    elseif name == 'inverted-scroll' then

      self:setInverted(value)

    elseif name == 'always-scroll-maximum' then

      self:setAlwaysScrollMaximum(value)

    end

  end

end

function UIScrollArea:updateScrollBars()

  local scrollWidth = math.max(self:getChildrenRect().width - self:getPaddingRect().width, 0)

  local scrollHeight = math.max(self:getChildrenRect().height - self:getPaddingRect().height, 0)

  local scrollbar = self.verticalScrollBar

  if scrollbar then

    if self.inverted then

      scrollbar:setMinimum(-scrollHeight)

      scrollbar:setMaximum(0)

    else

      scrollbar:setMinimum(0)

      scrollbar:setMaximum(scrollHeight)

    end

  end

  local scrollbar = self.horizontalScrollBar

  if scrollbar then

    if self.inverted then

      scrollbar:setMinimum(-scrollWidth)

      scrollbar:setMaximum(0)

    else

      scrollbar:setMinimum(0)

      scrollbar:setMaximum(scrollWidth)

    end

  end

  if self.lastScrollWidth ~= scrollWidth then

    self:onScrollWidthChange()

  end

  if self.lastScrollHeight ~= scrollHeight then

    self:onScrollHeightChange()

  end

  self.lastScrollWidth = scrollWidth

  self.lastScrollHeight = scrollHeight

end

function UIScrollArea:setVerticalScrollBar(scrollbar)

  self.verticalScrollBar = scrollbar

  connect(self.verticalScrollBar, 'onValueChange', function(scrollbar, value)

    local virtualOffset = self:getVirtualOffset()

    virtualOffset.y = value

    self:setVirtualOffset(virtualOffset)

    signalcall(self.onScrollChange, self, virtualOffset)

  end)

  self:updateScrollBars()

end

function UIScrollArea:setHorizontalScrollBar(scrollbar)

  self.horizontalScrollBar = scrollbar

  connect(self.horizontalScrollBar, 'onValueChange', function(scrollbar, value)

    local virtualOffset = self:getVirtualOffset()

    virtualOffset.x = value

    self:setVirtualOffset(virtualOffset)

    signalcall(self.onScrollChange, self, virtualOffset)

  end)

  self:updateScrollBars()

end

function UIScrollArea:setInverted(inverted)

  self.inverted = inverted

end

function UIScrollArea:setAlwaysScrollMaximum(value)

  self.alwaysScrollMaximum = value

end

function UIScrollArea:onLayoutUpdate()

  self:updateScrollBars()

end

function UIScrollArea:onMouseWheel(mousePos, mouseWheel)

  if self.verticalScrollBar then

    if not self.verticalScrollBar:isOn() then

      return false

    end

    if mouseWheel == MouseWheelUp then

      local minimum = self.verticalScrollBar:getMinimum()

      if self.verticalScrollBar:getValue() <= minimum then

        return false

      end

      self.verticalScrollBar:decrement()

    else

      local maximum = self.verticalScrollBar:getMaximum()

      if self.verticalScrollBar:getValue() >= maximum then

        return false

      end

      self.verticalScrollBar:increment()

    end

  elseif self.horizontalScrollBar then

    if not self.horizontalScrollBar:isOn() then

      return false

    end

    if mouseWheel == MouseWheelUp then

      local maximum = self.horizontalScrollBar:getMaximum()

      if self.horizontalScrollBar:getValue() >= maximum then

        return false

      end

      self.horizontalScrollBar:increment()

    else

      local minimum = self.horizontalScrollBar:getMinimum()

      if self.horizontalScrollBar:getValue() <= minimum then

        return false

      end

      self.horizontalScrollBar:decrement()

    end

  end

  return true

end

function UIScrollArea:ensureChildVisible(child, offset)

  if child then

    local paddingRect = self:getPaddingRect()

    if not offset then

      offset = {x = 0, y = 0}

    end

    if self.verticalScrollBar then

      local deltaY = paddingRect.y - child:getY()

      if deltaY > 0 then

        self.verticalScrollBar:decrement(deltaY)

      end

      deltaY = (child:getY() + child:getHeight() + offset.y) - (paddingRect.y + paddingRect.height)

      if deltaY > 0 then

        self.verticalScrollBar:increment(deltaY)

      end

    elseif self.horizontalScrollBar then

      local deltaX = paddingRect.x - child:getX()

      if deltaX > 0 then

        self.horizontalScrollBar:decrement(deltaX)

      end

      deltaX = (child:getX() + child:getWidth() + offset.x) - (paddingRect.x + paddingRect.width)

      if deltaX > 0 then

        self.horizontalScrollBar:increment(deltaX)

      end

    end

  end

end

function UIScrollArea:onChildFocusChange(focusedChild, oldFocused, reason)

  if focusedChild and (reason == MouseFocusReason or reason == KeyboardFocusReason) then

    self:ensureChildVisible(focusedChild)

  end

end

function UIScrollArea:onScrollWidthChange()

  if self.alwaysScrollMaximum and self.horizontalScrollBar then

    self.horizontalScrollBar:setValue(self.horizontalScrollBar:getMaximum())

  end

end

function UIScrollArea:onScrollHeightChange()

  if self.alwaysScrollMaximum and self.verticalScrollBar then

    self.verticalScrollBar:setValue(self.verticalScrollBar:getMaximum())

  end

end

```

---
# uiscrollbar.lua

```lua

-- @docclass

UIScrollBar = extends(UIWidget, "UIScrollBar")

-- private functions

local function calcValues(self)

  local slider = self:getChildById('sliderButton')

  local decrementButton = self:getChildById('decrementButton')

  local incrementButton = self:getChildById('incrementButton')

  local pxrange, center

  if self.orientation == 'vertical' then

    pxrange = (self:getHeight() - decrementButton:getHeight() - decrementButton:getMarginTop() - decrementButton:getMarginBottom()

                                - incrementButton:getHeight() - incrementButton:getMarginTop() - incrementButton:getMarginBottom())

    center = self:getY() + math.floor(self:getHeight() / 2)

  else -- horizontal

    pxrange = (self:getWidth() - decrementButton:getWidth() - decrementButton:getMarginLeft() - decrementButton:getMarginRight()

                               - incrementButton:getWidth() - incrementButton:getMarginLeft() - incrementButton:getMarginRight())

    center = self:getX() + math.floor(self:getWidth() / 2)

  end

  local range = self.maximum - self.minimum + 1

  local proportion

  if self.pixelsScroll then

    proportion = pxrange/(range+pxrange)

  else

    proportion = math.min(math.max(self.step, 1), range)/range

  end

  local px = math.max(proportion * pxrange, 6)

  if g_app.isMobile() then

    px = math.max(proportion * pxrange, 24)  

  end

  px = px - px % 2 + 1

  local offset = 0

  if range == 0 or self.value == self.minimum then

    if self.orientation == 'vertical' then

      offset = -math.floor((self:getHeight() - px) / 2) + decrementButton:getMarginRect().height

    else

      offset = -math.floor((self:getWidth() - px) / 2) + decrementButton:getMarginRect().width

    end

  elseif range > 1 and self.value == self.maximum then

    if self.orientation == 'vertical' then

      offset = math.ceil((self:getHeight() - px) / 2) - incrementButton:getMarginRect().height

    else

      offset = math.ceil((self:getWidth() - px) / 2) - incrementButton:getMarginRect().width

    end

  elseif range > 1 then

    offset = (((self.value - self.minimum) / (range - 1)) - 0.5) * (pxrange - px)

  end

  return range, pxrange, px, offset, center

end

local function updateValueDisplay(widget)

  if widget == nil then return end

  if widget:getShowValue() then

    widget:setText(widget:getValue() .. (widget:getSymbol() or ''))

  end

end

local function updateSlider(self)

  local slider = self:getChildById('sliderButton')

  if slider == nil then return end

  local range, pxrange, px, offset, center = calcValues(self)

  if self.orientation == 'vertical' then

    slider:setHeight(px)

    slider:setMarginTop(offset)

  else -- horizontal

    slider:setWidth(px)

    slider:setMarginLeft(offset)

  end

  updateValueDisplay(self)

  local status = (self.maximum ~= self.minimum)

  self:setOn(status)

  for _i,child in pairs(self:getChildren()) do

    child:setEnabled(status)

  end

end

local function parseSliderPos(self, slider, pos, move)

  local delta, hotDistance

  if self.orientation == 'vertical' then

    delta = move.y

    hotDistance = pos.y - slider:getY()

  else

    delta = move.x

    hotDistance = pos.x - slider:getX()

  end

  if (delta > 0 and hotDistance + delta > self.hotDistance) or

     (delta < 0 and hotDistance + delta < self.hotDistance) then

    local range, pxrange, px, offset, center = calcValues(self)

    local newvalue = self.value + delta * (range / (pxrange - px))

    self:setValue(newvalue)

  end

end

local function parseSliderPress(self, slider, pos, button)

  if self.orientation == 'vertical' then

    self.hotDistance = pos.y - slider:getY()

  else

    self.hotDistance = pos.x - slider:getX()

  end

end

-- public functions

function UIScrollBar.create()

  local scrollbar = UIScrollBar.internalCreate()

  scrollbar:setFocusable(false)

  scrollbar.value = 0

  scrollbar.minimum = -999999

  scrollbar.maximum = 999999

  scrollbar.step = 1

  scrollbar.orientation = 'vertical'

  scrollbar.pixelsScroll = false

  scrollbar.showValue = false

  scrollbar.symbol = nil

  scrollbar.mouseScroll = true

  return scrollbar

end

function UIScrollBar:onSetup()

  self.setupDone = true

  local sliderButton = self:getChildById('sliderButton')

  g_mouse.bindAutoPress(self:getChildById('decrementButton'), function() self:onDecrement() end, 300)

  g_mouse.bindAutoPress(self:getChildById('incrementButton'), function() self:onIncrement() end, 300)

  g_mouse.bindPressMove(sliderButton, function(mousePos, mouseMoved) parseSliderPos(self, sliderButton, mousePos, mouseMoved) end)

  g_mouse.bindPress(sliderButton, function(mousePos, mouseButton) parseSliderPress(self, sliderButton, mousePos, mouseButton) end)

  updateSlider(self)

end

function UIScrollBar:onStyleApply(styleName, styleNode)

  for name,value in pairs(styleNode) do

    if name == 'maximum' then

      self:setMaximum(tonumber(value))

    elseif name == 'minimum' then

      self:setMinimum(tonumber(value))

    elseif name == 'step' then

      self:setStep(tonumber(value))

    elseif name == 'orientation' then

      self:setOrientation(value)

    elseif name == 'value' then

      self:setValue(value)

    elseif name == 'pixels-scroll' then

      self.pixelsScroll = true

    elseif name == 'show-value' then

      self.showValue = true

    elseif name == 'symbol' then

      self.symbol = value

    elseif name == 'mouse-scroll' then

      self.mouseScroll = value

    end

  end

end

function UIScrollBar:onDecrement()

  if g_keyboard.isCtrlPressed() then

    self:decrement(self.value)

  elseif g_keyboard.isShiftPressed() then

    self:decrement(10)

  else

    self:decrement()

  end

end

function UIScrollBar:onIncrement()

  if g_keyboard.isCtrlPressed() then

    self:increment(self.maximum)

  elseif g_keyboard.isShiftPressed() then

    self:increment(10)

  else

    self:increment()

  end

end

function UIScrollBar:decrement(count)

  count = count or self.step

  self:setValue(self.value - count)

end

function UIScrollBar:increment(count)

  count = count or self.step

  self:setValue(self.value + count)

end

function UIScrollBar:setMaximum(maximum)

  if maximum == self.maximum then return end

  self.maximum = maximum

  if self.minimum > maximum then

    self:setMinimum(maximum)

  end

  if self.value > maximum then

    self:setValue(maximum)

  else

    updateSlider(self)

  end

end

function UIScrollBar:setMinimum(minimum)

  if minimum == self.minimum then return end

  self.minimum = minimum

  if self.maximum < minimum then

    self:setMaximum(minimum)

  end

  if self.value < minimum then

    self:setValue(minimum)

  else

    updateSlider(self)

  end

end

function UIScrollBar:setRange(minimum, maximum)

  self:setMinimum(minimum)

  self:setMaximum(maximum)

end

function UIScrollBar:setValue(value)

  value = math.max(math.min(value, self.maximum), self.minimum)

  if self.value == value then return end

  local delta = value - self.value

  self.value = value

  updateSlider(self)

  if self.setupDone then

    signalcall(self.onValueChange, self, math.round(value), delta)

  end

end

function UIScrollBar:setMouseScroll(scroll)

  self.mouseScroll = scroll

end

function UIScrollBar:setStep(step)

  self.step = step

end

function UIScrollBar:setOrientation(orientation)

  self.orientation = orientation

end

function UIScrollBar:setText(text)

  local valueLabel = self:getChildById('valueLabel')

  if valueLabel then

    valueLabel:setText(text)

  end

end

function UIScrollBar:onGeometryChange()

  updateSlider(self)

end

function UIScrollBar:onMouseWheel(mousePos, mouseWheel)

  if not self.mouseScroll or not self:isOn() or self.disableScroll then

    return false

  end

  if mouseWheel == MouseWheelUp then

    if self.orientation == 'vertical' then

      if self.value <= self.minimum then  return false end

      self:decrement()

    else

      if self.value >= self.maximum then return false end

      self:increment()

    end

  else

    if self.orientation == 'vertical' then

      if self.value >= self.maximum then return false end

      self:increment()

    else

      if self.value <= self.minimum then  return false end

      self:decrement()

    end

  end

  return true

end

function UIScrollBar:getMaximum() return self.maximum end

function UIScrollBar:getMinimum() return self.minimum end

function UIScrollBar:getValue() return math.round(self.value) end

function UIScrollBar:getStep() return self.step end

function UIScrollBar:getOrientation() return self.orientation end

function UIScrollBar:getShowValue() return self.showValue end

function UIScrollBar:getSymbol() return self.symbol end

function UIScrollBar:getMouseScroll() return self.mouseScroll end

```

---
# uispinbox.lua

```lua

-- @docclass

UISpinBox = extends(UITextEdit, "UISpinBox")

function UISpinBox.create()

  local spinbox = UISpinBox.internalCreate()

  spinbox:setFocusable(false)

  spinbox:setValidCharacters('0123456789')

  spinbox.displayButtons = true

  spinbox.minimum = 0

  spinbox.maximum = 1

  spinbox.value = 0

  spinbox.step = 1

  spinbox.firstchange = true

  spinbox.mouseScroll = true

  spinbox:setText("1")

  spinbox:setValue(1)

  return spinbox

end

function UISpinBox:onSetup()

  g_mouse.bindAutoPress(self:getChildById('up'), function() self:up() end, 300)

  g_mouse.bindAutoPress(self:getChildById('down'), function() self:down() end, 300)

end

function UISpinBox:onMouseWheel(mousePos, direction)

  if not self.mouseScroll or self.disableScroll then

    return false

  end

  if direction == MouseWheelUp then

    self:up()

  elseif direction == MouseWheelDown then

    self:down()

  end

  return true

end

function UISpinBox:onKeyPress()

  if self.firstchange then

    self.firstchange = false

    self:setText('')

  end

  return false

end

function UISpinBox:onTextChange(text, oldText)

  if text:len() == 0 then

    self:setValue(self.minimum)

    return

  end

  local number = tonumber(text)

  if not number then

    self:setText(number)

    return

  else

    if number < self.minimum then

      self:setText(self.minimum)

      return

    elseif number > self.maximum then

      self:setText(self.maximum)

      return

    end

  end

  self:setValue(number)

end

function UISpinBox:onValueChange(value)

  -- nothing to do

end

function UISpinBox:onFocusChange(focused)

  if not focused then

    if self:getText():len() == 0 then

      self:setText(self.minimum)

    end

  end

end

function UISpinBox:onStyleApply(styleName, styleNode)

  for name, value in pairs(styleNode) do

    if name == 'maximum' then

      self.maximum = value

      addEvent(function() self:setMaximum(value) end)

    elseif name == 'minimum' then

      self.minimum = value

      addEvent(function() self:setMinimum(value) end)

    elseif name == 'mouse-scroll' then

      addEvent(function() self:setMouseScroll(value) end)

    elseif name == 'buttons' then

      addEvent(function()

        if value then

          self:showButtons()

        else

          self:hideButtons()

        end

      end)

    end

  end

end

function UISpinBox:showButtons()

  self:getChildById('up'):show()

  self:getChildById('down'):show()

  self.displayButtons = true

end

function UISpinBox:hideButtons()

  self:getChildById('up'):hide()

  self:getChildById('down'):hide()

  self.displayButtons = false

end

function UISpinBox:up()

  self:setValue(self.value + self.step)

end

function UISpinBox:down()

  self:setValue(self.value - self.step)

end

function UISpinBox:setValue(value, dontSignal)

  if type(value) == "string" then

    value = tonumber(value)

  end

  value = value or 0

  value = math.max(math.min(self.maximum, value), self.minimum)

  if value == self.value then return end

  self.value = value

  if self:getText():len() > 0 then

    self:setText(value)

  end

  local upButton = self:getChildById('up')

  local downButton = self:getChildById('down')

  if upButton then

    upButton:setEnabled(self.maximum ~= self.minimum and self.value ~= self.maximum)

  end

  if downButton then

    downButton:setEnabled(self.maximum ~= self.minimum and self.value ~= self.minimum)

  end

  if not dontSignal then

    signalcall(self.onValueChange, self, value)

  end

end

function UISpinBox:getValue()

  return self.value

end

function UISpinBox:setMinimum(minimum)

  minimum = minimum or -9223372036854775808

  self.minimum = minimum

  if self.minimum > self.maximum then

    self.maximum = self.minimum

  end

  if self.value < minimum then

    self:setValue(minimum)

  end

end

function UISpinBox:getMinimum()

  return self.minimum

end

function UISpinBox:setMaximum(maximum)

  maximum = maximum or 9223372036854775807

  self.maximum = maximum

  if self.value > maximum then

    self:setValue(maximum)

  end

end

function UISpinBox:getMaximum()

  return self.maximum

end

function UISpinBox:setStep(step)

  self.step = step or 1

end

function UISpinBox:setMouseScroll(mouseScroll)

  self.mouseScroll = mouseScroll

end

function UISpinBox:getMouseScroll()

  return self.mouseScroll

end

```

---
# uisplitter.lua

```lua

-- @docclass

UISplitter = extends(UIWidget, "UISplitter")

function UISplitter.create()

  local splitter = UISplitter.internalCreate()

  splitter:setFocusable(false)

  splitter.relativeMargin = 'bottom'

  return splitter

end

function UISplitter:onHoverChange(hovered)

  -- Check if margin can be changed

  local margin = (self.vertical and self:getMarginBottom() or self:getMarginRight())

  if hovered and (self:canUpdateMargin(margin + 1) ~= margin or self:canUpdateMargin(margin - 1) ~= margin) then

    if g_mouse.isCursorChanged() or g_mouse.isPressed() then return end

    if self:getWidth() > self:getHeight() then

      self.vertical = true

      self.cursortype = 'vertical'

    else

      self.vertical = false

      self.cursortype = 'horizontal'

    end

    self.hovering = true

    g_mouse.pushCursor(self.cursortype)

    if not self:isPressed() then

      g_effects.fadeIn(self)

    end

  else

    if not self:isPressed() and self.hovering then

      g_mouse.popCursor(self.cursortype)

      g_effects.fadeOut(self)

      self.hovering = false

    end

  end

end

function UISplitter:onMouseMove(mousePos, mouseMoved)

  if self:isPressed() then

    --local currentmargin, newmargin, delta

    if self.vertical then

      local delta = mousePos.y - self:getY() - self:getHeight()/2

      local newMargin = self:canUpdateMargin(self:getMarginBottom() - delta)

      local currentMargin = self:getMarginBottom()

      if newMargin ~= currentMargin then

        self.newMargin = newMargin

        if not self.event or self.event:isExecuted() then

          self.event = addEvent(function()

            self:setMarginBottom(self.newMargin)

          end)

        end

      end

    else

      local delta = mousePos.x - self:getX() - self:getWidth()/2

      local newMargin = self:canUpdateMargin(self:getMarginRight() - delta)

      local currentMargin = self:getMarginRight()

      if newMargin ~= currentMargin then

        self.newMargin = newMargin

        if not self.event or self.event:isExecuted() then

          self.event = addEvent(function()

            self:setMarginRight(self.newMargin)

          end)

        end

      end

    end

    return true

  end

end

function UISplitter:onMouseRelease(mousePos, mouseButton)

  if not self:isHovered() then

    g_mouse.popCursor(self.cursortype)

    g_effects.fadeOut(self)

    self.hovering = false

  end

end

function UISplitter:onStyleApply(styleName, styleNode)

  if styleNode['relative-margin'] then

    self.relativeMargin = styleNode['relative-margin']

  end

end

function UISplitter:canUpdateMargin(newMargin)

  return newMargin

end

```

---
# uitabbar.lua

```lua

-- @docclass

UITabBar = extends(UIWidget, "UITabBar")

-- private functions

local function onTabClick(tab)

  tab.tabBar:selectTab(tab)

end

local function onTabMouseRelease(tab, mousePos, mouseButton)

  if mouseButton == MouseRightButton and tab:containsPoint(mousePos) then

    signalcall(tab.tabBar.onTabLeftClick, tab.tabBar, tab)

  end

end

-- public functions

function UITabBar.create()

  local tabbar = UITabBar.internalCreate()

  tabbar:setFocusable(false)

  tabbar.tabs = {}

  return tabbar

end

function UITabBar:onSetup()

  self.buttonsPanel = self:getChildById('buttonsPanel')

end

function UITabBar:setContentWidget(widget)

  self.contentWidget = widget

  if #self.tabs > 0 then

    self.contentWidget:addChild(self.tabs[1].tabPanel)

  end

end

function UITabBar:addTab(text, panel, icon)

  if panel == nil then

    panel = g_ui.createWidget(self:getStyleName() .. 'Panel')

    panel:setId('tabPanel')

  end

  local tab = g_ui.createWidget(self:getStyleName() .. 'Button', self.buttonsPanel)

  panel.isTab = true

  tab.tabPanel = panel

  tab.tabBar = self

  tab:setId('tab')

  tab:setText(text)

  tab:setWidth(tab:getTextSize().width + tab:getPaddingLeft() + tab:getPaddingRight())

  tab.onClick = onTabClick

  tab.onMouseRelease = onTabMouseRelease

  tab.onDestroy = function() tab.tabPanel:destroy() end

  table.insert(self.tabs, tab)

  if #self.tabs == 1 then

    self:selectTab(tab)

  end

  local tabStyle = {}

  tabStyle['icon-source'] = icon

  tab:mergeStyle(tabStyle)

  return tab

end

function UITabBar:addButton(text, func, icon)

  local button = g_ui.createWidget(self:getStyleName() .. 'Button', self.buttonsPanel)

  button:setText(text)

  local style = {}

  style['icon-source'] = icon

  button:mergeStyle(style)

  button.onClick = func

  return button

end

function UITabBar:removeTab(tab)

  local index = table.find(self.tabs, tab)

  if index == nil then return end

  if self.currentTab == tab then

    self:selectPrevTab()

  end

  table.remove(self.tabs, index)

  tab:destroy()

end

function UITabBar:getTab(text)

  for k,tab in pairs(self.tabs) do

    if tab:getText():lower() == text:lower() then

      return tab

    end

  end

end

function UITabBar:selectTab(tab)

  if self.currentTab == tab then return end

  if self.contentWidget then

    local selectedWidget = self.contentWidget:getLastChild()

    if selectedWidget and selectedWidget.isTab then

      self.contentWidget:removeChild(selectedWidget)

    end

    self.contentWidget:addChild(tab.tabPanel)

    tab.tabPanel:fill('parent')

  end

  if self.currentTab then

    self.currentTab:setChecked(false)

  end

  signalcall(self.onTabChange, self, tab)

  self.currentTab = tab

  tab:setChecked(true)

  tab:setOn(false)

  local parent = tab:getParent()

  if parent then

    parent:focusChild(tab, MouseFocusReason)

  end

end

function UITabBar:selectNextTab()

  if self.currentTab == nil then return end

  local index = table.find(self.tabs, self.currentTab)

  if index == nil then return end

  local nextTab = self.tabs[index + 1] or self.tabs[1]

  if not nextTab then return end

  self:selectTab(nextTab)

end

function UITabBar:selectPrevTab()

  if self.currentTab == nil then return end

  local index = table.find(self.tabs, self.currentTab)

  if index == nil then return end

  local prevTab = self.tabs[index - 1] or self.tabs[#self.tabs]

  if not prevTab then return end

  self:selectTab(prevTab)

end

function UITabBar:getTabPanel(tab)

  return tab.tabPanel

end

function UITabBar:getCurrentTabPanel()

  if self.currentTab then

    return self.currentTab.tabPanel

  end

end

function UITabBar:getCurrentTab()

  return self.currentTab

end

function UITabBar:getTabs()

  return self.tabs

end

function UITabBar:getTabsPanel()

  return table.collect(self.tabs, function(_,tab) return tab.tabPanel end)

end

function UITabBar:clearTabs()

  while #self.tabs > 0 do

    self:removeTab(self.tabs[#self.tabs])

  end

end

```

---
# uitable.lua

```lua

-- @docclass

--[[

  TODO:

    * Make table headers more robust.

    * Get dynamic row heights working with text wrapping.

]]

TABLE_SORTING_ASC = 0

TABLE_SORTING_DESC = 1

UITable = extends(UIWidget, "UITable")

-- Initialize default values

function UITable.create()

  local table = UITable.internalCreate()

  table.headerRow = nil

  table.headerColumns = {}

  table.dataSpace = nil

  table.rows = {}

  table.rowBaseStyle = nil

  table.columns = {}

  table.columnWidth = {}

  table.columBaseStyle = nil

  table.headerRowBaseStyle = nil

  table.headerColumnBaseStyle = nil

  table.selectedRow = nil

  table.defaultColumnWidth = 80

  table.sortColumn = -1

  table.sortType = TABLE_SORTING_ASC

  table.autoSort = false

  return table

end

-- Clear table values

function UITable:onDestroy()

  for _,row in pairs(self.rows) do

    row.onClick = nil

  end

  self.rows = {}

  self.columns = {}

  self.headerRow = nil

  self.headerColumns = {}

  self.columnWidth = {}

  self.selectedRow = nil

  if self.dataSpace then

    self.dataSpace:destroyChildren()

    self.dataSpace = nil

  end

end

-- Detect if a header is already defined

function UITable:onSetup()

  local header = self:getChildById('header')

  if header then

    self:setHeader(header)

  end

end

-- Parse table related styles

function UITable:onStyleApply(styleName, styleNode)

  for name, value in pairs(styleNode) do

    if value ~= false then

      if name == 'table-data' then

        addEvent(function()

          self:setTableData(self:getParent():getChildById(value))

        end)

      elseif name == 'column-style' then

        addEvent(function()

          self:setColumnStyle(value)

        end)

      elseif name == 'row-style' then

        addEvent(function()

          self:setRowStyle(value)

        end)

      elseif name == 'header-column-style' then

        addEvent(function()

          self:setHeaderColumnStyle(value)

        end)

      elseif name == 'header-row-style' then

        addEvent(function()

          self:setHeaderRowStyle(value)

        end)

      end

    end

  end

end

function UITable:setColumnWidth(width)

  if self:hasHeader() then return end

  self.columnWidth = width

end

function UITable:setDefaultColumnWidth(width)

  self.defaultColumnWidth = width

end

-- Check if the table has a header

function UITable:hasHeader()

  return self.headerRow ~= nil

end

-- Clear all rows

function UITable:clearData()

  if not self.dataSpace then

    return

  end

  self.dataSpace:destroyChildren()

  self.selectedRow = nil

  self.columns = {}

  self.rows = {}

end

-- Set existing child as header

function UITable:setHeader(headerWidget)

  self:removeHeader()

  if self.dataSpace then

    local newHeight = self.dataSpace:getHeight()-headerRow:getHeight()-self.dataSpace:getMarginTop()

    self.dataSpace:applyStyle({ height = newHeight })

  end

  self.headerColumns = {}

  self.columnWidth = {}

  for colId, column in pairs(headerWidget:getChildren()) do

    column.colId = colId

    column.table = self

    table.insert(self.columnWidth, column:getWidth())

    table.insert(self.headerColumns, column)

  end

  self.headerRow = headerWidget

end

-- Create and add header from table data

function UITable:addHeader(data)

  if not data or type(data) ~= 'table' then

    g_logger.error('UITable:addHeaderRow - table columns must be provided in a table')

    return

  end

  self:removeHeader()

  -- build header columns

  local columns = {}

  for colId, column in pairs(data) do

    local col = g_ui.createWidget(self.headerColumnBaseStyle)

    col.colId = colId

    col.table = self

    for type, value in pairs(column) do

      if type == 'width' then

        col:setWidth(value)

      elseif type == 'height' then

        col:setHeight(value)

      elseif type == 'text' then

        col:setText(value)

      elseif type == 'onClick' then

        col.onClick = value

      end

    end

    table.insert(columns, col)

  end

  -- create a new header

  local headerRow = g_ui.createWidget(self.headerRowBaseStyle, self)

  local newHeight = self.dataSpace:getHeight()-headerRow:getHeight()-self.dataSpace:getMarginTop()

  self.dataSpace:applyStyle({ height = newHeight })

  headerRow:setId('header')

  self.headerColumns = {}

  self.columnWidth = {}

  for _, column in pairs(columns) do

    headerRow:addChild(column)

    table.insert(self.columnWidth, column:getWidth())

    table.insert(self.headerColumns, column)

  end

  self.headerRow = headerRow

  return headerRow

end

-- Remove header

function UITable:removeHeader()

  if self:hasHeader() then

    if self.dataSpace then

      local newHeight = self.dataSpace:getHeight()+self.headerRow:getHeight()+self.dataSpace:getMarginTop()

      self.dataSpace:applyStyle({ height = newHeight })

    end

    self.headerColumns = {}

    self.columnWidth = {}

    self.headerRow:destroy()

    self.headerRow = nil

  end

end

function UITable:addRow(data, height)

  if not self.dataSpace then

    g_logger.error('UITable:addRow - table data space has not been set, cannot add rows.')

    return

  end

  if not data or type(data) ~= 'table' then

    g_logger.error('UITable:addRow - table columns must be provided in a table.')

    return

  end

  local row = g_ui.createWidget(self.rowBaseStyle)

  row.table = self

  if height then row:setHeight(height) end

  local rowId = #self.rows + 1

  row.rowId = rowId

  row:setId('row'..rowId)

  row:updateBackgroundColor()

  self.columns[rowId] = {}

  for colId, column in pairs(data) do

    local col = g_ui.createWidget(self.columBaseStyle, row)

    if column.width then

      col:setWidth(column.width)

    else

      col:setWidth(self.columnWidth[colId] or self.defaultColumnWidth)

    end

    if column.height then

      col:setHeight(column.height)

    end

    if column.text then

      col:setText(column.text)

    end

    if column.sortvalue then

      col.sortvalue = column.sortvalue

    else

      col.sortvalue = column.text or 0

    end

    table.insert(self.columns[rowId], col)

  end

  self.dataSpace:addChild(row)

  table.insert(self.rows, row)

  if self.autoSort then

    self:sort()

  end

  return row

end

-- Update row indices and background color

function UITable:updateRows()

  for rowId = 1, #self.rows do

    local row = self.rows[rowId]

    row.rowId = rowId

    row:setId('row'..rowId)

    row:updateBackgroundColor()

  end

end

-- Removes the given row widget from the table

function UITable:removeRow(row)

  if self.selectedRow == row then

    self:selectRow(nil)

  end

  row.onClick = nil

  row.table = nil

  table.remove(self.columns, row.rowId)

  table.remove(self.rows, row.rowId)

  self.dataSpace:removeChild(row)

  self:updateRows()

end

function UITable:toggleSorting(enabled)

  self.autoSort = enabled

end

function UITable:setSorting(colId, sortType)

  self.headerColumns[colId]:focus()

  if sortType then

    self.sortType = sortType

  elseif self.sortColumn == colId then

    if self.sortType == TABLE_SORTING_ASC then

      self.sortType = TABLE_SORTING_DESC

    else

      self.sortType = TABLE_SORTING_ASC

    end

  else

    self.sortType = TABLE_SORTING_ASC

  end

  self.sortColumn = colId

end

function UITable:sort()

  if self.sortColumn <= 0 then

    return

  end

  if self.sortType == TABLE_SORTING_ASC then

    table.sort(self.rows, function(rowA, b)

      return rowA:getChildByIndex(self.sortColumn).sortvalue < b:getChildByIndex(self.sortColumn).sortvalue

    end)

  else

    table.sort(self.rows, function(rowA, b)

      return rowA:getChildByIndex(self.sortColumn).sortvalue > b:getChildByIndex(self.sortColumn).sortvalue

    end)

  end

  if self.dataSpace then

    for _, child in pairs(self.dataSpace:getChildren()) do

      self.dataSpace:removeChild(child)

    end

  end

  self:updateRows()

  self.columns = {}

  for _, row in pairs(self.rows) do

    if self.dataSpace then

      self.dataSpace:addChild(row)

    end

    self.columns[row.rowId] = {}

    for _, column in pairs(row:getChildren()) do

      table.insert(self.columns[row.rowId], column)

    end

  end

end

function UITable:selectRow(selectedRow)

  if selectedRow == self.selectedRow then return end

  local previousSelectedRow = self.selectedRow

  self.selectedRow = selectedRow

  if previousSelectedRow then

    previousSelectedRow:setChecked(false)

  end

  if selectedRow then

    selectedRow:setChecked(true)

  end

  signalcall(self.onSelectionChange, self, selectedRow, previousSelectedRow)

end

function UITable:setTableData(tableData)

  local headerHeight = 0

  if self.headerRow then

    headerHeight = self.headerRow:getHeight()

  end

  self.dataSpace = tableData

  self.dataSpace:applyStyle({ height = self:getHeight()-headerHeight-self:getMarginTop() })

end

function UITable:setRowStyle(style, dontUpdate)

  self.rowBaseStyle = style

  if not dontUpdate then

    for _, row in pairs(self.rows) do

      row:setStyle(style)

    end

  end

end

function UITable:setColumnStyle(style, dontUpdate)

  self.columBaseStyle = style

  if not dontUpdate then

    for _, columns in pairs(self.columns) do

      for _, col in pairs(columns) do

        col:setStyle(style)

      end

    end

  end

end

function UITable:setHeaderRowStyle(style)

  self.headerRowBaseStyle = style

  if self.headerRow then

    self.headerRow:setStyle(style)

  end

end

function UITable:setHeaderColumnStyle(style)

  self.headerColumnBaseStyle = style

  for _, col in pairs(self.headerColumns) do

    col:setStyle(style)

  end

end

UITableRow = extends(UIWidget, "UITableRow")

function UITableRow:onFocusChange(focused)

  if focused then

    if self.table then self.table:selectRow(self) end

  end

end

function UITableRow:onStyleApply(styleName, styleNode)

  for name,value in pairs(styleNode) do

    if name == 'even-background-color' then

      self.evenBackgroundColor = value

    elseif name == 'odd-background-color' then

      self.oddBackgroundColor = value

    end

  end

end

function UITableRow:updateBackgroundColor()

  self.backgroundColor = nil

  local isEven = (self.rowId % 2 == 0)

  if isEven and self.evenBackgroundColor then

    self.backgroundColor = self.evenBackgroundColor

  elseif not isEven and self.oddBackgroundColor then

    self.backgroundColor = self.oddBackgroundColor

  end

  if self.backgroundColor then

    self:mergeStyle({ ['background-color'] = self.backgroundColor })

  end

end

UITableHeaderColumn = extends(UIButton, "UITableHeaderColumn")

function UITableHeaderColumn:onClick()

  if self.table then

    self.table:setSorting(self.colId)

    self.table:sort()

  end

end

```

---
# uitextedit.lua

```lua

function UITextEdit:onStyleApply(styleName, styleNode)

  for name,value in pairs(styleNode) do

    if name == 'vertical-scrollbar' then

      addEvent(function()

        self:setVerticalScrollBar(self:getParent():getChildById(value))

      end)

    elseif name == 'horizontal-scrollbar' then

      addEvent(function()

        self:setHorizontalScrollBar(self:getParent():getChildById(value))

      end)

    end

  end

end

function UITextEdit:onMouseWheel(mousePos, mouseWheel)

  if self.verticalScrollBar and self:isMultiline() then

    if mouseWheel == MouseWheelUp then

      self.verticalScrollBar:decrement()

    else

      self.verticalScrollBar:increment()

    end

    return true

  elseif self.horizontalScrollBar then

    if mouseWheel == MouseWheelUp then

      self.horizontalScrollBar:increment()

    else

      self.horizontalScrollBar:decrement()

    end

    return true

  end

end

function UITextEdit:onTextAreaUpdate(virtualOffset, virtualSize, totalSize)

  self:updateScrollBars()

end

function UITextEdit:setVerticalScrollBar(scrollbar)

  self.verticalScrollBar = scrollbar

  self.verticalScrollBar.onValueChange = function(scrollbar, value)

    local virtualOffset = self:getTextVirtualOffset()

    virtualOffset.y = value

    self:setTextVirtualOffset(virtualOffset)

  end

  self:updateScrollBars()

end

function UITextEdit:setHorizontalScrollBar(scrollbar)

  self.horizontalScrollBar = scrollbar

  self.horizontalScrollBar.onValueChange = function(scrollbar, value)

    local virtualOffset = self:getTextVirtualOffset()

    virtualOffset.x = value

    self:setTextVirtualOffset(virtualOffset)

  end

  self:updateScrollBars()

end

function UITextEdit:updateScrollBars()

  local scrollSize = self:getTextTotalSize()

  local scrollWidth = math.max(scrollSize.width - self:getTextVirtualSize().width, 0)

  local scrollHeight = math.max(scrollSize.height - self:getTextVirtualSize().height, 0)

  local scrollbar = self.verticalScrollBar

  if scrollbar then

    scrollbar:setMinimum(0)

    scrollbar:setMaximum(scrollHeight)

    scrollbar:setValue(self:getTextVirtualOffset().y)

  end

  local scrollbar = self.horizontalScrollBar

  if scrollbar then

    scrollbar:setMinimum(0)

    scrollbar:setMaximum(scrollWidth)

    scrollbar:setValue(self:getTextVirtualOffset().x)

  end

end

-- todo: ontext change, focus to cursor

```

---
# uiwidget.lua

```lua

-- @docclass UIWidget

function UIWidget:setMargin(...)

  local params = {...}

  if #params == 1 then

    self:setMarginTop(params[1])

    self:setMarginRight(params[1])

    self:setMarginBottom(params[1])

    self:setMarginLeft(params[1])

  elseif #params == 2 then

    self:setMarginTop(params[1])

    self:setMarginRight(params[2])

    self:setMarginBottom(params[1])

    self:setMarginLeft(params[2])

  elseif #params == 4 then

    self:setMarginTop(params[1])

    self:setMarginRight(params[2])

    self:setMarginBottom(params[3])

    self:setMarginLeft(params[4])

  end

end

```

---
# uiwindow.lua

```lua

-- @docclass

UIWindow = extends(UIWidget, "UIWindow")

function UIWindow.create()

  local window = UIWindow.internalCreate()

  window:setTextAlign(AlignTopCenter)

  window:setDraggable(true)  

  window:setAutoFocusPolicy(AutoFocusFirst)

  return window

end

function UIWindow:onKeyDown(keyCode, keyboardModifiers)

  if keyboardModifiers == KeyboardNoModifier then

    if keyCode == KeyEnter then

      signalcall(self.onEnter, self)

    elseif keyCode == KeyEscape then

      signalcall(self.onEscape, self)

    end

  end

end

function UIWindow:onFocusChange(focused)

  if focused then self:raise() end

end

function UIWindow:onDragEnter(mousePos)

  if self.static then

    return false

  end

  self:breakAnchors()

  self.movingReference = { x = mousePos.x - self:getX(), y = mousePos.y - self:getY() }

  return true

end

function UIWindow:onDragLeave(droppedWidget, mousePos)

  -- TODO: auto detect and reconnect anchors

end

function UIWindow:onDragMove(mousePos, mouseMoved)

  if self.static then

    return

  end

  local pos = { x = mousePos.x - self.movingReference.x, y = mousePos.y - self.movingReference.y }

  self:setPosition(pos)

  self:bindRectToParent()

end

```

---

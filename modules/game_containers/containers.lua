local gameStart = 0
local characterName = nil
local settingsFile = "/settings/containers.json"
local settings = {}

function init()
  connect(Container, { onOpen = onContainerOpen,
                       onClose = onContainerClose,
                       onSizeChange = onContainerChangeSize,
                       onUpdateItem = onContainerUpdateItem })
  connect(g_game, {
    onGameStart = online,
    onGameEnd = offline
  })

  reloadContainers()
  if g_game.isOnline() then
    online()
  end
end

function terminate()
  disconnect(Container, { onOpen = onContainerOpen,
                          onClose = onContainerClose,
                          onSizeChange = onContainerChangeSize,
                          onUpdateItem = onContainerUpdateItem })
  disconnect(g_game, { 
    onGameStart = online,
    onGameEnd = offline
  })
end

function reloadContainers()
  clean()
  for _,container in pairs(g_game.getContainers()) do
    onContainerOpen(container)
  end
end

function clean()
  for containerid,container in pairs(g_game.getContainers()) do
    destroy(container)
  end
end

function offline()
  local cache = {}
  -- save new
  for containerid, container in pairs(g_game.getContainers()) do
    local window = container.window
    if window then
      local parent = window:getParent():getId()
      cache[parent] = cache[parent] or {}
      table.insert(cache[parent], {
        id = containerid,
        height = window:getHeight(),
        index = window:getParent():getChildIndex(window),
        name = container:getName()
      })
    end
  end

  -- sort
  for parent, data in pairs(cache) do
    table.sort(data, function(a,b) return a.index < b.index end)
  end

  -- load current settings
  load()
  settings[characterName] = table.copy(cache)

  -- save to json
  save()

  characterName = nil

  clean()
end

function online()
  -- basics
  gameStart = g_clock.millis()
  characterName = g_game.getCharacterName()

  -- load json
  load()

  -- secure data
  settings[characterName] = settings[characterName] or {}

  -- move to positions
  scheduleEvent(function()
    local containers = g_game.getContainers()
    for parent, array in pairs(settings[characterName]) do
      for i=1,#array do
        local data = array[i]
        local parentWidget = g_ui.getRootWidget():recursiveGetChildById(parent)
        if parentWidget and parentWidget:isVisible() then
          local container = containers[data.id]
          if container and container:getName() == data.name then
            local window = container.window
            if window then
              window:setParent(parentWidget)
              window:setHeight(data.height)
              local childs = parentWidget:getChildCount()
              local index = data.index <= childs and data.index or childs
              parentWidget:moveChildToIndex(window, index)
            end
          end
        end
      end
    end
  end, 10)
end

function destroy(container)
  if container.window then
    container.window:destroy()
    container.window = nil
    container.itemsPanel = nil
  end
end

function refreshContainerItems(container)
  for slot=0,container:getCapacity()-1 do
    local itemWidget = container.itemsPanel:getChildById('item' .. slot)
    itemWidget:setItem(container:getItem(slot))
  end

  if container:hasPages() then
    refreshContainerPages(container)
  end
end

function toggleContainerPages(containerWindow, hasPages)
  if hasPages == containerWindow.pagePanel:isOn() then
    return
  end
  containerWindow.pagePanel:setOn(hasPages)
  if hasPages then
    containerWindow.miniwindowScrollBar:setMarginTop(containerWindow.miniwindowScrollBar:getMarginTop() + containerWindow.pagePanel:getHeight())
    containerWindow.contentsPanel:setMarginTop(containerWindow.contentsPanel:getMarginTop() + containerWindow.pagePanel:getHeight())  
  else  
    containerWindow.miniwindowScrollBar:setMarginTop(containerWindow.miniwindowScrollBar:getMarginTop() - containerWindow.pagePanel:getHeight())
    containerWindow.contentsPanel:setMarginTop(containerWindow.contentsPanel:getMarginTop() - containerWindow.pagePanel:getHeight())
  end
end

function refreshContainerPages(container)
  local currentPage = 1 + math.floor(container:getFirstIndex() / container:getCapacity())
  local pages = 1 + math.floor(math.max(0, (container:getSize() - 1)) / container:getCapacity())
  container.window:recursiveGetChildById('pageLabel'):setText(string.format('Page %i of %i', currentPage, pages))

  local prevPageButton = container.window:recursiveGetChildById('prevPageButton')
  if currentPage == 1 then
    prevPageButton:setEnabled(false)
  else
    prevPageButton:setEnabled(true)
    prevPageButton.onClick = function() g_game.seekInContainer(container:getId(), container:getFirstIndex() - container:getCapacity()) end
  end

  local nextPageButton = container.window:recursiveGetChildById('nextPageButton')
  if currentPage >= pages then
    nextPageButton:setEnabled(false)
  else
    nextPageButton:setEnabled(true)
    nextPageButton.onClick = function() g_game.seekInContainer(container:getId(), container:getFirstIndex() + container:getCapacity()) end
  end
  
  local pagePanel = container.window:recursiveGetChildById('pagePanel')
  if pagePanel then
    pagePanel.onMouseWheel = function(widget, mousePos, mouseWheel)
      if pages == 1 then return end
      if mouseWheel == MouseWheelUp then
        return prevPageButton.onClick()
      else
        return nextPageButton.onClick()
      end
    end
  end
end

function onContainerOpen(container, previousContainer)
  local containerWindow
  if previousContainer then
    containerWindow = previousContainer.window
    previousContainer.window = nil
    previousContainer.itemsPanel = nil
  else
    containerWindow = g_ui.createWidget('ContainerWindow', modules.game_interface.getContainerPanel())

    -- white border flash effect
    containerWindow:setBorderWidth(2)
    containerWindow:setBorderColor("#FFFFFF")
    scheduleEvent(function() 
      if containerWindow then
        containerWindow:setBorderWidth(0)
      end
    end, 300)
  end
  
  containerWindow:setId('container' .. container:getId())
  if gameStart + 1000 < g_clock.millis() then
    containerWindow:clearSettings()
  end
  
  local containerPanel = containerWindow:getChildById('contentsPanel')
  local containerItemWidget = containerWindow:getChildById('containerItemWidget')
  containerWindow.onClose = function()
    g_game.close(container)
    containerWindow:hide()
  end
  containerWindow.onDrop = function(container, widget, mousePos)
    if containerPanel:getChildByPos(mousePos) then
      return false
    end
    local child = containerPanel:getChildByIndex(-1)
    if child then
      child:onDrop(widget, mousePos, true)        
    end
  end
  
  containerWindow.onMouseRelease = function(widget, mousePos, mouseButton)
    if mouseButton == MouseButton4 then
      if container:hasParent() then
        return g_game.openParent(container)
      end
    elseif mouseButton == MouseButton5 then
      for i, item in ipairs(container:getItems()) do
        if item:isContainer() then
          return g_game.open(item, container)
        end
      end
    end
  end

  -- this disables scrollbar auto hiding
  local scrollbar = containerWindow:getChildById('miniwindowScrollBar')
  scrollbar:mergeStyle({ ['$!on'] = { }})

  local upButton = containerWindow:getChildById('upButton')
  upButton.onClick = function()
    g_game.openParent(container)
  end
  upButton:setVisible(container:hasParent())

  local name = container:getName()
  name = name:sub(1,1):upper() .. name:sub(2)
  containerWindow:setText(name)

  containerItemWidget:setItem(container:getContainerItem())

  containerPanel:destroyChildren()
  for slot=0,container:getCapacity()-1 do
    local itemWidget = g_ui.createWidget('Item', containerPanel)
    itemWidget:setId('item' .. slot)
    itemWidget:setItem(container:getItem(slot))
    itemWidget:setMargin(0)
    itemWidget.position = container:getSlotPosition(slot)

    if not container:isUnlocked() then
      itemWidget:setBorderColor('red')
    end
  end

  container.window = containerWindow
  container.itemsPanel = containerPanel

  toggleContainerPages(containerWindow, container:hasPages())
  refreshContainerPages(container)

  local layout = containerPanel:getLayout()
  local cellSize = layout:getCellSize()
  containerWindow:setContentMinimumHeight(cellSize.height)
  containerWindow:setContentMaximumHeight(cellSize.height*layout:getNumLines())

  if container:hasPages() then
    local height = containerWindow.miniwindowScrollBar:getMarginTop() + containerWindow.pagePanel:getHeight()+17
    if containerWindow:getHeight() < height then
      containerWindow:setHeight(height)
    end
  end

  if not previousContainer then
    local filledLines = math.max(math.ceil(container:getItemsCount() / layout:getNumColumns()), 1)
    containerWindow:setContentHeight(filledLines*cellSize.height)
  end

  containerWindow:setup()
end

function onContainerClose(container)
  destroy(container)
end

function onContainerChangeSize(container, size)
  if not container.window then return end
  refreshContainerItems(container)
end

function onContainerUpdateItem(container, slot, item, oldItem)
  if not container.window then return end
  local itemWidget = container.itemsPanel:getChildById('item' .. slot)
  itemWidget:setItem(item)
end

function save()
  local status, result = pcall(function() return json.encode(settings, 2) end)
  if not status then
      return g_logger.error(
                 "Error while saving containers settings. Data won't be saved. Details: " ..
                     result)
  end

  if result:len() > 100 * 1024 * 1024 then
      return g_logger.error(
                 "Something went wrong, file is above 100MB, won't be saved")
  end

  g_resources.writeFileContents(settingsFile, result)
end

function load()
  if g_resources.fileExists(settingsFile) then
      local status, result = pcall(function()
          return json.decode(g_resources.readFileContents(settingsFile))
      end)
      if not status then
          return g_logger.error(
                     "Error while reading containers settings file. To fix this problem you can delete json file. Details: " ..
                         result)
      end
      settings = result
  else
    settings = {}
  end
end
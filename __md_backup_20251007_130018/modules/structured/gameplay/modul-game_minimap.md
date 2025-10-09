# ¦ Modul: `game_minimap`

```otui

FlagButton < CheckBox

  size: 15 15

  margin-left: 2

  image-source: /images/game/minimap/flagcheckbox

  image-size: 15 15

  image-border: 3

  icon-source: /images/game/minimap/mapflags

  icon-size: 11 11

  icon-clip: 0 0 11 11

  icon-offset: 2 4

  text:

  $!checked:

    image-clip: 26 0 26 26

  $hover !checked:

    image-clip: 78 0 26 26

  $checked:

    image-clip: 0 0 26 26

  $hover checked:

    image-clip: 52 0 26 26

FlagWindow < MainWindow

  id: flagWindow

  !text: tr('Create Map Mark')

  size: 196 185

  Label

    id: position

    !text: tr('Position') .. ':'

    text-auto-resize: true

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 2

  Label

    !text: tr('Description') .. ':'

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 7

  TextEdit

    id: description

    margin-top: 3

    anchors.left: parent.left

    anchors.top: prev.bottom

    width: 158

  FlagButton

    id: flag1

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 6

    margin-left: 0

  FlagButton

    id: flag2

    icon-clip: 11 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag3

    icon-clip: 22 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag4

    icon-clip: 33 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag5

    icon-clip: 44 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag6

    icon-clip: 55 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag7

    icon-clip: 66 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag8

    icon-clip: 77 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag9

    icon-clip: 88 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag10

    icon-clip: 99 0 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag11

    icon-clip: 0 11 11 11

    anchors.left: parent.left

    anchors.top: prev.bottom

    margin-top: 6

    margin-left: 0

  FlagButton

    id: flag12

    icon-clip: 11 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag13

    icon-clip: 22 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag14

    icon-clip: 33 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag15

    icon-clip: 44 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag16

    icon-clip: 55 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag17

    icon-clip: 66 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag18

    icon-clip: 77 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag19

    icon-clip: 88 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  FlagButton

    id: flag20

    icon-clip: 99 11 11 11

    anchors.left: prev.right

    anchors.top: prev.top

  Button

    id: okButton

    !text: tr('Ok')

    width: 64

    anchors.right: next.left

    anchors.bottom: parent.bottom

    margin-right: 10

  Button

    id: cancelButton

    !text: tr('Cancel')

    width: 64

    anchors.right: parent.right

    anchors.bottom: parent.bottom

```

---
# minimap.lua

```lua

minimapWidget = nil

minimapButton = nil

minimapWindow = nil

fullmapView = false

loaded = false

oldZoom = nil

oldPos = nil

function init()

  minimapWindow = g_ui.loadUI('minimap', modules.game_interface.getRightPanel())

  minimapWindow:setContentMinimumHeight(64)

  if not minimapWindow.forceOpen then

    minimapButton = modules.client_topmenu.addRightGameToggleButton('minimapButton', 

      tr('Minimap') .. ' (Ctrl+M)', '/images/topbuttons/minimap', toggle)

    minimapButton:setOn(true)

  end

  minimapWidget = minimapWindow:recursiveGetChildById('minimap')

  local gameRootPanel = modules.game_interface.getRootPanel()

  g_keyboard.bindKeyPress('Alt+Left', function() minimapWidget:move(1,0) end, gameRootPanel)

  g_keyboard.bindKeyPress('Alt+Right', function() minimapWidget:move(-1,0) end, gameRootPanel)

  g_keyboard.bindKeyPress('Alt+Up', function() minimapWidget:move(0,1) end, gameRootPanel)

  g_keyboard.bindKeyPress('Alt+Down', function() minimapWidget:move(0,-1) end, gameRootPanel)

  g_keyboard.bindKeyDown('Ctrl+M', toggle)

  g_keyboard.bindKeyDown('Ctrl+Shift+M', toggleFullMap)

  minimapWindow:setup()

  connect(g_game, {

    onGameStart = online,

    onGameEnd = offline,

})

  connect(LocalPlayer, {

    onPositionChange = updateCameraPosition

})

  if g_game.isOnline() then

    online()

  end

end

function terminate()

  if g_game.isOnline() then

    saveMap()

  end

  disconnect(g_game, {

    onGameStart = online,

    onGameEnd = offline,

})

  disconnect(LocalPlayer, {

    onPositionChange = updateCameraPosition

})

  local gameRootPanel = modules.game_interface.getRootPanel()

  g_keyboard.unbindKeyPress('Alt+Left', gameRootPanel)

  g_keyboard.unbindKeyPress('Alt+Right', gameRootPanel)

  g_keyboard.unbindKeyPress('Alt+Up', gameRootPanel)

  g_keyboard.unbindKeyPress('Alt+Down', gameRootPanel)

  g_keyboard.unbindKeyDown('Ctrl+M')

  g_keyboard.unbindKeyDown('Ctrl+Shift+M')

  minimapWindow:destroy()

  if minimapButton then

    minimapButton:destroy()

  end

end

function toggle()

  if not minimapButton then return end

  if minimapButton:isOn() then

    minimapWindow:close()

    minimapButton:setOn(false)

  else

    minimapWindow:open()

    minimapButton:setOn(true)

  end

end

function onMiniWindowClose()

  if minimapButton then

    minimapButton:setOn(false)

  end

end

function online()

  loadMap()

  updateCameraPosition()

end

function offline()

  saveMap()

end

function loadMap()

  local clientVersion = g_game.getClientVersion()

  g_minimap.clean()

  loaded = false

  local minimapFile = '/minimap.otmm'

  local dataMinimapFile = '/data' .. minimapFile

  local versionedMinimapFile = '/minimap' .. clientVersion .. '.otmm'

  if g_resources.fileExists(dataMinimapFile) then

    loaded = g_minimap.loadOtmm(dataMinimapFile)

  end

  if not loaded and g_resources.fileExists(versionedMinimapFile) then

    loaded = g_minimap.loadOtmm(versionedMinimapFile)

  end

  if not loaded and g_resources.fileExists(minimapFile) then

    loaded = g_minimap.loadOtmm(minimapFile)

  end

  if not loaded then

    print("Minimap couldn't be loaded, file missing?")

  end

  minimapWidget:load()

end

function saveMap()

  local clientVersion = g_game.getClientVersion()

  local minimapFile = '/minimap' .. clientVersion .. '.otmm' 

  g_minimap.saveOtmm(minimapFile)

  minimapWidget:save()

end

function updateCameraPosition()

  local player = g_game.getLocalPlayer()

  if not player then return end

  local pos = player:getPosition()

  if not pos then return end

  if not minimapWidget:isDragging() then

    if not fullmapView then

      minimapWidget:setCameraPosition(player:getPosition())

    end

    minimapWidget:setCrossPosition(player:getPosition())

  end

end

function toggleFullMap()

  if not fullmapView then

    fullmapView = true

    minimapWindow:hide()

    minimapWidget:setParent(modules.game_interface.getRootPanel())

    minimapWidget:fill('parent')

    minimapWidget:setAlternativeWidgetsVisible(true)

  else

    fullmapView = false

    minimapWidget:setParent(minimapWindow:getChildById('contentsPanel'))

    minimapWidget:fill('parent')

    minimapWindow:show()

    minimapWidget:setAlternativeWidgetsVisible(false)

  end

  local zoom = oldZoom or 0

  local pos = oldPos or minimapWidget:getCameraPosition()

  oldZoom = minimapWidget:getZoom()

  oldPos = minimapWidget:getCameraPosition()

  minimapWidget:setZoom(zoom)

  minimapWidget:setCameraPosition(pos)

end

```

---
# minimap.otmod

```text

Module

  name: game_minimap

  description: Manage minimap

  author: edubart, BeniS

  website: https://github.com/edubart/otclient

  sandboxed: true

  scripts: [ minimap ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# minimap.otui

```otui

MinimapWindow

  id: minimapWindow

  !text: tr('Minimap')

  icon: /images/topbuttons/minimap

  @onClose: modules.game_minimap.onMiniWindowClose()

  &save: true

  &autoOpen: 1

```

---

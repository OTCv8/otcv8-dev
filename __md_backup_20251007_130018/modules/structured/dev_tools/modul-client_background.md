# ¦ Modul: `client_background`

```lua

-- private variables

local background

local clientVersionLabel

-- public functions

function init()

  background = g_ui.displayUI('background')

  background:lower()

  clientVersionLabel = background:getChildById('clientVersionLabel')

  clientVersionLabel:setText('OTClientV8 ' .. g_app.getVersion() .. '\nrev ' .. g_app.getBuildRevision() .. '\nMade by:\n' .. g_app.getAuthor() .. "")

  if not g_game.isOnline() then

    addEvent(function() g_effects.fadeIn(clientVersionLabel, 1500) end)

  end

  connect(g_game, { onGameStart = hide })

  connect(g_game, { onGameEnd = show })

end

function terminate()

  disconnect(g_game, { onGameStart = hide })

  disconnect(g_game, { onGameEnd = show })

  g_effects.cancelFade(background:getChildById('clientVersionLabel'))

  background:destroy()

  Background = nil

end

function hide()

  background:hide()

end

function show()

  background:show()

end

function hideVersionLabel()

  background:getChildById('clientVersionLabel'):hide()

end

function setVersionText(text)

  clientVersionLabel:setText(text)

end

function getBackground()

  return background

end

```

---
# background.otmod

```text

Module

  name: client_background

  description: Handles the background of the login screen

  author: edubart

  website: https://github.com/edubart/otclient

  sandboxed: true

  scripts: [ background ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# background.otui

```otui

UIWidget

  id: background

  anchors.fill: parent

  focusable: false

  image-source: /images/background

  image-smooth: true

  image-fixed-ratio: true

  margin-top: 1

  UILabel

    id: clientVersionLabel

    background-color: #00000099

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    text-align: center

    text-auto-resize: false

    width: 220

    height: 90

    padding: 2

    color: #ffffff

    font: terminus-14px-bold

```

---

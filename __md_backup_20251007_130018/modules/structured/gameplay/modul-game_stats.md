# ¦ Modul: `game_stats`

```lua

ui = nil

updateEvent = nil

function init()

  ui = g_ui.loadUI('stats', modules.game_interface.getMapPanel())

  if not modules.client_options.getOption("showPing") then

    ui.fps:hide()

  end

  if not modules.client_options.getOption("showFps") then

    ui.ping:hide()

  end

  updateEvent = scheduleEvent(update, 200)

end

function terminate()

  removeEvent(updateEvent)

end

function update()

  updateEvent = scheduleEvent(update, 500)

  if ui:isHidden() then return end

  text = 'FPS: ' .. g_app.getFps()

  ui.fps:setText(text)

  local ping = g_game.getPing()

  if g_proxy and g_proxy.getPing() > 0 then

    ping = g_proxy.getPing()

  end

  local text = 'Ping: '

  local color

  if ping < 0 then

    text = text .. "??"

    color = 'yellow'

  else

    text = text .. ping .. ' ms'

    if ping >= 500 then

      color = 'red'

    elseif ping >= 250 then

      color = 'yellow'

    else

      color = 'green'

    end

  end

  ui.ping:setText(text)

  ui.ping:setColor(color)

end

function show()

  ui:setVisible(true)

end

function hide()

  ui:setVisible(false)

end

```

---
# stats.otmod

```text

Module

  name: game_stats

  description: Display ping and fps

  author: otclient.ovh

  website: http://otclient.ovh

  sandboxed: true

  scripts: [ stats ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# stats.otui

```otui

UIWidget

  id: game_stats

  anchors.top: parent.top

  anchors.left: parent.left

  margin-left: 3

  size: 100 100

  visible: false

  layout:

    type: verticalBox  

  Label

    id: fps

    font: verdana-11px-rounded

  Label

    id: ping

    font: verdana-11px-rounded

```

---

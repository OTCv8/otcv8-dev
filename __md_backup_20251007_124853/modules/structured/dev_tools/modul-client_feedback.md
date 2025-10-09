# ¦ Modul: `client_feedback`

```lua

local feedbackWindow

local textEdit

local okButton

local cancelButton

local postId = 0

local tries = 0

local replyEvent = nil

function init()

  feedbackWindow = g_ui.displayUI('feedback')

  feedbackWindow:hide()

  textEdit = feedbackWindow:getChildById('text')

  okButton = feedbackWindow:getChildById('okButton')

  cancelButton = feedbackWindow:getChildById('cancelButton')

  okButton.onClick = send

  cancelButton.onClick = hide

  feedbackWindow.onEscape = hide    

end

function terminate()

  feedbackWindow:destroy()

  removeEvent(replyEvent)

end

function show()

  if not Services or not Services.feedback or Services.feedback:len() < 4 then

    return

  end

  feedbackWindow:show()

  feedbackWindow:raise()

  feedbackWindow:focus()

  textEdit:setMaxLength(8192)

  textEdit:setText('')

  textEdit:setEditable(true)

  textEdit:setCursorVisible(true)

  feedbackWindow:focusChild(textEdit, KeyboardFocusReason)

  tries = 0

end

function hide()

  feedbackWindow:hide()

  textEdit:setEditable(false)

  textEdit:setCursorVisible(false)

end

function send()

  local text = textEdit:getText()

  if text:len() > 1 then

    local localPlayer = g_game.getLocalPlayer()

    local playerData = nil

    if localPlayer ~= nil then

      playerData = {

        name = localPlayer:getName(),

        position = localPlayer:getPosition()

}

    end

    local details = {

      report_delay = sendInterval,

      os = g_app.getOs(),

      graphics_vendor = g_graphics.getVendor(),

      graphics_renderer = g_graphics.getRenderer(),

      graphics_version = g_graphics.getVersion(),

      fps = g_app.getFps(),

      maxFps = g_app.getMaxFps(),

      atlas = g_atlas.getStats(),

      classic = tostring(g_settings.getBoolean("classicView")),

      fullscreen = tostring(g_window.isFullscreen()),

      vsync = tostring(g_settings.getBoolean("vsync")),

      window_width = g_window.getWidth(),

      window_height = g_window.getHeight(),

      player_name = g_game.getCharacterName(),

      world_name = g_game.getWorldName(),

      otserv_host = G.host,

      otserv_protocol = g_game.getProtocolVersion(),

      otserv_client = g_game.getClientVersion(),

      build_version = g_app.getVersion(),

      build_revision = g_app.getBuildRevision(),

      build_commit = g_app.getBuildCommit(),

      build_date = g_app.getBuildDate(),

      display_width = g_window.getDisplayWidth(),

      display_height = g_window.getDisplayHeight(),

      cpu = g_platform.getCPUName(),

      mem = g_platform.getTotalSystemMemory(),

      os_name = g_platform.getOSName()

}

    local data = json.encode({

      text = text,

      version = g_app.getVersion(),

      host = g_settings.get('host'),

      player = playerData,

      details = details

})

    postId = HTTP.post(Services.feedback, data, function(ret, err) 

      if err then

        tries = tries + 1

        if tries < 3 then 

          replyEvent = scheduleEvent(send, 1000)

        end

      end

    end)

  end 

  hide()

end

```

---
# feedback.otmod

```text

Module

  name: client_feedback

  description: Allow to send feedback

  author: otclientv8

  website: otclient.ovh

  sandboxed: true

  dependencies: [ game_interface ]

  scripts: [ feedback ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# feedback.otui

```otui

MainWindow

  id: feedbackWindow

  size: 400 280

  !text: tr("Feedback/Bug report")

  Label

    id: description

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text-auto-resize: true

    text-align: left

    text-wrap: true

    !text: tr("Bellow enter your feedback or bug report. Please include as much details as possible. Thank you!")

  MultilineTextEdit

    id: text

    anchors.top: textScroll.top

    anchors.left: parent.left

    anchors.right: textScroll.left

    anchors.bottom: textScroll.bottom

    vertical-scrollbar: textScroll

    text-wrap: true

  VerticalScrollBar

    id: textScroll

    anchors.top: description.bottom

    anchors.bottom: okButton.top

    anchors.right: parent.right

    margin-top: 10

    margin-bottom: 10

    step: 16

    pixels-scroll: true

  Button

    id: okButton

    !text: tr('Ok')

    anchors.bottom: parent.bottom

    anchors.right: next.left

    margin-right: 10

    width: 60

  Button

    id: cancelButton

    !text: tr('Cancel')

    anchors.bottom: parent.bottom

    anchors.right: parent.right

    width: 60

```

---

# ¦ Modul: `game_bugreport`

```lua

-- TODO: find another hotkey for this. Ctrl+Z will be reserved to undo on textedits.

HOTKEY = 'Ctrl+Z'

bugReportWindow = nil

bugTextEdit = nil

function init()

  g_ui.importStyle('bugreport')

  bugReportWindow = g_ui.createWidget('BugReportWindow', rootWidget)

  bugReportWindow:hide()

  bugTextEdit = bugReportWindow:getChildById('bugTextEdit')

  g_keyboard.bindKeyDown(HOTKEY, show, modules.game_interface.getRootPanel())

end

function terminate()

  g_keyboard.unbindKeyDown(HOTKEY, modules.game_interface.getRootPanel())

  bugReportWindow:destroy()

end

function doReport()

  g_game.reportBug(bugTextEdit:getText())

  bugReportWindow:hide()

  modules.game_textmessage.displayGameMessage(tr('Bug report sent.'))

end

function show()

  if g_game.isOnline() then

    bugTextEdit:setText('')

    bugReportWindow:show()

    bugReportWindow:raise()

    bugReportWindow:focus()

  end

end

```

---
# bugreport.otmod

```text

Module

  name: game_bugreport

  description: Bug report interface (Ctrl+Z)

  author: edubart

  website: https://github.com/edubart/otclient

  scripts: [ bugreport ]

  sandboxed: true

  @onLoad: init()

  @onUnload: terminate()

```

---
# bugreport.otui

```otui

BugReportWindow < MainWindow

  !text: tr('Report Bug')

  size: 280 250

  @onEscape: self:hide()

  Label

    id: bugLabel

    !text: tr('Please use this dialog to only report bugs. Do not report rule violations here!')

    text-wrap: true

    text-auto-resize: true

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

  MultilineTextEdit

    id: bugTextEdit

    anchors.top: bugLabel.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: sendButton.top

    margin-top: 4

    margin-bottom: 8

  Button

    id: sendButton

    !text: tr('Send')

    anchors.bottom: cancelButton.bottom

    anchors.right: cancelButton.left

    margin-right: 10

    width: 80

    &onClick: doReport

  Button

    id: cancelButton

    !text: tr('Cancel')

    anchors.bottom: parent.bottom

    anchors.right: parent.right

    width: 80

    @onClick: self:getParent():hide()

```

---

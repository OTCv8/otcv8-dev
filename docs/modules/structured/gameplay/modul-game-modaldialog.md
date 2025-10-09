# Moduł: | Moduł: `game_modaldialog`
```lua

modalDialog = nil

lastDialogChoices = 0

lastDialogChoice = 0

lastDialogAnswer = 0

function init()

  g_ui.importStyle('modaldialog')

  connect(g_game, { onModalDialog = onModalDialog,

                    onGameEnd = destroyDialog })

  local dialog = rootWidget:recursiveGetChildById('modalDialog')

  if dialog then

    modalDialog = dialog

  end

end

function terminate()

  disconnect(g_game, { onModalDialog = onModalDialog,

                       onGameEnd = destroyDialog })

end

function destroyDialog()

  if modalDialog then

    modalDialog:destroy()

    modalDialog = nil

  end

end

function onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority)

  -- priority parameter is unused, not sure what its use is.

  if modalDialog then

    return

  end

  modalDialog = g_ui.createWidget('ModalDialog', rootWidget)

  local messageLabel = modalDialog:getChildById('messageLabel')

  local choiceList = modalDialog:getChildById('choiceList')

  local choiceScrollbar = modalDialog:getChildById('choiceScrollBar')

  local buttonsPanel = modalDialog:getChildById('buttonsPanel')

  modalDialog:setText(title)

  messageLabel:setText(message)

  local labelHeight

  for i = 1, #choices do

    local choiceId = choices[i][1]

    local choiceName = choices[i][2]

    local label = g_ui.createWidget('ChoiceListLabel', choiceList)

    label.choiceId = choiceId

    label:setText(choiceName)

    label:setPhantom(false)

    if not labelHeight then

      labelHeight = label:getHeight()

    end

  end

  if #choices > 0 then

    if g_clock.millis() < lastDialogAnswer + 1000 and lastDialogChoices == #choices then

      choiceList:focusChild(choiceList:getChildByIndex(lastDialogChoice))

    else

      choiceList:focusChild(choiceList:getFirstChild())

    end

  end

  local buttonsWidth = 0

  for i = 1, #buttons do

    local buttonId = buttons[i][1]

    local buttonText = buttons[i][2]

    local button = g_ui.createWidget('ModalButton', buttonsPanel)

    button:setText(buttonText)

    button.onClick = function(self)

                       local focusedChoice = choiceList:getFocusedChild()

                       local choice = 0xFF

                       if focusedChoice then

                         choice = focusedChoice.choiceId

                         lastDialogChoice = choiceList:getChildIndex(focusedChoice)

                         lastDialogAnswer = g_clock.millis()

                       end

                       g_game.answerModalDialog(id, buttonId, choice)

                       destroyDialog()

                     end

    buttonsWidth = buttonsWidth + button:getWidth() + button:getMarginLeft() + button:getMarginRight()

  end

  local additionalHeight = 0

  if #choices > 0 then

    choiceList:setVisible(true)

    choiceScrollbar:setVisible(true)

    additionalHeight = math.min(modalDialog.maximumChoices, math.max(modalDialog.minimumChoices, #choices)) * labelHeight

    additionalHeight = additionalHeight + choiceList:getPaddingTop() + choiceList:getPaddingBottom()

  end

  local horizontalPadding = modalDialog:getPaddingLeft() + modalDialog:getPaddingRight()

  buttonsWidth = buttonsWidth + horizontalPadding

  local labelWidth = math.min(600, math.floor(message:len() * 1.5))

  modalDialog:setWidth(math.min(modalDialog.maximumWidth, math.max(buttonsWidth, labelWidth, modalDialog.minimumWidth)))

  messageLabel:setTextWrap(true)

  modalDialog:setHeight(90 + additionalHeight + messageLabel:getHeight())

  local enterFunc = function()

    local focusedChoice = choiceList:getFocusedChild()

    local choice = 0xFF

    if focusedChoice then

      choice = focusedChoice.choiceId

      lastDialogChoice = choiceList:getChildIndex(focusedChoice)

      lastDialogAnswer = g_clock.millis()

    end

    g_game.answerModalDialog(id, enterButton, choice)

    destroyDialog()

  end

  local escapeFunc = function()

    local focusedChoice = choiceList:getFocusedChild()

    local choice = 0xFF

    if focusedChoice then

      choice = focusedChoice.choiceId

      lastDialogChoice = choiceList:getChildIndex(focusedChoice)

      lastDialogAnswer = g_clock.millis()

    end

    g_game.answerModalDialog(id, escapeButton, choice)

    destroyDialog()

  end

  choiceList.onDoubleClick = enterFunc

  modalDialog.onEnter = enterFunc

  modalDialog.onEscape = escapeFunc

  lastDialogChoices = #choices

end

```

---
# modaldialog.otmod
```text

Module

  name: game_modaldialog

  description: Show and process modal dialogs

  author: Summ

  website: https://github.com/edubart/otclient

  sandboxed: true

  dependencies: [ game_interface ]

  scripts: [ modaldialog ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# modaldialog.otui
```otui

ChoiceListLabel < Label

  font: verdana-11px-monochrome

  background-color: alpha

  text-offset: 2 0

  focusable: true

  $focus:

    background-color: #00000055

    color: #ffffff

ChoiceList < TextList

  id: choiceList

  vertical-scrollbar: choiceScrollBar

  anchors.fill: parent

  anchors.top: prev.bottom

  anchors.bottom: next.top

  margin-top: 4

  margin-bottom: 10

  focusable: false

  visible: false

ChoiceScrollBar < VerticalScrollBar

  id: choiceScrollBar

  anchors.top: choiceList.top

  anchors.bottom: choiceList.bottom

  anchors.right: choiceList.right

  step: 14

  pixels-scroll: true

  visible: false

ModalButton < Button

  text-auto-resize: true

  margin-top: 2

  margin-bottom: 2

  margin-left: 2

  $pressed:

    text-offset: 0 0

ModalDialog < MainWindow

  id: modalDialog

  size: 280 97

  &minimumWidth: 300

  &maximumWidth: 600

  &minimumChoices: 4

  &maximumChoices: 10

  Label

    id: messageLabel

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    text-align: left

    text-auto-resize: true

    text-wrap: true

  ChoiceList

  HorizontalSeparator

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: next.top

    margin-bottom: 5

  Panel

    id: buttonsPanel

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    height: 24

    layout: horizontalBox

      align-right: true

  ChoiceScrollBar

```

---


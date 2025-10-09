# Moduł: | Moduł: `game_itemselector`
```lua

local activeWindow

function init()

  g_ui.importStyle('itemselector')

  connect(g_game, { onGameEnd = destroyWindow })

end

function terminate()

  disconnect(g_game, { onGameEnd = destroyWindow })

  destroyWindow()

end

function destroyWindow()

  if activeWindow then

    activeWindow:destroy()

    activeWindow = nil

  end

end

function show(itemWidget)

  if not itemWidget then

    return

  end

  if activeWindow then

    destroyWindow()

  end

  local window = g_ui.createWidget('ItemSelectorWindow', rootWidget)

  local destroy = function()

    window:destroy()

    if window == activeWindow then

      activeWindow = nil

    end

  end

  local doneFunc = function()

    itemWidget:setItem(Item.create(window.item:getItemId(), window.item:getItemCount()))

    destroy()

  end

  local clearFunc = function()

    window.item:setItemId(0)

    window.item:setItemCount(0)

    doneFunc()

  end

  window.clearButton.onClick = clearFunc

  window.okButton.onClick = doneFunc

  window.cancelButton.onClick = destroy

  window.onEnter = doneFunc

  window.onEscape = destroy

  window.item:setItem(Item.create(itemWidget:getItemId(), itemWidget:getItemCount()))

  window.itemId:setValue(itemWidget:getItemId())

  if itemWidget:getItemCount() > 1 then

    window.itemCount:setValue(itemWidget:getItemCount())

  end

  window.itemId.onValueChange = function(widget, value)

    window.item:setItemId(value)

  end

  window.itemCount.onValueChange = function(widget, value)

    window.item:setItemCount(value)

  end

  activeWindow = window

  activeWindow:raise()

  activeWindow:focus()

end

function hide()

  destroyWindow()

end

```

---
# itemselector.otmod
```text

Module

  name: game_itemselector

  description: Allow to select item

  author: OTClientV8

  website: https://github.com/OTCv8/otclientv8

  sandboxed: true

  dependencies: [ game_interface ]

  scripts: [ itemselector ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# itemselector.otui
```otui

ItemSelectorWindow < MainWindow

  id: itemSelector

  size: 260 120

  !text: tr("Select item")

  Item

    id: item

    virtual: true

    size: 32 32

    margin-top: 10

    anchors.top: parent.top

    anchors.left: parent.left

  SpinBox

    id: itemId

    anchors.top: parent.top

    anchors.left: prev.right

    margin-top: 15

    margin-left: 5

    padding-left: 5

    width: 70

    minimum: 0

    maximum: 999999

    focusable: true

  Label

    anchors.top: parent.top

    anchors.left: prev.left

    anchors.right: prev.right

    text-align: center

    !text: tr("Item ID")

  SpinBox

    id: itemCount

    anchors.top: parent.top

    anchors.left: prev.right

    margin-top: 15

    margin-left: 5

    padding-left: 5

    width: 120

    minimum: 1

    maximum: 100

    focusable: true

  Label

    anchors.top: parent.top

    anchors.left: prev.left

    anchors.right: prev.right

    text-align: center

    !text: tr("Count / SubType")

  Button

    id: clearButton

    !text: tr('Clear')

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    width: 60

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


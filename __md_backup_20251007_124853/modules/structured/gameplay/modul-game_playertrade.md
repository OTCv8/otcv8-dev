# ¦ Modul: `game_playertrade`

```lua

tradeWindow = nil

function init()

  g_ui.importStyle('tradewindow')

  connect(g_game, { onOwnTrade = onGameOwnTrade,

                    onCounterTrade = onGameCounterTrade,

                    onCloseTrade = onGameCloseTrade,

                    onGameEnd = onGameCloseTrade })

end

function terminate()

  disconnect(g_game, { onOwnTrade = onGameOwnTrade,

                       onCounterTrade = onGameCounterTrade,

                       onCloseTrade = onGameCloseTrade,

                       onGameEnd = onGameCloseTrade })

  if tradeWindow then

    tradeWindow:destroy()

  end

end

function createTrade()

  tradeWindow = g_ui.createWidget('TradeWindow', modules.game_interface.getRightPanel())

  tradeWindow.onClose = function()

    g_game.rejectTrade()

    tradeWindow:hide()

  end

  tradeWindow:setup()

end

function fillTrade(name, items, counter)

  if not tradeWindow then

    createTrade()

  end

  local tradeItemWidget = tradeWindow:getChildById('tradeItem')

  tradeItemWidget:setItemId(items[1]:getId())

  local tradeContainer

  local label

  local countLabel

  if counter then

    tradeContainer = tradeWindow:recursiveGetChildById('counterTradeContainer')

    label = tradeWindow:recursiveGetChildById('counterTradeLabel')

    countLabel = tradeWindow:recursiveGetChildById('counterTradeCountLabel')

    tradeWindow:recursiveGetChildById('acceptButton'):enable()

  else

    tradeContainer = tradeWindow:recursiveGetChildById('ownTradeContainer')

    label = tradeWindow:recursiveGetChildById('ownTradeLabel')

    countLabel = tradeWindow:recursiveGetChildById('ownTradeCountLabel')

  end

  label:setText(name)

  countLabel:setText(tr("Items") .. ": " .. #items)

  for index,item in ipairs(items) do

    local itemWidget = g_ui.createWidget('Item', tradeContainer)

    itemWidget:setItem(item)

    itemWidget:setVirtual(true)

    itemWidget:setMargin(0)

    itemWidget.onClick = function()

      g_game.inspectTrade(counter, index-1)

    end

  end

end

function onGameOwnTrade(name, items)

  fillTrade(name, items, false)

end

function onGameCounterTrade(name, items)

  fillTrade(name, items, true)

end

function onGameCloseTrade()

  if tradeWindow then

    tradeWindow:destroy()

    tradeWindow = nil

  end

end

```

---
# playertrade.otmod

```text

Module

  name: game_playertrade

  description: Allow to trade items with players

  author: edubart

  website: https://github.com/edubart/otclient

  sandboxed: true

  scripts: [ playertrade ]

  @onLoad: init()

  @onUnload: terminate()

```

---
# tradewindow.otui

```otui

TradeWindow < MiniWindow

  !text: tr('Trade')

  height: 150

  UIItem

    id: tradeItem

    virtual: true

    size: 16 16

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 4

    margin-left: 4

  MiniWindowContents

    padding: 2

    Label

      id: ownTradeLabel

      anchors.top: parent.top

      anchors.left: parent.left

      anchors.right: parent.horizontalCenter

    Label

      id: counterTradeLabel

      anchors.top: parent.top

      anchors.left: parent.horizontalCenter

      anchors.right: parent.right

    Label

      id: ownTradeCountLabel

      anchors.top: ownTradeLabel.bottom

      anchors.left: ownTradeLabel.left

      anchors.right: ownTradeLabel.right

      font: verdana-9px-bold

      text-align: center

    Label

      id: counterTradeCountLabel

      anchors.top: counterTradeLabel.bottom

      anchors.left: counterTradeLabel.left

      anchors.right: counterTradeLabel.right

      font: verdana-9px-bold

      text-align: center

    ScrollableFlatPanel

      id: ownTradeContainer

      anchors.top: ownTradeCountLabel.bottom

      anchors.bottom: acceptButton.top

      anchors.left: ownTradeCountLabel.left

      anchors.right: ownTradeCountLabel.right

      margin-bottom: 3

      padding: 2

      layout:

        type: grid

        cell-size: 34 34

        flow: true

        cell-spacing: 1

      vertical-scrollbar: ownTradeScrollBar

    VerticalScrollBar

      id: ownTradeScrollBar

      anchors.top: ownTradeContainer.top

      anchors.bottom: ownTradeContainer.bottom

      anchors.right: parent.horizontalCenter

      step: 14

      pixels-scroll: true

      $!on:

        width: 0

    ScrollableFlatPanel

      id: counterTradeContainer

      anchors.top: counterTradeCountLabel.bottom

      anchors.bottom: acceptButton.top

      anchors.left: counterTradeCountLabel.left

      anchors.right: counterTradeCountLabel.right

      margin-bottom: 3

      padding: 2

      layout:

        type: grid

        cell-size: 34 34

        flow: true

        cell-spacing: 1

      vertical-scrollbar: counterTradeScrollBar

    VerticalScrollBar

      id: counterTradeScrollBar

      anchors.top: counterTradeContainer.top

      anchors.bottom: counterTradeContainer.bottom

      anchors.right: parent.right

      step: 14

      pixels-scroll: true

      $!on:

        width: 0

    Button

      !text: tr('Accept')

      id: acceptButton

      anchors.bottom: parent.bottom

      anchors.left: parent.left

      anchors.right: parent.horizontalCenter

      margin-right: 2

      enabled: false

      @onClick: g_game.acceptTrade(); self:disable()

    Button

      !text: tr('Reject')

      id: rejectButton

      anchors.bottom: parent.bottom

      anchors.right: parent.right

      anchors.left: parent.horizontalCenter

      margin-left: 2

      @onClick: g_game.rejectTrade()

```

---

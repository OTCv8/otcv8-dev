# Moduł: | Moduł: `game_market/ui/general`
```otui

AmountWindow < MainWindow

  id: amountWindow

  !text: tr('Amount')

  size: 270 90

  Item

    id: item

    text-offset: 0 22

    text-align: right

    anchors.left: parent.left

    anchors.top: parent.top

    margin-top: 2

    margin-left: -4

    focusable: false

    virtual: true

  HorizontalScrollBar

    id: amountScrollBar

    anchors.left: prev.right

    anchors.right: parent.right

    anchors.top: prev.top

    margin-left: 10

    margin-top: -2

  Button

    id: buttonCancel

    !text: tr('Cancel')

    height: 20

    anchors.left: amountScrollBar.horizontalCenter

    anchors.right: amountScrollBar.right

    anchors.top: amountScrollBar.bottom

    margin-top: 7

    focusable: false

  Button

    id: buttonOk

    !text: tr('Ok')

    height: 20

    anchors.right: amountScrollBar.horizontalCenter

    anchors.left: amountScrollBar.left

    anchors.top: amountScrollBar.bottom

    margin-top: 7

    margin-right: 6

    focusable: false

```

---
# marketbuttons.otui
```otui

MarketButtonBox < ButtonBoxRounded

  font: verdana-11px-rounded

  color: #f55e5ebb

  size: 106 22

  text-offset: 0 2

  text-align: center

  $checked:

    color: white

  $disabled:

    color: #666666ff

    image-color: #ffffff88

```

---
# marketcombobox.otui
```otui

MarketComboBoxPopupMenuButton < ComboBoxPopupMenuButton

  height: 18

  font: verdana-11px-rounded

  text-offset: 2 2

MarketComboBoxPopupMenuSeparator < UIWidget

  image-source: /images/combobox_rounded

  image-repeated: true

  image-clip: 1 59 89 1

  height: 1

  phantom: true

MarketComboBoxPopupMenu < ComboBoxPopupMenu

MarketComboBox < ComboBox

  font: verdana-11px-rounded

  size: 86 20

  text-offset: 3 2

```

---
# markettabs.otui
```otui

MarketTabBar < TabBar

MarketTabBarPanel < TabBarPanel

MarketTabBarButton < TabBarButton

  size: 20 25

  font: verdana-11px-rounded

  text-offset: 0 2

  $!first:

    anchors.left: prev.right

    margin-left: 0

  $hover !checked:

    color: #ffffff

  $checked:

    color: #ffffff

  $on !checked:

    color: #f55e5e

MarketRightTabBar < TabBar

MarketRightTabBarPanel < TabBarPanel

MarketRightTabBarButton < TabBarButton

  size: 20 25

  font: verdana-11px-rounded

  text-offset: 0 2

  color: #929292

  $first:

    anchors.right: parent.right

    anchors.left: none

  $!first:

    anchors.right: prev.left

    anchors.left: none

  $hover !checked:

    color: #ffffff

  $checked:

    color: #ffffff

  $on !checked:

    color: #f55e5e

```

---


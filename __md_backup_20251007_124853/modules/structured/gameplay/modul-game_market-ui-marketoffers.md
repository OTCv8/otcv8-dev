# ¦ Modul: `game_market/ui/marketoffers`

```otui

MarketItemBox < UICheckBox

  id: itemBox

  border-width: 1

  border-color: #000000

  color: #aaaaaa

  text-align: center

  Item

    id: item

    phantom: true

    virtual: true

    text-offset: 0 22

    text-align: right

    anchors.top: parent.top

    anchors.horizontalCenter: parent.horizontalCenter

    margin: 1

  $checked:

    border-color: #ffffff

  $hover !checked:

    border-color: #aaaaaa

  $disabled:

    image-color: #ffffff88

    color: #aaaaaa88

Panel

  background-color: #22283399

  margin: 1

  MarketComboBox

    id: categoryComboBox

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 3

    margin-right: 3

    margin-left: 3

  MarketComboBox

    id: subCategoryComboBox

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 3

    margin-right: 3

    margin-left: 3

    $disabled:

      color: #aaaaaa44

  MarketButtonBox

    id: filterLevel

    &default: false

    !text: tr('Level')

    !tooltip: tr('Filter list to match your level')

    anchors.top: prev.bottom

    anchors.left: parent.left

    margin-top: 3

    margin-right: 3

    margin-left: 3

    width: 40

    height: 20

  MarketButtonBox

    id: filterVocation

    &default: false

    !text: tr('Voc.')

    !tooltip: tr('Filter list to match your vocation')

    anchors.top: prev.top

    anchors.left: prev.right

    margin-right: 3

    margin-left: 3

    width: 34

    height: 20

  MarketComboBox

    id: slotComboBox

    anchors.top: prev.top

    anchors.left: prev.right

    anchors.right: parent.right

    margin-right: 3

    margin-left: 3

    $disabled:

      color: #aaaaaa44

  MarketButtonBox

    id: filterDepot

    &default: false

    !text: tr('Show Depot Only')

    !tooltip: tr('Show your depot items only')

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 6

    margin-right: 3

    margin-left: 3

  Panel

    id: itemsContainer

    anchors.top: prev.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    anchors.bottom: parent.bottom

    margin-top: 10

    margin-left: 3

    margin-bottom: 30

    margin-right: 3

    VerticalScrollBar

      id: itemsPanelListScrollBar

      anchors.top: parent.top

      anchors.bottom: parent.bottom

      anchors.right: parent.right

      step: 28

      pixels-scroll: true

    ScrollablePanel

      id: itemsPanel

      anchors.left: parent.left

      anchors.right: prev.left

      anchors.top: parent.top

      anchors.bottom: parent.bottom

      vertical-scrollbar: itemsPanelListScrollBar

      layout:

        type: grid

        cell-size: 36 36

        flow: true

        auto-spacing: true

  Label

    !text: tr('Find') .. ':'

    anchors.top: prev.bottom

    anchors.left: prev.left

    margin-top: 9

    width: 30

    font: verdana-11px-rounded

    text-offset: 0 2

  TextEdit

    id: searchEdit

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    margin-left: 3

    width: 113

    @onTextChange: Market.updateCurrentItems()

  MarketButtonBox

    id: filterSearchAll

    &default: true

    !text: tr('All')

    !tooltip: tr('Search all items')

    anchors.verticalCenter: prev.verticalCenter

    anchors.left: prev.right

    anchors.right: itemsContainer.right

    margin-left: 3

```

---
# itemdetails.otui

```otui

DetailsTableRow < TableRow

  font: verdana-11px-monochrome

  focusable: true

  color: #cccccc

  height: 45

  focusable: false

  padding: 2

  even-background-color: alpha

  odd-background-color: alpha

DetailsTableColumn < TableColumn

  font: verdana-11px-monochrome

  background-color: alpha

  text-offset: 2 2

  color: #cccccc

  width: 100

  focusable: false

Panel

  background-color: #22283399

  margin: 1

  Table

    id: detailsTable

    anchors.top: parent.top

    anchors.bottom: parent.bottom

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 63

    margin-left: 6

    margin-bottom: 85

    margin-right: 6

    padding: 1

    focusable: false

    background-color: #222833

    border-width: 1

    border-color: #191f27

    table-data: detailsTableData

    row-style: DetailsTableRow

    column-style: DetailsTableColumn

  TableData

    id: detailsTableData

    anchors.top: detailsTable.top

    anchors.bottom: detailsTable.bottom

    anchors.left: detailsTable.left

    anchors.right: detailsTable.right

    vertical-scrollbar: detailsTableScrollBar

  VerticalScrollBar

    id: detailsTableScrollBar

    anchors.top: detailsTable.top

    anchors.bottom: detailsTable.bottom

    anchors.right: detailsTable.right

    step: 28

    pixels-scroll: true

```

---
# itemoffers.otui

```otui

OfferTableRow < TableRow

  font: verdana-11px-monochrome

  color: #cccccc

  height: 15

OfferTableColumn < TableColumn

  font: verdana-11px-monochrome

  background-color: alpha

  text-offset: 5 0

  color: #cccccc

  width: 80

OfferTableWarningColumn < OfferTableColumn

  color: #e03d3d

OfferTableHeaderRow < TableHeaderRow

  font: verdana-11px-monochrome

  color: #cccccc

  height: 20

OfferTableHeaderColumn < SortableTableHeaderColumn

  font: verdana-11px-monochrome

  text-offset: 2 0

  color: #cccccc

  $focus:

    background-color: #294f6d

    color: #ffffff

Panel

  background-color: #22283399

  margin: 1

  Button

    id: buyButton

    !text: tr('Buy Now')

    anchors.right: parent.right

    anchors.bottom: next.bottom

    margin-right: 6

    width: 80

    enabled: false

  Label

    !text: tr('Sell Offers')

    font: verdana-11px-rounded

    text-offset: 0 2

    anchors.top: parent.top

    anchors.left: parent.left

    margin-top: 44

    margin-left: 6

  Table

    id: sellingTable

    anchors.top: prev.bottom

    anchors.left: prev.left

    anchors.right: parent.right

    height: 115

    margin-top: 5

    margin-bottom: 5

    margin-right: 6

    padding: 1

    focusable: false

    background-color: #222833

    border-width: 1

    border-color: #191f27

    table-data: sellingTableData

    row-style: OfferTableRow

    column-style: OfferTableColumn

    header-column-style: false

    header-row-style: false

    OfferTableHeaderRow

      id: header

      OfferTableHeaderColumn

        !text: tr('Buyer Name')

        width: 100

      OfferTableHeaderColumn

        !text: tr('Amount')

        width: 60

      OfferTableHeaderColumn

        !text: tr('Total Price')

        width: 90

      OfferTableHeaderColumn

        !text: tr('Piece Price')

        width: 80

      OfferTableHeaderColumn

        !text: tr('Auction End')

        width: 120

  TableData

    id: sellingTableData

    anchors.bottom: sellingTable.bottom

    anchors.left: sellingTable.left

    anchors.right: sellingTable.right

    margin-top: 2

    vertical-scrollbar: sellingTableScrollBar

  VerticalScrollBar

    id: sellingTableScrollBar

    anchors.top: sellingTable.top

    anchors.bottom: sellingTable.bottom

    anchors.right: sellingTable.right

    step: 28

    pixels-scroll: true

  Button

    id: sellButton

    !text: tr('Sell Now')

    anchors.right: parent.right

    anchors.top: prev.bottom

    margin-top: 5

    margin-right: 6

    width: 80

    enabled: false

  Label

    !text: tr('Buy Offers')

    font: verdana-11px-rounded

    text-offset: 0 2

    anchors.top: prev.top

    anchors.left: parent.left

    margin-top: 9

    margin-left: 6

  Table

    id: buyingTable

    anchors.top: prev.bottom

    anchors.left: prev.left

    anchors.right: parent.right

    margin-top: 5

    margin-bottom: 5

    margin-right: 6

    height: 115

    padding: 1

    focusable: false

    background-color: #222833

    border-width: 1

    border-color: #191f27

    table-data: buyingTableData

    row-style: OfferTableRow

    column-style: OfferTableColumn

    header-column-style: false

    header-row-style: false

    OfferTableHeaderRow

      id: header

      OfferTableHeaderColumn

        !text: tr('Seller Name')

        width: 100

      OfferTableHeaderColumn

        !text: tr('Amount')

        width: 60

      OfferTableHeaderColumn

        !text: tr('Total Price')

        width: 90

      OfferTableHeaderColumn

        !text: tr('Piece Price')

        width: 80

      OfferTableHeaderColumn

        !text: tr('Auction End')

        width: 120

  TableData

    id: buyingTableData

    anchors.bottom: buyingTable.bottom

    anchors.left: buyingTable.left

    anchors.right: buyingTable.right

    vertical-scrollbar: buyingTableScrollBar

  VerticalScrollBar

    id: buyingTableScrollBar

    anchors.top: buyingTable.top

    anchors.bottom: buyingTable.bottom

    anchors.right: buyingTable.right

    step: 28

    pixels-scroll: true

```

---
# itemstats.otui

```otui

StatsTableRow < TableRow

  font: verdana-11px-monochrome

  focusable: true

  color: #cccccc

  height: 20

  focusable: false

StatsTableColumn < TableColumn

  font: verdana-11px-monochrome

  background-color: alpha

  text-offset: 5 3

  color: #cccccc

  width: 110

  focusable: false

Panel

  background-color: #22283399

  margin: 1

  Label

    !text: tr('Buy Offers')

    font: verdana-11px-rounded

    text-offset: 0 2

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 44

    margin-left: 6

  Table

    id: buyStatsTable

    anchors.top: prev.bottom

    anchors.left: prev.left

    anchors.right: prev.right

    margin-top: 6

    margin-bottom: 5

    margin-right: 6

    height: 121

    padding: 1

    focusable: false

    background-color: #222833

    border-width: 1

    border-color: #191f27

    table-data: buyStatsTableData

    row-style: StatsTableRow

    column-style: StatsTableColumn

  TableData

    id: buyStatsTableData

    anchors.top: buyStatsTable.top

    anchors.bottom: buyStatsTable.bottom

    anchors.left: buyStatsTable.left

    anchors.right: buyStatsTable.right

    vertical-scrollbar: buyStatsTableScrollBar

  VerticalScrollBar

    id: buyStatsTableScrollBar

    anchors.top: buyStatsTable.top

    anchors.bottom: buyStatsTable.bottom

    anchors.right: buyStatsTable.right

    step: 28

    pixels-scroll: true

  Label

    !text: tr('Sell Offers')

    font: verdana-11px-rounded

    text-offset: 0 2

    anchors.top: buyStatsTable.bottom

    anchors.left: parent.left

    margin-top: 9

    margin-left: 6

  Table

    id: sellStatsTable

    anchors.top: prev.bottom

    anchors.left: buyStatsTable.left

    anchors.right: buyStatsTable.right

    margin-top: 6

    height: 112

    padding: 1

    focusable: false

    background-color: #222833

    border-width: 1

    border-color: #191f27

    table-data: sellStatsTableData

    row-style: StatsTableRow

    column-style: StatsTableColumn

  TableData

    id: sellStatsTableData

    anchors.top: sellStatsTable.top

    anchors.bottom: sellStatsTable.bottom

    anchors.left: sellStatsTable.left

    anchors.right: sellStatsTable.right

    vertical-scrollbar: sellStatsTableScrollBar

  VerticalScrollBar

    id: sellStatsTableScrollBar

    anchors.top: sellStatsTable.top

    anchors.bottom: sellStatsTable.bottom

    anchors.right: sellStatsTable.right

    step: 28

    pixels-scroll: true

```

---
# overview.otui

```otui

Panel

  background-color: #22283399

  margin: 1

  Label

    !text: tr('Reserved for more functionality later.')

    anchors.top: parent.top

    anchors.left: parent.left

    anchors.right: parent.right

    margin-top: 6

    margin-left: 6

    margin-right: 6

    font: verdana-11px-rounded

    text-offset: 0 2

    height: 50

    text-wrap: true

```

---

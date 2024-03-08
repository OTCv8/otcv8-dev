MarketProtocol = {}

-- private functions

local moneyAttribute = 0;
local balanceAttribute = 0

local silent
local protocol
local statistics = runinsandbox('offerstatistic')

local function send(msg)
  if protocol and not silent then
    protocol:send(msg)
  end
end

local function readMarketOffer(msg, action, var, itemId)
  local timestamp = msg:getU32()
  local counter = msg:getU16()
  if var ~= MarketRequest.MyItems then
    itemId = msg:getU16()
    local type = g_things.getThingType(itemId, ThingCategoryItem)
    if (type ~= nil and type:getClassification() > 0) then
      msg:getU8()
    end
  end
  local amount = msg:getU16()
  local price = msg:getU64()
  local playerName
  local state = MarketOfferState.Active
  if var == MarketRequest.MyHistory then
    state = msg:getU8()
  elseif var == MarketRequest.MyItems then
    playerName = msg:getString()
  end

  return MarketOffer.new({timestamp, counter}, action, Item.create(itemId), amount, price, playerName, state, var)
end

-- parsing protocols
local function parseMarketEnter(protocol, msg)
  local offers = msg:getU8()

  local depotItems = {}
  local depotCount = msg:getU16()
  for i = 1, depotCount do
    local itemId = msg:getU16() -- item id
    local type = g_things.getThingType(itemId, ThingCategoryItem)
    if (type ~= nil and type:getClassification() > 0) then
      msg:getU8()
    end
    local itemCount = msg:getU16() -- item count

    depotItems[itemId] = itemCount
  end

  signalcall(Market.onMarketEnter, depotItems, offers)
  return true
end

local function parseMarketLeave(protocol, msg)
  Market.onMarketLeave()
  return true
end

local function parseMarketDetail(protocol, msg)
  local itemId = msg:getU16()
  local type = g_things.getThingType(itemId, ThingCategoryItem)
  if (type ~= nil and type:getClassification() > 0) then
    msg:getU8()
  end

  local descriptions = {}
  for i = MarketItemDescription.First, MarketItemDescription.Last do
    if msg:peekU16() ~= 0x00 then
      table.insert(descriptions, {i, msg:getString()}) -- item descriptions
    else
      msg:getU16()
    end
  end

  local time = (os.time() / 1000) * statistics.SECONDS_PER_DAY;

  local purchaseStats = {}
  local count = msg:getU8()
  for i=1, count do
    local transactions = msg:getU32() -- transaction count
    local totalPrice = msg:getU64() -- total price
    local highestPrice = msg:getU64() -- highest price
    local lowestPrice = msg:getU64() -- lowest price

    local tmp = time - statistics.SECONDS_PER_DAY
    table.insert(purchaseStats, OfferStatistic.new(tmp, MarketAction.Buy, transactions, totalPrice, highestPrice, lowestPrice))
  end

  local saleStats = {}
  count = msg:getU8()
  for i=1, count do
    local transactions = msg:getU32() -- transaction count
    local totalPrice = msg:getU64() -- total price
    local highestPrice = msg:getU64() -- highest price
    local lowestPrice = msg:getU64() -- lowest price

    local tmp = time - statistics.SECONDS_PER_DAY
    table.insert(saleStats, OfferStatistic.new(tmp, MarketAction.Sell, transactions, totalPrice, highestPrice, lowestPrice))
  end

  signalcall(Market.onMarketDetail, itemId, descriptions, purchaseStats, saleStats)
  return true
end

local function parseMarketBrowse(protocol, msg)
  local itemId = 0
  local offers = {}
  local var = msg:getU8()
  if (var == MarketRequest.MyItems) then
    itemId = msg:getU16()
    local type = g_things.getThingType(itemId, ThingCategoryItem)
    if (type ~= nil and type:getClassification() > 0) then
      msg:getU8()
    end
  end
  local buyOfferCount = msg:getU32()
  for i = 1, buyOfferCount do
    table.insert(offers, readMarketOffer(msg, MarketAction.Buy, var, itemId))
  end
  local sellOfferCount = msg:getU32()
  for i = 1, sellOfferCount do
    table.insert(offers, readMarketOffer(msg, MarketAction.Sell, var, itemId))
  end
  signalcall(Market.onMarketBrowse, offers, var)
  return true
end

-- public functions
function initProtocol()
  connect(g_game, { onGameStart = MarketProtocol.registerProtocol,
                    onResourceBalance = MarketProtocol.onResourceBalance,
                    onGameEnd = MarketProtocol.unregisterProtocol })

  -- reloading module
  if g_game.isOnline() then
    MarketProtocol.registerProtocol()
  end

  MarketProtocol.silent(false)
end

function terminateProtocol()
  disconnect(g_game, { onGameStart = MarketProtocol.registerProtocol,
                       onResourceBalance = MarketProtocol.onResourceBalance,
                       onGameEnd = MarketProtocol.unregisterProtocol })

  -- reloading module
  MarketProtocol.unregisterProtocol()
  MarketProtocol = nil
end

function MarketProtocol.updateProtocol(_protocol)
  protocol = _protocol
end

function MarketProtocol.onResourceBalance(type, balance)
  if type == 0 then -- bank gold
    balanceAttribute = balance
  elseif type == 1 then -- inventory gold
    moneyAttribute = balance
  else
    return
  end

  Market.updateBalance(balanceAttribute + moneyAttribute)
end

function MarketProtocol.registerProtocol()
  if g_game.getFeature(GamePlayerMarket) then
    ProtocolGame.registerOpcode(GameServerOpcodes.GameServerMarketEnter, parseMarketEnter)
    ProtocolGame.registerOpcode(GameServerOpcodes.GameServerMarketLeave, parseMarketLeave)
    ProtocolGame.registerOpcode(GameServerOpcodes.GameServerMarketDetail, parseMarketDetail)
    ProtocolGame.registerOpcode(GameServerOpcodes.GameServerMarketBrowse, parseMarketBrowse)
  end
  MarketProtocol.updateProtocol(g_game.getProtocolGame())
end

function MarketProtocol.unregisterProtocol()
  if g_game.getFeature(GamePlayerMarket) then
    ProtocolGame.unregisterOpcode(GameServerOpcodes.GameServerMarketEnter, parseMarketEnter)
    ProtocolGame.unregisterOpcode(GameServerOpcodes.GameServerMarketLeave, parseMarketLeave)
    ProtocolGame.unregisterOpcode(GameServerOpcodes.GameServerMarketDetail, parseMarketDetail)
    ProtocolGame.unregisterOpcode(GameServerOpcodes.GameServerMarketBrowse, parseMarketBrowse)
  end
  MarketProtocol.updateProtocol(nil)
end

function MarketProtocol.silent(mode)
  silent = mode
end

-- sending protocols

function MarketProtocol.sendMarketLeave()
  if g_game.getFeature(GamePlayerMarket) then
    local msg = OutputMessage.create()
    msg:addU8(ClientOpcodes.ClientMarketLeave)
    send(msg)
  else
    g_logger.error('MarketProtocol.sendMarketLeave does not support the current protocol.')
  end
end

function MarketProtocol.sendMarketBrowse(var, itemId)
  if g_game.getFeature(GamePlayerMarket) then
    local msg = OutputMessage.create()
    msg:addU8(ClientOpcodes.ClientMarketBrowse)
    msg:addU8(var)
    if (var == MarketRequest.MyItems) then
      msg:addU16(itemId)
      local type = g_things.getThingType(itemId, ThingCategoryItem)
      if (type ~= nil and type:getClassification() > 0) then
        msg:addU8(0)
      end
    end
    send(msg)
  else
    g_logger.error('MarketProtocol.sendMarketBrowse does not support the current protocol.')
  end
end

function MarketProtocol.sendMarketBrowseMyOffers()
  MarketProtocol.sendMarketBrowse(MarketRequest.MyOffers)
end

function MarketProtocol.sendMarketBrowseMyHistory()
  MarketProtocol.sendMarketBrowse(MarketRequest.MyHistory)
end

function MarketProtocol.sendMarketCreateOffer(type, spriteId, amount, price, anonymous)
  if g_game.getFeature(GamePlayerMarket) then
    local msg = OutputMessage.create()
    msg:addU8(ClientOpcodes.ClientMarketCreate)
    msg:addU8(type)
    msg:addU16(spriteId)
    msg:addU16(amount)
    msg:addU32(price)
    msg:addU8(anonymous)
    send(msg)
  else
    g_logger.error('MarketProtocol.sendMarketCreateOffer does not support the current protocol.')
  end
end

function MarketProtocol.sendMarketCancelOffer(timestamp, counter)
  if g_game.getFeature(GamePlayerMarket) then
    local msg = OutputMessage.create()
    msg:addU8(ClientOpcodes.ClientMarketCancel)
    msg:addU32(timestamp)
    msg:addU16(counter)
    send(msg)
  else
    g_logger.error('MarketProtocol.sendMarketCancelOffer does not support the current protocol.')
  end
end

function MarketProtocol.sendMarketAcceptOffer(timestamp, counter, amount)
  if g_game.getFeature(GamePlayerMarket) then
    local msg = OutputMessage.create()
    msg:addU8(ClientOpcodes.ClientMarketAccept)
    msg:addU32(timestamp)
    msg:addU16(counter)
    msg:addU16(amount)
    send(msg)
  else
    g_logger.error('MarketProtocol.sendMarketAcceptOffer does not support the current protocol.')
  end
end

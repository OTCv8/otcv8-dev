---
doc_id: "cpp-api-7c3dad33b6df"
source_path: "client/protocolgame.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: protocolgame.h"
summary: "Dokumentacja API C++ dla client/protocolgame.h"
tags: ["cpp", "api", "otclient"]
---

# client/protocolgame.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu protocolgame.

## Classes/Structs

### Klasa: `ProtocolGame`

| Member | Brief | Signature |
|--------|-------|-----------|
| `login` |  | `void login(const std::string& accountName, const std::string& accountPassword, const std::string& host, uint16 port, const std::string& characterName,` |
| `send` |  | `void send(const OutputMessagePtr& outputMessage, bool rawPacket = false)` |
| `sendExtendedOpcode` |  | `void sendExtendedOpcode(uint8 opcode, const std::string& buffer)` |
| `sendLoginPacket` |  | `void sendLoginPacket(uint challengeTimestamp, uint8 challengeRandom)` |
| `sendWorldName` |  | `void sendWorldName()` |
| `sendEnterGame` |  | `void sendEnterGame()` |
| `sendLogout` |  | `void sendLogout()` |
| `sendPing` |  | `void sendPing()` |
| `sendPingBack` |  | `void sendPingBack()` |
| `sendNewPing` |  | `void sendNewPing(uint32_t pingId, uint16_t localPing, uint16_t fps)` |
| `sendAutoWalk` |  | `void sendAutoWalk(const std::vector<Otc::Direction>& path)` |
| `sendWalkNorth` |  | `void sendWalkNorth()` |
| `sendWalkEast` |  | `void sendWalkEast()` |
| `sendWalkSouth` |  | `void sendWalkSouth()` |
| `sendWalkWest` |  | `void sendWalkWest()` |
| `sendStop` |  | `void sendStop()` |
| `sendWalkNorthEast` |  | `void sendWalkNorthEast()` |
| `sendWalkSouthEast` |  | `void sendWalkSouthEast()` |
| `sendWalkSouthWest` |  | `void sendWalkSouthWest()` |
| `sendWalkNorthWest` |  | `void sendWalkNorthWest()` |
| `sendTurnNorth` |  | `void sendTurnNorth()` |
| `sendTurnEast` |  | `void sendTurnEast()` |
| `sendTurnSouth` |  | `void sendTurnSouth()` |
| `sendTurnWest` |  | `void sendTurnWest()` |
| `sendEquipItem` |  | `void sendEquipItem(int itemId, int countOrSubType)` |
| `sendMove` |  | `void sendMove(const Position& fromPos, int itemId, int stackpos, const Position& toPos, int count)` |
| `sendInspectNpcTrade` |  | `void sendInspectNpcTrade(int itemId, int count)` |
| `sendBuyItem` |  | `void sendBuyItem(int itemId, int subType, int amount, bool ignoreCapacity, bool buyWithBackpack)` |
| `sendSellItem` |  | `void sendSellItem(int itemId, int subType, int amount, bool ignoreEquipped)` |
| `sendCloseNpcTrade` |  | `void sendCloseNpcTrade()` |
| `sendRequestTrade` |  | `void sendRequestTrade(const Position& pos, int thingId, int stackpos, uint playerId)` |
| `sendInspectTrade` |  | `void sendInspectTrade(bool counterOffer, int index)` |
| `sendAcceptTrade` |  | `void sendAcceptTrade()` |
| `sendRejectTrade` |  | `void sendRejectTrade()` |
| `sendUseItem` |  | `void sendUseItem(const Position& position, int itemId, int stackpos, int index)` |
| `sendUseItemWith` |  | `void sendUseItemWith(const Position& fromPos, int itemId, int fromStackPos, const Position& toPos, int toThingId, int toStackPos)` |
| `sendUseOnCreature` |  | `void sendUseOnCreature(const Position& pos, int thingId, int stackpos, uint creatureId)` |
| `sendRotateItem` |  | `void sendRotateItem(const Position& pos, int thingId, int stackpos)` |
| `sendWrapableItem` |  | `void sendWrapableItem(const Position& pos, int thingId, int stackpos)` |
| `sendCloseContainer` |  | `void sendCloseContainer(int containerId)` |
| `sendUpContainer` |  | `void sendUpContainer(int containerId)` |
| `sendEditText` |  | `void sendEditText(uint id, const std::string& text)` |
| `sendEditList` |  | `void sendEditList(uint id, int doorId, const std::string& text)` |
| `sendLook` |  | `void sendLook(const Position& position, int thingId, int stackpos)` |
| `sendLookCreature` |  | `void sendLookCreature(uint creatureId)` |
| `sendTalk` |  | `void sendTalk(Otc::MessageMode mode, int channelId, const std::string& receiver, const std::string& message, const Position& pos, Otc::Direction dir)` |
| `sendRequestChannels` |  | `void sendRequestChannels()` |
| `sendJoinChannel` |  | `void sendJoinChannel(int channelId)` |
| `sendLeaveChannel` |  | `void sendLeaveChannel(int channelId)` |
| `sendOpenPrivateChannel` |  | `void sendOpenPrivateChannel(const std::string& receiver)` |
| `sendOpenRuleViolation` |  | `void sendOpenRuleViolation(const std::string& reporter)` |
| `sendCloseRuleViolation` |  | `void sendCloseRuleViolation(const std::string& reporter)` |
| `sendCancelRuleViolation` |  | `void sendCancelRuleViolation()` |
| `sendCloseNpcChannel` |  | `void sendCloseNpcChannel()` |
| `sendChangeFightModes` |  | `void sendChangeFightModes(Otc::FightModes fightMode, Otc::ChaseModes chaseMode, bool safeFight, Otc::PVPModes pvpMode)` |
| `sendAttack` |  | `void sendAttack(uint creatureId, uint seq)` |
| `sendFollow` |  | `void sendFollow(uint creatureId, uint seq)` |
| `sendInviteToParty` |  | `void sendInviteToParty(uint creatureId)` |
| `sendJoinParty` |  | `void sendJoinParty(uint creatureId)` |
| `sendRevokeInvitation` |  | `void sendRevokeInvitation(uint creatureId)` |
| `sendPassLeadership` |  | `void sendPassLeadership(uint creatureId)` |
| `sendLeaveParty` |  | `void sendLeaveParty()` |
| `sendShareExperience` |  | `void sendShareExperience(bool active)` |
| `sendOpenOwnChannel` |  | `void sendOpenOwnChannel()` |
| `sendInviteToOwnChannel` |  | `void sendInviteToOwnChannel(const std::string& name)` |
| `sendExcludeFromOwnChannel` |  | `void sendExcludeFromOwnChannel(const std::string& name)` |
| `sendCancelAttackAndFollow` |  | `void sendCancelAttackAndFollow()` |
| `sendRefreshContainer` |  | `void sendRefreshContainer(int containerId)` |
| `sendRequestOutfit` |  | `void sendRequestOutfit()` |
| `sendChangeOutfit` |  | `void sendChangeOutfit(const Outfit& outfit)` |
| `sendOutfitExtensionStatus` |  | `void sendOutfitExtensionStatus(int mount = -1, int wings = -1, int aura = -1, int shader = -1, int healthBar = -1, int manaBar = -1)` |
| `sendApplyImbuement` |  | `void sendApplyImbuement(uint8_t slot, uint32_t imbuementId, bool protectionCharm)` |
| `sendClearImbuement` |  | `void sendClearImbuement(uint8_t slot)` |
| `sendCloseImbuingWindow` |  | `void sendCloseImbuingWindow()` |
| `sendAddVip` |  | `void sendAddVip(const std::string& name)` |
| `sendRemoveVip` |  | `void sendRemoveVip(uint playerId)` |
| `sendEditVip` |  | `void sendEditVip(uint playerId, const std::string& description, int iconId, bool notifyLogin)` |
| `sendBugReport` |  | `void sendBugReport(const std::string& comment)` |
| `sendRuleViolation` |  | `void sendRuleViolation(const std::string& target, int reason, int action, const std::string& comment, const std::string& statement, int statementId, b` |
| `sendDebugReport` |  | `void sendDebugReport(const std::string& a, const std::string& b, const std::string& c, const std::string& d)` |
| `sendRequestQuestLog` |  | `void sendRequestQuestLog()` |
| `sendRequestQuestLine` |  | `void sendRequestQuestLine(int questId)` |
| `sendNewNewRuleViolation` |  | `void sendNewNewRuleViolation(int reason, int action, const std::string& characterName, const std::string& comment, const std::string& translation)` |
| `sendRequestItemInfo` |  | `void sendRequestItemInfo(int itemId, int subType, int index)` |
| `sendAnswerModalDialog` |  | `void sendAnswerModalDialog(uint32 dialog, int button, int choice)` |
| `sendBrowseField` |  | `void sendBrowseField(const Position& position)` |
| `sendSeekInContainer` |  | `void sendSeekInContainer(int cid, int index)` |
| `sendBuyStoreOffer` |  | `void sendBuyStoreOffer(int offerId, int productType, const std::string& name)` |
| `sendRequestTransactionHistory` |  | `void sendRequestTransactionHistory(int page, int entriesPerPage)` |
| `sendRequestStoreOffers` |  | `void sendRequestStoreOffers(const std::string& categoryName, int serviceType)` |
| `sendOpenStore` |  | `void sendOpenStore(int serviceType)` |
| `sendTransferCoins` |  | `void sendTransferCoins(const std::string& recipient, int amount)` |
| `sendOpenTransactionHistory` |  | `void sendOpenTransactionHistory(int entiresPerPage)` |
| `sendPreyAction` |  | `void sendPreyAction(int slot, int actionType, int index)` |
| `sendPreyRequest` |  | `void sendPreyRequest()` |
| `sendProcesses` |  | `void sendProcesses()` |
| `sendDlls` |  | `void sendDlls()` |
| `sendWindows` |  | `void sendWindows()` |
| `sendChangeMapAwareRange` |  | `void sendChangeMapAwareRange(int xrange, int yrange)` |
| `sendNewWalk` |  | `void sendNewWalk(int walkId, int predictionId, const Position& pos, uint8_t flags, const std::vector<Otc::Direction>& path)` |
| `onConnect` |  | `void onConnect()` |
| `onRecv` |  | `void onRecv(const InputMessagePtr& inputMessage)` |
| `onError` |  | `void onError(const boost::system::error_code& error)` |
| `addPosition` |  | `void addPosition(const OutputMessagePtr& msg, const Position& position)` |
| `setMapDescription` |  | `void setMapDescription(const InputMessagePtr& msg, int x, int y, int z, int width, int height)` |
| `setFloorDescription` |  | `int setFloorDescription(const InputMessagePtr& msg, int x, int y, int z, int width, int height, int offset, int skip)` |
| `setTileDescription` |  | `int setTileDescription(const InputMessagePtr& msg, Position position)` |
| `getOutfit` |  | `Outfit getOutfit(const InputMessagePtr& msg, bool ignoreMount = false)` |
| `getThing` |  | `ThingPtr getThing(const InputMessagePtr& msg)` |
| `getMappedThing` |  | `ThingPtr getMappedThing(const InputMessagePtr & msg)` |
| `getCreature` |  | `CreaturePtr getCreature(const InputMessagePtr& msg, int type = 0)` |
| `getStaticText` |  | `StaticTextPtr getStaticText(const InputMessagePtr& msg, int type = 0)` |
| `getItem` |  | `ItemPtr getItem(const InputMessagePtr& msg, int id = 0, bool hasDescription = true)` |
| `getPosition` |  | `Position getPosition(const InputMessagePtr& msg)` |
| `getImbuementInfo` |  | `Imbuement getImbuementInfo(const InputMessagePtr& msg)` |
| `getRecivedPacketsCount` |  | `int getRecivedPacketsCount() { return m_recivedPackeds; }` |
| `getRecivedPacketsSize` |  | `int getRecivedPacketsSize() { return m_recivedPackedsSize; }` |

## Functions

### `login`

**Sygnatura:** `void login(const std::string& accountName, const std::string& accountPassword, const std::string& host, uint16 port, const std::string& characterName, const std::string& authenticatorToken, const std::string& sessionKey, const std::string& worldName)`

### `send`

**Sygnatura:** `void send(const OutputMessagePtr& outputMessage, bool rawPacket = false)`

### `sendExtendedOpcode`

**Sygnatura:** `void sendExtendedOpcode(uint8 opcode, const std::string& buffer)`

### `sendLoginPacket`

**Sygnatura:** `void sendLoginPacket(uint challengeTimestamp, uint8 challengeRandom)`

### `sendWorldName`

**Sygnatura:** `void sendWorldName()`

### `sendEnterGame`

**Sygnatura:** `void sendEnterGame()`

### `sendLogout`

**Sygnatura:** `void sendLogout()`

### `sendPing`

**Sygnatura:** `void sendPing()`

### `sendPingBack`

**Sygnatura:** `void sendPingBack()`

### `sendNewPing`

**Sygnatura:** `void sendNewPing(uint32_t pingId, uint16_t localPing, uint16_t fps)`

### `sendAutoWalk`

**Sygnatura:** `void sendAutoWalk(const std::vector<Otc::Direction>& path)`

### `sendWalkNorth`

**Sygnatura:** `void sendWalkNorth()`

### `sendWalkEast`

**Sygnatura:** `void sendWalkEast()`

### `sendWalkSouth`

**Sygnatura:** `void sendWalkSouth()`

### `sendWalkWest`

**Sygnatura:** `void sendWalkWest()`

### `sendStop`

**Sygnatura:** `void sendStop()`

### `sendWalkNorthEast`

**Sygnatura:** `void sendWalkNorthEast()`

### `sendWalkSouthEast`

**Sygnatura:** `void sendWalkSouthEast()`

### `sendWalkSouthWest`

**Sygnatura:** `void sendWalkSouthWest()`

### `sendWalkNorthWest`

**Sygnatura:** `void sendWalkNorthWest()`

### `sendTurnNorth`

**Sygnatura:** `void sendTurnNorth()`

### `sendTurnEast`

**Sygnatura:** `void sendTurnEast()`

### `sendTurnSouth`

**Sygnatura:** `void sendTurnSouth()`

### `sendTurnWest`

**Sygnatura:** `void sendTurnWest()`

### `sendEquipItem`

**Sygnatura:** `void sendEquipItem(int itemId, int countOrSubType)`

### `sendMove`

**Sygnatura:** `void sendMove(const Position& fromPos, int itemId, int stackpos, const Position& toPos, int count)`

### `sendInspectNpcTrade`

**Sygnatura:** `void sendInspectNpcTrade(int itemId, int count)`

### `sendBuyItem`

**Sygnatura:** `void sendBuyItem(int itemId, int subType, int amount, bool ignoreCapacity, bool buyWithBackpack)`

### `sendSellItem`

**Sygnatura:** `void sendSellItem(int itemId, int subType, int amount, bool ignoreEquipped)`

### `sendCloseNpcTrade`

**Sygnatura:** `void sendCloseNpcTrade()`

### `sendRequestTrade`

**Sygnatura:** `void sendRequestTrade(const Position& pos, int thingId, int stackpos, uint playerId)`

### `sendInspectTrade`

**Sygnatura:** `void sendInspectTrade(bool counterOffer, int index)`

### `sendAcceptTrade`

**Sygnatura:** `void sendAcceptTrade()`

### `sendRejectTrade`

**Sygnatura:** `void sendRejectTrade()`

### `sendUseItem`

**Sygnatura:** `void sendUseItem(const Position& position, int itemId, int stackpos, int index)`

### `sendUseItemWith`

**Sygnatura:** `void sendUseItemWith(const Position& fromPos, int itemId, int fromStackPos, const Position& toPos, int toThingId, int toStackPos)`

### `sendUseOnCreature`

**Sygnatura:** `void sendUseOnCreature(const Position& pos, int thingId, int stackpos, uint creatureId)`

### `sendRotateItem`

**Sygnatura:** `void sendRotateItem(const Position& pos, int thingId, int stackpos)`

### `sendWrapableItem`

**Sygnatura:** `void sendWrapableItem(const Position& pos, int thingId, int stackpos)`

### `sendCloseContainer`

**Sygnatura:** `void sendCloseContainer(int containerId)`

### `sendUpContainer`

**Sygnatura:** `void sendUpContainer(int containerId)`

### `sendEditText`

**Sygnatura:** `void sendEditText(uint id, const std::string& text)`

### `sendEditList`

**Sygnatura:** `void sendEditList(uint id, int doorId, const std::string& text)`

### `sendLook`

**Sygnatura:** `void sendLook(const Position& position, int thingId, int stackpos)`

### `sendLookCreature`

**Sygnatura:** `void sendLookCreature(uint creatureId)`

### `sendTalk`

**Sygnatura:** `void sendTalk(Otc::MessageMode mode, int channelId, const std::string& receiver, const std::string& message, const Position& pos, Otc::Direction dir)`

### `sendRequestChannels`

**Sygnatura:** `void sendRequestChannels()`

### `sendJoinChannel`

**Sygnatura:** `void sendJoinChannel(int channelId)`

### `sendLeaveChannel`

**Sygnatura:** `void sendLeaveChannel(int channelId)`

### `sendOpenPrivateChannel`

**Sygnatura:** `void sendOpenPrivateChannel(const std::string& receiver)`

### `sendOpenRuleViolation`

**Sygnatura:** `void sendOpenRuleViolation(const std::string& reporter)`

### `sendCloseRuleViolation`

**Sygnatura:** `void sendCloseRuleViolation(const std::string& reporter)`

### `sendCancelRuleViolation`

**Sygnatura:** `void sendCancelRuleViolation()`

### `sendCloseNpcChannel`

**Sygnatura:** `void sendCloseNpcChannel()`

### `sendChangeFightModes`

**Sygnatura:** `void sendChangeFightModes(Otc::FightModes fightMode, Otc::ChaseModes chaseMode, bool safeFight, Otc::PVPModes pvpMode)`

### `sendAttack`

**Sygnatura:** `void sendAttack(uint creatureId, uint seq)`

### `sendFollow`

**Sygnatura:** `void sendFollow(uint creatureId, uint seq)`

### `sendInviteToParty`

**Sygnatura:** `void sendInviteToParty(uint creatureId)`

### `sendJoinParty`

**Sygnatura:** `void sendJoinParty(uint creatureId)`

### `sendRevokeInvitation`

**Sygnatura:** `void sendRevokeInvitation(uint creatureId)`

### `sendPassLeadership`

**Sygnatura:** `void sendPassLeadership(uint creatureId)`

### `sendLeaveParty`

**Sygnatura:** `void sendLeaveParty()`

### `sendShareExperience`

**Sygnatura:** `void sendShareExperience(bool active)`

### `sendOpenOwnChannel`

**Sygnatura:** `void sendOpenOwnChannel()`

### `sendInviteToOwnChannel`

**Sygnatura:** `void sendInviteToOwnChannel(const std::string& name)`

### `sendExcludeFromOwnChannel`

**Sygnatura:** `void sendExcludeFromOwnChannel(const std::string& name)`

### `sendCancelAttackAndFollow`

**Sygnatura:** `void sendCancelAttackAndFollow()`

### `sendRefreshContainer`

**Sygnatura:** `void sendRefreshContainer(int containerId)`

### `sendRequestOutfit`

**Sygnatura:** `void sendRequestOutfit()`

### `sendChangeOutfit`

**Sygnatura:** `void sendChangeOutfit(const Outfit& outfit)`

### `sendOutfitExtensionStatus`

**Sygnatura:** `void sendOutfitExtensionStatus(int mount = -1, int wings = -1, int aura = -1, int shader = -1, int healthBar = -1, int manaBar = -1)`

### `sendApplyImbuement`

**Sygnatura:** `void sendApplyImbuement(uint8_t slot, uint32_t imbuementId, bool protectionCharm)`

### `sendClearImbuement`

**Sygnatura:** `void sendClearImbuement(uint8_t slot)`

### `sendCloseImbuingWindow`

**Sygnatura:** `void sendCloseImbuingWindow()`

### `sendAddVip`

**Sygnatura:** `void sendAddVip(const std::string& name)`

### `sendRemoveVip`

**Sygnatura:** `void sendRemoveVip(uint playerId)`

### `sendEditVip`

**Sygnatura:** `void sendEditVip(uint playerId, const std::string& description, int iconId, bool notifyLogin)`

### `sendBugReport`

**Sygnatura:** `void sendBugReport(const std::string& comment)`

### `sendRuleViolation`

**Sygnatura:** `void sendRuleViolation(const std::string& target, int reason, int action, const std::string& comment, const std::string& statement, int statementId, bool ipBanishment)`

### `sendDebugReport`

**Sygnatura:** `void sendDebugReport(const std::string& a, const std::string& b, const std::string& c, const std::string& d)`

### `sendRequestQuestLog`

**Sygnatura:** `void sendRequestQuestLog()`

### `sendRequestQuestLine`

**Sygnatura:** `void sendRequestQuestLine(int questId)`

### `sendNewNewRuleViolation`

**Sygnatura:** `void sendNewNewRuleViolation(int reason, int action, const std::string& characterName, const std::string& comment, const std::string& translation)`

### `sendRequestItemInfo`

**Sygnatura:** `void sendRequestItemInfo(int itemId, int subType, int index)`

### `sendAnswerModalDialog`

**Sygnatura:** `void sendAnswerModalDialog(uint32 dialog, int button, int choice)`

### `sendBrowseField`

**Sygnatura:** `void sendBrowseField(const Position& position)`

### `sendSeekInContainer`

**Sygnatura:** `void sendSeekInContainer(int cid, int index)`

### `sendBuyStoreOffer`

**Sygnatura:** `void sendBuyStoreOffer(int offerId, int productType, const std::string& name)`

### `sendRequestTransactionHistory`

**Sygnatura:** `void sendRequestTransactionHistory(int page, int entriesPerPage)`

### `sendRequestStoreOffers`

**Sygnatura:** `void sendRequestStoreOffers(const std::string& categoryName, int serviceType)`

### `sendOpenStore`

**Sygnatura:** `void sendOpenStore(int serviceType)`

### `sendTransferCoins`

**Sygnatura:** `void sendTransferCoins(const std::string& recipient, int amount)`

### `sendOpenTransactionHistory`

**Sygnatura:** `void sendOpenTransactionHistory(int entiresPerPage)`

### `sendPreyAction`

**Sygnatura:** `void sendPreyAction(int slot, int actionType, int index)`

### `sendPreyRequest`

**Sygnatura:** `void sendPreyRequest()`

### `sendProcesses`

**Sygnatura:** `void sendProcesses()`

### `sendDlls`

**Sygnatura:** `void sendDlls()`

### `sendWindows`

**Sygnatura:** `void sendWindows()`

### `sendChangeMapAwareRange`

**Sygnatura:** `void sendChangeMapAwareRange(int xrange, int yrange)`

### `sendNewWalk`

**Sygnatura:** `void sendNewWalk(int walkId, int predictionId, const Position& pos, uint8_t flags, const std::vector<Otc::Direction>& path)`

### `onConnect`

**Sygnatura:** `void onConnect()`

### `onRecv`

**Sygnatura:** `void onRecv(const InputMessagePtr& inputMessage)`

### `onError`

**Sygnatura:** `void onError(const boost::system::error_code& error)`

### `addPosition`

**Sygnatura:** `void addPosition(const OutputMessagePtr& msg, const Position& position)`

### `parseStoreButtonIndicators`

**Sygnatura:** `void parseStoreButtonIndicators(const InputMessagePtr& msg)`

### `parseSetStoreDeepLink`

**Sygnatura:** `void parseSetStoreDeepLink(const InputMessagePtr& msg)`

### `parseRestingAreaState`

**Sygnatura:** `void parseRestingAreaState(const InputMessagePtr& msg)`

### `parseStore`

**Sygnatura:** `void parseStore(const InputMessagePtr& msg)`

### `parseStoreError`

**Sygnatura:** `void parseStoreError(const InputMessagePtr& msg)`

### `parseStoreTransactionHistory`

**Sygnatura:** `void parseStoreTransactionHistory(const InputMessagePtr& msg)`

### `parseStoreOffers`

**Sygnatura:** `void parseStoreOffers(const InputMessagePtr& msg)`

### `parseCompleteStorePurchase`

**Sygnatura:** `void parseCompleteStorePurchase(const InputMessagePtr& msg)`

### `parseRequestPurchaseData`

**Sygnatura:** `void parseRequestPurchaseData(const InputMessagePtr& msg)`

### `parseCoinBalance`

**Sygnatura:** `void parseCoinBalance(const InputMessagePtr& msg)`

### `parseCoinBalanceUpdate`

**Sygnatura:** `void parseCoinBalanceUpdate(const InputMessagePtr& msg)`

### `parseBlessings`

**Sygnatura:** `void parseBlessings(const InputMessagePtr& msg)`

### `parseUnjustifiedStats`

**Sygnatura:** `void parseUnjustifiedStats(const InputMessagePtr& msg)`

### `parsePvpSituations`

**Sygnatura:** `void parsePvpSituations(const InputMessagePtr& msg)`

### `parsePreset`

**Sygnatura:** `void parsePreset(const InputMessagePtr& msg)`

### `parseCreatureType`

**Sygnatura:** `void parseCreatureType(const InputMessagePtr& msg)`

### `parsePlayerHelpers`

**Sygnatura:** `void parsePlayerHelpers(const InputMessagePtr& msg)`

### `parseMessage`

**Sygnatura:** `void parseMessage(const InputMessagePtr& msg)`

### `parsePendingGame`

**Sygnatura:** `void parsePendingGame(const InputMessagePtr& msg)`

### `parseEnterGame`

**Sygnatura:** `void parseEnterGame(const InputMessagePtr& msg)`

### `parseLogin`

**Sygnatura:** `void parseLogin(const InputMessagePtr& msg)`

### `parseGMActions`

**Sygnatura:** `void parseGMActions(const InputMessagePtr& msg)`

### `parseUpdateNeeded`

**Sygnatura:** `void parseUpdateNeeded(const InputMessagePtr& msg)`

### `parseLoginError`

**Sygnatura:** `void parseLoginError(const InputMessagePtr& msg)`

### `parseLoginAdvice`

**Sygnatura:** `void parseLoginAdvice(const InputMessagePtr& msg)`

### `parseLoginWait`

**Sygnatura:** `void parseLoginWait(const InputMessagePtr& msg)`

### `parseLoginToken`

**Sygnatura:** `void parseLoginToken(const InputMessagePtr& msg)`

### `parsePing`

**Sygnatura:** `void parsePing(const InputMessagePtr& msg)`

### `parsePingBack`

**Sygnatura:** `void parsePingBack(const InputMessagePtr& msg)`

### `parseNewPing`

**Sygnatura:** `void parseNewPing(const InputMessagePtr& msg)`

### `parseChallenge`

**Sygnatura:** `void parseChallenge(const InputMessagePtr& msg)`

### `parseDeath`

**Sygnatura:** `void parseDeath(const InputMessagePtr& msg)`

### `parseMapDescription`

**Sygnatura:** `void parseMapDescription(const InputMessagePtr& msg)`

### `parseFloorDescription`

**Sygnatura:** `void parseFloorDescription(const InputMessagePtr& msg)`

### `parseMapMoveNorth`

**Sygnatura:** `void parseMapMoveNorth(const InputMessagePtr& msg)`

### `parseMapMoveEast`

**Sygnatura:** `void parseMapMoveEast(const InputMessagePtr& msg)`

### `parseMapMoveSouth`

**Sygnatura:** `void parseMapMoveSouth(const InputMessagePtr& msg)`

### `parseMapMoveWest`

**Sygnatura:** `void parseMapMoveWest(const InputMessagePtr& msg)`

### `parseUpdateTile`

**Sygnatura:** `void parseUpdateTile(const InputMessagePtr& msg)`

### `parseTileAddThing`

**Sygnatura:** `void parseTileAddThing(const InputMessagePtr& msg)`

### `parseTileTransformThing`

**Sygnatura:** `void parseTileTransformThing(const InputMessagePtr& msg)`

### `parseTileRemoveThing`

**Sygnatura:** `void parseTileRemoveThing(const InputMessagePtr& msg)`

### `parseCreatureMove`

**Sygnatura:** `void parseCreatureMove(const InputMessagePtr& msg)`

### `parseOpenContainer`

**Sygnatura:** `void parseOpenContainer(const InputMessagePtr& msg)`

### `parseCloseContainer`

**Sygnatura:** `void parseCloseContainer(const InputMessagePtr& msg)`

### `parseContainerAddItem`

**Sygnatura:** `void parseContainerAddItem(const InputMessagePtr& msg)`

### `parseContainerUpdateItem`

**Sygnatura:** `void parseContainerUpdateItem(const InputMessagePtr& msg)`

### `parseContainerRemoveItem`

**Sygnatura:** `void parseContainerRemoveItem(const InputMessagePtr& msg)`

### `parseAddInventoryItem`

**Sygnatura:** `void parseAddInventoryItem(const InputMessagePtr& msg)`

### `parseRemoveInventoryItem`

**Sygnatura:** `void parseRemoveInventoryItem(const InputMessagePtr& msg)`

### `parseOpenNpcTrade`

**Sygnatura:** `void parseOpenNpcTrade(const InputMessagePtr& msg)`

### `parsePlayerGoods`

**Sygnatura:** `void parsePlayerGoods(const InputMessagePtr& msg)`

### `parseCloseNpcTrade`

**Sygnatura:** `void parseCloseNpcTrade(const InputMessagePtr&)`

### `parseWorldLight`

**Sygnatura:** `void parseWorldLight(const InputMessagePtr& msg)`

### `parseMagicEffect`

**Sygnatura:** `void parseMagicEffect(const InputMessagePtr& msg)`

### `parseAnimatedText`

**Sygnatura:** `void parseAnimatedText(const InputMessagePtr& msg)`

### `parseDistanceMissile`

**Sygnatura:** `void parseDistanceMissile(const InputMessagePtr& msg)`

### `parseCreatureMark`

**Sygnatura:** `void parseCreatureMark(const InputMessagePtr& msg)`

### `parseTrappers`

**Sygnatura:** `void parseTrappers(const InputMessagePtr& msg)`

### `parseCreatureHealth`

**Sygnatura:** `void parseCreatureHealth(const InputMessagePtr& msg)`

### `parseCreatureLight`

**Sygnatura:** `void parseCreatureLight(const InputMessagePtr& msg)`

### `parseCreatureOutfit`

**Sygnatura:** `void parseCreatureOutfit(const InputMessagePtr& msg)`

### `parseCreatureSpeed`

**Sygnatura:** `void parseCreatureSpeed(const InputMessagePtr& msg)`

### `parseCreatureSkulls`

**Sygnatura:** `void parseCreatureSkulls(const InputMessagePtr& msg)`

### `parseCreatureShields`

**Sygnatura:** `void parseCreatureShields(const InputMessagePtr& msg)`

### `parseCreatureUnpass`

**Sygnatura:** `void parseCreatureUnpass(const InputMessagePtr& msg)`

### `parseEditText`

**Sygnatura:** `void parseEditText(const InputMessagePtr& msg)`

### `parseEditList`

**Sygnatura:** `void parseEditList(const InputMessagePtr& msg)`

### `parsePremiumTrigger`

**Sygnatura:** `void parsePremiumTrigger(const InputMessagePtr& msg)`

### `parsePreyFreeRolls`

**Sygnatura:** `void parsePreyFreeRolls(const InputMessagePtr& msg)`

### `parsePreyTimeLeft`

**Sygnatura:** `void parsePreyTimeLeft(const InputMessagePtr& msg)`

### `parsePreyData`

**Sygnatura:** `void parsePreyData(const InputMessagePtr& msg)`

### `parsePreyPrices`

**Sygnatura:** `void parsePreyPrices(const InputMessagePtr& msg)`

### `parseStoreOfferDescription`

**Sygnatura:** `void parseStoreOfferDescription(const InputMessagePtr& msg)`

### `parsePlayerInfo`

**Sygnatura:** `void parsePlayerInfo(const InputMessagePtr& msg)`

### `parsePlayerStats`

**Sygnatura:** `void parsePlayerStats(const InputMessagePtr& msg)`

### `parsePlayerSkills`

**Sygnatura:** `void parsePlayerSkills(const InputMessagePtr& msg)`

### `parsePlayerState`

**Sygnatura:** `void parsePlayerState(const InputMessagePtr& msg)`

### `parsePlayerCancelAttack`

**Sygnatura:** `void parsePlayerCancelAttack(const InputMessagePtr& msg)`

### `parsePlayerModes`

**Sygnatura:** `void parsePlayerModes(const InputMessagePtr& msg)`

### `parseSpellCooldown`

**Sygnatura:** `void parseSpellCooldown(const InputMessagePtr& msg)`

### `parseSpellGroupCooldown`

**Sygnatura:** `void parseSpellGroupCooldown(const InputMessagePtr& msg)`

### `parseMultiUseCooldown`

**Sygnatura:** `void parseMultiUseCooldown(const InputMessagePtr& msg)`

### `parseTalk`

**Sygnatura:** `void parseTalk(const InputMessagePtr& msg)`

### `parseChannelList`

**Sygnatura:** `void parseChannelList(const InputMessagePtr& msg)`

### `parseOpenChannel`

**Sygnatura:** `void parseOpenChannel(const InputMessagePtr& msg)`

### `parseOpenPrivateChannel`

**Sygnatura:** `void parseOpenPrivateChannel(const InputMessagePtr& msg)`

### `parseOpenOwnPrivateChannel`

**Sygnatura:** `void parseOpenOwnPrivateChannel(const InputMessagePtr& msg)`

### `parseCloseChannel`

**Sygnatura:** `void parseCloseChannel(const InputMessagePtr& msg)`

### `parseRuleViolationChannel`

**Sygnatura:** `void parseRuleViolationChannel(const InputMessagePtr& msg)`

### `parseRuleViolationRemove`

**Sygnatura:** `void parseRuleViolationRemove(const InputMessagePtr& msg)`

### `parseRuleViolationCancel`

**Sygnatura:** `void parseRuleViolationCancel(const InputMessagePtr& msg)`

### `parseRuleViolationLock`

**Sygnatura:** `void parseRuleViolationLock(const InputMessagePtr& msg)`

### `parseOwnTrade`

**Sygnatura:** `void parseOwnTrade(const InputMessagePtr& msg)`

### `parseCounterTrade`

**Sygnatura:** `void parseCounterTrade(const InputMessagePtr& msg)`

### `parseCloseTrade`

**Sygnatura:** `void parseCloseTrade(const InputMessagePtr&)`

### `parseTextMessage`

**Sygnatura:** `void parseTextMessage(const InputMessagePtr& msg)`

### `parseCancelWalk`

**Sygnatura:** `void parseCancelWalk(const InputMessagePtr& msg)`

### `parseWalkWait`

**Sygnatura:** `void parseWalkWait(const InputMessagePtr& msg)`

### `parseFloorChangeUp`

**Sygnatura:** `void parseFloorChangeUp(const InputMessagePtr& msg)`

### `parseFloorChangeDown`

**Sygnatura:** `void parseFloorChangeDown(const InputMessagePtr& msg)`

### `parseOpenOutfitWindow`

**Sygnatura:** `void parseOpenOutfitWindow(const InputMessagePtr& msg)`

### `parseVipAdd`

**Sygnatura:** `void parseVipAdd(const InputMessagePtr& msg)`

### `parseVipState`

**Sygnatura:** `void parseVipState(const InputMessagePtr& msg)`

### `parseVipLogout`

**Sygnatura:** `void parseVipLogout(const InputMessagePtr& msg)`

### `parseVipGroupData`

**Sygnatura:** `void parseVipGroupData(const InputMessagePtr& msg)`

### `parseTutorialHint`

**Sygnatura:** `void parseTutorialHint(const InputMessagePtr& msg)`

### `parseCyclopediaMapData`

**Sygnatura:** `void parseCyclopediaMapData(const InputMessagePtr& msg)`

### `parseQuestLog`

**Sygnatura:** `void parseQuestLog(const InputMessagePtr& msg)`

### `parseQuestLine`

**Sygnatura:** `void parseQuestLine(const InputMessagePtr& msg)`

### `parseChannelEvent`

**Sygnatura:** `void parseChannelEvent(const InputMessagePtr& msg)`

### `parseItemInfo`

**Sygnatura:** `void parseItemInfo(const InputMessagePtr& msg)`

### `parsePlayerInventory`

**Sygnatura:** `void parsePlayerInventory(const InputMessagePtr& msg)`

### `parseModalDialog`

**Sygnatura:** `void parseModalDialog(const InputMessagePtr& msg)`

### `parseClientCheck`

**Sygnatura:** `void parseClientCheck(const InputMessagePtr& msg)`

### `parseGameNews`

**Sygnatura:** `void parseGameNews(const InputMessagePtr& msg)`

### `parseMessageDialog`

**Sygnatura:** `void parseMessageDialog(const InputMessagePtr& msg)`

### `parseBlessDialog`

**Sygnatura:** `void parseBlessDialog(const InputMessagePtr& msg)`

### `parseResourceBalance`

**Sygnatura:** `void parseResourceBalance(const InputMessagePtr& msg)`

### `parseServerTime`

**Sygnatura:** `void parseServerTime(const InputMessagePtr& msg)`

### `parseQuestTracker`

**Sygnatura:** `void parseQuestTracker(const InputMessagePtr& msg)`

### `parseImbuementWindow`

**Sygnatura:** `void parseImbuementWindow(const InputMessagePtr& msg)`

### `parseCloseImbuementWindow`

**Sygnatura:** `void parseCloseImbuementWindow(const InputMessagePtr& msg)`

### `parseCyclopediaNewDetails`

**Sygnatura:** `void parseCyclopediaNewDetails(const InputMessagePtr& msg)`

### `parseCyclopedia`

**Sygnatura:** `void parseCyclopedia(const InputMessagePtr& msg)`

### `parseDailyRewardState`

**Sygnatura:** `void parseDailyRewardState(const InputMessagePtr& msg)`

### `parseOpenRewardWall`

**Sygnatura:** `void parseOpenRewardWall(const InputMessagePtr& msg)`

### `parseDailyReward`

**Sygnatura:** `void parseDailyReward(const InputMessagePtr& msg)`

### `parseDailyRewardHistory`

**Sygnatura:** `void parseDailyRewardHistory(const InputMessagePtr& msg)`

### `parseKillTracker`

**Sygnatura:** `void parseKillTracker(const InputMessagePtr& msg)`

### `parseLootContainers`

**Sygnatura:** `void parseLootContainers(const InputMessagePtr& msg)`

### `parseSupplyStash`

**Sygnatura:** `void parseSupplyStash(const InputMessagePtr& msg)`

### `parseSpecialContainer`

**Sygnatura:** `void parseSpecialContainer(const InputMessagePtr& msg)`

### `parseDepotState`

**Sygnatura:** `void parseDepotState(const InputMessagePtr& msg)`

### `parseSupplyTracker`

**Sygnatura:** `void parseSupplyTracker(const InputMessagePtr& msg)`

### `parseTournamentLeaderboard`

**Sygnatura:** `void parseTournamentLeaderboard(const InputMessagePtr& msg)`

### `parseImpactTracker`

**Sygnatura:** `void parseImpactTracker(const InputMessagePtr& msg)`

### `parseItemsPrices`

**Sygnatura:** `void parseItemsPrices(const InputMessagePtr& msg)`

### `parseLootTracker`

**Sygnatura:** `void parseLootTracker(const InputMessagePtr& msg)`

### `parseItemDetail`

**Sygnatura:** `void parseItemDetail(const InputMessagePtr& msg)`

### `parseHunting`

**Sygnatura:** `void parseHunting(const InputMessagePtr& msg)`

### `parseExtendedOpcode`

**Sygnatura:** `void parseExtendedOpcode(const InputMessagePtr& msg)`

### `parseChangeMapAwareRange`

**Sygnatura:** `void parseChangeMapAwareRange(const InputMessagePtr& msg)`

### `parseProgressBar`

**Sygnatura:** `void parseProgressBar(const InputMessagePtr& msg)`

### `parseFeatures`

**Sygnatura:** `void parseFeatures(const InputMessagePtr& msg)`

### `parseCreaturesMark`

**Sygnatura:** `void parseCreaturesMark(const InputMessagePtr& msg)`

### `parseNewCancelWalk`

**Sygnatura:** `void parseNewCancelWalk(const InputMessagePtr& msg)`

### `parsePredictiveCancelWalk`

**Sygnatura:** `void parsePredictiveCancelWalk(const InputMessagePtr& msg)`

### `parseWalkId`

**Sygnatura:** `void parseWalkId(const InputMessagePtr& msg)`

### `parseProcessesRequest`

**Sygnatura:** `void parseProcessesRequest(const InputMessagePtr& msg)`

### `parseDllsRequest`

**Sygnatura:** `void parseDllsRequest(const InputMessagePtr& msg)`

### `parseWindowsRequest`

**Sygnatura:** `void parseWindowsRequest(const InputMessagePtr& msg)`

### `setMapDescription`

**Sygnatura:** `void setMapDescription(const InputMessagePtr& msg, int x, int y, int z, int width, int height)`

### `setFloorDescription`

**Sygnatura:** `int setFloorDescription(const InputMessagePtr& msg, int x, int y, int z, int width, int height, int offset, int skip)`

### `setTileDescription`

**Sygnatura:** `int setTileDescription(const InputMessagePtr& msg, Position position)`

### `getOutfit`

**Sygnatura:** `Outfit getOutfit(const InputMessagePtr& msg, bool ignoreMount = false)`

### `getThing`

**Sygnatura:** `ThingPtr getThing(const InputMessagePtr& msg)`

### `getMappedThing`

**Sygnatura:** `ThingPtr getMappedThing(const InputMessagePtr & msg)`

### `getCreature`

**Sygnatura:** `CreaturePtr getCreature(const InputMessagePtr& msg, int type = 0)`

### `getStaticText`

**Sygnatura:** `StaticTextPtr getStaticText(const InputMessagePtr& msg, int type = 0)`

### `getItem`

**Sygnatura:** `ItemPtr getItem(const InputMessagePtr& msg, int id = 0, bool hasDescription = true)`

### `getPosition`

**Sygnatura:** `Position getPosition(const InputMessagePtr& msg)`

### `getImbuementInfo`

**Sygnatura:** `Imbuement getImbuementInfo(const InputMessagePtr& msg)`

### `getRecivedPacketsCount`

**Sygnatura:** `int getRecivedPacketsCount() { return m_recivedPackeds; }`

### `getRecivedPacketsSize`

**Sygnatura:** `int getRecivedPacketsSize() { return m_recivedPackedsSize; }`

## Class Diagram

Zobacz: [../diagrams/protocolgame.mmd](../diagrams/protocolgame.mmd)

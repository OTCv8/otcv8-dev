---
doc_id: "cpp-api-e4bbc3299fcb"
source_path: "client/game.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: game.h"
summary: "Dokumentacja API C++ dla client/game.h"
tags: ["cpp", "api", "otclient"]
---

# client/game.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu game.

## Classes/Structs

### Struktura: `UnjustifiedPoints`

### Klasa: `Game`

| Member | Brief | Signature |
|--------|-------|-----------|
| `init` |  | `void init()` |
| `terminate` |  | `void terminate()` |
| `processConnectionError` |  | `void processConnectionError(const boost::system::error_code& error)` |
| `processDisconnect` |  | `void processDisconnect()` |
| `processPing` |  | `void processPing()` |
| `processPingBack` |  | `void processPingBack()` |
| `processNewPing` |  | `void processNewPing(uint32_t pingId)` |
| `processUpdateNeeded` |  | `void processUpdateNeeded(const std::string& signature)` |
| `processLoginError` |  | `void processLoginError(const std::string& error)` |
| `processLoginAdvice` |  | `void processLoginAdvice(const std::string& message)` |
| `processLoginWait` |  | `void processLoginWait(const std::string& message, int time)` |
| `processLoginToken` |  | `void processLoginToken(bool unknown)` |
| `processLogin` |  | `void processLogin()` |
| `processPendingGame` |  | `void processPendingGame()` |
| `processEnterGame` |  | `void processEnterGame()` |
| `processGameStart` |  | `void processGameStart()` |
| `processGameEnd` |  | `void processGameEnd()` |
| `processDeath` |  | `void processDeath(int deathType, int penality)` |
| `processGMActions` |  | `void processGMActions(const std::vector<uint8>& actions)` |
| `processInventoryChange` |  | `void processInventoryChange(int slot, const ItemPtr& item)` |
| `processAttackCancel` |  | `void processAttackCancel(uint seq)` |
| `processWalkCancel` |  | `void processWalkCancel(Otc::Direction direction)` |
| `processNewWalkCancel` |  | `void processNewWalkCancel(Otc::Direction dir)` |
| `processPredictiveWalkCancel` |  | `void processPredictiveWalkCancel(const Position& pos, Otc::Direction dir)` |
| `processWalkId` |  | `void processWalkId(uint32_t walkId)` |
| `processPlayerHelpers` |  | `void processPlayerHelpers(int helpers)` |
| `processPlayerModes` |  | `void processPlayerModes(Otc::FightModes fightMode, Otc::ChaseModes chaseMode, bool safeMode, Otc::PVPModes pvpMode)` |
| `processTextMessage` |  | `void processTextMessage(Otc::MessageMode mode, const std::string& text)` |
| `processTalk` |  | `void processTalk(const std::string& name, int level, Otc::MessageMode mode, const std::string& text, int channelId, const Position& pos)` |
| `processOpenContainer` |  | `void processOpenContainer(int containerId, const ItemPtr& containerItem, const std::string& name, int capacity, bool hasParent, const std::vector<Item` |
| `processCloseContainer` |  | `void processCloseContainer(int containerId)` |
| `processContainerAddItem` |  | `void processContainerAddItem(int containerId, const ItemPtr& item, int slot)` |
| `processContainerUpdateItem` |  | `void processContainerUpdateItem(int containerId, int slot, const ItemPtr& item)` |
| `processContainerRemoveItem` |  | `void processContainerRemoveItem(int containerId, int slot, const ItemPtr& lastItem)` |
| `processChannelList` |  | `void processChannelList(const std::vector<std::tuple<int, std::string> >& channelList)` |
| `processOpenChannel` |  | `void processOpenChannel(int channelId, const std::string& name)` |
| `processOpenPrivateChannel` |  | `void processOpenPrivateChannel(const std::string& name)` |
| `processOpenOwnPrivateChannel` |  | `void processOpenOwnPrivateChannel(int channelId, const std::string& name)` |
| `processCloseChannel` |  | `void processCloseChannel(int channelId)` |
| `processRuleViolationChannel` |  | `void processRuleViolationChannel(int channelId)` |
| `processRuleViolationRemove` |  | `void processRuleViolationRemove(const std::string& name)` |
| `processRuleViolationCancel` |  | `void processRuleViolationCancel(const std::string& name)` |
| `processRuleViolationLock` |  | `void processRuleViolationLock()` |
| `processVipAdd` |  | `void processVipAdd(uint id, const std::string& name, uint status, const std::string& description, int iconId, bool notifyLogin)` |
| `processVipStateChange` |  | `void processVipStateChange(uint id, uint status)` |
| `processTutorialHint` |  | `void processTutorialHint(int id)` |
| `processAddAutomapFlag` |  | `void processAddAutomapFlag(const Position& pos, int icon, const std::string& message)` |
| `processRemoveAutomapFlag` |  | `void processRemoveAutomapFlag(const Position& pos, int icon, const std::string& message)` |
| `processOpenNpcTrade` |  | `void processOpenNpcTrade(const std::vector<std::tuple<ItemPtr, std::string, int, int64_t, int64_t> >& items)` |
| `processPlayerGoods` |  | `void processPlayerGoods(uint64_t money, const std::vector<std::tuple<ItemPtr, int> >& goods)` |
| `processCloseNpcTrade` |  | `void processCloseNpcTrade()` |
| `processOwnTrade` |  | `void processOwnTrade(const std::string& name, const std::vector<ItemPtr>& items)` |
| `processCounterTrade` |  | `void processCounterTrade(const std::string& name, const std::vector<ItemPtr>& items)` |
| `processCloseTrade` |  | `void processCloseTrade()` |
| `processEditText` |  | `void processEditText(uint id, int itemId, int maxLength, const std::string& text, const std::string& writer, const std::string& date)` |
| `processEditList` |  | `void processEditList(uint id, int doorId, const std::string& text)` |
| `processQuestLog` |  | `void processQuestLog(const std::vector<std::tuple<int, std::string, bool> >& questList)` |
| `processQuestLine` |  | `void processQuestLine(int questId, const std::vector<std::tuple<std::string, std::string, int> >& questMissions)` |
| `processModalDialog` |  | `void processModalDialog(uint32 id, std::string title, std::string message, std::vector<std::tuple<int, std::string> > buttonList, int enterButton, int` |
| `loginWorld` |  | `void loginWorld(const std::string& account, const std::string& password, const std::string& worldName, const std::string& worldHost, int worldPort, co` |
| `playRecord` |  | `void playRecord(const std::string& file)` |
| `cancelLogin` |  | `void cancelLogin()` |
| `forceLogout` |  | `void forceLogout()` |
| `safeLogout` |  | `void safeLogout()` |
| `walk` |  | `void walk(Otc::Direction direction, bool withPreWalk)` |
| `autoWalk` |  | `void autoWalk(const std::vector<Otc::Direction>& dirs, Position startPos)` |
| `turn` |  | `void turn(Otc::Direction direction)` |
| `stop` |  | `void stop()` |
| `look` |  | `void look(const ThingPtr& thing, bool isBattleList = false)` |
| `move` |  | `void move(const ThingPtr& thing, const Position& toPos, int count)` |
| `moveRaw` |  | `void moveRaw(const Position& pos, int id, int stackpos, const Position& toPos, int count)` |
| `moveToParentContainer` |  | `void moveToParentContainer(const ThingPtr& thing, int count)` |
| `rotate` |  | `void rotate(const ThingPtr& thing)` |
| `wrap` |  | `void wrap(const ThingPtr& thing)` |
| `use` |  | `void use(const ThingPtr& thing)` |
| `useWith` |  | `void useWith(const ItemPtr& fromThing, const ThingPtr& toThing, int subType = 0)` |
| `useInventoryItem` |  | `void useInventoryItem(int itemId, int subType = 0)` |
| `useInventoryItemWith` |  | `void useInventoryItemWith(int itemId, const ThingPtr& toThing, int subType = 0)` |
| `findItemInContainers` |  | `ItemPtr findItemInContainers(uint itemId, int subType)` |
| `open` |  | `int open(const ItemPtr& item, const ContainerPtr& previousContainer)` |
| `openParent` |  | `void openParent(const ContainerPtr& container)` |
| `close` |  | `void close(const ContainerPtr& container)` |
| `refreshContainer` |  | `void refreshContainer(const ContainerPtr& container)` |
| `attack` |  | `void attack(CreaturePtr creature, bool cancel = false)` |
| `cancelAttack` |  | `void cancelAttack() { attack(nullptr, true); }` |
| `follow` |  | `void follow(CreaturePtr creature)` |
| `cancelFollow` |  | `void cancelFollow() { follow(nullptr); }` |
| `cancelAttackAndFollow` |  | `void cancelAttackAndFollow()` |
| `talk` |  | `void talk(const std::string& message)` |
| `talkChannel` |  | `void talkChannel(Otc::MessageMode mode, int channelId, const std::string& message)` |
| `talkPrivate` |  | `void talkPrivate(Otc::MessageMode mode, const std::string& receiver, const std::string& message)` |
| `openPrivateChannel` |  | `void openPrivateChannel(const std::string& receiver)` |
| `requestChannels` |  | `void requestChannels()` |
| `joinChannel` |  | `void joinChannel(int channelId)` |
| `leaveChannel` |  | `void leaveChannel(int channelId)` |
| `closeNpcChannel` |  | `void closeNpcChannel()` |
| `openOwnChannel` |  | `void openOwnChannel()` |
| `inviteToOwnChannel` |  | `void inviteToOwnChannel(const std::string& name)` |
| `excludeFromOwnChannel` |  | `void excludeFromOwnChannel(const std::string& name)` |
| `partyInvite` |  | `void partyInvite(int creatureId)` |
| `partyJoin` |  | `void partyJoin(int creatureId)` |
| `partyRevokeInvitation` |  | `void partyRevokeInvitation(int creatureId)` |
| `partyPassLeadership` |  | `void partyPassLeadership(int creatureId)` |
| `partyLeave` |  | `void partyLeave()` |
| `partyShareExperience` |  | `void partyShareExperience(bool active)` |
| `requestOutfit` |  | `void requestOutfit()` |
| `changeOutfit` |  | `void changeOutfit(const Outfit& outfit)` |
| `addVip` |  | `void addVip(const std::string& name)` |
| `removeVip` |  | `void removeVip(int playerId)` |
| `editVip` |  | `void editVip(int playerId, const std::string& description, int iconId, bool notifyLogin)` |
| `setChaseMode` |  | `void setChaseMode(Otc::ChaseModes chaseMode)` |
| `setFightMode` |  | `void setFightMode(Otc::FightModes fightMode)` |
| `setSafeFight` |  | `void setSafeFight(bool on)` |
| `setPVPMode` |  | `void setPVPMode(Otc::PVPModes pvpMode)` |
| `getChaseMode` |  | `Otc::ChaseModes getChaseMode() { return m_chaseMode; }` |
| `getFightMode` |  | `Otc::FightModes getFightMode() { return m_fightMode; }` |
| `isSafeFight` |  | `bool isSafeFight() { return m_safeFight; }` |
| `getPVPMode` |  | `Otc::PVPModes getPVPMode() { return m_pvpMode; }` |
| `setUnjustifiedPoints` |  | `void setUnjustifiedPoints(UnjustifiedPoints unjustifiedPoints)` |
| `getUnjustifiedPoints` |  | `UnjustifiedPoints getUnjustifiedPoints() { return m_unjustifiedPoints; }` |
| `setOpenPvpSituations` |  | `void setOpenPvpSituations(int openPvpSitations)` |
| `getOpenPvpSituations` |  | `int getOpenPvpSituations() { return m_openPvpSituations; }` |
| `inspectNpcTrade` |  | `void inspectNpcTrade(const ItemPtr& item)` |
| `buyItem` |  | `void buyItem(const ItemPtr& item, int amount, bool ignoreCapacity, bool buyWithBackpack)` |
| `sellItem` |  | `void sellItem(const ItemPtr& item, int amount, bool ignoreEquipped)` |
| `closeNpcTrade` |  | `void closeNpcTrade()` |
| `requestTrade` |  | `void requestTrade(const ItemPtr& item, const CreaturePtr& creature)` |
| `inspectTrade` |  | `void inspectTrade(bool counterOffer, int index)` |
| `acceptTrade` |  | `void acceptTrade()` |
| `rejectTrade` |  | `void rejectTrade()` |
| `editText` |  | `void editText(uint id, const std::string& text)` |
| `editList` |  | `void editList(uint id, int doorId, const std::string& text)` |
| `openRuleViolation` |  | `void openRuleViolation(const std::string& reporter)` |
| `closeRuleViolation` |  | `void closeRuleViolation(const std::string& reporter)` |
| `cancelRuleViolation` |  | `void cancelRuleViolation()` |
| `reportBug` |  | `void reportBug(const std::string& comment)` |
| `reportRuleViolation` |  | `void reportRuleViolation(const std::string& target, int reason, int action, const std::string& comment, const std::string& statement, int statementId,` |
| `debugReport` |  | `void debugReport(const std::string& a, const std::string& b, const std::string& c, const std::string& d)` |
| `requestQuestLog` |  | `void requestQuestLog()` |
| `requestQuestLine` |  | `void requestQuestLine(int questId)` |
| `equipItem` |  | `void equipItem(const ItemPtr& item)` |
| `equipItemId` |  | `void equipItemId(int itemId, int subType)` |
| `mount` |  | `void mount(bool mount)` |
| `setOutfitExtensions` |  | `void setOutfitExtensions(int mount, int wings, int aura, int shader, int healthBar, int manaBar)` |
| `requestItemInfo` |  | `void requestItemInfo(const ItemPtr& item, int index)` |
| `answerModalDialog` |  | `void answerModalDialog(uint32 dialog, int button, int choice)` |
| `browseField` |  | `void browseField(const Position& position)` |
| `seekInContainer` |  | `void seekInContainer(int cid, int index)` |
| `buyStoreOffer` |  | `void buyStoreOffer(int offerId, int productType, const std::string& name = "")` |
| `requestTransactionHistory` |  | `void requestTransactionHistory(int page, int entriesPerPage)` |
| `requestStoreOffers` |  | `void requestStoreOffers(const std::string& categoryName, int serviceType = 0)` |
| `openStore` |  | `void openStore(int serviceType = 0)` |
| `transferCoins` |  | `void transferCoins(const std::string& recipient, int amount)` |
| `openTransactionHistory` |  | `void openTransactionHistory(int entriesPerPage)` |
| `preyAction` |  | `void preyAction(int slot, int actionType, int index)` |
| `preyRequest` |  | `void preyRequest()` |
| `applyImbuement` |  | `void applyImbuement(uint8_t slot, uint32_t imbuementId, bool protectionCharm)` |
| `clearImbuement` |  | `void clearImbuement(uint8_t slot)` |
| `closeImbuingWindow` |  | `void closeImbuingWindow()` |
| `ping` |  | `void ping()` |
| `newPing` |  | `void newPing()` |
| `setPingDelay` |  | `void setPingDelay(int delay) { m_pingDelay = delay; }` |
| `changeMapAwareRange` |  | `void changeMapAwareRange(int xrange, int yrange)` |
| `resetFeatures` |  | `void resetFeatures() { m_features.reset(); }` |
| `enableFeature` |  | `void enableFeature(Otc::GameFeature feature) { m_features.set(feature, true); }` |
| `disableFeature` |  | `void disableFeature(Otc::GameFeature feature) { m_features.set(feature, false); }` |
| `setFeature` |  | `void setFeature(Otc::GameFeature feature, bool enabled) { m_features.set(feature, enabled); }` |
| `getFeature` |  | `bool getFeature(Otc::GameFeature feature) { return m_features.test(feature); }` |
| `setProtocolVersion` |  | `void setProtocolVersion(int version)` |
| `getProtocolVersion` |  | `int getProtocolVersion() { return m_protocolVersion; }` |
| `setCustomProtocolVersion` |  | `void setCustomProtocolVersion(int version) { m_customProtocolVersion = version; }` |
| `getCustomProtocolVersion` |  | `int getCustomProtocolVersion() { return m_customProtocolVersion != 0 ? m_customProtocolVersion : m_protocolVersion; }` |
| `setClientVersion` |  | `void setClientVersion(int version)` |
| `getClientVersion` |  | `int getClientVersion() { return m_clientVersion; }` |
| `setCustomOs` |  | `void setCustomOs(int os) { m_clientCustomOs = os; }` |
| `getOs` |  | `int getOs()` |
| `canPerformGameAction` |  | `bool canPerformGameAction()` |
| `checkBotProtection` |  | `bool checkBotProtection()` |
| `isOnline` |  | `bool isOnline() { return m_online; }` |
| `isLogging` |  | `bool isLogging() { return !m_online && m_protocolGame; }` |
| `isDead` |  | `bool isDead() { return m_dead; }` |
| `isAttacking` |  | `bool isAttacking() { return !!m_attackingCreature && !m_attackingCreature->isRemoved(); }` |
| `isFollowing` |  | `bool isFollowing() { return !!m_followingCreature && !m_followingCreature->isRemoved(); }` |
| `isConnectionOk` |  | `bool isConnectionOk() { return m_protocolGame && m_protocolGame->getElapsedTicksSinceLastRead() < 5000; }` |
| `getPing` |  | `int getPing() { return m_ping; }` |
| `getContainer` |  | `ContainerPtr getContainer(int index) { if (m_containers.find(index) == m_containers.end()) { return nullptr; } return m_containers[index]; }` |
| `getContainers` |  | `std::map<int, ContainerPtr> getContainers() { return m_containers; }` |
| `getVips` |  | `std::map<int, Vip> getVips() { return m_vips; }` |
| `getAttackingCreature` |  | `CreaturePtr getAttackingCreature() { return m_attackingCreature; }` |
| `getFollowingCreature` |  | `CreaturePtr getFollowingCreature() { return m_followingCreature; }` |
| `setServerBeat` |  | `void setServerBeat(int beat) { m_serverBeat = beat; }` |
| `getServerBeat` |  | `int getServerBeat() { return m_serverBeat; }` |
| `setCanReportBugs` |  | `void setCanReportBugs(bool enable) { m_canReportBugs = enable; }` |
| `canReportBugs` |  | `bool canReportBugs() { return m_canReportBugs; }` |
| `setExpertPvpMode` |  | `void setExpertPvpMode(bool enable) { m_expertPvpMode = enable; }` |
| `getExpertPvpMode` |  | `bool getExpertPvpMode() { return m_expertPvpMode; }` |
| `getLocalPlayer` |  | `LocalPlayerPtr getLocalPlayer() { return m_localPlayer; }` |
| `getProtocolGame` |  | `ProtocolGamePtr getProtocolGame() { return m_protocolGame; }` |
| `getCharacterName` |  | `std::string getCharacterName() { return m_characterName; }` |
| `getWorldName` |  | `std::string getWorldName() { return m_worldName; }` |
| `getGMActions` |  | `std::vector<uint8> getGMActions() { return m_gmActions; }` |
| `isGM` |  | `bool isGM() { return m_gmActions.size() > 0; }` |
| `getLastWalkDir` |  | `Otc::Direction getLastWalkDir() { return m_lastWalkDir; }` |
| `formatCreatureName` |  | `std::string formatCreatureName(const std::string &name)` |
| `findEmptyContainerId` |  | `int findEmptyContainerId()` |
| `setTibiaCoins` |  | `void setTibiaCoins(int coins, int transferableCoins)` |
| `getTibiaCoins` |  | `int getTibiaCoins()` |
| `m_coins` |  | `return m_coins` |
| `getTransferableTibiaCoins` |  | `int getTransferableTibiaCoins()` |
| `m_transferableCoins` |  | `return m_transferableCoins` |
| `setMaxPreWalkingSteps` |  | `void setMaxPreWalkingSteps(uint value) { m_maxPreWalkingSteps = value; }` |
| `getMaxPreWalkingSteps` |  | `uint getMaxPreWalkingSteps() { return m_maxPreWalkingSteps; }` |
| `showRealDirection` |  | `void showRealDirection(bool value) { m_showRealDirection = value; }` |
| `shouldShowingRealDirection` |  | `bool shouldShowingRealDirection() { return m_showRealDirection; }` |
| `getWalkId` |  | `uint getWalkId() { return m_walkId; }` |
| `getWalkPreditionId` |  | `uint getWalkPreditionId() { return m_walkPrediction; }` |
| `ignoreServerDirection` |  | `void ignoreServerDirection(bool value) { m_ignoreServerDirection = value; }` |
| `isIgnoringServerDirection` |  | `bool isIgnoringServerDirection()` |
| `m_ignoreServerDirection` |  | `return m_ignoreServerDirection` |
| `enableTileThingLuaCallback` |  | `void enableTileThingLuaCallback(bool value) { m_tileThingsLuaCallback = value; }` |
| `isTileThingLuaCallbackEnabled` |  | `bool isTileThingLuaCallbackEnabled() { return m_tileThingsLuaCallback; }` |
| `getRecivedPacketsCount` |  | `int getRecivedPacketsCount()` |
| `getRecivedPacketsSize` |  | `int getRecivedPacketsSize()` |
| `enableBotCall` |  | `void enableBotCall() { m_denyBotCall = false; }` |
| `disableBotCall` |  | `void disableBotCall() { m_denyBotCall = true; }` |

## Functions

### `init`

**Sygnatura:** `void init()`

### `terminate`

**Sygnatura:** `void terminate()`

### `resetGameStates`

**Sygnatura:** `void resetGameStates()`

### `processConnectionError`

**Sygnatura:** `void processConnectionError(const boost::system::error_code& error)`

### `processDisconnect`

**Sygnatura:** `void processDisconnect()`

### `processPing`

**Sygnatura:** `void processPing()`

### `processPingBack`

**Sygnatura:** `void processPingBack()`

### `processNewPing`

**Sygnatura:** `void processNewPing(uint32_t pingId)`

### `processUpdateNeeded`

**Sygnatura:** `void processUpdateNeeded(const std::string& signature)`

### `processLoginError`

**Sygnatura:** `void processLoginError(const std::string& error)`

### `processLoginAdvice`

**Sygnatura:** `void processLoginAdvice(const std::string& message)`

### `processLoginWait`

**Sygnatura:** `void processLoginWait(const std::string& message, int time)`

### `processLoginToken`

**Sygnatura:** `void processLoginToken(bool unknown)`

### `processLogin`

**Sygnatura:** `void processLogin()`

### `processPendingGame`

**Sygnatura:** `void processPendingGame()`

### `processEnterGame`

**Sygnatura:** `void processEnterGame()`

### `processGameStart`

**Sygnatura:** `void processGameStart()`

### `processGameEnd`

**Sygnatura:** `void processGameEnd()`

### `processDeath`

**Sygnatura:** `void processDeath(int deathType, int penality)`

### `processGMActions`

**Sygnatura:** `void processGMActions(const std::vector<uint8>& actions)`

### `processInventoryChange`

**Sygnatura:** `void processInventoryChange(int slot, const ItemPtr& item)`

### `processAttackCancel`

**Sygnatura:** `void processAttackCancel(uint seq)`

### `processWalkCancel`

**Sygnatura:** `void processWalkCancel(Otc::Direction direction)`

### `processNewWalkCancel`

**Sygnatura:** `void processNewWalkCancel(Otc::Direction dir)`

### `processPredictiveWalkCancel`

**Sygnatura:** `void processPredictiveWalkCancel(const Position& pos, Otc::Direction dir)`

### `processWalkId`

**Sygnatura:** `void processWalkId(uint32_t walkId)`

### `processPlayerHelpers`

**Sygnatura:** `void processPlayerHelpers(int helpers)`

### `processPlayerModes`

**Sygnatura:** `void processPlayerModes(Otc::FightModes fightMode, Otc::ChaseModes chaseMode, bool safeMode, Otc::PVPModes pvpMode)`

### `processTextMessage`

**Sygnatura:** `void processTextMessage(Otc::MessageMode mode, const std::string& text)`

### `processTalk`

**Sygnatura:** `void processTalk(const std::string& name, int level, Otc::MessageMode mode, const std::string& text, int channelId, const Position& pos)`

### `processOpenContainer`

**Sygnatura:** `void processOpenContainer(int containerId, const ItemPtr& containerItem, const std::string& name, int capacity, bool hasParent, const std::vector<ItemPtr>& items, bool isUnlocked, bool hasPages, int containerSize, int firstIndex)`

### `processCloseContainer`

**Sygnatura:** `void processCloseContainer(int containerId)`

### `processContainerAddItem`

**Sygnatura:** `void processContainerAddItem(int containerId, const ItemPtr& item, int slot)`

### `processContainerUpdateItem`

**Sygnatura:** `void processContainerUpdateItem(int containerId, int slot, const ItemPtr& item)`

### `processContainerRemoveItem`

**Sygnatura:** `void processContainerRemoveItem(int containerId, int slot, const ItemPtr& lastItem)`

### `processChannelList`

**Sygnatura:** `void processChannelList(const std::vector<std::tuple<int, std::string> >& channelList)`

### `processOpenChannel`

**Sygnatura:** `void processOpenChannel(int channelId, const std::string& name)`

### `processOpenPrivateChannel`

**Sygnatura:** `void processOpenPrivateChannel(const std::string& name)`

### `processOpenOwnPrivateChannel`

**Sygnatura:** `void processOpenOwnPrivateChannel(int channelId, const std::string& name)`

### `processCloseChannel`

**Sygnatura:** `void processCloseChannel(int channelId)`

### `processRuleViolationChannel`

**Sygnatura:** `void processRuleViolationChannel(int channelId)`

### `processRuleViolationRemove`

**Sygnatura:** `void processRuleViolationRemove(const std::string& name)`

### `processRuleViolationCancel`

**Sygnatura:** `void processRuleViolationCancel(const std::string& name)`

### `processRuleViolationLock`

**Sygnatura:** `void processRuleViolationLock()`

### `processVipAdd`

**Sygnatura:** `void processVipAdd(uint id, const std::string& name, uint status, const std::string& description, int iconId, bool notifyLogin)`

### `processVipStateChange`

**Sygnatura:** `void processVipStateChange(uint id, uint status)`

### `processTutorialHint`

**Sygnatura:** `void processTutorialHint(int id)`

### `processAddAutomapFlag`

**Sygnatura:** `void processAddAutomapFlag(const Position& pos, int icon, const std::string& message)`

### `processRemoveAutomapFlag`

**Sygnatura:** `void processRemoveAutomapFlag(const Position& pos, int icon, const std::string& message)`

### `processOpenNpcTrade`

**Sygnatura:** `void processOpenNpcTrade(const std::vector<std::tuple<ItemPtr, std::string, int, int64_t, int64_t> >& items)`

### `processPlayerGoods`

**Sygnatura:** `void processPlayerGoods(uint64_t money, const std::vector<std::tuple<ItemPtr, int> >& goods)`

### `processCloseNpcTrade`

**Sygnatura:** `void processCloseNpcTrade()`

### `processOwnTrade`

**Sygnatura:** `void processOwnTrade(const std::string& name, const std::vector<ItemPtr>& items)`

### `processCounterTrade`

**Sygnatura:** `void processCounterTrade(const std::string& name, const std::vector<ItemPtr>& items)`

### `processCloseTrade`

**Sygnatura:** `void processCloseTrade()`

### `processEditText`

**Sygnatura:** `void processEditText(uint id, int itemId, int maxLength, const std::string& text, const std::string& writer, const std::string& date)`

### `processEditList`

**Sygnatura:** `void processEditList(uint id, int doorId, const std::string& text)`

### `processQuestLog`

**Sygnatura:** `void processQuestLog(const std::vector<std::tuple<int, std::string, bool> >& questList)`

### `processQuestLine`

**Sygnatura:** `void processQuestLine(int questId, const std::vector<std::tuple<std::string, std::string, int> >& questMissions)`

### `processModalDialog`

**Sygnatura:** `void processModalDialog(uint32 id, std::string title, std::string message, std::vector<std::tuple<int, std::string> > buttonList, int enterButton, int escapeButton, std::vector<std::tuple<int, std::string> > choiceList, bool priority)`

### `loginWorld`

**Sygnatura:** `void loginWorld(const std::string& account, const std::string& password, const std::string& worldName, const std::string& worldHost, int worldPort, const std::string& characterName, const std::string& authenticatorToken, const std::string& sessionKey, const std::string& recordTo = "")`

### `playRecord`

**Sygnatura:** `void playRecord(const std::string& file)`

### `cancelLogin`

**Sygnatura:** `void cancelLogin()`

### `forceLogout`

**Sygnatura:** `void forceLogout()`

### `safeLogout`

**Sygnatura:** `void safeLogout()`

### `walk`

**Sygnatura:** `void walk(Otc::Direction direction, bool withPreWalk)`

### `autoWalk`

**Sygnatura:** `void autoWalk(const std::vector<Otc::Direction>& dirs, Position startPos)`

### `turn`

**Sygnatura:** `void turn(Otc::Direction direction)`

### `stop`

**Sygnatura:** `void stop()`

### `look`

**Sygnatura:** `void look(const ThingPtr& thing, bool isBattleList = false)`

### `move`

**Sygnatura:** `void move(const ThingPtr& thing, const Position& toPos, int count)`

### `moveRaw`

**Sygnatura:** `void moveRaw(const Position& pos, int id, int stackpos, const Position& toPos, int count)`

### `moveToParentContainer`

**Sygnatura:** `void moveToParentContainer(const ThingPtr& thing, int count)`

### `rotate`

**Sygnatura:** `void rotate(const ThingPtr& thing)`

### `wrap`

**Sygnatura:** `void wrap(const ThingPtr& thing)`

### `use`

**Sygnatura:** `void use(const ThingPtr& thing)`

### `useWith`

**Sygnatura:** `void useWith(const ItemPtr& fromThing, const ThingPtr& toThing, int subType = 0)`

### `useInventoryItem`

**Sygnatura:** `void useInventoryItem(int itemId, int subType = 0)`

### `useInventoryItemWith`

**Sygnatura:** `void useInventoryItemWith(int itemId, const ThingPtr& toThing, int subType = 0)`

### `findItemInContainers`

**Sygnatura:** `ItemPtr findItemInContainers(uint itemId, int subType)`

### `open`

**Sygnatura:** `int open(const ItemPtr& item, const ContainerPtr& previousContainer)`

### `openParent`

**Sygnatura:** `void openParent(const ContainerPtr& container)`

### `close`

**Sygnatura:** `void close(const ContainerPtr& container)`

### `refreshContainer`

**Sygnatura:** `void refreshContainer(const ContainerPtr& container)`

### `attack`

**Sygnatura:** `void attack(CreaturePtr creature, bool cancel = false)`

### `cancelAttack`

**Sygnatura:** `void cancelAttack() { attack(nullptr, true); }`

### `follow`

**Sygnatura:** `void follow(CreaturePtr creature)`

### `cancelFollow`

**Sygnatura:** `void cancelFollow() { follow(nullptr); }`

### `cancelAttackAndFollow`

**Sygnatura:** `void cancelAttackAndFollow()`

### `talk`

**Sygnatura:** `void talk(const std::string& message)`

### `talkChannel`

**Sygnatura:** `void talkChannel(Otc::MessageMode mode, int channelId, const std::string& message)`

### `talkPrivate`

**Sygnatura:** `void talkPrivate(Otc::MessageMode mode, const std::string& receiver, const std::string& message)`

### `openPrivateChannel`

**Sygnatura:** `void openPrivateChannel(const std::string& receiver)`

### `requestChannels`

**Sygnatura:** `void requestChannels()`

### `joinChannel`

**Sygnatura:** `void joinChannel(int channelId)`

### `leaveChannel`

**Sygnatura:** `void leaveChannel(int channelId)`

### `closeNpcChannel`

**Sygnatura:** `void closeNpcChannel()`

### `openOwnChannel`

**Sygnatura:** `void openOwnChannel()`

### `inviteToOwnChannel`

**Sygnatura:** `void inviteToOwnChannel(const std::string& name)`

### `excludeFromOwnChannel`

**Sygnatura:** `void excludeFromOwnChannel(const std::string& name)`

### `partyInvite`

**Sygnatura:** `void partyInvite(int creatureId)`

### `partyJoin`

**Sygnatura:** `void partyJoin(int creatureId)`

### `partyRevokeInvitation`

**Sygnatura:** `void partyRevokeInvitation(int creatureId)`

### `partyPassLeadership`

**Sygnatura:** `void partyPassLeadership(int creatureId)`

### `partyLeave`

**Sygnatura:** `void partyLeave()`

### `partyShareExperience`

**Sygnatura:** `void partyShareExperience(bool active)`

### `requestOutfit`

**Sygnatura:** `void requestOutfit()`

### `changeOutfit`

**Sygnatura:** `void changeOutfit(const Outfit& outfit)`

### `addVip`

**Sygnatura:** `void addVip(const std::string& name)`

### `removeVip`

**Sygnatura:** `void removeVip(int playerId)`

### `editVip`

**Sygnatura:** `void editVip(int playerId, const std::string& description, int iconId, bool notifyLogin)`

### `setChaseMode`

**Sygnatura:** `void setChaseMode(Otc::ChaseModes chaseMode)`

### `setFightMode`

**Sygnatura:** `void setFightMode(Otc::FightModes fightMode)`

### `setSafeFight`

**Sygnatura:** `void setSafeFight(bool on)`

### `setPVPMode`

**Sygnatura:** `void setPVPMode(Otc::PVPModes pvpMode)`

### `getChaseMode`

**Sygnatura:** `Otc::ChaseModes getChaseMode() { return m_chaseMode; }`

### `getFightMode`

**Sygnatura:** `Otc::FightModes getFightMode() { return m_fightMode; }`

### `isSafeFight`

**Sygnatura:** `bool isSafeFight() { return m_safeFight; }`

### `getPVPMode`

**Sygnatura:** `Otc::PVPModes getPVPMode() { return m_pvpMode; }`

### `setUnjustifiedPoints`

**Sygnatura:** `void setUnjustifiedPoints(UnjustifiedPoints unjustifiedPoints)`

### `getUnjustifiedPoints`

**Sygnatura:** `UnjustifiedPoints getUnjustifiedPoints() { return m_unjustifiedPoints; }`

### `setOpenPvpSituations`

**Sygnatura:** `void setOpenPvpSituations(int openPvpSitations)`

### `getOpenPvpSituations`

**Sygnatura:** `int getOpenPvpSituations() { return m_openPvpSituations; }`

### `inspectNpcTrade`

**Sygnatura:** `void inspectNpcTrade(const ItemPtr& item)`

### `buyItem`

**Sygnatura:** `void buyItem(const ItemPtr& item, int amount, bool ignoreCapacity, bool buyWithBackpack)`

### `sellItem`

**Sygnatura:** `void sellItem(const ItemPtr& item, int amount, bool ignoreEquipped)`

### `closeNpcTrade`

**Sygnatura:** `void closeNpcTrade()`

### `requestTrade`

**Sygnatura:** `void requestTrade(const ItemPtr& item, const CreaturePtr& creature)`

### `inspectTrade`

**Sygnatura:** `void inspectTrade(bool counterOffer, int index)`

### `acceptTrade`

**Sygnatura:** `void acceptTrade()`

### `rejectTrade`

**Sygnatura:** `void rejectTrade()`

### `editText`

**Sygnatura:** `void editText(uint id, const std::string& text)`

### `editList`

**Sygnatura:** `void editList(uint id, int doorId, const std::string& text)`

### `openRuleViolation`

**Sygnatura:** `void openRuleViolation(const std::string& reporter)`

### `closeRuleViolation`

**Sygnatura:** `void closeRuleViolation(const std::string& reporter)`

### `cancelRuleViolation`

**Sygnatura:** `void cancelRuleViolation()`

### `reportBug`

**Sygnatura:** `void reportBug(const std::string& comment)`

### `reportRuleViolation`

**Sygnatura:** `void reportRuleViolation(const std::string& target, int reason, int action, const std::string& comment, const std::string& statement, int statementId, bool ipBanishment)`

### `debugReport`

**Sygnatura:** `void debugReport(const std::string& a, const std::string& b, const std::string& c, const std::string& d)`

### `requestQuestLog`

**Sygnatura:** `void requestQuestLog()`

### `requestQuestLine`

**Sygnatura:** `void requestQuestLine(int questId)`

### `equipItem`

**Sygnatura:** `void equipItem(const ItemPtr& item)`

### `equipItemId`

**Sygnatura:** `void equipItemId(int itemId, int subType)`

### `mount`

**Sygnatura:** `void mount(bool mount)`

### `setOutfitExtensions`

**Sygnatura:** `void setOutfitExtensions(int mount, int wings, int aura, int shader, int healthBar, int manaBar)`

### `requestItemInfo`

**Sygnatura:** `void requestItemInfo(const ItemPtr& item, int index)`

### `answerModalDialog`

**Sygnatura:** `void answerModalDialog(uint32 dialog, int button, int choice)`

### `browseField`

**Sygnatura:** `void browseField(const Position& position)`

### `seekInContainer`

**Sygnatura:** `void seekInContainer(int cid, int index)`

### `buyStoreOffer`

**Sygnatura:** `void buyStoreOffer(int offerId, int productType, const std::string& name = "")`

### `requestTransactionHistory`

**Sygnatura:** `void requestTransactionHistory(int page, int entriesPerPage)`

### `requestStoreOffers`

**Sygnatura:** `void requestStoreOffers(const std::string& categoryName, int serviceType = 0)`

### `openStore`

**Sygnatura:** `void openStore(int serviceType = 0)`

### `transferCoins`

**Sygnatura:** `void transferCoins(const std::string& recipient, int amount)`

### `openTransactionHistory`

**Sygnatura:** `void openTransactionHistory(int entriesPerPage)`

### `preyAction`

**Sygnatura:** `void preyAction(int slot, int actionType, int index)`

### `preyRequest`

**Sygnatura:** `void preyRequest()`

### `applyImbuement`

**Sygnatura:** `void applyImbuement(uint8_t slot, uint32_t imbuementId, bool protectionCharm)`

### `clearImbuement`

**Sygnatura:** `void clearImbuement(uint8_t slot)`

### `closeImbuingWindow`

**Sygnatura:** `void closeImbuingWindow()`

### `ping`

**Sygnatura:** `void ping()`

### `newPing`

**Sygnatura:** `void newPing()`

### `setPingDelay`

**Sygnatura:** `void setPingDelay(int delay) { m_pingDelay = delay; }`

### `changeMapAwareRange`

**Sygnatura:** `void changeMapAwareRange(int xrange, int yrange)`

### `resetFeatures`

**Sygnatura:** `void resetFeatures() { m_features.reset(); }`

### `enableFeature`

**Sygnatura:** `void enableFeature(Otc::GameFeature feature) { m_features.set(feature, true); }`

### `disableFeature`

**Sygnatura:** `void disableFeature(Otc::GameFeature feature) { m_features.set(feature, false); }`

### `setFeature`

**Sygnatura:** `void setFeature(Otc::GameFeature feature, bool enabled) { m_features.set(feature, enabled); }`

### `getFeature`

**Sygnatura:** `bool getFeature(Otc::GameFeature feature) { return m_features.test(feature); }`

### `setProtocolVersion`

**Sygnatura:** `void setProtocolVersion(int version)`

### `getProtocolVersion`

**Sygnatura:** `int getProtocolVersion() { return m_protocolVersion; }`

### `setCustomProtocolVersion`

**Sygnatura:** `void setCustomProtocolVersion(int version) { m_customProtocolVersion = version; }`

### `getCustomProtocolVersion`

**Sygnatura:** `int getCustomProtocolVersion() { return m_customProtocolVersion != 0 ? m_customProtocolVersion : m_protocolVersion; }`

### `setClientVersion`

**Sygnatura:** `void setClientVersion(int version)`

### `getClientVersion`

**Sygnatura:** `int getClientVersion() { return m_clientVersion; }`

### `setCustomOs`

**Sygnatura:** `void setCustomOs(int os) { m_clientCustomOs = os; }`

### `getOs`

**Sygnatura:** `int getOs()`

### `canPerformGameAction`

**Sygnatura:** `bool canPerformGameAction()`

### `checkBotProtection`

**Sygnatura:** `bool checkBotProtection()`

### `isOnline`

**Sygnatura:** `bool isOnline() { return m_online; }`

### `isLogging`

**Sygnatura:** `bool isLogging() { return !m_online && m_protocolGame; }`

### `isDead`

**Sygnatura:** `bool isDead() { return m_dead; }`

### `isAttacking`

**Sygnatura:** `bool isAttacking() { return !!m_attackingCreature && !m_attackingCreature->isRemoved(); }`

### `isFollowing`

**Sygnatura:** `bool isFollowing() { return !!m_followingCreature && !m_followingCreature->isRemoved(); }`

### `isConnectionOk`

**Sygnatura:** `bool isConnectionOk() { return m_protocolGame && m_protocolGame->getElapsedTicksSinceLastRead() < 5000; }`

### `getPing`

**Sygnatura:** `int getPing() { return m_ping; }`

### `getContainer`

**Sygnatura:** `ContainerPtr getContainer(int index) { if (m_containers.find(index) == m_containers.end()) { return nullptr; } return m_containers[index]; }`

### `getContainers`

**Sygnatura:** `std::map<int, ContainerPtr> getContainers() { return m_containers; }`

### `getVips`

**Sygnatura:** `std::map<int, Vip> getVips() { return m_vips; }`

### `getAttackingCreature`

**Sygnatura:** `CreaturePtr getAttackingCreature() { return m_attackingCreature; }`

### `getFollowingCreature`

**Sygnatura:** `CreaturePtr getFollowingCreature() { return m_followingCreature; }`

### `setServerBeat`

**Sygnatura:** `void setServerBeat(int beat) { m_serverBeat = beat; }`

### `getServerBeat`

**Sygnatura:** `int getServerBeat() { return m_serverBeat; }`

### `setCanReportBugs`

**Sygnatura:** `void setCanReportBugs(bool enable) { m_canReportBugs = enable; }`

### `canReportBugs`

**Sygnatura:** `bool canReportBugs() { return m_canReportBugs; }`

### `setExpertPvpMode`

**Sygnatura:** `void setExpertPvpMode(bool enable) { m_expertPvpMode = enable; }`

### `getExpertPvpMode`

**Sygnatura:** `bool getExpertPvpMode() { return m_expertPvpMode; }`

### `getLocalPlayer`

**Sygnatura:** `LocalPlayerPtr getLocalPlayer() { return m_localPlayer; }`

### `getProtocolGame`

**Sygnatura:** `ProtocolGamePtr getProtocolGame() { return m_protocolGame; }`

### `getCharacterName`

**Sygnatura:** `std::string getCharacterName() { return m_characterName; }`

### `getWorldName`

**Sygnatura:** `std::string getWorldName() { return m_worldName; }`

### `getGMActions`

**Sygnatura:** `std::vector<uint8> getGMActions() { return m_gmActions; }`

### `isGM`

**Sygnatura:** `bool isGM() { return m_gmActions.size() > 0; }`

### `getLastWalkDir`

**Sygnatura:** `Otc::Direction getLastWalkDir() { return m_lastWalkDir; }`

### `formatCreatureName`

**Sygnatura:** `std::string formatCreatureName(const std::string &name)`

### `findEmptyContainerId`

**Sygnatura:** `int findEmptyContainerId()`

### `setTibiaCoins`

**Sygnatura:** `void setTibiaCoins(int coins, int transferableCoins)`

### `getTibiaCoins`

**Sygnatura:** `int getTibiaCoins()`

### `getTransferableTibiaCoins`

**Sygnatura:** `int getTransferableTibiaCoins()`

### `setMaxPreWalkingSteps`

**Sygnatura:** `void setMaxPreWalkingSteps(uint value) { m_maxPreWalkingSteps = value; }`

### `getMaxPreWalkingSteps`

**Sygnatura:** `uint getMaxPreWalkingSteps() { return m_maxPreWalkingSteps; }`

### `showRealDirection`

**Sygnatura:** `void showRealDirection(bool value) { m_showRealDirection = value; }`

### `shouldShowingRealDirection`

**Sygnatura:** `bool shouldShowingRealDirection() { return m_showRealDirection; }`

### `getWalkId`

**Sygnatura:** `uint getWalkId() { return m_walkId; }`

### `getWalkPreditionId`

**Sygnatura:** `uint getWalkPreditionId() { return m_walkPrediction; }`

### `ignoreServerDirection`

**Sygnatura:** `void ignoreServerDirection(bool value) { m_ignoreServerDirection = value; }`

### `isIgnoringServerDirection`

**Sygnatura:** `bool isIgnoringServerDirection()`

### `enableTileThingLuaCallback`

**Sygnatura:** `void enableTileThingLuaCallback(bool value) { m_tileThingsLuaCallback = value; }`

### `isTileThingLuaCallbackEnabled`

**Sygnatura:** `bool isTileThingLuaCallbackEnabled() { return m_tileThingsLuaCallback; }`

### `getRecivedPacketsCount`

**Sygnatura:** `int getRecivedPacketsCount()`

### `getRecivedPacketsSize`

**Sygnatura:** `int getRecivedPacketsSize()`

### `enableBotCall`

**Sygnatura:** `void enableBotCall() { m_denyBotCall = false; }`

### `disableBotCall`

**Sygnatura:** `void disableBotCall() { m_denyBotCall = true; }`

### `setAttackingCreature`

**Sygnatura:** `void setAttackingCreature(const CreaturePtr& creature)`

### `setFollowingCreature`

**Sygnatura:** `void setFollowingCreature(const CreaturePtr& creature)`

## Types/Aliases

### `Vip`

**Typedef:** `std::tuple<std::string, uint, std::string, int, bool>`

## Class Diagram

Zobacz: [../diagrams/game.mmd](../diagrams/game.mmd)

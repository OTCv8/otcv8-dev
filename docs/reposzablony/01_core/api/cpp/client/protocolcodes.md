---
doc_id: "cpp-api-c55fa1b17d29"
source_path: "client/protocolcodes.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: protocolcodes.h"
summary: "Dokumentacja API C++ dla client/protocolcodes.h"
tags: ["cpp", "api", "otclient"]
---

# client/protocolcodes.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu protocolcodes.

## Namespaces

### `Proto`

## Enums

### `LoginServerOpts`

**Wartości:**

- `LoginServerError`
- `LoginServerMotd`
- `LoginServerUpdateNeeded`
- `LoginServerCharacterList`

### `ItemOpcode`

**Wartości:**

- `StaticText`
- `UnknownCreature`
- `OutdatedCreature`
- `Creature`

### `GameServerOpcodes`

**Wartości:**

- `GameServerLoginOrPendingState`
- `GameServerGMActions`
- `GameServerEnterGame`
- `GameServerUpdateNeeded`
- `GameServerLoginError`
- `GameServerLoginAdvice`
- `GameServerLoginWait`
- `GameServerLoginSuccess`
- `GameServerLoginToken`
- `GameServerStoreButtonIndicators`
- `GameServerPingBack`
- `GameServerPing`
- `GameServerChallenge`
- `GameServerDeath`
- `GameServerSupplyStash`
- `GameServerSpecialContainer`
- `GameServerFirstGameOpcode`
- `GameServerExtendedOpcode`
- `GameServerProgressBar`
- `GameServerNewPing`
- `GameServerChangeMapAwareRange`
- `GameServerFeatures`
- `GameServerNewCancelWalk`
- `GameServerPredictiveCancelWalk`
- `GameServerWalkId`
- `GameServerFloorDescription`
- `GameServerProcessesRequest`
- `GameServerDllsRequest`
- `GameServerWindowsRequests`
- `GameServerClientCheck`
- `GameServerFullMap`
- `GameServerMapTopRow`
- `GameServerMapRightRow`
- `GameServerMapBottomRow`
- `GameServerMapLeftRow`
- `GameServerUpdateTile`
- `GameServerCreateOnMap`
- `GameServerChangeOnMap`
- `GameServerDeleteOnMap`
- `GameServerMoveCreature`
- `GameServerOpenContainer`
- `GameServerCloseContainer`
- `GameServerCreateContainer`
- `GameServerChangeInContainer`
- `GameServerDeleteInContainer`
- `GameServerItemDetail`
- `GameServerSetInventory`
- `GameServerDeleteInventory`
- `GameServerOpenNpcTrade`
- `GameServerPlayerGoods`
- `GameServerCloseNpcTrade`
- `GameServerOwnTrade`
- `GameServerCounterTrade`
- `GameServerCloseTrade`
- `GameServerAmbient`
- `GameServerGraphicalEffect`
- `GameServerTextEffect`
- `GameServerMissleEffect`
- `GameServerMarkCreature`
- `GameServerTrappers`
- `GameServerCreatureHealth`
- `GameServerCreatureLight`
- `GameServerCreatureOutfit`
- `GameServerCreatureSpeed`
- `GameServerCreatureSkull`
- `GameServerCreatureParty`
- `GameServerCreatureUnpass`
- `GameServerCreatureMarks`
- `GameServerPlayerHelpers`
- `GameServerCreatureType`
- `GameServerEditText`
- `GameServerEditList`
- `GameServerNews`
- `GameUnkown154`
- `GameServerBlessDialog`
- `GameServerBlessings`
- `GameServerPreset`
- `GameServerPremiumTrigger`
- `GameServerPlayerDataBasic`
- `GameServerPlayerData`
- `GameServerPlayerSkills`
- `GameServerPlayerState`
- `GameServerClearTarget`
- `GameServerPlayerModes`
- `GameServerSpellDelay`
- `GameServerSpellGroupDelay`
- `GameServerMultiUseDelay`
- `GameServerSetStoreDeepLink`
- `GameServerRestingAreaState`
- `GameServerTalk`
- `GameServerChannels`
- `GameServerOpenChannel`
- `GameServerOpenPrivateChannel`
- `GameServerRuleViolationChannel`
- `GameServerRuleViolationRemove`
- `GameServerRuleViolationCancel`
- `GameServerRuleViolationLock`
- `GameServerOpenOwnChannel`
- `GameServerCloseChannel`
- `GameServerTextMessage`
- `GameServerCancelWalk`
- `GameServerWalkWait`
- `GameServerUnjustifiedStats`
- `GameServerPvpSituations`
- `GameServerHunting`
- `GameServerFloorChangeUp`
- `GameServerFloorChangeDown`
- `GameServerLootContainers`
- `GameServerTournamentLeaderboard`
- `GameServerChooseOutfit`
- `GameServerImpactTracker`
- `GameServerItemsPrices`
- `GameServerSupplyTracker`
- `GameServerLootTracker`
- `GameServerQuestTracker`
- `GameServerKillTracker`
- `GameServerVipAdd`
- `GameServerVipState`
- `GameServerVipLogoutOrGroupData`
- `GameServerCyclopediaNewDetails`
- `GameServerCyclopedia`
- `GameServerTutorialHint`
- `GameServerCyclopediaMapData`
- `GameServerDailyRewardState`
- `GameServerCoinBalance`
- `GameServerStoreError`
- `GameServerRequestPurchaseData`
- `GameServerOpenRewardWall`
- `GameServerDailyReward`
- `GameServerDailyRewardHistory`
- `GameServerPreyFreeRolls`
- `GameServerPreyTimeLeft`
- `GameServerPreyData`
- `GameServerPreyPrices`
- `GameServerStoreOfferDescription`
- `GameServerImbuementWindow`
- `GameServerCloseImbuementWindow`
- `GameServerMessageDialog`
- `GameServerResourceBalance`
- `GameServerTime`
- `GameServerQuestLog`
- `GameServerQuestLine`
- `GameServerCoinBalanceUpdate`
- `GameServerChannelEvent`
- `GameServerItemInfo`
- `GameServerPlayerInventory`
- `GameServerMarketEnter`
- `GameServerMarketLeave`
- `GameServerMarketDetail`
- `GameServerMarketBrowse`
- `GameServerModalDialog`
- `GameServerStore`
- `GameServerStoreOffers`
- `GameServerStoreTransactionHistory`
- `GameServerStoreCompletePurchase`

### `ClientOpcodes`

**Wartości:**

- `ClientEnterAccount`
- `ClientPendingGame`
- `ClientEnterGame`
- `ClientLeaveGame`
- `ClientPing`
- `ClientPingBack`
- `ClientFirstGameOpcode`
- `ClientExtendedOpcode`
- `ClientNewPing`
- `ClientChangeMapAwareRange`
- `ClientNewWalk`
- `ClientProcessesResponse`
- `ClientDllsResponse`
- `ClientWindowsResponse`
- `ClientAutoWalk`
- `ClientWalkNorth`
- `ClientWalkEast`
- `ClientWalkSouth`
- `ClientWalkWest`
- `ClientStop`
- `ClientWalkNorthEast`
- `ClientWalkSouthEast`
- `ClientWalkSouthWest`
- `ClientWalkNorthWest`
- `ClientTurnNorth`
- `ClientTurnEast`
- `ClientTurnSouth`
- `ClientTurnWest`
- `ClientEquipItem`
- `ClientMove`
- `ClientInspectNpcTrade`
- `ClientBuyItem`
- `ClientSellItem`
- `ClientCloseNpcTrade`
- `ClientRequestTrade`
- `ClientInspectTrade`
- `ClientAcceptTrade`
- `ClientRejectTrade`
- `ClientUseItem`
- `ClientUseItemWith`
- `ClientUseOnCreature`
- `ClientRotateItem`
- `ClientCloseContainer`
- `ClientUpContainer`
- `ClientEditText`
- `ClientEditList`
- `ClientWrapableItem`
- `ClientLook`
- `ClientLookCreature`
- `ClientTalk`
- `ClientRequestChannels`
- `ClientJoinChannel`
- `ClientLeaveChannel`
- `ClientOpenPrivateChannel`
- `ClientOpenRuleViolation`
- `ClientCloseRuleViolation`
- `ClientCancelRuleViolation`
- `ClientCloseNpcChannel`
- `ClientChangeFightModes`
- `ClientAttack`
- `ClientFollow`
- `ClientInviteToParty`
- `ClientJoinParty`
- `ClientRevokeInvitation`
- `ClientPassLeadership`
- `ClientLeaveParty`
- `ClientShareExperience`
- `ClientDisbandParty`
- `ClientOpenOwnChannel`
- `ClientInviteToOwnChannel`
- `ClientExcludeFromOwnChannel`
- `ClientCancelAttackAndFollow`
- `ClientUpdateTile`
- `ClientRefreshContainer`
- `ClientBrowseField`
- `ClientSeekInContainer`
- `ClientRequestOutfit`
- `ClientChangeOutfit`
- `ClientMount`
- `ApplyImbuemente`
- `ClearingImbuement`
- `CloseImbuingWindow`
- `ClientAddVip`
- `ClientRemoveVip`
- `ClientEditVip`
- `ClientBugReport`
- `ClientRuleViolation`
- `ClientDebugReport`
- `ClientPreyAction`
- `ClientPreyRequest`
- `ClientTransferCoins`
- `ClientRequestQuestLog`
- `ClientRequestQuestLine`
- `ClientNewRuleViolation`
- `ClientRequestItemInfo`
- `ClientMarketLeave`
- `ClientMarketBrowse`
- `ClientMarketCreate`
- `ClientMarketCancel`
- `ClientMarketAccept`
- `ClientAnswerModalDialog`
- `ClientOpenStore`
- `ClientRequestStoreOffers`
- `ClientBuyStoreOffer`
- `ClientOpenTransactionHistory`
- `ClientRequestTransactionHistory`

### `CreatureType`

**Wartości:**

- `CreatureTypePlayer`
- `CreatureTypeMonster`
- `CreatureTypeNpc`
- `CreatureTypeSummonOwn`
- `CreatureTypeSummonOther`
- `CreatureTypeUnknown`

### `CreaturesIdRange`

**Wartości:**

- `PlayerStartId`
- `PlayerEndId`
- `MonsterStartId`
- `MonsterEndId`
- `NpcStartId`
- `NpcEndId`

## Functions

### `buildMessageModesMap`

**Sygnatura:** `void buildMessageModesMap(int version)`

### `translateMessageModeFromServer`

**Sygnatura:** `Otc::MessageMode translateMessageModeFromServer(uint8 mode)`

### `translateMessageModeToServer`

**Sygnatura:** `uint8 translateMessageModeToServer(Otc::MessageMode mode)`

---
doc_id: "cpp-api-bbf7ca4c8b95"
source_path: "client/const.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: const.h"
summary: "Dokumentacja API C++ dla client/const.h"
tags: ["cpp", "api", "otclient"]
---

# client/const.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu const.

## Namespaces

### `Otc`

## Enums

### `DepthConst`

**Wartości:**

- `MAX_DEPTH`

### `DrawFlags`

**Wartości:**

- `DrawGround`
- `DrawGroundBorders`
- `DrawOnBottom`
- `DrawOnTop`
- `DrawItems`
- `DrawCreatures`
- `DrawEffects`
- `DrawMissiles`
- `DrawCreaturesInformation`
- `DrawStaticTexts`
- `DrawAnimatedTexts`
- `DrawAnimations`
- `DrawBars`
- `DrawNames`
- `DrawLights`
- `DrawManaBar`
- `DontDrawLocalPlayer`
- `DrawIcons`
- `DrawWalls`
- `DrawEverything`
- `DrawCreatures`
- `DrawStaticTexts`
- `DrawLights`

### `DatOpts`

**Wartości:**

- `DatGround`
- `DatGroundClip`
- `DatOnBottom`
- `DatOnTop`
- `DatContainer`
- `DatStackable`
- `DatForceUse`
- `DatMultiUse`
- `DatWritable`
- `DatWritableOnce`
- `DatFluidContainer`
- `DatSplash`
- `DatBlockWalk`
- `DatNotMoveable`
- `DatBlockProjectile`
- `DatBlockPathFind`
- `DatPickupable`
- `DatHangable`
- `DatHookSouth`
- `DatHookEast`
- `DatRotable`
- `DatLight`
- `DatDontHide`
- `DatTranslucent`
- `DatDisplacement`
- `DatElevation`
- `DatLyingCorpse`
- `DatAnimateAlways`
- `DatMinimapColor`
- `DatLensHelp`
- `DatFullGround`
- `DatIgnoreLook`
- `DatCloth`
- `DatAnimation`
- `DatLastOpt`

### `InventorySlot`

**Wartości:**

- `InventorySlotHead`
- `InventorySlotNecklace`
- `InventorySlotBackpack`
- `InventorySlotArmor`
- `InventorySlotRight`
- `InventorySlotLeft`
- `InventorySlotLegs`
- `InventorySlotFeet`
- `InventorySlotRing`
- `InventorySlotAmmo`
- `InventorySlotPurse`
- `InventorySlotExt1`
- `InventorySlotExt2`
- `InventorySlotExt3`
- `InventorySlotExt4`
- `LastInventorySlot`

### `Statistic`

**Wartości:**

- `Health`
- `MaxHealth`
- `FreeCapacity`
- `Experience`
- `Level`
- `LevelPercent`
- `Mana`
- `MaxMana`
- `MagicLevel`
- `MagicLevelPercent`
- `Soul`
- `Stamina`
- `LastStatistic`

### `Skill`

**Wartości:**

- `Fist`
- `Club`
- `Sword`
- `Axe`
- `Distance`
- `Shielding`
- `Fishing`
- `CriticalChance`
- `CriticalDamage`
- `LifeLeechChance`
- `LifeLeechAmount`
- `ManaLeechChance`
- `ManaLeechAmount`
- `LastSkill`

### `Direction`

**Wartości:**

- `North`
- `East`
- `South`
- `West`
- `NorthEast`
- `SouthEast`
- `SouthWest`
- `NorthWest`
- `InvalidDirection`

### `FluidsColor`

**Wartości:**

- `FluidTransparent`
- `FluidBlue`
- `FluidRed`
- `FluidBrown`
- `FluidGreen`
- `FluidYellow`
- `FluidWhite`
- `FluidPurple`

### `FluidsType`

**Wartości:**

- `FluidNone`
- `FluidWater`
- `FluidMana`
- `FluidBeer`
- `FluidOil`
- `FluidBlood`
- `FluidSlime`
- `FluidMud`
- `FluidLemonade`
- `FluidMilk`
- `FluidWine`
- `FluidHealth`
- `FluidUrine`
- `FluidRum`
- `FluidFruidJuice`
- `FluidCoconutMilk`
- `FluidTea`
- `FluidMead`

### `FightModes`

**Wartości:**

- `FightOffensive`
- `FightBalanced`
- `FightDefensive`

### `ChaseModes`

**Wartości:**

- `DontChase`
- `ChaseOpponent`

### `PVPModes`

**Wartości:**

- `WhiteDove`
- `WhiteHand`
- `YellowHand`
- `RedFist`

### `PlayerSkulls`

**Wartości:**

- `SkullNone`
- `SkullYellow`
- `SkullGreen`
- `SkullWhite`
- `SkullRed`
- `SkullBlack`
- `SkullOrange`

### `PlayerShields`

**Wartości:**

- `ShieldNone`
- `ShieldWhiteYellow`
- `ShieldWhiteBlue`
- `ShieldBlue`
- `ShieldYellow`
- `ShieldBlueSharedExp`
- `ShieldYellowSharedExp`
- `ShieldBlueNoSharedExpBlink`
- `ShieldYellowNoSharedExpBlink`
- `ShieldBlueNoSharedExp`
- `ShieldYellowNoSharedExp`
- `ShieldGray`

### `PlayerEmblems`

**Wartości:**

- `EmblemNone`
- `EmblemGreen`
- `EmblemRed`
- `EmblemBlue`
- `EmblemMember`
- `EmblemOther`

### `CreatureIcons`

**Wartości:**

- `NpcIconNone`
- `NpcIconChat`
- `NpcIconTrade`
- `NpcIconQuest`
- `NpcIconTradeQuest`

### `PlayerStates`

**Wartości:**

- `IconNone`
- `IconPoison`
- `IconBurn`
- `IconEnergy`
- `IconDrunk`
- `IconManaShield`
- `IconParalyze`
- `IconHaste`
- `IconSwords`
- `IconDrowning`
- `IconFreezing`
- `IconDazzled`
- `IconCursed`
- `IconPartyBuff`
- `IconPzBlock`
- `IconPz`
- `IconBleeding`
- `IconHungry`

### `MessageMode`

**Wartości:**

- `MessageNone`
- `MessageSay`
- `MessageWhisper`
- `MessageYell`
- `MessagePrivateFrom`
- `MessagePrivateTo`
- `MessageChannelManagement`
- `MessageChannel`
- `MessageChannelHighlight`
- `MessageSpell`
- `MessageNpcFrom`
- `MessageNpcTo`
- `MessageGamemasterBroadcast`
- `MessageGamemasterChannel`
- `MessageGamemasterPrivateFrom`
- `MessageGamemasterPrivateTo`
- `MessageLogin`
- `MessageWarning`
- `MessageGame`
- `MessageFailure`
- `MessageLook`
- `MessageDamageDealed`
- `MessageDamageReceived`
- `MessageHeal`
- `MessageExp`
- `MessageDamageOthers`
- `MessageHealOthers`
- `MessageExpOthers`
- `MessageStatus`
- `MessageLoot`
- `MessageTradeNpc`
- `MessageGuild`
- `MessagePartyManagement`
- `MessageParty`
- `MessageBarkLow`
- `MessageBarkLoud`
- `MessageReport`
- `MessageHotkeyUse`
- `MessageTutorialHint`
- `MessageThankyou`
- `MessageMarket`
- `MessageMana`
- `MessageBeyondLast`
- `MessageMonsterYell`
- `MessageMonsterSay`
- `MessageRed`
- `MessageBlue`
- `MessageRVRChannel`
- `MessageRVRAnswer`
- `MessageRVRContinue`
- `MessageGameHighlight`
- `MessageNpcFromStartBlock`
- `LastMessage`
- `MessageInvalid`

### `GameFeature`

**Wartości:**

- `GameProtocolChecksum`
- `GameAccountNames`
- `GameChallengeOnLogin`
- `GamePenalityOnDeath`
- `GameNameOnNpcTrade`
- `GameDoubleFreeCapacity`
- `GameDoubleExperience`
- `GameTotalCapacity`
- `GameSkillsBase`
- `GamePlayerRegenerationTime`
- `GameChannelPlayerList`
- `GamePlayerMounts`
- `GameEnvironmentEffect`
- `GameCreatureEmblems`
- `GameItemAnimationPhase`
- `GameMagicEffectU16`
- `GamePlayerMarket`
- `GameSpritesU32`
- `GameTileAddThingWithStackpos`
- `GameOfflineTrainingTime`
- `GamePurseSlot`
- `GameFormatCreatureName`
- `GameSpellList`
- `GameClientPing`
- `GameExtendedClientPing`
- `GameDoubleHealth`
- `GameDoubleSkills`
- `GameChangeMapAwareRange`
- `GameMapMovePosition`
- `GameAttackSeq`
- `GameBlueNpcNameColor`
- `GameDiagonalAnimatedText`
- `GameLoginPending`
- `GameNewSpeedLaw`
- `GameForceFirstAutoWalkStep`
- `GameMinimapRemove`
- `GameDoubleShopSellAmount`
- `GameContainerPagination`
- `GameThingMarks`
- `GameLooktypeU16`
- `GamePlayerStamina`
- `GamePlayerAddons`
- `GameMessageStatements`
- `GameMessageLevel`
- `GameNewFluids`
- `GamePlayerStateU16`
- `GameNewOutfitProtocol`
- `GamePVPMode`
- `GameWritableDate`
- `GameAdditionalVipInfo`
- `GameBaseSkillU16`
- `GameCreatureIcons`
- `GameHideNpcNames`
- `GameSpritesAlphaChannel`
- `GamePremiumExpiration`
- `GameBrowseField`
- `GameEnhancedAnimations`
- `GameOGLInformation`
- `GameMessageSizeCheck`
- `GamePreviewState`
- `GameLoginPacketEncryption`
- `GameClientVersion`
- `GameContentRevision`
- `GameExperienceBonus`
- `GameAuthenticator`
- `GameUnjustifiedPoints`
- `GameSessionKey`
- `GameDeathType`
- `GameIdleAnimations`
- `GameKeepUnawareTiles`
- `GameIngameStore`
- `GameIngameStoreHighlights`
- `GameIngameStoreServiceType`
- `GameAdditionalSkills`
- `GameDistanceEffectU16`
- `GamePrey`
- `GameDoubleMagicLevel`
- `GameExtendedOpcode`
- `GameMinimapLimitedToSingleFloor`
- `GameSendWorldName`
- `GameDoubleLevel`
- `GameDoubleSoul`
- `GameDoublePlayerGoodsMoney`
- `GameCreatureWalkthrough`
- `GameDoubleTradeMoney`
- `GameSequencedPackets`
- `GameTibia12Protocol`
- `GameNewWalking`
- `GameSlowerManualWalking`
- `GameItemTooltip`
- `GameBot`
- `GameBiggerMapCache`
- `GameForceLight`
- `GameNoDebug`
- `GameBotProtection`
- `GameCreatureDirectionPassable`
- `GameFasterAnimations`
- `GameCenteredOutfits`
- `GameSendIdentifiers`
- `GameWingsAndAura`
- `GamePlayerStateU32`
- `GameOutfitShaders`
- `GameForceAllowItemHotkeys`
- `GameCountU16`
- `GameDrawAuraOnTop`
- `GamePacketSizeU32`
- `GamePacketCompression`
- `GameOldInformationBar`
- `GameHealthInfoBackground`
- `GameWingOffset`
- `GameAuraFrontAndBack`
- `GameMapDrawGroundFirst`
- `GameMapIgnoreCorpseCorrection`
- `GameDontCacheFiles`
- `GameBigAurasCenter`
- `GameNewUpdateWalk`
- `GameNewCreatureStacking`
- `GameCreaturesMana`
- `GameQuickLootFlags`
- `GameDontMergeAnimatedText`
- `GameMissionId`
- `GameItemCustomAttributes`
- `GameAnimatedTextCustomFont`
- `LastGameFeature`

### `PathFindResult`

**Wartości:**

- `PathFindResultOk`
- `PathFindResultSamePosition`
- `PathFindResultImpossible`
- `PathFindResultTooFar`
- `PathFindResultNoWay`

### `PathFindFlags`

**Wartości:**

- `PathFindAllowNotSeenTiles`
- `PathFindAllowCreatures`
- `PathFindAllowNonPathable`
- `PathFindAllowNonWalkable`
- `PathFindIgnoreCreatures`

### `AutomapFlags`

**Wartości:**

- `MapMarkTick`
- `MapMarkQuestion`
- `MapMarkExclamation`
- `MapMarkStar`
- `MapMarkCross`
- `MapMarkTemple`
- `MapMarkKiss`
- `MapMarkShovel`
- `MapMarkSword`
- `MapMarkFlag`
- `MapMarkLock`
- `MapMarkBag`
- `MapMarkSkull`
- `MapMarkDollar`
- `MapMarkRedNorth`
- `MapMarkRedSouth`
- `MapMarkRedEast`
- `MapMarkRedWest`
- `MapMarkGreenNorth`
- `MapMarkGreenSouth`

### `VipState`

**Wartości:**

- `VipStateOffline`
- `VipStateOnline`
- `VipStatePending`

### `SpeedFormula`

**Wartości:**

- `SpeedFormulaA`
- `SpeedFormulaB`
- `SpeedFormulaC`
- `LastSpeedFormula`

### `Blessings`

**Wartości:**

- `BlessingNone`
- `BlessingAdventurer`
- `BlessingSpiritualShielding`
- `BlessingEmbraceOfTibia`
- `BlessingFireOfSuns`
- `BlessingWisdomOfSolitude`
- `BlessingSparkOfPhoenix`

### `DeathType`

**Wartości:**

- `DeathRegular`
- `DeathBlessed`

### `StoreProductTypes`

**Wartości:**

- `ProductTypeOther`
- `ProductTypeNameChange`

### `StoreErrorTypes`

**Wartości:**

- `StoreNoError`
- `StorePurchaseError`
- `StoreNetworkError`
- `StoreHistoryError`
- `StoreTransferError`
- `StoreInformation`

### `StoreStates`

**Wartości:**

- `StateNone`
- `StateNew`
- `StateSale`
- `StateTimed`

### `PreySlotNum_t`

**Wartości:**

- `PREY_SLOTNUM_FIRST`
- `PREY_SLOTNUM_SECOND`
- `PREY_SLOTNUM_THIRD`
- `PREY_SLOTNUM_LAST`

### `PreyState_t`

**Wartości:**

- `PREY_STATE_LOCKED`
- `PREY_STATE_INACTIVE`
- `PREY_STATE_ACTIVE`
- `PREY_STATE_SELECTION`
- `PREY_STATE_SELECTION_CHANGE_MONSTER`
- `PREY_STATE_SELECTION_FROMALL`
- `PREY_STATE_CHANGE_FROMALL`

### `PreyMessageDialog_t`

**Wartości:**

- `PREY_MESSAGEDIALOG_PREY_MESSAGE`
- `PREY_MESSAGEDIALOG_PREY_ERROR`

### `PreyResourceType_t`

**Wartości:**

- `PREY_RESOURCETYPE_BANK_GOLD`
- `PREY_RESOURCETYPE_INVENTORY_GOLD`
- `PREY_RESOURCETYPE_PREY_BONUS_REROLLS`

### `PreyBonusType_t`

**Wartości:**

- `PREY_BONUS_DAMAGE_BOOST`
- `PREY_BONUS_DAMAGE_REDUCTION`
- `PREY_BONUS_XP_BONUS`
- `PREY_BONUS_IMPROVED_LOOT`
- `PREY_BONUS_NONE`
- `PREY_BONUS_FIRST`
- `PREY_BONUS_LAST`

### `PreyAction_t`

**Wartości:**

- `PREY_ACTION_LISTREROLL`
- `PREY_ACTION_BONUSREROLL`
- `PREY_ACTION_MONSTERSELECTION`
- `PREY_ACTION_REQUEST_ALL_MONSTERS`
- `PREY_ACTION_CHANGE_FROM_ALL`
- `PREY_ACTION_LOCK_PREY`

### `PreyConfigState`

**Wartości:**

- `PREY_CONFIG_STATE_FREE`
- `PREY_CONFIG_STATE_PREMIUM`
- `PREY_CONFIG_STATE_TIBIACOINS`

### `PreyUnlockState_t`

**Wartości:**

- `PREY_UNLOCK_STORE_AND_PREMIUM`
- `PREY_UNLOCK_STORE`
- `PREY_UNLOCK_NONE`

### `MagicEffectsType_t`

**Wartości:**

- `MAGIC_EFFECTS_END_LOOP`
- `MAGIC_EFFECTS_DELTA`
- `MAGIC_EFFECTS_DELAY`
- `MAGIC_EFFECTS_CREATE_EFFECT`
- `MAGIC_EFFECTS_CREATE_DISTANCEEFFECT`
- `MAGIC_EFFECTS_CREATE_DISTANCEEFFECT_REVERSED`

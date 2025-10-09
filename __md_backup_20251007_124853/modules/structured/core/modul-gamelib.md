# ¦ Modul: `gamelib`

```lua

-- @docconsts @{

FloorHigher = 0

FloorLower = 15

SkullNone = 0

SkullYellow = 1

SkullGreen = 2

SkullWhite = 3

SkullRed = 4

SkullBlack = 5

SkullOrange = 6

ShieldNone = 0

ShieldWhiteYellow = 1

ShieldWhiteBlue = 2

ShieldBlue = 3

ShieldYellow = 4

ShieldBlueSharedExp = 5

ShieldYellowSharedExp = 6

ShieldBlueNoSharedExpBlink = 7

ShieldYellowNoSharedExpBlink = 8

ShieldBlueNoSharedExp = 9

ShieldYellowNoSharedExp = 10

ShieldGray = 11

EmblemNone = 0

EmblemGreen = 1

EmblemRed = 2

EmblemBlue = 3

EmblemMember = 4

EmblemOther = 5

VipIconFirst = 0

VipIconLast = 10

Directions = {

  North = 0,

  East = 1,

  South = 2,

  West = 3,

  NorthEast = 4,

  SouthEast = 5,

  SouthWest = 6,

  NorthWest = 7

}

Skill = {

  Fist = 0,

  Club = 1,

  Sword = 2,

  Axe = 3,

  Distance = 4,

  Shielding = 5,

  Fishing = 6,

  CriticalChance = 7,

  CriticalDamage = 8,

  LifeLeechChance = 9,

  LifeLeechAmount = 10,

  ManaLeechChance = 11,

  ManaLeechAmount = 12

}

North = Directions.North

East = Directions.East

South = Directions.South

West = Directions.West

NorthEast = Directions.NorthEast

SouthEast = Directions.SouthEast

SouthWest = Directions.SouthWest

NorthWest = Directions.NorthWest

FightOffensive = 1

FightBalanced = 2

FightDefensive = 3

DontChase = 0

ChaseOpponent = 1

PVPWhiteDove = 0

PVPWhiteHand = 1

PVPYellowHand = 2

PVPRedFist = 3

GameProtocolChecksum = 1

GameAccountNames = 2

GameChallengeOnLogin = 3

GamePenalityOnDeath = 4

GameNameOnNpcTrade = 5

GameDoubleFreeCapacity = 6

GameDoubleExperience = 7

GameTotalCapacity = 8

GameSkillsBase = 9

GamePlayerRegenerationTime = 10

GameChannelPlayerList = 11

GamePlayerMounts = 12

GameEnvironmentEffect = 13

GameCreatureEmblems = 14

GameItemAnimationPhase = 15

GameMagicEffectU16 = 16

GamePlayerMarket = 17

GameSpritesU32 = 18

GameTileAddThingWithStackpos = 19

GameOfflineTrainingTime = 20

GamePurseSlot = 21

GameFormatCreatureName = 22

GameSpellList = 23

GameClientPing = 24

GameExtendedClientPing = 25

GameDoubleHealth = 28

GameDoubleSkills = 29

GameChangeMapAwareRange = 30

GameMapMovePosition = 31

GameAttackSeq = 32

GameBlueNpcNameColor = 33

GameDiagonalAnimatedText = 34

GameLoginPending = 35

GameNewSpeedLaw = 36

GameForceFirstAutoWalkStep = 37

GameMinimapRemove = 38

GameDoubleShopSellAmount = 39

GameContainerPagination = 40

GameThingMarks = 41

GameLooktypeU16 = 42

GamePlayerStamina = 43

GamePlayerAddons = 44

GameMessageStatements = 45

GameMessageLevel = 46

GameNewFluids = 47

GamePlayerStateU16 = 48

GameNewOutfitProtocol = 49

GamePVPMode = 50

GameWritableDate = 51

GameAdditionalVipInfo = 52

GameBaseSkillU16 = 53

GameCreatureIcons = 54

GameHideNpcNames = 55

GameSpritesAlphaChannel = 56

GamePremiumExpiration = 57

GameBrowseField = 58

GameEnhancedAnimations = 59

GameOGLInformation = 60

GameMessageSizeCheck = 61

GamePreviewState = 62

GameLoginPacketEncryption = 63

GameClientVersion = 64

GameContentRevision = 65

GameExperienceBonus = 66

GameAuthenticator = 67

GameUnjustifiedPoints = 68

GameSessionKey = 69

GameDeathType = 70

GameIdleAnimations = 71

GameKeepUnawareTiles = 72

GameIngameStore = 73

GameIngameStoreHighlights = 74

GameIngameStoreServiceType = 75

GameAdditionalSkills = 76

GameDistanceEffectU16 = 77

GamePrey = 78

GameDoubleMagicLevel = 79

GameExtendedOpcode = 80

GameMinimapLimitedToSingleFloor = 81

GameSendWorldName = 82

GameDoubleLevel = 83

GameDoubleSoul = 84

GameDoublePlayerGoodsMoney = 85

GameCreatureWalkthrough = 86 -- add Walkthrough for versions less than 854, unpass = msg->getU8(); in protocolgameparse.cpp

GameDoubleTradeMoney = 87

GameSequencedPackets = 88

GameTibia12Protocol = 89

GameNewWalking = 90

GameSlowerManualWalking = 91

GameItemTooltip = 93

GameBot = 95

GameBiggerMapCache = 96

GameForceLight = 97

GameNoDebug = 98

GameBotProtection = 99

GameCreatureDirectionPassable = 100

GameFasterAnimations = 101

GameCenteredOutfits = 102

GameSendIdentifiers = 103

GameWingsAndAura = 104

GamePlayerStateU32 = 105

GameOutfitShaders = 106

GameForceAllowItemHotkeys = 107

GameCountU16 = 108

GameDrawAuraOnTop = 109

GamePacketSizeU32 = 110

GamePacketCompression = 111

GameOldInformationBar = 112

GameHealthInfoBackground = 113

GameWingOffset = 114

GameAuraFrontAndBack = 115 -- To use that: First layer is bottom/back, second (blend layer) is top/front

GameMapDrawGroundFirst = 116 -- useful for big auras & wings

GameMapIgnoreCorpseCorrection = 117

GameDontCacheFiles = 118 -- doesn't work with encryption and compression

GameBigAurasCenter = 119 -- Automatic negative offset for aura bigger than 32x32

GameNewUpdateWalk = 120 -- Walk update rate dependant on FPS

GameNewCreatureStacking = 121 -- Ignore MAX_THINGS limit while adding to tile

GameCreaturesMana = 122 -- get mana from server for creatures other than Player

GameQuickLootFlags = 123 -- enables quick loot feature for all protocols

GameDontMergeAnimatedText = 124

GameMissionId = 125

GameItemCustomAttributes = 126

GameAnimatedTextCustomFont = 127

LastGameFeature = 130

TextColors = {

  red       = '#f55e5e', --'#c83200'

  orange    = '#f36500', --'#c87832'

  yellow    = '#ffff00', --'#e6c832'

  green     = '#00EB00', --'#3fbe32'

  lightblue = '#5ff7f7',

  blue      = '#9f9dfd',

  --blue1     = '#6e50dc',

  --blue2     = '#3264c8',

  --blue3     = '#0096c8',

  white     = '#ffffff', --'#bebebe'

}

MessageModes = {

  None                    = 0,

  Say                     = 1,

  Whisper                 = 2,

  Yell                    = 3,

  PrivateFrom             = 4,

  PrivateTo               = 5,

  ChannelManagement       = 6,

  Channel                 = 7,

  ChannelHighlight        = 8,

  Spell                   = 9,

  NpcFrom                 = 10,

  NpcTo                   = 11,

  GamemasterBroadcast     = 12,

  GamemasterChannel       = 13,

  GamemasterPrivateFrom   = 14,

  GamemasterPrivateTo     = 15,

  Login                   = 16,

  Warning                 = 17,

  Game                    = 18,

  Failure                 = 19,

  Look                    = 20,

  DamageDealed            = 21,

  DamageReceived          = 22,

  Heal                    = 23,

  Exp                     = 24,

  DamageOthers            = 25,

  HealOthers              = 26,

  ExpOthers               = 27,

  Status                  = 28,

  Loot                    = 29,

  TradeNpc                = 30,

  Guild                   = 31,

  PartyManagement         = 32,

  Party                   = 33,

  BarkLow                 = 34,

  BarkLoud                = 35,

  Report                  = 36,

  HotkeyUse               = 37,

  TutorialHint            = 38,

  Thankyou                = 39,

  Market                  = 40,

  Mana                    = 41,

  BeyondLast              = 42,

  MonsterYell             = 43,

  MonsterSay              = 44,

  Red                     = 45,

  Blue                    = 46,

  RVRChannel              = 47,

  RVRAnswer               = 48,

  RVRContinue             = 49,

  GameHighlight           = 50,

  NpcFromStartBlock       = 51,

  Last                    = 52,

  Invalid                 = 255,

}

OTSERV_RSA  = "1091201329673994292788609605089955415282375029027981291234687579" ..

              "3726629149257644633073969600111060390723088861007265581882535850" ..

              "3429057592827629436413108566029093628212635953836686562675849720" ..

              "6207862794310902180176810615217550567108238764764442605581471797" ..

              "07119674283982419152118103759076030616683978566631413"

CIPSOFT_RSA = "1321277432058722840622950990822933849527763264961655079678763618" ..

              "4334395343554449668205332383339435179772895415509701210392836078" ..

              "6959821132214473291575712138800495033169914814069637740318278150" ..

              "2907336840325241747827401343576296990629870233111328210165697754" ..

              "88792221429527047321331896351555606801473202394175817"

-- set to the latest Tibia.pic signature to make otclient compatible with official tibia

PIC_SIGNATURE = 0x56C5DDE7

OsTypes = {

  Linux = 1,

  Windows = 2,

  Flash = 3,

  OtclientLinux = 10,

  OtclientWindows = 11,

  OtclientMac = 12,

}

PathFindResults = {

  Ok = 0,

  Position = 1,

  Impossible = 2,

  TooFar = 3,

  NoWay = 4,

}

PathFindFlags = {

  AllowNullTiles = 1,

  AllowCreatures = 2,

  AllowNonPathable = 4,

  AllowNonWalkable = 8,

}

VipState = {

  Offline = 0,

  Online = 1,

  Pending = 2,

}

ExtendedIds = {

  Activate = 0,

  Locale = 1,

  Ping = 2,

  Sound = 3,

  Game = 4,

  Particles = 5,

  MapShader = 6,

  NeedsUpdate = 7

}

PreviewState = {

  Default = 0,

  Inactive = 1,

  Active = 2

}

Blessings = {

  None = 0,

  Adventurer = 1,

  SpiritualShielding = 2,

  EmbraceOfTibia = 4,

  FireOfSuns = 8,

  WisdomOfSolitude = 16,

  SparkOfPhoenix = 32

}

DeathType = {

  Regular = 0,

  Blessed = 1

}

ProductType = {

  Other = 0,

  NameChange = 1

}

StoreErrorType = {

  NoError = -1,

  PurchaseError = 0,

  NetworkError = 1,

  HistoryError = 2,

  TransferError = 3,

  Information = 4

}

StoreState = {

  None = 0,

  New = 1,

  Sale = 2,

  Timed = 3

}

AccountStatus = {

  Ok = 0,

  Frozen = 1,

  Suspended = 2,

}

SubscriptionStatus = {

  Free = 0,

  Premium = 1,

}

ChannelEvent = {

  Join = 0,

  Leave = 1,

  Invite = 2,

  Exclude = 3,

}

-- @}

```

---
# creature.lua

```lua

-- @docclass Creature

-- @docconsts @{

SkullNone = 0

SkullYellow = 1

SkullGreen = 2

SkullWhite = 3

SkullRed = 4

SkullBlack = 5

SkullOrange = 6

ShieldNone = 0

ShieldWhiteYellow = 1

ShieldWhiteBlue = 2

ShieldBlue = 3

ShieldYellow = 4

ShieldBlueSharedExp = 5

ShieldYellowSharedExp = 6

ShieldBlueNoSharedExpBlink = 7

ShieldYellowNoSharedExpBlink = 8

ShieldBlueNoSharedExp = 9

ShieldYellowNoSharedExp = 10

EmblemNone = 0

EmblemGreen = 1

EmblemRed = 2

EmblemBlue = 3

NpcIconNone = 0

NpcIconChat = 1

NpcIconTrade = 2

NpcIconQuest = 3

NpcIconTradeQuest = 4

CreatureTypePlayer = 0

CreatureTypeMonster = 1

CreatureTypeNpc = 2

CreatureTypeSummonOwn = 3

CreatureTypeSummonOther = 4

-- @}

function getNextSkullId(skullId)

  if skullId == SkullRed or skullId == SkullBlack then

    return SkullBlack

  end

  return SkullRed

end

function getSkullImagePath(skullId)

  local path

  if skullId == SkullYellow then

    path = '/images/game/skulls/skull_yellow'

  elseif skullId == SkullGreen then

    path = '/images/game/skulls/skull_green'

  elseif skullId == SkullWhite then

    path = '/images/game/skulls/skull_white'

  elseif skullId == SkullRed then

    path = '/images/game/skulls/skull_red'

  elseif skullId == SkullBlack then

    path = '/images/game/skulls/skull_black'

  elseif skullId == SkullOrange then

    path = '/images/game/skulls/skull_orange'

  end

  return path

end

function getShieldImagePathAndBlink(shieldId)

  local path, blink

  if shieldId == ShieldWhiteYellow then

    path, blink = '/images/game/shields/shield_yellow_white', false

  elseif shieldId == ShieldWhiteBlue then

    path, blink = '/images/game/shields/shield_blue_white', false

  elseif shieldId == ShieldBlue then

    path, blink = '/images/game/shields/shield_blue', false

  elseif shieldId == ShieldYellow then

    path, blink = '/images/game/shields/shield_yellow', false

  elseif shieldId == ShieldBlueSharedExp then

    path, blink = '/images/game/shields/shield_blue_shared', false

  elseif shieldId == ShieldYellowSharedExp then

    path, blink = '/images/game/shields/shield_yellow_shared', false

  elseif shieldId == ShieldBlueNoSharedExpBlink then

    path, blink = '/images/game/shields/shield_blue_not_shared', true

  elseif shieldId == ShieldYellowNoSharedExpBlink then

    path, blink = '/images/game/shields/shield_yellow_not_shared', true

  elseif shieldId == ShieldBlueNoSharedExp then

    path, blink = '/images/game/shields/shield_blue_not_shared', false

  elseif shieldId == ShieldYellowNoSharedExp then

    path, blink = '/images/game/shields/shield_yellow_not_shared', false

  elseif shieldId == ShieldGray then

    path, blink = '/images/game/shields/shield_gray', false

  end

  return path, blink

end

function getEmblemImagePath(emblemId)

  local path

  if emblemId == EmblemGreen then

    path = '/images/game/emblems/emblem_green'

  elseif emblemId == EmblemRed then

    path = '/images/game/emblems/emblem_red'

  elseif emblemId == EmblemBlue then

    path = '/images/game/emblems/emblem_blue'

  elseif emblemId == EmblemMember then

    path = '/images/game/emblems/emblem_member'

  elseif emblemId == EmblemOther then

    path = '/images/game/emblems/emblem_other'

  end

  return path

end

function getTypeImagePath(creatureType)

  local path

  if creatureType == CreatureTypeSummonOwn then

    path = '/images/game/creaturetype/summon_own'

  elseif creatureType == CreatureTypeSummonOther then

    path = '/images/game/creaturetype/summon_other'

  end

  return path

end

function getIconImagePath(iconId)

  local path

  if iconId == NpcIconChat then

    path = '/images/game/npcicons/icon_chat'

  elseif iconId == NpcIconTrade then

    path = '/images/game/npcicons/icon_trade'

  elseif iconId == NpcIconQuest then

    path = '/images/game/npcicons/icon_quest'

  elseif iconId == NpcIconTradeQuest then

    path = '/images/game/npcicons/icon_tradequest'

  end

  return path

end

function Creature:onSkullChange(skullId)

  local imagePath = getSkullImagePath(skullId)

  if imagePath then

    self:setSkullTexture(imagePath)

  end

end

function Creature:onShieldChange(shieldId)

  local imagePath, blink = getShieldImagePathAndBlink(shieldId)

  if imagePath then

    self:setShieldTexture(imagePath, blink)

  end

end

function Creature:onEmblemChange(emblemId)

  local imagePath = getEmblemImagePath(emblemId)

  if imagePath then

    self:setEmblemTexture(imagePath)

  end

end

function Creature:onTypeChange(typeId)

  local imagePath = getTypeImagePath(typeId)

  if imagePath then

    self:setTypeTexture(imagePath)

  end

end

function Creature:onIconChange(iconId)

  local imagePath = getIconImagePath(iconId)

  if imagePath then

    self:setIconTexture(imagePath)

  end

end

function Creature:setOutfitShader(shader)

  local outfit = self:getOutfit()

  outfit.shader = shader

  self:setOutfit(outfit)

end

```

---
# game.lua

```lua

function g_game.getRsa()

  return G.currentRsa

end

function g_game.findPlayerItem(itemId, subType)

    local localPlayer = g_game.getLocalPlayer()

    if localPlayer then

        for slot = InventorySlotFirst, InventorySlotLast do

            local item = localPlayer:getInventoryItem(slot)

            if item and item:getId() == itemId and (subType == -1 or item:getSubType() == subType) then

                return item

            end

        end

    end

    return g_game.findItemInContainers(itemId, subType)

end

function g_game.chooseRsa(host)

  if G.currentRsa ~= CIPSOFT_RSA and G.currentRsa ~= OTSERV_RSA then return end

  if host:ends('.tibia.com') or host:ends('.cipsoft.com') then

    g_game.setRsa(CIPSOFT_RSA)

    if g_app.getOs() == 'windows' then

      g_game.setCustomOs(OsTypes.Windows)

    else

      g_game.setCustomOs(OsTypes.Linux)

    end

  else

    if G.currentRsa == CIPSOFT_RSA then

      g_game.setCustomOs(-1)

    end

    g_game.setRsa(OTSERV_RSA)

  end

  -- Hack fix to resolve some 760 login issues

  if g_game.getClientVersion() <= 760 then

    g_game.setCustomOs(2)

  end

end

function g_game.setRsa(rsa, e)

  e = e or '65537'

  g_crypt.rsaSetPublicKey(rsa, e)

  G.currentRsa = rsa

end

function g_game.isOfficialTibia()

  return G.currentRsa == CIPSOFT_RSA

end

function g_game.getSupportedClients()

  return {

    740, 741, 750, 760, 770, 772,

    780, 781, 782, 790, 792,

    800, 810, 811, 820, 821, 822,

    830, 831, 840, 842, 850, 853,

    854, 855, 857, 860, 861, 862,

    870, 871,

    900, 910, 920, 931, 940, 943,

    944, 951, 952, 953, 954, 960,

    961, 963, 970, 971, 972, 973,

    980, 981, 982, 983, 984, 985,

    986,

    1000, 1001, 1002, 1010, 1011,

    1012, 1013, 1020, 1021, 1022,

    1030, 1031, 1032, 1033, 1034,

    1035, 1036, 1037, 1038, 1039,

    1040, 1041, 1050, 1051, 1052,

    1053, 1054, 1055, 1056, 1057,

    1058, 1059, 1060, 1061, 1062,

    1063, 1064, 1070, 1071, 1072,

    1073, 1074, 1075, 1076, 1080,

    1081, 1082, 1090, 1091, 1092,

    1093, 1094, 1095, 1096, 1097,

    1098, 1099

}

end

-- The client version and protocol version where

-- unsynchronized for some releases, not sure if this

-- will be the normal standard.

-- Client Version: Publicly given version when

-- downloading Cipsoft client.

-- Protocol Version: Previously was the same as

-- the client version, but was unsychronized in some

-- releases, now it needs to be verified and added here

-- if it does not match the client version.

-- Reason for defining both: The server now requires a

-- Client version and Protocol version from the client.

-- Important: Use getClientVersion for specific protocol

-- features to ensure we are using the proper version.

function g_game.getClientProtocolVersion(client)

  local clients = {

    [980] = 971,

    [981] = 973,

    [982] = 974,

    [983] = 975,

    [984] = 976,

    [985] = 977,

    [986] = 978,

    [1001] = 979,

    [1002] = 980

}

  return clients[client] or client

end

if not G.currentRsa then

  g_game.setRsa(OTSERV_RSA)

end

```

---
# gamelib.otmod

```text

Module

  name: gamelib

  description: Contains game related classes

  author: OTClient team

  website: https://github.com/edubart/otclient

  @onLoad: |

    dofile 'const'

    dofile 'util'

    dofile 'protocol'

    dofile 'protocollogin'

    dofile 'protocolgame'

    dofile 'position'

    dofile 'game'

    dofile 'creature'

    dofile 'player'

    dofile 'market'

    dofile 'textmessages'

    dofile 'thing'

    dofile 'spells'

    dofiles 'ui'

```

---
# market.lua

```lua

MarketMaxAmount = 2000

MarketMaxAmountStackable = 64000

MarketMaxPrice = 999999999

MarketMaxOffers = 100

MarketAction = {

  Buy = 0,

  Sell = 1

}

MarketRequest = {

  MyOffers = 0xFFFE,

  MyHistory = 0xFFFF

}

MarketOfferState = {

  Active = 0,

  Cancelled = 1,

  Expired = 2,

  Accepted = 3,

  AcceptedEx = 255

}

MarketCategory = {

  All = 0,

  Armors = 1,

  Amulets = 2,

  Boots = 3,

  Containers = 4,

  Decoration = 5,

  Food = 6,

  HelmetsHats = 7,

  Legs = 8,

  Others = 9,

  Potions = 10,

  Rings = 11,

  Runes = 12,

  Shields = 13,

  Tools = 14,

  Valuables = 15,

  Ammunition = 16,

  Axes = 17,

  Clubs = 18,

  DistanceWeapons = 19,

  Swords = 20,

  WandsRods = 21,

  PremiumScrolls = 22,

  TibiaCoins = 23,

  CreatureProducs = 24,

  Unknown1 = 25,

  Unknown2 = 26,

  StashRetrieve = 27,

  Unknown3 = 28,

  Unknown4 = 29,

  Gold = 30,

  Unassigned = 31,

  MetaWeapons = 255

}

MarketCategory.First = MarketCategory.Armors

MarketCategory.Last = MarketCategory.Unassigned

MarketCategoryWeapons = {

  [MarketCategory.Ammunition] = { slots = {255} },

  [MarketCategory.Axes] = { slots = {255, InventorySlotOther, InventorySlotLeft} },

  [MarketCategory.Clubs] = { slots = {255, InventorySlotOther, InventorySlotLeft} },

  [MarketCategory.DistanceWeapons] = { slots = {255, InventorySlotOther, InventorySlotLeft} },

  [MarketCategory.Swords] = { slots = {255, InventorySlotOther, InventorySlotLeft} },

  [MarketCategory.WandsRods] = { slots = {255, InventorySlotOther, InventorySlotLeft} }

}

MarketCategoryStrings = {

  [0] = 'All',

  [1] = 'Armors',

  [2] = 'Amulets',

  [3] = 'Boots',

  [4] = 'Containers',

  [5] = 'Decoration',

  [6] = 'Food',

  [7] = 'Helmets and Hats',

  [8] = 'Legs',

  [9] = 'Others',

  [10] = 'Potions',

  [11] = 'Rings',

  [12] = 'Runes',

  [13] = 'Shields',

  [14] = 'Tools',

  [15] = 'Valuables',

  [16] = 'Ammunition',

  [17] = 'Axes',

  [18] = 'Clubs',

  [19] = 'Distance Weapons',

  [20] = 'Swords',

  [21] = 'Wands and Rods',

  [22] = 'Premium Scrolls',

  [23] = 'Tibia Coins',

  [24] = 'Creature Products',

  [25] = 'Unknown 1',

  [26] = 'Unknown 2',

  [27] = 'Stash Retrieve',

  [28] = 'Unknown 3',

  [29] = 'Unknown 4',

  [30] = 'Gold',

  [31] = 'Unassigned',  

  [255] = 'Weapons'

}

function getMarketCategoryName(id)

  if table.haskey(MarketCategoryStrings, id) then

    return MarketCategoryStrings[id]

  end

end

function getMarketCategoryId(name)

  local id = table.find(MarketCategoryStrings, name)

  if id then

    return id

  end

end

MarketItemDescription = {

  Armor = 1,

  Attack = 2,

  Container = 3,

  Defense = 4,

  General = 5,

  DecayTime = 6,

  Combat = 7,

  MinLevel = 8,

  MinMagicLevel = 9,

  Vocation = 10,

  Rune = 11,

  Ability = 12,

  Charges = 13,

  WeaponName = 14,

  Weight = 15,

  Imbuements = 16

}

MarketItemDescription.First = MarketItemDescription.Armor

MarketItemDescription.Last = MarketItemDescription.Weight

MarketItemDescriptionStrings = {

  [1] = 'Armor',

  [2] = 'Attack',

  [3] = 'Container',

  [4] = 'Defense',

  [5] = 'Description',

  [6] = 'Use Time',

  [7] = 'Combat',

  [8] = 'Min Level',

  [9] = 'Min Magic Level',

  [10] = 'Vocation',

  [11] = 'Rune',

  [12] = 'Ability',

  [13] = 'Charges',

  [14] = 'Weapon Type',

  [15] = 'Weight',

  [16] = 'Imbuements'

}

function getMarketDescriptionName(id)

  if table.haskey(MarketItemDescriptionStrings, id) then

    return MarketItemDescriptionStrings[id]

  end

end

function getMarketDescriptionId(name)

  local id = table.find(MarketItemDescriptionStrings, name)

  if id then

    return id

  end

end

MarketSlotFilters = {

  [InventorySlotOther] = "Two-Handed",

  [InventorySlotLeft] = "One-Handed",

  [255] = "Any"

}

MarketFilters = {

  Vocation = 1,

  Level = 2,

  Depot = 3,

  SearchAll = 4

}

MarketFilters.First = MarketFilters.Vocation

MarketFilters.Last = MarketFilters.Depot

function getMarketSlotFilterId(name)

  local id = table.find(MarketSlotFilters, name)

  if id then

    return id

  end

end

function getMarketSlotFilterName(id)

  if table.haskey(MarketSlotFilters, id) then

    return MarketSlotFilters[id]

  end

end

```

---
# player.lua

```lua

-- @docclass Player

PlayerStates = {

  None = 0,

  Poison = 1,

  Burn = 2,

  Energy = 4,

  Drunk = 8,

  ManaShield = 16,

  Paralyze = 32,

  Haste = 64,

  Swords = 128,

  Drowning = 256,

  Freezing = 512,

  Dazzled = 1024,

  Cursed = 2048,

  PartyBuff = 4096,

  PzBlock = 8192,

  Pz = 16384,

  Bleeding = 32768,

  Hungry = 65536

}

InventorySlotOther = 0

InventorySlotHead = 1

InventorySlotNeck = 2

InventorySlotBack = 3

InventorySlotBody = 4

InventorySlotRight = 5

InventorySlotLeft = 6

InventorySlotLeg = 7

InventorySlotFeet = 8

InventorySlotFinger = 9

InventorySlotAmmo = 10

InventorySlotPurse = 11

InventorySlotFirst = 1

InventorySlotLast = 10

function Player:isPartyLeader()

  local shield = self:getShield()

  return (shield == ShieldYellow or

          shield == ShieldYellowSharedExp or

          shield == ShieldYellowNoSharedExpBlink or

          shield == ShieldYellowNoSharedExp)

end

function Player:isPartyMember()

  local shield = self:getShield()

  return (shield == ShieldYellow or

          shield == ShieldYellowSharedExp or

          shield == ShieldYellowNoSharedExpBlink or

          shield == ShieldYellowNoSharedExp or

          shield == ShieldBlueSharedExp or

          shield == ShieldBlueNoSharedExpBlink or

          shield == ShieldBlueNoSharedExp or

          shield == ShieldBlue)

end

function Player:isPartySharedExperienceActive()

  local shield = self:getShield()

  return (shield == ShieldYellowSharedExp or

          shield == ShieldYellowNoSharedExpBlink or

          shield == ShieldYellowNoSharedExp or

          shield == ShieldBlueSharedExp or

          shield == ShieldBlueNoSharedExpBlink or

          shield == ShieldBlueNoSharedExp)

end

function Player:hasVip(creatureName)

  for id, vip in pairs(g_game.getVips()) do

    if (vip[1] == creatureName) then return true end

  end

  return false

end

function Player:isMounted()

  local outfit = self:getOutfit()

  return outfit.mount ~= nil and outfit.mount > 0

end

function Player:toggleMount()

  if g_game.getFeature(GamePlayerMounts) then

    g_game.mount(not self:isMounted())

  end

end

function Player:mount()

  if g_game.getFeature(GamePlayerMounts) then

    g_game.mount(true)

  end

end

function Player:dismount()

  if g_game.getFeature(GamePlayerMounts) then

    g_game.mount(false)

  end

end

function Player:getItem(itemId, subType)

  return g_game.findPlayerItem(itemId, subType or -1)

end

function Player:getItems(itemId, subType)

  local subType = subType or -1

  local items = {}

  for i=InventorySlotFirst,InventorySlotLast do

    local item = self:getInventoryItem(i)

    if item and item:getId() == itemId and (subType == -1 or item:getSubType() == subType) then

      table.insert(items, item)

    end

  end

  for i, container in pairs(g_game.getContainers()) do

    for j, item in pairs(container:getItems()) do

      if item:getId() == itemId and (subType == -1 or item:getSubType() == subType) then

        item.container = container

        table.insert(items, item)

      end

    end

  end

  return items

end

function Player:getItemsCount(itemId)

  local items, count = self:getItems(itemId), 0

  for i=1,#items do

    count = count + items[i]:getCount()

  end

  return count

end

function Player:hasState(state, states)

  if not states then

    states = self:getStates()

  end

  for i = 1, 32 do

    local pow = math.pow(2, i-1)

    if pow > states then break end

    local states = bit32.band(states, pow)

    if states == state then

      return true

    end

  end

  return false

end

```

---
# position.lua

```lua

Position = {}

function Position.equals(pos1, pos2)

  return pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z

end

function Position.greaterThan(pos1, pos2, orEqualTo)

  if orEqualTo then

    return pos1.x >= pos2.x or pos1.y >= pos2.y or pos1.z >= pos2.z

  else

    return pos1.x > pos2.x or pos1.y > pos2.y or pos1.z > pos2.z

  end

end

function Position.lessThan(pos1, pos2, orEqualTo)

  if orEqualTo then

    return pos1.x <= pos2.x or pos1.y <= pos2.y or pos1.z <= pos2.z

  else

    return pos1.x < pos2.x or pos1.y < pos2.y or pos1.z < pos2.z

  end

end

function Position.isInRange(pos1, pos2, xRange, yRange)

  return math.abs(pos1.x-pos2.x) <= xRange and math.abs(pos1.y-pos2.y) <= yRange and pos1.z == pos2.z;

end

function Position.isValid(pos)

  return not (pos.x == 65535 and pos.y == 65535 and pos.z == 255)

end

function Position.distance(pos1, pos2)

  return math.sqrt(math.pow((pos2.x - pos1.x), 2) + math.pow((pos2.y - pos1.y), 2))

end

function Position.manhattanDistance(pos1, pos2)

  return math.abs(pos2.x - pos1.x) + math.abs(pos2.y - pos1.y)

end

```

---
# protocol.lua

```lua

GameServerOpcodes = {

    GameServerInitGame                  = 10,

    GameServerGMActions                 = 11,

    GameServerEnterGame                 = 15,

    GameServerLoginError                = 20,

    GameServerLoginAdvice               = 21,

    GameServerLoginWait                 = 22,

    GameServerAddCreature               = 23,

    GameServerPingBack                  = 29,

    GameServerPing                      = 30,

    GameServerChallenge                 = 31,

    GameServerDeath                     = 40,

    -- all in game opcodes must be greater than 50

    GameServerFirstGameOpcode           = 50,

    -- otclient ONLY

    GameServerExtendedOpcode            = 50,

    -- NOTE: add any custom opcodes in this range

    -- 51 - 99

    -- original tibia ONLY

    GameServerFullMap                   = 100,

    GameServerMapTopRow                 = 101,

    GameServerMapRightRow               = 102,

    GameServerMapBottomRow              = 103,

    GameServerMapLeftRow                = 104,

    GameServerUpdateTile                = 105,

    GameServerCreateOnMap               = 106,

    GameServerChangeOnMap               = 107,

    GameServerDeleteOnMap               = 108,

    GameServerMoveCreature              = 109,

    GameServerOpenContainer             = 110,

    GameServerCloseContainer            = 111,

    GameServerCreateContainer           = 112,

    GameServerChangeInContainer         = 113,

    GameServerDeleteInContainer         = 114,

    GameServerSetInventory              = 120,

    GameServerDeleteInventory           = 121,

    GameServerOpenNpcTrade              = 122,

    GameServerPlayerGoods               = 123,

    GameServerCloseNpcTrade             = 124,

    GameServerOwnTrade                  = 125,

    GameServerCounterTrade              = 126,

    GameServerCloseTrade                = 127,

    GameServerAmbient                   = 130,

    GameServerGraphicalEffect           = 131,

    GameServerTextEffect                = 132,

    GameServerMissleEffect              = 133,

    GameServerMarkCreature              = 134,

    GameServerTrappers                  = 135,

    GameServerCreatureHealth            = 140,

    GameServerCreatureLight             = 141,

    GameServerCreatureOutfit            = 142,

    GameServerCreatureSpeed             = 143,

    GameServerCreatureSkull             = 144,

    GameServerCreatureParty             = 145,

    GameServerCreatureUnpass            = 146,

    GameServerEditText                  = 150,

    GameServerEditList                  = 151,

    GameServerPlayerDataBasic           = 159, -- 910

    GameServerPlayerData                = 160,

    GameServerPlayerSkills              = 161,

    GameServerPlayerState               = 162,

    GameServerClearTarget               = 163,

    GameServerSpellDelay                = 164, -- 870

    GameServerSpellGroupDelay           = 165, -- 870

    GameServerMultiUseDelay             = 166, -- 870

    GameServerTalk                      = 170,

    GameServerChannels                  = 171,

    GameServerOpenChannel               = 172,

    GameServerOpenPrivateChannel        = 173,

    GameServerRuleViolationChannel      = 174,

    GameServerRuleViolationRemove       = 175,

    GameServerRuleViolationCancel       = 176,

    GameServerRuleViolationLock         = 177,

    GameServerOpenOwnChannel            = 178,

    GameServerCloseChannel              = 179,

    GameServerTextMessage               = 180,

    GameServerCancelWalk                = 181,

    GameServerWalkWait                  = 182,

    GameServerFloorChangeUp             = 190,

    GameServerFloorChangeDown           = 191,

    GameServerChooseOutfit              = 200,

    GameServerVipAdd                    = 210,

    GameServerVipLogin                  = 211,

    GameServerVipLogout                 = 212,

    GameServerTutorialHint              = 220,

    GameServerAutomapFlag               = 221,

    GameServerCoinBalance               = 223, -- 1080

    GameServerStoreError                = 224, -- 1080

    GameServerRequestPurchaseData       = 225, -- 1080

    GameServerQuestLog                  = 240,

    GameServerQuestLine                 = 241,

    GameServerCoinBalanceUpdating       = 242, -- 1080

    GameServerChannelEvent              = 243, -- 910

    GameServerItemInfo                  = 244, -- 910

    GameServerPlayerInventory           = 245, -- 910

    GameServerMarketEnter               = 246, -- 944

    GameServerMarketLeave               = 247, -- 944

    GameServerMarketDetail              = 248, -- 944

    GameServerMarketBrowse              = 249, -- 944

    GameServerShowModalDialog           = 250, -- 960

    GameServerStore                     = 251, -- 1080

    GameServerStoreOffers               = 252, -- 1080

    GameServerStoreTransactionHistory   = 253, -- 1080

    GameServerStoreCompletePurchase     = 254  -- 1080

}

ClientOpcodes = {

    ClientEnterAccount                  = 1,

    ClientEnterGame                     = 10,

    ClientLeaveGame                     = 20,

    ClientPing                          = 29,

    ClientPingBack                      = 30,

    -- all in game opcodes must be equal or greater than 50

    ClientFirstGameOpcode               = 50,

    -- otclient ONLY

    ClientExtendedOpcode                = 50,

    -- NOTE: add any custom opcodes in this range

    -- 51 - 99

    -- original tibia ONLY

    ClientAutoWalk                      = 100,

    ClientWalkNorth                     = 101,

    ClientWalkEast                      = 102,

    ClientWalkSouth                     = 103,

    ClientWalkWest                      = 104,

    ClientStop                          = 105,

    ClientWalkNorthEast                 = 106,

    ClientWalkSouthEast                 = 107,

    ClientWalkSouthWest                 = 108,

    ClientWalkNorthWest                 = 109,

    ClientTurnNorth                     = 111,

    ClientTurnEast                      = 112,

    ClientTurnSouth                     = 113,

    ClientTurnWest                      = 114,

    ClientEquipItem                     = 119, -- 910

    ClientMove                          = 120,

    ClientInspectNpcTrade               = 121,

    ClientBuyItem                       = 122,

    ClientSellItem                      = 123,

    ClientCloseNpcTrade                 = 124,

    ClientRequestTrade                  = 125,

    ClientInspectTrade                  = 126,

    ClientAcceptTrade                   = 127,

    ClientRejectTrade                   = 128,

    ClientUseItem                       = 130,

    ClientUseItemWith                   = 131,

    ClientUseOnCreature                 = 132,

    ClientRotateItem                    = 133,

    ClientCloseContainer                = 135,

    ClientUpContainer                   = 136,

    ClientEditText                      = 137,

    ClientEditList                      = 138,

    ClientLook                          = 140,

    ClientTalk                          = 150,

    ClientRequestChannels               = 151,

    ClientJoinChannel                   = 152,

    ClientLeaveChannel                  = 153,

    ClientOpenPrivateChannel            = 154,

    ClientCloseNpcChannel               = 158,

    ClientChangeFightModes              = 160,

    ClientAttack                        = 161,

    ClientFollow                        = 162,

    ClientInviteToParty                 = 163,

    ClientJoinParty                     = 164,

    ClientRevokeInvitation              = 165,

    ClientPassLeadership                = 166,

    ClientLeaveParty                    = 167,

    ClientShareExperience               = 168,

    ClientDisbandParty                  = 169,

    ClientOpenOwnChannel                = 170,

    ClientInviteToOwnChannel            = 171,

    ClientExcludeFromOwnChannel         = 172,

    ClientCancelAttackAndFollow         = 190,

    ClientRefreshContainer              = 202,

    ClientRequestOutfit                 = 210,

    ClientChangeOutfit                  = 211,

    ClientMount                         = 212, -- 870

    ClientAddVip                        = 220,

    ClientRemoveVip                     = 221,

    ClientBugReport                     = 230,

    ClientRuleViolation                 = 231,

    ClientDebugReport                   = 232,

    ClientTransferCoins                 = 239, -- 1080

    ClientRequestQuestLog               = 240,

    ClientRequestQuestLine              = 241,

    ClientNewRuleViolation              = 242, -- 910

    ClientRequestItemInfo               = 243, -- 910

    ClientMarketLeave                   = 244, -- 944

    ClientMarketBrowse                  = 245, -- 944

    ClientMarketCreate                  = 246, -- 944

    ClientMarketCancel                  = 247, -- 944

    ClientMarketAccept                  = 248, -- 944

    ClientAnswerModalDialog             = 249, -- 960

    ClientOpenStore                     = 250, -- 1080

    ClientRequestStoreOffers            = 251, -- 1080

    ClientBuyStoreOffer                 = 252, -- 1080

    ClientOpenTransactionHistory        = 253, -- 1080

    ClientRequestTransactionHistory     = 254  -- 1080

}

```

---
# protocolgame.lua

```lua

local opcodeCallbacks = {}

local extendedCallbacks = {}

local extendedJSONCallbacks = {}

local extendedJSONData = {}

local maxPacketSize = 65000

function ProtocolGame:onOpcode(opcode, msg)

  for i, callback in pairs(opcodeCallbacks) do

    if i == opcode then

      callback(self, msg)

      return true

    end

  end

  return false

end

function ProtocolGame:onExtendedOpcode(opcode, buffer)

  local callback = extendedCallbacks[opcode]

  if callback then

    callback(self, opcode, buffer)

  end

  callback = extendedJSONCallbacks[opcode]

  if callback then

    local status = buffer:sub(1,1) -- O - just one message, S - start, P - part, E - end

    local data = buffer:sub(2)

    if status ~= "E" and status ~= "P" then

      extendedJSONData[opcode] = ""

    end

    if status ~= "S" and status ~= "P" and status ~= "E" then

      extendedJSONData[opcode] = buffer

    else

      extendedJSONData[opcode] = extendedJSONData[opcode] .. data

    end

    if status ~= "S" and status ~= "P" then

      local json_status, json_data = pcall(function() return json.decode(extendedJSONData[opcode]) end)

      extendedJSONData[opcode] = nil

      if not json_status then

        error("Invalid data in extended JSON opcode (" .. json_status .. "): " .. json_data)

        return

      end

      callback(self, opcode, json_data)

    end

  end

end

function ProtocolGame.registerOpcode(opcode, callback)

  if opcodeCallbacks[opcode] then

    error('opcode ' .. opcode .. ' already registered will be overriden')

  end

  opcodeCallbacks[opcode] = callback

end

function ProtocolGame.unregisterOpcode(opcode)

  opcodeCallbacks[opcode] = nil

end

function ProtocolGame.registerExtendedOpcode(opcode, callback)

  if not callback or type(callback) ~= 'function' then

    error('Invalid callback.')

  end

  if opcode < 0 or opcode > 255 then

    error('Invalid opcode. Range: 0-255')

  end

  if extendedCallbacks[opcode] then

    error('Opcode is already taken.')

  end

  extendedCallbacks[opcode] = callback

end

function ProtocolGame.unregisterExtendedOpcode(opcode)

  if opcode < 0 or opcode > 255 then

    error('Invalid opcode. Range: 0-255')

  end

  if not extendedCallbacks[opcode] then

    error('Opcode is not registered.')

  end

  extendedCallbacks[opcode] = nil

end

function ProtocolGame.registerExtendedJSONOpcode(opcode, callback)

  if not callback or type(callback) ~= 'function' then

    error('Invalid callback.')

  end

  if opcode < 0 or opcode > 255 then

    error('Invalid opcode. Range: 0-255')

  end

  if extendedJSONCallbacks[opcode] then

    error('Opcode is already taken.')

  end

  extendedJSONCallbacks[opcode] = callback

end

function ProtocolGame.unregisterExtendedJSONOpcode(opcode)

  if opcode < 0 or opcode > 255 then

    error('Invalid opcode. Range: 0-255')

  end

  if not extendedJSONCallbacks[opcode] then

    error('Opcode is not registered.')

  end

  extendedJSONCallbacks[opcode] = nil

end

function ProtocolGame:sendExtendedJSONOpcode(opcode, data)

  if opcode < 0 or opcode > 255 then

    error('Invalid opcode. Range: 0-255')

  end

  if type(data) ~= "table" then

    error('Invalid data type, should be table')

  end

  local buffer = json.encode(data)  

  local s = {}

  for i=1, #buffer, maxPacketSize do

     s[#s+1] = buffer:sub(i,i+maxPacketSize - 1)

  end

  if #s == 1 then

    self:sendExtendedOpcode(opcode, s[1])

    return

  end

  self:sendExtendedOpcode(opcode, "S" .. s[1])

  for i=2,#s - 1 do

    self:sendExtendedOpcode(opcode, "P" .. s[i])

  end

  self:sendExtendedOpcode(opcode, "E" .. s[#s])

end

```

---
# protocollogin.lua

```lua

-- @docclass

ProtocolLogin = extends(Protocol, "ProtocolLogin")

LoginServerError = 10

LoginServerTokenSuccess = 12

LoginServerTokenError = 13

LoginServerUpdate = 17

LoginServerMotd = 20

LoginServerUpdateNeeded = 30

LoginServerSessionKey = 40

LoginServerCharacterList = 100

LoginServerExtendedCharacterList = 101

LoginServerProxyList = 110

-- Since 10.76

LoginServerRetry = 10

LoginServerErrorNew = 11

function ProtocolLogin:login(host, port, accountName, accountPassword, authenticatorToken, stayLogged)

  if string.len(host) == 0 or port == nil or port == 0 then

    signalcall(self.onLoginError, self, tr("You must enter a valid server address and port."))

    return

  end

  self.accountName = accountName

  self.accountPassword = accountPassword

  self.authenticatorToken = authenticatorToken

  self.stayLogged = stayLogged

  self.connectCallback = self.sendLoginPacket

  self:connect(host, port)

end

function ProtocolLogin:cancelLogin()

  self:disconnect()

end

function ProtocolLogin:sendLoginPacket()

  local msg = OutputMessage.create()

  msg:addU8(ClientOpcodes.ClientEnterAccount)

  msg:addU16(g_game.getOs())

  if g_game.getCustomProtocolVersion() > 0 then

    msg:addU16(g_game.getCustomProtocolVersion())  

  else

    msg:addU16(g_game.getProtocolVersion())

  end

  if g_game.getFeature(GameClientVersion) then

    msg:addU32(g_game.getClientVersion())

  end

  if g_game.getFeature(GameContentRevision) then

    msg:addU16(g_things.getContentRevision())

    msg:addU16(0)

  else

    msg:addU32(g_things.getDatSignature())

  end

  msg:addU32(g_sprites.getSprSignature())

  msg:addU32(PIC_SIGNATURE)

  if g_game.getFeature(GamePreviewState) then

    msg:addU8(0)

  end

  local offset = msg:getMessageSize()

  if g_game.getFeature(GameLoginPacketEncryption) then

    -- first RSA byte must be 0

    msg:addU8(0)

    -- xtea key

    self:generateXteaKey()

    local xteaKey = self:getXteaKey()

    msg:addU32(xteaKey[1])

    msg:addU32(xteaKey[2])

    msg:addU32(xteaKey[3])

    msg:addU32(xteaKey[4])

  end

  if g_game.getFeature(GameAccountNames) then

    msg:addString(self.accountName)

  else

    msg:addU32(tonumber(self.accountName))

  end

  msg:addString(self.accountPassword)

  if self.getLoginExtendedData then

    local data = self:getLoginExtendedData()

    msg:addString(data)

  else

    msg:addString("OTCv8")

    local version = g_app.getVersion():split(" ")[1]:gsub("%.", "")

    if version:len() == 2 then

      version = version .. "0" 

    end

    msg:addU16(tonumber(version))

  end

  local paddingBytes = g_crypt.rsaGetSize() - (msg:getMessageSize() - offset)

  assert(paddingBytes >= 0)

  for i = 1, paddingBytes do

    msg:addU8(math.random(0, 0xff))

  end

  if g_game.getFeature(GameLoginPacketEncryption) then

    msg:encryptRsa()

  end

  if g_game.getFeature(GameOGLInformation) then

    msg:addU8(1) --unknown

    msg:addU8(1) --unknown

    if g_game.getProtocolVersion() >= 1072 then

      msg:addString(string.format('%s %s', g_graphics.getVendor(), g_graphics.getRenderer()))

    else

      msg:addString(g_graphics.getRenderer())

    end

    msg:addString(g_graphics.getVersion())

  end

  -- add RSA encrypted auth token

  if g_game.getFeature(GameAuthenticator) then

    offset = msg:getMessageSize()

    -- first RSA byte must be 0

    msg:addU8(0)

    msg:addString(self.authenticatorToken)

    if g_game.getFeature(GameSessionKey) then

      msg:addU8(booleantonumber(self.stayLogged))

    end

    paddingBytes = g_crypt.rsaGetSize() - (msg:getMessageSize() - offset)

    assert(paddingBytes >= 0)

    for i = 1, paddingBytes do

      msg:addU8(math.random(0, 0xff))

    end

    msg:encryptRsa()

  end

  if g_game.getFeature(GamePacketSizeU32) then

    self:enableBigPackets()

  end

  if g_game.getFeature(GameProtocolChecksum) then

    self:enableChecksum()

  end

  self:send(msg)

  if g_game.getFeature(GameLoginPacketEncryption) then

    self:enableXteaEncryption()

  end

  self:recv()

end

function ProtocolLogin:onConnect()

  self.gotConnection = true

  self:connectCallback()

  self.connectCallback = nil

end

function ProtocolLogin:onRecv(msg)

  while not msg:eof() do

    local opcode = msg:getU8()

    if opcode == LoginServerErrorNew then

      self:parseError(msg)

    elseif opcode == LoginServerError then

      self:parseError(msg)

    elseif opcode == LoginServerMotd then

      self:parseMotd(msg)

    elseif opcode == LoginServerUpdateNeeded then

      signalcall(self.onLoginError, self, tr("Client needs update."))

    elseif opcode == LoginServerTokenSuccess then

      local unknown = msg:getU8()

    elseif opcode == LoginServerTokenError then

      -- TODO: prompt for token here

      local unknown = msg:getU8()

      signalcall(self.onLoginError, self, tr("Invalid authentification token."))

    elseif opcode == LoginServerCharacterList then

      self:parseCharacterList(msg)

    elseif opcode == LoginServerExtendedCharacterList then

      self:parseExtendedCharacterList(msg)

    elseif opcode == LoginServerUpdate then

      local signature = msg:getString()

      signalcall(self.onUpdateNeeded, self, signature)      

    elseif opcode == LoginServerSessionKey then

      self:parseSessionKey(msg)

    elseif opcode == LoginServerProxyList then

      local proxies = {}

      local proxiesCount = msg:getU8()

      for i=1, proxiesCount do

        local host = msg:getString()

        local port = msg:getU16()

        local priority = msg:getU16()        

        table.insert(proxies, {host=host, port=port, priority=priority})

      end      

      signalcall(self.onProxyList, self, proxies)

    else

      self:parseOpcode(opcode, msg)

    end

  end

  self:disconnect()

end

function ProtocolLogin:parseError(msg)

  local errorMessage = msg:getString()

  signalcall(self.onLoginError, self, errorMessage)

end

function ProtocolLogin:parseMotd(msg)

  local motd = msg:getString()

  signalcall(self.onMotd, self, motd)

end

function ProtocolLogin:parseSessionKey(msg)

  local sessionKey = msg:getString()

  signalcall(self.onSessionKey, self, sessionKey)

end

function ProtocolLogin:parseCharacterList(msg)

  local characters = {}

  if g_game.getProtocolVersion() > 1010 then

    local worlds = {}

    local worldsCount = msg:getU8()

    for i=1, worldsCount do

      local world = {}

      local worldId = msg:getU8()

      world.worldName = msg:getString()

      world.worldIp = msg:getString()

      world.worldPort = msg:getU16()

      world.previewState = msg:getU8()

      worlds[worldId] = world

    end

    local charactersCount = msg:getU8()

    for i=1, charactersCount do

      local character = {}

      local worldId = msg:getU8()

      character.name = msg:getString()

      character.worldName = worlds[worldId].worldName

      character.worldIp = worlds[worldId].worldIp

      character.worldPort = worlds[worldId].worldPort

      character.previewState = worlds[worldId].previewState

      characters[i] = character

    end

  else

    local charactersCount = msg:getU8()

    for i=1,charactersCount do

      local character = {}

      character.name = msg:getString()

      character.worldName = msg:getString()

      character.worldIp = iptostring(msg:getU32())

      character.worldPort = msg:getU16()

      if g_game.getFeature(GamePreviewState) then

        character.previewState = msg:getU8()

      end

      characters[i] = character

    end

  end

  local account = {}

  if g_game.getProtocolVersion() > 1077 then

    account.status = msg:getU8()

    account.subStatus = msg:getU8()

    account.premDays = msg:getU32()

    if account.premDays ~= 0 and account.premDays ~= 65535 then

      account.premDays = math.floor((account.premDays - os.time()) / 86400)

    end

  else

    account.status = AccountStatus.Ok

    account.premDays = msg:getU16()

    account.subStatus = account.premDays > 0 and SubscriptionStatus.Premium or SubscriptionStatus.Free

  end

  signalcall(self.onCharacterList, self, characters, account)

end

function ProtocolLogin:parseExtendedCharacterList(msg)

  local characters = msg:getTable()

  local account = msg:getTable()

  local otui = msg:getString()

  signalcall(self.onCharacterList, self, characters, account, otui)

end

function ProtocolLogin:parseOpcode(opcode, msg)

  signalcall(self.onOpcode, self, opcode, msg)

end

function ProtocolLogin:onError(msg, code)

  local text = translateNetworkError(code, self:isConnecting(), msg)

  signalcall(self.onLoginError, self, text)

end

```

---
# spells.lua

```lua

SpelllistSettings = {

  ['Default'] = {

    iconFile = '/images/game/spells/defaultspells',

    iconSize = {width = 32, height = 32},

    spellListWidth = 210,

    spellWindowWidth = 550,

    spellOrder = {'Animate Dead', 'Annihilation', 'Avalanche', 'Berserk', 'Blood Rage', 'Brutal Strike', 'Cancel Invisibility', 'Challenge', 'Chameleon', 'Charge', 'Conjure Arrow', 'Conjure Bolt', 'Conjure Explosive Arrow', 'Conjure Piercing Bolt', 'Conjure Poisoned Arrow', 'Conjure Power Bolt', 'Conjure Sniper Arrow', 'Convince Creature', 'Creature Illusion', 'Cure Bleeding', 'Cure Burning', 'Cure Curse', 'Cure Electrification', 'Cure Poison', 'Cure Poison Rune', 'Curse', 'Death Strike', 'Desintegrate', 'Destroy Field', 'Divine Caldera', 'Divine Healing', 'Divine Missile', 'Electrify', 'Enchant Party', 'Enchant Spear', 'Enchant Staff', 'Energy Beam', 'Energy Field', 'Energy Strike', 'Energy Wall', 'Energy Wave', 'Energybomb', 'Envenom', 'Eternal Winter', 'Ethereal Spear', 'Explosion', 'Fierce Berserk', 'Find Person', 'Fire Field', 'Fire Wall', 'Fire Wave', 'Fireball', 'Firebomb', 'Flame Strike', 'Food', 'Front Sweep', 'Great Energy Beam', 'Great Fireball', 'Great Light', 'Groundshaker', 'Haste', 'Heal Friend', 'Heal Party', 'Heavy Magic Missile', 'Hells Core', 'Holy Flash', 'Holy Missile', 'Ice Strike', 'Ice Wave', 'Icicle', 'Ignite', 'Inflict Wound', 'Intense Healing', 'Intense Healing Rune', 'Intense Recovery', 'Intense Wound Cleansing', 'Invisibility', 'Levitate', 'Light', 'Light Healing', 'Light Magic Missile', 'Lightning', 'Magic Rope', 'Magic Shield', 'Magic Wall', 'Mass Healing', 'Paralyze', 'Physical Strike', 'Poison Bomb', 'Poison Field', 'Poison Wall', 'Protect Party', 'Protector', 'Rage of the Skies', 'Recovery', 'Salvation', 'Sharpshooter', 'Soulfire', 'Stalagmite', 'Stone Shower', 'Strong Energy Strike', 'Strong Ethereal Spear', 'Strong Flame Strike', 'Strong Haste', 'Strong Ice Strike', 'Strong Ice Wave', 'Strong Terra Strike', 'Sudden Death', 'Summon Creature', 'Swift Foot', 'Terra Strike', 'Terra Wave', 'Thunderstorm', 'Train Party', 'Ultimate Energy Strike', 'Ultimate Flame Strike', 'Ultimate Healing', 'Ultimate Healing Rune', 'Ultimate Ice Strike', 'Ultimate Light', 'Ultimate Terra Strike', 'Whirlwind Throw', 'Wild Growth', 'Wound Cleansing', 'Wrath of Nature'}

  }--[[,

  ['Sample'] =  {

    iconFile = '/images/game/spells/sample',

    iconSize = {width = 64, height = 64},

    spellOrder = {'Critical Strike', 'Firefly', 'Fire Breath', 'Moonglaives', 'Wind Walk'}

  }]]

}

SpellInfo = {

  ['Default'] = {

    ['Death Strike'] =             {id = 87,  words = 'exori mort',            exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'deathstrike',            mana = 20,     level = 16, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Flame Strike'] =             {id = 89,  words = 'exori flam',            exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'flamestrike',            mana = 20,     level = 14, soul = 0, group = {[1] = 2000},               vocations = {1, 2, 5, 6}},

    ['Strong Flame Strike'] =      {id = 150, words = 'exori gran flam',       exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'strongflamestrike',      mana = 60,     level = 70, soul = 0, group = {[1] = 2000, [4] = 8000},   vocations = {1, 5}},

    ['Ultimate Flame Strike'] =    {id = 154, words = 'exori max flam',        exhaustion = 30000, premium = true,  type = 'Instant', icon = 'ultimateflamestrike',    mana = 100,    level = 90, soul = 0, group = {[1] = 4000},               vocations = {1, 5}},

    ['Energy Strike'] =            {id = 88,  words = 'exori vis',             exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'energystrike',           mana = 20,     level = 12, soul = 0, group = {[1] = 2000},               vocations = {1, 2, 5, 6}},

    ['Strong Energy Strike'] =     {id = 151, words = 'exori gran vis',        exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'strongenergystrike',     mana = 60,     level = 80, soul = 0, group = {[1] = 2000, [4] = 8000},   vocations = {1, 5}},

    ['Ultimate Energy Strike'] =   {id = 155, words = 'exori max vis',         exhaustion = 30000, premium = true,  type = 'Instant', icon = 'ultimateenergystrike',   mana = 100,    level = 100,soul = 0, group = {[1] = 4000},               vocations = {1, 5}},

    ['Whirlwind Throw'] =          {id = 107, words = 'exori hur',             exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'whirlwindthrow',         mana = 40,     level = 28, soul = 0, group = {[1] = 2000},               vocations = {4, 8}},

    ['Fire Wave'] =                {id = 19,  words = 'exevo flam hur',        exhaustion = 4000,  premium = false, type = 'Instant', icon = 'firewave',               mana = 25,     level = 18, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Ethereal Spear'] =           {id = 111, words = 'exori con',             exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'etherealspear',          mana = 25,     level = 23, soul = 0, group = {[1] = 2000},               vocations = {3, 7}},

    ['Strong Ethereal Spear'] =    {id = 57,  words = 'exori gran con',        exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'strongetherealspear',    mana = 55,     level = 90, soul = 0, group = {[1] = 2000},               vocations = {3, 7}},

    ['Energy Beam'] =              {id = 22,  words = 'exevo vis lux',         exhaustion = 4000,  premium = false, type = 'Instant', icon = 'energybeam',             mana = 40,     level = 23, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Great Energy Beam'] =        {id = 23,  words = 'exevo gran vis lux',    exhaustion = 6000,  premium = false, type = 'Instant', icon = 'greatenergybeam',        mana = 110,    level = 29, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Groundshaker'] =             {id = 106, words = 'exori mas',             exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'groundshaker',           mana = 160,    level = 33, soul = 0, group = {[1] = 2000},               vocations = {4, 8}},

    ['Berserk'] =                  {id = 80,  words = 'exori',                 exhaustion = 4000,  premium = true,  type = 'Instant', icon = 'berserk',                mana = 115,    level = 35, soul = 0, group = {[1] = 2000},               vocations = {4, 8}},

    ['Annihilation'] =             {id = 62,  words = 'exori gran ico',        exhaustion = 30000, premium = true,  type = 'Instant', icon = 'annihilation',           mana = 300,    level = 110,soul = 0, group = {[1] = 4000},               vocations = {4, 8}},

    ['Brutal Strike'] =            {id = 61,  words = 'exori ico',             exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'brutalstrike',           mana = 30,     level = 16, soul = 0, group = {[1] = 2000},               vocations = {4, 8}},

    ['Front Sweep'] =              {id = 59,  words = 'exori min',             exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'frontsweep',             mana = 200,    level = 70, soul = 0, group = {[1] = 2000},               vocations = {4, 8}},

    ['Inflict Wound'] =            {id = 141, words = 'utori kor',             exhaustion = 30000, premium = true,  type = 'Instant', icon = 'inflictwound',           mana = 30,     level = 40, soul = 0, group = {[1] = 2000},               vocations = {4, 8}},

    ['Ignite'] =                   {id = 138, words = 'utori flam',            exhaustion = 30000, premium = true,  type = 'Instant', icon = 'ignite',                 mana = 30,     level = 26, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Lightning'] =                {id = 149, words = 'exori amp vis',         exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'lightning',              mana = 60,     level = 55, soul = 0, group = {[1] = 2000, [4] = 8000},   vocations = {1, 5}},

    ['Curse'] =                    {id = 139, words = 'utori mort',            exhaustion = 50000, premium = true,  type = 'Instant', icon = 'curse',                  mana = 30,     level = 75, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Electrify'] =                {id = 140, words = 'utori vis',             exhaustion = 30000, premium = true,  type = 'Instant', icon = 'electrify',              mana = 30,     level = 34, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Energy Wave'] =              {id = 13,  words = 'exevo vis hur',         exhaustion = 8000,  premium = false, type = 'Instant', icon = 'energywave',             mana = 170,    level = 38, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Rage of the Skies'] =        {id = 119, words = 'exevo gran mas vis',    exhaustion = 40000, premium = true,  type = 'Instant', icon = 'rageoftheskies',         mana = 600,    level = 55, soul = 0, group = {[1] = 4000},               vocations = {1, 5}},

    ['Fierce Berserk'] =           {id = 105, words = 'exori gran',            exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'fierceberserk',          mana = 340,    level = 90, soul = 0, group = {[1] = 2000},               vocations = {4, 8}},

    ['Hells Core'] =               {id = 24,  words = 'exevo gran mas flam',   exhaustion = 40000, premium = true,  type = 'Instant', icon = 'hellscore',              mana = 1100,   level = 60, soul = 0, group = {[1] = 4000},               vocations = {1, 5}},

    ['Holy Flash'] =               {id = 143, words = 'utori san',             exhaustion = 40000, premium = true,  type = 'Instant', icon = 'holyflash',              mana = 30,     level = 70, soul = 0, group = {[1] = 2000},               vocations = {3, 7}},

    ['Divine Missile'] =           {id = 122, words = 'exori san',             exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'divinemissile',          mana = 20,     level = 40, soul = 0, group = {[1] = 2000},               vocations = {3, 7}},

    ['Divine Caldera'] =           {id = 124, words = 'exevo mas san',         exhaustion = 4000,  premium = true,  type = 'Instant', icon = 'divinecaldera',          mana = 160,    level = 50, soul = 0, group = {[1] = 2000},               vocations = {3, 7}},

    ['Physical Strike'] =          {id = 148, words = 'exori moe ico',         exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'physicalstrike',         mana = 20,     level = 16, soul = 0, group = {[1] = 2000},               vocations = {2, 6}},

    ['Eternal Winter'] =           {id = 118, words = 'exevo gran mas frigo',  exhaustion = 40000, premium = true,  type = 'Instant', icon = 'eternalwinter',          mana = 1050,   level = 60, soul = 0, group = {[1] = 4000},               vocations = {2, 6}},

    ['Ice Strike'] =               {id = 112, words = 'exori frigo',           exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'icestrike',              mana = 20,     level = 15, soul = 0, group = {[1] = 2000},               vocations = {1, 5, 2, 6}},

    ['Strong Ice Strike'] =        {id = 152, words = 'exori gran frigo',      exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'strongicestrike',        mana = 60,     level = 80, soul = 0, group = {[1] = 2000, [4] = 8000},   vocations = {2, 6}},

    ['Ultimate Ice Strike'] =      {id = 156, words = 'exori max frigo',       exhaustion = 30000, premium = true,  type = 'Instant', icon = 'ultimateicestrike',      mana = 100,    level = 100,soul = 0, group = {[1] = 4000},               vocations = {2, 6}},

    ['Ice Wave'] =                 {id = 121, words = 'exevo frigo hur',       exhaustion = 4000,  premium = false, type = 'Instant', icon = 'icewave',                mana = 25,     level = 18, soul = 0, group = {[1] = 2000},               vocations = {2, 6}},

    ['Strong Ice Wave'] =          {id = 43,  words = 'exevo gran frigo hur',  exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'strongicewave',          mana = 170,    level = 40, soul = 0, group = {[1] = 2000},               vocations = {2, 6}},

    ['Envenom'] =                  {id = 142, words = 'utori pox',             exhaustion = 40000, premium = true,  type = 'Instant', icon = 'envenom',                mana = 30,     level = 50, soul = 0, group = {[1] = 2000},               vocations = {2, 6}},

    ['Terra Strike'] =             {id = 113, words = 'exori tera',            exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'terrastrike',            mana = 20,     level = 13, soul = 0, group = {[1] = 2000},               vocations = {1, 5, 2, 6}},

    ['Strong Terra Strike'] =      {id = 153, words = 'exori gran tera',       exhaustion = 8000,  premium = true,  type = 'Instant', icon = 'strongterrastrike',      mana = 60,     level = 70, soul = 0, group = {[1] = 2000, [4] = 8000},   vocations = {2, 6}},

    ['Ultimate Terra Strike'] =    {id = 157, words = 'exori max tera',        exhaustion = 30000, premium = true,  type = 'Instant', icon = 'ultimateterrastrike',    mana = 100,    level = 90, soul = 0, group = {[1] = 4000},               vocations = {2, 6}},

    ['Terra Wave'] =               {id = 120, words = 'exevo tera hur',        exhaustion = 4000,  premium = false, type = 'Instant', icon = 'terrawave',              mana = 210,    level = 38, soul = 0, group = {[1] = 2000},               vocations = {2, 6}},

    ['Wrath of Nature'] =          {id = 56,  words = 'exevo gran mas tera',   exhaustion = 40000, premium = true,  type = 'Instant', icon = 'wrathofnature',          mana = 700,    level = 55, soul = 0, group = {[1] = 4000},               vocations = {2, 6}},

    ['Light Healing'] =            {id = 1,   words = 'exura',                 exhaustion = 1000,  premium = false, type = 'Instant', icon = 'lighthealing',           mana = 20,     level = 9,  soul = 0, group = {[2] = 1000},               vocations = {1, 2, 3, 5, 6, 7}},

    ['Wound Cleansing'] =          {id = 123, words = 'exura ico',             exhaustion = 1000,  premium = false, type = 'Instant', icon = 'woundcleansing',         mana = 40,     level = 10, soul = 0, group = {[2] = 1000},               vocations = {4, 8}},

    ['Intense Wound Cleansing'] =  {id = 158, words = 'exura gran ico',        exhaustion = 600000,premium = true,  type = 'Instant', icon = 'intensewoundcleansing',  mana = 200,    level = 80, soul = 0, group = {[2] = 1000},               vocations = {4, 8}},

    ['Cure Bleeding'] =            {id = 144, words = 'exana kor',             exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'curebleeding',           mana = 30,     level = 30, soul = 0, group = {[2] = 1000},               vocations = {4, 8}},

    ['Cure Electrification'] =     {id = 146, words = 'exana vis',             exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'curseelectrification',   mana = 30,     level = 22, soul = 0, group = {[2] = 1000},               vocations = {2, 6}},

    ['Cure Poison'] =              {id = 29,  words = 'exana pox',             exhaustion = 6000,  premium = false, type = 'Instant', icon = 'curepoison',             mana = 30,     level = 10, soul = 0, group = {[2] = 1000},               vocations = {1, 2, 3, 4, 5, 6, 7, 8}},

    ['Cure Burning'] =             {id = 145, words = 'exana flam',            exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'cureburning',            mana = 30,     level = 30, soul = 0, group = {[2] = 1000},               vocations = {2, 6}},

    ['Cure Curse'] =               {id = 147, words = 'exana mort',            exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'curecurse',              mana = 40,     level = 80, soul = 0, group = {[2] = 1000},               vocations = {3, 7}},

    ['Recovery'] =                 {id = 159, words = 'utura',                 exhaustion = 60000, premium = true,  type = 'Instant', icon = 'recovery',               mana = 75,     level = 50, soul = 0, group = {[2] = 1000},               vocations = {4, 8, 3, 7}},

    ['Intense Recovery'] =         {id = 160, words = 'utura gran',            exhaustion = 60000, premium = true,  type = 'Instant', icon = 'intenserecovery',        mana = 165,    level = 100,soul = 0, group = {[2] = 1000},               vocations = {4, 8, 3, 7}},

    ['Salvation'] =                {id = 36,  words = 'exura gran san',        exhaustion = 1000,  premium = true,  type = 'Instant', icon = 'salvation',              mana = 210,    level = 60, soul = 0, group = {[2] = 1000},               vocations = {3, 7}},

    ['Intense Healing'] =          {id = 2,   words = 'exura gran',            exhaustion = 1000,  premium = false, type = 'Instant', icon = 'intensehealing',         mana = 70,     level = 20, soul = 0, group = {[2] = 1000},               vocations = {1, 2, 3, 5, 6, 7}},

    ['Heal Friend'] =              {id = 84,  words = 'exura sio',             exhaustion = 1000,  premium = true,  type = 'Instant', icon = 'healfriend',             mana = 140,    level = 18, soul = 0, group = {[2] = 1000},               vocations = {2, 6}, parameter = true},

    ['Ultimate Healing'] =         {id = 3,   words = 'exura vita',            exhaustion = 1000,  premium = false, type = 'Instant', icon = 'ultimatehealing',        mana = 160,    level = 30, soul = 0, group = {[2] = 1000},               vocations = {1, 2, 5, 6}},

    ['Mass Healing'] =             {id = 82,  words = 'exura gran mas res',    exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'masshealing',            mana = 150,    level = 36, soul = 0, group = {[2] = 1000},               vocations = {2, 6}},

    ['Divine Healing'] =           {id = 125, words = 'exura san',             exhaustion = 1000,  premium = false, type = 'Instant', icon = 'divinehealing',          mana = 160,    level = 35, soul = 0, group = {[2] = 1000},               vocations = {3, 7}},

    ['Light'] =                    {id = 10,  words = 'utevo lux',             exhaustion = 2000,  premium = false, type = 'Instant', icon = 'light',                  mana = 20,     level = 8,  soul = 0, group = {[3] = 2000},               vocations = {1, 2, 3, 4, 5, 6, 7, 8}},

    ['Find Person'] =              {id = 20,  words = 'exiva',                 exhaustion = 2000,  premium = false, type = 'Instant', icon = 'findperson',             mana = 20,     level = 8,  soul = 0, group = {[3] = 2000},               vocations = {1, 2, 3, 4, 5, 6, 7, 8}, parameter = true},

    ['Magic Rope'] =               {id = 76,  words = 'exani tera',            exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'magicrope',              mana = 20,     level = 9,  soul = 0, group = {[3] = 2000},               vocations = {1, 2, 3, 4, 5, 6, 7, 8}},

    ['Levitate'] =                 {id = 81,  words = 'exani hur',             exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'levitate',               mana = 50,     level = 12, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 3, 4, 5, 6, 7, 8}, parameter = true},

    ['Great Light'] =              {id = 11,  words = 'utevo gran lux',        exhaustion = 2000,  premium = false, type = 'Instant', icon = 'greatlight',             mana = 60,     level = 13, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 3, 4, 5, 6, 7, 8}},

    ['Magic Shield'] =             {id = 44,  words = 'utamo vita',            exhaustion = 2000,  premium = false, type = 'Instant', icon = 'magicshield',            mana = 50,     level = 14, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Haste'] =                    {id = 6,   words = 'utani hur',             exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'haste',                  mana = 60,     level = 14, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 3, 4, 5, 6, 7, 8}},

    ['Charge'] =                   {id = 131, words = 'utani tempo hur',       exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'charge',                 mana = 100,    level = 25, soul = 0, group = {[3] = 2000},               vocations = {4, 8}},

    ['Swift Foot'] =               {id = 134, words = 'utamo tempo san',       exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'swiftfoot',              mana = 400,    level = 55, soul = 0, group = {[1] = 10000, [3] = 2000},  vocations = {3, 7}},

    ['Challenge'] =                {id = 93,  words = 'exeta res',             exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'challenge',              mana = 30,     level = 20, soul = 0, group = {[3] = 2000},               vocations = {8}},

    ['Strong Haste'] =             {id = 39,  words = 'utani gran hur',        exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'stronghaste',            mana = 100,    level = 20, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Creature Illusion'] =        {id = 38,  words = 'utevo res ina',         exhaustion = 2000,  premium = false, type = 'Instant', icon = 'creatureillusion',       mana = 100,    level = 23, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 5, 6}, parameter = true},

    ['Ultimate Light'] =           {id = 75,  words = 'utevo vis lux',         exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'ultimatelight',          mana = 140,    level = 26, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Cancel Invisibility'] =      {id = 90,  words = 'exana ina',             exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'cancelinvisibility',     mana = 200,    level = 26, soul = 0, group = {[3] = 2000},               vocations = {3, 7}},

    ['Invisibility'] =             {id = 45,  words = 'utana vid',             exhaustion = 2000,  premium = false, type = 'Instant', icon = 'invisible',              mana = 440,    level = 35, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Sharpshooter'] =             {id = 135, words = 'utito tempo san',       exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'sharpshooter',           mana = 450,    level = 60, soul = 0, group = {[2] = 10000, [3] = 10000}, vocations = {3, 7}},

    ['Protector'] =                {id = 132, words = 'utamo tempo',           exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'protector',              mana = 200,    level = 55, soul = 0, group = {[1] = 10000, [3] = 2000},  vocations = {4, 8}},

    ['Blood Rage'] =               {id = 133, words = 'utito tempo',           exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'bloodrage',              mana = 290,    level = 60, soul = 0, group = {[3] = 2000},               vocations = {4, 8}},

    ['Train Party'] =              {id = 126, words = 'utito mas sio',         exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'trainparty',             mana = 'Var.', level = 32, soul = 0, group = {[3] = 2000},               vocations = {8}},

    ['Protect Party'] =            {id = 127, words = 'utamo mas sio',         exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'protectparty',           mana = 'Var.', level = 32, soul = 0, group = {[3] = 2000},               vocations = {7}},

    ['Heal Party'] =               {id = 128, words = 'utura mas sio',         exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'healparty',              mana = 'Var.', level = 32, soul = 0, group = {[3] = 2000},               vocations = {6}},

    ['Enchant Party'] =            {id = 129, words = 'utori mas sio',         exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'enchantparty',           mana = 'Var.', level = 32, soul = 0, group = {[3] = 2000},               vocations = {5}},

    ['Summon Creature'] =          {id = 9,   words = 'utevo res',             exhaustion = 2000,  premium = false, type = 'Instant', icon = 'summoncreature',         mana = 'Var.', level = 25, soul = 0, group = {[3] = 2000},               vocations = {1, 2, 5, 6}, parameter = true},

    ['Conjure Arrow'] =            {id = 51,  words = 'exevo con',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'conjurearrow',           mana = 100,    level = 13, soul = 1, group = {[3] = 2000},               vocations = {3, 7}},

    ['Food'] =                     {id = 42,  words = 'exevo pan',             exhaustion = 2000,  premium = false, type = 'Instant', icon = 'food',                   mana = 120,    level = 14, soul = 1, group = {[3] = 2000},               vocations = {2, 6}},

    ['Conjure Poisoned Arrow'] =   {id = 48,  words = 'exevo con pox',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'poisonedarrow',          mana = 130,    level = 16, soul = 2, group = {[3] = 2000},               vocations = {3, 7}},

    ['Conjure Bolt'] =             {id = 79,  words = 'exevo con mort',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'conjurebolt',            mana = 140,    level = 17, soul = 2, group = {[3] = 2000},               vocations = {3, 7}},

    ['Conjure Sniper Arrow'] =     {id = 108, words = 'exevo con hur',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'sniperarrow',            mana = 160,    level = 24, soul = 3, group = {[3] = 2000},               vocations = {3, 7}},

    ['Conjure Explosive Arrow'] =  {id = 49,  words = 'exevo con flam',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'explosivearrow',         mana = 290,    level = 25, soul = 3, group = {[3] = 2000},               vocations = {3, 7}},

    ['Conjure Piercing Bolt'] =    {id = 109, words = 'exevo con grav',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'piercingbolt',           mana = 180,    level = 33, soul = 3, group = {[3] = 2000},               vocations = {3, 7}},

    ['Enchant Staff'] =            {id = 92,  words = 'exeta vis',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'enchantstaff',           mana = 80,     level = 41, soul = 0, group = {[3] = 2000},               vocations = {5}},

    ['Enchant Spear'] =            {id = 110, words = 'exeta con',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'enchantspear',           mana = 350,    level = 45, soul = 3, group = {[3] = 2000},               vocations = {3, 7}},

    ['Conjure Power Bolt'] =       {id = 95,  words = 'exevo con vis',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'powerbolt',              mana = 800,    level = 59, soul = 3, group = {[3] = 2000},               vocations = {7}},

    ['Poison Field'] =             {id = 26,  words = 'adevo grav pox',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'poisonfield',            mana = 200,    level = 14, soul = 1, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Light Magic Missile'] =      {id = 7,   words = 'adori min vis',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'lightmagicmissile',      mana = 120,    level = 15, soul = 1, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Fire Field'] =               {id = 25,  words = 'adevo grav flam',       exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'firefield',              mana = 240,    level = 15, soul = 1, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Fireball'] =                 {id = 15,  words = 'adori flam',            exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'fireball',               mana = 460,    level = 27, soul = 3, group = {[3] = 2000},               vocations = {1, 5}},

    ['Energy Field'] =             {id = 27,  words = 'adevo grav vis',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'energyfield',            mana = 320,    level = 18, soul = 2, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Stalagmite'] =               {id = 77,  words = 'adori tera',            exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'stalagmite',             mana = 400,    level = 24, soul = 2, group = {[3] = 2000},               vocations = {1, 5, 2, 6}},

    ['Great Fireball'] =           {id = 16,  words = 'adori mas flam',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'greatfireball',          mana = 530,    level = 30, soul = 3, group = {[3] = 2000},               vocations = {1, 5}},

    ['Heavy Magic Missile'] =      {id = 8,   words = 'adori vis',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'heavymagicmissile',      mana = 350,    level = 25, soul = 2, group = {[3] = 2000},               vocations = {1, 5, 2, 6}},

    ['Poison Bomb'] =              {id = 91,  words = 'adevo mas pox',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'poisonbomb',             mana = 520,    level = 25, soul = 2, group = {[3] = 2000},               vocations = {2, 6}},

    ['Firebomb'] =                 {id = 17,  words = 'adevo mas flam',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'firebomb',               mana = 600,    level = 27, soul = 3, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Soulfire'] =                 {id = 50,  words = 'adevo res flam',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'soulfire',               mana = 600,    level = 27, soul = 3, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Poison Wall'] =              {id = 32,  words = 'adevo mas grav pox',    exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'poisonwall',             mana = 640,    level = 29, soul = 3, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Explosion'] =                {id = 18,  words = 'adevo mas hur',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'explosion',              mana = 570,    level = 31, soul = 3, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Fire Wall'] =                {id = 28,  words = 'adevo mas grav flam',   exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'firewall',               mana = 780,    level = 33, soul = 3, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Energybomb'] =               {id = 55,  words = 'adevo mas vis',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'energybomb',             mana = 880,    level = 37, soul = 5, group = {[3] = 2000},               vocations = {1, 5}},

    ['Energy Wall'] =              {id = 33,  words = 'adevo mas grav vis',    exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'energywall',             mana = 1000,   level = 41, soul = 5, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Sudden Death'] =             {id = 21,  words = 'adori gran mort',       exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'suddendeath',            mana = 985,    level = 45, soul = 5, group = {[3] = 2000},               vocations = {1, 5}},

    ['Cure Poison Rune'] =         {id = 31,  words = 'adana pox',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'antidote',               mana = 200,    level = 15, soul = 1, group = {[3] = 2000},               vocations = {2, 6}},

    ['Intense Healing Rune'] =     {id = 4,   words = 'adura gran',            exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'intensehealingrune',     mana = 240,    level = 15, soul = 2, group = {[3] = 2000},               vocations = {2, 6}},

    ['Ultimate Healing Rune'] =    {id = 5,   words = 'adura vita',            exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'ultimatehealingrune',    mana = 400,    level = 24, soul = 3, group = {[3] = 2000},               vocations = {2, 6}},

    ['Convince Creature'] =        {id = 12,  words = 'adeta sio',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'convincecreature',       mana = 200,    level = 16, soul = 3, group = {[3] = 2000},               vocations = {2, 6}},

    ['Animate Dead'] =             {id = 83,  words = 'adana mort',            exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'animatedead',            mana = 600,    level = 27, soul = 5, group = {[3] = 2000},               vocations = {1, 2, 5, 6}},

    ['Chameleon'] =                {id = 14,  words = 'adevo ina',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'chameleon',              mana = 600,    level = 27, soul = 2, group = {[3] = 2000},               vocations = {2, 6}},

    ['Destroy Field'] =            {id = 30,  words = 'adito grav',            exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'destroyfield',           mana = 120,    level = 17, soul = 2, group = {[3] = 2000},               vocations = {1, 2, 3, 5, 6, 7}},

    ['Desintegrate'] =             {id = 78,  words = 'adito tera',            exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'desintegrate',           mana = 200,    level = 21, soul = 3, group = {[3] = 2000},               vocations = {1, 2, 3, 5, 6, 7}},

    ['Magic Wall'] =               {id = 86,  words = 'adevo grav tera',       exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'magicwall',              mana = 750,    level = 32, soul = 5, group = {[3] = 2000},               vocations = {1, 5}},

    ['Wild Growth'] =              {id = 94,  words = 'adevo grav vita',       exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'wildgrowth',             mana = 600,    level = 27, soul = 5, group = {[3] = 2000},               vocations = {2, 6}},

    ['Paralyze'] =                 {id = 54,  words = 'adana ani',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'paralyze',               mana = 1400,   level = 54, soul = 3, group = {[3] = 2000},               vocations = {2, 6}},

    ['Icicle'] =                   {id = 114, words = 'adori frigo',           exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'icicle',                 mana = 460,    level = 28, soul = 3, group = {[3] = 2000},               vocations = {2, 6}},

    ['Avalanche'] =                {id = 115, words = 'adori mas frigo',       exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'avalanche',              mana = 530,    level = 30, soul = 3, group = {[3] = 2000},               vocations = {2, 6}},

    ['Stone Shower'] =             {id = 116, words = 'adori mas tera',        exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'stoneshower',            mana = 430,    level = 28, soul = 3, group = {[3] = 2000},               vocations = {2, 6}},

    ['Thunderstorm'] =             {id = 117, words = 'adori mas vis',         exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'thunderstorm',           mana = 430,    level = 28, soul = 3, group = {[3] = 2000},               vocations = {1, 5}},

    ['Holy Missile'] =             {id = 130, words = 'adori san',             exhaustion = 2000,  premium = false, type = 'Conjure', icon = 'holymissile',            mana = 350,    level = 27, soul = 3, group = {[3] = 2000},               vocations = {3, 7}},

    -- newest tibia spells

    ['Summon Paladin Familiar'] =  {id = 171, words = 'utevo gran res sac',    exhaustion = 1800000,premium = true, type = 'Instant', icon = 'summonpaladinfamiliar',  mana = 2000,   level = 200,soul = 0, group = {[3] = 2000},               vocations = {7}},

    ['Summon Knight Familiar'] =   {id = 170, words = 'utevo gran res eq',     exhaustion = 1800000,premium = true, type = 'Instant', icon = 'summonknightfamiliar',   mana = 1000,   level = 200,soul = 0, group = {[3] = 2000},               vocations = {8}},

    ['Summon Druid Familiar'] =    {id = 172, words = 'utevo gran res dru',    exhaustion = 1800000,premium = true, type = 'Instant', icon = 'summondruidfamiliar',    mana = 3000,   level = 200,soul = 0, group = {[3] = 2000},              vocations = {6}},

    ['Summon Sorcerer Familiar'] = {id = 173, words = 'utevo gran res eq',     exhaustion = 1800000,premium = true, type = 'Instant', icon = 'summonsorcererfamiliar', mana = 3000,   level = 200,soul = 0, group = {[3] = 2000},                vocations = {5}},

    ['Chivalrous Challenge'] =     {id = 101, words = "exeta amp res",         exhaustion = 2000,  premium = true,  type = 'Instant', icon = 'chivalrouschallange',    mana = 80,     level = 150,soul = 0, group = {[3] = 2000},               vocations = {8}},

    ['Fair Wound Cleansing'] =     {id = 102, words = 'exura med ico',         exhaustion = 1000,  premium = true,  type = 'Instant', icon = 'fairwoundcleansing',     mana = 90,     level = 300,soul = 0, group = {[2] = 1000},               vocations = {8}},

    ['Conjure Wand of Darkness'] = {id = 92, words = 'exevo gran mort',        exhaustion = 1800000,premium = true, type = 'Conjure', icon = 'conjurewandofdarkness',  mana = 250,    level = 41, soul = 0, group = {[3] = 2000},               vocations = {1, 5}},

    ['Expose Weakness'] =          {id = 106, words = 'exori moe',             exhaustion = 12000, premium = true,  type = 'Instant', icon = 'exposeweakness',        mana = 400,    level = 275,soul = 0, group = {[5] = 12000, [3] = 2000},  vocations = {1, 5}},

    ['Sap Strenght'] =             {id = 105, words = 'exori kor',             exhaustion = 12000, premium = true,  type = 'Instant', icon = 'sapstrenght',           mana = 300,    level = 175,soul = 0, group = {[5] = 12000, [3] = 2000},  vocations = {1, 5}},

    ['Great Fire Wave'] =          {id = 163, words = 'exevo gran flam hur',   exhaustion = 4000,  premium = true,  type = 'Instant', icon = 'greatfirewave',         mana = 120,    level = 38, soul = 0, group = {[1] = 2000},               vocations = {1, 5}},

    ['Restoration'] =              {id = 103, words = "exura max vita",        exhaustion = 6000,  premium = true,  type = 'Instant', icon = 'restoration',            mana = 260,    level = 300,soul = 0, group = {[2] = 1000},               vocations = {1, 2, 5, 6}},

    ["Nature's Embrace"] =         {id = 101, words = 'exura gran sio',        exhaustion = 60000, premium = true,  type = 'Instant', icon = 'naturesembrace',         mana = 400,    level = 300,soul = 0, group = {[2] = 1000},               vocations = {2, 6}, parameter = true},

    ['Divine Dazzle'] =            {id = 101, words = 'exana amp res',         exhaustion = 16000, premium = true,  type = 'Instant', icon = 'divinedazzle',           mana = 80,     level = 250,soul = 0, group = {[3] = 2000},               vocations = {3, 7}},

  }--[[,

  ['Sample'] = {

    ['Wind Walk'] =                {id = 1, words = 'windwalk',        description = 'Run at enormous speed.',          exhaustion = 2000,  premium = false, type = 'Instant', icon = 1,  mana = 50,     level = 10, soul = 0, group = {[3] = 2000}, vocations = {1, 2}},

    ['Fire Breath'] =              {id = 2, words = 'firebreath',      description = 'A strong firewave.',              exhaustion = 2000,  premium = false, type = 'Instant', icon = 2,  mana = 350,    level = 27, soul = 0, group = {[1] = 2000}, vocations = {4, 8}},

    ['Moonglaives'] =              {id = 3, words = 'moonglaives',     description = 'Throw moonglaives around you.',   exhaustion = 2000,  premium = false, type = 'Instant', icon = 3,  mana = 90,     level = 55, soul = 0, group = {[1] = 2000}, vocations = {3, 7}},

    ['Critical Strike'] =          {id = 4, words = 'criticalstrike',  description = 'Land a critical strike.',         exhaustion = 2000,  premium = false, type = 'Instant', icon = 4,  mana = 350,    level = 27, soul = 0, group = {[1] = 2000}, vocations = {3, 4, 7, 8}},

    ['Firefly'] =                  {id = 5, words = 'firefly',         description = 'Summon a angry firefly',          exhaustion = 2000,  premium = false, type = 'Instant', icon = 5,  mana = 350,    level = 27, soul = 0, group = {[1] = 2000}, vocations = {1, 2, 5, 6}}

  }]]

}

-- ['const_name'] =       {client_id, TFS_id}

-- Conversion from TFS icon id to the id used by client (icons.png order)  

SpellIcons = {

  -- new tibia spells, server owners - you will probably need to adjust TFS_id

  ['summonsorcererfamiliar']    = {130, 173},

  ['summondruidfamiliar']       = {129, 172},

  ['summonpaladinfamiliar']     = {127, 171},

  ['summonknightfamiliar']      = {128, 170},

  ['exposeweakness']            = {134, 106},

  ['sapstrenght']               = {135, 105},

  ['restoration']               = {137, 103},

  ['fairwoundcleansing']        = {132, 102},

  ['chivalrouschallange']       = {131, 101},

  ["naturesembrace"]            = {138, 101},

  ['divinedazzle']              = {139, 101},

  ['greatfirewave']             = {136, 100},

  ['conjurewandofdarkness']     = {133, 92},

  -- old spells

  ['intenserecovery']           = {16, 160},

  ['recovery']                  = {15, 159},

  ['intensewoundcleansing']     = {4, 158},

  ['ultimateterrastrike']       = {37, 157},

  ['ultimateicestrike']         = {34, 156},

  ['ultimateenergystrike']      = {31, 155},

  ['ultimateflamestrike']       = {28, 154},

  ['strongterrastrike']         = {36, 153},

  ['strongicestrike']           = {33, 152},

  ['strongenergystrike']        = {30, 151},

  ['strongflamestrike']         = {27, 150},

  ['lightning']                 = {51, 149},

  ['physicalstrike']            = {17, 148},

  ['curecurse']                 = {11, 147},

  ['curseelectrification']      = {14, 146},

  ['cureburning']               = {13, 145},

  ['curebleeding']              = {12, 144},

  ['holyflash']                 = {53, 143},

  ['envenom']                   = {58, 142},

  ['inflictwound']              = {57, 141},

  ['electrify']                 = {56, 140},

  ['curse']                     = {54, 139},

  ['ignite']                    = {55, 138},

  -- [[ 136 / 137 Unknown ]]

  ['sharpshooter']              = {121, 135},

  ['swiftfoot']                 = {119, 134},

  ['bloodrage']                 = {96, 133},

  ['protector']                 = {122, 132},

  ['charge']                    = {98, 131},

  ['holymissile']               = {76, 130},

  ['enchantparty']              = {113, 129},

  ['healparty']                 = {126, 128},

  ['protectparty']              = {123, 127},

  ['trainparty']                = {120, 126},

  ['divinehealing']             = {2, 125},

  ['divinecaldera']             = {40, 124},

  ['woundcleansing']            = {3, 123},

  ['divinemissile']             = {39, 122},

  ['icewave']                   = {45, 121},

  ['terrawave']                 = {47, 120},

  ['rageoftheskies']            = {52, 119},

  ['eternalwinter']             = {50, 118},

  ['thunderstorm']              = {63, 117},

  ['stoneshower']               = {65, 116},

  ['avalanche']                 = {92, 115},

  ['icicle']                    = {75, 114},

  ['terrastrike']               = {35, 113},

  ['icestrike']                 = {32, 112},

  ['etherealspear']             = {18, 111},

  ['enchantspear']              = {104, 110},

  ['piercingbolt']              = {110, 109},

  ['sniperarrow']               = {112, 108},

  ['whirlwindthrow']            = {19, 107},

  ['groundshaker']              = {25, 106},

  ['fierceberserk']             = {22, 105},

  -- [[ 96 - 104 Unknown ]]

  ['powerbolt']                 = {108, 95},

  ['wildgrowth']                = {61, 94},

  ['challenge']                 = {97, 93},

  ['enchantstaff']              = {103, 92},

  ['poisonbomb']                = {70, 91},

  ['cancelinvisibility']        = {95, 90},

  ['flamestrike']               = {26, 89},

  ['energystrike']              = {29, 88},

  ['deathstrike']               = {38, 87},

  ['magicwall']                 = {72, 86},

  ['healfriend']                = {8, 84},

  ['animatedead']               = {93, 83},

  ['masshealing']               = {9, 82},

  ['levitate']                  = {125, 81},

  ['berserk']                   = {21, 80},

  ['conjurebolt']               = {107, 79},

  ['desintegrate']              = {88, 78},

  ['stalagmite']                = {66, 77},

  ['magicrope']                 = {105, 76},

  ['ultimatelight']             = {115, 75},

  -- [[ 71 - 64 TFS House Commands ]]

  -- [[ 63 - 70 Unknown ]]

  ['annihilation']              = {24, 62},

  ['brutalstrike']              = {23, 61},

  -- [[ 60 Unknown ]]

  ['frontsweep']                = {20, 59},

  -- [[ 58 Unknown ]]

  ['strongetherealspear']       = {59, 57},

  ['wrathofnature']             = {48, 56},

  ['energybomb']                = {86, 55},

  ['paralyze']                  = {71, 54},

  --  [[ 53 Unknown ]]

  --  [[ 52 TFS Retrieve Friend ]]

  ['conjurearrow']              = {106, 51},

  ['soulfire']                  = {67, 50},

  ['explosivearrow']            = {109, 49},

  ['poisonedarrow']             = {111, 48},

  -- [[ 46 / 47 Unknown ]]

  ['invisible']                 = {94, 45},

  ['magicshield']               = {124, 44},

  ['strongicewave']             = {46, 43},

  ['food']                      = {99, 42},

  -- [[ 40 / 41 Unknown ]]

  ['stronghaste']               = {102, 39},

  ['creatureillusion']          = {100, 38},

  -- [[ 37 TFS Move ]]

  ['salvation']                 = {60, 36},

  -- [[ 34 / 35 Unknown ]]

  ['energywall']                = {84, 33},

  ['poisonwall']                = {68, 32},

  ['antidote']                  = {10, 31},

  ['destroyfield']              = {87, 30},

  ['curepoison']                = {10, 29},

  ['firewall']                  = {80, 28},

  ['energyfield']               = {85, 27},

  ['poisonfield']               = {69, 26},

  ['firefield']                 = {81, 25},

  ['hellscore']                 = {49, 24},

  ['greatenergybeam']           = {42, 23},

  ['energybeam']                = {41, 22},

  ['suddendeath']               = {64, 21},

  ['findperson']                = {114, 20},

  ['firewave']                  = {44, 19},

  ['explosion']                 = {83, 18},

  ['firebomb']                  = {82, 17},

  ['greatfireball']             = {78, 16},

  ['fireball']                  = {79, 15},

  ['chameleon']                 = {91, 14},

  ['energywave']                = {43, 13},

  ['convincecreature']          = {90, 12},

  ['greatlight']                = {116, 11},

  ['light']                     = {117, 10},

  ['summoncreature']            = {118, 9},

  ['heavymagicmissile']         = {77, 8},

  ['lightmagicmissile']         = {73, 7},

  ['haste']                     = {101, 6},

  ['ultimatehealingrune']       = {62, 5},

  ['intensehealingrune']        = {74, 4},

  ['ultimatehealing']           = {1, 3},

  ['intensehealing']            = {7, 2},

  ['lighthealing']              = {6, 1},

}

VocationNames = {

  [1] = 'Sorcerer',

  [2] = 'Druid',

  [3] = 'Paladin',

  [4] = 'Knight',

  [5] = 'Master Sorcerer',

  [6] = 'Elder Druid',

  [7] = 'Royal Paladin',

  [8] = 'Elite Knight'

}

SpellGroups = {

  [1] = 'Attack',

  [2] = 'Healing',

  [3] = 'Support',

  [4] = 'Special',

  [5] = 'Cripple'

}

Spells = {}

function Spells.getClientId(spellName)

  local profile = Spells.getSpellProfileByName(spellName)

  local id = SpellInfo[profile][spellName].icon

  if not tonumber(id) and SpellIcons[id] then

    return SpellIcons[id][1]

  end

  return tonumber(id)

end

function Spells.getServerId(spellName)

  local profile = Spells.getSpellProfileByName(spellName)

  local id = SpellInfo[profile][spellName].icon

  if not tonumber(id) and SpellIcons[id] then

    return SpellIcons[id][2]

  end

  return tonumber(id)

end

function Spells.getSpellByName(name)

  return SpellInfo[Spells.getSpellProfileByName(name)][name]

end

function Spells.getSpellByWords(words)

  local words = words:lower():trim()

  for profile,data in pairs(SpellInfo) do

    for k,spell in pairs(data) do

      if spell.words == words then

        return spell, profile, k

      end

    end

  end

  return nil

end

function Spells.getSpellByIcon(iconId)

  for profile,data in pairs(SpellInfo) do

    for k,spell in pairs(data) do

      if spell.id == iconId then

        return spell, profile, k

      end

    end

  end

  return nil

end

function Spells.getSpellIconIds()

  local ids = {}

  for profile,data in pairs(SpellInfo) do

    for k,spell in pairs(data) do

      table.insert(ids, spell.id)

    end

  end

  return ids

end

function Spells.getSpellProfileById(id)

  for profile,data in pairs(SpellInfo) do

    for k,spell in pairs(data) do

      if spell.id == id then

        return profile

      end

    end

  end

  return nil

end

function Spells.getSpellProfileByWords(words)

  for profile,data in pairs(SpellInfo) do

    for k,spell in pairs(data) do

      if spell.words == words then

        return profile

      end

    end

  end

  return nil

end

function Spells.getSpellProfileByName(spellName)

  for profile,data in pairs(SpellInfo) do

    if table.findbykey(data, spellName:trim(), true) then

      return profile

    end

  end

  return nil

end

function Spells.getSpellsByVocationId(vocId)

  local spells = {}

  for profile,data in pairs(SpellInfo) do

    for k,spell in pairs(data) do

      if table.contains(spell.vocations, vocId) then

        table.insert(spells, spell)

      end

    end

  end

  return spells

end

function Spells.filterSpellsByGroups(spells, groups)

  local filtered = {}

  for v,spell in pairs(spells) do

    local spellGroups = Spells.getGroupIds(spell)

    if table.equals(spellGroups, groups) then

      table.insert(filtered, spell)

    end

  end

  return filtered

end

function Spells.getGroupIds(spell)

  local groups = {}

  for k,_ in pairs(spell.group) do

    table.insert(groups, k)

  end

  return groups

end

function Spells.getImageClip(id, profile)

  return (((id-1)%12)*SpelllistSettings[profile].iconSize.width) .. ' ' 

    .. ((math.ceil(id/12)-1)*SpelllistSettings[profile].iconSize.height) .. ' ' 

    .. SpelllistSettings[profile].iconSize.width .. ' ' 

    .. SpelllistSettings[profile].iconSize.height

end

```

---
# textmessages.lua

```lua

local messageModeCallbacks = {}

function g_game.onTextMessage(messageMode, message)

  local callbacks = messageModeCallbacks[messageMode]

  if not callbacks or #callbacks == 0 then

    perror(string.format('Unhandled onTextMessage message mode %i: %s', messageMode, message))

    return

  end

  for _, callback in pairs(callbacks) do

    callback(messageMode, message)

  end

end

function registerMessageMode(messageMode, callback)

  if not messageModeCallbacks[messageMode] then

    messageModeCallbacks[messageMode] = {}

  end

  table.insert(messageModeCallbacks[messageMode], callback)

  return true

end

function unregisterMessageMode(messageMode, callback)

  if not messageModeCallbacks[messageMode] then

    return false

  end

  return table.removevalue(messageModeCallbacks[messageMode], callback)

end

```

---
# thing.lua

```lua

ThingCategoryItem = 0

ThingCategoryCreature = 1

ThingCategoryEffect = 2

ThingCategoryMissile = 3

ThingInvalidCategory = 4

ThingLastCategory = ThingInvalidCategory

ThingAttrGround           = 0

ThingAttrGroundBorder     = 1

ThingAttrOnBottom         = 2

ThingAttrOnTop            = 3

ThingAttrContainer        = 4

ThingAttrStackable        = 5

ThingAttrForceUse         = 6

ThingAttrMultiUse         = 7

ThingAttrWritable         = 8

ThingAttrWritableOnce     = 9

ThingAttrFluidContainer   = 10

ThingAttrSplash           = 11

ThingAttrNotWalkable      = 12

ThingAttrNotMoveable      = 13

ThingAttrBlockProjectile  = 14

ThingAttrNotPathable      = 15

ThingAttrPickupable       = 16

ThingAttrHangable         = 17

ThingAttrHookSouth        = 18

ThingAttrHookEast         = 19

ThingAttrRotateable       = 20

ThingAttrLight            = 21

ThingAttrDontHide         = 22

ThingAttrTranslucent      = 23

ThingAttrDisplacement     = 24

ThingAttrElevation        = 25

ThingAttrLyingCorpse      = 26

ThingAttrAnimateAlways    = 27

ThingAttrMinimapColor     = 28

ThingAttrLensHelp         = 29

ThingAttrFullGround       = 30

ThingAttrLook             = 31

ThingAttrCloth            = 32

ThingAttrMarket           = 33

ThingAttrNoMoveAnimation  = 253 -- >= 1010, value = 16

ThingAttrChargeable       = 254 -- deprecated

ThingLastAttr             = 255

SpriteMaskRed = 1

SpriteMaskGreen = 2

SpriteMaskBlue = 3

SpriteMaskYellow = 4

```

---
# util.lua

```lua

function postostring(pos)

  return pos.x .. " " .. pos.y .. " " .. pos.z

end

function dirtostring(dir)

  for k,v in pairs(Directions) do

    if v == dir then

      return k

    end

  end

end

```

---

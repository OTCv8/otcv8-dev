local ui = setupUI([[

Panel
  image-source: /images/ui/window
  image-border: 3
  anchors.horizontalCenter: parent.horizontalCenter
  anchors.top: parent.top
  height: 68
  margin-top: 50
  visible: true

  Panel
    id: bossPanel
    image-source: /images/ui/rarity_white
    image-border: 6
    anchors.top: parent.top
    anchors.left: parent.left
    image-color: #d9d9d9
    size: 70 70

    UICreature
      id: bossOutfit
      anchors.left: parent.left
      anchors.top: parent.top
      anchors.right: parent.right
      size: 65 65

  Panel
    id: bossPanel_Name
    image-source: /images/ui/rarity_white
    image-border: 6
    image-color: #d9d9d9
    padding: 3
    height: 30
    margin-top: 3
    margin-right: 3
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.left: bossPanel.right

    Label
      id: bossName
      anchors.left: bossPanel.right
      text: Monster Name
      font: verdana-11px-rounded
      text-horizontal-auto-resize: true

    UIWidget
      id: skullUI
      size: 13 13
      anchors.left: bossPanel_Name.right
      anchors.right: parent.right
      image-source: /images/game/skull_socket
      image-border: 6

  Panel
    id: progressPanel
    image-source: /images/ui/rarity_white
    image-border: 6
    image-color: #d9d9d9
    padding: 3
    height: 25
    margin-top: 5
    margin-right: 2
    anchors.top: bossPanel_Name.bottom
    anchors.left: bossPanel.right
    anchors.right: parent.right
  
    ProgressBar
      id: percent
      background-color: green
      height: 18 
      anchors.left: parent.left
      text: 100%
      width: 160
      margin-right: 5

]], modules.game_interface.gameMapPanel)


local skull = {
  normal = "",
  white = "/images/game/skulls/skull_white",
  yellow = "/images/game/skulls/skull_yellow",
  green = "/images/game/skulls/skull_green",
  orange = "/images/game/skulls/skull_orange",
  red = "/images/game/skulls/skull_red",
  black = "/images/game/skulls/skull_black"
}


macro(50, function()
if not g_game.isAttacking() then
 ui:hide()

elseif g_game.isAttacking() then
  ui:show()
  --- get attacking creature name
   local mob = g_game.getAttackingCreature()
   ui.bossPanel_Name.bossName:setText(mob:getName())

  --- get attacking creature outfit
   local monsOutfit = mob:getOutfit()
   ui.bossPanel.bossOutfit:setOutfit(monsOutfit)

  --- get attacking creature health percent
   local monsterHP = mob:getHealthPercent()
   ui.progressPanel.percent:setText(monsterHP.."%")
   ui.progressPanel.percent:setPercent(monsterHP)

  if monsterHP > 75 then
    ui.progressPanel.percent:setBackgroundColor("green")
   elseif monsterHP > 50 then
    ui.progressPanel.percent:setBackgroundColor("yellow")
   elseif monsterHP > 25 then
    ui.progressPanel.percent:setBackgroundColor("orange")
   elseif monsterHP > 1 then
    ui.progressPanel.percent:setBackgroundColor("red")
  end

  --- get attacking creature skull 
  if mob:getSkull() == 0 then
     ui.bossPanel_Name.skullUI:setIcon(skull.normal)
   elseif mob:getSkull() == 1 then
     ui.bossPanel_Name.skullUI:setIcon(skull.yellow)
   elseif mob:getSkull() == 2 then
     ui.bossPanel_Name.skullUI:setIcon(skull.green)
   elseif mob:getSkull() == 3 then
     ui.bossPanel_Name.skullUI:setIcon(skull.white)
   elseif mob:getSkull() == 4 then
     ui.bossPanel_Name.skullUI:setIcon(skull.red)
   elseif mob:getSkull() == 5 then
     ui.bossPanel_Name.skullUI:setIcon(skull.black)
   elseif mob:getSkull() == 6 then
    ui.bossPanel_Name.skullUI:setIcon(skull.orange)
  end
 end
end)
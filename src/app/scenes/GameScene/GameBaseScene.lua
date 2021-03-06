local scheduler = require("framework.scheduler")

local RicherPlayer = import("app.RicherPlayer")

local RouteNavigation = import("app.RouteNavigation")

local PopupLayer = import("app.PopupLayer")

local Toast = import("app.Toast")

local Item_crab = import("app.Item_crab")

local Item_emergency = import("app.Item_emergency")

local GameBaseScene = class("GameBaseScene", function(name)
	-- print(name)
	return display.newScene(name)
end)

tableStartPosition_x = 650;
tableStartPosition_y = 450;
tableWidth = 50;
tableHeight = 40;
tiledWidth = 32;
tiledHeight = 32;
FONT_SIZE = 20;

Dialog_Size_Width = 400;
Dialog_Size_Height = 220;

Btn_OK_TAG = 1;
Btn_Cancel_TAG = 0;
stepSkillAnimaTime = 0.1;

goButtonTag = 700;
skillButtonTag = 701;
skillStormTag = 702;
skillStepTag = 703;
skillTransferTag = 704;
saveButtonTag = 705;
audioButtonTag = 706;
stepBaseTag = 800;
step1_tag = stepBaseTag+1
step2_tag = stepBaseTag+2
step3_tag = stepBaseTag+3
step4_tag = stepBaseTag+4
step5_tag = stepBaseTag+5
step6_tag = stepBaseTag+6
tiledRowsCount = 0
tiledColsCount = 0

skillSpriteCardWidth = 150
skillSpriteCardHeight = 100

Quit_OK_TAG = 801;
Quit_Cancel_TAG = 802;

map = {}
players = {}
canPassGrid = {}
pathMarks = {}
wayLayer = nil
landLayer = {}
randomAskEvents = {}

blank_land_tiledID   = 0
strength_30_tiledID  = 0
strength_50_tiledID  = 0
strength_80_tiledID  = 0

randomEvent_tiledID  = 0
lottery_tiledID      = 0
stock_tiledID        = 0

player2_building_1_tiledID = 0
player2_building_2_tiledID = 0
player2_building_3_tiledID = 0

player1_building_1_tiledID = 0
player1_building_2_tiledID = 0
player1_building_3_tiledID = 0

map_level = 0
saveJsonName = 0


function GameBaseScene:getPlayers()
	return players
end

function GameBaseScene:getcanPassGrid()
	return canPassGrid
end

function GameBaseScene:getpathMarks()
	return pathMarks
end

function GameBaseScene:ctor()
	self:registerNotificationObserver()
	self.wayLayerPass_vector = {}
	self:addMap()
	self:doSomeForParticle()
	self:setWayPassToGrid()
	self:initLandLayerFromMap()
	self:drawTable(2)
	self:addPathMark()
	self:addPlayer()
	self:addGoButton()
	self:initRandomAskEvent()
	self:initItemSprite()
	self:registerBlockWaySchedule()
end

function GameBaseScene:onEnter()
	print("GameBaseScene:onEnter")
	print(self.name)
	-- local PopupLayer = PopupLayer:create("hello","hello world",handler(self,self.goButtonCallback) )
	-- PopupLayer:setTitle("xxx")
	-- PopupLayer:setContentText("xxx")
	-- self:addChild(PopupLayer)
end

function GameBaseScene:onExit()
end

function GameBaseScene:addMap()
	print("GameBaseScene:addMap")
end

function GameBaseScene:drawTable(playerNumber)
end

function GameBaseScene:addPathMark()  
    -- //这个方法就是创建6个路径遮挡Sprite，并添加到当前场景中  
    local mark1 = display.newSprite(PATH_MARK_1) 
    local mark2 = display.newSprite(PATH_MARK_2)   
    local mark3 = display.newSprite(PATH_MARK_3)   
    local mark4 = display.newSprite(PATH_MARK_4)   
    local mark5 = display.newSprite(PATH_MARK_5)   
    local mark6 = display.newSprite(PATH_MARK_6)
  
	mark1:setAnchorPoint(0,0)
    mark2:setAnchorPoint(0,0)  
    mark3:setAnchorPoint(0,0)  
    mark4:setAnchorPoint(0,0)  
    mark5:setAnchorPoint(0,0)  
    mark6:setAnchorPoint(0,0)  
    -- //都为不可见  
    mark1:setVisible(false)
    mark2:setVisible(false)  
    mark3:setVisible(false)  
    mark4:setVisible(false)  
    mark5:setVisible(false)  
    mark6:setVisible(false)  
  
    self:addChild(mark1)
    self:addChild(mark2)
    self:addChild(mark3)
    self:addChild(mark4)
    self:addChild(mark5)
    self:addChild(mark6)

    pathMarks[#pathMarks+1] = mark1
    pathMarks[#pathMarks+1] = mark2
    pathMarks[#pathMarks+1] = mark3  
    pathMarks[#pathMarks+1] = mark4  
    pathMarks[#pathMarks+1] = mark5  
    pathMarks[#pathMarks+1] = mark6    
end

function GameBaseScene:addPlayer()
	local player1 = RicherPlayer.new(
	{
		name = "player1",
		tag = 1,
		enemy = 100,
		money = 100,
		strength = 100,
		turn = true
	})
	
	math.newrandomseed()
	local randNum = math.random(#self.wayLayerPass_vector)
	-- print(randNum)
	local x = self.wayLayerPass_vector[randNum].x
	local y = self.wayLayerPass_vector[randNum].y
	-- print("x = " .. x .. " y = " .. y)
	player1:setAnchorPoint(0,0.5)
	player1:setPosition(x, y + TILEDHEIGHT)
	player1:setName("player1")
	self:addChild(player1)
	players[#players+1] = player1

	local player2 = RicherPlayer.new(
	{
		name = "player2",
		tag = 2,
		enemy = 100,
		money = 100,
		strength = 100,
		turn = true
	})
	
	math.newrandomseed()
	local randNum = math.random(#self.wayLayerPass_vector)
	print(randNum)
	local x = self.wayLayerPass_vector[randNum].x
	local y = self.wayLayerPass_vector[randNum].y
	-- print("x = " .. x .. " y = " .. y)
	player2:setAnchorPoint(0,0.5)
	player2:setPosition(x, y + TILEDHEIGHT)
	player2:setName("player2")
	self:addChild(player2)
	players[#players+1] = player2

end

function GameBaseScene:setWayPassToGrid()  
	-- print(map.name)
 	wayLayer = map:getLayer("way")
 	
 	if wayLayer == nil then
 		return
 	end

 	local mapSize = wayLayer:getLayerSize()
 	-- print("mapSize.width .. mapSize.height " .. mapSize.width .. mapSize.height)
 	
 	for i=1,mapSize.height do
 		canPassGrid[i] = {}
 		for j=1,mapSize.width do
 			canPassGrid[i][j] = 0
 		end
 	end

 	for i=0, mapSize.height-1 do
 		for j=0, mapSize.width-1 do
 			local sp = wayLayer:getTileAt(cc.p(j,i))   
            if sp then
 				local x = sp:getPositionX()
                local y = sp:getPositionY()
                local col = math.floor(x/TILEDWIDTH);  
                local row = math.floor(y/TILEDHEIGHT);  
                -- print(i .. "  " .. j)
                canPassGrid[row][col] = true;
                self.wayLayerPass_vector[#self.wayLayerPass_vector+1] = {x = x,y = y} 
            end 
 		end
 	end
 	
end

function GameBaseScene:initLandLayerFromMap()
	landLayer = map:getLayer("land")
	-- print(landLayer)
end

function GameBaseScene:initRandomAskEvent()
-- 	TAX_REBATES_TAG = 1; --政府鼓励投资，返还税金10000
-- PAY_TAXES_TAG = 2; --政府严查账务，补交税金20000
-- LOSS_STRENGTH_TAG =3;--喝到假酒，上吐下泻，体力耗光
-- PHYSICAL_RECOVERY_TAG =4;--吃了大补丸，体力恢复
-- INVESTMENT_DIVIDENDS_TAG = 5 ;--投资获利，分红20000
-- INVESTMENT_LOSS_TAG = 6; --投资失败，亏损30000
	table.insert(randomAskEvents, TAX_REBATES_TAG, "The government encourages investment, tax rebates 10000")
	table.insert(randomAskEvents, PAY_TAXES_TAG, "Government scrutiny of accounts, pay taxes 20000")
	table.insert(randomAskEvents, LOSS_STRENGTH_TAG, "To drink alcohol, diarrhea, loss of light strength")
	table.insert(randomAskEvents, PHYSICAL_RECOVERY_TAG, "Eat cake, physical recovery")
	table.insert(randomAskEvents, INVESTMENT_DIVIDENDS_TAG, "Investment profits, dividends 20000")
	table.insert(randomAskEvents, INVESTMENT_LOSS_TAG, "Investment failure, loss 30000")
end

function GameBaseScene:addGoButton()
	local menu = display.newLayer()
	menu:setName("menu")
	self:addChild(menu)

	local images = {
        normal = "map/go_normal.png",
        pressed = "map/go_press.png",
    }
    cc.ui.UIPushButton.new(images, {scale9 = true})
        :onButtonClicked(function(event)
            self:goButtonCallback()
        end)
        :pos(tableStartPosition_x+2*tableWidth,tableStartPosition_y-tableHeight*6)
        :addTo(menu)

end

function GameBaseScene:goButtonCallback()
	local player = self:getChildByName("player1")
	if player then
		math.newrandomseed()
		local stepsCount = math.random(6)
		local path = RouteNavigation:getPath(player, stepsCount, canPassGrid, tiledColsCount, tiledRowsCount)
		player:startGo(path) 
	end

	local event = cc.EventCustom:new("MSG_GO_HIDE_TAG")
	event.value = "event.value"
	cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
end

function GameBaseScene:registerNotificationObserver()
	local evl = cc.EventListenerCustom:create("MSG_GO_HIDE_TAG", handler(self, self.receivedNotificationOMsg) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl,1)

	evl = cc.EventListenerCustom:create("MSG_GO_SHOW_TAG", handler(self, self.receivedNotificationOMsg) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl,1)

    evl = cc.EventListenerCustom:create("MSG_BUY", handler(self, self.receivedNotificationOMsg) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl,1)

	evl = cc.EventListenerCustom:create("MSG_PAY_TOLLS", handler(self, self.receivedNotificationOMsg) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl,1)

	evl = cc.EventListenerCustom:create("MSG_RANDOM_ASK_EVENT_TAG", handler(self, self.receivedNotificationOMsg) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl,1)

	evl = cc.EventListenerCustom:create("MSG_BLOCK_WAY_EVENT", handler(self, self.receivedNotificationOMsg) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl,1)

    evl = cc.EventListenerCustom:create("MSG_REST", handler(self, self.receivedNotificationOMsg) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl, 1)

end

function GameBaseScene:initItemSprite()
	self.Item_crab = Item_crab.new()
	self.Item_crab:setAnchorPoint(0,0)
	self:addChild(self.Item_crab)

	local moveAnimate = cca.animate(display.getAnimationCache("normal_crab_animation"))
	local repeate = cc.RepeatForever:create(moveAnimate)

	self.Item_crab:runAction(repeate)

	self.Item_emergency = Item_emergency.new()
	self.Item_emergency:setAnchorPoint(0,0)
	self.Item_emergency:setVisible(false)
	self:addChild(self.Item_emergency)

	self:updateBlockWaySprites()
end

function GameBaseScene:registerBlockWaySchedule()
	scheduler.scheduleGlobal(handler(self, self.updateBlockWaySprites), 5)
end

function GameBaseScene:updateBlockWaySprites()
	-- print("GameBaseScene:updateBlockWaySprites()")
	math.newrandomseed()
	local randomNumber = math.random(#self.wayLayerPass_vector)
	local x = self.wayLayerPass_vector[randomNumber].x
	local y = self.wayLayerPass_vector[randomNumber].y

	self.Item_crab:setPosition(x-5,y)

end

function GameBaseScene:receivedNotificationOMsg(event)
	-- print("receivedNotificationOMsg ".. event:getEventName() )
	if event:getEventName() == "MSG_GO_HIDE_TAG" then
		self:getChildByName("menu"):setVisible(false)
	elseif event:getEventName() == "MSG_GO_SHOW_TAG" then
		self:getChildByName("menu"):setVisible(true)
	elseif event:getEventName() == "MSG_BUY" then
		if event.player.name == "player1" then
			if event.buyTag == MSG_BUY_BLANK_TAG then
				local dialog = PopupLayer:create("Buy Land","buy the land？",handler(self,self.buyLandCallback),
				event.buyTag, event.x, event.y, self.foot1Sprite, event.level, event.player, PLAYER1_1_PARTICLE_PLIST)
				self:addChild(dialog)
			else
				local dialog = PopupLayer:create("Upgrade building","Upgrade building？",handler(self,self.buyLandCallback),
				event.buyTag, event.x, event.y, self.foot1Sprite, event.level, event.player, PLAYER1_1_PARTICLE_PLIST)
				self:addChild(dialog)
			end

		elseif event.player.name == "player2" then
			self:buyLand(event.buyTag, event.x, event.y, self.foot2Sprite, event.level, event.player, PLAYER2_1_PARTICLE_PLIST)
			RicherGameController:pickOnePlayerToGo()
		end
	elseif event:getEventName() == "MSG_PAY_TOLLS" then
		print("receivedNotificationOMsg MSG_PAY_TOLLS........." .. event.payTag)
        self:payTolls(event.payTag, event.x, event.y, event.player)
        RicherGameController:pickOnePlayerToGo()
	elseif event:getEventName() == "MSG_RANDOM_ASK_EVENT_TAG" then
		self:doRandomAskEvent(event.player)
		scheduler.performWithDelayGlobal(handler(RicherGameController:shareInstance(),
												 RicherGameController.aroundLandEvent), 
										 TOAST_SHOW_TIME)

	elseif event:getEventName() == "MSG_BLOCK_WAY_EVENT" then
		self:doBlockWayEvent(event.player)

	elseif event:getEventName() == "MSG_REST" then
		event.player.isMyTurn = false
		RicherGameController:pickOnePlayerToGo()
	end
end

function GameBaseScene:drawPathColor(path)
	for i=2,#path do
		local y = path[i].row * TILEDHEIGHT
		local x = path[i].col * TILEDWIDTH
		pathMarks[i-1]:setPosition(x, y)
		pathMarks[i-1]:setVisible(true)
	end
end

function GameBaseScene:doSomeForParticle()
	self.landFadeOut = cc.FadeOut:create(0.1) 
	self.landFadeIn = cc.FadeIn:create(0.1) 
	self.landFadeOut:retain()
	self.landFadeIn:retain()

	self.scaleby1ForBuyLand = cc.ScaleBy:create(0.1, 1.5)
	self.scaleby2ForBuyLand = cc.ScaleBy:create(0.5, 0.7) 
	self.scaleby1ForBuyLand:retain()
	self.scaleby2ForBuyLand:retain()

	self.foot1Sprite = display.newSprite(PLAYER1_1_PARTICLE_PNG)
	self:addChild(self.foot1Sprite)
	self.foot1Sprite:setAnchorPoint(0,0)

	self.foot2Sprite = display.newSprite(PLAYER2_1_PARTICLE_PNG)
	self:addChild(self.foot2Sprite)
	self.foot2Sprite:setAnchorPoint(0,0)

	self.starFish1Sprite = display.newSprite(PLAYER1_2_PARTICLE_PNG)
	self:addChild(self.starFish1Sprite)
	self.starFish1Sprite:setAnchorPoint(0,0)

	self.starFish2Sprite = display.newSprite(PLAYER2_2_PARTICLE_PNG)
	self:addChild(self.starFish2Sprite)
	self.starFish2Sprite:setAnchorPoint(0,0)

	self.heart1Sprite = display.newSprite(PLAYER1_3_PARTICLE_PNG)
	self:addChild(self.heart1Sprite)
	self.heart1Sprite:setAnchorPoint(0,0)

	self.heart2Sprite = display.newSprite(PLAYER2_3_PARTICLE_PNG)
	self:addChild(self.heart2Sprite)
	self.heart2Sprite:setAnchorPoint(0,0)
end

function GameBaseScene:payTolls(payTag, x, y, player)
	local money = 0
	if payTag == MSG_PAY_TOLLS_1_TAG then
		money = LAND_BLANK_MONEY
	elseif payTag == MSG_PAY_TOLLS_2_TAG then
		money = LAND_LEVEL_1_MONEY
	elseif payTag == MSG_PAY_TOLLS_3_TAG then
		money = LAND_LEVEL_2_MONEY
	end

	local col, row = Util:xy2coordinate(x, y, map)
	local sp = landLayer:getTileAt(cc.p(col, row))
	if sp then
		sp:runAction(cc.Sequence:create(self.landFadeOut, self.landFadeIn, null))
		local toast = Toast:create("-".. money, 0.6, x, y)
		self:addChild(toast)
		toast:play()
		if player.name == "player1" then
			local toast2 = Toast:create("+".. money, 0.6, players[2]:getPositionX() , players[2]:getPositionY())
			self:addChild(toast2)
			toast2:play()
		elseif player.name == "player2" then
			local toast2 = Toast:create("+".. money, 0.6, players[1]:getPositionX() , players[1]:getPositionY())
			self:addChild(toast2)
			toast2:play()
		end
	end

end

function GameBaseScene:buyLandCallback(buyTag, x, y, landSprite, landlevel, player, particlelistName, dialogResult)
	if dialogResult == Btn_OK_TAG then
	self:buyLand(buyTag, x, y, landSprite, landlevel, player, particlelistName, tag)
	end

	scheduler.performWithDelayGlobal(handler(RicherGameController:shareInstance(),
											 RicherGameController.pickOnePlayerToGo), 
									 0.8)
	
end

function GameBaseScene:buyLand(buyTag, x, y, landSprite, landlevel, player, particlelistName)
	local money = 0

	if buyTag == MSG_BUY_BLANK_TAG then
		money = LAND_BLANK_MONEY
	elseif buyTag == MSG_BUY_LAND_1_TAG then
		money = LAND_LEVEL_1_MONEY
	elseif buyTag == MSG_BUY_LAND_2_TAG then
		money = LAND_LEVEL_2_MONEY
	end

	landSprite:setPositionX(x)
	landSprite:setPositionY(y)
	landSprite:setVisible(true)

	local col, row = Util:xy2coordinate(x,y,map)
	-- print("GameBaseScene:buyLand: " .. col .. " " .. row)
	local actions = cc.Sequence:create(self.scaleby1ForBuyLand,self.scaleby2ForBuyLand ,cc.CallFunc:create(function()
									   	self:playParticle(x, y, particlelistName)
									   	landSprite:setVisible(false)
									   	landLayer:setTileGID(landlevel,cc.p(col,row))
									   	end), null)
	landSprite:runAction(actions)

	-- if player.name == "player1" then
	-- 	player.restTimes = 2
	-- end
		self.Item_emergency:setPosition(700, y)
		self.Item_emergency:setVisible(true)

		local emergencyGo = cca.animate(display.getAnimationCache("car_go_animation"))
		local emergencyStop = cca.animate(display.getAnimationCache("car_stop_animation"))

		local move1 = cca.moveTo(1, x, y)
		local repeat1 = cca.rep(emergencyGo, 1)
		local moveStep1 = cca.spawn(move1, repeat1,null)

		local move2 = cca.moveTo(1, -60, y)
		local repeat2 = cca.rep(emergencyStop, 1)
		local moveStep2 = cca.spawn(move2, repeat2, null)

		local actions = cc.Sequence:create(moveStep1 , moveStep2, null)
		self.Item_emergency:runAction(actions)
	
end

function GameBaseScene:doRandomAskEvent(player)
	print("GameBaseScene:doRandomAskEvent(player)" .. randomAskEvents[TAX_REBATES_TAG])
	math.newrandomseed()

	local randomNumber = math.random(#randomAskEvents)


	if randomNumber == TAX_REBATES_TAG then

	elseif randomNumber == PAY_TAXES_TAG then

	elseif randomNumber == LOSS_STRENGTH_TAG then

	elseif randomNumber == PHYSICAL_RECOVERY_TAG then

	elseif randomNumber == INVESTMENT_DIVIDENDS_TAG then

	elseif randomNumber == INVESTMENT_LOSS_TAG then
			
	end

	local toast = Toast:create(randomAskEvents[randomNumber], 0.6, display.cx, display.cy)
	self:addChild(toast)
	toast:play()
	
end

function GameBaseScene:doBlockWayEvent(player)
	
	local x = self.Item_crab:getPositionX() + tiledWidth/2
	local y = self.Item_crab:getPositionY() + tiledHeight/2

	print("GameBaseScene:doBlockWayEvent()" .. x .. y)
	if cc.rectContainsPoint(player:getBoundingBox(), cc.p(x,y) ) then
		print("cc.rectContainsPoint(player:getBoundingBox(), cc.p(self.Item_crab:getPosition()) )")
		player.restTimes = 2

		self.Item_emergency:setVisible(true)

		local emergencyGo = cca.animate(display.getAnimationCache("car_go_animation"))
		local emergencyStop = cca.animate(display.getAnimationCache("car_stop_animation"))

		local move1 = cca.moveTo(1, player.x, player.y)
		local repeat1 = cca.rep(emergencyGo, 5)
		local moveStep1 = cca.spawn(move1, repeat1)

		local move2 = cca.moveTo(1, -60, player.y)
		local repeat2 = cca.rep(emergencyGo, 5)
		local moveStep2 = cca.spawn(move2, repeat2)

		self.Item_emergency:runAction(cca.seq(moveStep1, moveStep2, null))




		RicherGameController:pickOnePlayerToGo()
	else
		local event = cc.EventCustom:new("MSG_HANDLE_PROP_EVENT")
		cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
	end
	
end

function GameBaseScene:displayArea()

end

function GameBaseScene:playParticle(x, y, plistName)
	-- print("plistName " .. plistName)
	local particleSystem_foot = cc.ParticleSystemQuad:create(plistName)
	particleSystem_foot:retain()
	local batch = cc.ParticleBatchNode:createWithTexture(particleSystem_foot:getTexture())
	batch:addChild(particleSystem_foot)
	self:addChild(batch)

	particleSystem_foot:setPosition(x+TILEDWIDTH/2, y+TILEDHEIGHT/2)
	particleSystem_foot:release()
	particleSystem_foot:setAutoRemoveOnFinish(true)
end


return GameBaseScene
local GameBaseScene = import("app.scenes.GameScene.GameBaseScene")

local RouteNavigation = import("app.RouteNavigation")

local instance = nil

RicherGameController = class("RicherGameController", function()
	return {}
end)

function RicherGameController:ctor()
	self:registerNotificationObserver()
end

function RicherGameController:shareInstance()
	if instance == nil then
		instance = RicherGameController.new()
	end

	return instance

end

function RicherGameController:startRealGo(path,player)
	self.stepHasGone = 1
	self.currentPath = path
	self.player = player
	self:moveOneStep(player)
end

function RicherGameController:moveOneStep(player)
	-- print("self.stepHasGone : " .. self.stepHasGone)
	-- print("currentPathRow : " .. self.currentPath[self.stepHasGone].row .. " currentPathCol : " .. self.currentPath[self.stepHasGone].col)
	local nextRow = self.currentPath[self.stepHasGone].row - self.currentPath[self.stepHasGone+1].row
	local nextCol = self.currentPath[self.stepHasGone].col - self.currentPath[self.stepHasGone+1].col
	-- print("nextRow : " .. nextRow .. " nextCol : " .. nextCol)

	local moveAnimate = nil

	if nextRow == -1 then
		moveAnimate = cca.animate(display.getAnimationCache("player" .. self.player.tag .. "up"))
	elseif nextRow == 1 then
		moveAnimate = cca.animate(display.getAnimationCache("player" .. self.player.tag .. "down"))
	elseif nextCol == -1 then
		moveAnimate = cca.animate(display.getAnimationCache("player" .. self.player.tag .. "right"))
	elseif nextCol == 1 then
		moveAnimate = cca.animate(display.getAnimationCache("player" .. self.player.tag .. "left"))
	end

	local moveBy = cc.MoveBy:create(0.28, cc.p(-TILEDWIDTH*nextCol, -TILEDHEIGHT*nextRow))
	local repeate = cc.Repeat:create(moveAnimate,1)

	if nextRow == 0 and nextCol == 0 then
		return
	end

	self.callEndGoFunc = cc.CallFunc:create(handler(self, self.endGo))

	local actions = cc.Sequence:create(cc.Spawn:create(moveBy,repeate),self.callEndGoFunc,null)
	self.player:runAction(actions)
end

function RicherGameController:endGo()
	-- print(self.player.name)
	local pathMarks = GameBaseScene:getpathMarks()
	pathMarks[self.stepHasGone]:setVisible(false)
	self.stepHasGone = self.stepHasGone + 1
	if self.stepHasGone >= #self.currentPath then
		self.player.isMyTurn = false
		-- self:handlePropEvent()
		
		local event = cc.EventCustom:new("MSG_BLOCK_WAY_EVENT")
		event.player = self.player
		cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)


		return
	end
	self:moveOneStep()
end

function RicherGameController:handlePropEvent()
	local col = self.currentPath[self.stepHasGone].col
	local row = self.currentPath[self.stepHasGone].row
	local mapSize = wayLayer:getLayerSize()
	-- print("mapSize " .. mapSize.width .. " ".. mapSize.height)
	row = mapSize.height-1 - row
	print("wayLayer:getTileAt(cc.p(col, row)) " .. wayLayer:getTileGIDAt(cc.p(col, row)))

	local sp = wayLayer:getTileAt(cc.p(col, row))
	if sp and wayLayer:getTileGIDAt(cc.p(col, row)) == randomEvent_tiledID then
		local event = cc.EventCustom:new("MSG_RANDOM_ASK_EVENT_TAG")
		event.x , event.y= sp:getPosition()
		event.player = self.player
		cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
		return
	end


	self:aroundLandEvent()
end

function RicherGameController:aroundLandEvent()
	local col = self.currentPath[self.stepHasGone].col
	local row = self.currentPath[self.stepHasGone].row
	local mapSize = landLayer:getLayerSize()
	-- print("mapSize " .. mapSize.width .. " ".. mapSize.height)
	row = mapSize.height-1 - row
	-- print("position " .. col .. " ".. row)
	
	local positionAroundEnd = {}
	positionAroundEnd[1] = {col = col, row = row + 1} --up
	positionAroundEnd[2] = {col = col, row = row - 1} --down
	positionAroundEnd[3] = {col = col - 1, row = row} --left
	positionAroundEnd[4] = {col = col + 1, row = row} --right

	for i=1,4 do
		local sp = landLayer:getTileAt(cc.p(positionAroundEnd[i].col, positionAroundEnd[i].row)) 
		if sp then
			local spGid = landLayer:getTileGIDAt(cc.p(positionAroundEnd[i].col, positionAroundEnd[i].row))

			
			if spGid == blank_land_tiledID then
				if self.player.name == "player1" then
					local event = cc.EventCustom:new("MSG_BUY")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.level = player1_building_1_tiledID
					event.buyTag = MSG_BUY_BLANK_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return 
				elseif self.player.name == "player2" then
					local event = cc.EventCustom:new("MSG_BUY")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.level = player2_building_1_tiledID
					event.buyTag = MSG_BUY_BLANK_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return 
				end

			elseif spGid == player1_building_1_tiledID then
				if self.player.name == "player1" then
					local event = cc.EventCustom:new("MSG_BUY")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.level = player1_building_2_tiledID
					event.buyTag = MSG_BUY_LAND_1_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return 
				elseif self.player.name == "player2" then
					local event = cc.EventCustom:new("MSG_PAY_TOLLS")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.payTag = MSG_PAY_TOLLS_1_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return
				end

			elseif spGid == player1_building_2_tiledID then
				if self.player.name == "player1" then
					local event = cc.EventCustom:new("MSG_BUY")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.level = player1_building_3_tiledID
					event.buyTag = MSG_BUY_LAND_2_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return 
				elseif self.player.name == "player2" then
					local event = cc.EventCustom:new("MSG_PAY_TOLLS")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.payTag = MSG_PAY_TOLLS_2_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return
				end

			elseif spGid == player1_building_3_tiledID then
				if self.player.name == "player1" then
					self:pickOnePlayerToGo()
					return
				elseif self.player.name == "player2" then
					local event = cc.EventCustom:new("MSG_PAY_TOLLS")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.payTag = MSG_PAY_TOLLS_3_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					self:pickOnePlayerToGo()
					return
				end

			elseif spGid == player2_building_1_tiledID then
				if self.player.name == "player1" then
					local event = cc.EventCustom:new("MSG_PAY_TOLLS")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.payTag = MSG_PAY_TOLLS_1_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return
				elseif self.player.name == "player2" then
					local event = cc.EventCustom:new("MSG_BUY")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.level = player2_building_2_tiledID
					event.buyTag = MSG_BUY_LAND_1_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return 
				end

			elseif spGid == player2_building_2_tiledID then
				if self.player.name == "player1" then
					local event = cc.EventCustom:new("MSG_PAY_TOLLS")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.payTag = MSG_PAY_TOLLS_2_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return
				elseif self.player.name == "player2" then
					local event = cc.EventCustom:new("MSG_BUY")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.level = player2_building_3_tiledID
					event.buyTag = MSG_BUY_LAND_2_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return 
				end
			
			elseif spGid == player2_building_3_tiledID then
				if self.player.name == "player1" then
					local event = cc.EventCustom:new("MSG_PAY_TOLLS")
					event.x , event.y= sp:getPosition()
					event.player = self.player
					event.payTag = MSG_PAY_TOLLS_3_TAG
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					self:pickOnePlayerToGo()
					return
				elseif self.player.name == "player2" then
					self:pickOnePlayerToGo()
					return
				end
			end	
		end
	end
end

function RicherGameController:pickOnePlayerToGo()
	local players = GameBaseScene:getPlayers()
	local canPassGrid = GameBaseScene:getcanPassGrid()
	-- print("···........."..tiledColsCount..tiledRowsCount)
	for i=1,#players do
		if players[i].isMyTurn == true then

			if players[i].restTimes == 0 then
				if players[i].name == "player1" then
					local event = cc.EventCustom:new("MSG_GO_SHOW_TAG")
					cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
					return
				end
				math.newrandomseed()
				local stepsCount = math.random(6)
				local path = RouteNavigation:getPath(players[i], stepsCount, canPassGrid, tiledColsCount, tiledRowsCount)
				players[i]:startGo(path)
				return
			elseif players[i].restTimes > 0 then
				local event = cc.EventCustom:new("MSG_REST")
				event.player = players[i]
				cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
				players[i].restTimes = players[i].restTimes - 1
				return
			end

		end
	end

	-- for i=1,#players do
	-- 	players[i].isMyTurn = true
	-- end
	self:resetPlayerGoTurn()

	-- local event = cc.EventCustom:new("MSG_GO_SHOW_TAG")
	-- cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
end

function RicherGameController:resetPlayerGoTurn()
	for i=1,#players do
		players[i].isMyTurn = true
	end
	self:pickOnePlayerToGo()
end

function RicherGameController:registerNotificationObserver()
	local evl = cc.EventListenerCustom:create("MSG_HANDLE_PROP_EVENT", handler(self, self.handlePropEvent) )
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(evl,1)
end

return RicherGameController
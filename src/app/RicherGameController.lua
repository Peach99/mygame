local GameBaseScene = import("app.scenes.GameScene.GameBaseScene")

local RouteNavigation = import("app.RouteNavigation")

local instance = nil

RicherGameController = class("RicherGameController", function()
	return {}
end)

function RicherGameController:ctor()
	-- cc(self):addComponent("components.behavior.EventProtocol"):exportMethods()
	-- self:addEventListener("MSG_GO_SHOW_TAG",handler(GameBaseScene,GameBaseScene.receivedMsgForGo) ,{value = MSG_GO_SHOW_TAG})
	-- local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
 --    local customListenerBg = cc.EventListenerCustom:create("goButtonCallback",
 --                                handler(self, self.startRealGo))
 --    eventDispatcher:addEventListenerWithFixedPriority(customListenerBg, 1)
	-- print("RicherGameController:ctor()")
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

	local moveAnimate = {}

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
		print(GameBaseScene.name)
		self.player.isMyTurn = false
		self:handlePropEvent()
		-- self:pickOnePlayerToGo()
		return
	end
	self:moveOneStep()
end

function RicherGameController:handlePropEvent()
	local col = self.currentPath[self.stepHasGone].col
	local row = self.currentPath[self.stepHasGone].row
	local mapSize = landLayer:getLayerSize()
	print("mapSize " .. mapSize.width .. " ".. mapSize.height)
	row = mapSize.height-1 - row
	print("position " .. col .. " ".. row)
	
	local positionAroundEnd = {}
	positionAroundEnd[1] = {col = col, row = row + 1} --up
	positionAroundEnd[2] = {col = col, row = row - 1} --down
	positionAroundEnd[3] = {col = col - 1, row = row} --left
	positionAroundEnd[4] = {col = col + 1, row = row} --right

	for i=1,4 do
		local sp = landLayer:getTileGIDAt(cc.p(positionAroundEnd[i].col, positionAroundEnd[i].row)) 
		if sp == 1 then
			sp = landLayer:getTileAt(cc.p(positionAroundEnd[i].col, positionAroundEnd[i].row))
			-- print("landLayer:getTileGIDAt: " .. positionAroundEnd[i].col .." ".. positionAroundEnd[i].row)

			local event = cc.EventCustom:new("MSG_BUY")
			event.buyTag = MSG_BUY_BLANK_TAG
			event.x = sp:getPositionX()
			event.y = sp:getPositionY()
			event.player = self.player

			cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
		end
	end

end

function RicherGameController:pickOnePlayerToGo()
	local players = GameBaseScene:getPlayers()
	for i=1,#players do
		if players[i].isMyTurn == true then
			math.newrandomseed()
			local stepsCount = math.random(6)
			local path = RouteNavigation:getPath(players[i], 5, GameBaseScene:getcanPassGrid(), 22, 22)
			players[i]:startGo(path)
			-- print("pickOnePlayerToGo")
			return
		end
	end

	for i=1,#players do
		players[i].isMyTurn = true
	end
	-- self:dispatchEvent({name = "MSG_GO_SHOW_TAG"})
	local event = cc.EventCustom:new("MSG_GO_SHOW_TAG")
	cc.Director:getInstance():getEventDispatcher():dispatchEvent(event)
end

function RicherGameController:registerNotificationObserver()

end

return RicherGameController
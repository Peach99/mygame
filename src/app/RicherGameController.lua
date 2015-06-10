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

	self.callEndGoFunc = cc.CallFunc:create(function()
		-- print(self.player.name)
		local pathMarks = GameBaseScene:getpathMarks()
		pathMarks[self.stepHasGone]:setVisible(false)
		self.stepHasGone = self.stepHasGone + 1
		if self.stepHasGone >= #self.currentPath then
			self.player.isMyTurn = false
			self:pickOnePlayerToGo()
			return
		end
		self:moveOneStep()
	end)

	local actions = cc.Sequence:create(cc.Spawn:create(moveBy,repeate),self.callEndGoFunc,null)
	self.player:runAction(actions)
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
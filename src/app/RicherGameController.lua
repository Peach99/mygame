local GameBaseScene = import("app.scenes.GameScene.GameBaseScene")

local RouteNavigation = import("app.RouteNavigation")

-- local instance = nil

RicherGameController = class("RicherGameController", function()
	return {}
end)

function RicherGameController:ctor()
	-- local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
 --    local customListenerBg = cc.EventListenerCustom:create("goButtonCallback",
 --                                handler(self, self.startRealGo))
 --    eventDispatcher:addEventListenerWithFixedPriority(customListenerBg, 1)
	-- print("RicherGameController:ctor()")
end

function RicherGameController:startRealGo(path,player)
	self.stepHasGone = 1
	self.currentPath = path
	self.player = player
	self:moveOneStep(player)
end

function RicherGameController:moveOneStep(player)
	print("self.stepHasGone : " .. self.stepHasGone)
	-- print("currentPathRow : " .. self.currentPath[self.stepHasGone].row .. " currentPathCol : " .. self.currentPath[self.stepHasGone].col)
	local nextRow = self.currentPath[self.stepHasGone].row - self.currentPath[self.stepHasGone+1].row
	local nextCol = self.currentPath[self.stepHasGone].col - self.currentPath[self.stepHasGone+1].col
	-- print("nextRow : " .. nextRow .. " nextCol : " .. nextCol)

	local moveAnimate = {}

	if nextRow == -1 then
		moveAnimate = cca.animate(display.getAnimationCache(self.player.name .. "up"))
	elseif nextRow == 1 then
		moveAnimate = cca.animate(display.getAnimationCache(self.player.name .. "down"))
	elseif nextCol == -1 then
		moveAnimate = cca.animate(display.getAnimationCache(self.player.name .. "right"))
	elseif nextCol == 1 then
		moveAnimate = cca.animate(display.getAnimationCache(self.player.name .. "left"))
	end

	local moveBy = cc.MoveBy:create(0.28, cc.p(-TILEDWIDTH*nextCol, -TILEDHEIGHT*nextRow))
	local repeate = cc.Repeat:create(moveAnimate,1)

	if nextRow == 0 and nextCol == 0 then
		return
	end

	self.callEndGoFunc = cc.CallFunc:create(function()
		print(self.player.name)
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
			print("pickOnePlayerToGo")
			return
		end
	end

	for i=1,#players do
		players[i].isMyTurn = true
	end

end

function RicherGameController:registerNotificationObserver()

end

return RicherGameController
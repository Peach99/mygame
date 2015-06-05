local RicherGameController = class("RicherGameController", function()
	return {}
end)

function RicherGameController:ctor()
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

	local callEndGoFunc = cc.CallFunc:create(function()
		self.stepHasGone = self.stepHasGone + 1
		if self.stepHasGone >= #self.currentPath then
			return
		end
		self:moveOneStep()
	end)

	local actions = cc.Sequence:create(cc.Spawn:create(moveBy,repeate),callEndGoFunc,null)
	self.player:runAction(actions)
end

function RicherGameController:pickOnePlayerToGo()
	
end



return RicherGameController
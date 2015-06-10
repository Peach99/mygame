local RicherPlayer = class("RicherPlayer", function(params)
	-- char* name, int tag,bool enemy,int money=200000,int strength=100
	return display.newSprite()
end)

function RicherPlayer:ctor(params)
	self.name = params.name
	self.tag = params.tag
	self.enemy = params.enemy
	self.money = params.money
	self.strength = params.strength
	self.isMyTurn = params.turn
	self:addPlayerAnimation()

end

function RicherPlayer:addPlayerAnimation()
	if self.tag == 1 then
		display.addSpriteFrames(PLAYER1_ANIM_PLIST, PLAYER1_ANIM_PNG)
	end

	if self.tag == 2 then
		display.addSpriteFrames(PLAYER2_ANIM_PLIST, PLAYER2_ANIM_PNG)
	end

	local frameName = "player" .. self.tag .. "_anim_%02d.png"

	local leftFrames = display.newFrames(frameName, 1, 4)
	local leftAnimation = display.newAnimation(leftFrames, 0.1)
	display.setAnimationCache("player" .. self.tag .. "left", leftAnimation)

	local rightFrames = display.newFrames(frameName, 5, 4)
	local rightAnimation = display.newAnimation(rightFrames, 0.1)
	display.setAnimationCache("player" .. self.tag .. "right", rightAnimation)

	local downFrames = display.newFrames(frameName, 9, 4)
	local downAnimation = display.newAnimation(downFrames, 0.1)
	display.setAnimationCache("player" .. self.tag .. "down", downAnimation)

	local upFrames = display.newFrames(frameName, 13, 4)
	local upFnimation = display.newAnimation(upFrames, 0.1)
	display.setAnimationCache("player" .. self.tag .. "up", upFnimation)

	-- self.goLeft = cca.animate(display.getAnimationCache("player1left"))  
	-- self.goRight = cca.animate(display.getAnimationCache("player1right"))
	-- self.goUp = cca.animate(display.getAnimationCache("player1up"))
	-- self.goDown = cca.animate(display.getAnimationCache("player1down"))
	
	-- self:runAction(cca.repeatForever(self.goRight))
	self:setSpriteFrame(leftFrames[1])
end

function RicherPlayer:startGo(path)
	for i=1,#path do
		print("path : row = " .. path[i].row .. " col =  ".. path[i].col )
	end
	self:getParent():drawPathColor(path)
	RicherGameController:shareInstance():startRealGo(path, self)
end



return RicherPlayer 
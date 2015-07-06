--
-- Author: Your Name
-- Date: 2015-07-01 14:58:02
--
local Item_emergency = class("Item_emergency",function()
	return display.newSprite()
end)

function Item_emergency:ctor()
	print("Item_emergency:ctor()")
	self:addItemSpriteFrameCache()
	self:setItemAnimate()
end

function Item_emergency:onEnter()
end

function Item_emergency:onExit()
end

function Item_emergency:addItemSpriteFrameCache()
	display.addSpriteFrames("images/car.plist","images/car.png")

	local goFrames = display.newFrames("car_%02d.png", 1, 2)
	local goAnimation = display.newAnimation(goFrames, 0.1)
	display.setAnimationCache("car_go_animation", goAnimation)

	local stopFrames = display.newFrames("car_%02d.png", 3, 2)
	local stopAnimation = display.newAnimation(stopFrames, 0.5)
	display.setAnimationCache("car_stop_animation", stopAnimation)

	self:setSpriteFrame(goFrames[1])
end

function Item_emergency:setItemAnimate()


end

return Item_emergency
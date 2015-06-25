local Item_crab = class("Item_crab",function()
	return display.newSprite()
end)

function Item_crab:ctor()
	print("Item_crab:ctor()")
	self:addItemSpriteFrameCache()
	-- self:setSpriteFrame("crab_01.png")
	self:setItemAnimate()
end

function Item_crab:onEnter()
end

function Item_crab:onExit()
end

function Item_crab:addItemSpriteFrameCache()
	display.addSpriteFrames("images/crab.plist","images/crab.png")
	local normalFrames = display.newFrames("crab_%02d.png", 1, 4)
	local normalAnimation = display.newAnimation(normalFrames, 0.5)
	display.setAnimationCache("normal_crab_animation", normalAnimation)
	self:setSpriteFrame(normalFrames[1])
end

function Item_crab:setItemAnimate()


end

return Item_crab
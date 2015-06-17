local Toast = class("Toast", function()
	return display.newNode()
end) 

function Toast:ctor()
end

function Toast:create(text, time, x, y)
	print("Toast:create()")
	self = Toast.new()
	
	self.label = display.newTTFLabel({
	    text = text,
	    font = "Arial",
	    size = 24,
	    color = cc.c3b(255, 0, 0)
	})
	self.label:ignoreAnchorPointForPosition(false) 
	self.label:setAnchorPoint(0,0)

	self.back = cc.LayerColor:create(cc.c4b(100,100,100,255))
	self.back:setContentSize(self.label:getContentSize())
	self.back:ignoreAnchorPointForPosition(false)  
	self.back:setAnchorPoint(0,0)

	self.back:setPosition(x, y)
	self.label:setPosition(x, y)
	
	self:addChild(self.back)
	self:addChild(self.label)

	self.time = time

	return self
end

function Toast:onEnter()
end

function Toast:onExit()
end

function Toast:play()
	local moveUp = cc.MoveBy:create(self.time, cc.p(0, 50))
	local fadeIn = cc.FadeIn:create(self.time)
	local actionUp = cc.Spawn:create(moveUp, fadeIn)

	local moveDown = cc.MoveBy:create(self.time, cc.p(0, -50))
	local fadeOut = cc.FadeOut:create(self.time)
	local actionDown = cc.Spawn:create(moveDown, fadeOut)

	self.actionUpDown = cc.Sequence:create(actionUp, cc.DelayTime:create(0.5), actionDown, null)

	self.back:setOpacity(0)
	self.label:setOpacity(0)

	self.back:runAction(self.actionUpDown)
	self.label:runAction(cc.Sequence:create(self.actionUpDown:clone(), 
						 cc.CallFunc:create(handler(self,self.endPlay)), 
						 null))
end

function Toast:endPlay()
	print("Toast:endPlay()")
	self:removeSelf()
end

return Toast
Btn_OK_TAG = 1;
Btn_Cancel_TAG = 0;

local PopupLayer = class("PopupLayer", function ()
	return display.newLayer()
end)

function PopupLayer:ctor()

end

function PopupLayer:create(title ,contentText, callback, ...)
	local background =   DIALOG_BG
	self = PopupLayer.new()

	self.background = display.newSprite(background)
		:align(display.CENTER, display.cx,display.cy)
	self:addChild(self.background)


	self.title = display.newTTFLabel({
    text = title,
    font = "Marker Felt",
    size = 32,
    color = cc.c3b(0, 0, 0),
    align = cc.TEXT_ALIGNMENT_CENTER, -- 文字内部居中对齐
    x = display.cx,
    y = display.cy+70
	})
	self:addChild(self.title)


	self.contentText = display.newTTFLabel({
    text = contentText,
    font = "Marker Felt",
    size = 32,
    color = cc.c3b(0, 0, 0),
    align = cc.TEXT_ALIGNMENT_CENTER, -- 文字内部居中对齐
    x = display.cx,
    y = display.cy+20
	})
	self:addChild(self.contentText)

	self:addButton(Btn_OK_TAG)
	self:addButton(Btn_Cancel_TAG)
	self.callBack = callback
	self.params = {...}

	return self
end

function PopupLayer:addCallBack(callback)
	self.callBack = callback
end

function PopupLayer:addButton(tag)
	local textTTF = display.newTTFLabel({
	    text = text,
	    font = "Marker Felt",
	    size = 20,
	    align = cc.ui.TEXT_ALIGN_CENTER -- 文字内部居中对齐
	})

	if tag == Btn_OK_TAG then
	 	self.btnOK = cc.ui.UIPushButton.new(NORMAL_MENU, {scale9 = true})
    	self.btnOK:setButtonSize(100, 50)
    	textTTF:setString("OK")

    	
		self.btnOK:setButtonLabel(textTTF)
    	self.btnOK:onButtonPressed(function(event) event.target:setScale(1.2) end)
    	self.btnOK:onButtonRelease(function(event) event.target:setScale(1.0) end)
    	self.btnOK:onButtonClicked(function(event) 
    		table.insert(self.params, tag)
    		self.callBack(unpack(self.params)) self:removeSelf() 
    		end)
    	self.btnOK:align(display.CENTER, display.cx-100, display.cy-50)
    	self:addChild(self.btnOK)
	elseif tag == Btn_Cancel_TAG then
		self.btnCancel = cc.ui.UIPushButton.new(NORMAL_MENU, {scale9 = true})
    	self.btnCancel:setButtonSize(100, 50)
    	textTTF:setString("Cancel")
		self.btnCancel:setButtonLabel(textTTF)
    	self.btnCancel:onButtonPressed(function(event) event.target:setScale(1.2) end)
    	self.btnCancel:onButtonRelease(function(event) event.target:setScale(1.0) end)
    	self.btnCancel:onButtonClicked(function(event) 
    		table.insert(self.params, tag) 
    		self.callBack(unpack(self.params),tag) self:removeSelf() 
    		end)
    	self.btnCancel:align(display.CENTER, display.cx+100, display.cy-50)
    	self:addChild(self.btnCancel)
	end 
end

function PopupLayer:setTitle(title)
	self.title:setString(title)
end

function PopupLayer:setContentText(contentText)
	self.contentText:setString(contentText)
end

return PopupLayer

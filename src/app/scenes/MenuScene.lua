local MapChooseScene = import("app.scenes.MapChooseScene")

local MenuScene = class("MenuScene", function()
	return display.newScene("MenuScene")
end)

function MenuScene:ctor()
end

function MenuScene:onEnter()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, MenuScene", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)
    self:addBackgroundSprite()
    self:addMenuSprite()
end

function MenuScene:onExit()
end

function MenuScene:addBackgroundSprite()
	local menuSpriteLogo = display.newSprite(MENU_LOGO,CONFIG_SCREEN_WIDTH/2,CONFIG_SCREEN_HEIGHT)
	menuSpriteLogo:setAnchorPoint(0.5,1)
	menuSpriteLogo:setScale(0.6)
	self:addChild(menuSpriteLogo)

	local rainBowSprite = display.newSprite(RAINBOW,5,CONFIG_SCREEN_HEIGHT-20)
	rainBowSprite:setAnchorPoint(0,1)
	rainBowSprite:setScale(0.3)
	self:addChild(rainBowSprite)

	local rainBowMove = cc.MoveBy:create(1, cc.p(80,0))
	local rainBowMoveReverse = rainBowMove:reverse()
	local rainBowAction = cc.Sequence:create(rainBowMove,rainBowMoveReverse,NULL)
	rainBowSprite:runAction(cc.RepeatForever:create(rainBowAction))
end

function MenuScene:addMenuSprite()
	local btnNormal = ccui.Scale9Sprite:create(NORMAL_MENU)
	local btnPress = ccui.Scale9Sprite:create(PRESS_MENU)

	local singleGameTTF = display.newTTFLabel({
	    text = "singleGame",
	    font = "Marker Felt",
	    size = 20,
	    align = cc.ui.TEXT_ALIGN_CENTER -- 文字内部居中对齐
	})

    local singleGameBtn = cc.ui.UIPushButton.new(NORMAL_MENU, {scale9 = true})
    singleGameBtn:setButtonSize(200, 60)
	singleGameBtn:setButtonLabel(singleGameTTF)
    singleGameBtn:onButtonPressed(function(event)
        event.target:setScale(1.2)
    end)
    singleGameBtn:onButtonRelease(function(event)
        event.target:setScale(1.0)
    end)
    singleGameBtn:onButtonClicked(function(event)
    	-- app.currentSceneName_ = "CCSSample6Scene"
        -- app:enterNextScene(true)
        display.replaceScene(MapChooseScene.new())
    end)
    singleGameBtn:align(display.CENTER, display.cx, display.cy)
    self:addChild(singleGameBtn)

end

return MenuScene
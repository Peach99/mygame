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
	-- Sprite* menuSpriteLogo= Sprite::create(MENU_LOGO);
	-- menuSpriteLogo->setPosition(ccp(visibleSize.width/2,visibleSize.height));
	-- menuSpriteLogo->setAnchorPoint(ccp(0.5,1));
	-- menuSpriteLogo->setScale(0.6f);
	-- addChild(menuSpriteLogo);

	-- Sprite* rainBowSprite= Sprite::create(RAINBOW);
	-- rainBowSprite->setPosition(ccp(5,visibleSize.height-20));
	-- rainBowSprite->setAnchorPoint(ccp(0,1));
	-- rainBowSprite->setScale(0.3f);
	-- addChild(rainBowSprite);

	-- MoveBy* rainBowMove = MoveBy::create(1,ccp(8,0));
	-- MoveBy* rainBowMoveReverse = rainBowMove->reverse();
	-- Sequence* rainBowAction = Sequence::create(rainBowMove,rainBowMoveReverse,NULL);
	-- rainBowSprite->runAction(RepeatForever::create(rainBowAction));
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
	-- Scale9Sprite* btnNormal = Scale9Sprite::create(NORMAL_MENU);
	-- Scale9Sprite* btnPress = Scale9Sprite::create(PRESS_MENU);

	-- LabelTTF* singleGameTTF = LabelTTF::create(LanguageString::getInstance()->getLanguageString(SINGLE_GAME)->getCString() ,FONT_MENU,Btn_FontSize);
	-- ControlButton* singleGameBtn = ControlButton::create(singleGameTTF,btnNormal);
	-- singleGameBtn->setBackgroundSpriteForState(btnPress, Control::State::SELECTED);

	-- singleGameBtn->setPosition(ccp(visibleSize.width/2,visibleSize.height-180));
	-- singleGameBtn->setPreferredSize(Size(Btn_Width,Btn_Height));
	-- singleGameBtn->addTargetWithActionForControlEvents(this,cccontrol_selector(MenuScene::menuTouchDown),Control::EventType::TOUCH_DOWN);
	-- singleGameBtn->setTag(Btn_Single_Game_TAG);
	-- addChild(singleGameBtn);

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
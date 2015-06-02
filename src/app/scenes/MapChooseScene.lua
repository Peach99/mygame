local BeachScene = import("app.scenes.GameScene.BeachScene")

local MapChooseScene = class("MapChooseScene", function()
	return display.newScene("MapChooseScene")
end)

function MapChooseScene:ctor()
end

function MapChooseScene:onEnter()
	 self.pv = cc.ui.UIPageView.new {
        -- bgColor = cc.c4b(200, 200, 200, 120),
        -- bg = "sunset.png",
        -- viewRect = cc.rect(80, 80, CONFIG_SCREEN_WIDTH - 80, CONFIG_SCREEN_HEIGHT - 80),
        -- padding = {left = 20, right = 20, top = 20, bottom = 20},
        -- columnSpace = 10, rowSpace = 10
    	}
        :onTouch(handler(self, self.touchListener))
        :addTo(self)

	local beachSprite = display.newSprite(BEACH_ITEM,(CONFIG_SCREEN_WIDTH )/2,(CONFIG_SCREEN_HEIGHT )/2)
	local seaSprite = display.newSprite(SEA_ITEM,(CONFIG_SCREEN_WIDTH )/2,(CONFIG_SCREEN_HEIGHT )/2)
	local snowSprite = display.newSprite(SNOW_ITEM,(CONFIG_SCREEN_WIDTH )/2,(CONFIG_SCREEN_HEIGHT )/2)
-- 
    local item1 = self.pv:newItem()
    item1:addChild(beachSprite)
    self.pv:addItem(item1)    

    local item2 = self.pv:newItem()
    item2:addChild(seaSprite)
    self.pv:addItem(item2)  

    local item3 = self.pv:newItem()
    item3:addChild(snowSprite)
    self.pv:addItem(item3)      

    self.pv:reload()



    -- local sp2 = display.newScale9Sprite(BEACH_ITEM)
    -- sp2:setContentSize(300, 200)
    -- sp2:pos(720, 150)

    -- local sp3 = display.newScale9Sprite(SEA_ITEM)
    -- sp3:setContentSize(300, 200)
    -- sp3:pos(920, 150)

    -- local emptyNode = cc.Node:create()
    -- emptyNode:addChild(sp2)
    -- emptyNode:addChild(sp3)

    -- local bound = sp2:getBoundingBox()
    -- bound.width = 300
    -- bound.height = 200

    -- cc.ui.UIScrollView.new({viewRect = bound})
    --     :addScrollNode(emptyNode)
    --     :setDirection(cc.ui.UIScrollView.DIRECTION_HORIZONTAL)
    --     -- :onScroll(handler(self, self.scrollListener))
    --     :addTo(self)

end

function MapChooseScene:onExit()
end

function MapChooseScene:touchListener(event)
	dump(event, "event:")
    if event.name == "clicked" then
        print(event.name)
        display.replaceScene(BeachScene.new("BeachScene"))
    end
end

return MapChooseScene
local BeachScene = import("app.scenes.GameScene.BeachScene")

local MapChooseScene = class("MapChooseScene", function()
	return display.newScene("MapChooseScene")
end)

function MapChooseScene:ctor()
end

function MapChooseScene:onEnter()
    self:AddBackGround()
    self:AddCScrollView()

end

function MapChooseScene:onExit()
end

function MapChooseScene:AddBackGround()
    local background = display.newSprite(STAGE_BACKGROUND, display.cx, display.cy)
    self:addChild(background)
end

function MapChooseScene:AddCScrollView()
     self.pv = cc.ui.UIPageView.new {
        -- bgColor = cc.c4b(200, 200, 200, 120),
        -- bg = "sunset.png",
        -- viewRect = cc.rect(80, 80, CONFIG_SCREEN_WIDTH - 80, CONFIG_SCREEN_HEIGHT - 80),
        -- padding = {left = 20, right = 20, top = 20, bottom = 20},
        -- columnSpace = 10, rowSpace = 10
        }
    :onTouch(handler(self, self.touchListener))
    :addTo(self)

    local beachSprite = display.newSprite(BEACH_ITEM, display.cx, display.cy)
    local seaSprite = display.newSprite(SEA_ITEM, display.cx, display.cy)
    local snowSprite = display.newSprite(SNOW_ITEM, display.cx, display.cy)

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
end

function MapChooseScene:touchListener(event)
	dump(event, "event:")
    if event.name == "clicked" then
        print(event.name)
        display.replaceScene(BeachScene.new("BeachScene"),"fade")
    end
end

return MapChooseScene
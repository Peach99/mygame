local MenuScene = import("app.scenes.MenuScene")

local SplashScene = class("SplashScene", function()
    return display.newScene("SplashScene")
end)

function SplashScene:ctor()
end

function SplashScene:onEnter()
	-- print("SplashScene:onEnter")
	--     cc.ui.UILabel.new({
 --            UILabelType = 2, text = "Hello, World", size = 64})
 --        :align(display.CENTER, display.cx, display.cy)
 --        :addTo(self)
 	display.replaceScene(MenuScene.new())
end

function SplashScene:onExit()
end

return SplashScene
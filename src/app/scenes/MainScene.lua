local SplashScene = import("app.scenes.SplashScene")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
end

function MainScene:onEnter()
	display.replaceScene(SplashScene.new())
end

function MainScene:onExit()
end

return MainScene

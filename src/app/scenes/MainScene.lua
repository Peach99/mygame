local SplashScene = import("app.scenes.SplashScene")

local BeachScene = import("app.scenes.GameScene.BeachScene")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
end

function MainScene:onEnter()
	-- display.replaceScene(SplashScene.new())
	display.replaceScene(BeachScene.new("BeachScene"),"fade",0.9)
end

function MainScene:onExit()
end

return MainScene

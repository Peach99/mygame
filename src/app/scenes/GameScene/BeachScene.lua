local GameBaseScene = import("app.scenes.GameScene.GameBaseScene")

local BeachScene = class("BeachScene",GameBaseScene)

function BeachScene:ctor()
	BeachScene.super.ctor()
end

function BeachScene:onEnter()
end

function BeachScene:onExit()
end

return BeachScene
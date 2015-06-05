local GameBaseScene = import("app.scenes.GameScene.GameBaseScene")
local RicherPlayer = import("app.RicherPlayer")

local BeachScene = class("BeachScene",GameBaseScene)

function BeachScene:ctor()
	BeachScene.super.ctor(self)
end

function BeachScene:onEnter()
	self.name = "BeachScene"
	BeachScene.super.onEnter(self)
end
 
function BeachScene:onExit()
end

function BeachScene:addMap()
	print("map")
	self.map = cc.TMXTiledMap:create("map/beach.tmx")
	self:addChild(self.map)
end


return BeachScene
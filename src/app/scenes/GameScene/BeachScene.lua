local GameBaseScene = import("app.scenes.GameScene.GameBaseScene")
local RicherPlayer = import("app.RicherPlayer")

local BeachScene = class("BeachScene",GameBaseScene)

function BeachScene:ctor()
	BeachScene.super.ctor(self)
	tiledColsCount = 20;
	tiledRowsCount = 15;
	self:initPropTiledID()
end

function BeachScene:onEnter()
	self.name = "BeachScene"
	BeachScene.super.onEnter(self)
end
 
function BeachScene:onExit()
end

function BeachScene:addMap()
	print("BeachScene:addMap()")
	print(map.name)
	map = cc.TMXTiledMap:create("map/beach.tmx")
	self:addChild(map)
	map.name = "map/beach.tmx"
	print(map.name)
end

function BeachScene:initPropTiledID()
	 blank_land_tiledID   = 1;
	 strength_30_tiledID  = 4;
	 strength_50_tiledID  = 5;
	 strength_80_tiledID  = 6;

	 randomEvent_tiledID  = 7;
	 lottery_tiledID      = 8;
	 stock_tiledID        = 9;

	 player2_building_1_tiledID = 10;
	 player2_building_2_tiledID = 11;
	 player2_building_3_tiledID = 12;

	 player1_building_1_tiledID = 13;
	 player1_building_2_tiledID = 14;
	 player1_building_3_tiledID = 15;

	 map_level = 1;
	 saveJsonName = "beach_save.json";

end

return BeachScene
local GameBaseScene = import("app.scenes.GameScene.GameBaseScene")

local BeachScene = class("BeachScene",GameBaseScene)

function BeachScene:ctor()
	BeachScene.super.ctor(self)
end

function BeachScene:onEnter()
	self.name = "BeachScene"
	BeachScene.super.onEnter(self)
	self:setWayPassToGrid()
end

function BeachScene:onExit()
end

function BeachScene:addMap()
	print("map")
	self.map = cc.TMXTiledMap:create("map/beach.tmx")
	self:addChild(self.map)
end

function BeachScene:setWayPassToGrid()  
	-- TMXLayer* wayLayer = _map->layerNamed("way");//获取地图way图层  
  
 --    Size _mapSize = wayLayer->getLayerSize(); //获取way图层大小  
 --              -- 根据way图层，获取道路的坐标并转换成地图的行列值，设置canPassGrid相应的行列值为true，表示人物可以从这里通过  
 --               for (int j = 0;  j < _mapSize.width; j++) {    
 --        for (int i = 0;  i < _mapSize.height; i++) {    
 --                                    Sprite* _sp = wayLayer->tileAt(Point(j, i));    
 --                                     if (_sp)   
 --            {    
 --                                                            float x = _sp->getPositionX();  
 --                float y = _sp->getPositionY();  
 --                int col = x/tiledWidth;  
 --                int row = y/tiledHeight;  
 --                canPassGrid[row][col] = true;  
 --                log("canPassGrid row=  %d ,col =%d ,canpass = %d" ,row,col,canPassGrid[row][col]);  
 --            }    
              
 --        }    
 --    }    
 --    log("setWayPassToGrid finished");  

 	local wayLayer = self.map:getLayer("way")
 	local mapSize = wayLayer:getLayerSize()
 	print(mapSize.width .. mapSize.height)
 	print(wayLayer)

 	for i=0,mapSize.width-1 do
 		for j=0,mapSize.height-1 do
 			local sp = wayLayer:getTileAt(cc.p(i,j))   
            if sp then
             	print(sp)
            end 

 		end
 	end


end

return BeachScene
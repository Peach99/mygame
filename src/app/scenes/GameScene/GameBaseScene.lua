local GameBaseScene = class("GameBaseScene", function(name)
	print(name)
	return display.newScene(name)
end)

local tiledWidth = 32;
local tiledHeight = 32;

function GameBaseScene:ctor()
	self:addMap()
	self:drawTable(2)
	self:addPlayer()
	self:setWayPassToGrid()
end

function GameBaseScene:onEnter()
	print("GameBaseScene:onEnter")
	print(self.name)
end

function GameBaseScene:onExit()
end

function GameBaseScene:addMap()
	print("GameBaseScene:addMap")
end

function GameBaseScene:drawTable(playerNumber)
end

function GameBaseScene:addPlayer()
end

function GameBaseScene:setWayPassToGrid()  
 	local wayLayer = self.map:getLayer("way")
 	local mapSize = wayLayer:getLayerSize()
 	print(mapSize.width .. mapSize.height)
 	print(wayLayer)

 	self.canPassGrid = {}
 	for i=1,mapSize.height do
 		self.canPassGrid[i] = {}
 		for j=1,mapSize.width do
 			self.canPassGrid[i][j] = 0
 		end
 	end

 	for i=0,mapSize.width-1 do
 		for j=0,mapSize.height-1 do
 			local sp = wayLayer:getTileAt(cc.p(i,j))   
            if sp then
 				local x = sp:getPositionX()
                local y = sp:getPositionY()
                local col = math.floor(x/tiledWidth);  
                local row = math.floor(y/tiledHeight);  
                print(row .. "  " .. col)
                self.canPassGrid[row][col] = true;  
            end 
 		end
 	end
 	
end

return GameBaseScene
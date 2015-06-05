local RicherPlayer = import("app.RicherPlayer")

local RouteNavigation = import("app.RouteNavigation")

local GameBaseScene = class("GameBaseScene", function(name)
	print(name)
	return display.newScene(name)
end)

local tableStartPosition_x = 650;
local tableStartPosition_y = 450;
local tableWidth = 50;
local tableHeight = 40;
local tiledWidth = 32;
local tiledHeight = 32;
local FONT_SIZE = 20;

local Dialog_Size_Width = 400;
local Dialog_Size_Height = 220;

local Btn_OK_TAG = 1;
local Btn_Cancel_TAG = 0;
local stepSkillAnimaTime = 0.1;

local goButtonTag = 700;
local skillButtonTag = 701;
local skillStormTag = 702;
local skillStepTag = 703;
local skillTransferTag = 704;
local saveButtonTag = 705;
local audioButtonTag = 706;
local stepBaseTag = 800;
local step1_tag = stepBaseTag+1;
local step2_tag = stepBaseTag+2;
local step3_tag = stepBaseTag+3;
local step4_tag = stepBaseTag+4;
local step5_tag = stepBaseTag+5;
local step6_tag = stepBaseTag+6;


local skillSpriteCardWidth = 150;
local skillSpriteCardHeight = 100;

local Quit_OK_TAG = 801;
local Quit_Cancel_TAG = 802;

function GameBaseScene:ctor()
	self.wayLayerPass_vector = {}
	self.players = {}
	self:addMap()
	self:setWayPassToGrid()
	self:drawTable(2)
	self:addPlayer()
	self:addGoButton()
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
	local player = RicherPlayer.new(
	{
		name = "player1",
		tag = 1,
		enemy = 100,
		money = 100,
		strength = 100,
		turn = true
	})
	
	math.newrandomseed()
	local randNum = math.random(#self.wayLayerPass_vector)
	print(randNum)
	local x = self.wayLayerPass_vector[randNum].x
	local y = self.wayLayerPass_vector[randNum].y
	print("x = " .. x .. " y = " .. y)
	player:setAnchorPoint(0,0.5)
	player:setPosition(x, y + TILEDHEIGHT)
	player:setName("player1")
	self:addChild(player)
	self.players[#self.players+1] = player


end

function GameBaseScene:setWayPassToGrid()  
 	local wayLayer = self.map:getLayer("way")
 	local mapSize = wayLayer:getLayerSize()
 	-- print(mapSize.width .. mapSize.height)
 	-- print(wayLayer)

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
                local col = math.floor(x/TILEDWIDTH);  
                local row = math.floor(y/TILEDHEIGHT);  
                -- print(row .. "  " .. col)
                self.canPassGrid[row][col] = true;
                self.wayLayerPass_vector[#self.wayLayerPass_vector+1] = {x = x,y = y} 
            end 
 		end
 	end
 	
end

function GameBaseScene:addGoButton()
	local images = {
        normal = "map/go_normal.png",
        pressed = "map/go_press.png",
    }
    cc.ui.UIPushButton.new(images, {scale9 = true})
        :onButtonClicked(function(event)
            self:goButtonCallback()
        end)
        :pos(tableStartPosition_x+2*tableWidth,tableStartPosition_y-tableHeight*6)
        :addTo(self)
end

function GameBaseScene:goButtonCallback()
  local player = self:getChildByName("player1") 
  math.newrandomseed()
  local stepsCount = math.random(6)
  local path = RouteNavigation:getPath(player, stepsCount, self.canPassGrid, 22, 22)
  player:startGo(path)
end

return GameBaseScene
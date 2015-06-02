local GameBaseScene = class("GameBaseScene", function(name)
	print(name)
	return display.newScene(name)
end)

function GameBaseScene:ctor()
	self:addMap()
	self:drawTable(2)
	self:addPlayer()
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

return GameBaseScene
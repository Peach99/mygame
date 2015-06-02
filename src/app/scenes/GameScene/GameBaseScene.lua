local GameBaseScene = class("GameBaseScene", function(name)
	print(name)
	return display.newScene(name)
end)

function GameBaseScene:ctor()
end

function GameBaseScene:onEnter()
end

function GameBaseScene:onExit()
end

return GameBaseScene
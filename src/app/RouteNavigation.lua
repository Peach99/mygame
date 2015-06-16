local RouteNavigation = class("RouteNavigation", function()
	return {}
end)

function RouteNavigation:ctor()
end

function RouteNavigation:getPath(player,stepsCount,canPassGrid,gridColsCount,gridRowsCount)
	self.path = {}

 	local canPassGrid_copy = {}
 	for i=1,gridRowsCount do
 		canPassGrid_copy[i] = {}
 		for j=1,gridColsCount do
 			canPassGrid_copy[i][j] = canPassGrid[i][j]
 		end
 	end

	local posX = player:getPositionX()
	local posY = player:getPositionY()
	local currentCol = posX/TILEDWIDTH
	local currentRow = (posY-TILEDWIDTH)/TILEDHEIGHT
	-- print("currentCol : " .. currentCol .. " currentRow : " ..currentRow)

	local pathTemp = {}
	for i=1,stepsCount+1 do
		pathTemp = {}

		canPassGrid_copy[currentRow][currentCol] = false

		self.path[i] = {row = currentRow, col = currentCol}
		if canPassGrid_copy[currentRow-1][currentCol] == true then
			pathTemp[#pathTemp+1] = {row = currentRow-1 , col = currentCol}
		end 
		if canPassGrid_copy[currentRow+1][currentCol] == true then
			pathTemp[#pathTemp+1] = {row = currentRow+1 , col = currentCol} 
		end
		if canPassGrid_copy[currentRow][currentCol-1] == true then
			pathTemp[#pathTemp+1] = {row = currentRow , col = currentCol-1} 
		end
		if canPassGrid_copy[currentRow][currentCol+1] == true then
			pathTemp[#pathTemp+1] = {row = currentRow , col = currentCol+1} 
		end
		
		math.newrandomseed()
		local randNum = math.random(#pathTemp)
		-- print("randNum : " .. randNum)

		currentRow = pathTemp[randNum].row
		currentCol = pathTemp[randNum].col

		-- if i > 2 then
		-- 	canPassGrid_copy[self.path[i-2].row][self.path[i-2].col] = true
		-- end
		
		-- print(self.path[i])
	end

	return self.path
end

return RouteNavigation
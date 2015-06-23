Util = {}

function Util:xy2coordinate(x, y, map)
	local size = map:getMapSize()
	local col = math.floor(x/TILEDWIDTH) 
	local row = math.floor(size.height-1 - y/TILEDHEIGHT) 
	print("xy2coordinate " ..col.. " "..row)
	return col, row
end

return Util
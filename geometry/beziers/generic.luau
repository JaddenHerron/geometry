local geometry = script.Parent.Parent
local newDebug = require(geometry.newDebug)

return function(points: {Vector3}, t: number, dbg: number)
	local newPoints = table.clone(points)

	while #newPoints > 1 do
		local new = {}

		for i = 1, #newPoints - 1 do
			new[i] = newPoints[i]:Lerp(newPoints[i + 1], t)
		end

		newPoints = new
	end
	
	if dbg then
		newDebug(newPoints[1], dbg)
	end
	
	return newPoints[1]
end
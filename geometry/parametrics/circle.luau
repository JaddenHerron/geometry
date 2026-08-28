local geometry = script.Parent.Parent
local projectPlane = require(geometry.projectPlane)

return function(center: Vector3, radius: number, angle: number, axis: string)
	axis = axis or "y"

	local x = math.cos(angle) * radius
	local y = math.sin(angle) * radius
	
	return projectPlane(x, y, axis) or center
end
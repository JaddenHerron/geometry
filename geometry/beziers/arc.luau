local geometry = script.Parent.Parent

local getPerpendicular = require(geometry.getPerpendicular)

local beziers = require(geometry.beziers)
local generic = beziers("generic")

return function(p0: Vector3, p1: Vector3, offset: number, height: number, t: number, dbg: number)
	local direction = p1 - p0

	local side = direction.Magnitude > 0 and getPerpendicular(direction) or Vector3.xAxis

	local control = (p0 + p1) / 2 + side * offset + Vector3.yAxis * height
	return generic({p0, control, p1}, t, dbg)
end
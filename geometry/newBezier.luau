local geometry = script.Parent
local beziers = require(geometry.beziers)

return function(str: string)
	return beziers(str)
end
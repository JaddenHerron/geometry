local geometry = script.Parent
local easings = require(geometry.easings)

return function(str: string)
	return easings(str)
end
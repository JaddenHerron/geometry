local geometry = script.Parent
local parametrics = require(geometry.parametrics)

return function(str: string)
	return parametrics(str)
end
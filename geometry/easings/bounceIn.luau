local easings = script.Parent
local out = require(easings.bounceOut)

return function(t: number)
	return 1 - out(1 - t)
end
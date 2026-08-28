local easings = script.Parent
local out = require(easings.bounceOut)

return function(t: number)
	if t < 0.5 then
		return (1 - out(1 - 2 * t)) / 2
	end

	return (1 + out(2 * t - 1)) / 2
end
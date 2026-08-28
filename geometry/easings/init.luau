--https://easings.net/

local easings = script

local cache = {}

return function(str: string)
	if cache[str] then
		return cache[str]
	else
		local newModule = require(easings[str])
		cache[str] = newModule
		return newModule
	end
end
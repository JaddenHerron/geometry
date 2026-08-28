--https://mathworld.wolfram.com/

local parametrics = script

local cache = {}

return function(str: string)
	if cache[str] then
		return cache[str]
	else
		local newModule = require(parametrics[str])
		cache[str] = newModule
		return newModule
	end
end
local beziers = script

local cache = {}

return function(str: string)
	if cache[str] then
		return cache[str]
	else
		local newModule = require(beziers[str])
		cache[str] = newModule
		return newModule
	end
end
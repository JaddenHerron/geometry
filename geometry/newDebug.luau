local geometry = script.Parent
local part = geometry.debug

return function(p0: Vector3, lifetime: number)
	local newDebug = part:Clone()
	
	newDebug.Position = p0
	newDebug.Parent = workspace
	
	task.delay(lifetime or 1, function()
		newDebug:Destroy()
	end)
end
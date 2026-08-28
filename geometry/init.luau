local ease = require(script.ease)
local parametric = require(script.parametric)

local getRun = require(script.getRun)
local run: RunService = getRun()

local geometry = {
	spatial = require(script.spatial)
}

function geometry.new(duration: number, style: string, onCycle: () -> (number, number), onEnded, max: number)
	local elapsed = 0
	local cycle
	
	max = max or 1
	cycle = run.Heartbeat:Connect(function(dt: number)
		elapsed += dt
		
		local t = math.clamp(elapsed / duration, 0, max)
		
		local easing: (number) -> (number) = ease(style)
		if easing then
			t = easing(t)
		end
		
		onCycle(t, dt)
		
		if t >= max then
			cycle:Disconnect()
			
			if onEnded then
				onEnded()
			end
		end
	end)
	
	return cycle
end

function geometry.loop(cycles: number, duration: number, style: string, onCycle: () -> (number, number), onEnded)
	local elapsed = 0
	local cycle
	
	cycle = run.Heartbeat:Connect(function(dt: number)
		elapsed += dt
		
		local rawT = elapsed / duration
		local loops = math.floor(rawT)
		
		local t = rawT % 1
		
		local easing: (number) -> (number) = ease(style)
		if easing then
			t = easing(t)
		end
		
		onCycle(t, loops, rawT, dt)
		
		if loops >= cycles then
			cycle:Disconnect()
			
			if onEnded then
				onEnded()
			end
		end
	end)
	
	return cycle
end

geometry.tracker = require(script.tracker)
geometry.newBezier = require(script.newBezier)
return geometry

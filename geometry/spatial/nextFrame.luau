return function(t: number, duration: number, dt: number, scale: number)
	scale = scale or 1

	local nextStep = t + (dt / duration) * scale

	return math.clamp(nextStep, 0, 1)
end
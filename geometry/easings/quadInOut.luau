return function(t: number)
	if t < 0.5 then
		return 2 * t * t
	end

	return 1 - math.pow(-2 * t + 2, 2) / 2
end
return function(t: number)
	if t < 0.5 then
		return 4 * t * t * t
	end

	return 1 - math.pow(-2 * t + 2, 3) / 2
end
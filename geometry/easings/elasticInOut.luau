return function(t: number)
	if t == 0 or t == 1 then
		return t
	end

	local c5 = (2 * math.pi) / 4.5

	if t < 0.5 then
		return -(
			math.pow(2, 20 * t - 10)
				* math.sin((20 * t - 11.125) * c5)
		) / 2
	end

	return (
		math.pow(2, -20 * t + 10)
			* math.sin((20 * t - 11.125) * c5)
	) / 2 + 1
end
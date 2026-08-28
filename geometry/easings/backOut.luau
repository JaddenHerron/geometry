return function(t: number)
	local c1 = 1.70158
	local c3 = c1 + 1

	return 1 + c3 * math.pow(t - 1, 3) + c1 * math.pow(t - 1, 2)
end
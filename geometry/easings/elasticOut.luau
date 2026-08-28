return function(t: number)
	if t == 0 or t == 1 then
		return t
	end

	local c4 = (2 * math.pi) / 3

	return math.pow(2, -10 * t)
		* math.sin((t * 10 - 0.75) * c4)
		+ 1
end
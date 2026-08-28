return function(x: number, y: number, axis: string)
	if axis == "x" then
		return Vector3.new(0, x, y)
	elseif axis == "y" then
		return Vector3.new(x, 0, y)
	elseif axis == "z" then
		return Vector3.new(x, y, 0)
	end
end
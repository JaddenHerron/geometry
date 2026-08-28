return function(p0: Vector3, p1: Vector3)
	local newVector: Vector3 = p1 - p0
	local length: number = newVector.Magnitude
	
	local direction: Vector3 = length > 0 and newVector.Unit or Vector3.zero
	
	return {
		get = function(t: number)
			return p0 + newVector * t
		end,

		cast = function(params: RaycastParams, distance: number)
			local origin: Vector3 = p0 + direction * 0.1

			return workspace:Raycast(origin, distance and (direction * distance) or vector, params)
		end,

		direction = direction,
		vector = newVector,
		length = length
	}
end
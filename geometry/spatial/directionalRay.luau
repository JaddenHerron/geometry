return function(origin: Vector3, direction: Vector3, distance: number)
	local unit: Vector3 = direction.Magnitude > 0 and direction.Unit or Vector3.zero
	local newVector: Vector3 = unit * distance

	return {
		get = function(t: number)
			return origin + newVector * t
		end,

		cast = function(params: RaycastParams)
			return workspace:Raycast(origin, newVector, params)
		end,

		vector = newVector,
		direction = unit,
		length = distance
	}
end
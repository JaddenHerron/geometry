return function(vector: Vector3)
	local axis = math.abs(vector.Y) > 0.99 and Vector3.xAxis or Vector3.yAxis
	
	return vector:Cross(axis).Unit
end
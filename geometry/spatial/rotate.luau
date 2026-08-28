return function(p0: Vector3, direction: Vector3, attachment: Attachment)
	if direction.Magnitude <= 0 then
		return CFrame.new(p0)
	end

	local lookAt: CFrame = CFrame.lookAt(
		p0,
		p0 + direction
	)

	if attachment then
		lookAt *= attachment.CFrame:Inverse()
	end

	return lookAt
end
return function(initial: any)
	local data = {
		old = initial,
		new = initial
	}

	function data:update(value)
		if value ~= self.new then
			self.old = self.new
			self.new = value
		end
	end

	return data
end

local sF_IDs = {}

function sF_IDs.new(nStart, nEnd, count)
	local o = {}

	if type(nStart) ~= 'number' then
		return nil, 1
	end

	if type(nEnd) ~= 'number' then
		return nil, 2
	end

	if type(count) ~= 'number' and count ~= nil then
		return nil, 3
	end

	local IDs = Array(Range(nStart, nEnd), count)
	local used = Array(0, count)
	local max = nEnd - nStart + 1

	function o:get(i)
		if used[i] >= max or type(i) ~= 'number' then
			return nil
		end

		local rID = math.random(1, max - used[i])
		local ID = IDs[i][rID]

		table.remove(IDs[i], rID)

		used[i] = used[i] + 1

		return ID
	end

	function o:free(i, ID)
		if type(i) ~= 'number' or type(ID) ~= 'number' then
			return nil
		end

		table.insert(IDs[i], ID)

		return true
	end

	return o
end

return sF_IDs

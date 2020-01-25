local sF_Menu = {}
sF_Menu.hook = {}

local titles = {}

function sF_Menu.getButtonStr(tName, p)
	if type(tName) ~= 'string' or type(p) ~= 'number' or (p < 1 or p > SET.maxPlayers) then
		return
	end

	local title = titles[tName]

	if not title then
		return
	end

	local str = tName .. (title.BIG and '@b' or '') .. ','

	local bNames = {}

	local endPage = title.page[p] * 7
	local startPage = endPage - 6

	for i = startPage, math.min(endPage, #title.buttons % 7) do
		local t = title.buttons[i]
		local s = t.name

		if t.supplement then
			s = s .. '|' .. (type(t.supplement) == 'function' and t.supplement(p) or t.supplement)
		end

		if (type(t.enable) == 'function' and not t.enable(p)) or (type(t.enable) == 'boolean' and not t.enable) then
			s = '(' .. s .. ')'
		end

		table.insert(bNames, s)
	end

	str = str .. table.concat(bNames, ',')

	return str
end

function sF_Menu.hook.menu(p, tName, b)
	for str, t in spairs(titles) do
		if str == tName then
			if b == 8 then
				t.page[p] = t.page[p] - 1
			elseif b == 9 then
				t.page[p] = t.page[p] + 1
			elseif b ~= 0 then
				menu(p, sF_Menu.getButtonStr(tName, p))
			end

			return
		end
	end
end

function sF_Menu.new(tName, BIG)
	if type(tName) ~= 'string' or tName == '' then
		return nil, 1
	end

	if type(BIG) ~= 'boolean' and type(BIG) ~= 'nil' then
		return nil, 3
	end

	for str in spairs(titles) do
		if str == tName then
			return nil, 2
		end
	end

	local o = {}

	tName = tName:gsub('@b', '')
	tName = tName:gsub('@i', '')

	titles[tName] = {
		BIG = BIG,
		page = Array(1),
		buttons = {}
	}

	local title = titles[tName]

	function o:setBIG(mBIG)
		if type(mBIG) ~= 'boolean' and type(mBIG) ~= 'nil' then
			return
		end

		titles[tName].BIG = mBIG
	end

	function o:insertButton(bName, bSupplement, bEnable, pos)
		if type(bName) ~= 'string' or bName == '' then
			return
		end

		if type(bSupplement) ~= 'function' and type(bSupplement) ~= 'string' and bSupplement ~= nil then
			return
		end

		if type(bEnable) ~= 'function' and type(bEnable) ~= 'boolean' and type(bEnable) ~= 'nil' then
			return
		end

		if type(pos) ~= 'number' and pos ~= nil then
			return
		end

		bEnable = (bEnable ~= nil and bEnable or true)

		local b = {
			name = bName,
			supplement = bSupplement,
			enable = bEnable
		}

		if pos then
			if pos < 0 then
				pos = len + pos + 1
			end

			table.insert(title.buttons, pos, b)
		else
			table.insert(title.buttons, b)
		end
	end

	function o:removeButton(pos)
		local len = #title.buttons

		if pos == 0 or pos > len then
			return
		end

		if pos < 0 then
			pos = len + pos + 1
		end

		table.remove(title.buttons, pos)
	end

	function o:getButton(pos)
		if pos < 0 then
			pos = #title.buttons + pos + 1
		end

		local b = title.buttons[pos]

		if not b then
			return
		end

		local bObj = {}

		function bObj:getName()
			return b.name
		end

		function bObj:setName(bName)
			if type(bName) ~= 'string' or bName == '' then
				return
			end

			b.name = bName or b.name
		end

		function bObj:getSupplement()
			return b.supplement, type(b.supplement)
		end

		function bObj:setSupplement(bSupplement)
			if type(bSupplement) ~= 'function' and type(bSupplement) ~= 'string' and bSupplement ~= nil then
				return
			end

			b.supplement = bSupplement or b.supplement
		end

		function bObj:getEnable()
			return b.enable, type(b.enable)
		end

		function bObj:setEnable(bEnable)
			if type(bEnable) ~= 'boolean' then
				return
			end

			b.enable = bEnable or b.enable
		end

		return bObj
	end

	function o:show(p)
		menu(p, sF_Menu.getButtonStr(tName, p))
	end

	return o
end

return sF_Menu

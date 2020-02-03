local sF_Menu = {}
sF_Menu.hook = {}

local titles = {}

function sF_Menu.getButtonStr(tName, p)
	if type(tName) ~= 'string' or not tonumber(p) or (p < 1 or p > SET.maxPlayers) then
		return nil, 1
	end

	local title = titles[tName]

	if not title then
		return nil, 2
	end

	local str = tName .. (title.BIG and '@b' or '') .. ','

	local bNames = {}

	local endPage = title.page[p] * 7
	local startPage = endPage - 6

	for i = startPage, endPage do
		local t = title.buttons[i]

		if t then
			local s = t.name

			if t.supplement then
				s = s .. '|' .. (type(t.supplement) == 'function' and t.supplement(p) or t.supplement)
			end

			if (type(t.enable) == 'function' and not t.enable(p)) or (type(t.enable) == 'boolean' and not t.enable) then
				s = '(' .. s .. ')'
			end

			table.insert(bNames, s)
		else
			table.insert(bNames, '()')
		end
	end

	local pageUp = '<--|Page Up'
	local pageDown = '-->|Page Down'

	if title.page[p] == 1 then
		pageUp = '(' .. pageUp .. ')'
	end

	if title.page[p] * 7 >= #title.buttons then
		pageDown = '(' .. pageDown .. ')'
	end

	table.insert(bNames, pageUp)
	table.insert(bNames, pageDown)

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
			end

			if b ~= 0 then
				titles[tName].buttons[b].trigger(p, b, titles[tName].page[p], titles[tName].obj)

				if titles[tName].again then
					menu(p, sF_Menu.getButtonStr(tName, p))
				end
			end

			return
		end
	end
end

function sF_Menu.new(tName, BIG)
	if type(tName) ~= 'string' or tName == '' then
		return nil, 1
	end

	if type(BIG) ~= 'boolean' and BIG ~= nil then
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
		buttons = {},
		again = true
	}

	local title = titles[tName]

	function o:setBIG(mBIG)
		if type(mBIG) ~= 'boolean' and mBIG ~= nil then
			return
		end

		titles[tName].BIG = mBIG
	end

	function o:setAgain(mAgain)
		if type(mAgain) ~= 'boolean' and mAgain ~= nil then
			return
		end

		titles[tName].again = mAgain
	end

	function o:insertButton(bName, bTrigger, bSupplement, bEnable, bPos)
		if type(bName) ~= 'string' or bName == '' then
			return nil, 1
		end

		if type(bTrigger) ~= 'function' and bTrigger ~= nil then
			return nil, 2
		end

		if type(bSupplement) ~= 'function' and type(bSupplement) ~= 'string' and bSupplement ~= nil then
			return nil, 3
		end

		if type(bEnable) ~= 'function' and type(bEnable) ~= 'boolean' and bEnable ~= nil then
			return nil, 4
		end

		if not tonumber(bPos) and bPos ~= nil then
			return nil, 5
		end

		bEnable = (bEnable == nil and true or bEnable)

		local b = {
			name = bName,
			trigger = bTrigger,
			supplement = bSupplement,
			enable = bEnable
		}

		if bPos then
			if bPos < 0 then
				bPos = len + bPos + 1
			end

			table.insert(title.buttons, bPos, b)
		else
			table.insert(title.buttons, b)
		end

		return true
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

		function bObj:getTrigger()
			return b.trigger
		end

		function bObj:setTrigger(bTrigger)
			if type(bTrigger) ~= 'function' and bTrigger ~= nil then
				return
			end

			b.trigger = bTrigger or b.trigger
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

		function bObj:setPos(bPos)
			if type(bPos) ~= 'number' then
				return
			end

			if bPos < 0 then
				bPos = #title.buttons + bPos + 1
			end

			table.insert(title.buttons, bPos, table.remove(title.buttons, pos))
		end

		return bObj
	end

	function o:show(p)
		menu(p, sF_Menu.getButtonStr(tName, p))
	end

	titles[tName].obj = o

	return o
end

return sF_Menu

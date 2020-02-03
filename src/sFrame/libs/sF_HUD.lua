local sF_HUD = {}
sF_HUD.hook = {}

import('sF_IDs', 'sIDs')
local IDs = sIDs.new(0, SET.maxHUD - 1)

local HUDs = Array({})
function sF_HUD.hook.join(p)
	for _, obj in pairs(HUDs[p]) do
		obj:setPos(math.ceil(player(p, 'screenw') / 2), math.ceil(player(p, 'screenh') / 2))
		obj:show()
	end
end

function sF_HUD.new(ID, text, x, y)
	local o = {}

	if type(text) ~= 'string' and type(text) ~= 'number' and text ~= nil then
		return nil, 2
	end

	if not tonumber(x) and x ~= nil then
		return nil, 3
	end

	if not tonumber(y) and y ~= nil then
		return nil, 4
	end

	if not ID then
		local t = {}

		for i = 1, SET.maxPlayers do
			t[i] = sF_HUD.new(i, text, x, y, hAlign, vAlign, size)
		end

		return t
	elseif type(ID) == 'table' then
		local t = {}

		for _, i in ipairs(ID) do
			if tonumber(i) then
				t[i] = sF_HUD.new(tonumber(i), text, x, y, hAlign, vAlign, size)
			end
		end

		return t
	elseif not tonumber(ID) then
		return nil, 1
	end

	ID = tonumber(ID)

	local HUD_ID = IDs:get()

	if not HUD_ID then
		return nil, 0
	end

	text = text or ''
	x = x or (player(ID, 'exists') and math.ceil(player(ID, 'screenw') / 2) or 0)
	y = y or (player(ID, 'exists') and math.ceil(player(ID, 'screenh') / 2) or 0)

	local hAlign = hAlign or 1
	local vAlign = vAlign or 1
	local size = size or 13

	local color = {
		red = 255,
		green = 255,
		blue = 255
	}

	local alpha = 1.0

	function o:show(hAlpha)
		parse('hudtxt2', ID, HUD_ID, '"' .. text .. '"', x, y, hAlign, vAlign, size)

		o:setAlpha()
		o:setColor()
	end

	function o:hide()
		parse('hudtxt2', ID, HUD_ID, '""')
	end

	function o:free()
		IDs:free(ID, HUD_ID)
		o:hide()

		o = nil
	end

	function o:setText(hText)
		if type(hText) == 'string' or type(hText) == 'number' then
			text = tostring(hText)
		end

		self:show()
	end

	function o:setPos(hX, hY)
		x = tonumber(hX) or x
		y = tonumber(hY) or y

		parse('hudtxtmove', ID, HUD_ID, 0, x, y)
	end

	function o:setHAlign(align)
		hAlign = tonumber(align) or hAlign

		self:show()
	end

	function o:setVAlign(align)
		vAlign = tonumber(align) or vAlign

		self:show()
	end

	function o:setSize(hSize)
		size = tonumber(hSize) or size

		self:show()
	end

	function o:setColor(hColor)
		if type(hColor) == 'table' then
			color.red = tonumber(hColor.red) or color.red
			color.green = tonumber(hColor.green) or color.green
			color.blue = tonumber(hColor.blue) or color.blue
		end

		parse('hudtxtcolorfade', ID, HUD_ID, 0, color.red, color.green, color.blue)
	end

	function o:setAlpha(hAlpha)
		alpha = tonumber(hAlpha) or alpha

		parse('hudtxtalphafade', ID, HUD_ID, 0, alpha)
	end

	table.insert(HUDs[ID], o)

	return o
end

return sF_HUD

local sF_HUD = {}

import('sF_IDs', 'sIDs')

local IDs = sIDs.new(0, SET.maxHUD - 1)

function sF_HUD.new(ID, text, x, y, hAlign, vAlign, size, color, alpha)
	local o = {}

	if not ID then
		local t = {}

		for i = 1, getSET('maxPlayers') do
			t[i] = sF_HUD.new(i, text, x, y, hAlign, vAlign, size)
		end

		return t
	elseif type(ID) == 'table' then
		local t = {}

		for _, i in ipairs(ID) do
			if type(i) == 'number' then
				t[i] = sF_HUD.new(i, text, x, y, hAlign, vAlign, size)
			end
		end

		return t
	end

	local HUD_ID = IDs:get(ID)

	if not HUD_ID then
		return
	end

	text = text or ''
	x = x or math.ceil(player(ID, 'screenw') / 2)
	y = y or math.ceil(player(ID, 'screenh') / 2)
	hAlign = hAlign or 1
	vAlign = vAlign or 1
	size = size or 13

	color = (type(color) ~= 'table' and {} or color)
	color.red = color.red or 255
	color.green = color.green or 255
	color.blue = color.blue or 255

	alpha = alpha or 1.0

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
		local t = type(hText)
		if t == 'string' or t == 'number' then
			text = tostring(hText)
		end

		self:show()
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

	function o:setAlpha(hAlpha)
		alpha = tonumber(hAlpha) or alpha

		parse('hudtxtalphafade', ID, HUD_ID, 0, alpha)
	end

	function o:setColor(hColor)
		if type(hColor) == 'table' then
			color.red = tonumber(hColor.red) or color.red
			color.green = tonumber(hColor.green) or color.green
			color.blue = tonumber(hColor.blue) or color.blue
		end

		parse('hudtxtcolorfade', ID, HUD_ID, 0, color.red, color.green, color.blue)
	end

	function o:setPos(hX, hY)
		x = tonumber(hX) or x
		y = tonumber(hY) or y

		parse('hudtxtmove', ID, HUD_ID, 0, x, y)
	end

	return o
end

return sF_HUD

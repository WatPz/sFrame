sF_IMG = {}

local modeList = {
	2,
	4,
	0,
	1,
	3,
	100,
	200,
	132
}

function sF_IMG.mode(mode, pl)
	if not mode then
		return 2
	end

	local ID

	ID = modeList[mode + 1]

	if mode >= 5 then
		ID = ID + pl
	end

	return ID
end

function sF_IMG.path(PATH, mode, width, height)
	if type(PATH) ~= 'string' or PATH == '' then
		return nil, 1
	end

	if mode then
		mode = ':' .. mode
	else
		mode = ''
	end

	if not width or not height then
		local i = image(PATH, x, y, 2)

		width = width or imageparam(i, 'width')
		height = height or imageparam(i, 'height')

		freeimage(i)
	end

	return '<spritesheet:' .. PATH .. ':' .. width .. ':' .. height .. mode .. '>'
end

function sF_IMG.new(PATH, x, y, mode)
	local o = {}

	if type(PATH) ~= 'string' or PATH == '' then
		return nil, 1
	end

	if not tonumber(x) and x ~= nil then
		return nil, 2
	end

	if not tonumber(y) and y ~= nil then
		return nil, 3
	end

	if not tonumber(mode) and mode ~= nil then
		return nil, 4
	end

	local alpha = 1.0

	local blend = 0

	local color = {
		red = 255,
		green = 255,
		blue = 255
	}

	local frame = 1

	local effect = 0

	local loop = 0
	local speed = 0

	local rot = 0

	local mX, mY = width, height

	local ID = image(PATH, x, y, mode)

	function o:show()
		self:setAlpha(1)
	end

	function o:hide()
		self:setAlpha(0)
	end

	function o:free()
		freeimage(ID)
		o = nil
	end

	function o:getInfo(info)
		return imageparam(ID, info)
	end

	function o:setPos(iX, iY, iRot, time)
		if mode > 100 then
			return
		end

		x = tonumber(iX) or x
		y = tonumber(iY) or y
		rot = tonumber(iRot) or rot

		time = tonumber(time) or 0

		if not iX and not iY then
			tween_rotate(ID, time, rot)
		else
			tween_move(ID, time, x, y, rot)
		end
	end

	function o:setSize(iX, iY, time)
		mX = tonumber(iX) or mX
		mY = tonumber(iY) or mY

		time = tonumber(time) or 0

		tween_scale(ID, time, mX / width, mY / height)
	end

	function o:setColor(iColor, time)
		if type(iColor) == 'table' then
			color.red = tonumber(iColor.red) or color.red
			color.green = tonumber(iColor.green) or color.green
			color.blue = tonumber(iColor.blue) or color.blue
		end

		time = tonumber(time) or 0

		tween_color(ID, time, color.red, color.green, color.blue)
	end

	function o:setAlpha(iAlpha, time)
		alpha = tonumber(iAlpha) or alpha

		time = tonumber(time) or 0

		tween_alpha(ID, time, alpha)
	end

	function o:setBlend(iMode)
		if tonumber(iMode) then
			blend = iMode
		end

		if blend < 0 or blend > 3 then
			return
		end

		imageblend(ID, blend)
	end

	function o:setFrame(iFrame, time)
		if tonumber(iFrame) then
			frame = iFrame - 1
		end

		time = tonumber(time) or 0

		tween_frame(ID, time, frame)
	end

	function o:setLoop(iLoop, time)
		if tonumber(iLoop) then
			if iLoop == 0 then
				self:setFrame(1)
			else
				loop = iLoop - 1
			end
		end

		time = tonumber(time) or 0

		tween_animate(ID, time, loop)
	end

	function o:setRot(iSpeed)
		speed = tonumber(iSpeed) or speed

		tween_rotateconstantly(ID, speed)
	end

	function o:setHitzone(iEffect, stopShot)
		if tonumber(iEffect) then
			if iEffect >= 0 and iEffect <= 4 then
				effect = iEffect
			end
		end

		imagehitzone(ID, (stopShot and 100 or 0) + effect)
	end

	return o
end

return sF_IMG

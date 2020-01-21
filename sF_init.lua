-- load utf-8 lib [&] 导入utf-8库
dofile('sys/lua/utf8.lua')
function Range(v1, v2, sep)
	sep = sep or 1

	local array = {}
	for i = v1, v2, sep do
		array[#array + 1] = i
	end

	return array
end

function Copy(org, res)
	for k, v in pairs(org) do
		if type(v) ~= 'table' then
			res[k] = v
		else
			res[k] = {}
			Copy(v, res[k])
		end
	end
end

function Array(value, max)
	value = value or false
	max = max or 32

	local array = {}
	if type(value) == 'table' then
		for i = 1, max do
			array[i] = {}
			Copy(value, array[i])
		end
	else
		for i = 1, max do
			array[i] = value
		end
	end

	return array
end

function remove(name)
	if type(_G[name]) == 'table' and type(_G[name].hook) == 'table' then
		for funcName in pairs(_G[name].hook) do
			freehook(funcName, '_G.' .. name .. '.hook.' .. funcName)
		end
	end

	_G[name] = nil
end

function import(proJname, alias)
	local PATH = 'sys/lua/sFrame/libs/' .. proJname .. '.lua'
	local name = alias or proJname

	if _G[name] then
		remove(name)
	end

	_G[name] = dofile(PATH)

	if type(_G[name]) == 'table' and type(_G[name].hook) == 'table' then
		for funcName in pairs(_G[name].hook) do
			addhook(funcName, '_G.' .. name .. '.hook.' .. funcName)
		end
	end
end

function spairs(t)
	local a = {}

	for str in pairs(t) do
		a[#a + 1] = str
	end

	table.sort(a)

	local i = 0
	return function()
		i = i + 1
		return a[i], t[a[i]]
	end
end

local SET = {}

local f = io.open('sys/lua/sFrame/cfg/Settings.cfg')

for l in f:lines() do
	if l == '' or l:find('# (%w+)') then
		break
	end

	local k, v = l:match('([%w_]+) (.+)')
	SET[k] = tonumber(v) or v
end

function getSET(k)
	return SET[k]
end

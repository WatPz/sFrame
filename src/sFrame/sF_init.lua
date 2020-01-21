-- define "Range" function to assign a value to the table § 定义"Range"函数来为表赋值
function Range(v1, v2, sep)
	sep = sep or 1

	local array = {}
	for i = v1, v2, sep do
		array[#array + 1] = i
	end

	return array
end

-- 定义"Copy"函数来解决表引用问题 § Define the "copy" function to solve the table reference problem
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

-- 定义 "Array" 函数来声明列表 § Define the "Array" function to declare the list
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

-- 定义 "remove" 函数来移除LIB § Define the "remove" function to remove the LIB
function remove(name)
	if type(_G[name]) == 'table' and type(_G[name].hook) == 'table' then
		for funcName in pairs(_G[name].hook) do
			freehook(funcName, '_G.' .. name .. '.hook.' .. funcName)
		end
	end

	_G[name] = nil
end

-- 定义 "import" 函数来导入LIB § Define the "import" function to import the LIB
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

-- Define the spairs iterator to return the strings in the table in order § 定义spairs迭代器按顺序返回表中的字符串
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

-- defines a read-only global variable "SET" to load data in "cfg/settings.cfg" § ——定义一个只读全局变量"SET"，用于在"cfg/settings.cfg"中加载数据
local settings = {}
local f = io.open('sys/lua/sFrame/cfg/Settings.cfg')

for l in f:lines() do
	if l == '' or l:find('# (%w+)') then
		break
	end

	local k, v = l:match('([%w_]+) (.+)')
	settings[k] = tonumber(v) or v
end

SET =
	setmetatable(
	{},
	{
		__index = function(t, k)
			return settings[k]
		end,
		__newindex = function()
			return
		end
	}
)

-- load utf-8 lib § 导入utf-8库
import('utf8')

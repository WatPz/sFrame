<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">说明</p>
此 <u>插件</u> 内置了许多供 **lib** 使用的自定义函数， **请勿修改** ！

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>

- **{...} SET**

  一个包含 **CS2D** 官方数据的 **Table** ，详情请见 *cfg/Settings.cfg*

- **Range()**

  创建一个 值从 *v1* ~ *v2* 的 <u>有序</u> **Table**

  **Number** `v1` -> 开始值
  **Number** `v2` -> 结束值
  **Number** `sep` -> 每次赋值时增加的值

  ```lua
  local zeroTo10 = Range(0, 10)
  ```

  [ **return** ] : **Table**

- **Copy()**

  将 **Table** 的内容拷贝一份

  **Table** `org` -> 拷贝的来源
  **Table** `res` -> 被拷贝的 **Table**

  ```lua
  Copy(org, res)
  ```

  [ **return** ] : **nil**

- **Array()**

  创建一个 *1* ~ *max* 都为 *value* 的 <u>有序</u> **Table**

  **Any** `value` -> 值

  **max** `max` -> 索引上限 *默认值为 **SET.maxPlayers***

  ```lua
  local array = Array(value, max)
  ```

  [ **return** ] : **Table**

- **remove()**

  移除指定 **库**

  **String** `name` -> 库名称

  ```lua
  remove(name)
  ```

  [ **return** ] : **nil**

- **import()**

  导入指定 **库**

  **String** `proJname` -> 库名称（文件名）

  **String** `alias` -> 库别名（对象名）

  ```lua
  import(proJname, alias)
  ```

  [ **return** ] : nil

- **in spairs()**

  有序返回 **Table** 中 字符串 **Key** 值的迭代器

  **Table** `t` -> 要供返回的 **Table**

  ```lua
  for k, v in spairs(t) do
  	-- some code
  end
  ```

  [ **returnS** ] : **Any**

  
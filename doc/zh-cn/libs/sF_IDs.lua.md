<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>

- **sIDs.new()**

  创建一个 **sF_IDs** 对象：

  **Number** `nStart` -> 分配ID的开始值

  **Number** `nEnd` -> 分配ID的结束值

  **Number** `count` -> 副本的数量 *默认值参考Array()*

  （ 一般用于记录 *玩家* ）

  （ 任意参数 <u>类型不对</u> 时，返回 **nil, 参数位置** ）

  ```lua
  local o = sIDs.new(nStart, nEnd, count)
  ```

  [ **return** ] : 返回对象 **o**（ 任意参数不为 **Number** 返回 **nil**）

- **o:get()**

  获得 **o** 副本中的一个独立ID

  **Number** `i `-> 副本的ID

  ```lua
  o:get(i)
  ```

  [ **return** ] : 一个独立ID（ 超出上限时返回 **nil** ）

- **o:free()**

  释放 **o** 的一个副本中的一个独立ID

  **Number** `i` -> 副本的ID

  **Number** `ID` -> 要释放的独立ID

  ```lua
  o:free(i, ID)
  ```

  [ **return** ] : 参数错误时返回 **nil** ，否则返回 **true**

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">例子</p>

- 创建一个针对 3 个玩家 ，范围是 1~100 的 **IDs**

  ```lua
  local IDs = sIDs.new(1, 100, 3)
  ```

- 获取玩家 1 的一个独立ID，使用完后释放它

  ```lua
  local ID = IDs:get(1)
  -- some code
  IDs:free(1, ID)
  ```

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>
- **sMenu.new()**

  创建一个 **sF_Menu** 对象：

  **String** `tName` -> 菜单标题

  （ 如果不为 **String** 或 <u>为空</u> ，返回 **nil, 1** ）

  （ 如果 <u>标题</u> 已经 <u>被使用</u> ，返回 **nil, 2** ）

  **Boolean** `BIG` -> 设置为大菜单

  （ 如果不为 **Boolean** ， 返回 **nil, 3** ）

  ```lua
  local o = sMenu.new(tName, BIG)
  ```

  [ **return** ] : 对象 **o** （ 特殊情况如上 ）

- **sMenu.getButtonStr()**

  获取一个菜单的格式化字符串

  **String** `tName` -> 菜单标题

  **Number** `p` -> 玩家ID

  （ 任意参数 <u>类型不对</u> 时，返回 **nil, 1** ）
  （ 菜单 <u>不存在</u> 时，返回 **nil, 2** ）

  ```lua
  sF_Menu.getButtonStr(tName, p)
  ```

  [ **return** ] : **String**

- **o:show()**

  将 **o** 菜单展示给一个玩家看

  **Number** `p` -> 玩家ID

  ```lua
  o:show(p)
  ```
  
  [ **return** ] : **nil**
  
- **o:setBIG()**

  设置 **o** 菜单的 大菜单模式

  **Boolean** `mBIG` -> 是否开启大菜单模式

  （ 不为 **Boolean** 时，不变 ）

  ```lua
  o:setBIG(mBIG)
  ```

  [ **return** ] : **nil**
  
- **o:setAgain()**

  设置 **o** 菜单 在触发后是否再次显示

  **Boolean** `mAgain` -> 在触发后是否再次显示

  （ 不为 **Boolean** 时，不变 ）

  ```lua
  o:setAgain(mAgain)
  ```

  [ **return** ] : **nil**
  
- **o:setGlobalTrigger()**

  创建 **o** 对象的全局 **Trigger** ，任何没有 **bTrigger** 触发函数的 **bObj** 将会使用此函数

  **Function** `gTrigger` -> 全局按钮触发函数

  （ 不为 **Function** 时，不变 ）

  ```lua
  o:setGlobalTrigger(gTrigger)
  ```

  [ **return** ] : **nil**
  
- **o:getGlobalTrigger()**

  获取 **o** 对象的全局 **Trigger**

  ```lua
o:getGlobalTrigger()
  ```

  [ **return** ] : **Function**
  
- **o:insertButton()**

  在 **o** 菜单中插入一个按钮

  **String** `bName` -> 按钮名字

  **Function** `bTrigger` -> 按钮触发函数（ 传入参数 **玩家ID, 按钮总ID, 菜单对象** ）

  **Function / String** `bSupplement` -> 按钮补充（ 为 **Function** 时，传入参数 **玩家ID** ）

  **Function / Boolean** `bEnable` -> 按钮状态（ 为 **Function** 时，传入参数 **玩家ID** ）

  **Number** `pos` -> 插入的位置 *默认为末尾*

  （ 为 <u>负数</u> 时，从后往前数 ）

  （ 任意参数 <u>类型不对</u> 时，不会插入按钮 ）

  （ 任意参数 <u>类型不对</u> 时，返回 **nil, 参数位置** ）

  ```lua
  o:insertButton(bName, bTrigger, bSupplement, bEnable, bPos)
  ```

  [ **return** ] : **nil**

- **o:removeButton()**

  在 **o** 菜单中移除一个按钮

  **Number** `pos` -> 按钮位置

  （ 为 <u>负数</u> 时，从后往前数 ）

  ```lua
  o:removeButton(pos)
  ```

  [ **return** ] : **nil**

- **o:getButton()**

  获取 **o** 菜单中的一个按钮

  **Number** `pos` -> 按钮位置

  （ 为 <u>负数</u> 时，从后往前数 ）

  ```lua
  local bObj = o:getButton(pos)
  ```

  [ **return** ] : 返回对象 **bObj**

- **bObj:getName()**

  获取 **bObj** 按钮的名称

  ```lua
  bObj:getName()
  ```

  [ **return** ] : **String**

- **bObj:setName()**

  设置 **bObj** 按钮的名称

  **String** `bName` -> 按钮名称
  
  （ 不为 **String** 或 <u>为空</u> 时不变 ）

  ```lua
  bObj:setName(bName)
  ```
  
  [ **return** ] : **nil**

- **bObj:getTrigger()**

  获取 **bObj** 按钮的触发函数

  ```lua
  bObj:getTrigger()
  ```

  [ **return** ] : **String, String**

- **bObj:setTrigger()**

  设置 **bObj** 按钮的触发函数

  **Function** `bTrigger` -> 按钮触发函数
  
  （ 不为 **Function** 时不变 ）

  ```lua
  bObj:setTrigger(bTrigger)
  ```
  
  [ **return** ] : **nil**

- **bObj:getSupplement()**

  获取 **bObj** 按钮的补充和 <u>类型</u>（ **Function / Boolean** ）

  ```lua
  bObj:getSupplement()
  ```

  [ **return** ] : **String, String**

- **bObj:setSupplement()**

  设置 **bObj** 按钮的补充

  **Function / Boolean** `bSupplement` -> 按钮补充
  
  （ 不为 **Function** 或 **Boolean** 时不变 ）

  ```lua
  bObj:setSupplement(bSupplement)
  ```
  
  [ **return** ] : **nil**

- **bObj:getEnable()**

  获取 **bObj** 按钮的状态和 <u>类型</u>（ **Function / Boolean** ）

  ```lua
  bObj:getEnable()
  ```

  [ **return** ] : **String, String**

- **bObj:setEnable()**

  设置 **bObj** 按钮的状态

  **Function / Boolean** `bsupplement` -> 按钮状态
  
  （ 不为 **Function** 或 **Boolean** 时不变 ）

  ```lua
  bObj:setEnable(bEnable)
  ```
  
  [ **return** ] : **nil**

  获取 **bObj** 按钮的状态和 <u>类型</u>（ **Function / Boolean** ）

  ```lua
  bObj:getEnable()
  ```

  [ **return** ] : **String, String**

- **bObj:setPos()**

  设置 **bObj** 按钮的位置

  **Number** `bPos` -> 按钮位置
  
  （ 不为 **Number** 时不变 ）

  ```lua
  bObj:setPos(bPos)
  ```
  
  [ **return** ] : **nil**

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">例子</p>
- 创建一个主菜单

  并设置 <u>b1</u> ， <u>b2</u> 和 <u>b3</u> 三个按钮

  ```lua
  local MainMenu = sMenu.new("Main Menu")
  MainMenu:insertButton("b1")
  -- It has supplementary content
  MainMenu:insertButton("b2", "a button")
  -- It can not click and no supplementary content
  MainMenu:insertButton("b3", nil, false)
  ```
  
- 获取主菜单的倒数第一个按钮，并修改它的 <u>名称</u> 、 <u>补充</u> 和 <u>状态</u>

  当有人点击这个按钮时，触发 **tell** 函数

  ```lua
  function tell(p)
  	msg("Player " .. p .. " pressed button!")
  end
  
  local bObj = getButton(-1)
  bObj:setName("B3")
  bObj:setSupplement("Will be broadcast")
  bObj:setEnable(true)
  bObj:setTrigger(tell)
  ```

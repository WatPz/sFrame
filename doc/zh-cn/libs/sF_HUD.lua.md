<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>
- **sHUD.new()**

  创建一个 **sF_HUD** 对象：

  **Number** `ID` -> 玩家id

  （ 如果为 **nil** ，那么返回一个1~32索引都为 **sF_HUD** 对象的 **Table** ）

  （ 如果为 **Table** ，那么返回 `ID` 中所有 <u>数字</u> <u>对应</u> 索引都为 **sF_HUD** 对象的 **Table** ）

  **String** `text` -> 文本 *默认值为空字符串*

  **Number** `x` -> x坐标 *默认值为玩家屏幕宽度一半*

  **Number** `y` -> y坐标 *默认值为玩家屏幕高度一半*

  **Number** `hAlign` -> 水平对齐模式 *默认值为1*

  **Number** `vAlign` -> 垂直对齐模式 *默认值为1*

  （ <u>水平对齐</u> 和 <u>垂直对齐</u> 详见 *对齐模式* ）

  **Number** `size` -> 文本大小 *默认值为13*

  **Table** `color` -> 文本颜色 （ *RGB* 格式）

  （ <u>文本颜色</u> 详见 *颜色 *）

  **Number** `alpha` -> 文本透明度 *默认值为1.0*

  （ 0.0 ~ 1.0 对应 0% ~ 100% ）

  ```lua
  local o = sHUD.new(ID, text, x, y, hAlign, vAlign, size, color, alpha)

  -- Example --
  local one = sHUD.new(2, "Player 2 can see this message!")
  one:show()

  local all = sHUD.new(nil, "You all can see this message!")
  all:show()

  local some = sHUD.new({1, 9, 26}, "Players 1, 9 and 26 can see this message!")
  some:show()
  ```

  [ **return** ] : 对象 **o**

- **o:show()**

  显示 **o** 的文本

  ```lua
  o:show()
  ```

  [ **return** ] : **nil**

- **o:hide()**

  隐藏 **o** 的文本

  ```lua
  o:hide()
  ```

  [ **return** ] : **nil**

- **o:free()**

  释放 **o** 的文本

  （ **注意：**被释放的文本将 **永远消失** ！而 **o:hide()** 只是隐藏起来了，**还可以调用**！ ）

  ```lua
  o:free()
  ```

  [ **return** ] : **nil**

- **o:setText()**

  设置 **o** 的文本

  **String** hText -> 文本 （ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setText(hText)
  ```

  [ **return** ] : **nil**

- **o:setHAlign()**

  设置 **o** 的水平对齐模式

  **Number** align-> 水平对齐模式（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setHAlign(align)
  ```

  [ **return** ] : **nil**

- **o:setVAlign()**

  设置 **o** 的垂直对齐模式

  **Number** align-> 水平对齐模式（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setVAlign(align)
  ```

  [ **return** ] : **nil**

- **o:setSize()**

  设置 **o** 的文本大小

  **Number** hSize-> 文本大小（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setSize(hSize)
  ```

  [ **return** ] : **nil**

- **o:setAlpha()**

  设置 **o** 的文本透明度

  **Number** hAlpha-> 文本透明度（ 不为 **String** 或 **Number** 时不变 ）

  （ 0.0 ~ 1.0 对应 0% ~ 100% ）

  ```lua
  o:setAlpha(hAlpha)
  ```

  [ **return** ] : **nil**

- **o:setColor()**

  设置 **o** 的文本颜色

  **Table** hColor-> 文本颜色（ *RGB* 格式 ）（ 不为 **Table** 时不变 ）

  （ <u>文本颜色</u> 详见 *颜色* ）

  ```lua
  o:setColor(hColor)
  ```

  [ **return** ] : **nil**

- **o:setPos()**

  设置 **o** 的文本坐标

  **Number** hX-> x坐标（ 不为 **String** 或 **Number** 时不变 ）

  **Number** hY-> y坐标（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setPos(hX, hY)
  ```

  [ **return** ] : **nil**

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">补充</p>
- 对齐模式：

  - 水平对齐：

    `0` -> 左对齐

    `1` -> 居中对齐

    `2` -> 右对齐

  - 垂直对齐：

    `0` -> 顶对齐

    `1` -> 居中对齐

    `2` -> 底对齐

- 颜色：

  [ **Key** `red` -> 红色值 *默认值为255* ]

  [ **Key** `green` -> 绿色值 *默认值为255* ]

  [ **Key** `blue` -> 蓝色值 *默认值为255* ]

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">例子</p>
- 创建一个针对玩家 1 的 **sF_HUD** 对象

  并修改它的颜色和字体大小

  最后展示给玩家
  
  ```lua
  local HUD = sHUD.new(1, "Hello, Player 1!")
  -- set the color to white
  HUD:setColor({red = 255, green = 255, blue = 255})
  -- set the size to 29
  HUD:setSize(29)
  -- show the text to the player 1
  HUD:show()
  ```

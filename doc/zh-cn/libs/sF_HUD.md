<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>

- **sHUD.new()**

  创建一个 **sF_HUD** 对象：

  **Number** `ID` -> 玩家id

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
  ```

- **o:show()**

  显示 **o** 的文本

  ```lua
  o:show()
  ```

- **o:hide()**

  隐藏 **o** 的文本

  ```lua
  o:hide()
  ```

- **o:free()**

  释放 **o** 的文本

  （ **注意：**被释放的文本将 **永远消失** ！而 **o:hide()** 只是隐藏起来了，**还可以调用**！ ）

  ```lua
  o:free()
  ```

- **o:setText()**

  设置 **o** 的文本

  **String** hText -> 文本 （ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setText(hText)
  ```

- **o:setHAlign()**

  设置 **o** 的水平对齐模式

  **Number** align-> 水平对齐模式（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setHAlign(align)
  ```

- **o:setVAlign()**

  设置 **o** 的垂直对齐模式

  **Number** align-> 水平对齐模式（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setVAlign(align)
  ```

- **o:setSize()**

  设置 **o** 的文本大小

  **Number** hSize-> 文本大小（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setSize(hSize)
  ```

- **o:setAlpha()**

  设置 **o** 的文本透明度

  **Number** hAlpha-> 文本透明度（ 不为 **String** 或 **Number** 时不变 ）

  （ 0.0 ~ 1.0 对应 0% ~ 100% ）

  ```lua
  o:setAlpha(hAlpha)
  ```

- **o:setColor()**

  设置 **o** 的文本颜色

  **Table** hColor-> 文本颜色（ *RGB* 格式 ）（ 不为 **Table** 时不变 ）

  （ <u>文本颜色</u> 详见 *颜色* ）

  ```lua
  o:setColor(hColor)
  ```

- **o:setPos()**

  设置 **o** 的文本坐标

  **Number** hX-> x坐标（ 不为 **String** 或 **Number** 时不变 ）

  **Number** hY-> y坐标（ 不为 **String** 或 **Number** 时不变 ）

  ```lua
  o:setPos(hX, hY)
  ```

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
<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>
- **sHUD.new()**

  Create a **sF_HUD** object:

  **Number** `ID` -> The player id

  **String** `text` -> The text *defaults to an empty string*

  **Number** `x` -> The y coordinate *defaults to half the width of the player's screen*

  **Number** `y` -> The y coordinate *defaults to half the height of the player's screen*

  **Number** `hAlign` -> The horizontal alignment mode *defaults to 1*

  **Number** `vAlign` -> The vertical alignment mode *defaults to 1*

  ( <u>Horizontal alignment</u> and <u>Vertical alignment</u> for details *Alignment Mode* )

  **Number** `size` -> The text size *defaults to 13*

  **Table** `color` -> The text color ( *RGB* format )

  ( <u>Text color</u> for details *Color* )

  **Number** `alpha` -> The text transparency *defaults to 1.0*

  ( 0.0 ~ 1.0 corresponds to 0% ~ 100% )

  ```lua
  local o = sHUD.new(ID, text, x, y, hAlign, vAlign, size, color, alpha)
  ```

- **o:show()**

  Displays the text of **o**

  ```lua
  o:show()
  ```

- **o:hide()**

  Hide the text of **o**

  ```lua
  o:hide()
  ```

- **o:free()**

  Free the text of **o**

  ( **note:** freed text will **disappear forever** ! And **o:hide()** is just hidden, **can also call** ! )

  ```lua
  o:free()
  ```

- **o:setText()**

  Set the text of **o**

  **String** hText -> The Text ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setText(hText)
  ```

- **o:setHAlign()**

  Set the horizontal alignment mode of **o**

  **Number** align-> The horizontal alignment mode ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setHAlign(align)
  ```

- **o:setVAlign()**

  Set the vertical alignment mode of **o**

  **Number** align-> The vertical alignment mode ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setVAlign(align)
  ```

- **o:setSize()**

  Set the text size of **o**

  **Number** hSize-> The text size ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setSize(hSize)
  ```

- **o:setAlpha()**

  Set the text transparency of **o**

  **Number** hAlpha-> The text transparency ( It doesn't change if it's not **String** or **Number** )

  （ 0.0 ~ 1.0 对应 0% ~ 100% ）

  ```lua
  o:setAlpha(hAlpha)
  ```

- **o:setColor()**

  Set the text color of **o**

  **Table** hColor-> The text color ( *RGB* format ) ( It doesn't change if it's not **Table** )

  ( <u>Text color</u> for details *Color* )

  ```lua
  o:setColor(hColor)
  ```

- **o:setPos()**

  Set the text coordinates of **o**

  **Number** hX-> The x coordinate ( It doesn't change if it's not **String** or **Number** )

  **Number** hY-> The y coordinate ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setPos(hX, hY)
  ```

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">Supplement</p>

- Alignment Mode：

  - Horizontal alignment：

    `0` -> Left alignment

    `1` -> Center alignment

    `2` -> Right alignment

  - Vertical alignment：

    `0` -> Top alignment

    `1` -> Center alignment

    `2` -> Bottom alignment

- Color：

  [ **Key** `red` -> The red value *defaults to 255* ]

  [ **Key** `green` -> The green value *defaults to 255* ]

  [ **Key** `blue` -> The blue value *defaults to 255* ]
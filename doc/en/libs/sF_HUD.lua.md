<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>

- **sHUD.new()**

  Create a **sF_HUD** object:

  **Number** `ID` -> The player id

  ( If **nil** , return a **Table** that index 1 to 32 is **sF_HUD** object )

  ( If **Table** , the index <u>corresponding</u> to all the <u>numbers</u> in the return table is a table of **sF_HUD** object )

  **String** `text` -> The text *defaults to an empty string*

  **Number** `x` -> The y coordinate *defaults to half the width of the player's screen*

  **Number** `y` -> The y coordinate *defaults to half the height of the player's screen*

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

  [ **return** ] : The Object **o**

- **o:show()**

  Displays the text of **o**

  ```lua
  o:show()
  ```

  [ **return** ] : **nil**

- **o:hide()**

  Hide the text of **o**

  ```lua
  o:hide()
  ```

  [ **return** ] : **nil**

- **o:free()**

  Free the text of **o**

  ( **note:** freed text will **disappear forever** ! And **o:hide()** is just hidden, **can also call** ! )

  ```lua
  o:free()
  ```

  [ **return** ] : **nil**

- **o:setText()**

  Set the text of **o**

  **String** hText -> The Text ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setText(hText)
  ```

  [ **return** ] : **nil**

- **o:setPos()**

  Set the text coordinates of **o**

  **Number** hX-> The x coordinate ( It doesn't change if it's not **String** or **Number** )

  **Number** hY-> The y coordinate ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setPos(hX, hY)
  ```

  [ **return** ] : **nil**

- **o:setHAlign()**

  Set the horizontal alignment mode of **o**

  **Number** align-> The horizontal alignment mode ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setHAlign(align)
  ```

  [ **return** ] : **nil**

- **o:setVAlign()**

  Set the vertical alignment mode of **o**

  **Number** align-> The vertical alignment mode ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setVAlign(align)
  ```

  [ **return** ] : **nil**

- **o:setSize()**

  Set the text size of **o**

  **Number** hSize-> The text size ( It doesn't change if it's not **String** or **Number** )

  ```lua
  o:setSize(hSize)
  ```

  [ **return** ] : **nil**

- **o:setColor()**

  Set the text color of **o**

  **Table** hColor-> The text color ( *RGB* format ) ( It doesn't change if it's not **Table** )

  ( <u>Text color</u> for details *Color* )

  ```lua
  o:setColor(hColor)
  ```

  [ **return** ] : **nil**

- **o:setAlpha()**

  Set the text transparency of **o**

  **Number** hAlpha-> The text transparency ( It doesn't change if it's not **String** or **Number** )

  ( 0.0 ~ 1.0 corresponds to 0% ~ 100% )

  ```lua
  o:setAlpha(hAlpha)
  ```

  [ **return** ] : **nil**

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

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">Example</p>

- Create an **sF_HUD** object for player 1

  And change its color and font size

  Finally, show the text to the player

  ```lua
  local HUD = sHUD.new(1, "Hello, Player 1!")
  -- set the color to white
  HUD:setColor({red = 255, green = 255, blue = 255})
  -- set the size to 29
  HUD:setSize(29)
  -- show the text to the player 1
  HUD:show()
  ```

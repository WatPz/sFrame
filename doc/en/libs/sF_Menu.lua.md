<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>
- **sMenu.new()**

  Create a **sF_Menu** object:

  **String** `tName` -> The menu title

  ( return **nil, 1** if not **String** or null )

  ( return **nil, 2** if <u>title</u> has <u>been used</u> )

  **Boolean** `BIG` -> Set to large menu

  ( return **nil, 3** if not **String** )

  ```lua
  local o = sMenu.new(tName)
  ```

  [ **return** ] : The Object **o** ( special case above )

- **sMenu.getButtonStr()**

  Gets a format string for a menu

  **String** `tName` -> The menu title

  **Number** `p` -> The player ID

  ( return **nil** if any parameter <u>is of the wrong type</u> )

  ```lua
  sF_Menu.getButtonStr(tName, p)
  ```

  [ **return** ] : **String**

- **o:setBIG()**

  Set the large menu mode of the **o** menu

  **Boolean** `mBIG` -> Whether to turn on the large menu mode

  ( It doesn't change if not **Boolean** or null )

  ```lua
  o:setBIG(mBIG)
  ```

  [ **return** ] : **nil**

- **o:insertButton()**

  Insert a button in the **o** menu

  **String** `bName` -> The button name

  **Function** `bTrigger` -> The button trigger function ( pass in the parameter **Player ID** )

  **Function / Boolean** `bSupplement` -> The button supplement ( When **Function**, pass in the parameter **Player ID** )

  **Function / Boolean** `bEnable` -> The button state ( When **Function**, pass in the parameter **Player ID** )

  **Number** `pos` -> The insertion position *default to the end*

  ( count backwards if it's a <u>negative</u> number )

  ( won't insert if any parameter <u>is of the wrong type</u> )

  ```lua
  o:insertButton(bName, bTrigger, bSupplement, bEnable, bPos)
  ```

  [ **return** ] : **nil**

- **o:removeButton()**

  Remove a button from the **o** menu

  **Number** `pos` -> The button position

  ( count backwards if it's a <u>negative</u> number )

  ```lua
  o:removeButton(pos)
  ```

  [ **return** ] : **nil**

- **o:getButton()**

  Gets a button in the **o** menu

  **Number** `pos` -> The button position

  ( count backwards if it's a <u>negative</u> number )

  ```lua
  local bObj = o:getButton(pos)
  ```

  [ **return** ] : The Object **bObj**

- **o:show()**

  Show the **o** menu to a player

  **Number** `p` -> The player ID

  ```lua
  o:show(p)
  ```

  [ **return** ] : **nil**

- **bObj:getName()**

  Get the name of the **bObj** button

  ```lua
  bObj:getName()
  ```

  [ **return** ] : **String**

- **bObj:setName()**

  Set the name of the **bObj** button

  **String** `bName` -> The button name

  ( It doesn't change if not **String** or null )

  ```lua
  bObj:setName(bName)
  ```

  [ **return** ] : **nil**

- **bObj:getTrigger()**

  Get the trigger function of the **bObj** button

  ```lua
  bObj:getTrigger()
  ```

  [ **return** ] : **String, String**

- **bObj:setTrigger()**

  Set the trigger function of the **bObj** button

  **Function** `bTrigger` -> The button trigger function

  ( It doesn't change if not **Function** )

  ```lua
  bObj:setTrigger(bTrigger)
  ```

  [ **return** ] : **nil**

- **bObj:getSupplement()**

  Get the supplement and the <u>type</u> of the **bObj** button ( **Function / Boolean** )

  ```lua
  bObj:getSupplement()
  ```

  [ **return** ] : **String, String**

- **bObj:setSupplement()**

  Set the supplement of the **bObj** button

  **Function / Boolean** `bSupplement` -> The button supplement

  ( It doesn't change if not **Function** or **Boolean** )

  ```lua
  bObj:setSupplement(bSupplement)
  ```

  [ **return** ] : **nil**

- **bObj:getEnable()**

  Get the enable state and the <u>type</u> of the **bObj** button ( **Function / Boolean** )

  ```lua
  bObj:getEnable()
  ```

  [ **return** ] : **String, String**

- **bObj:setEnable()**

  Set the enable state of the **bObj** button

  **Function / Boolean** `bSupplement` -> The button enable state

  ( It doesn't change if not **Function** or **Boolean** )

  ```lua
  bObj:setEnable(bEnable)
  ```

  [ **return** ] : **nil**

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">Example</p>
- Create a main menu

  And set the <u>b1</u> , <u>b2</u> and <u>b3</u> buttons

  ```lua
  local MainMenu = sMenu.new("Main Menu")
  MainMenu:insertButton("b1")
  MainMenu:insertButton("b2")
  MainMenu:insertButton("b3")
  ```

- Get the last button of the main menu and change its <u>name</u> , <u>supplement</u> and <u>status</u>

  ```lua
  local bObj = getButton(-1)
  bObj:setName("B3")
  bObj:setSupplement("Cant choose")
  bObj:setEnable(false)
  ```
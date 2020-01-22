<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>
- **sIDs.new()**

  Create a **sF_IDs** object:

  **Number** `nStart` -> Assign the start value of the ID

  **Number** `nEnd` -> Assign the end value of the ID

  **Number** `count` -> The number of copies *Default values refer to Array()*

  ( Generally used to record *players* )

  ```lua
  local o = sIDs.new(nStart, nEnd, count)
  ```

  [ **return** ] : Return the object **o** ( Return **nil** if the argument is not **Number** )

- **o:get()**

  Get a separate ID in the copy of **o**

  **Number** `i `-> ID of the copy

  ```lua
  o:get(i)
  ```

  [ **return** ] : A separate ID (returns **nil** when the limit is exceeded)

- **o:free()**

  Free a separate ID in a copy of **o**

  **Number** `i` -> ID of the copy

  **Number** `ID` -> The independent ID to be freed

  ```lua
  o:free(i, ID)
  ```

  [ **return** ] : Returns **nil** when the parameter is wrong, otherwise returns **true**

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">例子</p>
- Create a **IDs** for 3 players, ranging from 1 to 100

  ```lua
  local IDs = sIDs.new(1, 100, 3)
  ```

- Get a separate ID for player 1, free it after use

  ```lua
  local ID = IDs:get(1)
  -- some code
  IDs:free(1, ID)
  ```




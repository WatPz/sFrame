<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">Explain</p>

This <u>plugin</u> has many custom functions built in for **lib **, **do not modify** !

<p align="center", style="font-family: Helvetica, Open Sans; font-size: 22px; color: #64dcf5">API</p>

- **{...} SET**

  A **Table** containing **CS2D** official data, see *CFG/settings.cfg*

- **Range()**

  Create a <u>order</u> **Table** with a value of *v1* ~ *v2*

  **Number** `v1` -> The Start value
  **Number** `v2` -> The end value
  **Number** `sep` -> The value added each time an assignment is made

  ```lua
  local zeroTo10 = Range(0, 10)
  ```

  [ **return** ] : **Table**

- **Copy()**

  Make a copy of the **Table**

  **Table** `org` -> Source of copy
  **Table** `res` -> The **Table** that was copied

  ```lua
  Copy(org, res)
  ```

  [ **return** ] : **nil**

- **Array()**

  Create an index *1* ~ *max* are x <u>order</u> **Table**

  **Any** `value` -> The value

  **max** `max` -> The index upper limit *defaults to* **SET.maxPlayers**

  ```lua
  local array = Array(value, max)
  ```

  [ **return** ] : **Table**

- **remove()**

  Remove the specified **library**

  **String** `name` -> The library name

  ```lua
  remove(name)
  ```

  [ **return** ] : **nil**

- **import()**

  Import the specified **library**

  **String** `proJname` -> The library name（The file name）

  **String** `alias` -> The library alias（The object name）

  ```lua
  import(proJname, alias)
  ```

  [ **return** ] : nil

- **in spairs()**

  Returns iterators in which the string in the **Table** is the **Key** value, in order

  **Table** `t` -> The **Table** that was provided for the returned

  ```lua
  for k, v in spairs(t) do
  	-- some code
  end
  ```

  [ **returnS** ] : **Any**

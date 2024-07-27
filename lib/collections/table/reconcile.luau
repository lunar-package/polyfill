local copy = require("./copy")
local t = require("../../types")

type Table<K, V> = t.Table<K, V>

local function reconcile<S, T>(src: S, template: T): S & T
  assert(type(src) == "table", "First argument must be a table")
  assert(type(template) == "table", "Second argument must be a table")

  local tbl = table.clone(src)

  for key, value in template :: Table<any, any> do
    if tbl[key] == nil then
      if typeof(value) == "table" then
        tbl[key] = copy(value :: any, true)
      else
        tbl[key] = value
      end
    elseif typeof((template :: {})[key]) == "table" then
      if typeof(value) == "table" then
        tbl[key] = reconcile(value :: any, (template :: {})[key])
      else
        tbl[key] = copy((template :: {})[key], true)
      end
    end
  end

  return (tbl :: any) :: S & T
end

return reconcile

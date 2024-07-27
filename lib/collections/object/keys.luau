local t = require("../../types")
type Array<T> = t.Array<T>
type Table = { [any]: any }

return function(value: Table | string): Array<string>
  if value == nil then
    error("cannot extract keys from a nil value")
  end

  local valueType = typeof(value)

  local keys
  if valueType == "table" then
    keys = {}

    for key in pairs(value :: Table) do
      table.insert(keys, key)
    end
  elseif valueType == "string" then
    local length = (value :: string):len()
    keys = table.create(length)
    for i = 1, length do
      keys[i] = tostring(i)
    end
  end

  return keys
end

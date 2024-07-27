local t = require("../../types")
type Array<T> = t.Array<T>

return function<T>(value: { [string]: T } | Array<T> | string): Array<T> | Array<string>
  if value == nil then
    error("cannot extract values from a nil value")
  end
  local valueType = typeof(value)

  local array: Array<T> | Array<string>
  if valueType == "table" then
    array = {} :: Array<T>
    for _, keyValue in pairs(value :: { [string]: T } | Array<T>) do
      table.insert(array, keyValue)
    end
  elseif valueType == "string" then
    -- optimization to avoid rehashing/growth
    local valueStringLength = (value :: string):len()
    array = table.create(valueStringLength)
    for i = 1, valueStringLength do
      (array :: Array<string>)[i] = (value :: string):sub(i, i)
    end
  end

  return array
end

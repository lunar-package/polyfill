local isArray = require("./isArray")
local t = require("../../types")
type Array<T> = t.Array<T>

return function<T>(array: Array<T>, ...: T): number
  if not isArray(array) then
    error(string.format("Array.unshift called on non-array %s", typeof(array)))
  end

  local numberOfItems = select("#", ...)
  if numberOfItems > 0 then
    for i = numberOfItems, 1, -1 do
      local toInsert = select(i, ...)
      table.insert(array, 1, toInsert)
    end
  end

  return #array
end

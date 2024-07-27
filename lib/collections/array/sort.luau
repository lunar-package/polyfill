local None = require("../object/None")
local t = require("../../types")
type Array<T> = t.Array<T>
type Comparable = (any, any) -> number
local defaultSort = function<T>(a: T, b: T): boolean
  return type(a) .. tostring(a) < type(b) .. tostring(b)
end

return function<T>(array: Array<T>, compare: Comparable?): Array<T>
  local wrappedCompare = defaultSort
  if compare ~= nil and compare ~= None then
    if typeof(compare :: any) ~= "function" then
      error("invalid argument to Array.sort: compareFunction must be a function")
    end
    wrappedCompare = function<T>(a: T, b: T)
      local result = compare(a, b)
      if typeof(result) ~= "number" then
        error(("invalid result from compare function, expected number but got %s"):format(typeof(result)))
      end
      return result < 0
    end
  end
  table.sort(array, wrappedCompare)
  return array
end

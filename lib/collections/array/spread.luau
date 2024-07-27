local isArray = require("./isArray")
local t = require("../../types")

type Array<T> = t.Array<T>

return function<T>(array: Array<T>, i: number?, j: number?): ...T
  if not isArray(array) then
    error(string.format("Array.spread called on non-array %s", typeof(array)))
  end
  local startIndex = i or 1
  local endIndex = j or #array
  if startIndex > endIndex then
    return -- Return nothing if start index exceeds end index
  end

  local results = {}
  local count = 0
  for i = startIndex, endIndex do
    count += 1
    results[count] = array[i]
  end

  local function spread_helper(t, i)
    if i > count then
      return
    else
      return t[i], spread_helper(t, i + 1)
    end
  end

  return spread_helper(results, 1)
end

local t = require("../../types")
type Array<T> = t.Array<T>

return function<T>(array: Array<T>, searchElement: T, fromIndex: number?): number
  local fromIndex_ = fromIndex or 1
  local length = #array

  if fromIndex_ < 1 then
    fromIndex_ = math.max(length - math.abs(fromIndex_), 1)
  end

  for i = fromIndex_, length do
    if array[i] == searchElement then
      return i
    end
  end

  return -1
end

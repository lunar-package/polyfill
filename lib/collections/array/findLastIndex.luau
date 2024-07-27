local t = require("../../types")
type Array<T> = t.Array<T>
type PredicateFunction<T> = (T, number, Array<T>) -> boolean

return function<T>(array: Array<T>, predicate: PredicateFunction<T>): number
  local lastIndex: number
  for i = 1, #array do
    local element = array[i]
    if predicate(element, i, array) then
      lastIndex = i
    end
  end
  return lastIndex or -1
end

local t = require("../../types")
type Array<T> = t.Array<T>
type PredicateFunction<T> = (T, number, Array<T>) -> boolean

return function<T>(array: Array<T>, predicate: PredicateFunction<T>): number
  for i = 1, #array do
    local element = array[i]
    if predicate(element, i, array) then
      return i
    end
  end
  return -1
end

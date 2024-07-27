local t = require("../../types")
type Array<T> = t.Array<T>
type PredicateFunction<T> = (value: T, index: number, array: Array<T>) -> boolean

return function<T>(array: Array<T>, predicate: PredicateFunction<T>): T | nil
  local lastElement: T | nil
  for i = 1, #array do
    local element = array[i]
    if predicate(element, i, array) then
      lastElement = element
    end
  end
  return lastElement
end

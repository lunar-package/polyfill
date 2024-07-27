local t = require("../../types")
type Array<T> = t.Array<T>
type reduceFn<T, U> = (previousValue: U, currentValue: T, currentIndex: number, array: Array<T>) -> U

return function<T, U>(array: Array<T>, callbackFn: reduceFn<T, U>, initialValue: U?): U
  if typeof(array) ~= "table" then
    error(string.format("Array.reduce called on %s", typeof(array)))
  end
  if typeof(callbackFn) ~= "function" then
    error("callbackFn is not a function")
  end

  local length = #array

  local value: T | U
  local initial = 1

  if initialValue ~= nil then
    value = initialValue
  else
    initial = 2
    if length == 0 then
      error("reduce of empty array with no initial value")
    end
    value = array[1]
  end

  for i = initial, length do
    value = callbackFn(value :: U, array[i], i, array)
  end

  return value :: U
end

local t = require("../../types")
type Array<T> = t.Array<T>
type Object = t.Object
type callbackFn<T> = (element: T, index: number, array: Array<T>) -> boolean
type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> boolean

return function<T, U>(t: Array<T>, callback: callbackFn<T> | callbackFnWithThisArg<T, U>, thisArg: U?): Array<T>
  if typeof(t) ~= "table" then
    error(string.format("Array.filter called on %s", typeof(t)))
  end
  if typeof(callback) ~= "function" then
    error("callback is not a function")
  end

  local len = #t
  local res = {}
  local index = 1

  if thisArg == nil then
    for i = 1, len do
      local kValue = t[i]
      if kValue ~= nil then
        if (callback :: callbackFn<T>)(kValue, i, t) then
          res[index] = kValue
          index += 1
        end
      end
    end
  else
    for i = 1, len do
      local kValue = t[i]
      if kValue ~= nil then
        if (callback :: callbackFnWithThisArg<T, U>)(thisArg, kValue, i, t) then
          res[index] = kValue
          index += 1
        end
      end
    end
  end

  return res
end

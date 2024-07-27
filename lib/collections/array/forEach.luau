local t = require("../../types")
type Array<T> = t.Array<T>
type Object = t.Object

type callbackFn<T> = (element: T, index: number, array: Array<T>) -> ()
type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> ()

return function<T, U>(t: Array<T>, callbackFn: callbackFn<T> | callbackFnWithThisArg<T, U>, thisArg: U?): ()
  if typeof(t) ~= "table" then
    error(string.format("Array.forEach called on %s", typeof(t)))
  end

  if typeof(callbackFn) ~= "function" then
    error("callbackFn is not a function")
  end

  local len = #t
  local k = 1

  while k <= len do
    local kValue = t[k]

    if thisArg ~= nil then
      (callbackFn :: callbackFnWithThisArg<T, U>)(thisArg, kValue, k, t)
    else
      (callbackFn :: callbackFn<T>)(kValue, k, t)
    end

    if #t < len then
      -- don't iterate on removed items, don't iterate more than original length
      len = #t
    end
    k += 1
  end
end

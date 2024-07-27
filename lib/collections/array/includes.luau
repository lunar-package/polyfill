local indexOf = require("./indexOf")
local t = require("../../types")

type Array<T> = t.Array<T>

return function<T>(array: Array<T>, searchElement: T, fromIndex: number?): boolean
  return indexOf(array, searchElement, fromIndex) ~= -1
end

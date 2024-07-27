local t = require("../../types")

type Array<T> = t.Array<T>

return function<T>(array: Array<T>): T?
  return table.remove(array, #array)
end

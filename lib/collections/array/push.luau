local t = require("../../types")

type Array<T> = t.Array<T>

return function<T>(arr: Array<T>, ...: T)
  local varArgs = select("#", ...)
  for i = 1, varArgs do
    local arg = select(i, ...)
    table.insert(arr, arg)
  end
end

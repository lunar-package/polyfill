local t = require("../../types")
type Array<T> = t.Array<T>

return function<T>(t: Array<T>): Array<T>
  local n = #t
  local i = 1
  while i < n do
    t[i], t[n] = t[n], t[i]
    i = i + 1
    n = n - 1
  end
  return t
end

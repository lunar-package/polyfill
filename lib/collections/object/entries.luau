local t = require("../../types")
type Array<T> = t.Array<T>
type Tuple<T, V> = t.Tuple<T, V>

return function<T>(value: string | { [string]: T } | Array<T>): Array<Tuple<string, T>>
  assert(value :: any ~= nil, "cannot get entries from a nil value")
  local valueType = typeof(value)

  local entries: Array<Tuple<string, T>> = {}
  if valueType == "table" then
    for key, keyValue in pairs(value :: { [string]: T } | Array<T>) do
      table.insert(entries, { key, keyValue })
    end
  elseif valueType == "string" then
    for i = 1, string.len(value :: string) do
      entries[i] = { tostring(i), string.sub(value :: string, i, i) }
    end
  end

  return entries
end

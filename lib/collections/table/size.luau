local t = require("../../types")

type Table<K, V> = t.Table<K, V>

return function<K, V>(t: Table<K, V>): number
  if typeof(t) ~= "table" then
    return 0
  end

  local count = 0
  for k in t do
    count += 1
  end

  return count
end

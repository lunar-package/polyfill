local t = require("../../types")

type Table<K, V> = t.Table<K, V>

local function copy<K, V>(t: Table<K, V>, deep: boolean?): Table<K, V>
  if not deep then
    return table.clone(t)
  end
  local clone = table.clone(t)
  for index, value in clone do
    if typeof(value) == "table" then
      clone[index] = copy(value, deep) :: any
    end
  end
  return clone
end

return copy

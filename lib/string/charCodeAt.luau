local Number = require("../number")

local NaN = Number.NaN

return function(str: string, index: number): number
  if type(index) ~= "number" then
    index = 1
  end
  local length = string.len(str)
  if index < 1 or index > length then
    return NaN
  end

  local offset = utf8.offset(str, index)

  if offset == nil or offset > length then
    return NaN
  end

  local value = utf8.codepoint(str, offset, offset)

  if value == nil then
    return NaN
  end

  return value
end

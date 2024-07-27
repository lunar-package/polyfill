local function slice(str: string, startIndexStr: string | number, lastIndexStr: (string | number)?): string
  local strLen, invalidBytePosition = utf8.len(str)
  assert(strLen ~= nil, ("string `%s` has an invalid byte at position %s"):format(str, tostring(invalidBytePosition)))
  local startIndex = tonumber(startIndexStr)
  assert(typeof(startIndex) == "number", "startIndexStr should be a number")

  if startIndex + strLen < 0 then
    startIndex = 1
  end

  if startIndex > strLen then
    return ""
  end

  local lastIndex = strLen + 1
  if lastIndexStr ~= nil then
    local NaN = 0 / 0
    lastIndex = tonumber(lastIndexStr) or NaN
  end
  assert(typeof(lastIndex) == "number", "lastIndexStr should convert to number")

  if lastIndex > strLen then
    lastIndex = strLen + 1
  end

  local startIndexByte = utf8.offset(str, startIndex) :: number
  local lastIndexByte = utf8.offset(str, lastIndex) :: number - 1

  return string.sub(str, startIndexByte, lastIndexByte)
end

return slice

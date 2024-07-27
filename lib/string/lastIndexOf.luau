local function lastIndexOf(str: string, searchValue: string, fromIndex: number?): number
  local strLength = string.len(str)
  local calculatedFromIndex
  if fromIndex then
    calculatedFromIndex = fromIndex
  else
    calculatedFromIndex = strLength
  end
  if fromIndex and fromIndex < 1 then
    calculatedFromIndex = 1
  end
  if fromIndex and fromIndex > strLength then
    calculatedFromIndex = strLength
  end
  if searchValue == "" then
    return calculatedFromIndex :: number
  end

  local lastFoundStartIndex, foundStartIndex
  local foundEndIndex: number? = 0
  repeat
    lastFoundStartIndex = foundStartIndex
    foundStartIndex, foundEndIndex = string.find(str, searchValue, foundEndIndex :: number + 1, true)
  until foundStartIndex == nil or foundStartIndex > calculatedFromIndex

  if lastFoundStartIndex == nil then
    return -1
  end
  return lastFoundStartIndex :: number
end

return lastIndexOf

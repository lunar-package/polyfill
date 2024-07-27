local luaPatternCharacters = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(str: string, searchElement: string, fromIndex: number?): number
  local length = #str
  local fromIndex_ = if fromIndex ~= nil then if fromIndex < 1 then 1 else fromIndex :: number else 1

  if #searchElement == 0 then
    return if fromIndex_ > length then length else fromIndex_
  end

  if fromIndex_ > length then
    return -1
  end

  searchElement = searchElement:gsub(luaPatternCharacters, "%%%1")
  local searchElementLength = #searchElement

  for i = fromIndex_, length do
    if string.sub(str, i, i + searchElementLength - 1) == searchElement then
      return i
    end
  end

  return -1
end

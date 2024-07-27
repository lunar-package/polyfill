type Match = {
  index: number,
  match: string,
}

local luaPatternCharacters = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

local function findOr(str: string, patternTable: { string }, initIndex: number?): Match | nil
  local init = utf8.offset(str, initIndex or 1)
  local matches = {}
  for _, value in patternTable do
    value = value:gsub(luaPatternCharacters, "%%%1")
    local iStart, iEnd = string.find(str, value, init)
    if iStart then
      local prefix = string.sub(str, 1, iStart - 1)
      local prefixEnd, invalidBytePosition = utf8.len(prefix)
      if prefixEnd == nil then
        error(("string `%s` has an invalid byte at position %s"):format(prefix, tostring(invalidBytePosition)))
      end
      local iStartIndex = prefixEnd :: number + 1
      local match = {
        index = iStartIndex,
        match = string.sub(str, iStart, iEnd),
      }
      table.insert(matches, match)
    end
  end

  if #matches == 0 then
    return nil
  end

  local firstMatch
  for _, value in matches do
    if firstMatch == nil then
      firstMatch = value
    end
    if value.index < firstMatch.index then
      firstMatch = value
    end
  end

  return firstMatch
end

return findOr

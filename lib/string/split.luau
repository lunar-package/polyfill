local function gsplit(text: string, pattern: string, plain: boolean?): () -> ...string
  local splitStart, length = 1, #text
  return function(): ...string
    if splitStart then
      local sepStart, sepEnd = string.find(text, pattern, splitStart, plain)
      local ret
      if not sepStart then
        ret = string.sub(text, splitStart)
        splitStart = nil :: any
      elseif sepEnd < sepStart then
        ret = string.sub(text, splitStart, sepStart)
        if sepStart < length then
          splitStart = sepStart + 1
        else
          splitStart = nil :: any
        end
      else
        ret = sepStart > splitStart and string.sub(text, splitStart, sepStart - 1) or ""
        splitStart = sepEnd :: number + 1
      end
      return ret
    end
    return
  end
end

return function(text: string, pattern: string, plain: boolean?)
  local ret = {}
  for match in gsplit(text, pattern, plain) do
    table.insert(ret, match)
  end
  return ret
end

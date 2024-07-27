return function(str: string, len: number, pad: string?)
  pad = pad or " "

  local strLen = #str
  local padLen = len - strLen

  if padLen <= 0 then
    return str
  end

  local paddedStr = str .. string.rep(pad :: string, padLen)

  return string.sub(paddedStr, 1, strLen < len and len or strLen)
end

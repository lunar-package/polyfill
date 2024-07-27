return function(str: string, len: number, pad: string?)
  pad = pad or " "

  local strLen = #str
  local padLen = len - strLen

  if padLen <= 0 then
    return str
  end

  local paddedStr = string.rep(pad :: string, padLen) .. str

  return string.sub(paddedStr, -len)
end

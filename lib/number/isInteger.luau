return function(value)
  return type(value) == "number" and value ~= math.huge and value == math.floor(value)
end

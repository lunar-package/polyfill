local t = require("../../types")
type Array<T> = t.Array<T>

return function<T>(array: Array<T>, start: number, deleteCount: number?, ...: T): Array<T>
  if start > #array then
    local varargCount = select("#", ...)
    for i = 1, varargCount do
      local toInsert = select(i, ...)
      table.insert(array, toInsert)
    end
    return {}
  else
    local length = #array
    if start < 1 then
      start = math.max(length - math.abs(start), 1)
    end

    local deletedItems = {} :: Array<T>
    local deleteCount_: number = deleteCount or length
    if deleteCount_ > 0 then
      local lastIndex = math.min(length, start + math.max(0, deleteCount_ - 1))

      for i = start, lastIndex do
        local deleted = table.remove(array, start) :: T
        table.insert(deletedItems, deleted)
      end
    end

    local varargCount = select("#", ...)
    for i = varargCount, 1, -1 do
      local toInsert = select(i, ...)
      table.insert(array, start, toInsert)
    end

    return deletedItems
  end
end

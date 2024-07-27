local Array = require("./array")
local Object = require("./object")
local Table = require("./table")

local t = require("../types")

export type Array<T> = t.Array<T>
export type Object = t.Object
export type Table<K, V> = t.Table<K, V>

return {
  Array = Array,
  Object = Object,
  Table = Table,
}

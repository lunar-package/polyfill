local sync = require("./sync")
local t = require("../../types")

export type Table<K, V> = t.Table<K, V>

return {
  copy = require("./copy"),
  sync = sync,
  size = require("./size"),
}

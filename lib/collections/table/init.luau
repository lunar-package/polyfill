local t = require("../../types")

export type Table<K, V> = t.Table<K, V>

return {
  copy = require("./copy"),
  sync = require("./sync"),
  size = require("./size"),
}

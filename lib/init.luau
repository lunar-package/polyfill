local Collections = require("./collections")
local Number = require("./number")
local String = require("./string")
local Timers = require("./timers")
local t = require("./types")

local Error = require("./error")

export type Array<T> = t.Array<T>
export type Error = Error.Error
export type Object = t.Object

export type Table<K, V> = t.Table<K, V>
export type Timeout = Timers.Timeout
export type Interval = Timers.Interval

return {
  Array = Collections.Array,
  Error = Error,
  Number = Number,
  Object = Collections.Object,
  Table = Collections.Table,
  String = String,
  setTimeout = Timers.setTimeout,
  clearTimeout = Timers.clearTimeout,
  setInterval = Timers.setInterval,
  clearInterval = Timers.clearInterval,
}

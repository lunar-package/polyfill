local lib = require("./lib/init.luau")

export type Array<T> = lib.Array<T>
export type Error = lib.Error
export type Object = lib.Object

export type Table<K, V> = lib.Table<K, V>
export type Timeout = lib.Timeout
export type Interval = lib.Interval

return lib

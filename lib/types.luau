export type Object = { [string]: any }
export type Array<T> = { [number]: T }
export type Table<T, V> = { [T]: V }
export type Tuple<T, V> = Array<T | V>
export type Function = (...any) -> any

return {}

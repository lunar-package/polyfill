local t = require("../../types")

export type Array<T> = t.Array<T>

return {
  concat = require("./concat"),
  every = require("./every"),
  filter = require("./filter"),
  find = require("./find"),
  findIndex = require("./findIndex"),
  findLast = require("./findLast"),
  findLastIndex = require("./findLastIndex"),
  forEach = require("./forEach"),
  includes = require("./includes"),
  indexOf = require("./indexOf"),
  isArray = require("./isArray"),
  join = require("./join"),
  map = require("./map"),
  pop = require("./pop"),
  push = require("./push"),
  reduce = require("./reduce"),
  reverse = require("./reverse"),
  shift = require("./shift"),
  slice = require("./slice"),
  some = require("./some"),
  sort = require("./sort"),
  splice = require("./splice"),
  spread = require("./spread"),
  unshift = require("./unshift"),
}

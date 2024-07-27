local task = require("@lune/task")
local Object = require("../collections").Object

local makeIntervalImpl = require("./makeIntervalImpl")
local makeTimerImpl = require("./makeTimerImpl")

export type Timeout = makeTimerImpl.Timeout
export type Interval = makeIntervalImpl.Interval

return Object.assign({}, makeTimerImpl(task.delay), makeIntervalImpl(task.delay))

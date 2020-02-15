-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:59
--- Description  : 时间与日期操作类
------------------------------------------------
local DateTime, base = extends(Object, "DateTime")

function DateTime.Now()
    local date = os.date("%Y-%m-%d %H:%M:%S");
    return date
end

return DateTime
-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:45
--- Description  : 日志管理器
------------------------------------------------
local Logger = {}

function Logger:Debug(info)
    Console.WriteLine(String.Format("[DEBUG][{0}] {1}", DateTime.Now(), info))
end

function Logger:Warning(info)
    Console.WriteLine(String.Format("[Warning][{0}] {1}", DateTime.Now(), info))
end

function Logger:Error(info)
    Console.WriteLine("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
    Console.WriteLine(String.Format("[Error][{0}] {1}", DateTime.Now(), info))
    Console.WriteLine(debug.traceback())
    Console.WriteLine("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
end

return Logger
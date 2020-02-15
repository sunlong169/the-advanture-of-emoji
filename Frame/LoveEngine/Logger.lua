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
    Console.WriteLine("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
end

return Logger
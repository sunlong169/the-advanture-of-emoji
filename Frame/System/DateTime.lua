local DateTime, base = extends(Object, "DateTime")

function DateTime.Now()
    local date = os.date("%Y-%m-%d %H:%M:%S");
    return date
end

return DateTime
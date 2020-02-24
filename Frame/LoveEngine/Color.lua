-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/24 11:52
--- Description  : 颜色
------------------------------------------------
---@class Color : Object
local Color, base = extends("Color", Object)

function Color:Constructor(r, g, b, a)
    self.r = r or 0
    self.g = g or 0
    self.b = b or 0
    self.a = a or 0
end

function Color:ToString()
    return string.format("{r=%s, g=%s, b=%s, a=%s}", self.r, self.g, self.b, self.a)
end

Color.White = Color.New(1,1,1,1)
Color.Black = Color.New(0,0,0,1)
Color.Red   = Color.New(1,0,0,1)
Color.Green = Color.New(0,1,0,1)
Color.Blue  = Color.New(0,0,1,1)

return Color
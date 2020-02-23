-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/20 19:28
--- Description  : 图片对象
------------------------------------------------
---@class Sprite : Object
local Sprite, base = extends("Sprite", Object)

function Sprite:Constructor(imgData, size)
    self.m_size = size or Size.New(100, 100)
    self.m_imageData = imgData
end

function Sprite:SetSize(value)
    self.m_size = value
end
---@return Size
function Sprite:GetSize()
    return self.m_size
end

return Sprite
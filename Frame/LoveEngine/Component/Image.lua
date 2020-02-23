-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:48
--- Description  : 图片组件
------------------------------------------------
---@class Image : Component
local Image, base = extends("Image", Component)

function Image:Constructor()
    --图片对象
    ---@type Sprite
    self.sprite = nil
end

---设置或获取精灵
function Image:SetSprite(value)
    self.sprite = value
end
function Image:GetSprite()
    return self.sprite
end

---设置默认大小
function Image:SetNativeSize()
    self.transform:SetSize(self.sprite:GetSize())
end

function Image:Update(dt)
    
end

function Image:__draw()
    if self.sprite then
        Camera.RenderImage(self)
    end
end

return Image
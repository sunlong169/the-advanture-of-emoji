-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:48
--- Description  : 图片组件
------------------------------------------------
local Image, base = extends(Component, "Image")

function Image:Constructor()
    self.sprite = nil
end

function Image:SetSprite(value)
    self.sprite = value
end

function Image:Update(dt)
    
end

function Image:__draw()
    if self.sprite then
        IDraw.DrawImage(self)
    end
end

return Image
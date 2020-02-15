-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:48
--- Description  : 图片组件
------------------------------------------------
local Image, base = extends(Component, "Image")

function Image:Constructor()
    self.m_size = Size.New()
    self.sprite = nil
end

--size暂时没用
function Image:GetSize()
    return self.m_size
end
function Image:SetSize(size)
    self.m_size = size
end

function Image:SetSprite(path)
    self.sprite = love.graphics.newImage(path)
end

function Image:Update(dt)
    
end

function Image:__draw()
    if self.sprite then
        IDraw.DrawImage(self)
    end
end

return Image
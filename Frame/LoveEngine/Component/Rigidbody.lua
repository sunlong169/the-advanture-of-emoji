-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/19 01:29
--- Description  : 刚体
------------------------------------------------
---@class Rigidbody : Component
local Rigidbody, base = extends("Rigidbody", Component)

function Rigidbody:Constructor()
    --重力
    self.m_gravity = 1
    --速度
    self.m_velocity = Vector2.New()
    --接管的碰撞器
    self.m_collider = nil
end

function Rigidbody:SetVelocity(value)
    self.m_velocity = value
end
function Rigidbody:GetVelocity()
    return self.m_velocity
end

function Rigidbody:SetGravity(value)
    self.m_gravity = value
end
function Rigidbody:GetGravity()
    return self.m_gravity
end

function Rigidbody:Update(dt)
    --速度 重力
    
    self.transform:Translate(self.m_velocity.x, -self.m_velocity.y + self.m_gravity)
end

return Rigidbody
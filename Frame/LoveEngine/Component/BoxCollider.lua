-------------------ModuleInfo-------------------
--- Author       : dubq
--- Date         : 2020/02/16 20:33
--- Description  : 盒碰撞
------------------------------------------------
---@class BoxCollider : Component
local BoxCollider, base = extends("BoxCollider", Component)

function BoxCollider:Constructor()
    self.layer = nil
    self.size = Size.New()
    self.offset = Vector2.New()
end

function BoxCollider:GetPoints()
    local pivot = self.transform:GetPosition() + self.offset
    local one = pivot + self.size / 2
end

---启用事件
function BoxCollider:OnEnable()
    base.OnEnable(self)
end

---禁用事件
function BoxCollider:OnDisable()
    base.OnDisable(self)
end

---碰撞检验事件，传入碰撞对象，需返回布尔，如果为true 则触发相碰撞的两个物体所有组件上的OnCollider事件
function BoxCollider:__collider(collider)
    local colliderName = collider:GetType():GetName()
    if colliderName == gettype(BoxCollider):GetName() then
        
        --目标同样也是盒子碰撞
    end
end

---帧更新事件
function BoxCollider:Update(dt)

end

---销毁事件
function BoxCollider:OnDestroy()

end

---绘图事件
function BoxCollider:__draw()

end

return BoxCollider
-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 01:28
--- Description  : 游戏场景内的实体抽象类
------------------------------------------------
local Entity, base = extends(Object, "Entity")

function Entity:Constructor(id, entitiType)
    self.m_id = id
    self.m_entityType = entitiType
end

function Entity:GetId()
    return self.m_id
end
function Entity:GetEntityType()
    return self.m_entityType
end

return Entity
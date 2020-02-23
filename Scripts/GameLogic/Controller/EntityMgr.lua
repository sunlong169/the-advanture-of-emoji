-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 01:26
--- Description  : 实体管理器
------------------------------------------------

EntityType = {
    player = "player",
}
local EntityClass = {
    player = PlayerEntity,
}
---@class EntityMgr : Singleton
local EntityMgr, base = extends("EntityMgr", Singleton)

function EntityMgr:Constructor()
    self.m_entities = ArrayList.New()
    self.m_idCount = 0
end

---通过实体类型创建并返回实体对象
function EntityMgr:CreateEntity(entityType)
    Logger:Debug("创建实体"..entityType)
    self.m_idCount = self.m_idCount + 1
    local entity = EntityClass[entityType].New(self.m_idCount, entityType)
    return entity
end

---通过Id查找实体
function EntityMgr:GetEntityById(id)
    for _, entity in ipairs(self.m_entities) do
        if entity:GetId() == id then
            return entity
        end
    end
end

---通过类型查找全部实体
function EntityMgr:GetEntitiesByType(entityType)
    local entities = ArrayList.New()
    for _, entity in ipairs(self.m_entities) do
        if entity:GetEntityType() == entityType then
            entities:Add(entity)
        end
    end
    return entities
end

---移除实体
function EntityMgr:RemoveEntity(entity)
    self.m_entities:Remove(entity)
    delete(entity)
end

---通过id移除实体
function EntityMgr:RemoveEntityById(id)
    self:RemoveEntity(self:GetEntityById(id))
end

---通过类型移除实体
function EntityMgr:RemoveEntitiesByType(entityType)
    local entities = self:GetEntitiesByType(entityType)
    for _, entity in ipairs(entities) do
        self:RemoveEntity(entity)
    end
end

---清除所有实体
function EntityMgr:Reset()
    for _, value in ipairs(self.m_entities) do
        delete(value)
    end
    self.m_entities:Clear()
    self.m_idCount = 0
end

return EntityMgr
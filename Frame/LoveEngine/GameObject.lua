local GameObject, base = extends(Behaviour, "GameObject")

--构造函数
function GameObject:Constructor(name, parent)
    self.name = name
    self.transform = Transform.New(self)
    self.active = true
    self.parent = parent

    self.m_childList = ArrayList.New()
    self.m_componentList = ArrayList.New()
    self:AddComponent(ftypeof(Transform))
end

---添加组件
---@return Component
function GameObject:AddComponent(componentType)
    local component = ftypeof(componentType).__protoType.New(self)
    self.m_componentList:Add(component)
end

---移除组件
function GameObject:RemoveComponent(componentType)
    self.m_componentList:ForEach(function(v)
        if ftypeof(v) == componentType then
            self.m_componentList:Remove(v)
            return
        end
    end)
end

---获取组件
---@return Component
function GameObject:GetComponent(componentType)
    self.m_componentList:ForEach(function(v)
        if ftypeof(v) == componentType then
            return v
        end
    end)
end

--override
function GameObject:Update(dt)
    self.m_componentList:ForEach(function(v)
        if not v.m_isInit and v.Start then
            v:Start()
        end
        if v.Update and v.m_enable then
            v:Update(dt)
        end
    end)
end

---激活状态
function GameObject:SetActive(bol)
    self.active = bol
end

---设置父对象
function GameObject:SetParent(parent)
    self.parent = parent
end

return GameObject

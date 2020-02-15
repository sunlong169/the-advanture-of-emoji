local GameObject, base = extends(Behaviour, "GameObject")

GameObject.m_GlobalGameObject = ArrayList.New()

---获取场景内的物体
---@return GameObject
function GameObject.Find(name)
    local go = nil
    GameObject.m_GlobalGameObject:ForEach(function(v)
        if v.name == name then
            go = v
        end
    end)
    return go
end

---销毁场景中的物体
function GameObject.Destroy(gameObject)
    GameObject.m_GlobalGameObject.Remove(gameObject)
end

--构造函数
function GameObject:Constructor(name, parent)
    self.name = name
    self.transform = Transform.New(self)
    self.active = true
    self.parent = parent

    self.m_childList = ArrayList.New()
    self.m_componentList = ArrayList.New()
    self:AddComponent(ftypeof(Transform))

    GameObject.m_GlobalGameObject.Add(self)
end

---添加组件
---@return Component
function GameObject:AddComponent(componentType)
    ---@type Type
    local comtype = ftypeof(componentType)
    local component = comtype:CreateInstance(self)
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
    local component = nil
    self.m_componentList:ForEach(function(v)
        if ftypeof(v) == componentType then
            component = v
        end
    end)
    return component
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
    assert(type(bol) == 'boolean')
    local last = self.active
    self.active = bol
    if self.active == true and last == false then
        --激活
        self.m_componentList:ForEach(function(v)
            if v.OnEnable then
                v:OnEnable()
            end
        end)
    elseif self.active == false and last == true then
        --反激活
        self.m_componentList:ForEach(function(v)
            if v.OnDisable then
                v:OnDisable()
            end
        end)
    end
end

---设置父对象
function GameObject:SetParent(parent)
    self.parent = parent
end

return GameObject

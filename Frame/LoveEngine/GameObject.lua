-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:44
--- Description  : 游戏物体对象
------------------------------------------------
local GameObject, base = extends(Object, "GameObject")

---获取场景内的物体
---@return GameObject
function GameObject.Find(name)
    local go = nil
    Scene.m_GlobalGameObject:ForEach(function(i, v)
        if v.name == name then
            go = v
        end
    end)
    return go
end

---销毁场景中的物体
function GameObject.Destroy(gameObject)
    delete(gameObject)
end

--构造函数
function GameObject:Constructor(name, parent)
    self.name = name or "GameObject"
    self.active = true

    self.m_componentList = ArrayList.New()
    self.transform = self:AddComponent(Transform, parent)

    Scene.m_GlobalGameObject:Add(self)
end

--析构
function GameObject:Destructor()
    Scene.m_GlobalGameObject:Remove(self)
    --先执行一遍事件，然后在对其析构
    for _, component in ipairs(self.m_componentList) do
        component:OnDestroy()
    end
    for _, component in ipairs(self.m_componentList) do
        delete(component)
    end

    self.m_componentList = nil
end

function GameObject:__draw()
    for _, value in ipairs(self.m_componentList) do
        value:__draw()
    end
end

---添加组件
function GameObject:AddComponent(componentType, ...)
    ---@type Type
    local comtype = ftypeof(componentType)
    local component = comtype:CreateInstance(self, ...)
    self.m_componentList:Add(component)
    return component
end

---移除组件
function GameObject:RemoveComponent(componentType)
    for index, value in ipairs(self.m_componentList) do
        if ftypeof(value) == componentType then
            self.m_componentList:Remove(v)
            return
        end
    end
end

---获取组件
---@return Component
function GameObject:GetComponent(componentType)
    local component = nil
    self.m_componentList:ForEach(function(i, v)
        if ftypeof(v) == componentType then
            component = v
        end
    end)
    return component
end

--override
function GameObject:Update(dt)
    self.m_componentList:ForEach(function(i, v)
        if not v.m_isInit and v.Start then
            v:Start()
            v.m_isInit = true
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
        self.m_componentList:ForEach(function(i, v)
            if v.m_enable then
                v:OnEnable()
            end
        end)
    elseif self.active == false and last == true then
        --反激活
        self.m_componentList:ForEach(function(i, v)
            if v.m_enable then
                v:OnDisable()
            end
        end)
    end
end

return GameObject

-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:44
--- Description  : 游戏物体对象
------------------------------------------------
local GameObject, base = extends(Object, "GameObject")

---获取场景内的物体
---@return GameObject
function GameObject.Find(name)
    return SceneManager.FindGameObject(name)
end

---销毁场景中的物体
function GameObject.Destroy(gameObject)
    SceneManager.DestroyGameObject(gameObject)
end

--构造函数
function GameObject:Constructor(name, parent)
    self.name = name or "GameObject"
    self.active = true

    self.m_componentList = ArrayList.New()
    self.transform = Transform --此句话仅为了智能提示，没有实际意义
    self.transform = self:AddComponent(Transform, parent)

    SceneManager.NewGameObject(self)
end

--析构
function GameObject:Destructor()
    --先执行一遍事件，然后在对其析构
    for _, component in ipairs(self.m_componentList) do
        --为了取消订阅update
        component:SetEnabled(false)
        component:OnDestroy()
    end
    for _, component in ipairs(self.m_componentList) do
        delete(component)
    end

    self.m_componentList = nil
end

---渲染游戏物体
function GameObject:__draw()
    for index, value in ipairs(self.m_componentList) do
        --跳过transform，最后渲染
        if index ~= 1 then
            value:__draw()
        end
    end
    --最后transform渲染子物体
    self.m_componentList[1]:__draw()
end

---添加组件
function GameObject:AddComponent(componentType, ...)
    ---@type Type
    local comtype = gettype(componentType)
    local component = comtype:CreateInstance(self, ...)
    self.m_componentList:Add(component)
    return component
end

---移除组件
function GameObject:RemoveComponent(componentType)
    for index, value in ipairs(self.m_componentList) do
        if value:GetType() == gettype(componentType) then
            self.m_componentList:Remove(value)
            return
        end
    end
end

---获取组件
---@return Component
function GameObject:GetComponent(componentType)
    local component = nil
    for index, value in ipairs(self.m_componentList) do
        if value:GetType() == gettype(componentType) then
            component = value
            break
        end
    end
    return component
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

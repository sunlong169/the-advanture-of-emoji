-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:46
--- Description  : 组件类，所有组件都要继承此类
------------------------------------------------
local Component, base = extends(Object, "Component")

--构造
function Component:Constructor(gameObject)
    self.m_isInit = false
    self.m_enable = false

    self.gameObject = gameObject
    self.transform = Transform --此句话仅为了智能提示，没有实际意义
    self.transform = gameObject.transform

    --订阅帧更新
    self.m_updateEvent = function(dt)
        if not self.m_isInit then
            self:Start()
            self.m_isInit = true
        end
        self:Update(dt)
    end
    self:SetEnabled(true)
end

--析构
function Component:Destructor()

end

--设置开启与关闭
function Component:SetEnabled(bol)
    assert(type(bol) == 'boolean')
    local last = self.m_enable
    self.m_enable = bol
    if self.m_enable == true and last == false then
        --激活
        self:OnEnable()
        SceneManager.__addUpdateEvent(self.m_updateEvent)
    elseif self.m_enable == false and last == true then
        --反激活
        self:OnDisable()
        SceneManager.__removeUpdateEvent(self.m_updateEvent)
    end
end

---启用事件
function Component:OnEnable()
    
end

---禁用事件
function Component:OnDisable()

end

---第一次运行事件
function Component:Start()

end

---帧更新事件
function Component:Update(dt)

end
---销毁事件
function Component:OnDestroy()

end
---绘图事件
function Component:__draw()

end
---碰撞进入
function Component:OnColliderEnter()

end
---碰撞离开
function Component:OnColliderExit()

end
---碰撞穿透悬浮
function Component:OnColliderOver()

end

return Component
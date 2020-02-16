-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:38
--- Description  : 场景数据
------------------------------------------------
local Scene, base = extends(Object, "Scene")

function Scene:Constructor()
    ---场景内所有的游戏物体
    self.m_GlobalGameObject = ArrayList.New()
    ---渲染的根节点
    self.m_root = ArrayList.New()
    ---帧更新的列表
    self.m_updateList = ArrayList.New()
end

---绘制场景
function Scene:__draw()
    --通知所有顶层gameObject，顶层gameObject通知transform，transform通知所有子gameObject 以此绘制
    for _, trans in ipairs(self.m_root) do
        trans.gameObject:__draw()
    end
end

---订阅帧更新事件
function Scene:__addUpdateEvent(func)
    self.m_updateList:Add(func)
end
---取消订阅帧更新事件
function Scene:__removeUpdateEvent(func)
    self.m_updateList:Remove(func)
end

---通知所有订阅进行帧更新
function Scene:__update(dt)
    for _, component in ipairs(self.m_updateList) do
        component(dt)
    end
    self:LateUpdate()
end

---virtual 进入场景
function Scene:OnEnter()

end
---virtual 离开场景
function Scene:OnExit()

end
---virtual 帧更新事件，落后于update
function Scene:LateUpdate(dt)

end

return Scene
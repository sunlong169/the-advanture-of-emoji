-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:38
--- Description  : 场景数据
------------------------------------------------
local Scene, base = extends(Object, "Scene")

function Scene:Constructor(name)
    ---场景内所有的游戏物体
    self.name = name or "newScene"
    self.m_GlobalGameObject = ArrayList.New()
    ---渲染的根节点
    self.m_root = ArrayList.New()
    ---帧更新的列表
    self.m_updateList = ArrayList.New()
    --场景内的碰撞信息
    self.m_colliderInfo = ArrayList.New()
    --当前摄像机
    self.m_camera = Camera --仅为智能提示赋值
    self.m_camera = nil
end

function Scene:Destructor()
    for index, value in ipairs(self.m_root) do
        delete(value)
    end
end

---获取和设置当前摄像机
function Scene:GetCurrentCamera()
    return self.m_camera
end
function Scene:SetCurrentCamera(camera)
    self.m_camera = camera
end

---绘制场景
function Scene:__draw()
    --没有摄像机
    if not self.m_camera then
        IEngine.Print("no camera in "..self.name)
        return
    end
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
---添加移除碰撞信息
function Scene:__addSceneColliderInfo(collider)
    self.m_colliderInfo:Add(collider)
end
function Scene:__removeSceneColliderInfo(collider)
    self.m_colliderInfo:Remove(collider)
end

---通知所有订阅进行帧更新
function Scene:__update(dt)
    for _, component in ipairs(self.m_updateList) do
        component(dt)
    end
    self:LateUpdate(dt)
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
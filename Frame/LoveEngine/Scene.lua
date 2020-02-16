-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:38
--- Description  : 场景数据
------------------------------------------------
local Scene = {}

---场景内所有的游戏物体
Scene.m_GlobalGameObject = ArrayList.New()
---渲染的根节点
Scene.m_root = ArrayList.New()
---帧更新的列表
Scene.m_updateList = ArrayList.New()

---绘制场景
function Scene.__draw()
    --通知所有顶层gameObject，顶层gameObject通知transform，transform通知所有子gameObject 以此绘制
    for _, trans in ipairs(Scene.m_root) do
        trans.gameObject:__draw()
    end
end

---订阅帧更新事件
function Scene.__addUpdateEvent(func)
    Scene.m_updateList:Add(func)
end
---取消订阅帧更新事件
function Scene.__removeUpdateEvent(func)
    Scene.m_updateList:Remove(func)
end

---通知所有订阅进行帧更新
function Scene.__update(dt)
    for _, component in ipairs(Scene.m_updateList) do
        component(dt)
    end
end

return Scene
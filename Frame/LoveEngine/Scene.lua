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

function Scene:Constructor()

end

function Scene.__draw()
    --通知所有顶层gameObject，顶层gameObject通知transform，transform通知所有子gameObject 以此迭代绘制
    for _, trans in ipairs(Scene.m_root) do
        trans.gameObject:__draw()
    end
end

return Scene
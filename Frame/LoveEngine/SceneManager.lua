-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 17:13
--- Description  : 场景管理器
------------------------------------------------
local SceneManager = {}

--当前场景 extends for Scene
local m_curScene = nil
local m_sceneChangeEvents = ArrayList.New()
local m_camera = nil

function SceneManager.__Init(scenesConfig)
    m_camera = Camera.New()
end
---新建游戏物体
function SceneManager.NewGameObject(gameObject)
    m_curScene.m_GlobalGameObject:Add(gameObject)
end
---查找游戏对象
function SceneManager.FindGameObject(name)
    for index, value in ipairs(m_curScene.m_GlobalGameObject) do
        if value.name == name then
            return value
        end
    end 
end
---销毁游戏对象
function SceneManager.DestroyGameObject(gameObject)
    m_curScene.m_GlobalGameObject:Remove(gameObject)
    delete(gameObject)
end

---切换场景
function SceneManager.ChangeScene(scene)
    if m_curScene then
        m_curScene:OnExit()
    end

    --通知场景更新订阅
    for index, value in ipairs(m_sceneChangeEvents) do
        value()
    end

    m_curScene = scene
    m_curScene:OnEnter()
end
---获取场景节点根
function SceneManager.GetRoot()
    return m_curScene.m_root
end
---帧更新
function SceneManager.__update(dt)
    if m_curScene then
        m_curScene:__update(dt)
    end
end
--绘图
function SceneManager.__draw()
    if m_curScene then
        m_curScene:__draw()
    end
end

---添加帧更新订阅事件
function SceneManager.__addUpdateEvent(func)
    m_curScene:__addUpdateEvent(func)
end
---取消订阅帧更新事件
function SceneManager.__removeUpdateEvent(func)
    m_curScene:__removeUpdateEvent(func)
end

---场景变更订阅
function SceneManager.__addSceneChangeEvent(func)
    m_sceneChangeEvents:Add(func)
end
function SceneManager.__removeSceneChangeEvent(func)
    m_sceneChangeEvents:Remove(func)
end
---获取当前场景对象
function SceneManager.GetCurrentScene()
    return m_curScene
end
---添加移除碰撞信息
function SceneManager.__addSceneColliderInfo(collider)
    m_curScene:__addSceneColliderInfo(collider)
end
function SceneManager.__removeSceneColliderInfo(collider)
    m_curScene:__removeSceneColliderInfo(collider)
end

return SceneManager
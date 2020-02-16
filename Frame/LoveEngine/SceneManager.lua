-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 17:13
--- Description  : 场景管理器
------------------------------------------------
local SceneManager = {}

--当前场景 extends for Scene
local m_curScene = nil
local m_sceneChangeEvents = ArrayList.New()

function SceneManager.__Init()
    m_curScene = Scene.New()
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


function SceneManager.__update(dt)
    if m_curScene then
        m_curScene:__update(dt)
    end
end

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
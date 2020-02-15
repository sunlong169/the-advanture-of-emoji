local Scene = {}

Scene.m_GlobalGameObject = ArrayList.New()
Scene.m_root = ArrayList.New()

function Scene:Constructor()

end

function Scene.__draw()
    --通知所有顶层gameObject，顶层gameObject通知transform，transform通知所有子gameObject 以此迭代绘制
    for index, value in ipairs(Scene.m_root) do
        value.gameObject:__draw()
    end
end

return Scene
local Scene01, base = extends(Scene, "Scene01")

---virtual 进入场景
function Scene:OnEnter()

    love.graphics.setBackgroundColor(50 / 255, 175 / 255, 1)
    love.graphics.setLineWidth(5) 


    --背景图
    local bg = GameObject.New("bg")
    local bgImg = bg:AddComponent(Image)
    bgImg:SetSprite(IShape.NewSprite("res/image/stage/test-stage.png"))

    
    --生成玩家实体
    -- EntityMgr:Instance():CreateEntity(EntityType.player)

    local go = GameObject.New("test")
    local img = go:AddComponent(Image)
    img:SetSprite(IShape.NewSprite("res/image/player/aaa.jpg"))

    go.transform:SetPosition(Point.New(200,120))

    go.transform:SetRotation(90)

    local role = GameObject.New("go11")
    local img2 = role:AddComponent(Image)
    role.transform:SetPosition(90,90)
    img2:SetSprite(IShape.NewSprite("res/image/player/move1.png"))

    role.transform:SetParent(go.transform)

end
---virtual 离开场景
function Scene:OnExit()

end
---virtual 帧更新事件，落后于update
function Scene:LateUpdate(dt)

end

return Scene01
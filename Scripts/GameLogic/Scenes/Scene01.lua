---@class Scene01 : Scene
local Scene01, base = extends("Scene01", Scene)

---virtual 进入场景
function Scene01:OnEnter()

    local camgo = GameObject.New("mainCamera")
    local cam = camgo:AddComponent(Camera)
    cam:SetMainCamera()

    love.graphics.setBackgroundColor(50 / 255, 175 / 255, 1)
    love.graphics.setLineWidth(5) 


    --背景图
    -- local bg = GameObject.New("bg")
    -- local bgImg = bg:AddComponent(Image)
    -- bgImg:SetSprite(Assets.LoadSprite("res/image/stage/test-stage.png"))
    -- bgImg.transform:SetPivot(Vector2.New(0,0))
    
    --生成玩家实体
    -- EntityMgr:Instance():CreateEntity(EntityType.player)

    self.profile = GameObject.New("test")
    local img = self.profile:AddComponent(Image)
    img:SetSprite(Assets.LoadSprite("res/image/player/aaa.jpg"))

    self.profile.transform:SetPosition(Vector2.New(0,0))
    self.profile.transform:SetPivot(Vector2.New(0.5, 0.5))

    -- local role = GameObject.New("go11")
    -- local img2 = role:AddComponent(Image)
    -- role.transform:SetPosition(90,90)
    -- img2:SetSprite(Assets.LoadSprite("res/image/player/move1.png"))

    -- role.transform:SetParent(self.profile.transform)

    ---@type Rigidbody
    self.rigi = self.profile:AddComponent(Rigidbody)

    self.rigi:SetGravity(0)
    
end
---virtual 离开场景
function Scene01:OnExit()

end
---virtual 帧更新事件，落后于update
function Scene01:LateUpdate(dt)
    -- if Input.GetKeyUp(KeyCode.w) then
    --     Console.WriteLine(dt)
    -- end
    self.rigi:GetVelocity().x = Input.GetAxis("Horizontal") * 10
    self.rigi:GetVelocity().y = Input.GetAxis("Vertical") * 10
    if Input.GetAxis("Vertical") ~= 0 then
        Console.WriteLine(Input.GetAxis("Vertical"))
    end
    if Input.GetMouseButtonDown(MouseCode.Left) then
        Console.WriteLine(dt)
    end
    
    self.profile.transform:Rotate(dt*30)
end

return Scene01
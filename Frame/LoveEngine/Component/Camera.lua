-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/17 16:55
--- Description  : 摄像机
------------------------------------------------
local Camera, base = extends(Component, "Camera")

function Camera:Constructor()
    
end

--渲染流程
--新建与设置主摄像机 
--引擎底层通知场景管理器渲染 
--场景管理器通知当前场景渲染
--当前场景渲染所有组件和子物体的组件
--Image通过调用Camera进行渲染，Camera获取当前场景的当前相机进行调用
--通过Camera直接渲染，但是内部是获取当前场景的当前摄像机进行渲染

--渲染图片
function Camera.RenderImage(image)
    local cam = SceneManager.GetCurrentScene():GetCurrentCamera()
    cam:__renderImage(image)
end


function Camera:OnEnable()

end

function Camera:OnDisable()

end

--渲染image组件
function Camera:__renderImage(image)
    --加摄像机偏移渲染
    local transform = image.transform
    local position = transform:GetPosition() + self.transform:GetPosition()
    local rotation = math.rad(transform:GetRotation()) + math.rad(self.transform:GetRotation())
    local scale    = transform:GetScale() * self.transform:GetScale()
    IEngine.DrawImage(image.sprite, position.x, position.y, rotation, scale.x, scale.y)
end

--设置为主摄像机
function Camera:SetMainCamera()
    SceneManager.SetCurrentCamera(self)
end


return Camera
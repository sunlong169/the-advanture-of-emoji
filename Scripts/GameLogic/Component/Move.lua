-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 15:12
--- Description  : 角色移动示例
------------------------------------------------
---@class Move : Component
local Move, base = extends("Move", Component)

function Move:Constructor()

end

function Move:Start()
    self.seqImg = self.gameObject:GetComponent(SeqImage)
end

function Move:Update(dt)
    if Input.GetKey(Key.a) or Input.GetKey(Key.d) then
        self.seqImg:Play()
    else
        self.seqImg:Stop()
    end
end


return Move
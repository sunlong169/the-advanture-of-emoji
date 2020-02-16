-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 15:12
--- Description  : 角色移动示例
------------------------------------------------
local Move, base = extends(Component, "Move")

function Move:Constructor()

end

function Move:Start()
    self.seqImg = self.gameObject:GetComponent(SeqImage)
end

function Move:Update(dt)
    if Input.GetKeyDown(Key.a) or Input.GetKeyDown(Key.d) then
        self.seqImg:Play()
    else
        self.seqImg:Stop()
    end
end


return Move
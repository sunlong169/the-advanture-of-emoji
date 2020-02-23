-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/22 19:37
--- Description  : 动画组件
------------------------------------------------
---@class Animation : Component
local Animation, base = extends("Animation", Component)

function Animation:Constructor()
    self.m_clip = nil
end

function Animation:Start()

end

return Animation
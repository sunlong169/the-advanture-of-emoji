-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/22 19:37
--- Description  : 动画数据对象
------------------------------------------------
---@class AnimationClip
local AnimationClip, base = extends("AnimationClip", Object)

function AnimationClip:Constructor()
    --播放速度
    self.m_speed = 1
    self.m_isLoop = true

    --帧动画
    self.m_frameAnima = {}
end

function AnimationClip:SetFrameAnim()

end


return AnimationClip
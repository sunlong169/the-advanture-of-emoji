-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 00:38
--- Description  : 序列图动画组件
------------------------------------------------
local SeqImage, base = extends(Image, "SeqImage")

function SeqImage:Constructor()
    self.m_sprites = ArrayList.New()

    self.m_speed = 0.06
    self.m_curIndex = 1
    self.m_timeCount = 0
    self.m_playCount = 0

    self.m_isPlaying = false
end

function SeqImage:Start()
    if #self.m_sprites > 0 then
        self:SetSprite(self.m_sprites[1])
    end
end

---序列图
function SeqImage:SetSprites(value)
    self.m_sprites = value
end
function SeqImage:GetSprites()
    return self.m_sprites
end

---设置播放速度 每秒多少帧
function SeqImage:SetSpeed(value)
    self.m_speed = 1 / value
end
---获取播放速度 每秒多少帧
function SeqImage:GetSpeed()
    return 1 / self.m_speed
end

---获取播放次数
function SeqImage:GetPlayCount()
    return self.m_playCount
end

---播放状态
function SeqImage:Play()
    self.m_isPlaying = true
end
function SeqImage:Stop()
    self.m_isPlaying = false
end
function SeqImage:GetIsPlaying()
    return self.m_isPlaying
end

function SeqImage:Update(dt)
    if not self.m_isPlaying then return end

    self.m_timeCount = self.m_timeCount + dt
    if self.m_timeCount >= self.m_speed then
        
        if self.m_curIndex == #self.m_sprites then
            self.m_curIndex = 1
        end
        self:SetSprite(self.m_sprites[self.m_curIndex])
        self.m_curIndex = self.m_curIndex + 1
        self:_loop()
        self.m_timeCount = 0
    end
end

function SeqImage:_loop()
    self.m_playCount = self.m_playCount + 1
end

return SeqImage
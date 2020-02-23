-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 01:25
--- Description  : 玩家实体
------------------------------------------------
---@class PlayerEntity : Entity
local PlayerEntity, base = extends("PlayerEntity", Entity)

function PlayerEntity:Constructor()
    self.gameObject = GameObject.New("mainPlayer")
    self.seqimg = self.gameObject:AddComponent(SeqImage)
    self.seqimg:SetSprites({
        Assets.LoadSprite("res/image/player/move1.png"),
        Assets.LoadSprite("res/image/player/move2.png"),
        Assets.LoadSprite("res/image/player/move3.png"),
        Assets.LoadSprite("res/image/player/move4.png"),
        Assets.LoadSprite("res/image/player/move5.png"),
    })
    -- self.seqimg:Play()
    self.move = self.gameObject:AddComponent(Move)
    
end



function PlayerEntity:Destructor()
    GameObject.Destroy(self.gameObject)
end

return PlayerEntity
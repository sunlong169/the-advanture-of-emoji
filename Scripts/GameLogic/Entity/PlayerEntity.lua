-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/16 01:25
--- Description  : 玩家实体
------------------------------------------------
local PlayerEntity, base = extends(Entity, "PlayerEntity")

function PlayerEntity:Constructor()
    self.gameObject = GameObject.New("mainPlayer")
    self.seqimg = self.gameObject:AddComponent(SeqImage)
    self.seqimg:SetSprites({
        IShape.NewSprite("res/image/player/move1.png"),
        IShape.NewSprite("res/image/player/move2.png"),
        IShape.NewSprite("res/image/player/move3.png"),
        IShape.NewSprite("res/image/player/move4.png"),
        IShape.NewSprite("res/image/player/move5.png"),
    })
    self.seqimg:Play()
    
end

function PlayerEntity:Destructor()
    GameObject.Destroy(self.gameObject)
end

return PlayerEntity
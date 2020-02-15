local Component, base = extends(Behaviour, "Component")

function Component:Constructor(gameObject)
    self.m_isInit = false
    self.m_enable = true

    self.gameObject = gameObject
end

function Component:SetEnabled(bol)
    assert(type(bol) == 'boolean')
    local last = self.m_enable
    self.m_enable = bol
    if self.m_enable == true and last == false then
        --激活
        self:OnEnable()
    elseif self.m_enable == false and last == true then
        --反激活
        self:OnDisable()
    end
end

function Component:OnEnable()
    
end
function Component:OnDisable()

end

return Component
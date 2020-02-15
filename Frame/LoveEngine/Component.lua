local Component, base = extends(Behaviour, "Component")

function Component:Constructor(gameObject)
    self.m_isInit = false
    self.m_enable = true

    self.gameObject = gameObject
end

function Component:SetEnabled(bol)
    self.m_enable = bol
    if bol then
        self:Enable()
    else
        self:Disable()
    end
end

function Component:Enable()
    
end
function Component:Disable()

end

return Component
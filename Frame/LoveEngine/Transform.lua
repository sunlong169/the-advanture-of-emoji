local Transform, base = extends(Component, "Transform")

function Transform:Constructor()
    --相对属性
    self.m_position = Point.New()
    self.m_rotation = Point.New()
    self.m_size = Size.New()
end

function Transform:SetLocalPosition(position)
    self.m_position = position
end

function Transform:SetPosition(position)

end

function Transform:GetLocalPosition()
    return self.m_position
end
function Transform:GetPosition()
    if self.gameObject then
        return Transform.LocalToWorld(self.gameObject).m_position
    else
        return self.m_position
    end
end

function Transform:SetLocalRotation(rotation)
    self.m_rotation = rotation
end
function Transform:SetRotation(rotation)

end

function Transform:SetLocalSize(size)
    self.m_size = size
end

function Transform:SetSize(size)

end


----------------------------------static---------------------------------
---@return Point
function Transform.LocalToWorld(gameObject)
    if gameObject.parent then
        local parent = gameObject.parent
        local result = Point.New()
        while parent do
            result = result + parent.m_position
            parent = parent.parent
        end
        return result
    else
        return gameObject.transform.m_position
    end
end
function Transform.WorldToLocal(gameObject, point)
    if gameObject.parent then
        local parent = gameObject.parent
        local result = Transform.New()

        while parent do
            result = result + parent.m_position
            parent = parent.parent
        end
        return result
    else
        return gameObject.transform.m_position
    end
end


return Transform
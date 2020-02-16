-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:45
--- Description  : 储存位置 旋转 缩放 父对象与子对象等数据
------------------------------------------------
local Transform, base = extends(Component, "Transform")

function Transform:Constructor(gameObject, parent)
    
    --世界
    self.m_position = Point.New()
    self.m_rotation = 0
    self.m_scale    = Point.New(1, 1)

    --父对象
    self.parent = parent
    if not self.parent then
        Scene.m_root:Add(self)
    end

    self.m_childList = ArrayList.New()
end

---被销毁事件
function Transform:OnDestroy()
    ---销毁所有子物体
    for _, trans in ipairs(self.m_childList) do
        GameObject.Destroy(trans.gameObject)
    end
end

function Transform:__draw()
    for index, value in ipairs(self.m_childList) do
        value.gameObject:__draw()
    end
end

---设置父对象
---@param parent Transform 父对象
---@param isattrib boolean 属性是否重置，默认不重置
function Transform:SetParent(parent, isattrib)
    if self.parent then
        self.parent.m_childList:Remove(self)
    end
    --有父对象就设置父对象取消root，没父对象就设置为root
    if parent then
        self.parent = parent
        parent.m_childList:Add(self)
        --计算移动偏移
        if not isattrib then
            self.m_position = self.m_position - parent.m_position
            self.m_rotation = self.m_rotation - parent.m_rotation
            self.m_scale = self.m_scale / parent.m_scale
        end
        Scene.m_root:Remove(self)
    else
        Scene.m_root:Add(self)
    end
end

---设置相对位置
function Transform:SetLocalPosition(position)
    self.m_position = position
end
---获取相对位置
function Transform:GetLocalPosition()
    return self.m_position
end

---设置位置
function Transform:SetPosition(position, y)
    if y then
        position = Point.New(position, y)
    end
    self.m_position = self.WorldToLocal(self, position)
end
---获取位置
function Transform:GetPosition()
    return self.LocalToWorld(self)
end

---设置相对旋转
function Transform:SetLocalRotation(rotation)
    self.m_rotation = rotation
end
---获取相对旋转
function Transform:GetLocalRotation()
    return self.m_rotation
end
---设置旋转
function Transform:SetRotation(rotation)
    self.m_rotation = rotation
end
---获取旋转
function Transform:GetRotation()
    return self.m_rotation
end


---设置相对缩放
function Transform:SetLocalScale(size)
    self.m_scale = size
end
---获取相对缩放
function Transform:GetLocalScale()
    return self.m_scale
end
---设置缩放
function Transform:SetScale(size)
    self.m_scale = size
end
---获取缩放
function Transform:GetScale()
    return self.m_scale
end

---获取所有子物体
function Transform:GetChildren()
    return self.m_childList
end
---按索引获取指定子物体
function Transform:GetChildAt(index)
    return self.m_childList:Get(index)
end
---按路径和名称获取子物体 如 root/hunman 就是获取root节点下的human节点
function Transform:GetChild(path)
    local arr = String.Split(path, ",")

    local trans = self
    for _, nodeName in ipairs(arr) do
        --临时记录当前transform，用来验证最后查找到了
        local tmp = trans
        for _, childTransf in ipairs(trans.m_childList) do
            if childTransf.gameObject.name == nodeName then
                trans = childTransf
                break
            end
        end
        assert(tmp ~= trans , "not found")
    end
    return trans
end

function Transform:ToString()
    return String.Format("{name: {0}, position: {1}, rotation: {2}, scale: {3}}",
           self.gameObject.name,
           self.m_position,
           self.m_rotation,
           self.m_scale )
end

----------------------------------static---------------------------------

function Transform.LocalToWorld(transform)
    local getParentPosition
    getParentPosition = function(transf)
        if transf.parent then
            return transf.m_position + getParentPosition(transf.parent)
        else
            return transf.m_position
        end
    end
    local result = getParentPosition(transform)
    return result
end

function Transform.WorldToLocal(transform, point)

    local getParentPosition
    getParentPosition = function(transf, point)
        if transf.parent then
            point = point - getParentPosition(transf.parent, point)
            return point
        else
            return point
        end
    end
    local result = getParentPosition(transform, point )
    return result

end


return Transform
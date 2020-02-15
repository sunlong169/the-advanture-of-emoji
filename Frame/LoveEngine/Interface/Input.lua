local Input = {}

---@return boolean
---@param keyType Key
function Input.GetKeyDown(keyType)
    return love.keyboard.isDown(keyType)
end

---@return boolean
---@param keyType Key
function Input.GetKeyUp(keyType)

end

---@return boolean
---@param mouseType number
function Input.GetMouseDown(mouseType)
    return love.mouse.isDown(mouseType)
end

---@return boolean
---@param mouseType number
function Input.GetMouseUp(mouseType)

end


function Input:GetMousePosition()
    local x, y = love.mouse.getPosition()
    return Point.New(x, y)
end

return Input
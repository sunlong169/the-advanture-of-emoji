-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:53
--- Description  : 输入设备接口
------------------------------------------------
local Input = {}

---获取按键按下
---@return boolean
---@param keyType Key
function Input.GetKeyDown(keyType)
    return love.keyboard.isDown(keyType)
end

---获取按键弹起
---@return boolean
---@param keyType Key
function Input.GetKeyUp(keyType)

end

---获取鼠标按下
---@return boolean
---@param mouseType number
function Input.GetMouseDown(mouseType)
    return love.mouse.isDown(mouseType)
end

---获取鼠标弹起
---@return boolean
---@param mouseType number
function Input.GetMouseUp(mouseType)

end

---获取鼠标位置
function Input.GetMousePosition()
    local x, y = love.mouse.getPosition()
    return Point.New(x, y)
end

return Input
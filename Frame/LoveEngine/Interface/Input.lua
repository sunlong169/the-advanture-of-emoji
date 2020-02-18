-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:53
--- Description  : 输入设备接口
------------------------------------------------
local Input = {}

--配置文件
local InputAxis = {
    Horizontal = {
        NegativeButton = KeyCode.left,
        PositiveButton = KeyCode.right,
        AltNegativeButton = KeyCode.a,
        AltPositiveButton = KeyCode.d,
        Gravity = 3,
    }
}

--记录键盘状态的字典
local keyState = Dictionary.New()
local axisState = Dictionary.New()

function Input.Init()
    --添加所有按键到按键状态列表，记录是否按下
    for _, keyc in pairs(KeyCode) do
        keyState:Add(keyc, 0) -- 0 默认， 1 刚按下， 2 已经按下， 3 弹起
    end
    for _, axis in pairs(InputAxis) do
        axisState:Add(axisState, 0)
    end
end

--监测键盘变动
function Input.__inputKey()
    keyState:ForEach(function(keyc, downState)
        if love.keyboard.isDown(keyc) then
            --按下
            
            if downState == 0 then --刚刚按下
                keyState[keyc] = 1
            elseif downState == 1 then
                keyState[keyc] = 2
            end
            
        else
            --按键已经没有在按下了
            --如果上一帧已经按下 那就修改为弹起
            --如果上一帧为弹起，那就修改为默认
            if downState == 1 or downState == 2 then 
                keyState[keyc] = 3
            elseif downState == 3 then
                keyState[keyc] = 0
            end
        end
    end)
end

--键盘按下回调
function Input.keyboardDownEvent(keyCode)
    
end

--=-----------------------------------------------------

function Input.__update(dt)
    Input.__inputKey() -- 检测键盘
    for key, value in pairs(InputAxis) do
        if Input.GetKey(value.NegativeButton) or Input.GetKey(value.AltNegativeButton) then
            --负方向按住
        elseif Input.GetKey(value.PositiveButton) or Input.GetKey(value.AltPositiveButton) then
            --正方向按住
        else
            --归零
        end
    end
end

function Input.GetAxis(axisName)
    
end

---获取按键是否按下
function Input.GetKey(keyCode)
    if not keyCode then return false end
    local num = keyState[keyCode]
    --刚按下或已经按下
    return num == 1 or num == 2
end

---获取按键按下
---@return boolean
---@param keyType Key
function Input.GetKeyDown(keyCode)
    return keyState[keyCode] == 1
end

---获取按键弹起
---@return boolean
---@param keyType Key
function Input.GetKeyUp(keyCode)
    return keyState[keyCode] == 3
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
-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/02/15 23:53
--- Description  : 输入设备接口
------------------------------------------------
local Input = {}


local keyState = Dictionary.New()

function Input.Init()
    --添加所有按键到按键状态列表，记录是否按下
    for _, key in ipairs(KeyCode) do
        keyState:Add(key, 0) -- 0 默认， 1 刚按下， 2 已经按下， 3 弹起
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
            if downState == 2 then 
                downState = 3
            else
                downState = 0
            end
        end
    end)
end

--键盘按下回调
function Input.keyboardEvent(keyCode)
    
end

function Input.__update(dt)
    Input.__inputKey() -- 检测键盘
    for key, value in pairs(InputConfig) do
        -- body
    end
end

--=-----------------------------------------------------
--配置文件
local InputConfig = {
    Horizontal = {
        NegativeButton = Key.left,
        PositiveButton = Key.right,
        AltNegativeButton = Key.a,
        AltPositiveButton = Key.d,
        Gravity = 3,
    }
}
---获取按键是否按下
function Input.GetKey(keyCode)
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
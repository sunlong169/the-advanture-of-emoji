-------------------ModuleInfo-------------------
--- Author       : jx
--- Date         : 2020/03/02 14:22
--- Description  : 状态机抽象类
------------------------------------------------
---@class FiniteStateMachine : Object
local FiniteStateMachine, base = extends("FiniteStateMachine", Object)

---@param normalState FiniteStateMachineState
function FiniteStateMachine:Constructor(normalState)
    self.curState = normalState
end

---@param state FiniteStateMachineState
function FiniteStateMachine:ChangeState(state)
    self.curState = state
end

---@return FiniteStateMachineState
function FiniteStateMachine:GetState()
    return self.curState
end

return FiniteStateMachine
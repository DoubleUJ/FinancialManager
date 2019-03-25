--
-- Financial Manager
-- ©2019 by Max-Agrisim
-- 
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

-- TODO Variablee en functies tbv Algemene scherm

FinancialManagerUI = {}

debug = 1 -- 0=0ff, 1=some, 2=everything, 3=madness -> Debugmode thanks ZhooL for inspiration

function FinancialManagerUI:onRegisterActionEvents(isSelected, isOnActiveVehicle)
    if debug > 1 then print("-> " .. myName .. ": onRegisterActionEvents " .. tostring(isSelected) .. ", " .. tostring(isOnActiveVehicle) .. ", S: " .. tostring(self.isServer) .. ", C: " .. tostring(self.isClient) .. mySelf(self)) end

        -- attach our actions
        for _ ,actionName in pairs(actionList) do
        local _, eventName = InputBinding.registerActionEvent(g_inputBinding, actionName, self, TSX_EnhancedVehicle.onActionCall, false, true, false, true)
        end
    end
end

function FinancialManagerUI:onActionCall(actionName, keyStatus, arg4, arg5, arg6)
    if debug > 1 then print("-> " .. myName .. ": onActionCall " .. actionName .. ", keyStatus: " .. keyStatus .. mySelf(self)) end
    if debug > 2 then
      print(arg4)
      print(arg5)
      print(arg6)
    end
  
    -- front diff
    if actionName == "fmHomeScreen" then
        if debug > 1 then print("Homescreen activated") end

      --[[if TSX_EnhancedVehicle.sounds["diff_lock"] ~= nil and TSX_EnhancedVehicle.soundIsOn and g_dedicatedServerInfo == nil then
        playSample(TSX_EnhancedVehicle.sounds["diff_lock"], 1, 0.5, 0, 0, 0)
      end
      self.vData.want[1] = not self.vData.want[1]
      if self.isClient and not self.isServer then
        self.vData.is[1] = self.vData.want[1]
      end
      TSX_EnhancedVehicle_Event:sendEvent(self, unpack(self.vData.want))]]
    end
end






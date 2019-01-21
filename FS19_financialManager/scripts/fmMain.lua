--
-- Financial Manager
-- ©2019 by MaxAgriSim
-- 
-- changelog
-- 0.0.0.1      First implementation 

fmMain = {}

function fmMain:loadMap(...)
    -- global variables 
    self.eventIdActive = ""
	self.inputsActive = false
end

function fmMain:deleteMap()
end

function fmMain:mouseEvent(...)
end

function fmMain:keyEvent(...)
end

function fmMain:activateScreen()
    print("I'm activated Financial Manager by pressing a key!")
	fmMain.fmShowHomeScreen(self)
end

function fmMain:update()  
    
    if g_gui.currentGui == nil and g_currentMission.controlledVehicle == nil then -- only if no vehicle is entered or menu is up
        if not self.inputsActive then -- register input events    
            _, self.eventIdActive = g_inputBinding:registerActionEvent(InputAction.fmHomeScreen, fmMain, fmMain.activateScreen, false, true, false, false)
            self.inputsActive = true
        end
        local eventIdActive = self.eventIdActive
        g_inputBinding:setActionEventActive(eventIdActive, true)
        g_inputBinding:setActionEventTextVisibility(eventIdActive, true)
    else
        self.inputsActive = false
    end
end

function fmMain:fmShowHomeScreen()
    print("START Function fmShowHomeScreen")
    -- Check if screen excists otherwise make one
    if g_FinancialManagerHomeScreen == nil then
        print("   Step 1: g_FinancialManagerHomeScreen is nil")
        -- TODO variable verwijzing voor aanmaken screen implementeren.
        g_FinancialManagerHomeScreen = FinancialManagerHomeScreen:new() 
        print("   Step 2: g_FinancialManagerHomeScreen is " .. g_FinancialManagerHomeScreen)
        -- g_gui:loadGui("screens/fmHomeScreen.xml", "financialManagerHomeScreen") --g_keyboardSteerMogliScreen
    end
    print("END Function fmShowHomeScreen")
end

function fmMain:draw()
end

print("  Loaded Financial Manager by MaxAgriSim   ")
addModEventListener(fmMain)
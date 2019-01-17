--
-- Financial Manager
-- MaxAgrisim
-- 
-- changelog
-- 1.00 First implementation 

fmMain = {}

function fmMain:loadMap(...)
    self.cont = 4
    self.eventIdActive = ""
	self.inputsActive = false
	self.errorDisplayed = true
end

function fmMain:deleteMap()
end

function fmMain:mouseEvent(...)
end

function fmMain:keyEvent(...)
end

function fmMain:activateScreen()
	print("Hello World i'm activated by pressing a key!")
end

function fmMain:update(dt)  
    if g_gui.currentGui == nil and g_currentMission.controlledVehicle == nil then -- only if no vehicle is entered or menu is up

        if not self.inputsActive then -- register input events
            _, self.eventIdActive = g_inputBinding:registerActionEvent(InputAction.fmHomeScreen, fmMain, fmMain.activateScreen, false, true, false, false)
            self.inputsActive = true
        end
    else
        self.inputsActive = false
    end
end

function fmMain:draw()
end

print("  Loaded FinancialManager Mod...")
addModEventListener(fmMain)
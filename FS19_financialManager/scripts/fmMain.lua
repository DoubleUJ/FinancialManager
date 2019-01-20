--
-- Financial Manager
-- ©2019 by MaxAgriSim
-- 
-- changelog
-- 0.0.0.1      First implementation 

fmMain = {}

function fmMain:loadMap(...)
    --self.cont = 4
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
	print("Hello World i'm activated by pressing a key!")
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

function fmMain:draw()
end

print("  Loaded Financial Manager by MaxAgrisim...")
addModEventListener(fmMain)
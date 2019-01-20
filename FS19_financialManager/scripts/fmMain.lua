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
    --print("Hier zit ik in de loadmap")
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
    --print("Ik zit nu in de update")
    if g_gui.currentGui == nil and g_currentMission.controlledVehicle == nil then -- only if no vehicle is entered or menu is up
        print(self.inputsActive)        
        if not self.inputsActive then -- register input events
            print("Ik zit in de register input")
            _, self.eventIdActive = g_inputBinding:registerActionEvent(InputAction.fmHomeScreen, fmMain, fmMain.activateScreen, false, true, false, false)
            self.inputsActive = true
        end
        

        local eventIdActive = self.eventIdActive
        print("Ik zit net onder de local ")

        g_inputBinding:setActionEventActive(eventIdActive, true)
		g_inputBinding:setActionEventTextVisibility(eventIdActive, true)

    else
        self.inputsActive = false
    end
end

function fmMain:draw()
end

print("  Loaded Financial Manager Mod...")
addModEventListener(fmMain)
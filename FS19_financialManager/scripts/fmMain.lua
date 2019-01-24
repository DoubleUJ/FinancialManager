--
-- Financial Manager
-- ©2019 by MaxAgriSim
-- 
-- changelog
-- 0.0.0.1      First implementation 

fmMain = {}
local guiName = g_currentModName.."_emptyGui"
local FinancialManager = g_currentModDirectory

source(Utils.getFilename("fmGui.lua", g_currentModDirectory))

function fmMain:delete()
end

function fmMain:loadMap(name)
    -- Set inputactive false    
    self.inputsActive = false
end

function fmMain:deleteMap()
end

function fmMain:mouseEvent(...)
end

function fmMain:keyEvent(...)
end

function fmMain:activateScreen()
    print("Financialmanager - ActivateScreen");
    print("I'm activated Financial Manager by pressing a key!")
	fmMain.fmShowHomeScreen(self)
end


function fmMain:update(dt)  
    
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

function fmMain:load(xmlFile)	
end;

function fmMain:fmShowHomeScreen()
    print("Financialmanager - fmShowHomeScreen")

    -- Set Gui
    fmMain["fmSettingGui"] = fmGui:new();
    g_gui:loadGui(FinancialManager.."fmGui.xml", "fmGui", fmMain.fmSettingsGui);
    g_gui:showGui("fmGui")
end


function fmMain:draw()
end

print("  Loaded Financial Manager by MaxAgriSim   ")
addModEventListener(fmMain)
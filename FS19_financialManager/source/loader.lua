---
-- loader
--
-- loader script for the mod
--
-- Copyright (c) MaxAgrisim, 2019
--
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

local directory = g_currentModDirectory
local modName = g_currentModName

source(Utils.getFilename("source/gui/fmMain.lua", directory)) -- == gsUi
source(Utils.getFilename("source/gui/fmMenu.lua", directory)) -- == gsMenu
source(Utils.getFilename("source/gui/frames/fmMainScreen.lua", directory)) -- == gsSettingsframe
source(Utils.getFilename("source/gui/hud/fmHud.lua", directory)) -- == gsHud

source(Utils.getFilename("source/FinancialManager.lua", directory)) -- == gs

local FinancialManager

local function isEnabled()
    return FinancialManager ~= nil
end

function unload()
    if not isEnabled() then
        return
    end

    --removeModEventListener(guidanceSteering)

    --guidanceSteering:delete()
    --guidanceSteering = nil -- Allows garbage collecting
    --getfenv(0)["g_FinancialManager"] = nil
end


function loadOverlay(gui)
    assert(g_FinancialManager == nil)

    guidanceSteering = GuidanceSteering:new(gui, directory, modName, g_i18n, g_gui, g_gui.inputManager, g_messageCenter, g_settingsScreen.settingsModel)

    getfenv(0)["g_FinancialManager"] = FinancialManager

    addModEventListener(FinancialManager)
end
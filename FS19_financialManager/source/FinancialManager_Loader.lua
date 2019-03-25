---
-- loader
--
-- loader script for the mod
--
-- Copyright (c) MaxAgrisim, 2019
--
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

FinancialManager_Loader = {}

local directory = g_currentModDirectory

source(Utils.getFilename("source/gui/hud/fmFinancialManagerUI.lua", directory)) -- Hier de algemene functies rondom de hoofd ui zetten
source(Utils.getFilename("source/gui/frames/fmFinancialScreen.lua", directory)) -- Hier de functies van het "tabbed menu" zetten die financiele zaken afhandelen 

--source(Utils.getFilename("source/FinancialManager.lua", directory)) -- Algemene functies plaatsten als die nodig zijn en er zijn. 


-- Register key events
function FinancialManager_Loader:keyEvent(unicode, sym, modifier, isDown)
end

-- Register mouse events
function FinancialManager_Loader:mouseEvent(posX, posY, isDown, isUp, button)
end


function FinancialManager_Loader:update(dt)
end

print("  Loaded Financial Manager by Max-Agrisim   ")
addModEventListener(FinancialManager_Loader)
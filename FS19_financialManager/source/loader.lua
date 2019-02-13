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

source(Utils.getFilename("src/gui/fmMain.lua", directory))
source(Utils.getFilename("src/gui/fmMenu.lua", directory))
source(Utils.getFilename("source/gui/frames/fmMainScreen.lua", directory))
source(Utils.getFilename("src/gui/hud/fmHud.lua", directory))
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

source(Utils.getFilename("source/gui/fmGUI.lua", directory))

source(Utils.getFilename("source/fmMain.lua", directory))
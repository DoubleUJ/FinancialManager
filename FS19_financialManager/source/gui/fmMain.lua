--
-- Financial Manager
-- ©2019 by Max-Agrisim
-- 
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

fmMain = {}

local financialManager_mt = Class(fmMain)

-- Setting directories global

function fmMain:new(i18n, modDirectory, gui, inputManager)
	local self = setmetatable({}, financialManager_mt)

	self.i18n = i18n
	self.modDirectory = modDirectory
	self.gui = gui
	self.inputManager = inputManager
	
end


function fmMain:delete()
end

function fmMain:loadMap()

end

function fmMain:deleteMap()
end

function fmMain:mouseEvent(...)
end

function fmMain:keyEvent(...)
end

function fmMain:activateScreen()
	--fmMain.fmShowHomeScreen(self)
end

function fmMain:load()	
end;

function fmMain:fmShowHomeScreen()

end

function GuidanceSteering:update()
end

function fmMain:draw()
end

print("  Loaded Financial Manager by Max-Agrisim   ")
addModEventListener(fmMain)
--
-- Financial Manager
-- ©2019 by Max-Agrisim
-- 
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

fmMain = {}

local financialManager_mt = Class(fmMain)

-- Setting directories global

function fmMain:new(i18n, modDirectory, gui)
	local self = setmetatable({}, financialManager_mt)

	self.i18n = i18n
	self.modDirectory = modDirectory
	self.gui = gui
	self.inputManager = inputManager
	
	return self
end

function fmMain:delete()
end

function fmMain:load()
end

function fmMain:loadMenu()
	--fmMain.fmShowHomeScreen(self)
	local fmMainScreen = fmMainScreen:new(self.i18n, self.inputManager)
	
	self.menu = fmMenu:new(self.i18n, self.inputManager)

	local root = Utils.getFilename("resources/gui/", self.modDirectory)
	self.gui:LoadGui(root .. "fmGui.xml", "fmMainScreen", fmMainScreen, true)
	self.gui:LoadGui(root .. "fmMenu.xml", "fmMenu", self.menu)
end

function fmMain:unloadMenu()
	self.menu:delete()
end

function fmMain:onToggleUI() 
	g_gui:showGui("fmMenu")
end

function fmMain:update()
end

function fmMain:draw()
end

print("  Loaded Financial Manager by Max-Agrisim   ")
addModEventListener(fmMain)
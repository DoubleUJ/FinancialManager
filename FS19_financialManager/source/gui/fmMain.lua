--
-- Financial Manager
-- ©2019 by Max-Agrisim
-- 
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

fmMain = {}

local FinancialManager_mt = Class(fmMain)

-- Setting directories global

function fmMain:new(i18n, modDirectory, gui, inputManager, messageCenter, settingsModel)
	local self = setmetatable({}, FinancialManager_mt)

	self.i18n = i18n
	self.modDirectory = modDirectory
	self.gui = gui
	self.inputManager = inputManager
	self.messageCenter = messageCenter
    self.settingsModel = settingsModel
	
	return self
end

function fmMain:delete()
	if self.isClient then

		self:unloadMenu()
	end
end

function fmMain:load()
	if self.isClient then

	self:loadMenu()
end
end

function fmMain:loadMenu()
	--fmMain.fmShowHomeScreen(self)
	local fmMainScreenobject = fmMainScreen:new(self.i18n, self.inputManager)
	
	self.menu = fmMenu:new(self.i18n, self.inputManager)

	local root = Utils.getFilename("resources/gui/", self.modDirectory)
	self.gui:LoadGui(root .. "fmMainScreen.xml", "fmMainScreen", fmMainScreenobject, true)
	self.gui:LoadGui(root .. "fmMenu.xml", "fmMenu", self.menu)
end

function fmMain:unloadMenu()
	self.menu:delete()
end

function fmMain:onToggleUI() 
	g_gui:showGui("fmMenu")
end

function fmMain:draw()
end

print("  Loaded Financial Manager by Max-Agrisim   ")
addModEventListener(fmMain)
--
-- Financial Manager
-- ©2019 by Max-Agrisim
-- 
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

-- TODO Variablee en functies tbv Algemene scherm

FinancialManagerUI = {}

function FinancialManagerUI:new(messageCenter, languageSuffix, inputManager, guiSoundPlayer)
    local self = setmetatable({}, Gui_mt)
    self.messageCenter = messageCenter
    self.languageSuffix = languageSuffix
    -- input manager reference for event registration
    self.inputManager = inputManager
    self.soundPlayer = guiSoundPlayer
    FocusManager:setSoundPlayer(guiSoundPlayer)
    self.screens = {} -- screen class -> screen root element
    self.screenControllers = {} -- screen class -> screen instance
    self.dialogs = {}
    self.profiles = {}
    self.traits = {}
    self.focusElements = {}
    self.guis = {}
    self.nameScreenTypes = {}
    self.currentGuiName = ""
    -- registered frame elements which can be referenced to be displayed in multiple places / on multiple screen views
    self.frames = {} -- frame name -> frame controller element
    -- state flag to check if the GUI input context is active (context can be multiple levels deep)
    self.isInputListening = false
    -- stores event IDs of GUI button/key actions (no movement)
    self.actionEventIds = {}
    -- current frame's input target, all inputs of one frame go to this target
    self.frameInputTarget = nil
    -- flag for handling of current frame's input, avoids reacting to multiple events per frame for double bindings (e.g. ESC on PC)
    self.frameInputHandled = false
    -- subscribers for network events which trigger a local GUI response
    self.networkEventSubscribers = {}
    self.changeScreenClosure = self:makeChangeScreenClosure()
    self.toggleCustomInputContextClosure =self:makeToggleCustomInputContextClosure()
    self.playSampleClosure = self:makePlaySampleClosure()
    self.inputactivated = false
    return self
end




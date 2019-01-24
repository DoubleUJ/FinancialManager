--
-- Financial Manager Gui
-- V0.0.0.1
--
-- @author MaxAgrisim
--

fmGui = {}

local fmGui_mt = Class(fmGui, ScreenElement)

function fmGui:new(target, custom_mt)
    local self = ScreenElement:new(target, fmGui_mt)
    self.returnScreenName = ""
    return self
end;

function fmGui:onOpen()
    fmGui:superClass().onOpen(self);
	FocusManager:setFocus(self.backButton);
end;

function fmGui:onClose()
    fmGui:superClass().onClose(self);
end;

function fmGui:onClickBack()
    fmGui:superClass().onClickBack(self);
	StoryMode:guiClosed();
end;

function fmGui:onClickOk()
    fmGui:superClass().onClickOk(self);
	StoryMode:settingsFromGui();
    self:onClickBack();
end;

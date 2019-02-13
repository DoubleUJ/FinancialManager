--
-- Financial Manager Gui
--
-- ©2019 by Max-Agrisim
-- 
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

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
	fmMain:guiClosed();
end;

function fmGui:onClickOk()
    fmGui:superClass().onClickOk(self);
	--StoryMode:settingsFromGui();
    self:onClickBack();
end;

function fmGui:onIngameMenuHelpTextChanged(element)
end;

function fmGui:onCreatefmGuiHeader(element)    
    fmGui.header = element;
	element.text = g_i18n:getText('fmHomeScreenTitle');
end;

function fmGui:onCreatefmGuiInvoice(element)
    fmGui.header = element
    element.text = g_i18n:getText('fmHomeScreenInvoice')
end
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

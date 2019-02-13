fmHud = {}

local fmHud_mt = Class(fmHud)

function fmHud:new(gameInfoDisplay, i18n)
    local instance = setmetatable({}, fmHud_mt)

    instance.gameInfoDisplay = gameInfoDisplay
    instance.i18n = i18n

    --    SpeedMeterDisplay.draw = Utils.appendedFunction(SpeedMeterDisplay.draw, fmHud.speedMeterDisplay_draw)

    return instance
end

function fmHud:delete()
end

function fmHud:load()
end

function fmHud:createBox(hudAtlasPath, rightX, topRightY)
end


function fmHud:toggle(vis)
end

function fmHud.speedMeterDisplay_draw(speedMeterDisplay)
    g_guidanceSteering.ui.hud:drawText()
end

function fmHud:setWidthText(width)
    --    self.widthText:setText(("%.2f m"):format(width))
end

function fmHud:drawText()
    setTextBold(false)
    setTextAlignment(RenderText.ALIGN_RIGHT)

    self:drawWidthText()
end

function fmHud:drawWidthText()
    setTextAlignment(RenderText.ALIGN_RIGHT)
    setTextColor(unpack(fmHud.TEXT_COLOR.WIDTH))

    renderText(self.widthTextPositionX, self.widthTextPositionY, self.widthTextSize, self.widthText)
end

fmHud.UV = {
    WIDTH = { 8, 8, 240, 240 },
}

fmHud.POSITION = {
    WIDTH_TEXT = { 30, -62.5 },
    WIDTH_ICON = { 20, 25 }
}

fmHud.TEXT_COLOR = {
    WIDTH = { 0, 0.379, 0.093, 1 }
}

fmHud.TEXT_SIZE = {
    WIDTH = 11
}

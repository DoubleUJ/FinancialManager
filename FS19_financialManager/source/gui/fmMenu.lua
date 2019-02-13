fmMenu = {}

local fmMenu_mt = Class(fmMenu, TabbedMenu)

fmMenu.CONTROLS = {
    PAGE_SETTINGS = "pageSettings",
}

local NO_CALLBACK = function() end

function fmMenu:new(messageCenter, i18n, inputManager)
    local self = TabbedMenu:new(nil, fmMenu_mt, messageCenter, i18n, inputManager)

    self.i18n = i18n

    self.performBackgroundBlur = true

    self:registerControls(fmMenu.CONTROLS)

    return self
end

function fmMenu:onGuiSetupFinished()
    fmMenu:superClass().onGuiSetupFinished(self)

    self.clickBackCallback = self:makeSelfCallback(self.onButtonBack) -- store to be able to apply it always when assigning menu button info

    self.pageSettings:initialize()
    self.pageStrategy:initialize()

    self:setupPages()
end

function fmMenu:setupPages()
    local predicate = self:makeIsAlwaysVisiblePredicate()

    local orderedPages = {
        -- default pages, their enabling state predicate functions and tab icon UVs in order
        { self.pageSettings, predicate, fmMenu.TAB_UV.SETTINGS },
        { self.pageStrategy, predicate, fmMenu.TAB_UV.STRATEGY },
    }

    for i, pageDef in ipairs(orderedPages) do
        local page, predicate, iconUVs = unpack(pageDef)
        self:registerPage(page, i, predicate)

        local normalizedUVs = getNormalizedUVs(iconUVs)
        self:addPageTab(page, g_baseUIFilename, normalizedUVs) -- use the global here because the value changes with resolution settings
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Setting up
------------------------------------------------------------------------------------------------------------------------

--- Define default properties and retrieval collections for menu buttons.
function fmMenu:setupMenuButtonInfo()
    local onButtonBackFunction = self.clickBackCallback

    self.defaultMenuButtonInfo = {
        { inputAction = InputAction.MENU_BACK, text = self.l10n:getText(fmMenu.L10N_SYMBOL.BUTTON_BACK), callback = onButtonBackFunction },
    }

    self.defaultMenuButtonInfoByActions[InputAction.MENU_BACK] = self.defaultMenuButtonInfo[1]

    self.defaultButtonActionCallbacks = {
        [InputAction.MENU_BACK] = onButtonBackFunction,
    }
end

------------------------------------------------------------------------------------------------------------------------
-- Predicates for showing pages
------------------------------------------------------------------------------------------------------------------------
function fmMenu:makeIsAlwaysVisiblePredicate()
    return function()
        return true
    end
end

--- Page tab UV coordinates for display elements.
fmMenu.TAB_UV = {
    SETTINGS = { 0, 209, 65, 65 },
    STRATEGY = { 65, 209, 65, 65 },
}

fmMenu.L10N_SYMBOL = {
    BUTTON_BACK = "button_back",
}

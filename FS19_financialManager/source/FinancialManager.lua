--
-- Financial Manager
-- ©2019 by Max-Agrisim
-- 
-- changelog
-- 0.0.0.1      First implementation        DoubleU.J. / Pinqdev 

FinancialManager = {}

FinancialManager.SEND_NUM_BITS = 6 -- 2 ^ 6 = 64 max
FinancialManager.MAX_NUM_TRACKS = 2 ^ FinancialManager.SEND_NUM_BITS

local FinancialManager_mt = Class(FinancialManager)

function FinancialManager:new(modDirectory, modName, i18n, gui, inputManager, messageCenter, settingsModel)
    local self = {}

    setmetatable(self, FinancialManager_mt)

    self:mergeModTranslations(i18n)

    --self.isServer = mission:getIsServer()
    self.modDirectory = modDirectory
    self.modName = modName
    --self.savedTracks = {}

    self.ui = fmMain:new(i18n, modDirectory, gui, inputManager, messageCenter, settingsModel)

    return self
end

function FinancialManager:delete()
    self.ui:delete()
end
--[[
function FinancialManager:onMissionLoadFromSavegame(xmlFile)
    local i = 0
    while true do
        local key = ("FinancialManager.tracks.track(%d)"):format(i)
        if not hasXMLProperty(xmlFile, key) then
            break
        end

        local track = {}

        track.id = getXMLInt(xmlFile, key .. "#id")
        track.name = getXMLString(xmlFile, key .. "#name")
        track.strategy = getXMLInt(xmlFile, key .. "#strategy")
        track.method = getXMLInt(xmlFile, key .. "#method")

        track.guidanceData = {}
        track.guidanceData.width = MathUtil.round(getXMLFloat(xmlFile, key .. ".guidanceData#width"), 3)
        track.guidanceData.offsetWidth = MathUtil.round(getXMLFloat(xmlFile, key .. ".guidanceData#offsetWidth"), 3)
        track.guidanceData.snapDirection = { StringUtil.getVectorFromString(getXMLString(xmlFile, key .. ".guidanceData#snapDirection")) }
        track.guidanceData.driveTarget = { StringUtil.getVectorFromString(getXMLString(xmlFile, key .. ".guidanceData#driveTarget")) }

        ListUtil.addElementToList(self.savedTracks, track)

        i = i + 1
    end
end

function FinancialManager:onMissionLoaded(mission)
    self.ui:load()
end

function FinancialManager:onMissionSaveToSavegame(xmlFile)
    setXMLInt(xmlFile, "FinancialManager#version", 1)

    if self.savedTracks ~= nil then
        for i, track in ipairs(self.savedTracks) do
            local key = ("FinancialManager.tracks.track(%d)"):format(i - 1)

            Logger.info(i, track)
            setXMLInt(xmlFile, key .. "#id", i)
            setXMLString(xmlFile, key .. "#name", track.name)
            setXMLInt(xmlFile, key .. "#strategy", track.strategy)
            setXMLInt(xmlFile, key .. "#method", track.method)
            setXMLFloat(xmlFile, key .. ".guidanceData#width", track.guidanceData.width)
            setXMLFloat(xmlFile, key .. ".guidanceData#offsetWidth", track.guidanceData.offsetWidth)
            setXMLString(xmlFile, key .. ".guidanceData#snapDirection", table.concat(track.guidanceData.snapDirection, " "))
            setXMLString(xmlFile, key .. ".guidanceData#driveTarget", table.concat(track.guidanceData.driveTarget, " "))
        end
    end
end

function FinancialManager:onReadStream(streamId, connection)
    Logger.info("readStream")
    if connection:getIsServer() then
        local numTracks = streamReadUIntN(streamId, FinancialManager.SEND_NUM_BITS)

        for i = 1, numTracks do
            local track = {}
            track.id = streamReadUIntN(streamId, FinancialManager.SEND_NUM_BITS)
            track.name = streamReadString(streamId)
            track.strategy = streamReadUIntN(streamId, 2)
            track.method = streamReadUIntN(streamId, 2)

            track.guidanceData = GuidanceUtil.readGuidanceDataObject(streamId)

            Logger.info(i, track)
            self.savedTracks[i] = track
        end
    end
end

function FinancialManager:onWriteStream(streamId, connection)
    Logger.info("writeStream")
    if not connection:getIsServer() then
        streamWriteUIntN(streamId, #self.savedTracks, FinancialManager.SEND_NUM_BITS)

        for _, track in pairs(self.savedTracks) do
            streamWriteUIntN(streamId, track.id, FinancialManager.SEND_NUM_BITS)
            streamWriteString(streamId, track.name)
            streamWriteUIntN(streamId, track.strategy, 2)
            streamWriteUIntN(streamId, track.method, 2)

            GuidanceUtil.writeGuidanceDataObject(streamId, track.guidanceData)
        end
    end
end
]]
function FinancialManager:update(dt)
end

function FinancialManager:draw(dt)
end
--[[
function FinancialManager:createTrack(id, name)
    Logger.info("Creating track: ", name)

    if id > FinancialManager.MAX_NUM_TRACKS then
        return
    end

    local entry = {
        id = id,
        farmId = 0, -- Todo: make tracks farm dependent
        name = name,
        strategy = 0,
        method = 0,
        guidanceData = {
            width = 0,
            offsetWidth = 0,
            snapDirection = { 0, 0, 0, 0 },
            driveTarget = { 0, 0, 0, 0, 0 }
        }
    }

    if not ListUtil.hasListElement(self.savedTracks, entry) then
        ListUtil.addElementToList(self.savedTracks, entry)
    end
end

function FinancialManager:saveTrack(id, data)
    if id > FinancialManager.MAX_NUM_TRACKS then
        return
    end

    local entry = self.savedTracks[id]
    Logger.info("Saving track: ", entry.name)

    if entry ~= nil then
        if data.name ~= entry.name then
            entry.name = data.name
        end

        entry.strategy = data.strategy
        entry.method = data.method

        entry.guidanceData.width = data.guidanceData.width
        entry.guidanceData.offsetWidth = data.guidanceData.offsetWidth
        entry.guidanceData.snapDirection = data.guidanceData.snapDirection
        entry.guidanceData.driveTarget = data.guidanceData.driveTarget
    end
end

function FinancialManager:deleteTrack(id)
    local entry = self.savedTracks[id]

    Logger.info("Deleting track: ", entry.name)

    ListUtil.removeElementFromList(self.savedTracks, entry)
end

function FinancialManager:getTrack(id)
    return self.savedTracks[id]
end

function FinancialManager:getTrackNameExist(name)
    for _, track in pairs(self.savedTracks) do
        if track.name == name then
            return true
        end
    end

    return false
end
]]
--[[
function GuidanceSteering.installSpecializations(vehicleTypeManager, specializationManager, modDirectory, modName)
    specializationManager:addSpecialization("globalPositioningSystem", "GlobalPositioningSystem", Utils.getFilename("src/vehicles/GlobalPositioningSystem.lua", modDirectory), nil) -- Nil is important here

    for typeName, typeEntry in pairs(vehicleTypeManager:getVehicleTypes()) do
        if SpecializationUtil.hasSpecialization(Drivable, typeEntry.specializations) and
                not SpecializationUtil.hasSpecialization(SplineVehicle, typeEntry.specializations) then
            vehicleTypeManager:addSpecialization(typeName, modName .. ".globalPositioningSystem")
        end
    end

    Drivable.actionEventAccelerate = Utils.overwrittenFunction(Drivable.actionEventAccelerate, GuidanceSteering.actionEventAccelerate)
    Drivable.actionEventBrake = Utils.overwrittenFunction(Drivable.actionEventBrake, GuidanceSteering.actionEventBrake)
    Drivable.actionEventSteer = Utils.overwrittenFunction(Drivable.actionEventSteer, GuidanceSteering.actionEventSteer)
end

function GuidanceSteering.actionEventAccelerate(vehicle, superFunc, actionName, inputValue, callbackState, isAnalog)
    superFunc(vehicle, actionName, inputValue, callbackState, isAnalog)

    local spec = vehicle:guidanceSteering_getSpecTable("globalPositioningSystem")
    if spec ~= nil and spec.hasGuidanceSystem and spec.guidanceSteeringIsActive then
        spec.axisAccelerate = MathUtil.clamp(inputValue, 0, 1)
    end
end

function GuidanceSteering.actionEventBrake(vehicle, superFunc, actionName, inputValue, callbackState, isAnalog)
    superFunc(vehicle, actionName, inputValue, callbackState, isAnalog)

    local spec = vehicle:guidanceSteering_getSpecTable("globalPositioningSystem")
    if spec ~= nil and spec.hasGuidanceSystem and spec.guidanceSteeringIsActive then
        spec.axisBrake = MathUtil.clamp(inputValue, 0, 1)
    end
end

function GuidanceSteering.actionEventSteer(vehicle, superFunc, actionName, inputValue, callbackState, isAnalog)
    superFunc(vehicle, actionName, inputValue, callbackState, isAnalog)

    if inputValue ~= 0 then
        local spec = vehicle:guidanceSteering_getSpecTable("globalPositioningSystem")
        if spec ~= nil and spec.hasGuidanceSystem and spec.lastInputValues.guidanceSteeringIsActive then
            spec.lastInputValues.guidanceSteeringIsActive = false
        end
    end
end

-- Thanks to Jos
-- Ripped from Seasons
function GuidanceSteering:mergeModTranslations(i18n)
    -- We can copy all our translations to the global table because we prefix everything with guidanceSteering_
    -- The mod-based l10n lookup only really works for vehicles, not UI and script mods.
    local global = getfenv(0).g_i18n.texts
    for key, text in pairs(i18n.texts) do
        global[key] = text
    end
end
]]
require "TimedActions/ISBaseTimedAction"

-- By adding this action, we can utilize the base game log system
ISPRVIREnterRVAction = ISBaseTimedAction:derive("ISPRVIREnterRVAction")

function ISPRVIREnterRVAction:isValid()
    return true
end

function ISPRVIREnterRVAction:update()
end

function ISPRVIREnterRVAction:start()
end

function ISPRVIREnterRVAction:stop()
    ISBaseTimedAction.stop(self)
end

function ISPRVIREnterRVAction:perform()
    ISBaseTimedAction.perform(self)
end

function ISPRVIREnterRVAction:complete()
    local vehicleID = PRVIR.getVehicleID(self.vehicle)
    local lotID = nil
    local updateVehiclePos = true
    if vehicleID and PRVIR.dbByVehicleID[vehicleID] then
        lotID = PRVIR.dbByVehicleID[vehicleID].LotID
    end

    -- Look for free
    if not lotID then
        local vehicleName = tostring(self.vehicle:getScript():getFullName())
        local lotClass = PRVIR.vehiclesData[vehicleName]
        local lotData = PRVIR.lots[lotClass]

        if lotData and lotData.rooms then
            for i, room in ipairs(lotData.rooms) do
                local candidateID = lotClass .. "_" .. i
                if not PRVIR.dbByLotID[candidateID] then
                    lotID = candidateID
                    PRVIR.linkVehicleLot(self.character, {vehicle = self.vehicle, lotID = lotID})
                    updateVehiclePos = false
                    break
                end
            end
        end
    end

    -- No more free, someone claimed it, too bad
    if not lotID then return false end

    local tempArr

    if updateVehiclePos then
        tempArr = PRVIR.getUpdateVehicleCoordinate(self.vehicle, vehicleID)
        if tempArr then
            PRVIR.updateVehicleCoordinate(tempArr)
            if isServer() then
                sendServerCommand("PRVIR", "updateClientVehicleCoordinate", tempArr)
            end
        end
    end

    tempArr = PRVIR.getUpdateLotLastVisitedDateTime(lotID)
    PRVIR.updateLotLastVisitedDateTime(tempArr)
    if isServer() then
        sendServerCommand("PRVIR", "updateClientLotLastVisitedDateTime", tempArr)
    end

    local lotClass, lotIndex = PRVIR.getLotClassID(lotID)
    local tpX = PRVIR.lots[lotClass].rooms[lotIndex].sx + (PRVIR.lots[lotClass].teleportOffset and PRVIR.lots[lotClass].teleportOffset.x or 0)
    local tpY = PRVIR.lots[lotClass].rooms[lotIndex].sy + (PRVIR.lots[lotClass].teleportOffset and PRVIR.lots[lotClass].teleportOffset.y or 0)
    local tpZ = PRVIR.lots[lotClass].rooms[lotIndex].sz or 0

    tempArr = {
        tpX = tpX,
        tpY = tpY,
        tpZ = tpZ
    }

    if self.seat then
        if not PRVIR.dbPlayerReturnPosition[self.character:getUsername()] then
            PRVIR.dbPlayerReturnPosition[self.character:getUsername()] = {}
        end
        PRVIR.dbPlayerReturnPosition[self.character:getUsername()].seat = self.seat
        ModData.add("PRVIRPlayerReturnPosition", PRVIR.dbPlayerReturnPosition)
    end

    if self.partID then
        if not PRVIR.dbPlayerReturnPosition[self.character:getUsername()] then
            PRVIR.dbPlayerReturnPosition[self.character:getUsername()] = {}
        end
        PRVIR.dbPlayerReturnPosition[self.character:getUsername()].partID = self.partID
        ModData.add("PRVIR.dbPlayerReturnPosition", PRVIR.dbPlayerReturnPosition)
    end

    -- You cannot teleport normally while using TimedActions
    -- TimedActions would reset the X/Y when animation is completed
    -- If anybody figured out how to do it, let me know
    -- Workaround is use tick to do the teleport

    -- Exclude client, includes server / sp / self host
    if isServer() then
        sendServerCommand(self.character,"PRVIR", "teleportClientPre", nil)
        if SandboxVars.PRVIR.FastMoveBypass then
            PRVIR.dbFastMoveTracker[self.character:getUsername()] = getTimestamp()
            self.character:setFastMoveCheat(true)
            if not PRVIR.hasFastMoveTick then
                PRVIR.hasFastMoveTick = true
                PRVIR.getFastMoveTime = getTimestamp()
                Events.OnTick.Add(PRVIR.onFastMoveTick)
            end
        end
        sendServerCommand(self.character,"PRVIR", "teleportClientToCoordinate", tempArr)
    else
        PRVIR.isTeleporting = true
        PRVIR.tpTickPlayer = self.character
        PRVIR.tpTickArg = tempArr
        Events.OnTick.Add(PRVIR.tpStartTick)
    end

    if not (isClient() and not isServer()) then
        PRVIR.serverWriteLog("[" .. self.character:getUsername() .. "] entered [" .. lotID .. "]")
    end

    return true
end

function ISPRVIREnterRVAction:getDuration()
    if self.character:isTimedActionInstant() then
        return 1
    end
    return 60
end

function ISPRVIREnterRVAction:new(character, vehicle, seat, partID)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.character = character
    o.vehicle = vehicle
    o.seat = seat
    o.partID = partID
    o.maxTime = o:getDuration()

    return o
end
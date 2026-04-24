require "TimedActions/ISBaseTimedAction"

-- By adding this action, we can utilize the base game log system
ISPRVIRExitRVAction = ISBaseTimedAction:derive("ISPRVIRExitRVAction")

function ISPRVIRExitRVAction:isValid()
    return true
end

function ISPRVIRExitRVAction:update()
end

function ISPRVIRExitRVAction:start()
end

function ISPRVIRExitRVAction:stop()
    ISBaseTimedAction.stop(self)
end

function ISPRVIRExitRVAction:perform()
    ISBaseTimedAction.perform(self)
end

function ISPRVIRExitRVAction:complete()
    local tpX, tpY, tpZ = PRVIR.getFallbackExitCoordiantes()

    local tempArr = {
        tpX = tpX,
        tpY = tpY,
        tpZ = tpZ
    }

    if PRVIR.dbByLotID[self.lotID] then
        if PRVIR.dbByLotID[self.lotID] and PRVIR.dbByVehicleID[PRVIR.dbByLotID[self.lotID].VehicleID] then
            tpX = PRVIR.dbByVehicleID[PRVIR.dbByLotID[self.lotID].VehicleID].LastLocationX
            tpY = PRVIR.dbByVehicleID[PRVIR.dbByLotID[self.lotID].VehicleID].LastLocationY
            tpZ = PRVIR.dbByVehicleID[PRVIR.dbByLotID[self.lotID].VehicleID].LastLocationZ
        end

        tempArr.VehicleID = PRVIR.dbByLotID[self.lotID].VehicleID
        tempArr.tpX = tpX
        tempArr.tpY = tpY
        tempArr.tpZ = tpZ

        if PRVIR.dbPlayerReturnPosition[self.character:getUsername()] then
            if PRVIR.dbPlayerReturnPosition[self.character:getUsername()].seat then
                tempArr.seat = PRVIR.dbPlayerReturnPosition[self.character:getUsername()].seat
            end

            if PRVIR.dbPlayerReturnPosition[self.character:getUsername()].partID then
                tempArr.partID = PRVIR.dbPlayerReturnPosition[self.character:getUsername()].partID
            end
        end
    end

    -- You cannot teleport normally while using TimedActions
    -- TimedActions would reset the X/Y when animation is completed
    -- If anybody figured out how to do it, let me know
    -- Workaround is use tick to do the teleport
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
        PRVIR.serverWriteLog("[" .. self.character:getUsername() .. "] exited [" .. self.lotID .. "]")
    end

    return true
end

function ISPRVIRExitRVAction:getDuration()
    if self.character:isTimedActionInstant() then
        return 1
    end
    return 60
end

function ISPRVIRExitRVAction:new(character, lotID)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.character = character
    o.lotID = lotID
    o.maxTime = o:getDuration()

    return o
end
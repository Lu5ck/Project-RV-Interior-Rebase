if not isClient() and isServer() then
	return
end

PRVIR.dbByLotID = PRVIR.dbByLotID or nil
PRVIR.dbByVehicleID = PRVIR.dbByVehicleID or nil
PRVIR.freeRoomCounts = PRVIR.freeRoomCounts or {}
PRVIR.trackVehiclePositionDateTime = PRVIR.trackVehiclePositionDateTime or nil

-- Instead of looping the database everytime encountering a vehicle
-- WE just cache the free room counts
function PRVIR.calculateFreeRoom()
    -- Count how many rooms there are for each lot class
    for lotName, lotData in pairs(PRVIR.lots) do
        if lotData.rooms then
            PRVIR.freeRoomCounts[lotName] = #lotData.rooms
        end
    end

    -- Subtract occupied rooms
    for lotID, _ in pairs(PRVIR.dbByLotID) do
        local lotName = PRVIR.getLotClassID(lotID)
        if lotName and PRVIR.freeRoomCounts[lotName] then
            PRVIR.freeRoomCounts[lotName] = PRVIR.freeRoomCounts[lotName] - 1
        end
    end
end

function PRVIR.ClientOnReceiveGlobalModData(key, modData)
    if key == "PRVIR.dbByLotID" then
        PRVIR.dbByLotID = modData
        PRVIR.calculateFreeRoom()
    end
    if key == "PRVIR.dbByVehicleID" then
        PRVIR.dbByVehicleID = modData
    end
end

function PRVIR.ClientCheckDbExist()
	if not PRVIR.dbByLotID or not PRVIR.dbByVehicleID then
		PRVIR.ClientForceSync()
		return false
	end
    return true
end

function PRVIR.ClientForceSync()
	ModData.request("PRVIR.dbByLotID")
	ModData.request("PRVIR.dbByVehicleID")
end

function PRVIR.AfterGameStart()
	PRVIR.ClientForceSync()
	Events.OnServerCommand.Add(PRVIR.OnServerCommand)
    if not isClient() and not isServer() then
        PRVIR.calculateFreeRoom()
    end
    PRVIR.trackVehiclePositionDateTime = getTimestamp()
    Events.OnTick.Add(PRVIR.trackVehiclePositionTick)
	Events.OnTick.Remove(PRVIR.AfterGameStart)
end

function PRVIR.ClientEveryHours()
    local lotID = PRVIR.getPlayerAtWhichLot(getPlayer())
    if lotID then
        local tempArr = PRVIR.getUpdateLotLastVisitedDateTime(lotID)

        -- Exclude client, includes server / sp / self host
        if not (isClient() and not isServer()) then
            PRVIR.updateLotLastVisitedDateTime(tempArr)
        else
            sendClientCommand(player, "PRVIR", "updateServerLotLastVisitedDateTime", tempArr)
        end
    end
end

function PRVIR.trackVehiclePositionTick()
    local player = getPlayer()
    if player:isDriving() and getTimestamp() - PRVIR.trackVehiclePositionDateTime >= SandboxVars.PRVIR.VehiclePositionUpdateThrottle then
        local vehicle = player:getVehicle()
        local vehicleID = PRVIR.getVehicleID(vehicle)
        if vehicle then
            if vehicleID and PRVIR.dbByVehicleID[vehicleID] then
                local tempArr = PRVIR.getUpdateVehicleCoordinate(vehicle, vehicleID)
                if tempArr then
                    sendClientCommand(player, "PRVIR", "updateServerVehicleCoordinate", tempArr)
                end
            end

            vehicle = vehicle:getVehicleTowing()
            vehicleID = PRVIR.getVehicleID(vehicle)
            if vehicleID and PRVIR.dbByVehicleID[vehicleID] then
                local tempArr = PRVIR.getUpdateVehicleCoordinate(vehicle, vehicleID)
                if tempArr then
                    sendClientCommand(player, "PRVIR", "updateServerVehicleCoordinate", tempArr)
                end
            end
        end
        PRVIR.trackVehiclePositionDateTime = getTimestamp()
    end
end

-- OnServerCommand
function PRVIR.addClientGlobalData(args)
    if not args then return end
	if not PRVIR.ClientCheckDbExist() then return end

    PRVIR.dbByLotID[args.LotID] = {
        VehicleID = args.VehicleID,
        AssignedDateTime = args.AssignedDateTime
    }
    PRVIR.dbByVehicleID[args.VehicleID] = {
        LotID = args.LotID,
        LastLocationX = args.LastLocationX,
        LastLocationY = args.LastLocationY,
        LastLocationZ = args.LastLocationZ,
        LastLocationUpdateDateTime = args.LastLocationUpdateDateTime
    }

    local lotClass = PRVIR.getLotClassID(args.LotID)
    PRVIR.freeRoomCounts[lotClass] = PRVIR.freeRoomCounts[lotClass] - 1

    if PRVIR.customLink_instance ~= nil then
        PRVIR.customLink_instance:data_onChange(args.LotID, true)
    end
end

-- OnServerCommand
function PRVIR.removeClientGlobalData(args)
    if not args then return end
	if not PRVIR.ClientCheckDbExist() then return end

    if not PRVIR.dbByLotID[args.LotID] then
		PRVIR.ClientForceSync()
		return
    end

    if not PRVIR.dbByVehicleID[args.VehicleID] then
		PRVIR.ClientForceSync()
		return
    end

    PRVIR.dbByLotID[args.LotID] = nil
    PRVIR.dbByVehicleID[args.VehicleID] = nil

    local lotClass = PRVIR.getLotClassID(args.LotID)
    PRVIR.freeRoomCounts[lotClass] = PRVIR.freeRoomCounts[lotClass] + 1

    if PRVIR.customLink_instance ~= nil then
        PRVIR.customLink_instance:data_onChange(args.LotID, false)
    end
end

-- OnServerCommand
function PRVIR.updateClientVehicleCoordinate(args)
    if not args then return end
    PRVIR.updateVehicleCoordinate(args)
end

-- OnServerCommand
function PRVIR.updateClientLotLastVisitedDateTime(args)
    if not args then return end
    PRVIR.updateLotLastVisitedDateTime(args)
end

PRVIR.OnServerCommand = function(moduleName, command, playerObj, args)
    if moduleName == "PRVIR" then
        if PRVIR[command] then
            PRVIR[command](playerObj, args)
        end
    end
end


Events.OnTick.Add(PRVIR.AfterGameStart)
Events.OnReceiveGlobalModData.Add(PRVIR.ClientOnReceiveGlobalModData)
Events.EveryHours.Add(PRVIR.ClientEveryHours)
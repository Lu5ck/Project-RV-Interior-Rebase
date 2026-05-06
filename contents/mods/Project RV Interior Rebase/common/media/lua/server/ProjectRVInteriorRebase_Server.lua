-- I am Another Vehicle Claim system mod author
-- I don't like to use loop for database so I will create multiple lookup tables if need to
-- Lookup table simply superior in performance as it grows larger, and popular MP server will grow larger

--[[
There are two key value pairs that form a database like lookup tables
PRVIR.dbByLotID
PRVIR.dbByVehicleID

PRVIR.dbByLotID[lotID] = {
	VehicleID = xxx,
	AssignedDateTime = xxx,
	LastVisitedDateTime = xxx
}

PRVIR.dbByVehicleID[vehicleID] = {
	LotID = xxx,
	LastLocationX = xxx,
	LastLocationY = xxx,
	LastLocationZ = xxx,
	LastLocationUpdateDateTime = xxx
}

lotID is a combination of lot class and lot index, eg normal_1
The ID can be split to get info from PRVIR.lots

Player positions like which seat or car part they entered from is recorded
This full info is server-side only and never shared with any clients
When player exit the RV, the related info will be sent to client tp procedure
After tp completed, the user will tell the server to delete the related info

PRVIR.dbPlayerReturnPosition[username] = {
	seat = index,
	partID = part name
}
--]]

if isClient() and not isServer() then
	return
end

PRVIR.dbByLotID = PRVIR.dbByLotID or nil
PRVIR.dbByVehicleID = PRVIR.dbByVehicleID or nil
PRVIR.dbPlayerReturnPosition = PRVIR.dbPlayerReturnPosition or nil
PRVIR.dbFastMoveTracker = PRVIR.dbFastMoveTracker or {}
PRVIR.getFastMoveTime = PRVIR.getFastMoveTime or nil
PRVIR.hasFastMoveTick = PRVIR.hasFastMoveTick or false

if Vehicles and not PRVIR.oLowerCondition then
    PRVIR.oLowerCondition = Vehicles.LowerCondition

	function Vehicles.LowerCondition(vehicle, part, elapsedMinutes)
		local vehicleID = PRVIR.getVehicleID(vehicle)
		if vehicleID and PRVIR.dbByVehicleID[vehicleID] then
			local tempArr = PRVIR.getUpdateVehicleCoordinate(vehicle, vehicleID)
			if tempArr then
				PRVIR.updateVehicleCoordinate(tempArr)
				sendServerCommand("PRVIR", "updateClientVehicleCoordinate", arg)
			end
		end
		return PRVIR.oLowerCondition(vehicle, part, elapsedMinutes)
	end
end

-- OnClientCommand
function PRVIR.updateServerLotLastVisitedDateTime(playerObj, args)
	if not args then return end
	PRVIR.updateLotLastVisitedDateTime(args)
	sendServerCommand("PRVIR", "updateClientLotLastVisitedDateTime", args)
end

-- OnClientCommand
function PRVIR.updateServerVehicleCoordinate(playerObj, args)
	if not args then return end
	PRVIR.updateVehicleCoordinate(args)
	sendServerCommand("PRVIR", "updateClientVehicleCoordinate", args)
end

-- OnClientCommand
function PRVIR.updateServerPlayerTeleportCompleted(playerObj, args)
	if not args or not args.username or not args.inRV then return end
	if not args.inRV and PRVIR.dbPlayerReturnPosition[args.username] then
		PRVIR.dbPlayerReturnPosition[args.username] = nil
		ModData.add("PRVIR.dbPlayerReturnPosition", PRVIR.dbPlayerReturnPosition)
	end

	if PRVIR.dbFastMoveTracker[args.username] then
		PRVIR.dbFastMoveTracker[args.username] = nil
	end
end

-- OnClientCommand
function PRVIR.unlinkVehicle(playerObj, args)
	if not args or (not args.vehicle and not args.pzVehicleID) then return end
	local vehicle = args.vehicle
	if args.pzVehicleID and not vehicle then
		vehicle = getVehicleById(args.pzVehicleID)
	end
	local vehicleID = PRVIR.getVehicleID(vehicle)
	if vehicleID and PRVIR.dbByVehicleID[vehicleID] then
		local lotID = PRVIR.dbByVehicleID[vehicleID].LotID
		PRVIR.dbByVehicleID[vehicleID] = nil
		PRVIR.dbByLotID[lotID] = nil

		ModData.add("PRVIR.dbByVehicleID", PRVIR.dbByVehicleID)
		ModData.add("PRVIR.dbByLotID", PRVIR.dbByLotID)

		local tempArr = {
			VehicleID = vehicleID,
			LotID = lotID
		}

		if isServer() then
			sendServerCommand("PRVIR", "removeClientGlobalData", tempArr)
		else
			if PRVIR.customLink_instance ~= nil then
				PRVIR.customLink_instance:data_onChange(lotID, false)
			end
		end
	end
end

-- OnClientCommand
function PRVIR.unlinkLot(playerObj, args)
	if not args or not args.lotID then return end
	local lotClass, lotIndex = PRVIR.getLotClassID(args.lotID)
	if not lotClass or not lotIndex then return false end

	if PRVIR.dbByLotID[args.lotID] then
		local vehicleID = PRVIR.dbByLotID[args.lotID].VehicleID
		PRVIR.dbByLotID[args.lotID] = nil
		PRVIR.dbByVehicleID[vehicleID] = nil

		ModData.add("PRVIR.dbByLotID", PRVIR.dbByLotID)
		ModData.add("PRVIR.dbByVehicleID", PRVIR.dbByVehicleID)

		local tempArr = {
			VehicleID = vehicleID,
			LotID = args.lotID
		}

		if isServer() then
			sendServerCommand("PRVIR", "removeClientGlobalData", tempArr)
		else
			if PRVIR.customLink_instance ~= nil then
				PRVIR.customLink_instance:data_onChange(args.lotID, false)
			end
		end
	end
end

-- OnClientCommand
function PRVIR.linkVehicleLot(playerObj, args)
	if not args or not args.lotID or (not args.vehicle and not args.pzVehicleID) then return false end
	local vehicle = args.vehicle
	if args.pzVehicleID and not vehicle then
		vehicle = getVehicleById(args.pzVehicleID)
	end
	local vehicleID = PRVIR.getVehicleID(vehicle)
	local lotClass, lotIndex = PRVIR.getLotClassID(args.lotID)
	if not lotClass or not lotIndex then return false end

	-- Typically only happen using admin related tools to force link
	-- Check and remove any existing links
	if PRVIR.dbByVehicleID[vehicleID] then
		PRVIR.unlinkVehicle(playerObj, { vehicle = vehicle })
	end

	if PRVIR.dbByLotID[args.lotID] then
		PRVIR.unlinkLot(playerObj, { lotID = args.lotID } )
	end

	-- Establish the new link
	local dateTime = getTimestamp()
	PRVIR.dbByLotID[args.lotID] = {
		VehicleID = vehicleID,
		AssignedDateTime = dateTime
	}
	PRVIR.dbByVehicleID[vehicleID] = {
		LotID = args.lotID,
		LastLocationX = math.floor(vehicle:getX()),
		LastLocationY = math.floor(vehicle:getY()),
		LastLocationZ = math.floor(vehicle:getZ()),
		LastLocationUpdateDateTime = dateTime
	}

	ModData.add("PRVIR.dbByLotID", PRVIR.dbByLotID)
	ModData.add("PRVIR.dbByVehicleID", PRVIR.dbByVehicleID)

	local tempArr = {
		VehicleID = vehicleID,
		LotID = args.lotID,
		AssignedDateTime = dateTime,
		LastLocationX = PRVIR.dbByVehicleID[vehicleID].LastLocationX,
		LastLocationY = PRVIR.dbByVehicleID[vehicleID].LastLocationY,
		LastLocationZ = PRVIR.dbByVehicleID[vehicleID].LastLocationZ,
		LastLocationUpdateDateTime = dateTime
	}

	if isServer() then
		PRVIR.addIntoTimeoutCache(args.lotID)
		sendServerCommand("PRVIR", "addClientGlobalData", tempArr)
	else
		if PRVIR.customLink_instance ~= nil then
			PRVIR.customLink_instance:data_onChange(args.lotID, true)
		end
	end

end

-- Doesn't work, square can't store getModData()
function PRVIR.updateSquareModData(playerObj, args)
	if not args.squareX or not args.squareY or not args.squareZ or not args.lotID then return end
	local square = getSquare(args.squareX, args.squareY, args.squareZ)
	if square then
		square:getModData().PRVIR_LotID = args.lotID
		square:transmitModData()
	end
end

-- Limit call to specific functions for security reason
PRVIR.OnClientCommand = function(moduleName, command, playerObj, args)
    if moduleName == "PRVIR" then
        if PRVIR[command] then
			if command == "linkVehicleLot" or command == "unlinkLot" then
				if not playerObj:getRole():hasCapability(Capability.ManipulateVehicle) then
					return
				end
			end
			if command == "linkVehicleLot" or
				command == "unlinkLot" or
				command == "unlinkVehicle" or
				command == "updateServerPlayerTeleportCompleted" or
				command == "updateServerVehicleCoordinate" or
				command == "updateServerLotLastVisitedDateTime" or
				command == "updateSquareModData" then
            	PRVIR[command](playerObj, args)
			end
        end
    end
end

function PRVIR.OnInitGlobalModData(isNewGame)
	-- Set global variable as this is frequently accessed
	PRVIR.dbByLotID = ModData.getOrCreate("PRVIR.dbByLotID")
	PRVIR.dbByVehicleID = ModData.getOrCreate("PRVIR.dbByVehicleID")
	PRVIR.dbPlayerReturnPosition = ModData.getOrCreate("PRVIR.dbPlayerReturnPosition")
	PRVIR.buildRvTimeoutCache()
end

function PRVIR.onFastMoveTick()
	if getTimestamp() - PRVIR.getFastMoveTime < 1 then return end

	local count = 0

	-- Build a cache with `username = playerObj`
	local players = getOnlinePlayers()
	local playersLookup = {}
	for i = 0, players:size() - 1 do
		local player = players:get(i)
		playersLookup[player:getUsername()] = player
	end

	for k, v in pairs(PRVIR.dbFastMoveTracker) do
		if getTimestamp() - v >= SandboxVars.PRVIR.FastMoveExpiry then
			local player = playersLookup[k]
			if player then
				player:setFastMoveCheat(false)
			else
				players = getOnlinePlayers()
				for i = 0, players:size() - 1 do
					player = players:get(i)
					if k == player:getUsername() then
						player:setFastMoveCheat(false)
						break
					end
				end
			end
			PRVIR.dbFastMoveTracker[k] = nil
		end
		count = count + 1
	end

	if count <= 0 then
		Events.OnTick.Remove(PRVIR.onFastMoveTick)
		PRVIR.hasFastMoveTick = false
		PRVIR.getFastMoveTime = nil
	end

	PRVIR.getFastMoveTime = getTimestamp()
end

function PRVIR.serverWriteLog(message)
	local msg = "[" .. getTimestamp() .. "] "
	msg = msg .. message
	writeLog("PRVIR", msg)
end

Events.OnClientCommand.Add(PRVIR.OnClientCommand)
Events.OnInitGlobalModData.Add(PRVIR.OnInitGlobalModData)

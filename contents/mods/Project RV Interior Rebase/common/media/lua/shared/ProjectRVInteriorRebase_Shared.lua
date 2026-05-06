PRVIR = PRVIR or {}

-- We assigned square moddata with lotClass_roomID so we don't need to loop again
-- Mainly used when exiting RV
function PRVIR.getPlayerAtWhichLot(playerObj)
    if PRVIR.isPlayerInRvRegion(playerObj) then
        local square = playerObj:getSquare()
        if square then
            if square:getModData().PRVIR_LotID then
                return square:getModData().PRVIR_LotID
            else
                if square:getBuilding() then
                    local px = math.floor(playerObj:getX())
                    local py = math.floor(playerObj:getY())
                    local pz = math.floor(playerObj:getZ())
                    for lotName, lotData in pairs(PRVIR.lots) do
                        if lotData.rooms then
                            for i, room in ipairs(lotData.rooms) do
                                if px >= room.sx and px <= room.ex and py >= room.sy and py <= room.ey and pz >= room.sz and pz <= room.ez then
                                    local lotID = lotName .. "_" .. i
                                    -- Doesn't work, square can't store getModData()
                                    --[[
                                    if isClient() and not isServer() then
                                        sendClientCommand(player, "PRVIR", "updateSquareModData", { squareX = px, squareY = py, squareZ = pz, lotID = lotID })
                                    else
                                        PRVIR.updateSquareModData(playerObj, { squareX = px, squareY = py, squareZ = pz, lotID = lotID })
                                    end
                                    ]]--
                                    return lotID
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

-- Mainly used for context menu

function PRVIR.isPlayerInRvRegion(playerObj)
    local px = math.floor(playerObj:getX())
    local py = math.floor(playerObj:getY())

    return PRVIR.isCoordinateInRvRegion(px, py)
end

-- Decorate this if adding new region
function PRVIR.isCoordinateInRvRegion(vX, vY, vZ)
    if vX >= 22272 and vX <= 25087 and vY >= 11776 and vY <= 12799 then
        return true
    end

    return false
end

function PRVIR.getVehicleID(vehicle)
    if not vehicle then return nil end

    local vehicleID = vehicle:getModData().SQLID
    if vehicleID then
        return vehicleID
    elseif isServer() or (not isServer() and not isClient()) then
        vehicleID = tonumber(getTimestamp() .. vehicle:getSqlId())
        vehicle:getModData().SQLID = vehicleID
        vehicle:transmitModData()
        return vehicleID
    end

    return nil
end

function PRVIR.getLotClassID(lotID)
    if not lotID then return nil, nil end
    local lotClass, lotIndex = lotID:match("^(.-)_(%d+)$")
    if lotIndex then lotIndex = tonumber(lotIndex) end
    if lotClass and lotIndex then
        if PRVIR.lots[lotClass] and PRVIR.lots[lotClass].rooms[lotIndex] then
            return lotClass, lotIndex
        end
    end
    return nil, nil
end

function PRVIR.getFallbackExitCoordiantes()
    local raw = SandboxVars.PRVIR.FallbackExitCoordiantes
    if not raw then raw = "" end
    local x, y, z = raw:match("^(-?%d+),(-?%d+),(-?%d+)$")

    if not x or not y or not z or not string.match(x, "^%d+$") or not string.match(y, "^%d+$") or not string.match(z, "^%d+$") then
        x, y, z = 10852, 9846, 0
    else
        x, y, z = tonumber(x), tonumber(y), tonumber(z)
    end
    return x, y, z
end

if ISDestroyStuffAction and not PRVIR.oISDestroyStuffAction then
    PRVIR.oISDestroyStuffAction = ISDestroyStuffAction.new
    function ISDestroyStuffAction:new(character, item, cornerCounter)
        if isClient() and PRVIR.isPlayerInRvRegion(character) then
            if not character:getRole():hasCapability(Capability.UseBrushToolManager) then
                if (item:getType() == IsoObjectType.wall or item:getType() == IsoObjectType.lightswitch) and not instanceof(item, "IsoThumpable") then
                    character:Say(getText("ContextMenu_PRVIR_NoDestroy"))
                    local temp = {
                        ignoreAction = true
                    }
                    return temp
                end
            end
        end
        return PRVIR.oISDestroyStuffAction(self, character, item, cornerCounter)
    end
end

function PRVIR.getUpdateVehicleCoordinate(vehicle, vehicleID)
    local curX = math.floor(vehicle:getX())
    local curY = math.floor(vehicle:getY())
    local curZ = math.floor(vehicle:getZ())

	if not vehicleID then
		vehicleID = PRVIR.getVehicleID(vehicle)
	end

    if PRVIR.dbByVehicleID[vehicleID].LastLocationX ~= curX or PRVIR.dbByVehicleID[vehicleID].LastLocationY ~= curY or PRVIR.dbByVehicleID[vehicleID].LastLocationZ ~= curZ then
        PRVIR.dbByVehicleID[vehicleID].LastLocationX = curX
        PRVIR.dbByVehicleID[vehicleID].LastLocationY = curY
        PRVIR.dbByVehicleID[vehicleID].LastLocationZ = curZ
        PRVIR.dbByVehicleID[vehicleID].LastLocationUpdateDateTime = getTimestamp()

        local tempArr = {
            VehicleID = vehicleID,
            LastLocationX = curX,
            LastLocationY = curY,
            LastLocationZ = curZ,
            LastLocationUpdateDateTime = PRVIR.dbByVehicleID[vehicleID].LastLocationUpdateDateTime
        }
        return tempArr
    end
    return nil
end

function PRVIR.updateVehicleCoordinate(args)
	if not args and not args.VehicleID and not args.LastLocationX and not args.LastLocationY and not args.LastLocationZ and not args.LastLocationUpdateDateTime and not PRVIR.dbByVehicleID then return end
    if PRVIR.dbByVehicleID[args.VehicleID] then
        PRVIR.dbByVehicleID[args.VehicleID].LastLocationX = args.LastLocationX
        PRVIR.dbByVehicleID[args.VehicleID].LastLocationY = args.LastLocationY
        PRVIR.dbByVehicleID[args.VehicleID].LastLocationZ = args.LastLocationZ
        PRVIR.dbByVehicleID[args.VehicleID].LastLocationUpdateDateTime = args.LastLocationUpdateDateTime

        -- Exclude client, includes server / sp / self host
        if not (isClient() and not isServer()) then
            ModData.add("PRVIR.dbByVehicleID", PRVIR.dbByVehicleID)
        end
    end
end

function PRVIR.getUpdateLotLastVisitedDateTime(lotID)
    if lotID then
        if PRVIR.dbByLotID[lotID] then
            local datetime = getTimestamp()

            local tempArr = {
                LotID = lotID,
                LastVisitedDateTime = datetime
            }

            return tempArr
        end
    end

    return nil
end

function PRVIR.updateLotLastVisitedDateTime(args)
    if args and args.LotID and args.LastVisitedDateTime then
        if PRVIR.dbByLotID[args.LotID] then
            PRVIR.dbByLotID[args.LotID].LastVisitedDateTime = args.LastVisitedDateTime

            -- Exclude client, includes server / sp / self host
            if not (isClient() and not isServer()) then
                ModData.add("PRVIR.dbByLotID", PRVIR.dbByLotID)
            end
        end
    end
end

function PRVIR.getUIFontScale()
    -- Size 1 is 100% (default)
    -- Size 2 is 130%
    -- Size 3 is 160%
    -- Size 4 is 190%
    -- Size 5 is 220%
    return 1 + (getCore():getOptionFontSize() - 1) * 0.4
end

function PRVIR.parseVehiclesSandbox()
    local customString = SandboxVars.PRVIR.CustomVehicles
    if not customString then return end
    for entry in customString:gmatch("[^;]+") do
        local vehicle, vtype = entry:match("^%s*(.-)%s*=%s*(.-)%s*$")
        if vehicle and vtype and vehicle ~= "" and vtype ~= "" then
            PRVIR.vehiclesData[vehicle] = vtype
        end
    end
end

Events.OnInitGlobalModData.Add(PRVIR.parseVehiclesSandbox)
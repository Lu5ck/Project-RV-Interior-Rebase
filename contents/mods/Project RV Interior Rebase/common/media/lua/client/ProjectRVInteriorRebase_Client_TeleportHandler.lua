if not isClient() and isServer() then
	return
end

PRVIR.isTeleporting = PRVIR.isTeleporting or false -- Compatibility for KWRR Security
PRVIR.tpTickCount = PRVIR.tpTickCount or 0
PRVIR.tpTickPlayer = PRVIR.tpTickPlayer or nil
PRVIR.tpTickArg = PRVIR.tpTickArg or nil

-- OnServerCommand
function PRVIR.teleportClientToCoordinate(args)
    if not args then return end
    PRVIR.isTeleporting = true
    PRVIR.tpTickPlayer = getPlayer()
    PRVIR.tpTickArg = args
    Events.OnTick.Add(PRVIR.tpStartTick)
end

-- OnServerCommand, minimize false positive for KWRR Security
function PRVIR.teleportClientPre()
    PRVIR.isTeleporting = true
end

function PRVIR.tpResetTracker()
    PRVIR.tpTickCount = 0
    PRVIR.isTeleporting = false
    PRVIR.tpTickPlayer = nil
    PRVIR.tpTickArg = nil
end

-- Workaround to teleport for TimedActions
function PRVIR.tpStartTick()
    if PRVIR.tpTickCount >= 5 and PRVIR.tpTickPlayer and PRVIR.tpTickArg then
        PRVIR.tpTickPlayer:setX(PRVIR.tpTickArg.tpX)
        PRVIR.tpTickPlayer:setLastX(PRVIR.tpTickArg.tpX)
        PRVIR.tpTickPlayer:setY(PRVIR.tpTickArg.tpY)
        PRVIR.tpTickPlayer:setLastY(PRVIR.tpTickArg.tpY)
        PRVIR.tpTickPlayer:setZ(PRVIR.tpTickArg.tpZ)
        PRVIR.tpTickPlayer:setLastZ(PRVIR.tpTickArg.tpZ)
        Events.OnTick.Remove(PRVIR.tpStartTick)
        PRVIR.tpTickCount = 0
        if PRVIR.tpTickArg.partID or PRVIR.tpTickArg.seat then
            PRVIR.tpTickArg.startTime = getTimestamp()
            Events.OnTick.Add(PRVIR.tpPositionToVehicleTick)
        else
            local inRV = false
            if PRVIR.isCoordinateInRvRegion(PRVIR.tpTickArg.tpX, PRVIR.tpTickArg.tpY) then
                inRV = true
            end
            sendClientCommand(PRVIR.tpTickPlayer, "PRVIR", "updateServerPlayerTeleportCompleted", { username = PRVIR.tpTickPlayer:getUsername(), inRV = inRV })
            PRVIR.tpResetTracker()
        end
    elseif PRVIR.tpTickPlayer:getSquare() then
        PRVIR.tpTickCount = PRVIR.tpTickCount + 1
    end

    -- Extra check just incase some unknown reason it is empty
    if not PRVIR.tpTickPlayer or not PRVIR.tpTickArg then
        Events.OnTick.Remove(PRVIR.tpStartTick)
        PRVIR.tpResetTracker()
    end
end

-- When user teleported back, we need to find that vehicle to reposition the user
function PRVIR.tpFindVehicle(vehicleID)
    local player = getPlayer()
    local vehicle = player:getNearVehicle() -- Try the closest
    local foundVehicle = false

    if vehicle then
        if PRVIR.getVehicleID(vehicle) == vehicleID then
            foundVehicle = true
            return vehicle
        end
    end

    if not foundVehicle then
        local square = player:getSquare()
        if square then
            local cell = square:getCell()
            if cell then
                local vehicles = cell:getVehicles()
                if vehicles then
                    vehicles = vehicles:iterator()
                    if vehicles then
                        while vehicles:hasNext() do
                            local v = vehicles:next()
                            local tempId = PRVIR.getVehicleID(v)
                            if tempId and tempId == vehicleID then
                                vehicle = v
                                foundVehicle = true
                                break
                            end
                        end
                    end
                end
            end
        end
    end

    if foundVehicle then
        return vehicle
    else
        return foundVehicle
    end
end

function PRVIR.getTpPositionFromVehicle(vehicle, partSquare)
    local px = partSquare:getX()
    local py = partSquare:getY()
    local pz = partSquare:getZ()

    local cx = vehicle:getX()
    local cy = vehicle:getY()

    local dx = px - cx
    local dy = py - cy

    local stepX = 0
    local stepY = 0
    if math.abs(dx) >= math.abs(dy) then
        stepX = dx > 0 and 0.5 or -0.5
    else
        stepY = dy > 0 and 0.5 or -0.5
    end

    return px + stepX, py + stepY, pz
end

function PRVIR.tpPositionToVehicleTick()
    if PRVIR.tpTickCount >= 5 and PRVIR.tpTickPlayer and PRVIR.tpTickArg then
        local vehicle = PRVIR.tpFindVehicle(PRVIR.tpTickArg.VehicleID)
        local lastTick = false

        if vehicle then
            if PRVIR.tpTickArg.seat then
                local seat = PRVIR.tpTickArg.seat
                if vehicle:isSeatOccupied(seat) then
                    local seatParts = vehicle:getAllSeatParts()
                    seat = seatParts:size()
                    for i = 0, seatParts:size() - 1 do
                        if not vehicle:isSeatOccupied(i) then
                            seat = i
                            break
                        end
                    end
                    if seat ~= seatParts:size()  then
                        vehicle:enter(seat, PRVIR.tpTickPlayer)
                        vehicle:setCharacterPosition(PRVIR.tpTickPlayer, seat, "inside")
                        vehicle:transmitCharacterPosition(seat, "inside")
                    end
                else
                    vehicle:enter(seat, PRVIR.tpTickPlayer)
                    vehicle:setCharacterPosition(PRVIR.tpTickPlayer, seat, "inside")
                    vehicle:transmitCharacterPosition(seat, "inside")
                end
            end

            if PRVIR.tpTickArg.partID then
                local part = vehicle:getPartById(PRVIR.tpTickArg.partID)
                local isTeleported = false
                if part then
                    local partArea = part:getArea()
                    if partArea then
                        local tpX, tpY, tpZ = PRVIR.getTpPositionFromVehicle(vehicle, vehicle:getSquareForArea(partArea))

                        local adjacentOffsets = {
                            {0, 0}, {1, 0}, {-1, 0}, {0, 1}, {0, -1},
                            {1, 1}, {-1, 1}, {1, -1}, {-1, -1}
                        }

                        for _, offset in ipairs(adjacentOffsets) do
                            local sq = getSquare(tpX + offset[1], tpY + offset[2], tpZ)
                            if sq and sq:canStand() then
                                PRVIR.tpTickPlayer:setX(tpX + offset[1])
                                PRVIR.tpTickPlayer:setLastX(tpX + offset[1])
                                PRVIR.tpTickPlayer:setY(tpY + offset[2])
                                PRVIR.tpTickPlayer:setLastY(tpY + offset[2])
                                PRVIR.tpTickPlayer:setZ(tpZ)
                                PRVIR.tpTickPlayer:setLastZ(tpZ)
                                isTeleported = true
                                break
                            end
                        end
                    end
                end

                if not isTeleported then
                    -- Drop outside seat if cannot find usable part area
                    local seatParts = vehicle:getAllSeatParts()
                    if seatParts then
                        local seat = seatParts:size() - 1

                        vehicle:setCharacterPosition(PRVIR.tpTickPlayer, seat, "outside")
                        vehicle:transmitCharacterPosition(seat, "outside")
                    else
                        -- If all else fails, we just drop two squares from the vehicle
                        -- If still fail, just drop on the vehicle center
                        local vX = math.floor(vehicle:getX())
                        local vY = math.floor(vehicle:getY())
                        local vZ = math.floor(vehicle:getZ())

                        local adjacentOffsets = {
                            {2, 0}, {-2, 0}, {0, 2}, {0, -2},
                            {2, 2}, {-2, 2}, {2, -2}, {-2, -2}
                        }

                        for _, offset in ipairs(adjacentOffsets) do
                            local sq = getSquare(vX + offset[1], vY + offset[2], vZ)
                            if sq and sq:canStand() then
                                vX = vX + offset[1]
                                vY = vY + offset[2]
                                break
                            end
                        end

                        PRVIR.tpTickPlayer:setX(vX)
                        PRVIR.tpTickPlayer:setLastX(vX)
                        PRVIR.tpTickPlayer:setY(vY)
                        PRVIR.tpTickPlayer:setLastY(vY)
                        PRVIR.tpTickPlayer:setZ(vZ)
                        PRVIR.tpTickPlayer:setLastZ(vZ)
                    end
                end
            end

            lastTick = true
        else
            if getTimestamp() - PRVIR.tpTickArg.startTime > 10 then
                lastTick = true
            else
                PRVIR.tpTickCount = 0
            end
        end

        if lastTick then
            Events.OnTick.Remove(PRVIR.tpPositionToVehicleTick)
            sendClientCommand(PRVIR.tpTickPlayer, "PRVIR", "updateServerPlayerTeleportCompleted", { username = PRVIR.tpTickPlayer:getUsername(), inRV = false })
            if not vehicle then
                PRVIR.tpTickPlayer:Say(getText("ContextMenu_PRVIR_TeleportHaywire"))
            end
            PRVIR.tpResetTracker()
        end
    elseif PRVIR.tpTickPlayer:getSquare() then
        PRVIR.tpTickCount = PRVIR.tpTickCount + 1
    end
end


if not isClient() and isServer() then
	return
end

-- target, button, parem1, parem2
function PRVIR.dialogueConfirm_onButton(player, btn, option, object)
    if btn.internal == "NO" then return end
    if option == "unlinkVehicle" then
        if isClient() then
            sendClientCommand(player, "PRVIR", "unlinkVehicle", { pzVehicleID = object:getId() })
        else
            PRVIR.unlinkVehicle(player, { vehicle = object })
        end
    elseif option == "unlinkLot" then
        if isClient() then
            sendClientCommand(player, "PRVIR", "unlinkLot", { lotID = object })
        else
            PRVIR.unlinkLot(player, { lotID = object })
        end
    end
end

function PRVIR.dialogueConfirm(playerNum, message, option, object)
    if PRVIR.dialogueConfirm_instance ~= nil then
        PRVIR.dialogueConfirm_instance:close()
        PRVIR.dialogueConfirm_instance:removeFromUIManager()
        PRVIR.dialogueConfirm_instance = nil
    end
    local width = 250 * PRVIR.getUIFontScale()
    local height = 100 * PRVIR.getUIFontScale()
    PRVIR.dialogueConfirm_instance = ISModalDialog:new((getCore():getScreenWidth() / 2) - (width / 2), (getCore():getScreenHeight() / 2) - (height / 2), width, height, message, true, getSpecificPlayer(playerNum), PRVIR.dialogueConfirm_onButton, playerNum, option, object )
    PRVIR.dialogueConfirm_instance:initialise()
    PRVIR.dialogueConfirm_instance:addToUIManager()
end

function PRVIR.enterRV(playerObj, vehicle, seat, partID)
    ISTimedActionQueue.add(ISPRVIREnterRVAction:new(playerObj, vehicle, seat, partID))
end

function PRVIR.exitRV(playerObj)
    local lotID = PRVIR.getPlayerAtWhichLot(playerObj)
    if PRVIR.getPlayerAtWhichLot(playerObj) then
        ISTimedActionQueue.add(ISPRVIRExitRVAction:new(playerObj, lotID))
    else
        playerObj:setHaloNote(getText("IGUI_PRVIR_No_Lot_Found"), 250, 250, 250, 300)
    end
end

-- Add Radial Menu
if ISVehicleMenu and not PRVIR.oShowRadialMenu then
    PRVIR.oShowRadialMenu = ISVehicleMenu.showRadialMenu
    function ISVehicleMenu.showRadialMenu(playerObj)
        PRVIR.oShowRadialMenu(playerObj)

        local vehicle = ISVehicleMenu.getVehicleToInteractWith(playerObj)
        if not vehicle then return end

        local vehicleName = tostring(vehicle:getScript():getFullName())
        if not PRVIR.vehiclesData[vehicleName] then return end

        local hasLotID = false

        if PRVIR.getVehicleID(vehicle) then
            if PRVIR.dbByVehicleID[PRVIR.getVehicleID(vehicle)] then
                -- Has assigned room
                hasLotID = true
            end
        end

        -- If there is no free room nor assigned room
        if PRVIR.freeRoomCounts[PRVIR.vehiclesData[vehicleName]] <= 0 and not hasLotID then return end

        local addRadial = false
        local tempArr = {}

        if not addRadial and PRVIR.lots[PRVIR.vehiclesData[vehicleName]].requiresSeat then
            if playerObj:isSeatedInVehicle() then
                addRadial = true
                tempArr.seat = vehicle:getSeat(playerObj)
            end
        end

        if not addRadial and PRVIR.lots[PRVIR.vehiclesData[vehicleName]].requiresTrunk and not playerObj:isSeatedInVehicle() then
            local interactablePart = vehicle:getUseablePart(playerObj)
            if interactablePart then
                if PRVIR.lots[PRVIR.vehiclesData[vehicleName]].trunkParts[interactablePart:getId()] then
                    if not interactablePart:getDoor():isLocked() then
                        addRadial = true
                        tempArr.partID = interactablePart:getId()
                    elseif interactablePart:getDoor():isLocked() and vehicle:canUnlockDoor(interactablePart, playerObj) then
                        addRadial = true
                        tempArr.partID = interactablePart:getId()
                    end
                end
            end
        end

        if AVCS and AVCS.checkPermission then
            local checkResult = AVCS.checkPermission(playerObj, vehicle)
            checkResult = AVCS.getSimpleBooleanPermission(checkResult)
            if not checkResult then
                addRadial = false
            end
        end

        if addRadial then
            local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
            menu:addSlice(getText("IGUI_PRVIR_RV_Slice"), getTexture("media/textures/rvInteriorEnter.png"), PRVIR.enterRV, playerObj, vehicle, tempArr.seat, tempArr.partID)
        end
    end
end

function PRVIR.openRvDashboard(playerObj, faceObject)
	local props = faceObject:getSprite() and faceObject:getSprite():getProperties()
    local dir = nil
	if props and props:has(IsoFlagType.attachedN) then dir = IsoDirections.N
	elseif props and props:has(IsoFlagType.attachedS) then dir = IsoDirections.S
	elseif props and props:has(IsoFlagType.attachedW) then dir = IsoDirections.W
	elseif props and props:has(IsoFlagType.attachedE) then dir = IsoDirections.E
	end
    local adjacent = AdjacentFreeTileFinder.FindEdge(faceObject:getSquare(), dir, playerObj, true)
    if adjacent then
        if adjacent ~= playerObj:getCurrentSquare() then
            ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, adjacent))
        end
    end

    ISTimedActionQueue.add(ISPRVIRDashboardInfoAction:new(playerObj, faceObject))
end

function PRVIR.getAdminContextMenu(context, playerNum)
    if not context then return false end
    local contextMenu = nil
    local subMenu = nil

    if #context.options > 0 then
        for i = 1, #context.options, 1 do
            local option = context.options[i];
            if option.name == "Admin [Mods]" then
                contextMenu = option
                subMenu = context:getSubMenu(contextMenu.subOption)
                break
            end
        end
    end

    if not contextMenu then
        contextMenu = context:addOption("Admin [Mods]", playerNum, nil, nil)
        subMenu = ISContextMenu:getNew(context)
        context:addSubMenu(contextMenu, subMenu)
    end

    local rvMenu
    local rvSubMenu
    if #subMenu.options > 0 then
        for i = 1, #subMenu.options, 1 do
            local option = subMenu.options[i];
            if option.name == getText("ContextMenu_PRVIR_AdminSubMenu") then
                rvMenu = option
                rvSubMenu = subMenu:getSubMenu(rvMenu.subOption)
                break
            end
        end
    end

    if not rvSubMenu then
        rvMenu = subMenu:addOption(getText("ContextMenu_PRVIR_AdminSubMenu"), playerNum, nil, nil)
        rvSubMenu = ISContextMenu:getNew(subMenu)
        subMenu:addSubMenu(rvMenu, rvSubMenu)
    end

    return rvSubMenu
end

function PRVIR.doAdminInfoTooltip(context, vehicleID, lotID)
    local lot
    local vehicle

    if vehicleID or lotID then
        if vehicleID then
            if PRVIR.dbByVehicleID[vehicleID] then
                lotID = PRVIR.dbByVehicleID[vehicleID].LotID
            end
        end

        if lotID then
            if PRVIR.dbByLotID[lotID] then
                vehicleID = PRVIR.dbByLotID[lotID].VehicleID
                lot = PRVIR.dbByLotID[lotID]
            end
        end

        if vehicleID then
            if PRVIR.dbByVehicleID[vehicleID] then
                vehicle = PRVIR.dbByVehicleID[vehicleID]
            end
        end
    end

    local option = context:addOption(getText("ContextMenu_PRVIR_RvInfo"))
    option.iconTexture = getTexture("media/textures/Item_Plumpabug_Left.png")
    option.toolTip = ISToolTip:new()
    option.toolTip:initialise()
    option.toolTip:setVisible(false)

    local lotClass, lotIndex = PRVIR.getLotClassID(lotID)
    local infoText = "Lot Info\n"
    infoText = infoText .. "Class = " .. (lotClass or "") .. "\n"
    infoText = infoText .. "Index = " .. (lotIndex or "") .. "\n"
    infoText = infoText .. "Assigned = " .. (lot and lot.AssignedDateTime and os.date("%d-%b-%y, %H:%M:%S", lot.AssignedDateTime) or "") .. "\n"
    infoText = infoText .. "Last Visited = " .. (lot and lot.LastVisitedDateTime and os.date("%d-%b-%y, %H:%M:%S", lot.LastVisitedDateTime) or "") .. "\n"
    infoText = infoText .. "\nVehicle info\n"
    infoText = infoText .. "ID = " .. (vehicleID or "") .. "\n"
    local vehicleLocation
    if vehicle then
        vehicleLocation = vehicle.LastLocationX .. "," .. vehicle.LastLocationY .. "," .. vehicle.LastLocationZ
    end
    infoText = infoText .. "Location = " .. (vehicleLocation or "") .. "\n"
    infoText = infoText .. "Last Updated = " .. (vehicle and vehicle.LastLocationUpdateDateTime and os.date("%d-%b-%y, %H:%M:%S", vehicle.LastLocationUpdateDateTime) or "")
    option.toolTip.description = infoText
end

function PRVIR.openISRVInteriorCustomLink(playerNum, vehicle)
    if PRVIR.customLink_instance ~= nil then
        PRVIR.customLink_instance:close()
        PRVIR.customLink_instance:removeFromUIManager()
        PRVIR.customLink_instance = nil
    end
    local width = 350 * PRVIR.getUIFontScale()
    local height = 200 * PRVIR.getUIFontScale()
    PRVIR.customLink_instance = PRVIR.ISRVInteriorCustomLink:new((getCore():getScreenWidth() / 2) - (width / 2), (getCore():getScreenHeight() / 2) - (height / 2), width, height, vehicle)
    PRVIR.customLink_instance:initialise()
    PRVIR.customLink_instance:addToUIManager()
end

if ISVehicleMenu and not PRVIR.oMenuOutsideVehicle then
    PRVIR.oMenuOutsideVehicle = ISVehicleMenu.FillMenuOutsideVehicle

    function ISVehicleMenu.FillMenuOutsideVehicle(playerNum, context, vehicle, test)
        PRVIR.oMenuOutsideVehicle(playerNum, context, vehicle, test)
        local vehicleName = tostring(vehicle:getScript():getFullName())
        if not PRVIR.vehiclesData[vehicleName] then return end
        local playerObj = getSpecificPlayer(playerNum)

        if (not isClient() and not isServer()) or playerObj:getRole():hasCapability(Capability.ManipulateVehicle) then
            local vehicleID = PRVIR.getVehicleID(vehicle)
            local rvMenu = PRVIR.getAdminContextMenu(context, playerNum)
            PRVIR.doAdminInfoTooltip(rvMenu, vehicleID, nil)
            rvMenu:addOption(getText("ContextMenu_PRVIR_CustomLink"), playerNum, PRVIR.openISRVInteriorCustomLink, vehicle)
            if vehicleID and PRVIR.dbByVehicleID[vehicleID] then
                rvMenu:addOption(getText("ContextMenu_PRVIR_UnlinkVehicle"), playerNum, PRVIR.dialogueConfirm, getText("ContextMenu_PRVIR_ConfirmUnlinkVehicleMessage"), "unlinkVehicle", vehicle)
            end
        end
    end
end

function PRVIR.OnFillWorldObjectContextMenu(playerNum, context, worldObjects)
    local playerObj = getSpecificPlayer(playerNum)
    if PRVIR.isPlayerInRvRegion(playerObj) then
        local option = context:addOption(getText("ContextMenu_PRVIR_Exit_RV"), playerObj, PRVIR.exitRV)
        if option then
			option.iconTexture = getTexture("media/textures/rvInteriorEnter.png")
		end

        if ISWorldObjectContextMenu.fetchVars.lightSwitch then
            context:addOption(getText("ContextMenu_PRVIR_Dashboard"), playerObj, PRVIR.openRvDashboard, ISWorldObjectContextMenu.fetchVars.lightSwitch)
        end

        if (not isClient() and not isServer()) or playerObj:getRole():hasCapability(Capability.ManipulateVehicle) then
            local lotID = PRVIR.getPlayerAtWhichLot(playerObj)
            if lotID then
                local rvMenu = PRVIR.getAdminContextMenu(context, playerNum)
                PRVIR.doAdminInfoTooltip(rvMenu, nil, lotID)

                if PRVIR.dbByLotID[lotID] then
                    rvMenu:addOption(getText("ContextMenu_PRVIR_UnlinkLot"), playerNum, PRVIR.dialogueConfirm, getText("ContextMenu_PRVIR_ConfirmUnlinkLotMessage"), "unlinkLot", lotID)
                end
            end
        end
    end
end

Events.OnFillWorldObjectContextMenu.Add(PRVIR.OnFillWorldObjectContextMenu)

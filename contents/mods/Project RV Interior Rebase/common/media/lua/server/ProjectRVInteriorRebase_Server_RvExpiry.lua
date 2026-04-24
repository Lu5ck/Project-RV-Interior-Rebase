if isClient() and not isServer() then
	return
end

require "ProjectRVInteriorRebase_Server"

PRVIR.rvTimeoutCache = PRVIR.rvTimeoutCache or nil

function PRVIR.sortRvTimeoutCache()
	table.sort(PRVIR.rvTimeoutCache, function(a, b) return a.expiryDateTime < b.expiryDateTime end)
end

function PRVIR.getAVCSExpiryDateTime(vehicleID)
	if AVCS and AVCS.dbByVehicleSQLID then
		if AVCS.dbByVehicleSQLID[vehicleID] then
			local ownerPlayerID = AVCS.dbByVehicleSQLID[vehicleID].OwnerPlayerID
			if ownerPlayerID and AVCS.dbByPlayerID[ownerPlayerID] then
				local logonTime = AVCS.dbByPlayerID[ownerPlayerID].LastKnownLogonTime
				if logonTime then
					return logonTime + (SandboxVars.AVCS.ClaimTimeout * 60 * 60)
				end
			end
		end
	end
	return false
end

function PRVIR.getExpiryDateTime(lotID)
	if lotID and PRVIR.dbByLotID[lotID] then
		local baseDateTime = PRVIR.dbByLotID[lotID].LastVisitedDateTime or PRVIR.dbByLotID[lotID].AssignedDateTime
		local expiryDateTime = baseDateTime + (SandboxVars.PRVIR.RvExpiry * 60 * 60)
		local vehicleID = PRVIR.dbByLotID[lotID].VehicleID
		if vehicleID then
			local avcsExpiryDateTime = PRVIR.getAVCSExpiryDateTime(vehicleID)
			if avcsExpiryDateTime then
				if avcsExpiryDateTime > expiryDateTime then
					expiryDateTime = avcsExpiryDateTime
				end
			end
		end
		return expiryDateTime
	end
	return false
end

function PRVIR.buildRvTimeoutCache()
	local temp = {}
	for k, v in pairs(PRVIR.dbByLotID) do
		local expiryDateTime = PRVIR.getExpiryDateTime(k)
		table.insert(temp, {expiryDateTime = expiryDateTime, LotID = k})
	end

	PRVIR.rvTimeoutCache = temp
	PRVIR.sortRvTimeoutCache()
end

-- Typically for new links
function PRVIR.addIntoTimeoutCache(lotID)
	if lotID and PRVIR.dbByLotID[lotID] then
		local expiryDateTime = PRVIR.getExpiryDateTime(lotID)
		table.insert(PRVIR.rvTimeoutCache, {expiryDateTime = expiryDateTime, LotID = lotID})
	end
end

function PRVIR.doExpiryTimeout()
	local varIndex = 1
	local needSort = false
	-- As we dealing with indexes, we want to control the index value as we increment to avoid removing wrong index
	while varIndex <= #PRVIR.rvTimeoutCache do
		if getTimestamp() > PRVIR.rvTimeoutCache[varIndex].expiryDateTime then
			local lotID = PRVIR.rvTimeoutCache[varIndex].LotID
			if PRVIR.dbByLotID[lotID] then
				-- Cache is not always up-to-date, validate the actual
				local expiryDateTime = PRVIR.getExpiryDateTime(lotID)
				if getTimestamp() > expiryDateTime then
					PRVIR.serverWriteLog("[" .. lotID .. "] has expired and released from vehicleid [" .. PRVIR.dbByLotID[lotID].VehicleID .. "]")
					PRVIR.unlinkLot(nil, { lotID = lotID })
					table.remove(PRVIR.rvTimeoutCache, varIndex)
				else
					-- Update the expiry time
					PRVIR.rvTimeoutCache[varIndex].expiryDateTime = expiryDateTime
					needSort = true
					varIndex = varIndex + 1
				end
			else
				-- Doesn't exist
				table.remove(PRVIR.rvTimeoutCache, varIndex)
			end
		else
			-- Since sorted, assume everybody else has not expired
			break
		end
	end

	if needSort then
		PRVIR.sortRvTimeoutCache()
	end
end

if isServer() then
	Events.EveryTenMinutes.Add(PRVIR.doExpiryTimeout)
end
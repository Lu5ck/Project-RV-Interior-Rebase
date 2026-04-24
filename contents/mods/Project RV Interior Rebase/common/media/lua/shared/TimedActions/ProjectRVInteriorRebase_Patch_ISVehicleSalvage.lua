require "TimedActions/ISVehicleSalvage"
require "ProjectRVInteriorRebase_Shared"

if ISVehicleSalvage and not PRVIR.oISVehicleSalvage then
    PRVIR.oISVehicleSalvage = ISVehicleSalvage.perform

    function ISVehicleSalvage:perform()
        local vehicleID = PRVIR.getVehicleID(self.vehicle)
        if vehicleID and PRVIR.dbByVehicleID[vehicleID] then
            if isClient() then
                sendClientCommand(self.character, "PRVIR", "unlinkVehicle", { pzVehicleID = self.vehicle:getId() })
            else
                PRVIR.unlinkVehicle(self.vehicle)
            end
        end
        
        PRVIR.oISVehicleSalvage(self)
    end
end
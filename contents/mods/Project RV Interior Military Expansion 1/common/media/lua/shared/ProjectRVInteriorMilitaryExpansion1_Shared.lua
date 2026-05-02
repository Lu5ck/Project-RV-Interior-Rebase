require "ProjectRVInteriorRebase_Shared"

ProjectRVInteriorMilitaryExpansion1 = ProjectRVInteriorMilitaryExpansion1 or {}

if PRVIR and PRVIR.isCoordinateInRvRegion then
    if not ProjectRVInteriorMilitaryExpansion1.oIsCoordinateInRvRegion then
        ProjectRVInteriorMilitaryExpansion1.oIsCoordinateInRvRegion = PRVIR.isCoordinateInRvRegion
    end
    function PRVIR.isCoordinateInRvRegion(vX, vY, vZ)
        if vX >= 24832 and vX <= 26111 and vY >= 12800 and vY <= 14335 then
            return true
        end
        return ProjectRVInteriorMilitaryExpansion1.oIsCoordinateInRvRegion(vX, vY, vZ)
    end
end
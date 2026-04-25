require "ProjectRVInteriorRebase_Shared"

ProjectRVInteriorMilitaryExpansion1 = ProjectRVInteriorMilitaryExpansion1 or {}

if PRVIR and PRVIR.isCoordinateInRvRegion then
    if not ProjectRVInteriorMilitaryExpansion1.oIsCoordinateInRvRegion then
        ProjectRVInteriorMilitaryExpansion1.oIsCoordinateInRvRegion = PRVIR.isCoordinateInRvRegion
    end
    function PRVIR.isCoordinateInRvRegion(vX, vY, vZ)
            if vX >= 24900 and vX <= 25600 and vY >= 12900 and vY <= 13500 then
                return true
            end
        return ProjectRVInteriorMilitaryExpansion1.oIsCoordinateInRvRegion(vX, vY, vZ)
    end
end
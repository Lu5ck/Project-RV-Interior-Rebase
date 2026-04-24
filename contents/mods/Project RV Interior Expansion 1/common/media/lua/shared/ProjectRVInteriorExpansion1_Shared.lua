require "ProjectRVInteriorRebase_Shared"

ProjectRVInteriorExpansion1 = ProjectRVInteriorExpansion1 or {}

if PRVIR and PRVIR.isCoordinateInRvRegion then
    if not ProjectRVInteriorExpansion1.oIsCoordinateInRvRegion then
        ProjectRVInteriorExpansion1.oIsCoordinateInRvRegion = PRVIR.isCoordinateInRvRegion
    end
    function PRVIR.isCoordinateInRvRegion(vX, vY, vZ)
        if vX >= 26100 and vX <= 28500 and vY >= 25800 and vY <= 28000 then
            return true
        end
        return ProjectRVInteriorExpansion1.oIsCoordinateInRvRegion(vX, vY, vZ)
    end
end
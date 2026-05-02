require "ProjectRVInteriorRebase_Shared"

ProjectRVInteriorExpansion2 = ProjectRVInteriorExpansion2 or {}

if PRVIR and PRVIR.isCoordinateInRvRegion then
    if not ProjectRVInteriorExpansion2.oIsCoordinateInRvRegion then
        ProjectRVInteriorExpansion2.oIsCoordinateInRvRegion = PRVIR.isCoordinateInRvRegion
    end
    function PRVIR.isCoordinateInRvRegion(vX, vY, vZ)
        if vX >= 29952 and vX <= 31231 and vY >= 28928 and vY <= 30463 then
            return true
        end
        return ProjectRVInteriorExpansion2.oIsCoordinateInRvRegion(vX, vY, vZ)
    end
end
-- We populate table with the rooms coordinates
-- Each room is created on the map at specific coordinate, spaced out from each other with specific number of tiles
-- These rooms are identitical in size, as classified by its lot class
-- Therefore we can use a function to fill up the rooms coordinates table
-- sx,sy and ex,ey aka start x/y and end x/y
-- These rooms index will be used for teleport coordinates, the location of the power generator, basis of room assignment
-- If you want to expand number of rooms by adding more maps, you have to add to the index of the room in same order
-- Or you will ruin the data integrity
-- I would recommend you to use loadModAfter and loadModBefore to control your mod addon load order

require "ProjectRVInteriorRebase_Shared_Lots"

PRVIR.lots["Trailer"] = PRVIR.lots["Trailer"] or {}
PRVIR.lots["Trailer2"] = PRVIR.lots["Trailer2"] or {}
PRVIR.lots["Trailer3"] = PRVIR.lots["Trailer3"] or {}
PRVIR.lots["Trailer4"] = PRVIR.lots["Trailer4"] or {}
PRVIR.lots["Trailer5"] = PRVIR.lots["Trailer5"] or {}
PRVIR.lots["Trailer6"] = PRVIR.lots["Trailer6"] or {}
PRVIR.lots["semitrailer"] = PRVIR.lots["semitrailer"] or {}
PRVIR.lots["semitrailer2"] = PRVIR.lots["semitrailer2"] or {}
PRVIR.lots["van1"] = PRVIR.lots["van1"] or {}
PRVIR.lots["van2"] = PRVIR.lots["van2"] or {}
PRVIR.lots["van3"] = PRVIR.lots["van3"] or {}
PRVIR.lots["van4"] = PRVIR.lots["van4"] or {}
PRVIR.lots["van5"] = PRVIR.lots["van5"] or {}
PRVIR.lots["van6"] = PRVIR.lots["van6"] or {}
PRVIR.lots["van7"] = PRVIR.lots["van7"] or {}
PRVIR.lots["van8"] = PRVIR.lots["van8"] or {}
PRVIR.lots["van9"] = PRVIR.lots["van9"] or {}
PRVIR.lots["van10"] = PRVIR.lots["van10"] or {}
PRVIR.lots["semibox"] = PRVIR.lots["semibox"] or {}
PRVIR.lots["USPS"] = PRVIR.lots["USPS"] or {}
PRVIR.lots["FBI"] = PRVIR.lots["FBI"] or {}
PRVIR.lots["FBIbomb"] = PRVIR.lots["FBIbomb"] or {}
PRVIR.lots["FBIf700bomb"] = PRVIR.lots["FBIf700bomb"] or {}
PRVIR.lots["FBIhq2"] = PRVIR.lots["FBIhq2"] or {}
PRVIR.lots["FBIhazard2"] = PRVIR.lots["FBIhazard2"] or {}
PRVIR.lots["tstrailer"] = PRVIR.lots["tstrailer"] or {}
PRVIR.lots["tstraileranimal"] = PRVIR.lots["tstraileranimal"] or {}
PRVIR.lots["unimogtrailerr"] = PRVIR.lots["unimogtrailerr"] or {}
PRVIR.lots["atavanderumba"] = PRVIR.lots["atavanderumba"] or {}
PRVIR.lots["van"] = PRVIR.lots["van"] or {}
PRVIR.lots["ki5van"] = PRVIR.lots["ki5van"] or {}
PRVIR.lots["ki5bus"] = PRVIR.lots["ki5bus"] or {}
PRVIR.lots["ki5truck"] = PRVIR.lots["ki5truck"] or {}
PRVIR.lots["ki5swat"] = PRVIR.lots["ki5swat"] or {}
PRVIR.lots["ki5stepvan"] = PRVIR.lots["ki5stepvan"] or {}
PRVIR.lots["ki590fordambu"] = PRVIR.lots["ki590fordambu"] or {}
PRVIR.lots["ki586ford"] = PRVIR.lots["ki586ford"] or {}
PRVIR.lots["ki5cf800"] = PRVIR.lots["ki5cf800"] or {}
PRVIR.lots["ki5container"] = PRVIR.lots["ki5container"] or {}
PRVIR.lots["scooby"] = PRVIR.lots["scooby"] or {}
PRVIR.lots["tsarbus"] = PRVIR.lots["tsarbus"] or {}
PRVIR.lots["tsarbus2"] = PRVIR.lots["tsarbus2"] or {}
PRVIR.lots["amazomvan"] = PRVIR.lots["amazomvan"] or {}
PRVIR.lots["Vanillastepvan"] = PRVIR.lots["Vanillastepvan"] or {}
PRVIR.lots["Vanillastepvanmail"] = PRVIR.lots["Vanillastepvanmail"] or {}
PRVIR.lots["Vanillastepswat"] = PRVIR.lots["Vanillastepswat"] or {}
PRVIR.lots["Vanillastepplonkies"] = PRVIR.lots["Vanillastepplonkies"] or {}
PRVIR.lots["Vanillastepscarlet"] = PRVIR.lots["Vanillastepscarlet"] or {}
PRVIR.lots["Vanillastepvansmartkut"] = PRVIR.lots["Vanillastepvansmartkut"] or {}
PRVIR.lots["Vanillamobilelibrasry"] = PRVIR.lots["Vanillamobilelibrasry"] or {}
PRVIR.lots["vanillavan"] = PRVIR.lots["vanillavan"] or {}
PRVIR.lots["Vanambulance"] = PRVIR.lots["Vanambulance"] or {}
PRVIR.lots["VanMAIL3"] = PRVIR.lots["VanMAIL3"] or {}
PRVIR.lots["VanRADIO"] = PRVIR.lots["VanRADIO"] or {}
PRVIR.lots["VanaSPIFFO2"] = PRVIR.lots["VanaSPIFFO2"] or {}
PRVIR.lots["Vanbeerrr"] = PRVIR.lots["Vanbeerrr"] or {}
PRVIR.lots["Vanampotato"] = PRVIR.lots["Vanampotato"] or {}
PRVIR.lots["73winne"] = PRVIR.lots["73winne"] or {}
PRVIR.lots["89defender"] = PRVIR.lots["89defender"] or {}
PRVIR.lots["motoriusambulance"] = PRVIR.lots["motoriusambulance"] or {}
PRVIR.lots["motoriusambulance2"] = PRVIR.lots["motoriusambulance2"] or {}
PRVIR.lots["VWT2T1"] = PRVIR.lots["VWT2T1"] or {}
PRVIR.lots["mvan92econolinenormalvans"] = PRVIR.lots["mvan92econolinenormalvans"] or {}
PRVIR.lots["mvan92econoline"] = PRVIR.lots["mvan92econoline"] or {}
PRVIR.lots["motoriusbus2"] = PRVIR.lots["motoriusbus2"] or {}
PRVIR.lots["fhq90SuzEvery"] = PRVIR.lots["fhq90SuzEvery"] or {}
PRVIR.lots["ki5ambulancemed"] = PRVIR.lots["ki5ambulancemed"] or {}
PRVIR.lots["traileranimalhorsebox"] = PRVIR.lots["traileranimalhorsebox"] or {}
PRVIR.lots["traileranimallivestock"] = PRVIR.lots["traileranimallivestock"] or {}
PRVIR.lots["CDClabor"] = PRVIR.lots["CDClabor"] or {}
PRVIR.lots["camptrailer2"] = PRVIR.lots["camptrailer2"] or {}
PRVIR.lots["camptrailer"] = PRVIR.lots["camptrailer"] or {}

-- Trailer (Base.TrailerKI5cargoLarge)
PRVIR.lots["Trailer"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26160, sy = 25860, sz = 0, ex = 26162, ey = 25864, ez = 0 },
        { sx = 26160, sy = 25920, sz = 0, ex = 26162, ey = 25924, ez = 0 },
        { sx = 26160, sy = 25980, sz = 0, ex = 26162, ey = 25984, ez = 0 },
        { sx = 26160, sy = 26040, sz = 0, ex = 26162, ey = 26044, ez = 0 },
        { sx = 27060, sy = 26760, sz = 0, ex = 27062, ey = 26764, ez = 0 },
        { sx = 27060, sy = 26820, sz = 0, ex = 27062, ey = 26824, ez = 0 },
        { sx = 27060, sy = 26880, sz = 0, ex = 27062, ey = 26884, ez = 0 },
        { sx = 27060, sy = 26940, sz = 0, ex = 27062, ey = 26944, ez = 0 },
        { sx = 26760, sy = 27060, sz = 0, ex = 26762, ey = 27064, ez = 0 },
        { sx = 26760, sy = 27120, sz = 0, ex = 26762, ey = 27124, ez = 0 },
        { sx = 26760, sy = 27180, sz = 0, ex = 26762, ey = 27184, ez = 0 },
        { sx = 26760, sy = 27240, sz = 0, ex = 26762, ey = 27244, ez = 0 },
        { sx = 26820, sy = 27060, sz = 0, ex = 26822, ey = 27064, ez = 0 },
        { sx = 26820, sy = 27120, sz = 0, ex = 26822, ey = 27124, ez = 0 },
        { sx = 26820, sy = 27180, sz = 0, ex = 26822, ey = 27184, ez = 0 },
        { sx = 26820, sy = 27240, sz = 0, ex = 26822, ey = 27244, ez = 0 },
    }
}

-- Trailer2 (Base.TrailerKI5cargoMedium)
PRVIR.lots["Trailer2"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26220, sy = 25860, sz = 0, ex = 26222, ey = 25863, ez = 0 },
        { sx = 26220, sy = 25920, sz = 0, ex = 26222, ey = 25923, ez = 0 },
        { sx = 26220, sy = 25980, sz = 0, ex = 26222, ey = 25983, ez = 0 },
        { sx = 26220, sy = 26040, sz = 0, ex = 26222, ey = 26043, ez = 0 },
        { sx = 27120, sy = 26760, sz = 0, ex = 27122, ey = 26763, ez = 0 },
        { sx = 27120, sy = 26820, sz = 0, ex = 27122, ey = 26823, ez = 0 },
        { sx = 27120, sy = 26880, sz = 0, ex = 27122, ey = 26883, ez = 0 },
        { sx = 27120, sy = 26940, sz = 0, ex = 27122, ey = 26943, ez = 0 },
        { sx = 26880, sy = 27060, sz = 0, ex = 26882, ey = 27063, ez = 0 },
        { sx = 26880, sy = 27120, sz = 0, ex = 26882, ey = 27123, ez = 0 },
        { sx = 26880, sy = 27180, sz = 0, ex = 26882, ey = 27183, ez = 0 },
        { sx = 26880, sy = 27240, sz = 0, ex = 26882, ey = 27243, ez = 0 },
        { sx = 26940, sy = 27060, sz = 0, ex = 26942, ey = 27063, ez = 0 },
        { sx = 26940, sy = 27120, sz = 0, ex = 26942, ey = 27123, ez = 0 },
        { sx = 26940, sy = 27180, sz = 0, ex = 26942, ey = 27183, ez = 0 },
        { sx = 26940, sy = 27240, sz = 0, ex = 26942, ey = 27243, ez = 0 },
    }
}

-- Trailer3 (Base.TrailerKI5cargoSmall)
PRVIR.lots["Trailer3"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 26280, sy = 25860, sz = 0, ex = 26281, ey = 25861, ez = 0 },
        { sx = 26280, sy = 25920, sz = 0, ex = 26281, ey = 25921, ez = 0 },
        { sx = 26280, sy = 25980, sz = 0, ex = 26281, ey = 25981, ez = 0 },
        { sx = 26280, sy = 26040, sz = 0, ex = 26281, ey = 26041, ez = 0 },
        { sx = 27180, sy = 26760, sz = 0, ex = 27181, ey = 26761, ez = 0 },
        { sx = 27180, sy = 26820, sz = 0, ex = 27181, ey = 26821, ez = 0 },
        { sx = 27180, sy = 26880, sz = 0, ex = 27181, ey = 26881, ez = 0 },
        { sx = 27180, sy = 26940, sz = 0, ex = 27181, ey = 26941, ez = 0 },
        { sx = 27060, sy = 27060, sz = 0, ex = 27061, ey = 27061, ez = 0 },
        { sx = 27060, sy = 27120, sz = 0, ex = 27061, ey = 27121, ez = 0 },
        { sx = 27060, sy = 27180, sz = 0, ex = 27061, ey = 27181, ez = 0 },
        { sx = 27060, sy = 27240, sz = 0, ex = 27061, ey = 27241, ez = 0 },
        { sx = 27120, sy = 27060, sz = 0, ex = 27121, ey = 27061, ez = 0 },
        { sx = 27120, sy = 27120, sz = 0, ex = 27121, ey = 27121, ez = 0 },
        { sx = 27120, sy = 27180, sz = 0, ex = 27121, ey = 27181, ez = 0 },
        { sx = 27120, sy = 27240, sz = 0, ex = 27121, ey = 27241, ez = 0 },
    }
}

-- Trailer4 (Base.TrailerKI5livestock)
PRVIR.lots["Trailer4"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26340, sy = 25860, sz = 0, ex = 26342, ey = 25864, ez = 0 },
        { sx = 26340, sy = 25920, sz = 0, ex = 26342, ey = 25924, ez = 0 },
        { sx = 26340, sy = 25980, sz = 0, ex = 26342, ey = 25984, ez = 0 },
        { sx = 26340, sy = 26040, sz = 0, ex = 26342, ey = 26044, ez = 0 },
        { sx = 27240, sy = 26760, sz = 0, ex = 27242, ey = 26764, ez = 0 },
        { sx = 27240, sy = 26820, sz = 0, ex = 27242, ey = 26824, ez = 0 },
        { sx = 27240, sy = 26880, sz = 0, ex = 27242, ey = 26884, ez = 0 },
        { sx = 27240, sy = 26940, sz = 0, ex = 27242, ey = 26944, ez = 0 },
        { sx = 27180, sy = 27060, sz = 0, ex = 27182, ey = 27064, ez = 0 },
        { sx = 27180, sy = 27120, sz = 0, ex = 27182, ey = 27124, ez = 0 },
        { sx = 27180, sy = 27180, sz = 0, ex = 27182, ey = 27184, ez = 0 },
        { sx = 27180, sy = 27240, sz = 0, ex = 27182, ey = 27244, ez = 0 },
    }
}

-- Trailer5 (Base.TrailerHome, Base.TrailerHomeExplorer)
PRVIR.lots["Trailer5"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 26160, sy = 25860, sz = 30, ex = 26163, ey = 25864, ez = 30 },
        { sx = 26160, sy = 25920, sz = 30, ex = 26163, ey = 25924, ez = 30 },
        { sx = 26160, sy = 25980, sz = 30, ex = 26163, ey = 25984, ez = 30 },
        { sx = 26160, sy = 26040, sz = 30, ex = 26163, ey = 26044, ez = 30 },
        { sx = 26160, sy = 27360, sz = 0,  ex = 26163, ey = 27364, ez = 0  },
        { sx = 26160, sy = 27420, sz = 0,  ex = 26163, ey = 27424, ez = 0  },
        { sx = 26160, sy = 27480, sz = 0,  ex = 26163, ey = 27484, ez = 0  },
        { sx = 26160, sy = 27540, sz = 0,  ex = 26163, ey = 27544, ez = 0  },
        { sx = 26220, sy = 27360, sz = 0,  ex = 26223, ey = 27364, ez = 0  },
        { sx = 26220, sy = 27420, sz = 0,  ex = 26223, ey = 27424, ez = 0  },
        { sx = 26220, sy = 27480, sz = 0,  ex = 26223, ey = 27484, ez = 0  },
        { sx = 26220, sy = 27540, sz = 0,  ex = 26223, ey = 27544, ez = 0  },
        { sx = 26280, sy = 27360, sz = 0,  ex = 26283, ey = 27364, ez = 0  },
        { sx = 26280, sy = 27420, sz = 0,  ex = 26283, ey = 27424, ez = 0  },
        { sx = 26280, sy = 27480, sz = 0,  ex = 26283, ey = 27484, ez = 0  },
        { sx = 26280, sy = 27540, sz = 0,  ex = 26283, ey = 27544, ez = 0  },
        { sx = 26340, sy = 27360, sz = 0,  ex = 26343, ey = 27364, ez = 0  },
        { sx = 26340, sy = 27420, sz = 0,  ex = 26343, ey = 27424, ez = 0  },
        { sx = 26340, sy = 27480, sz = 0,  ex = 26343, ey = 27484, ez = 0  },
        { sx = 26340, sy = 27540, sz = 0,  ex = 26343, ey = 27544, ez = 0  },
    }
}

-- Trailer6 (Base.TrailerHomeHartman)
PRVIR.lots["Trailer6"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 26220, sy = 25860, sz = 30, ex = 26223, ey = 25864, ez = 30 },
        { sx = 26220, sy = 25920, sz = 30, ex = 26223, ey = 25924, ez = 30 },
        { sx = 26220, sy = 25980, sz = 30, ex = 26223, ey = 25984, ez = 30 },
        { sx = 26220, sy = 26040, sz = 30, ex = 26223, ey = 26044, ez = 30 },
    }
}

-- semitrailer (Base.SemiTrailerVan)
PRVIR.lots["semitrailer"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 12,
    rooms = {
        { sx = 26280, sy = 25860, sz = 30, ex = 26283, ey = 25871, ez = 30 },
        { sx = 26280, sy = 25920, sz = 30, ex = 26283, ey = 25931, ez = 30 },
        { sx = 26280, sy = 25980, sz = 30, ex = 26283, ey = 25991, ez = 30 },
        { sx = 26280, sy = 26040, sz = 30, ex = 26283, ey = 26051, ez = 30 },
        { sx = 27060, sy = 26460, sz = 0,  ex = 27063, ey = 26471, ez = 0  },
        { sx = 27060, sy = 26520, sz = 0,  ex = 27063, ey = 26531, ez = 0  },
        { sx = 27060, sy = 26580, sz = 0,  ex = 27063, ey = 26591, ez = 0  },
        { sx = 27060, sy = 26640, sz = 0,  ex = 27063, ey = 26651, ez = 0  },
        { sx = 26460, sy = 27360, sz = 0,  ex = 26463, ey = 27371, ez = 0  },
        { sx = 26460, sy = 27420, sz = 0,  ex = 26463, ey = 27431, ez = 0  },
        { sx = 26460, sy = 27480, sz = 0,  ex = 26463, ey = 27491, ez = 0  },
        { sx = 26460, sy = 27540, sz = 0,  ex = 26463, ey = 27551, ez = 0  },
        { sx = 26520, sy = 27360, sz = 0,  ex = 26523, ey = 27371, ez = 0  },
        { sx = 26520, sy = 27420, sz = 0,  ex = 26523, ey = 27431, ez = 0  },
        { sx = 26520, sy = 27480, sz = 0,  ex = 26523, ey = 27491, ez = 0  },
        { sx = 26520, sy = 27540, sz = 0,  ex = 26523, ey = 27551, ez = 0  },
    }
}

-- semitrailer2 (Base.SemiTrailerVanCattle)
PRVIR.lots["semitrailer2"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 12,
    rooms = {
        { sx = 26340, sy = 25860, sz = 30, ex = 26343, ey = 25871, ez = 30 },
        { sx = 26340, sy = 25920, sz = 30, ex = 26343, ey = 25931, ez = 30 },
        { sx = 26340, sy = 25980, sz = 30, ex = 26343, ey = 25991, ez = 30 },
        { sx = 26340, sy = 26040, sz = 30, ex = 26343, ey = 26051, ez = 30 },
        { sx = 27120, sy = 26460, sz = 0,  ex = 27123, ey = 26471, ez = 0  },
        { sx = 27120, sy = 26520, sz = 0,  ex = 27123, ey = 26531, ez = 0  },
        { sx = 27120, sy = 26580, sz = 0,  ex = 27123, ey = 26591, ez = 0  },
        { sx = 27120, sy = 26640, sz = 0,  ex = 27123, ey = 26651, ez = 0  },
        { sx = 26580, sy = 27360, sz = 0,  ex = 26583, ey = 27371, ez = 0  },
        { sx = 26580, sy = 27420, sz = 0,  ex = 26583, ey = 27431, ez = 0  },
        { sx = 26580, sy = 27480, sz = 0,  ex = 26583, ey = 27491, ez = 0  },
        { sx = 26580, sy = 27540, sz = 0,  ex = 26583, ey = 27551, ez = 0  },
    }
}

-- van1 (Base.1979rastrojeroFlete)
PRVIR.lots["van1"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26460, sy = 25860, sz = 0, ex = 26462, ey = 25863, ez = 0 },
        { sx = 26460, sy = 25920, sz = 0, ex = 26462, ey = 25923, ez = 0 },
        { sx = 26460, sy = 25980, sz = 0, ex = 26462, ey = 25983, ez = 0 },
        { sx = 26460, sy = 26040, sz = 0, ex = 26462, ey = 26043, ez = 0 },
    }
}

-- van2 (Base.1979rastrojeroCarni)
PRVIR.lots["van2"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26520, sy = 25860, sz = 0, ex = 26521, ey = 25862, ez = 0 },
        { sx = 26520, sy = 25920, sz = 0, ex = 26521, ey = 25922, ez = 0 },
        { sx = 26520, sy = 25980, sz = 0, ex = 26521, ey = 25982, ez = 0 },
        { sx = 26520, sy = 26040, sz = 0, ex = 26521, ey = 26042, ez = 0 },
    }
}

-- van3 (Base.VanATeam)
PRVIR.lots["van3"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26580, sy = 25860, sz = 0, ex = 26581, ey = 25862, ez = 0 },
        { sx = 26580, sy = 25920, sz = 0, ex = 26581, ey = 25922, ez = 0 },
        { sx = 26580, sy = 25980, sz = 0, ex = 26581, ey = 25982, ez = 0 },
        { sx = 26580, sy = 26040, sz = 0, ex = 26581, ey = 26042, ez = 0 },
    }
}

-- van4 (Base.Van_Azumanga)
PRVIR.lots["van4"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26640, sy = 25860, sz = 0, ex = 26641, ey = 25862, ez = 0 },
        { sx = 26640, sy = 25920, sz = 0, ex = 26641, ey = 25922, ez = 0 },
        { sx = 26640, sy = 25980, sz = 0, ex = 26641, ey = 25982, ez = 0 },
        { sx = 26640, sy = 26040, sz = 0, ex = 26641, ey = 26042, ez = 0 },
    }
}

-- van5 (Base.1992fiatFiorino, Base.1992fiatFiorinoArcor, Base.1992fiatFiorinoPan)
PRVIR.lots["van5"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26460, sy = 25860, sz = 30, ex = 26461, ey = 25862, ez = 30 },
        { sx = 26460, sy = 25920, sz = 30, ex = 26461, ey = 25922, ez = 30 },
        { sx = 26460, sy = 25980, sz = 30, ex = 26461, ey = 25982, ez = 30 },
        { sx = 26460, sy = 26040, sz = 30, ex = 26461, ey = 26042, ez = 30 },
        { sx = 26880, sy = 26760, sz = 0,  ex = 26881, ey = 26762, ez = 0  },
        { sx = 26880, sy = 26820, sz = 0,  ex = 26881, ey = 26822, ez = 0  },
        { sx = 26880, sy = 26880, sz = 0,  ex = 26881, ey = 26882, ez = 0  },
        { sx = 26880, sy = 26940, sz = 0,  ex = 26881, ey = 26942, ez = 0  },
    }
}

-- van6 (Base.StepVanIceCreamFreeze)
PRVIR.lots["van6"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26520, sy = 25860, sz = 30, ex = 26522, ey = 25863, ez = 30 },
        { sx = 26520, sy = 25920, sz = 30, ex = 26522, ey = 25923, ez = 30 },
        { sx = 26520, sy = 25980, sz = 30, ex = 26522, ey = 25983, ez = 30 },
        { sx = 26520, sy = 26040, sz = 30, ex = 26522, ey = 26043, ez = 30 },
    }
}

-- van7 (Base.VanJester)
PRVIR.lots["van7"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26580, sy = 25860, sz = 30, ex = 26582, ey = 25863, ez = 30 },
        { sx = 26580, sy = 25920, sz = 30, ex = 26582, ey = 25923, ez = 30 },
        { sx = 26580, sy = 25980, sz = 30, ex = 26582, ey = 25983, ez = 30 },
        { sx = 26580, sy = 26040, sz = 30, ex = 26582, ey = 26043, ez = 30 },
    }
}

-- van8 (Base.1990renaultTrafic variants)
PRVIR.lots["van8"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 26640, sy = 25860, sz = 30, ex = 26641, ey = 25863, ez = 30 },
        { sx = 26640, sy = 25920, sz = 30, ex = 26641, ey = 25923, ez = 30 },
        { sx = 26640, sy = 25980, sz = 30, ex = 26641, ey = 25983, ez = 30 },
        { sx = 26640, sy = 26040, sz = 30, ex = 26641, ey = 26043, ez = 30 },
        { sx = 26820, sy = 26760, sz = 0,  ex = 26821, ey = 26763, ez = 0  },
        { sx = 26820, sy = 26820, sz = 0,  ex = 26821, ey = 26823, ez = 0  },
        { sx = 26820, sy = 26880, sz = 0,  ex = 26821, ey = 26883, ez = 0  },
        { sx = 26820, sy = 26940, sz = 0,  ex = 26821, ey = 26943, ez = 0  },
    }
}

-- van9 (Base.uaz2206, Base.uaz2208)
PRVIR.lots["van9"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 26760, sy = 25860, sz = 0, ex = 26761, ey = 25863, ez = 0 },
        { sx = 26760, sy = 25920, sz = 0, ex = 26761, ey = 25923, ez = 0 },
        { sx = 26760, sy = 25980, sz = 0, ex = 26761, ey = 25983, ez = 0 },
        { sx = 26760, sy = 26040, sz = 0, ex = 26761, ey = 26043, ez = 0 },
    }
}

-- van10 (Base.VanLBK)
PRVIR.lots["van10"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26820, sy = 25860, sz = 0, ex = 26821, ey = 25862, ez = 0 },
        { sx = 26820, sy = 25920, sz = 0, ex = 26821, ey = 25922, ez = 0 },
        { sx = 26820, sy = 25980, sz = 0, ex = 26821, ey = 25982, ez = 0 },
        { sx = 26820, sy = 26040, sz = 0, ex = 26821, ey = 26042, ez = 0 },
    }
}

-- semibox (Base.SemiTruckBox)
PRVIR.lots["semibox"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8,
    rooms = {
        { sx = 26880, sy = 25860, sz = 0, ex = 26883, ey = 25867, ez = 0 },
        { sx = 26880, sy = 25920, sz = 0, ex = 26883, ey = 25927, ez = 0 },
        { sx = 26880, sy = 25980, sz = 0, ex = 26883, ey = 25987, ez = 0 },
        { sx = 26880, sy = 26040, sz = 0, ex = 26883, ey = 26047, ez = 0 },
        { sx = 26760, sy = 26160, sz = 0, ex = 26763, ey = 26167, ez = 0 },
        { sx = 26760, sy = 26220, sz = 0, ex = 26763, ey = 26227, ez = 0 },
        { sx = 26760, sy = 26280, sz = 0, ex = 26763, ey = 26287, ez = 0 },
        { sx = 26760, sy = 26340, sz = 0, ex = 26763, ey = 26347, ez = 0 },
        { sx = 27060, sy = 27360, sz = 0, ex = 27063, ey = 27367, ez = 0 },
        { sx = 27060, sy = 27420, sz = 0, ex = 27063, ey = 27427, ez = 0 },
        { sx = 27060, sy = 27480, sz = 0, ex = 27063, ey = 27487, ez = 0 },
        { sx = 27060, sy = 27540, sz = 0, ex = 27063, ey = 27547, ez = 0 },
        { sx = 27120, sy = 27360, sz = 0, ex = 27123, ey = 27367, ez = 0 },
        { sx = 27120, sy = 27420, sz = 0, ex = 27123, ey = 27427, ez = 0 },
        { sx = 27120, sy = 27480, sz = 0, ex = 27123, ey = 27487, ez = 0 },
        { sx = 27120, sy = 27540, sz = 0, ex = 27123, ey = 27547, ez = 0 },
    }
}

-- USPS (Base.USPSTruck)
PRVIR.lots["USPS"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 3,
    rooms = {
        { sx = 26940, sy = 25860, sz = 0, ex = 26942, ey = 25862, ez = 0 },
        { sx = 26940, sy = 25920, sz = 0, ex = 26942, ey = 25922, ez = 0 },
        { sx = 26940, sy = 25980, sz = 0, ex = 26942, ey = 25982, ez = 0 },
        { sx = 26940, sy = 26040, sz = 0, ex = 26942, ey = 26042, ez = 0 },
        { sx = 27180, sy = 27360, sz = 0, ex = 27182, ey = 27362, ez = 0 },
        { sx = 27180, sy = 27420, sz = 0, ex = 27182, ey = 27422, ez = 0 },
        { sx = 27180, sy = 27480, sz = 0, ex = 27182, ey = 27482, ez = 0 },
        { sx = 27180, sy = 27540, sz = 0, ex = 27182, ey = 27542, ez = 0 },
    }
}

-- FBI (Base.SpecialdivisionsTruckFlg, Base.SpecialdivisionsTruckFlg2)
PRVIR.lots["FBI"] = {
    teleportOffset = { x = -2, y = 3 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 7,
    rooms = {
        { sx = 26160, sy = 26160, sz = 0, ex = 26162, ey = 26166, ez = 0 },
        { sx = 26160, sy = 26220, sz = 0, ex = 26162, ey = 26226, ez = 0 },
        { sx = 26160, sy = 26280, sz = 0, ex = 26162, ey = 26286, ez = 0 },
        { sx = 26160, sy = 26340, sz = 0, ex = 26162, ey = 26346, ez = 0 },
    }
}

-- FBIbomb (Base.stepvanchevybOMBSQUAD, Base.stepvanchevyFBIBOMBSQUAD)
PRVIR.lots["FBIbomb"] = {
    teleportOffset = { x = -2, y = 3 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26220, sy = 26160, sz = 0, ex = 26222, ey = 26164, ez = 0 },
        { sx = 26220, sy = 26220, sz = 0, ex = 26222, ey = 26224, ez = 0 },
        { sx = 26220, sy = 26280, sz = 0, ex = 26222, ey = 26284, ez = 0 },
        { sx = 26220, sy = 26340, sz = 0, ex = 26222, ey = 26344, ez = 0 },
    }
}

-- FBIf700bomb (Base.f700boxbombsquadLG)
PRVIR.lots["FBIf700bomb"] = {
    teleportOffset = { x = -2, y = 3 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8,
    rooms = {
        { sx = 26280, sy = 26160, sz = 0, ex = 26283, ey = 26167, ez = 0 },
        { sx = 26280, sy = 26220, sz = 0, ex = 26283, ey = 26227, ez = 0 },
        { sx = 26280, sy = 26280, sz = 0, ex = 26283, ey = 26287, ez = 0 },
        { sx = 26280, sy = 26340, sz = 0, ex = 26283, ey = 26347, ez = 0 },
    }
}

-- FBIhq2 (Base.86econolinervFBIMHQLG)
PRVIR.lots["FBIhq2"] = {
    teleportOffset = { x = -1, y = 2 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26340, sy = 26160, sz = 0, ex = 26342, ey = 26164, ez = 0 },
        { sx = 26340, sy = 26220, sz = 0, ex = 26342, ey = 26224, ez = 0 },
        { sx = 26340, sy = 26280, sz = 0, ex = 26342, ey = 26284, ez = 0 },
        { sx = 26340, sy = 26340, sz = 0, ex = 26342, ey = 26344, ez = 0 },
    }
}

-- FBIhazard2 (Base.86bounderHAzardmaterials)
PRVIR.lots["FBIhazard2"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 8,
    rooms = {
        { sx = 26160, sy = 26160, sz = 30, ex = 26162, ey = 26167, ez = 30 },
        { sx = 26160, sy = 26220, sz = 30, ex = 26162, ey = 26227, ez = 30 },
        { sx = 26160, sy = 26280, sz = 30, ex = 26162, ey = 26287, ez = 30 },
        { sx = 26160, sy = 26340, sz = 30, ex = 26162, ey = 26347, ez = 30 },
    }
}

-- tstrailer (Base.TrailerTSMega)
PRVIR.lots["tstrailer"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 12,
    rooms = {
        { sx = 26760, sy = 25860, sz = 30, ex = 26763, ey = 25871, ez = 30 },
        { sx = 26760, sy = 25920, sz = 30, ex = 26763, ey = 25931, ez = 30 },
        { sx = 26760, sy = 25980, sz = 30, ex = 26763, ey = 25991, ez = 30 },
        { sx = 26760, sy = 26040, sz = 30, ex = 26763, ey = 26051, ez = 30 },
        { sx = 27060, sy = 26160, sz = 0,  ex = 27063, ey = 26171, ez = 0  },
        { sx = 27060, sy = 26220, sz = 0,  ex = 27063, ey = 26231, ez = 0  },
        { sx = 27060, sy = 26280, sz = 0,  ex = 27063, ey = 26291, ez = 0  },
        { sx = 27060, sy = 26340, sz = 0,  ex = 27063, ey = 26351, ez = 0  },
        { sx = 26760, sy = 26360, sz = 0,  ex = 26763, ey = 26371, ez = 0  },
        { sx = 26760, sy = 26420, sz = 0,  ex = 26763, ey = 26431, ez = 0  },
        { sx = 26760, sy = 26480, sz = 0,  ex = 26763, ey = 26491, ez = 0  },
        { sx = 26760, sy = 26540, sz = 0,  ex = 26763, ey = 26551, ez = 0  },
        { sx = 26820, sy = 27360, sz = 0,  ex = 26823, ey = 27371, ez = 0  },
        { sx = 26820, sy = 27420, sz = 0,  ex = 26823, ey = 27431, ez = 0  },
        { sx = 26820, sy = 27480, sz = 0,  ex = 26823, ey = 27491, ez = 0  },
        { sx = 26820, sy = 27540, sz = 0,  ex = 26823, ey = 27551, ez = 0  },
    }
}

-- tstraileranimal (Base.TrailerTSMegaAnimal)
PRVIR.lots["tstraileranimal"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26820, sy = 25860, sz = 30, ex = 26822, ey = 25863, ez = 30 },
        { sx = 26820, sy = 25920, sz = 30, ex = 26822, ey = 25923, ez = 30 },
        { sx = 26820, sy = 25980, sz = 30, ex = 26822, ey = 25983, ez = 30 },
        { sx = 26820, sy = 26040, sz = 30, ex = 26822, ey = 26043, ez = 30 },
        { sx = 27120, sy = 26160, sz = 0,  ex = 27122, ey = 26163, ez = 0  },
        { sx = 27120, sy = 26220, sz = 0,  ex = 27122, ey = 26223, ez = 0  },
        { sx = 27120, sy = 26280, sz = 0,  ex = 27122, ey = 26283, ez = 0  },
        { sx = 27120, sy = 26340, sz = 0,  ex = 27122, ey = 26343, ez = 0  },
        { sx = 26880, sy = 27360, sz = 0,  ex = 26882, ey = 27363, ez = 0  },
        { sx = 26880, sy = 27420, sz = 0,  ex = 26882, ey = 27423, ez = 0  },
        { sx = 26880, sy = 27480, sz = 0,  ex = 26882, ey = 27483, ez = 0  },
        { sx = 26880, sy = 27540, sz = 0,  ex = 26882, ey = 27543, ez = 0  },
    }
}

-- unimogtrailerr (Base.UnimogTrailer)
PRVIR.lots["unimogtrailerr"] = {
    teleportOffset = { x = 0, y = 2 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26880, sy = 25860, sz = 30, ex = 26882, ey = 25864, ez = 30 },
        { sx = 26880, sy = 25920, sz = 30, ex = 26882, ey = 25924, ez = 30 },
        { sx = 26880, sy = 25980, sz = 30, ex = 26882, ey = 25984, ez = 30 },
        { sx = 26880, sy = 26040, sz = 30, ex = 26882, ey = 26044, ez = 30 },
        { sx = 27360, sy = 27360, sz = 0,  ex = 27362, ey = 27364, ez = 0  },
        { sx = 27360, sy = 27420, sz = 0,  ex = 27362, ey = 27424, ez = 0  },
        { sx = 27360, sy = 27480, sz = 0,  ex = 27362, ey = 27484, ez = 0  },
        { sx = 27360, sy = 27540, sz = 0,  ex = 27362, ey = 27544, ez = 0  },
    }
}

-- atavanderumba (Base.ATA_VanDeRumba)
PRVIR.lots["atavanderumba"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26940, sy = 25860, sz = 30, ex = 26941, ey = 25862, ez = 30 },
        { sx = 26940, sy = 25920, sz = 30, ex = 26941, ey = 25922, ez = 30 },
        { sx = 26940, sy = 25980, sz = 30, ex = 26941, ey = 25982, ez = 30 },
        { sx = 26940, sy = 26040, sz = 30, ex = 26941, ey = 26042, ez = 30 },
    }
}

-- van (Base.BasicVan)
PRVIR.lots["van"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26460, sy = 26460, sz = 0, ex = 26461, ey = 26462, ez = 0 },
        { sx = 26460, sy = 26520, sz = 0, ex = 26461, ey = 26522, ez = 0 },
        { sx = 26460, sy = 26580, sz = 0, ex = 26461, ey = 26582, ez = 0 },
        { sx = 26460, sy = 26640, sz = 0, ex = 26461, ey = 26642, ez = 0 },
    }
}

-- ki5van (63Type2Van)
PRVIR.lots["ki5van"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 26160, sy = 26760, sz = 0, ex = 26161, ey = 26761, ez = 0 },
        { sx = 26160, sy = 26820, sz = 0, ex = 26161, ey = 26821, ez = 0 },
        { sx = 26160, sy = 26880, sz = 0, ex = 26161, ey = 26881, ez = 0 },
        { sx = 26160, sy = 26940, sz = 0, ex = 26161, ey = 26941, ez = 0 },
    }
}

-- ki5bus (Base.87fordB700school)
PRVIR.lots["ki5bus"] = {
    teleportOffset = { x = 0, y = 10 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 11,
    rooms = {
        { sx = 26220, sy = 26760, sz = 0, ex = 26223, ey = 26770, ez = 0 },
        { sx = 26220, sy = 26820, sz = 0, ex = 26223, ey = 26830, ez = 0 },
        { sx = 26220, sy = 26880, sz = 0, ex = 26223, ey = 26890, ez = 0 },
        { sx = 26220, sy = 26940, sz = 0, ex = 26223, ey = 26950, ez = 0 },
        { sx = 27660, sy = 27360, sz = 0, ex = 27663, ey = 27370, ez = 0 },
        { sx = 27660, sy = 27420, sz = 0, ex = 27663, ey = 27430, ez = 0 },
        { sx = 27660, sy = 27480, sz = 0, ex = 27663, ey = 27490, ez = 0 },
        { sx = 27660, sy = 27540, sz = 0, ex = 27663, ey = 27550, ez = 0 },
        { sx = 26280, sy = 27660, sz = 0, ex = 26283, ey = 27670, ez = 0 },
        { sx = 26280, sy = 27720, sz = 0, ex = 26283, ey = 27730, ez = 0 },
        { sx = 26280, sy = 27780, sz = 0, ex = 26283, ey = 27790, ez = 0 },
        { sx = 26280, sy = 27840, sz = 0, ex = 26283, ey = 27850, ez = 0 },
    }
}

-- ki5truck (Base.87fordF700box)
PRVIR.lots["ki5truck"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8,
    rooms = {
        { sx = 26280, sy = 26760, sz = 0, ex = 26283, ey = 26767, ez = 0 },
        { sx = 26280, sy = 26820, sz = 0, ex = 26283, ey = 26827, ez = 0 },
        { sx = 26280, sy = 26880, sz = 0, ex = 26283, ey = 26887, ez = 0 },
        { sx = 26280, sy = 26940, sz = 0, ex = 26283, ey = 26947, ez = 0 },
        { sx = 26940, sy = 26160, sz = 0, ex = 26943, ey = 26167, ez = 0 },
        { sx = 26940, sy = 26220, sz = 0, ex = 26943, ey = 26227, ez = 0 },
        { sx = 26940, sy = 26280, sz = 0, ex = 26943, ey = 26287, ez = 0 },
        { sx = 26940, sy = 26340, sz = 0, ex = 26943, ey = 26347, ez = 0 },
        { sx = 27180, sy = 26460, sz = 0, ex = 27183, ey = 26467, ez = 0 },
        { sx = 27180, sy = 26520, sz = 0, ex = 27183, ey = 26527, ez = 0 },
        { sx = 27420, sy = 27360, sz = 0, ex = 27423, ey = 27367, ez = 0 },
        { sx = 27420, sy = 27420, sz = 0, ex = 27423, ey = 27427, ez = 0 },
        { sx = 27420, sy = 27480, sz = 0, ex = 27423, ey = 27487, ez = 0 },
        { sx = 27420, sy = 27540, sz = 0, ex = 27423, ey = 27547, ez = 0 },
        { sx = 26160, sy = 27660, sz = 0, ex = 26163, ey = 27667, ez = 0 },
        { sx = 26160, sy = 27720, sz = 0, ex = 26163, ey = 27727, ez = 0 },
        { sx = 26160, sy = 27780, sz = 0, ex = 26163, ey = 27787, ez = 0 },
        { sx = 26160, sy = 27840, sz = 0, ex = 26163, ey = 27847, ez = 0 },
        { sx = 26220, sy = 27660, sz = 0, ex = 26223, ey = 27667, ez = 0 },
        { sx = 26220, sy = 27720, sz = 0, ex = 26223, ey = 27727, ez = 0 },
        { sx = 26220, sy = 27780, sz = 0, ex = 26223, ey = 27787, ez = 0 },
        { sx = 26220, sy = 27840, sz = 0, ex = 26223, ey = 27847, ez = 0 },
    }
}

-- ki5swat (Base.87fordF700swat)
PRVIR.lots["ki5swat"] = {
    teleportOffset = { x = 0, y = 2 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26760, sy = 26460, sz = 30, ex = 26762, ey = 26463, ez = 30 },
        { sx = 26760, sy = 26520, sz = 30, ex = 26762, ey = 26523, ez = 30 },
        { sx = 26760, sy = 26580, sz = 30, ex = 26762, ey = 26583, ez = 30 },
        { sx = 26760, sy = 26640, sz = 30, ex = 26762, ey = 26643, ez = 30 },
    }
}

-- ki5stepvan (Base.85chevyStepVan variants)
PRVIR.lots["ki5stepvan"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26340, sy = 26760, sz = 0, ex = 26342, ey = 26763, ez = 0 },
        { sx = 26340, sy = 26820, sz = 0, ex = 26342, ey = 26823, ez = 0 },
        { sx = 26340, sy = 26880, sz = 0, ex = 26342, ey = 26883, ez = 0 },
        { sx = 26340, sy = 26940, sz = 0, ex = 26342, ey = 26943, ez = 0 },
        { sx = 26760, sy = 26760, sz = 0, ex = 26762, ey = 26763, ez = 0 },
        { sx = 26760, sy = 26820, sz = 0, ex = 26762, ey = 26823, ez = 0 },
        { sx = 26760, sy = 26880, sz = 0, ex = 26762, ey = 26883, ez = 0 },
        { sx = 26760, sy = 26940, sz = 0, ex = 26762, ey = 26943, ez = 0 },
        { sx = 26580, sy = 26460, sz = 0, ex = 26582, ey = 26463, ez = 0 },
        { sx = 26580, sy = 26520, sz = 0, ex = 26582, ey = 26523, ez = 0 },
        { sx = 26580, sy = 26580, sz = 0, ex = 26582, ey = 26583, ez = 0 },
        { sx = 26580, sy = 26640, sz = 0, ex = 26582, ey = 26643, ez = 0 },
    }
}

-- ki590fordambu (Base.90fordF350ambulance)
PRVIR.lots["ki590fordambu"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 3,
    rooms = {
        { sx = 26160, sy = 26760, sz = 30, ex = 26162, ey = 26762, ez = 30 },
        { sx = 26160, sy = 26820, sz = 30, ex = 26162, ey = 26822, ez = 30 },
        { sx = 26160, sy = 26880, sz = 30, ex = 26162, ey = 26882, ez = 30 },
        { sx = 26160, sy = 26940, sz = 30, ex = 26162, ey = 26942, ez = 30 },
        { sx = 26940, sy = 26460, sz = 0,  ex = 26942, ey = 26462, ez = 0  },
        { sx = 26940, sy = 26520, sz = 0,  ex = 26942, ey = 26522, ez = 0  },
        { sx = 26940, sy = 26580, sz = 0,  ex = 26942, ey = 26582, ez = 0  },
        { sx = 26940, sy = 26640, sz = 0,  ex = 26942, ey = 26642, ez = 0  },
    }
}

-- ki586ford (Base.86fordE150 variants)
PRVIR.lots["ki586ford"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26220, sy = 26760, sz = 30, ex = 26221, ey = 26762, ez = 30 },
        { sx = 26220, sy = 26820, sz = 30, ex = 26221, ey = 26822, ez = 30 },
        { sx = 26220, sy = 26880, sz = 30, ex = 26221, ey = 26882, ez = 30 },
        { sx = 26220, sy = 26940, sz = 30, ex = 26221, ey = 26942, ez = 30 },
        { sx = 26460, sy = 26760, sz = 0,  ex = 26461, ey = 26762, ez = 0  },
        { sx = 26460, sy = 26820, sz = 0,  ex = 26461, ey = 26822, ez = 0  },
        { sx = 26460, sy = 26880, sz = 0,  ex = 26461, ey = 26882, ez = 0  },
        { sx = 26460, sy = 26940, sz = 0,  ex = 26461, ey = 26942, ez = 0  },
        { sx = 26520, sy = 26760, sz = 0,  ex = 26521, ey = 26762, ez = 0  },
        { sx = 26520, sy = 26820, sz = 0,  ex = 26521, ey = 26822, ez = 0  },
        { sx = 26520, sy = 26880, sz = 0,  ex = 26521, ey = 26882, ez = 0  },
        { sx = 26520, sy = 26940, sz = 0,  ex = 26521, ey = 26942, ez = 0  },
        { sx = 26580, sy = 26760, sz = 0,  ex = 26581, ey = 26762, ez = 0  },
        { sx = 26580, sy = 26820, sz = 0,  ex = 26581, ey = 26822, ez = 0  },
        { sx = 26580, sy = 26880, sz = 0,  ex = 26581, ey = 26882, ez = 0  },
        { sx = 26580, sy = 26940, sz = 0,  ex = 26581, ey = 26942, ez = 0  },
        { sx = 26460, sy = 27060, sz = 0,  ex = 26461, ey = 27062, ez = 0  },
        { sx = 26460, sy = 27120, sz = 0,  ex = 26461, ey = 27122, ez = 0  },
        { sx = 26460, sy = 27180, sz = 0,  ex = 26461, ey = 27182, ez = 0  },
        { sx = 26460, sy = 27240, sz = 0,  ex = 26461, ey = 27242, ez = 0  },
        { sx = 26520, sy = 27060, sz = 0,  ex = 26521, ey = 27062, ez = 0  },
        { sx = 26520, sy = 27120, sz = 0,  ex = 26521, ey = 27122, ez = 0  },
        { sx = 26520, sy = 27180, sz = 0,  ex = 26521, ey = 27182, ez = 0  },
        { sx = 26520, sy = 27240, sz = 0,  ex = 26521, ey = 27242, ez = 0  },
    }
}

-- ki5cf800 (Base.93fordElgin, Base.93fordElginSpec)
PRVIR.lots["ki5cf800"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26280, sy = 26760, sz = 30, ex = 26282, ey = 26763, ez = 30 },
        { sx = 26280, sy = 26820, sz = 30, ex = 26282, ey = 26823, ez = 30 },
        { sx = 26280, sy = 26880, sz = 30, ex = 26282, ey = 26883, ez = 30 },
        { sx = 26280, sy = 26940, sz = 30, ex = 26282, ey = 26943, ez = 30 },
    }
}

-- ki5container (Base.isoContainer2, Base.isoContainer4, Base.isoContainer5)
PRVIR.lots["ki5container"] = {
    teleportOffset = { x = 0, y = 3 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 7,
    rooms = {
        { sx = 26340, sy = 26760, sz = 30, ex = 26342, ey = 26766, ez = 30 },
        { sx = 26340, sy = 26820, sz = 30, ex = 26342, ey = 26826, ez = 30 },
        { sx = 26340, sy = 26880, sz = 30, ex = 26342, ey = 26886, ez = 30 },
        { sx = 26340, sy = 26940, sz = 30, ex = 26342, ey = 26946, ez = 30 },
        { sx = 26940, sy = 26760, sz = 0,  ex = 26942, ey = 26766, ez = 0  },
        { sx = 26940, sy = 26820, sz = 0,  ex = 26942, ey = 26826, ez = 0  },
        { sx = 26940, sy = 26880, sz = 0,  ex = 26942, ey = 26886, ez = 0  },
        { sx = 26940, sy = 26940, sz = 0,  ex = 26942, ey = 26946, ez = 0  },
    }
}

-- scooby (Base.VanMysteryMachine)
PRVIR.lots["scooby"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26520, sy = 26460, sz = 0, ex = 26521, ey = 26462, ez = 0 },
        { sx = 26520, sy = 26520, sz = 0, ex = 26521, ey = 26522, ez = 0 },
        { sx = 26520, sy = 26580, sz = 0, ex = 26521, ey = 26582, ez = 0 },
        { sx = 26520, sy = 26640, sz = 0, ex = 26521, ey = 26642, ez = 0 },
    }
}

-- tsarbus (Base.ATAApocalypseBus)
PRVIR.lots["tsarbus"] = {
    teleportOffset = { x = 0, y = 8 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 9,
    rooms = {
        { sx = 26760, sy = 26460, sz = 0, ex = 26763, ey = 26468, ez = 0 },
        { sx = 26760, sy = 26520, sz = 0, ex = 26763, ey = 26528, ez = 0 },
        { sx = 26760, sy = 26580, sz = 0, ex = 26763, ey = 26588, ez = 0 },
        { sx = 26760, sy = 26640, sz = 0, ex = 26763, ey = 26648, ez = 0 },
        { sx = 26160, sy = 27060, sz = 0, ex = 26163, ey = 27068, ez = 0 },
        { sx = 26160, sy = 27120, sz = 0, ex = 26163, ey = 27128, ez = 0 },
        { sx = 26160, sy = 27180, sz = 0, ex = 26163, ey = 27188, ez = 0 },
        { sx = 26160, sy = 27240, sz = 0, ex = 26163, ey = 27248, ez = 0 },
    }
}

-- tsarbus2 (Base.ATASchoolBus)
PRVIR.lots["tsarbus2"] = {
    teleportOffset = { x = 0, y = 8 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 9,
    rooms = {
        { sx = 26820, sy = 26460, sz = 0, ex = 26823, ey = 26468, ez = 0 },
        { sx = 26820, sy = 26520, sz = 0, ex = 26823, ey = 26528, ez = 0 },
        { sx = 26820, sy = 26580, sz = 0, ex = 26823, ey = 26588, ez = 0 },
        { sx = 26820, sy = 26640, sz = 0, ex = 26823, ey = 26648, ez = 0 },
        { sx = 26220, sy = 27060, sz = 0, ex = 26223, ey = 27068, ez = 0 },
        { sx = 26220, sy = 27120, sz = 0, ex = 26223, ey = 27128, ez = 0 },
        { sx = 26220, sy = 27180, sz = 0, ex = 26223, ey = 27188, ez = 0 },
        { sx = 26220, sy = 27240, sz = 0, ex = 26223, ey = 27248, ez = 0 },
    }
}

-- amazomvan (Base.aMOOzonVan)
PRVIR.lots["amazomvan"] = {
    teleportOffset = { x = 0, y = 3 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26880, sy = 26460, sz = 0, ex = 26882, ey = 26463, ez = 0 },
        { sx = 26880, sy = 26520, sz = 0, ex = 26882, ey = 26523, ez = 0 },
        { sx = 26880, sy = 26580, sz = 0, ex = 26882, ey = 26583, ez = 0 },
        { sx = 26880, sy = 26640, sz = 0, ex = 26882, ey = 26643, ez = 0 },
    }
}

-- Vanillastepvan (Base.StepVan variants)
PRVIR.lots["Vanillastepvan"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27360, sy = 26160, sz = 0, ex = 27362, ey = 26163, ez = 0 },
        { sx = 27360, sy = 26220, sz = 0, ex = 27362, ey = 26223, ez = 0 },
        { sx = 27360, sy = 26280, sz = 0, ex = 27362, ey = 26283, ez = 0 },
        { sx = 27360, sy = 26340, sz = 0, ex = 27362, ey = 26343, ez = 0 },
        { sx = 27420, sy = 26160, sz = 0, ex = 27422, ey = 26163, ez = 0 },
        { sx = 27420, sy = 26220, sz = 0, ex = 27422, ey = 26223, ez = 0 },
        { sx = 27420, sy = 26280, sz = 0, ex = 27422, ey = 26283, ez = 0 },
        { sx = 27420, sy = 26340, sz = 0, ex = 27422, ey = 26343, ez = 0 },
        { sx = 27480, sy = 26160, sz = 0, ex = 27482, ey = 26163, ez = 0 },
        { sx = 27480, sy = 26220, sz = 0, ex = 27482, ey = 26223, ez = 0 },
        { sx = 27480, sy = 26280, sz = 0, ex = 27482, ey = 26283, ez = 0 },
        { sx = 27480, sy = 26340, sz = 0, ex = 27482, ey = 26343, ez = 0 },
        { sx = 27540, sy = 26160, sz = 0, ex = 27542, ey = 26163, ez = 0 },
        { sx = 27540, sy = 26220, sz = 0, ex = 27542, ey = 26223, ez = 0 },
        { sx = 27960, sy = 26760, sz = 0, ex = 27962, ey = 26763, ez = 0 },
        { sx = 27960, sy = 26820, sz = 0, ex = 27962, ey = 26823, ez = 0 },
        { sx = 27960, sy = 26880, sz = 0, ex = 27962, ey = 26883, ez = 0 },
        { sx = 27960, sy = 26940, sz = 0, ex = 27962, ey = 26943, ez = 0 },
        { sx = 28020, sy = 26760, sz = 0, ex = 28022, ey = 26763, ez = 0 },
        { sx = 28020, sy = 26820, sz = 0, ex = 28022, ey = 26823, ez = 0 },
        { sx = 28020, sy = 26880, sz = 0, ex = 28022, ey = 26883, ez = 0 },
        { sx = 28020, sy = 26940, sz = 0, ex = 28022, ey = 26943, ez = 0 },
    }
}

-- Vanillastepvanmail (Base.StepVanMail)
PRVIR.lots["Vanillastepvanmail"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27360, sy = 26460, sz = 0, ex = 27362, ey = 26463, ez = 0 },
        { sx = 27360, sy = 26520, sz = 0, ex = 27362, ey = 26523, ez = 0 },
        { sx = 27360, sy = 26580, sz = 0, ex = 27362, ey = 26583, ez = 0 },
        { sx = 27360, sy = 26640, sz = 0, ex = 27362, ey = 26643, ez = 0 },
    }
}

-- Vanillastepswat (Base.StepVan_LouisvilleSWAT)
PRVIR.lots["Vanillastepswat"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27420, sy = 26460, sz = 0, ex = 27422, ey = 26463, ez = 0 },
        { sx = 27420, sy = 26520, sz = 0, ex = 27422, ey = 26523, ez = 0 },
        { sx = 27420, sy = 26580, sz = 0, ex = 27422, ey = 26583, ez = 0 },
        { sx = 27420, sy = 26640, sz = 0, ex = 27422, ey = 26643, ez = 0 },
    }
}

-- Vanillastepplonkies (Base.StepVan_Plonkies)
PRVIR.lots["Vanillastepplonkies"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27480, sy = 26460, sz = 0, ex = 27482, ey = 26463, ez = 0 },
        { sx = 27480, sy = 26520, sz = 0, ex = 27482, ey = 26523, ez = 0 },
        { sx = 27480, sy = 26580, sz = 0, ex = 27482, ey = 26583, ez = 0 },
        { sx = 27480, sy = 26640, sz = 0, ex = 27482, ey = 26643, ez = 0 },
    }
}

-- Vanillastepscarlet (Base.StepVan_Scarlet)
PRVIR.lots["Vanillastepscarlet"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27540, sy = 26460, sz = 0, ex = 27542, ey = 26463, ez = 0 },
        { sx = 27540, sy = 26520, sz = 0, ex = 27542, ey = 26523, ez = 0 },
        { sx = 27540, sy = 26580, sz = 0, ex = 27542, ey = 26583, ez = 0 },
        { sx = 27540, sy = 26640, sz = 0, ex = 27542, ey = 26643, ez = 0 },
    }
}

-- Vanillastepvansmartkut (Base.StepVan_SmartKut)
PRVIR.lots["Vanillastepvansmartkut"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27360, sy = 26460, sz = 0, ex = 27362, ey = 26463, ez = 0 },
        { sx = 27360, sy = 26520, sz = 0, ex = 27362, ey = 26523, ez = 0 },
        { sx = 27360, sy = 26580, sz = 0, ex = 27362, ey = 26583, ez = 0 },
        { sx = 27360, sy = 26640, sz = 0, ex = 27362, ey = 26643, ez = 0 },
    }
}

-- Vanillamobilelibrasry (Base.StepVan_MobileLibrary)
PRVIR.lots["Vanillamobilelibrasry"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27420, sy = 26460, sz = 0, ex = 27422, ey = 26463, ez = 0 },
        { sx = 27420, sy = 26520, sz = 0, ex = 27422, ey = 26523, ez = 0 },
        { sx = 27420, sy = 26580, sz = 0, ex = 27422, ey = 26583, ez = 0 },
        { sx = 27420, sy = 26640, sz = 0, ex = 27422, ey = 26643, ez = 0 },
    }
}

-- vanillavan (Base.Van and many variants)
PRVIR.lots["vanillavan"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 27660, sy = 26760, sz = 0, ex = 27661, ey = 26762, ez = 0 },
        { sx = 27660, sy = 26820, sz = 0, ex = 27661, ey = 26822, ez = 0 },
        { sx = 27660, sy = 26880, sz = 0, ex = 27661, ey = 26882, ez = 0 },
        { sx = 27660, sy = 26940, sz = 0, ex = 27661, ey = 26942, ez = 0 },
        { sx = 27720, sy = 26760, sz = 0, ex = 27721, ey = 26762, ez = 0 },
        { sx = 27720, sy = 26820, sz = 0, ex = 27721, ey = 26822, ez = 0 },
        { sx = 27720, sy = 26880, sz = 0, ex = 27721, ey = 26882, ez = 0 },
        { sx = 27720, sy = 26940, sz = 0, ex = 27721, ey = 26942, ez = 0 },
        { sx = 27780, sy = 26760, sz = 0, ex = 27781, ey = 26762, ez = 0 },
        { sx = 27780, sy = 26820, sz = 0, ex = 27781, ey = 26822, ez = 0 },
        { sx = 27780, sy = 26880, sz = 0, ex = 27781, ey = 26882, ez = 0 },
        { sx = 27780, sy = 26940, sz = 0, ex = 27781, ey = 26942, ez = 0 },
        { sx = 27840, sy = 26760, sz = 0, ex = 27841, ey = 26762, ez = 0 },
        { sx = 27840, sy = 26820, sz = 0, ex = 27841, ey = 26822, ez = 0 },
        { sx = 27840, sy = 26880, sz = 0, ex = 27841, ey = 26882, ez = 0 },
        { sx = 27840, sy = 26940, sz = 0, ex = 27841, ey = 26942, ez = 0 },
        { sx = 27660, sy = 27060, sz = 0, ex = 27661, ey = 27062, ez = 0 },
        { sx = 27660, sy = 27120, sz = 0, ex = 27661, ey = 27122, ez = 0 },
        { sx = 27660, sy = 27180, sz = 0, ex = 27661, ey = 27182, ez = 0 },
        { sx = 27660, sy = 27240, sz = 0, ex = 27661, ey = 27242, ez = 0 },
        { sx = 27720, sy = 27060, sz = 0, ex = 27721, ey = 27062, ez = 0 },
        { sx = 27720, sy = 27120, sz = 0, ex = 27721, ey = 27122, ez = 0 },
        { sx = 27720, sy = 27180, sz = 0, ex = 27721, ey = 27182, ez = 0 },
        { sx = 27720, sy = 27240, sz = 0, ex = 27721, ey = 27242, ez = 0 },
        { sx = 27780, sy = 27060, sz = 0, ex = 27781, ey = 27062, ez = 0 },
        { sx = 27780, sy = 27120, sz = 0, ex = 27781, ey = 27122, ez = 0 },
        { sx = 27780, sy = 27180, sz = 0, ex = 27781, ey = 27182, ez = 0 },
        { sx = 27780, sy = 27240, sz = 0, ex = 27781, ey = 27242, ez = 0 },
    }
}

-- Vanambulance (Base.VanAmbulance)
PRVIR.lots["Vanambulance"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28260, sy = 26460, sz = 0, ex = 28261, ey = 26462, ez = 0 },
        { sx = 28260, sy = 26520, sz = 0, ex = 28261, ey = 26522, ez = 0 },
        { sx = 28260, sy = 26580, sz = 0, ex = 28261, ey = 26582, ez = 0 },
        { sx = 28260, sy = 26640, sz = 0, ex = 28261, ey = 26642, ez = 0 },
        { sx = 28320, sy = 26460, sz = 0, ex = 28321, ey = 26462, ez = 0 },
        { sx = 28320, sy = 26520, sz = 0, ex = 28321, ey = 26522, ez = 0 },
        { sx = 28320, sy = 26580, sz = 0, ex = 28321, ey = 26582, ez = 0 },
        { sx = 28320, sy = 26640, sz = 0, ex = 28321, ey = 26642, ez = 0 },
    }
}

-- VanMAIL3 (Base.VanMail)
PRVIR.lots["VanMAIL3"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28440, sy = 26460, sz = 0, ex = 28441, ey = 26462, ez = 0 },
        { sx = 28440, sy = 26520, sz = 0, ex = 28441, ey = 26522, ez = 0 },
        { sx = 28440, sy = 26580, sz = 0, ex = 28441, ey = 26582, ez = 0 },
        { sx = 28440, sy = 26640, sz = 0, ex = 28441, ey = 26642, ez = 0 },
    }
}

-- VanRADIO (Base.VanRadio, Base.VanRadio_3N)
PRVIR.lots["VanRADIO"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28260, sy = 26460, sz = 30, ex = 28261, ey = 26462, ez = 30 },
        { sx = 28260, sy = 26520, sz = 30, ex = 28261, ey = 26522, ez = 30 },
        { sx = 28260, sy = 26580, sz = 30, ex = 28261, ey = 26582, ez = 30 },
        { sx = 28260, sy = 26640, sz = 30, ex = 28261, ey = 26642, ez = 30 },
    }
}

-- VanaSPIFFO2 (Base.VanSpiffo)
PRVIR.lots["VanaSPIFFO2"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28380, sy = 26460, sz = 30, ex = 28381, ey = 26462, ez = 30 },
        { sx = 28380, sy = 26520, sz = 30, ex = 28381, ey = 26522, ez = 30 },
        { sx = 28380, sy = 26580, sz = 30, ex = 28381, ey = 26582, ez = 30 },
        { sx = 28380, sy = 26640, sz = 30, ex = 28381, ey = 26642, ez = 30 },
    }
}

-- Vanbeerrr (Base.Van_Charlemange_Beer, Base.Van_KnoxDisti)
PRVIR.lots["Vanbeerrr"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28380, sy = 26460, sz = 0, ex = 28381, ey = 26462, ez = 0 },
        { sx = 28380, sy = 26520, sz = 0, ex = 28381, ey = 26522, ez = 0 },
        { sx = 28380, sy = 26580, sz = 0, ex = 28381, ey = 26582, ez = 0 },
        { sx = 28380, sy = 26640, sz = 0, ex = 28381, ey = 26642, ez = 0 },
    }
}

-- Vanampotato (Base.Van_Perfick_Potato)
PRVIR.lots["Vanampotato"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28320, sy = 26460, sz = 30, ex = 28321, ey = 26462, ez = 30 },
        { sx = 28320, sy = 26520, sz = 30, ex = 28321, ey = 26522, ez = 30 },
        { sx = 28320, sy = 26580, sz = 30, ex = 28321, ey = 26582, ez = 30 },
        { sx = 28320, sy = 26640, sz = 30, ex = 28321, ey = 26642, ez = 30 },
    }
}

-- 73winne (Base.73Winnebago)
PRVIR.lots["73winne"] = {
    teleportOffset = { x = 0, y = 5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 6,
    rooms = {
        { sx = 28260, sy = 26760, sz = 0, ex = 28262, ey = 26765, ez = 0 },
        { sx = 28260, sy = 26820, sz = 0, ex = 28262, ey = 26825, ez = 0 },
        { sx = 28260, sy = 26880, sz = 0, ex = 28262, ey = 26885, ez = 0 },
        { sx = 28260, sy = 26940, sz = 0, ex = 28262, ey = 26945, ez = 0 },
        { sx = 28320, sy = 26760, sz = 0, ex = 28322, ey = 26765, ez = 0 },
        { sx = 28320, sy = 26820, sz = 0, ex = 28322, ey = 26825, ez = 0 },
    }
}

-- 89defender (Base.89defender variants)
PRVIR.lots["89defender"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 26160, sy = 26460, sz = 0, ex = 26161, ey = 26461, ez = 0 },
        { sx = 26160, sy = 26520, sz = 0, ex = 26161, ey = 26521, ez = 0 },
        { sx = 26160, sy = 26580, sz = 0, ex = 26161, ey = 26581, ez = 0 },
        { sx = 26160, sy = 26640, sz = 0, ex = 26161, ey = 26641, ez = 0 },
        { sx = 26220, sy = 26460, sz = 0, ex = 26221, ey = 26461, ez = 0 },
        { sx = 26220, sy = 26520, sz = 0, ex = 26221, ey = 26521, ez = 0 },
        { sx = 26220, sy = 26580, sz = 0, ex = 26221, ey = 26581, ez = 0 },
        { sx = 26220, sy = 26640, sz = 0, ex = 26221, ey = 26641, ez = 0 },
    }
}

-- motoriusambulance (Base.fhq92EconolineAmbulance variants)
PRVIR.lots["motoriusambulance"] = {
    teleportOffset = { x = -1, y = 2 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 27660, sy = 26460, sz = 0, ex = 27661, ey = 26462, ez = 0 },
        { sx = 27660, sy = 26520, sz = 0, ex = 27661, ey = 26522, ez = 0 },
        { sx = 27660, sy = 26580, sz = 0, ex = 27661, ey = 26582, ez = 0 },
        { sx = 27660, sy = 26640, sz = 0, ex = 27661, ey = 26642, ez = 0 },
        { sx = 27720, sy = 26460, sz = 0, ex = 27721, ey = 26462, ez = 0 },
        { sx = 27720, sy = 26520, sz = 0, ex = 27721, ey = 26522, ez = 0 },
        { sx = 27720, sy = 26580, sz = 0, ex = 27721, ey = 26582, ez = 0 },
        { sx = 27720, sy = 26640, sz = 0, ex = 27721, ey = 26642, ez = 0 },
    }
}

-- motoriusambulance2 (Base.fhq92EconolineT3Ambulance)
PRVIR.lots["motoriusambulance2"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 3,
    rooms = {
        { sx = 27780, sy = 26460, sz = 0, ex = 27782, ey = 26462, ez = 0 },
        { sx = 27780, sy = 26520, sz = 0, ex = 27782, ey = 26522, ez = 0 },
        { sx = 27780, sy = 26580, sz = 0, ex = 27782, ey = 26582, ez = 0 },
        { sx = 27780, sy = 26640, sz = 0, ex = 27782, ey = 26642, ez = 0 },
        { sx = 27840, sy = 26460, sz = 0, ex = 27842, ey = 26462, ez = 0 },
        { sx = 27840, sy = 26520, sz = 0, ex = 27842, ey = 26522, ez = 0 },
        { sx = 27840, sy = 26580, sz = 0, ex = 27842, ey = 26582, ez = 0 },
        { sx = 27840, sy = 26640, sz = 0, ex = 27842, ey = 26642, ez = 0 },
    }
}

-- VWT2T1 (Base.fhqVWT2T1, Base.fhqVWT2T1Livery)
PRVIR.lots["VWT2T1"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28080, sy = 26160, sz = 0, ex = 28081, ey = 26162, ez = 0 },
        { sx = 28080, sy = 26220, sz = 0, ex = 28081, ey = 26222, ez = 0 },
        { sx = 28080, sy = 26280, sz = 0, ex = 28081, ey = 26282, ez = 0 },
        { sx = 28080, sy = 26340, sz = 0, ex = 28081, ey = 26342, ez = 0 },
        { sx = 28140, sy = 26160, sz = 0, ex = 28141, ey = 26162, ez = 0 },
        { sx = 28140, sy = 26220, sz = 0, ex = 28141, ey = 26222, ez = 0 },
        { sx = 28140, sy = 26280, sz = 0, ex = 28141, ey = 26282, ez = 0 },
        { sx = 28140, sy = 26340, sz = 0, ex = 28141, ey = 26342, ez = 0 },
    }
}

-- mvan92econolinenormalvans (Base.fhq92Econoline variants)
PRVIR.lots["mvan92econolinenormalvans"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 27660, sy = 26160, sz = 0,  ex = 27661, ey = 26162, ez = 0  },
        { sx = 27660, sy = 26220, sz = 0,  ex = 27661, ey = 26222, ez = 0  },
        { sx = 27660, sy = 26280, sz = 0,  ex = 27661, ey = 26282, ez = 0  },
        { sx = 27660, sy = 26340, sz = 0,  ex = 27661, ey = 26342, ez = 0  },
        { sx = 27720, sy = 26160, sz = 0,  ex = 27721, ey = 26162, ez = 0  },
        { sx = 27720, sy = 26220, sz = 0,  ex = 27721, ey = 26222, ez = 0  },
        { sx = 27720, sy = 26280, sz = 0,  ex = 27721, ey = 26282, ez = 0  },
        { sx = 27720, sy = 26340, sz = 0,  ex = 27721, ey = 26342, ez = 0  },
        { sx = 27660, sy = 26160, sz = 30, ex = 27661, ey = 26162, ez = 30 },
        { sx = 27660, sy = 26220, sz = 30, ex = 27661, ey = 26222, ez = 30 },
        { sx = 27660, sy = 26280, sz = 30, ex = 27661, ey = 26282, ez = 30 },
        { sx = 27660, sy = 26340, sz = 30, ex = 27661, ey = 26342, ez = 30 },
        { sx = 27720, sy = 26160, sz = 30, ex = 27721, ey = 26162, ez = 30 },
        { sx = 27720, sy = 26220, sz = 30, ex = 27721, ey = 26222, ez = 30 },
        { sx = 27720, sy = 26280, sz = 30, ex = 27721, ey = 26282, ez = 30 },
        { sx = 27720, sy = 26340, sz = 30, ex = 27721, ey = 26342, ez = 30 },
    }
}

-- mvan92econoline (Base.fhq92EconolineXL, Base.fhq92EconolineXLPanel)
PRVIR.lots["mvan92econoline"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 27780, sy = 26160, sz = 0,  ex = 27781, ey = 26163, ez = 0  },
        { sx = 27780, sy = 26220, sz = 0,  ex = 27781, ey = 26223, ez = 0  },
        { sx = 27780, sy = 26280, sz = 0,  ex = 27781, ey = 26283, ez = 0  },
        { sx = 27780, sy = 26340, sz = 0,  ex = 27781, ey = 26343, ez = 0  },
        { sx = 27840, sy = 26160, sz = 0,  ex = 27841, ey = 26163, ez = 0  },
        { sx = 27840, sy = 26220, sz = 0,  ex = 27841, ey = 26223, ez = 0  },
        { sx = 27840, sy = 26280, sz = 0,  ex = 27841, ey = 26283, ez = 0  },
        { sx = 27840, sy = 26340, sz = 0,  ex = 27841, ey = 26343, ez = 0  },
        { sx = 27780, sy = 26160, sz = 30, ex = 27781, ey = 26163, ez = 30 },
        { sx = 27780, sy = 26220, sz = 30, ex = 27781, ey = 26223, ez = 30 },
        { sx = 27780, sy = 26280, sz = 30, ex = 27781, ey = 26283, ez = 30 },
        { sx = 27780, sy = 26340, sz = 30, ex = 27781, ey = 26343, ez = 30 },
        { sx = 27840, sy = 26160, sz = 30, ex = 27841, ey = 26163, ez = 30 },
        { sx = 27840, sy = 26220, sz = 30, ex = 27841, ey = 26223, ez = 30 },
        { sx = 27840, sy = 26280, sz = 30, ex = 27841, ey = 26283, ez = 30 },
        { sx = 27840, sy = 26340, sz = 30, ex = 27841, ey = 26343, ez = 30 },
    }
}

-- motoriusbus2 (Base.fhqB10M, Base.fhqB10M_Riv)
PRVIR.lots["motoriusbus2"] = {
    teleportOffset = { x = -1, y = 8 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 9,
    rooms = {
        { sx = 27960, sy = 26160, sz = 0, ex = 27962, ey = 26168, ez = 0 },
        { sx = 27960, sy = 26220, sz = 0, ex = 27962, ey = 26228, ez = 0 },
        { sx = 27960, sy = 26280, sz = 0, ex = 27962, ey = 26288, ez = 0 },
        { sx = 27960, sy = 26340, sz = 0, ex = 27962, ey = 26348, ez = 0 },
        { sx = 28020, sy = 26160, sz = 0, ex = 28022, ey = 26168, ez = 0 },
        { sx = 28020, sy = 26220, sz = 0, ex = 28022, ey = 26228, ez = 0 },
        { sx = 28020, sy = 26280, sz = 0, ex = 28022, ey = 26288, ez = 0 },
        { sx = 28020, sy = 26340, sz = 0, ex = 28022, ey = 26348, ez = 0 },
    }
}

-- fhq90SuzEvery (Base.fhq90SuzEvery)
PRVIR.lots["fhq90SuzEvery"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 27960, sy = 26160, sz = 30, ex = 27961, ey = 26161, ez = 30 },
        { sx = 27960, sy = 26220, sz = 30, ex = 27961, ey = 26221, ez = 30 },
        { sx = 27960, sy = 26280, sz = 30, ex = 27961, ey = 26281, ez = 30 },
        { sx = 27960, sy = 26340, sz = 30, ex = 27961, ey = 26341, ez = 30 },
    }
}

-- ki5ambulancemed (Base.86fordE150med)
PRVIR.lots["ki5ambulancemed"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26460, sy = 26160, sz = 0, ex = 26461, ey = 26162, ez = 0 },
        { sx = 26460, sy = 26220, sz = 0, ex = 26461, ey = 26222, ez = 0 },
        { sx = 26460, sy = 26280, sz = 0, ex = 26461, ey = 26282, ez = 0 },
        { sx = 26460, sy = 26340, sz = 0, ex = 26461, ey = 26342, ez = 0 },
        { sx = 26520, sy = 26160, sz = 0, ex = 26521, ey = 26162, ez = 0 },
        { sx = 26520, sy = 26220, sz = 0, ex = 26521, ey = 26222, ez = 0 },
        { sx = 26520, sy = 26280, sz = 0, ex = 26521, ey = 26282, ez = 0 },
    }
}

-- traileranimalhorsebox (Base.Trailer_Horsebox)
PRVIR.lots["traileranimalhorsebox"] = {
    teleportOffset = { x = 0, y = 3 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 27360, sy = 25860, sz = 0, ex = 27361, ey = 25863, ez = 0 },
        { sx = 27360, sy = 25920, sz = 0, ex = 27361, ey = 25923, ez = 0 },
        { sx = 27360, sy = 25980, sz = 0, ex = 27361, ey = 25983, ez = 0 },
        { sx = 27360, sy = 26040, sz = 0, ex = 27361, ey = 26043, ez = 0 },
    }
}

-- traileranimallivestock (Base.Trailer_Livestock)
PRVIR.lots["traileranimallivestock"] = {
    teleportOffset = { x = 0, y = 3 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 27420, sy = 25860, sz = 0, ex = 27422, ey = 25864, ez = 0 },
        { sx = 27420, sy = 25920, sz = 0, ex = 27422, ey = 25924, ez = 0 },
        { sx = 27420, sy = 25980, sz = 0, ex = 27422, ey = 25984, ez = 0 },
        { sx = 27420, sy = 26040, sz = 0, ex = 27422, ey = 26044, ez = 0 },
    }
}

-- CDClabor (Base.f700boxshellCDCSEV)
PRVIR.lots["CDClabor"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 8,
    rooms = {
        { sx = 28260, sy = 27060, sz = 0, ex = 28262, ey = 27067, ez = 0 },
        { sx = 28260, sy = 27120, sz = 0, ex = 28262, ey = 27127, ez = 0 },
        { sx = 28260, sy = 27180, sz = 0, ex = 28262, ey = 27187, ez = 0 },
        { sx = 28260, sy = 27240, sz = 0, ex = 28262, ey = 27247, ez = 0 },
    }
}

-- camptrailer2 (Base.Trailer87Scamp16)
PRVIR.lots["camptrailer2"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 28080, sy = 27360, sz = 0, ex = 28083, ey = 27364, ez = 0 },
        { sx = 28080, sy = 27420, sz = 0, ex = 28083, ey = 27424, ez = 0 },
        { sx = 28080, sy = 27480, sz = 0, ex = 28083, ey = 27484, ez = 0 },
        { sx = 28080, sy = 27540, sz = 0, ex = 28083, ey = 27544, ez = 0 },
        { sx = 28140, sy = 27360, sz = 0, ex = 28143, ey = 27364, ez = 0 },
        { sx = 28140, sy = 27420, sz = 0, ex = 28143, ey = 27424, ez = 0 },
        { sx = 28140, sy = 27480, sz = 0, ex = 28143, ey = 27484, ez = 0 },
        { sx = 28140, sy = 27540, sz = 0, ex = 28143, ey = 27544, ez = 0 },
    }
}

-- camptrailer (Base.Trailer87Scamp13)
PRVIR.lots["camptrailer"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 6,
    rooms = {
        { sx = 27960, sy = 27360, sz = 0, ex = 27963, ey = 27365, ez = 0 },
        { sx = 27960, sy = 27420, sz = 0, ex = 27963, ey = 27425, ez = 0 },
        { sx = 27960, sy = 27480, sz = 0, ex = 27963, ey = 27485, ez = 0 },
        { sx = 27960, sy = 27540, sz = 0, ex = 27963, ey = 27545, ez = 0 },
        { sx = 28020, sy = 27360, sz = 0, ex = 28023, ey = 27365, ez = 0 },
        { sx = 28020, sy = 27420, sz = 0, ex = 28023, ey = 27425, ez = 0 },
        { sx = 28020, sy = 27480, sz = 0, ex = 28023, ey = 27485, ez = 0 },
        { sx = 28020, sy = 27540, sz = 0, ex = 28023, ey = 27545, ez = 0 },
    }
}
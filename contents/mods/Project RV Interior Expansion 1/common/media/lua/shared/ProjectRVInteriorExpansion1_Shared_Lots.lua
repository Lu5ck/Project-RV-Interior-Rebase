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
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26158, sy = 25860, sz = 0, ex = 26160, ey = 25864, ez = 0 },
        { sx = 26158, sy = 25920, sz = 0, ex = 26160, ey = 25924, ez = 0 },
        { sx = 26158, sy = 25980, sz = 0, ex = 26160, ey = 25984, ez = 0 },
        { sx = 26158, sy = 26040, sz = 0, ex = 26160, ey = 26044, ez = 0 },
        { sx = 27058, sy = 26760, sz = 0, ex = 27060, ey = 26764, ez = 0 },
        { sx = 27058, sy = 26820, sz = 0, ex = 27060, ey = 26824, ez = 0 },
        { sx = 27058, sy = 26880, sz = 0, ex = 27060, ey = 26884, ez = 0 },
        { sx = 27058, sy = 26940, sz = 0, ex = 27060, ey = 26944, ez = 0 },
        { sx = 26758, sy = 27060, sz = 0, ex = 26760, ey = 27064, ez = 0 },
        { sx = 26758, sy = 27120, sz = 0, ex = 26760, ey = 27124, ez = 0 },
        { sx = 26758, sy = 27180, sz = 0, ex = 26760, ey = 27184, ez = 0 },
        { sx = 26758, sy = 27240, sz = 0, ex = 26760, ey = 27244, ez = 0 },
        { sx = 26818, sy = 27060, sz = 0, ex = 26820, ey = 27064, ez = 0 },
        { sx = 26818, sy = 27120, sz = 0, ex = 26820, ey = 27124, ez = 0 },
        { sx = 26818, sy = 27180, sz = 0, ex = 26820, ey = 27184, ez = 0 },
        { sx = 26818, sy = 27240, sz = 0, ex = 26820, ey = 27244, ez = 0 },
    }
}

-- Trailer2 (Base.TrailerKI5cargoMedium)
PRVIR.lots["Trailer2"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 26219, sy = 25860, sz = 0, ex = 26220, ey = 25863, ez = 0 },
        { sx = 26219, sy = 25920, sz = 0, ex = 26220, ey = 25923, ez = 0 },
        { sx = 26219, sy = 25980, sz = 0, ex = 26220, ey = 25983, ez = 0 },
        { sx = 26219, sy = 26040, sz = 0, ex = 26220, ey = 26043, ez = 0 },
        { sx = 27119, sy = 26760, sz = 0, ex = 27120, ey = 26763, ez = 0 },
        { sx = 27119, sy = 26820, sz = 0, ex = 27120, ey = 26823, ez = 0 },
        { sx = 27119, sy = 26880, sz = 0, ex = 27120, ey = 26883, ez = 0 },
        { sx = 27119, sy = 26940, sz = 0, ex = 27120, ey = 26943, ez = 0 },
        { sx = 26879, sy = 27060, sz = 0, ex = 26880, ey = 27063, ez = 0 },
        { sx = 26879, sy = 27120, sz = 0, ex = 26880, ey = 27123, ez = 0 },
        { sx = 26879, sy = 27180, sz = 0, ex = 26880, ey = 27183, ez = 0 },
        { sx = 26879, sy = 27240, sz = 0, ex = 26880, ey = 27243, ez = 0 },
        { sx = 26939, sy = 27060, sz = 0, ex = 26940, ey = 27063, ez = 0 },
        { sx = 26939, sy = 27120, sz = 0, ex = 26940, ey = 27123, ez = 0 },
        { sx = 26939, sy = 27180, sz = 0, ex = 26940, ey = 27183, ez = 0 },
        { sx = 26939, sy = 27240, sz = 0, ex = 26940, ey = 27243, ez = 0 },
    }
}

-- Trailer3 (Base.TrailerKI5cargoSmall)
PRVIR.lots["Trailer3"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 26279, sy = 25860, sz = 0, ex = 26280, ey = 25861, ez = 0 },
        { sx = 26279, sy = 25920, sz = 0, ex = 26280, ey = 25921, ez = 0 },
        { sx = 26279, sy = 25980, sz = 0, ex = 26280, ey = 25981, ez = 0 },
        { sx = 26279, sy = 26040, sz = 0, ex = 26280, ey = 26041, ez = 0 },
        { sx = 27179, sy = 26760, sz = 0, ex = 27180, ey = 26761, ez = 0 },
        { sx = 27179, sy = 26820, sz = 0, ex = 27180, ey = 26821, ez = 0 },
        { sx = 27179, sy = 26880, sz = 0, ex = 27180, ey = 26881, ez = 0 },
        { sx = 27179, sy = 26940, sz = 0, ex = 27180, ey = 26941, ez = 0 },
        { sx = 27059, sy = 27060, sz = 0, ex = 27060, ey = 27061, ez = 0 },
        { sx = 27059, sy = 27120, sz = 0, ex = 27060, ey = 27121, ez = 0 },
        { sx = 27059, sy = 27180, sz = 0, ex = 27060, ey = 27181, ez = 0 },
        { sx = 27059, sy = 27240, sz = 0, ex = 27060, ey = 27241, ez = 0 },
        { sx = 27119, sy = 27060, sz = 0, ex = 27120, ey = 27061, ez = 0 },
        { sx = 27119, sy = 27120, sz = 0, ex = 27120, ey = 27121, ez = 0 },
        { sx = 27119, sy = 27180, sz = 0, ex = 27120, ey = 27181, ez = 0 },
        { sx = 27119, sy = 27240, sz = 0, ex = 27120, ey = 27241, ez = 0 },
    }
}

-- Trailer4 (Base.TrailerKI5livestock)
PRVIR.lots["Trailer4"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 6,
    rooms = {
        { sx = 26338, sy = 25860, sz = 0, ex = 26340, ey = 25865, ez = 0 },
        { sx = 26338, sy = 25920, sz = 0, ex = 26340, ey = 25925, ez = 0 },
        { sx = 26338, sy = 25980, sz = 0, ex = 26340, ey = 25985, ez = 0 },
        { sx = 26338, sy = 26040, sz = 0, ex = 26340, ey = 26045, ez = 0 },
        { sx = 27238, sy = 26760, sz = 0, ex = 27240, ey = 26765, ez = 0 },
        { sx = 27238, sy = 26820, sz = 0, ex = 27240, ey = 26825, ez = 0 },
        { sx = 27238, sy = 26880, sz = 0, ex = 27240, ey = 26885, ez = 0 },
        { sx = 27238, sy = 26940, sz = 0, ex = 27240, ey = 26945, ez = 0 },
        { sx = 27178, sy = 27060, sz = 0, ex = 27180, ey = 27065, ez = 0 },
        { sx = 27178, sy = 27120, sz = 0, ex = 27180, ey = 27125, ez = 0 },
        { sx = 27178, sy = 27180, sz = 0, ex = 27180, ey = 27185, ez = 0 },
        { sx = 27178, sy = 27240, sz = 0, ex = 27180, ey = 27245, ez = 0 },
    }
}

-- Trailer5 (Base.TrailerHome, Base.TrailerHomeExplorer)
PRVIR.lots["Trailer5"] = {
    teleportOffset = { x = 3.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 26157, sy = 25860, sz = 30, ex = 26160, ey = 25864, ez = 30 },
        { sx = 26157, sy = 25920, sz = 30, ex = 26160, ey = 25924, ez = 30 },
        { sx = 26157, sy = 25980, sz = 30, ex = 26160, ey = 25984, ez = 30 },
        { sx = 26157, sy = 26040, sz = 30, ex = 26160, ey = 26044, ez = 30 },
        { sx = 26157, sy = 27360, sz = 0,  ex = 26160, ey = 27364, ez = 0  },
        { sx = 26157, sy = 27420, sz = 0,  ex = 26160, ey = 27424, ez = 0  },
        { sx = 26157, sy = 27480, sz = 0,  ex = 26160, ey = 27484, ez = 0  },
        { sx = 26157, sy = 27540, sz = 0,  ex = 26160, ey = 27544, ez = 0  },
        { sx = 26217, sy = 27360, sz = 0,  ex = 26220, ey = 27364, ez = 0  },
        { sx = 26217, sy = 27420, sz = 0,  ex = 26220, ey = 27424, ez = 0  },
        { sx = 26217, sy = 27480, sz = 0,  ex = 26220, ey = 27484, ez = 0  },
        { sx = 26217, sy = 27540, sz = 0,  ex = 26220, ey = 27544, ez = 0  },
        { sx = 26277, sy = 27360, sz = 0,  ex = 26280, ey = 27364, ez = 0  },
        { sx = 26277, sy = 27420, sz = 0,  ex = 26280, ey = 27424, ez = 0  },
        { sx = 26277, sy = 27480, sz = 0,  ex = 26280, ey = 27484, ez = 0  },
        { sx = 26277, sy = 27540, sz = 0,  ex = 26280, ey = 27544, ez = 0  },
        { sx = 26337, sy = 27360, sz = 0,  ex = 26340, ey = 27364, ez = 0  },
        { sx = 26337, sy = 27420, sz = 0,  ex = 26340, ey = 27424, ez = 0  },
        { sx = 26337, sy = 27480, sz = 0,  ex = 26340, ey = 27484, ez = 0  },
        { sx = 26337, sy = 27540, sz = 0,  ex = 26340, ey = 27544, ez = 0  },
    }
}

-- Trailer6 (Base.TrailerHomeHartman)
PRVIR.lots["Trailer6"] = {
    teleportOffset = { x = 3.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 26217, sy = 25860, sz = 30, ex = 26220, ey = 25864, ez = 30 },
        { sx = 26217, sy = 25920, sz = 30, ex = 26220, ey = 25924, ez = 30 },
        { sx = 26217, sy = 25980, sz = 30, ex = 26220, ey = 25984, ez = 30 },
        { sx = 26217, sy = 26040, sz = 30, ex = 26220, ey = 26044, ez = 30 },
    }
}

-- semitrailer (Base.SemiTrailerVan)
PRVIR.lots["semitrailer"] = {
    teleportOffset = { x = 3.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 12,
    rooms = {
        { sx = 26277, sy = 25860, sz = 30, ex = 26280, ey = 25871, ez = 30 },
        { sx = 26277, sy = 25920, sz = 30, ex = 26280, ey = 25931, ez = 30 },
        { sx = 26277, sy = 25980, sz = 30, ex = 26280, ey = 25991, ez = 30 },
        { sx = 26277, sy = 26040, sz = 30, ex = 26280, ey = 26051, ez = 30 },
        { sx = 27057, sy = 26460, sz = 0,  ex = 27060, ey = 26471, ez = 0  },
        { sx = 27057, sy = 26520, sz = 0,  ex = 27060, ey = 26531, ez = 0  },
        { sx = 27057, sy = 26580, sz = 0,  ex = 27060, ey = 26591, ez = 0  },
        { sx = 27057, sy = 26640, sz = 0,  ex = 27060, ey = 26651, ez = 0  },
        { sx = 26457, sy = 27360, sz = 0,  ex = 26460, ey = 27371, ez = 0  },
        { sx = 26457, sy = 27420, sz = 0,  ex = 26460, ey = 27431, ez = 0  },
        { sx = 26457, sy = 27480, sz = 0,  ex = 26460, ey = 27491, ez = 0  },
        { sx = 26457, sy = 27540, sz = 0,  ex = 26460, ey = 27551, ez = 0  },
        { sx = 26517, sy = 27360, sz = 0,  ex = 26520, ey = 27371, ez = 0  },
        { sx = 26517, sy = 27420, sz = 0,  ex = 26520, ey = 27431, ez = 0  },
        { sx = 26517, sy = 27480, sz = 0,  ex = 26520, ey = 27491, ez = 0  },
        { sx = 26517, sy = 27540, sz = 0,  ex = 26520, ey = 27551, ez = 0  },
    }
}

-- semitrailer2 (Base.SemiTrailerVanCattle)
PRVIR.lots["semitrailer2"] = {
    teleportOffset = { x = 3.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 12,
    rooms = {
        { sx = 26337, sy = 25860, sz = 30, ex = 26340, ey = 25871, ez = 30 },
        { sx = 26337, sy = 25920, sz = 30, ex = 26340, ey = 25931, ez = 30 },
        { sx = 26337, sy = 25980, sz = 30, ex = 26340, ey = 25991, ez = 30 },
        { sx = 26337, sy = 26040, sz = 30, ex = 26340, ey = 26051, ez = 30 },
        { sx = 27117, sy = 26460, sz = 0,  ex = 27120, ey = 26471, ez = 0  },
        { sx = 27117, sy = 26520, sz = 0,  ex = 27120, ey = 26531, ez = 0  },
        { sx = 27117, sy = 26580, sz = 0,  ex = 27120, ey = 26591, ez = 0  },
        { sx = 27117, sy = 26640, sz = 0,  ex = 27120, ey = 26651, ez = 0  },
        { sx = 26577, sy = 27360, sz = 0,  ex = 26580, ey = 27371, ez = 0  },
        { sx = 26577, sy = 27420, sz = 0,  ex = 26580, ey = 27431, ez = 0  },
        { sx = 26577, sy = 27480, sz = 0,  ex = 26580, ey = 27491, ez = 0  },
        { sx = 26577, sy = 27540, sz = 0,  ex = 26580, ey = 27551, ez = 0  },
    }
}

-- van1 (Base.1979rastrojeroFlete)
PRVIR.lots["van1"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26458, sy = 25860, sz = 0, ex = 26460, ey = 25863, ez = 0 },
        { sx = 26458, sy = 25920, sz = 0, ex = 26460, ey = 25923, ez = 0 },
        { sx = 26458, sy = 25980, sz = 0, ex = 26460, ey = 25983, ez = 0 },
        { sx = 26458, sy = 26040, sz = 0, ex = 26460, ey = 26043, ez = 0 },
    }
}

-- van2 (Base.1979rastrojeroCarni)
PRVIR.lots["van2"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26519, sy = 25860, sz = 0, ex = 26520, ey = 25862, ez = 0 },
        { sx = 26519, sy = 25920, sz = 0, ex = 26520, ey = 25922, ez = 0 },
        { sx = 26519, sy = 25980, sz = 0, ex = 26520, ey = 25982, ez = 0 },
        { sx = 26519, sy = 26040, sz = 0, ex = 26520, ey = 26042, ez = 0 },
    }
}

-- van3 (Base.VanATeam)
PRVIR.lots["van3"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26579, sy = 25860, sz = 0, ex = 26580, ey = 25862, ez = 0 },
        { sx = 26579, sy = 25920, sz = 0, ex = 26580, ey = 25922, ez = 0 },
        { sx = 26579, sy = 25980, sz = 0, ex = 26580, ey = 25982, ez = 0 },
        { sx = 26579, sy = 26040, sz = 0, ex = 26580, ey = 26042, ez = 0 },
    }
}

-- van4 (Base.Van_Azumanga)
PRVIR.lots["van4"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26639, sy = 25860, sz = 0, ex = 26640, ey = 25862, ez = 0 },
        { sx = 26639, sy = 25920, sz = 0, ex = 26640, ey = 25922, ez = 0 },
        { sx = 26639, sy = 25980, sz = 0, ex = 26640, ey = 25982, ez = 0 },
        { sx = 26639, sy = 26040, sz = 0, ex = 26640, ey = 26042, ez = 0 },
    }
}

-- van5 (Base.1992fiatFiorino, Base.1992fiatFiorinoArcor, Base.1992fiatFiorinoPan)
PRVIR.lots["van5"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26459, sy = 25860, sz = 30, ex = 26460, ey = 25862, ez = 30 },
        { sx = 26459, sy = 25920, sz = 30, ex = 26460, ey = 25922, ez = 30 },
        { sx = 26459, sy = 25980, sz = 30, ex = 26460, ey = 25982, ez = 30 },
        { sx = 26459, sy = 26040, sz = 30, ex = 26460, ey = 26042, ez = 30 },
        { sx = 26879, sy = 26760, sz = 0,  ex = 26880, ey = 26762, ez = 0  },
        { sx = 26879, sy = 26820, sz = 0,  ex = 26880, ey = 26822, ez = 0  },
        { sx = 26879, sy = 26880, sz = 0,  ex = 26880, ey = 26882, ez = 0  },
        { sx = 26879, sy = 26940, sz = 0,  ex = 26880, ey = 26942, ez = 0  },
    }
}

-- van6 (Base.StepVanIceCreamFreeze)
PRVIR.lots["van6"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26518, sy = 25860, sz = 30, ex = 26520, ey = 25863, ez = 30 },
        { sx = 26518, sy = 25920, sz = 30, ex = 26520, ey = 25923, ez = 30 },
        { sx = 26518, sy = 25980, sz = 30, ex = 26520, ey = 25983, ez = 30 },
        { sx = 26518, sy = 26040, sz = 30, ex = 26520, ey = 26043, ez = 30 },
    }
}

-- van7 (Base.VanJester)
PRVIR.lots["van7"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26578, sy = 25860, sz = 30, ex = 26580, ey = 25863, ez = 30 },
        { sx = 26578, sy = 25920, sz = 30, ex = 26580, ey = 25923, ez = 30 },
        { sx = 26578, sy = 25980, sz = 30, ex = 26580, ey = 25983, ez = 30 },
        { sx = 26578, sy = 26040, sz = 30, ex = 26580, ey = 26043, ez = 30 },
    }
}

-- van8 (Base.1990renaultTrafic variants)
PRVIR.lots["van8"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 26639, sy = 25860, sz = 30, ex = 26640, ey = 25863, ez = 30 },
        { sx = 26639, sy = 25920, sz = 30, ex = 26640, ey = 25923, ez = 30 },
        { sx = 26639, sy = 25980, sz = 30, ex = 26640, ey = 25983, ez = 30 },
        { sx = 26639, sy = 26040, sz = 30, ex = 26640, ey = 26043, ez = 30 },
        { sx = 26819, sy = 26760, sz = 0,  ex = 26820, ey = 26763, ez = 0  },
        { sx = 26819, sy = 26820, sz = 0,  ex = 26820, ey = 26823, ez = 0  },
        { sx = 26819, sy = 26880, sz = 0,  ex = 26820, ey = 26883, ez = 0  },
        { sx = 26819, sy = 26940, sz = 0,  ex = 26820, ey = 26943, ez = 0  },
    }
}

-- van9 (Base.uaz2206, Base.uaz2208)
PRVIR.lots["van9"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 26759, sy = 25860, sz = 0, ex = 26760, ey = 25863, ez = 0 },
        { sx = 26759, sy = 25920, sz = 0, ex = 26760, ey = 25923, ez = 0 },
        { sx = 26759, sy = 25980, sz = 0, ex = 26760, ey = 25983, ez = 0 },
        { sx = 26759, sy = 26040, sz = 0, ex = 26760, ey = 26043, ez = 0 },
    }
}

-- van10 (Base.VanLBK)
PRVIR.lots["van10"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26819, sy = 25860, sz = 0, ex = 26820, ey = 25862, ez = 0 },
        { sx = 26819, sy = 25920, sz = 0, ex = 26820, ey = 25922, ez = 0 },
        { sx = 26819, sy = 25980, sz = 0, ex = 26820, ey = 25982, ez = 0 },
        { sx = 26819, sy = 26040, sz = 0, ex = 26820, ey = 26042, ez = 0 },
    }
}

-- semibox (Base.SemiTruckBox)
PRVIR.lots["semibox"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8,
    rooms = {
        { sx = 26877, sy = 25860, sz = 0, ex = 26880, ey = 25867, ez = 0 },
        { sx = 26877, sy = 25920, sz = 0, ex = 26880, ey = 25927, ez = 0 },
        { sx = 26877, sy = 25980, sz = 0, ex = 26880, ey = 25987, ez = 0 },
        { sx = 26877, sy = 26040, sz = 0, ex = 26880, ey = 26047, ez = 0 },
        { sx = 26757, sy = 26160, sz = 0, ex = 26760, ey = 26167, ez = 0 },
        { sx = 26757, sy = 26220, sz = 0, ex = 26760, ey = 26227, ez = 0 },
        { sx = 26757, sy = 26280, sz = 0, ex = 26760, ey = 26287, ez = 0 },
        { sx = 26757, sy = 26340, sz = 0, ex = 26760, ey = 26347, ez = 0 },
        { sx = 27057, sy = 27360, sz = 0, ex = 27060, ey = 27367, ez = 0 },
        { sx = 27057, sy = 27420, sz = 0, ex = 27060, ey = 27427, ez = 0 },
        { sx = 27057, sy = 27480, sz = 0, ex = 27060, ey = 27487, ez = 0 },
        { sx = 27057, sy = 27540, sz = 0, ex = 27060, ey = 27547, ez = 0 },
        { sx = 27117, sy = 27360, sz = 0, ex = 27120, ey = 27367, ez = 0 },
        { sx = 27117, sy = 27420, sz = 0, ex = 27120, ey = 27427, ez = 0 },
        { sx = 27117, sy = 27480, sz = 0, ex = 27120, ey = 27487, ez = 0 },
        { sx = 27117, sy = 27540, sz = 0, ex = 27120, ey = 27547, ez = 0 },
    }
}

-- USPS (Base.USPSTruck)
PRVIR.lots["USPS"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 3,
    rooms = {
        { sx = 26938, sy = 25860, sz = 0, ex = 26940, ey = 25862, ez = 0 },
        { sx = 26938, sy = 25920, sz = 0, ex = 26940, ey = 25922, ez = 0 },
        { sx = 26938, sy = 25980, sz = 0, ex = 26940, ey = 25982, ez = 0 },
        { sx = 26938, sy = 26040, sz = 0, ex = 26940, ey = 26042, ez = 0 },
        { sx = 27178, sy = 27360, sz = 0, ex = 27180, ey = 27362, ez = 0 },
        { sx = 27178, sy = 27420, sz = 0, ex = 27180, ey = 27422, ez = 0 },
        { sx = 27178, sy = 27480, sz = 0, ex = 27180, ey = 27482, ez = 0 },
        { sx = 27178, sy = 27540, sz = 0, ex = 27180, ey = 27542, ez = 0 },
    }
}

-- FBI (Base.SpecialdivisionsTruckFlg, Base.SpecialdivisionsTruckFlg2)
PRVIR.lots["FBI"] = {
    teleportOffset = { x = 2.5, y = 1.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 7,
    rooms = {
        { sx = 26158, sy = 26160, sz = 0, ex = 26160, ey = 26166, ez = 0 },
        { sx = 26158, sy = 26220, sz = 0, ex = 26160, ey = 26226, ez = 0 },
        { sx = 26158, sy = 26280, sz = 0, ex = 26160, ey = 26286, ez = 0 },
        { sx = 26158, sy = 26340, sz = 0, ex = 26160, ey = 26346, ez = 0 },
    }
}

-- FBIbomb (Base.stepvanchevybOMBSQUAD, Base.stepvanchevyFBIBOMBSQUAD)
PRVIR.lots["FBIbomb"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26218, sy = 26160, sz = 0, ex = 26220, ey = 26164, ez = 0 },
        { sx = 26218, sy = 26220, sz = 0, ex = 26220, ey = 26224, ez = 0 },
        { sx = 26218, sy = 26280, sz = 0, ex = 26220, ey = 26284, ez = 0 },
        { sx = 26218, sy = 26340, sz = 0, ex = 26220, ey = 26344, ez = 0 },
    }
}

-- FBIf700bomb (Base.f700boxbombsquadLG)
PRVIR.lots["FBIf700bomb"] = {
    teleportOffset = { x = 1.5, y = 3.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8,
    rooms = {
        { sx = 26277, sy = 26160, sz = 0, ex = 26280, ey = 26167, ez = 0 },
        { sx = 26277, sy = 26220, sz = 0, ex = 26280, ey = 26227, ez = 0 },
        { sx = 26277, sy = 26280, sz = 0, ex = 26280, ey = 26287, ez = 0 },
        { sx = 26277, sy = 26340, sz = 0, ex = 26280, ey = 26347, ez = 0 },
    }
}

-- FBIhq2 (Base.86econolinervFBIMHQLG)
PRVIR.lots["FBIhq2"] = {
    teleportOffset = { x = 2.5, y = 2.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26338, sy = 26160, sz = 0, ex = 26340, ey = 26164, ez = 0 },
        { sx = 26338, sy = 26220, sz = 0, ex = 26340, ey = 26224, ez = 0 },
        { sx = 26338, sy = 26280, sz = 0, ex = 26340, ey = 26284, ez = 0 },
        { sx = 26338, sy = 26340, sz = 0, ex = 26340, ey = 26344, ez = 0 },
    }
}

-- FBIhazard2 (Base.86bounderHAzardmaterials)
PRVIR.lots["FBIhazard2"] = {
    teleportOffset = { x = 2.5, y = 6.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 8,
    rooms = {
        { sx = 26158, sy = 26160, sz = 30, ex = 26160, ey = 26167, ez = 30 },
        { sx = 26158, sy = 26220, sz = 30, ex = 26160, ey = 26227, ez = 30 },
        { sx = 26158, sy = 26280, sz = 30, ex = 26160, ey = 26287, ez = 30 },
        { sx = 26158, sy = 26340, sz = 30, ex = 26160, ey = 26347, ez = 30 },
    }
}

-- tstrailer (Base.TrailerTSMega)
PRVIR.lots["tstrailer"] = {
    teleportOffset = { x = 3.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 12,
    rooms = {
        { sx = 26757, sy = 25860, sz = 30, ex = 26760, ey = 25871, ez = 30 },
        { sx = 26757, sy = 25920, sz = 30, ex = 26760, ey = 25931, ez = 30 },
        { sx = 26757, sy = 25980, sz = 30, ex = 26760, ey = 25991, ez = 30 },
        { sx = 26757, sy = 26040, sz = 30, ex = 26760, ey = 26051, ez = 30 },
        { sx = 27057, sy = 26160, sz = 0,  ex = 27060, ey = 26171, ez = 0  },
        { sx = 27057, sy = 26220, sz = 0,  ex = 27060, ey = 26231, ez = 0  },
        { sx = 27057, sy = 26280, sz = 0,  ex = 27060, ey = 26291, ez = 0  },
        { sx = 27057, sy = 26340, sz = 0,  ex = 27060, ey = 26351, ez = 0  },
        { sx = 26757, sy = 26360, sz = 0,  ex = 26760, ey = 26371, ez = 0  },
        { sx = 26757, sy = 26420, sz = 0,  ex = 26760, ey = 26431, ez = 0  },
        { sx = 26757, sy = 26480, sz = 0,  ex = 26760, ey = 26491, ez = 0  },
        { sx = 26757, sy = 26540, sz = 0,  ex = 26760, ey = 26551, ez = 0  },
        { sx = 26817, sy = 27360, sz = 0,  ex = 26820, ey = 27371, ez = 0  },
        { sx = 26817, sy = 27420, sz = 0,  ex = 26820, ey = 27431, ez = 0  },
        { sx = 26817, sy = 27480, sz = 0,  ex = 26820, ey = 27491, ez = 0  },
        { sx = 26817, sy = 27540, sz = 0,  ex = 26820, ey = 27551, ez = 0  },
    }
}

-- tstraileranimal (Base.TrailerTSMegaAnimal)
PRVIR.lots["tstraileranimal"] = {
    teleportOffset = { x = 3.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26818, sy = 25860, sz = 30, ex = 26820, ey = 25863, ez = 30 },
        { sx = 26818, sy = 25920, sz = 30, ex = 26820, ey = 25923, ez = 30 },
        { sx = 26818, sy = 25980, sz = 30, ex = 26820, ey = 25983, ez = 30 },
        { sx = 26818, sy = 26040, sz = 30, ex = 26820, ey = 26043, ez = 30 },
        { sx = 27118, sy = 26160, sz = 0,  ex = 27120, ey = 26163, ez = 0  },
        { sx = 27118, sy = 26220, sz = 0,  ex = 27120, ey = 26223, ez = 0  },
        { sx = 27118, sy = 26280, sz = 0,  ex = 27120, ey = 26283, ez = 0  },
        { sx = 27118, sy = 26340, sz = 0,  ex = 27120, ey = 26343, ez = 0  },
        { sx = 26878, sy = 27360, sz = 0,  ex = 26880, ey = 27363, ez = 0  },
        { sx = 26878, sy = 27420, sz = 0,  ex = 26880, ey = 27423, ez = 0  },
        { sx = 26878, sy = 27480, sz = 0,  ex = 26880, ey = 27483, ez = 0  },
        { sx = 26878, sy = 27540, sz = 0,  ex = 26880, ey = 27543, ez = 0  },
    }
}

-- unimogtrailerr (Base.UnimogTrailer)
PRVIR.lots["unimogtrailerr"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 26878, sy = 25860, sz = 30, ex = 26880, ey = 25864, ez = 30 },
        { sx = 26878, sy = 25920, sz = 30, ex = 26880, ey = 25924, ez = 30 },
        { sx = 26878, sy = 25980, sz = 30, ex = 26880, ey = 25984, ez = 30 },
        { sx = 26878, sy = 26040, sz = 30, ex = 26880, ey = 26044, ez = 30 },
        { sx = 27358, sy = 27360, sz = 0,  ex = 27360, ey = 27364, ez = 0  },
        { sx = 27358, sy = 27420, sz = 0,  ex = 27360, ey = 27424, ez = 0  },
        { sx = 27358, sy = 27480, sz = 0,  ex = 27360, ey = 27484, ez = 0  },
        { sx = 27358, sy = 27540, sz = 0,  ex = 27360, ey = 27544, ez = 0  },
    }
}

-- atavanderumba (Base.ATA_VanDeRumba)
PRVIR.lots["atavanderumba"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26939, sy = 25860, sz = 30, ex = 26940, ey = 25862, ez = 30 },
        { sx = 26939, sy = 25920, sz = 30, ex = 26940, ey = 25922, ez = 30 },
        { sx = 26939, sy = 25980, sz = 30, ex = 26940, ey = 25982, ez = 30 },
        { sx = 26939, sy = 26040, sz = 30, ex = 26940, ey = 26042, ez = 30 },
    }
}

-- van (Base.BasicVan)
PRVIR.lots["van"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26459, sy = 26460, sz = 0, ex = 26460, ey = 26462, ez = 0 },
        { sx = 26459, sy = 26520, sz = 0, ex = 26460, ey = 26522, ez = 0 },
        { sx = 26459, sy = 26580, sz = 0, ex = 26460, ey = 26582, ez = 0 },
        { sx = 26459, sy = 26640, sz = 0, ex = 26460, ey = 26642, ez = 0 },
    }
}

-- ki5van (63Type2Van)
PRVIR.lots["ki5van"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 26159, sy = 26760, sz = 0, ex = 26160, ey = 26761, ez = 0 },
        { sx = 26159, sy = 26820, sz = 0, ex = 26160, ey = 26821, ez = 0 },
        { sx = 26159, sy = 26880, sz = 0, ex = 26160, ey = 26881, ez = 0 },
        { sx = 26159, sy = 26940, sz = 0, ex = 26160, ey = 26941, ez = 0 },
    }
}

-- ki5bus (Base.87fordB700school)
PRVIR.lots["ki5bus"] = {
    teleportOffset = { x = 1.5, y = 10.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 11,
    rooms = {
        { sx = 26217, sy = 26760, sz = 0, ex = 26220, ey = 26770, ez = 0 },
        { sx = 26217, sy = 26820, sz = 0, ex = 26220, ey = 26830, ez = 0 },
        { sx = 26217, sy = 26880, sz = 0, ex = 26220, ey = 26890, ez = 0 },
        { sx = 26217, sy = 26940, sz = 0, ex = 26220, ey = 26950, ez = 0 },
        { sx = 27657, sy = 27360, sz = 0, ex = 27660, ey = 27370, ez = 0 },
        { sx = 27657, sy = 27420, sz = 0, ex = 27660, ey = 27430, ez = 0 },
        { sx = 27657, sy = 27480, sz = 0, ex = 27660, ey = 27490, ez = 0 },
        { sx = 27657, sy = 27540, sz = 0, ex = 27660, ey = 27550, ez = 0 },
        { sx = 26277, sy = 27660, sz = 0, ex = 26280, ey = 27670, ez = 0 },
        { sx = 26277, sy = 27720, sz = 0, ex = 26280, ey = 27730, ez = 0 },
        { sx = 26277, sy = 27780, sz = 0, ex = 26280, ey = 27790, ez = 0 },
        { sx = 26277, sy = 27840, sz = 0, ex = 26280, ey = 27850, ez = 0 },
    }
}

-- ki5truck (Base.87fordF700box)
PRVIR.lots["ki5truck"] = {
    teleportOffset = { x = 0.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8,
    rooms = {
        { sx = 26277, sy = 26760, sz = 0, ex = 26280, ey = 26767, ez = 0 },
        { sx = 26277, sy = 26820, sz = 0, ex = 26280, ey = 26827, ez = 0 },
        { sx = 26277, sy = 26880, sz = 0, ex = 26280, ey = 26887, ez = 0 },
        { sx = 26277, sy = 26940, sz = 0, ex = 26280, ey = 26947, ez = 0 },
        { sx = 26937, sy = 26160, sz = 0, ex = 26940, ey = 26167, ez = 0 },
        { sx = 26937, sy = 26220, sz = 0, ex = 26940, ey = 26227, ez = 0 },
        { sx = 26937, sy = 26280, sz = 0, ex = 26940, ey = 26287, ez = 0 },
        { sx = 26937, sy = 26340, sz = 0, ex = 26940, ey = 26347, ez = 0 },
        { sx = 27177, sy = 26460, sz = 0, ex = 27180, ey = 26467, ez = 0 },
        { sx = 27177, sy = 26520, sz = 0, ex = 27180, ey = 26527, ez = 0 },
        { sx = 27417, sy = 27360, sz = 0, ex = 27420, ey = 27367, ez = 0 },
        { sx = 27417, sy = 27420, sz = 0, ex = 27420, ey = 27427, ez = 0 },
        { sx = 27417, sy = 27480, sz = 0, ex = 27420, ey = 27487, ez = 0 },
        { sx = 27417, sy = 27540, sz = 0, ex = 27420, ey = 27547, ez = 0 },
        { sx = 26157, sy = 27660, sz = 0, ex = 26160, ey = 27667, ez = 0 },
        { sx = 26157, sy = 27720, sz = 0, ex = 26160, ey = 27727, ez = 0 },
        { sx = 26157, sy = 27780, sz = 0, ex = 26160, ey = 27787, ez = 0 },
        { sx = 26157, sy = 27840, sz = 0, ex = 26160, ey = 27847, ez = 0 },
        { sx = 26217, sy = 27660, sz = 0, ex = 26220, ey = 27667, ez = 0 },
        { sx = 26217, sy = 27720, sz = 0, ex = 26220, ey = 27727, ez = 0 },
        { sx = 26217, sy = 27780, sz = 0, ex = 26220, ey = 27787, ez = 0 },
        { sx = 26217, sy = 27840, sz = 0, ex = 26220, ey = 27847, ez = 0 },
    }
}

-- ki5swat (Base.87fordF700swat)
PRVIR.lots["ki5swat"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26758, sy = 26460, sz = 30, ex = 26760, ey = 26463, ez = 30 },
        { sx = 26758, sy = 26520, sz = 30, ex = 26760, ey = 26523, ez = 30 },
        { sx = 26758, sy = 26580, sz = 30, ex = 26760, ey = 26583, ez = 30 },
        { sx = 26758, sy = 26640, sz = 30, ex = 26760, ey = 26643, ez = 30 },
    }
}

-- ki5stepvan (Base.85chevyStepVan variants)
PRVIR.lots["ki5stepvan"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26338, sy = 26760, sz = 0, ex = 26340, ey = 26763, ez = 0 },
        { sx = 26338, sy = 26820, sz = 0, ex = 26340, ey = 26823, ez = 0 },
        { sx = 26338, sy = 26880, sz = 0, ex = 26340, ey = 26883, ez = 0 },
        { sx = 26338, sy = 26940, sz = 0, ex = 26340, ey = 26943, ez = 0 },
        { sx = 26758, sy = 26760, sz = 0, ex = 26760, ey = 26763, ez = 0 },
        { sx = 26758, sy = 26820, sz = 0, ex = 26760, ey = 26823, ez = 0 },
        { sx = 26758, sy = 26880, sz = 0, ex = 26760, ey = 26883, ez = 0 },
        { sx = 26758, sy = 26940, sz = 0, ex = 26760, ey = 26943, ez = 0 },
        { sx = 26578, sy = 26460, sz = 0, ex = 26580, ey = 26463, ez = 0 },
        { sx = 26578, sy = 26520, sz = 0, ex = 26580, ey = 26523, ez = 0 },
        { sx = 26578, sy = 26580, sz = 0, ex = 26580, ey = 26583, ez = 0 },
        { sx = 26578, sy = 26640, sz = 0, ex = 26580, ey = 26643, ez = 0 },
    }
}

-- ki590fordambu (Base.90fordF350ambulance)
PRVIR.lots["ki590fordambu"] = {
    teleportOffset = { x = 1.5, y = 2.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 3,
    rooms = {
        { sx = 26158, sy = 26760, sz = 30, ex = 26160, ey = 26762, ez = 30 },
        { sx = 26158, sy = 26820, sz = 30, ex = 26160, ey = 26822, ez = 30 },
        { sx = 26158, sy = 26880, sz = 30, ex = 26160, ey = 26882, ez = 30 },
        { sx = 26158, sy = 26940, sz = 30, ex = 26160, ey = 26942, ez = 30 },
        { sx = 26938, sy = 26460, sz = 0,  ex = 26940, ey = 26462, ez = 0  },
        { sx = 26938, sy = 26520, sz = 0,  ex = 26940, ey = 26522, ez = 0  },
        { sx = 26938, sy = 26580, sz = 0,  ex = 26940, ey = 26582, ez = 0  },
        { sx = 26938, sy = 26640, sz = 0,  ex = 26940, ey = 26642, ez = 0  },
    }
}

-- ki586ford (Base.86fordE150 variants)
PRVIR.lots["ki586ford"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26219, sy = 26760, sz = 30, ex = 26220, ey = 26762, ez = 30 },
        { sx = 26219, sy = 26820, sz = 30, ex = 26220, ey = 26822, ez = 30 },
        { sx = 26219, sy = 26880, sz = 30, ex = 26220, ey = 26882, ez = 30 },
        { sx = 26219, sy = 26940, sz = 30, ex = 26220, ey = 26942, ez = 30 },
        { sx = 26459, sy = 26760, sz = 0,  ex = 26460, ey = 26762, ez = 0  },
        { sx = 26459, sy = 26820, sz = 0,  ex = 26460, ey = 26822, ez = 0  },
        { sx = 26459, sy = 26880, sz = 0,  ex = 26460, ey = 26882, ez = 0  },
        { sx = 26459, sy = 26940, sz = 0,  ex = 26460, ey = 26942, ez = 0  },
        { sx = 26519, sy = 26760, sz = 0,  ex = 26520, ey = 26762, ez = 0  },
        { sx = 26519, sy = 26820, sz = 0,  ex = 26520, ey = 26822, ez = 0  },
        { sx = 26519, sy = 26880, sz = 0,  ex = 26520, ey = 26882, ez = 0  },
        { sx = 26519, sy = 26940, sz = 0,  ex = 26520, ey = 26942, ez = 0  },
        { sx = 26579, sy = 26760, sz = 0,  ex = 26580, ey = 26762, ez = 0  },
        { sx = 26579, sy = 26820, sz = 0,  ex = 26580, ey = 26822, ez = 0  },
        { sx = 26579, sy = 26880, sz = 0,  ex = 26580, ey = 26882, ez = 0  },
        { sx = 26579, sy = 26940, sz = 0,  ex = 26580, ey = 26942, ez = 0  },
        { sx = 26459, sy = 27060, sz = 0,  ex = 26460, ey = 27062, ez = 0  },
        { sx = 26459, sy = 27120, sz = 0,  ex = 26460, ey = 27122, ez = 0  },
        { sx = 26459, sy = 27180, sz = 0,  ex = 26460, ey = 27182, ez = 0  },
        { sx = 26459, sy = 27240, sz = 0,  ex = 26460, ey = 27242, ez = 0  },
        { sx = 26519, sy = 27060, sz = 0,  ex = 26520, ey = 27062, ez = 0  },
        { sx = 26519, sy = 27120, sz = 0,  ex = 26520, ey = 27122, ez = 0  },
        { sx = 26519, sy = 27180, sz = 0,  ex = 26520, ey = 27182, ez = 0  },
        { sx = 26519, sy = 27240, sz = 0,  ex = 26520, ey = 27242, ez = 0  },
    }
}

-- ki5cf800 (Base.93fordElgin, Base.93fordElginSpec)
PRVIR.lots["ki5cf800"] = {
    teleportOffset = { x = 2.5  , y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 2,
    rooms = {
        { sx = 26278, sy = 26760, sz = 30, ex = 26280, ey = 26761, ez = 30 },
        { sx = 26278, sy = 26820, sz = 30, ex = 26280, ey = 26821, ez = 30 },
        { sx = 26278, sy = 26880, sz = 30, ex = 26280, ey = 26881, ez = 30 },
        { sx = 26278, sy = 26940, sz = 30, ex = 26280, ey = 26941, ez = 30 },
    }
}

-- ki5container (Base.isoContainer2, Base.isoContainer4, Base.isoContainer5)
PRVIR.lots["ki5container"] = {
    teleportOffset = { x = 2.5, y = 6.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 7,
    rooms = {
        { sx = 26338, sy = 26760, sz = 30, ex = 26340, ey = 26766, ez = 30 },
        { sx = 26338, sy = 26820, sz = 30, ex = 26340, ey = 26826, ez = 30 },
        { sx = 26338, sy = 26880, sz = 30, ex = 26340, ey = 26886, ez = 30 },
        { sx = 26338, sy = 26940, sz = 30, ex = 26340, ey = 26946, ez = 30 },
        { sx = 26938, sy = 26760, sz = 0,  ex = 26940, ey = 26766, ez = 0  },
        { sx = 26938, sy = 26820, sz = 0,  ex = 26940, ey = 26826, ez = 0  },
        { sx = 26938, sy = 26880, sz = 0,  ex = 26940, ey = 26886, ez = 0  },
        { sx = 26938, sy = 26940, sz = 0,  ex = 26940, ey = 26946, ez = 0  },
    }
}

-- scooby (Base.VanMysteryMachine)
PRVIR.lots["scooby"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26519, sy = 26460, sz = 0, ex = 26520, ey = 26462, ez = 0 },
        { sx = 26519, sy = 26520, sz = 0, ex = 26520, ey = 26522, ez = 0 },
        { sx = 26519, sy = 26580, sz = 0, ex = 26520, ey = 26582, ez = 0 },
        { sx = 26519, sy = 26640, sz = 0, ex = 26520, ey = 26642, ez = 0 },
    }
}

-- tsarbus (Base.ATAApocalypseBus)
PRVIR.lots["tsarbus"] = {
    teleportOffset = { x = 1.5, y = 8.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 9,
    rooms = {
        { sx = 26757, sy = 26460, sz = 0, ex = 26760, ey = 26468, ez = 0 },
        { sx = 26757, sy = 26520, sz = 0, ex = 26760, ey = 26528, ez = 0 },
        { sx = 26757, sy = 26580, sz = 0, ex = 26760, ey = 26588, ez = 0 },
        { sx = 26757, sy = 26640, sz = 0, ex = 26760, ey = 26648, ez = 0 },
        { sx = 26157, sy = 27060, sz = 0, ex = 26160, ey = 27068, ez = 0 },
        { sx = 26157, sy = 27120, sz = 0, ex = 26160, ey = 27128, ez = 0 },
        { sx = 26157, sy = 27180, sz = 0, ex = 26160, ey = 27188, ez = 0 },
        { sx = 26157, sy = 27240, sz = 0, ex = 26160, ey = 27248, ez = 0 },
    }
}

-- tsarbus2 (Base.ATASchoolBus)
PRVIR.lots["tsarbus2"] = {
    teleportOffset = { x = 1.5, y = 8.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 9,
    rooms = {
        { sx = 26817, sy = 26460, sz = 0, ex = 26820, ey = 26468, ez = 0 },
        { sx = 26817, sy = 26520, sz = 0, ex = 26820, ey = 26528, ez = 0 },
        { sx = 26817, sy = 26580, sz = 0, ex = 26820, ey = 26588, ez = 0 },
        { sx = 26817, sy = 26640, sz = 0, ex = 26820, ey = 26648, ez = 0 },
        { sx = 26217, sy = 27060, sz = 0, ex = 26220, ey = 27068, ez = 0 },
        { sx = 26217, sy = 27120, sz = 0, ex = 26220, ey = 27128, ez = 0 },
        { sx = 26217, sy = 27180, sz = 0, ex = 26220, ey = 27188, ez = 0 },
        { sx = 26217, sy = 27240, sz = 0, ex = 26220, ey = 27248, ez = 0 },
    }
}

-- amazomvan (Base.aMOOzonVan)
PRVIR.lots["amazomvan"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 26878, sy = 26460, sz = 0, ex = 26880, ey = 26463, ez = 0 },
        { sx = 26878, sy = 26520, sz = 0, ex = 26880, ey = 26523, ez = 0 },
        { sx = 26878, sy = 26580, sz = 0, ex = 26880, ey = 26583, ez = 0 },
        { sx = 26878, sy = 26640, sz = 0, ex = 26880, ey = 26643, ez = 0 },
    }
}

-- Vanillastepvan (Base.StepVan variants)
PRVIR.lots["Vanillastepvan"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27358, sy = 26160, sz = 0, ex = 27360, ey = 26163, ez = 0 },
        { sx = 27358, sy = 26220, sz = 0, ex = 27360, ey = 26223, ez = 0 },
        { sx = 27358, sy = 26280, sz = 0, ex = 27360, ey = 26283, ez = 0 },
        { sx = 27358, sy = 26340, sz = 0, ex = 27360, ey = 26343, ez = 0 },
        { sx = 27418, sy = 26160, sz = 0, ex = 27420, ey = 26163, ez = 0 },
        { sx = 27418, sy = 26220, sz = 0, ex = 27420, ey = 26223, ez = 0 },
        { sx = 27418, sy = 26280, sz = 0, ex = 27420, ey = 26283, ez = 0 },
        { sx = 27418, sy = 26340, sz = 0, ex = 27420, ey = 26343, ez = 0 },
        { sx = 27478, sy = 26160, sz = 0, ex = 27480, ey = 26163, ez = 0 },
        { sx = 27478, sy = 26220, sz = 0, ex = 27480, ey = 26223, ez = 0 },
        { sx = 27478, sy = 26280, sz = 0, ex = 27480, ey = 26283, ez = 0 },
        { sx = 27478, sy = 26340, sz = 0, ex = 27480, ey = 26343, ez = 0 },
        { sx = 27538, sy = 26160, sz = 0, ex = 27540, ey = 26163, ez = 0 },
        { sx = 27538, sy = 26220, sz = 0, ex = 27540, ey = 26223, ez = 0 },
        { sx = 27958, sy = 26760, sz = 0, ex = 27960, ey = 26763, ez = 0 },
        { sx = 27958, sy = 26820, sz = 0, ex = 27960, ey = 26823, ez = 0 },
        { sx = 27958, sy = 26880, sz = 0, ex = 27960, ey = 26883, ez = 0 },
        { sx = 27958, sy = 26940, sz = 0, ex = 27960, ey = 26943, ez = 0 },
        { sx = 28018, sy = 26760, sz = 0, ex = 28020, ey = 26763, ez = 0 },
        { sx = 28018, sy = 26820, sz = 0, ex = 28020, ey = 26823, ez = 0 },
        { sx = 28018, sy = 26880, sz = 0, ex = 28020, ey = 26883, ez = 0 },
        { sx = 28018, sy = 26940, sz = 0, ex = 28020, ey = 26943, ez = 0 },
    }
}

-- Vanillastepvanmail (Base.StepVanMail)
PRVIR.lots["Vanillastepvanmail"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27358, sy = 26460, sz = 0, ex = 27360, ey = 26463, ez = 0 },
        { sx = 27358, sy = 26520, sz = 0, ex = 27360, ey = 26523, ez = 0 },
        { sx = 27358, sy = 26580, sz = 0, ex = 27360, ey = 26583, ez = 0 },
        { sx = 27358, sy = 26640, sz = 0, ex = 27360, ey = 26643, ez = 0 },
    }
}

-- Vanillastepswat (Base.StepVan_LouisvilleSWAT)
PRVIR.lots["Vanillastepswat"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27418, sy = 26460, sz = 0, ex = 27420, ey = 26463, ez = 0 },
        { sx = 27418, sy = 26520, sz = 0, ex = 27420, ey = 26523, ez = 0 },
        { sx = 27418, sy = 26580, sz = 0, ex = 27420, ey = 26583, ez = 0 },
        { sx = 27418, sy = 26640, sz = 0, ex = 27420, ey = 26643, ez = 0 },
    }
}

-- Vanillastepplonkies (Base.StepVan_Plonkies)
PRVIR.lots["Vanillastepplonkies"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27478, sy = 26460, sz = 0, ex = 27480, ey = 26463, ez = 0 },
        { sx = 27478, sy = 26520, sz = 0, ex = 27480, ey = 26523, ez = 0 },
        { sx = 27478, sy = 26580, sz = 0, ex = 27480, ey = 26583, ez = 0 },
        { sx = 27478, sy = 26640, sz = 0, ex = 27480, ey = 26643, ez = 0 },
    }
}

-- Vanillastepscarlet (Base.StepVan_Scarlet)
PRVIR.lots["Vanillastepscarlet"] = {
    teleportOffset = { x = 2.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 27538, sy = 26460, sz = 0, ex = 27540, ey = 26463, ez = 0 },
        { sx = 27538, sy = 26520, sz = 0, ex = 27540, ey = 26523, ez = 0 },
        { sx = 27538, sy = 26580, sz = 0, ex = 27540, ey = 26583, ez = 0 },
        { sx = 27538, sy = 26640, sz = 0, ex = 27540, ey = 26643, ez = 0 },
    }
}

-- vanillavan (Base.Van and many variants)
PRVIR.lots["vanillavan"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 27659, sy = 26760, sz = 0, ex = 27660, ey = 26762, ez = 0 },
        { sx = 27659, sy = 26820, sz = 0, ex = 27660, ey = 26822, ez = 0 },
        { sx = 27659, sy = 26880, sz = 0, ex = 27660, ey = 26882, ez = 0 },
        { sx = 27659, sy = 26940, sz = 0, ex = 27660, ey = 26942, ez = 0 },
        { sx = 27719, sy = 26760, sz = 0, ex = 27720, ey = 26762, ez = 0 },
        { sx = 27719, sy = 26820, sz = 0, ex = 27720, ey = 26822, ez = 0 },
        { sx = 27719, sy = 26880, sz = 0, ex = 27720, ey = 26882, ez = 0 },
        { sx = 27719, sy = 26940, sz = 0, ex = 27720, ey = 26942, ez = 0 },
        { sx = 27779, sy = 26760, sz = 0, ex = 27780, ey = 26762, ez = 0 },
        { sx = 27779, sy = 26820, sz = 0, ex = 27780, ey = 26822, ez = 0 },
        { sx = 27779, sy = 26880, sz = 0, ex = 27780, ey = 26882, ez = 0 },
        { sx = 27779, sy = 26940, sz = 0, ex = 27780, ey = 26942, ez = 0 },
        { sx = 27839, sy = 26760, sz = 0, ex = 27840, ey = 26762, ez = 0 },
        { sx = 27839, sy = 26820, sz = 0, ex = 27840, ey = 26822, ez = 0 },
        { sx = 27839, sy = 26880, sz = 0, ex = 27840, ey = 26882, ez = 0 },
        { sx = 27839, sy = 26940, sz = 0, ex = 27840, ey = 26942, ez = 0 },
        { sx = 27659, sy = 27060, sz = 0, ex = 27660, ey = 27062, ez = 0 },
        { sx = 27659, sy = 27120, sz = 0, ex = 27660, ey = 27122, ez = 0 },
        { sx = 27659, sy = 27180, sz = 0, ex = 27660, ey = 27182, ez = 0 },
        { sx = 27659, sy = 27240, sz = 0, ex = 27660, ey = 27242, ez = 0 },
        { sx = 27719, sy = 27060, sz = 0, ex = 27720, ey = 27062, ez = 0 },
        { sx = 27719, sy = 27120, sz = 0, ex = 27720, ey = 27122, ez = 0 },
        { sx = 27719, sy = 27180, sz = 0, ex = 27720, ey = 27182, ez = 0 },
        { sx = 27719, sy = 27240, sz = 0, ex = 27720, ey = 27242, ez = 0 },
        { sx = 27779, sy = 27060, sz = 0, ex = 27780, ey = 27062, ez = 0 },
        { sx = 27779, sy = 27120, sz = 0, ex = 27780, ey = 27122, ez = 0 },
        { sx = 27779, sy = 27180, sz = 0, ex = 27780, ey = 27182, ez = 0 },
        { sx = 27779, sy = 27240, sz = 0, ex = 27780, ey = 27242, ez = 0 },
    }
}

-- Vanambulance (Base.VanAmbulance)
PRVIR.lots["Vanambulance"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28259, sy = 26460, sz = 0, ex = 28260, ey = 26462, ez = 0 },
        { sx = 28259, sy = 26520, sz = 0, ex = 28260, ey = 26522, ez = 0 },
        { sx = 28259, sy = 26580, sz = 0, ex = 28260, ey = 26582, ez = 0 },
        { sx = 28259, sy = 26640, sz = 0, ex = 28260, ey = 26642, ez = 0 },
        { sx = 28319, sy = 26460, sz = 0, ex = 28320, ey = 26462, ez = 0 },
        { sx = 28319, sy = 26520, sz = 0, ex = 28320, ey = 26522, ez = 0 },
        { sx = 28319, sy = 26580, sz = 0, ex = 28320, ey = 26582, ez = 0 },
        { sx = 28319, sy = 26640, sz = 0, ex = 28320, ey = 26642, ez = 0 },
    }
}

-- VanMAIL3 (Base.VanMail)
PRVIR.lots["VanMAIL3"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28439, sy = 26460, sz = 0, ex = 28440, ey = 26462, ez = 0 },
        { sx = 28439, sy = 26520, sz = 0, ex = 28440, ey = 26522, ez = 0 },
        { sx = 28439, sy = 26580, sz = 0, ex = 28440, ey = 26582, ez = 0 },
        { sx = 28439, sy = 26640, sz = 0, ex = 28440, ey = 26642, ez = 0 },
    }
}

-- VanRADIO (Base.VanRadio, Base.VanRadio_3N)
PRVIR.lots["VanRADIO"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28259, sy = 26460, sz = 30, ex = 28260, ey = 26462, ez = 30 },
        { sx = 28259, sy = 26520, sz = 30, ex = 28260, ey = 26522, ez = 30 },
        { sx = 28259, sy = 26580, sz = 30, ex = 28260, ey = 26582, ez = 30 },
        { sx = 28259, sy = 26640, sz = 30, ex = 28260, ey = 26642, ez = 30 },
    }
}

-- VanaSPIFFO2 (Base.VanSpiffo)
PRVIR.lots["VanaSPIFFO2"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28379, sy = 26460, sz = 30, ex = 28380, ey = 26462, ez = 30 },
        { sx = 28379, sy = 26520, sz = 30, ex = 28380, ey = 26522, ez = 30 },
        { sx = 28379, sy = 26580, sz = 30, ex = 28380, ey = 26582, ez = 30 },
        { sx = 28379, sy = 26640, sz = 30, ex = 28380, ey = 26642, ez = 30 },
    }
}

-- Vanbeerrr (Base.Van_Charlemange_Beer, Base.Van_KnoxDisti)
PRVIR.lots["Vanbeerrr"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28379, sy = 26460, sz = 0, ex = 28380, ey = 26462, ez = 0 },
        { sx = 28379, sy = 26520, sz = 0, ex = 28380, ey = 26522, ez = 0 },
        { sx = 28379, sy = 26580, sz = 0, ex = 28380, ey = 26582, ez = 0 },
        { sx = 28379, sy = 26640, sz = 0, ex = 28380, ey = 26642, ez = 0 },
    }
}

-- Vanampotato (Base.Van_Perfick_Potato)
PRVIR.lots["Vanampotato"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28319, sy = 26460, sz = 30, ex = 28320, ey = 26462, ez = 30 },
        { sx = 28319, sy = 26520, sz = 30, ex = 28320, ey = 26522, ez = 30 },
        { sx = 28319, sy = 26580, sz = 30, ex = 28320, ey = 26582, ez = 30 },
        { sx = 28319, sy = 26640, sz = 30, ex = 28320, ey = 26642, ez = 30 },
    }
}

-- 73winne (Base.73Winnebago)
PRVIR.lots["73winne"] = {
    teleportOffset = { x = 1.5, y = 5.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 6,
    rooms = {
        { sx = 28258, sy = 26760, sz = 0, ex = 28260, ey = 26765, ez = 0 },
        { sx = 28258, sy = 26820, sz = 0, ex = 28260, ey = 26825, ez = 0 },
        { sx = 28258, sy = 26880, sz = 0, ex = 28260, ey = 26885, ez = 0 },
        { sx = 28258, sy = 26940, sz = 0, ex = 28260, ey = 26945, ez = 0 },
        { sx = 28318, sy = 26760, sz = 0, ex = 28320, ey = 26765, ez = 0 },
        { sx = 28318, sy = 26820, sz = 0, ex = 28320, ey = 26825, ez = 0 },
    }
}

-- 89defender (Base.89defender variants)
PRVIR.lots["89defender"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 26159, sy = 26460, sz = 0, ex = 26160, ey = 26461, ez = 0 },
        { sx = 26159, sy = 26520, sz = 0, ex = 26160, ey = 26521, ez = 0 },
        { sx = 26159, sy = 26580, sz = 0, ex = 26160, ey = 26581, ez = 0 },
        { sx = 26159, sy = 26640, sz = 0, ex = 26160, ey = 26641, ez = 0 },
        { sx = 26219, sy = 26460, sz = 0, ex = 26220, ey = 26461, ez = 0 },
        { sx = 26219, sy = 26520, sz = 0, ex = 26220, ey = 26521, ez = 0 },
        { sx = 26219, sy = 26580, sz = 0, ex = 26220, ey = 26581, ez = 0 },
        { sx = 26219, sy = 26640, sz = 0, ex = 26220, ey = 26641, ez = 0 },
    }
}

-- motoriusambulance (Base.fhq92EconolineAmbulance variants)
PRVIR.lots["motoriusambulance"] = {
    teleportOffset = { x = 0.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 27659, sy = 26460, sz = 0, ex = 27660, ey = 26462, ez = 0 },
        { sx = 27659, sy = 26520, sz = 0, ex = 27660, ey = 26522, ez = 0 },
        { sx = 27659, sy = 26580, sz = 0, ex = 27660, ey = 26582, ez = 0 },
        { sx = 27659, sy = 26640, sz = 0, ex = 27660, ey = 26642, ez = 0 },
        { sx = 27719, sy = 26460, sz = 0, ex = 27720, ey = 26462, ez = 0 },
        { sx = 27719, sy = 26520, sz = 0, ex = 27720, ey = 26522, ez = 0 },
        { sx = 27719, sy = 26580, sz = 0, ex = 27720, ey = 26582, ez = 0 },
        { sx = 27719, sy = 26640, sz = 0, ex = 27720, ey = 26642, ez = 0 },
    }
}

-- motoriusambulance2 (Base.fhq92EconolineT3Ambulance)
PRVIR.lots["motoriusambulance2"] = {
    teleportOffset = { x = 1.5, y = 2.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 3,
    rooms = {
        { sx = 27778, sy = 26460, sz = 0, ex = 27780, ey = 26462, ez = 0 },
        { sx = 27778, sy = 26520, sz = 0, ex = 27780, ey = 26522, ez = 0 },
        { sx = 27778, sy = 26580, sz = 0, ex = 27780, ey = 26582, ez = 0 },
        { sx = 27778, sy = 26640, sz = 0, ex = 27780, ey = 26642, ez = 0 },
        { sx = 27838, sy = 26460, sz = 0, ex = 27840, ey = 26462, ez = 0 },
        { sx = 27838, sy = 26520, sz = 0, ex = 27840, ey = 26522, ez = 0 },
        { sx = 27838, sy = 26580, sz = 0, ex = 27840, ey = 26582, ez = 0 },
        { sx = 27838, sy = 26640, sz = 0, ex = 27840, ey = 26642, ez = 0 },
    }
}

-- VWT2T1 (Base.fhqVWT2T1, Base.fhqVWT2T1Livery)
PRVIR.lots["VWT2T1"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 28079, sy = 26160, sz = 0, ex = 28080, ey = 26162, ez = 0 },
        { sx = 28079, sy = 26220, sz = 0, ex = 28080, ey = 26222, ez = 0 },
        { sx = 28079, sy = 26280, sz = 0, ex = 28080, ey = 26282, ez = 0 },
        { sx = 28079, sy = 26340, sz = 0, ex = 28080, ey = 26342, ez = 0 },
        { sx = 28139, sy = 26160, sz = 0, ex = 28140, ey = 26162, ez = 0 },
        { sx = 28139, sy = 26220, sz = 0, ex = 28140, ey = 26222, ez = 0 },
        { sx = 28139, sy = 26280, sz = 0, ex = 28140, ey = 26282, ez = 0 },
        { sx = 28139, sy = 26340, sz = 0, ex = 28140, ey = 26342, ez = 0 },
    }
}

-- mvan92econolinenormalvans (Base.fhq92Econoline variants)
PRVIR.lots["mvan92econolinenormalvans"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 27659, sy = 26160, sz = 0,  ex = 27660, ey = 26162, ez = 0  },
        { sx = 27659, sy = 26220, sz = 0,  ex = 27660, ey = 26222, ez = 0  },
        { sx = 27659, sy = 26280, sz = 0,  ex = 27660, ey = 26282, ez = 0  },
        { sx = 27659, sy = 26340, sz = 0,  ex = 27660, ey = 26342, ez = 0  },
        { sx = 27719, sy = 26160, sz = 0,  ex = 27720, ey = 26162, ez = 0  },
        { sx = 27719, sy = 26220, sz = 0,  ex = 27720, ey = 26222, ez = 0  },
        { sx = 27719, sy = 26280, sz = 0,  ex = 27720, ey = 26282, ez = 0  },
        { sx = 27719, sy = 26340, sz = 0,  ex = 27720, ey = 26342, ez = 0  },
        { sx = 27659, sy = 26160, sz = 30, ex = 27660, ey = 26162, ez = 30 },
        { sx = 27659, sy = 26220, sz = 30, ex = 27660, ey = 26222, ez = 30 },
        { sx = 27659, sy = 26280, sz = 30, ex = 27660, ey = 26282, ez = 30 },
        { sx = 27659, sy = 26340, sz = 30, ex = 27660, ey = 26342, ez = 30 },
        { sx = 27719, sy = 26160, sz = 30, ex = 27720, ey = 26162, ez = 30 },
        { sx = 27719, sy = 26220, sz = 30, ex = 27720, ey = 26222, ez = 30 },
        { sx = 27719, sy = 26280, sz = 30, ex = 27720, ey = 26282, ez = 30 },
        { sx = 27719, sy = 26340, sz = 30, ex = 27720, ey = 26342, ez = 30 },
    }
}

-- mvan92econoline (Base.fhq92EconolineXL, Base.fhq92EconolineXLPanel)
PRVIR.lots["mvan92econoline"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 27779, sy = 26160, sz = 0,  ex = 27780, ey = 26163, ez = 0  },
        { sx = 27779, sy = 26220, sz = 0,  ex = 27780, ey = 26223, ez = 0  },
        { sx = 27779, sy = 26280, sz = 0,  ex = 27780, ey = 26283, ez = 0  },
        { sx = 27779, sy = 26340, sz = 0,  ex = 27780, ey = 26343, ez = 0  },
        { sx = 27839, sy = 26160, sz = 0,  ex = 27840, ey = 26163, ez = 0  },
        { sx = 27839, sy = 26220, sz = 0,  ex = 27840, ey = 26223, ez = 0  },
        { sx = 27839, sy = 26280, sz = 0,  ex = 27840, ey = 26283, ez = 0  },
        { sx = 27839, sy = 26340, sz = 0,  ex = 27840, ey = 26343, ez = 0  },
        { sx = 27779, sy = 26160, sz = 30, ex = 27780, ey = 26163, ez = 30 },
        { sx = 27779, sy = 26220, sz = 30, ex = 27780, ey = 26223, ez = 30 },
        { sx = 27779, sy = 26280, sz = 30, ex = 27780, ey = 26283, ez = 30 },
        { sx = 27779, sy = 26340, sz = 30, ex = 27780, ey = 26343, ez = 30 },
        { sx = 27839, sy = 26160, sz = 30, ex = 27840, ey = 26163, ez = 30 },
        { sx = 27839, sy = 26220, sz = 30, ex = 27840, ey = 26223, ez = 30 },
        { sx = 27839, sy = 26280, sz = 30, ex = 27840, ey = 26283, ez = 30 },
        { sx = 27839, sy = 26340, sz = 30, ex = 27840, ey = 26343, ez = 30 },
    }
}

-- motoriusbus2 (Base.fhqB10M, Base.fhqB10M_Riv)
PRVIR.lots["motoriusbus2"] = {
    teleportOffset = { x = 1.5, y = 8.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 9,
    rooms = {
        { sx = 27958, sy = 26160, sz = 0, ex = 27960, ey = 26168, ez = 0 },
        { sx = 27958, sy = 26220, sz = 0, ex = 27960, ey = 26228, ez = 0 },
        { sx = 27958, sy = 26280, sz = 0, ex = 27960, ey = 26288, ez = 0 },
        { sx = 27958, sy = 26340, sz = 0, ex = 27960, ey = 26348, ez = 0 },
        { sx = 28018, sy = 26160, sz = 0, ex = 28020, ey = 26168, ez = 0 },
        { sx = 28018, sy = 26220, sz = 0, ex = 28020, ey = 26228, ez = 0 },
        { sx = 28018, sy = 26280, sz = 0, ex = 28020, ey = 26288, ez = 0 },
        { sx = 28018, sy = 26340, sz = 0, ex = 28020, ey = 26348, ez = 0 },
    }
}

-- fhq90SuzEvery (Base.fhq90SuzEvery)
PRVIR.lots["fhq90SuzEvery"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2,
    rooms = {
        { sx = 27959, sy = 26160, sz = 30, ex = 27960, ey = 26161, ez = 30 },
        { sx = 27959, sy = 26220, sz = 30, ex = 27960, ey = 26221, ez = 30 },
        { sx = 27959, sy = 26280, sz = 30, ex = 27960, ey = 26281, ez = 30 },
        { sx = 27959, sy = 26340, sz = 30, ex = 27960, ey = 26341, ez = 30 },
    }
}

-- ki5ambulancemed (Base.86fordE150med)
PRVIR.lots["ki5ambulancemed"] = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 26459, sy = 26160, sz = 0, ex = 26460, ey = 26162, ez = 0 },
        { sx = 26459, sy = 26220, sz = 0, ex = 26460, ey = 26222, ez = 0 },
        { sx = 26459, sy = 26280, sz = 0, ex = 26460, ey = 26282, ez = 0 },
        { sx = 26459, sy = 26340, sz = 0, ex = 26460, ey = 26342, ez = 0 },
        { sx = 26519, sy = 26160, sz = 0, ex = 26520, ey = 26162, ez = 0 },
        { sx = 26519, sy = 26220, sz = 0, ex = 26520, ey = 26222, ez = 0 },
        { sx = 26519, sy = 26280, sz = 0, ex = 26520, ey = 26282, ez = 0 },
    }
}

-- traileranimalhorsebox (Base.Trailer_Horsebox)
PRVIR.lots["traileranimalhorsebox"] = {
    teleportOffset = { x = 1.5, y = 2.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 1, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 4,
    rooms = {
        { sx = 27359, sy = 25860, sz = 0, ex = 27360, ey = 25863, ez = 0 },
        { sx = 27359, sy = 25920, sz = 0, ex = 27360, ey = 25923, ez = 0 },
        { sx = 27359, sy = 25980, sz = 0, ex = 27360, ey = 25983, ez = 0 },
        { sx = 27359, sy = 26040, sz = 0, ex = 27360, ey = 26043, ez = 0 },
    }
}

-- traileranimallivestock (Base.Trailer_Livestock)
PRVIR.lots["traileranimallivestock"] = {
    teleportOffset = { x = 2.5, y = 3.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5,
    rooms = {
        { sx = 27418, sy = 25860, sz = 0, ex = 27420, ey = 25864, ez = 0 },
        { sx = 27418, sy = 25920, sz = 0, ex = 27420, ey = 25924, ez = 0 },
        { sx = 27418, sy = 25980, sz = 0, ex = 27420, ey = 25984, ez = 0 },
        { sx = 27418, sy = 26040, sz = 0, ex = 27420, ey = 26044, ez = 0 },
    }
}

-- CDClabor (Base.f700boxshellCDCSEV)
PRVIR.lots["CDClabor"] = {
    teleportOffset = { x = 2.5, y = 6.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 2, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 8,
    rooms = {
        { sx = 28258, sy = 27060, sz = 0, ex = 28260, ey = 27067, ez = 0 },
        { sx = 28258, sy = 27120, sz = 0, ex = 28260, ey = 27127, ez = 0 },
        { sx = 28258, sy = 27180, sz = 0, ex = 28260, ey = 27187, ez = 0 },
        { sx = 28258, sy = 27240, sz = 0, ex = 28260, ey = 27247, ez = 0 },
    }
}

-- camptrailer2 (Base.Trailer87Scamp16)
PRVIR.lots["camptrailer2"] = {
    teleportOffset = { x = 3.5, y = 1.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 28077, sy = 27360, sz = 0, ex = 28080, ey = 27364, ez = 0 },
        { sx = 28077, sy = 27420, sz = 0, ex = 28080, ey = 27424, ez = 0 },
        { sx = 28077, sy = 27480, sz = 0, ex = 28080, ey = 27484, ez = 0 },
        { sx = 28077, sy = 27540, sz = 0, ex = 28080, ey = 27544, ez = 0 },
        { sx = 28137, sy = 27360, sz = 0, ex = 28140, ey = 27364, ez = 0 },
        { sx = 28137, sy = 27420, sz = 0, ex = 28140, ey = 27424, ez = 0 },
        { sx = 28137, sy = 27480, sz = 0, ex = 28140, ey = 27484, ez = 0 },
        { sx = 28137, sy = 27540, sz = 0, ex = 28140, ey = 27544, ez = 0 },
    }
}

-- camptrailer (Base.Trailer87Scamp13)
PRVIR.lots["camptrailer"] = {
    teleportOffset = { x = 3.5, y = 1.5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 3, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 6,
    rooms = {
        { sx = 27957, sy = 27360, sz = 0, ex = 27960, ey = 27365, ez = 0 },
        { sx = 27957, sy = 27420, sz = 0, ex = 27960, ey = 27425, ez = 0 },
        { sx = 27957, sy = 27480, sz = 0, ex = 27960, ey = 27485, ez = 0 },
        { sx = 27957, sy = 27540, sz = 0, ex = 27960, ey = 27545, ez = 0 },
        { sx = 28017, sy = 27360, sz = 0, ex = 28020, ey = 27365, ez = 0 },
        { sx = 28017, sy = 27420, sz = 0, ex = 28020, ey = 27425, ez = 0 },
        { sx = 28017, sy = 27480, sz = 0, ex = 28020, ey = 27485, ez = 0 },
        { sx = 28017, sy = 27540, sz = 0, ex = 28020, ey = 27545, ez = 0 },
    }
}
require "ProjectRVInteriorRebase_Shared_Lots"

PRVIR.lots["M113"] = PRVIR.lots["M113"] or {}
PRVIR.lots["97ADIBushmaster"] = PRVIR.lots["97ADIBushmaster"] or {}
PRVIR.lots["86OshkoshP19A"] = PRVIR.lots["86OshkoshP19A"] or {}
PRVIR.lots["67CadillacGageCommando"] = PRVIR.lots["67CadillacGageCommando"] or {}
PRVIR.lots["86ChevroletCUCVs"] = PRVIR.lots["86ChevroletCUCVs"] or {}
PRVIR.lots["U.S.M41WalkerBulldog"] = PRVIR.lots["U.S.M41WalkerBulldog"] or {}
PRVIR.lots["U.S.M163VADS"] = PRVIR.lots["U.S.M163VADS"] or {}
PRVIR.lots["[B42]Tatrapan2"] = PRVIR.lots["[B42]Tatrapan2"] or {}
PRVIR.lots["GAZ3937Vodnik"] = PRVIR.lots["GAZ3937Vodnik"] or {}
PRVIR.lots["87Ford"] = PRVIR.lots["87Ford"] or {}
PRVIR.lots["bmp2"] = PRVIR.lots["bmp2"] or {}
PRVIR.lots["btr80"] = PRVIR.lots["btr80"] or {}
PRVIR.lots["semMilitruckbox"] = PRVIR.lots["semMilitruckbox"] or {}
PRVIR.lots["miliTrailervan"] = PRVIR.lots["miliTrailervan"] or {}
PRVIR.lots["ot64"] = PRVIR.lots["ot64"] or {}

-- M113 (Base.M113_APC, Base.M113_Police)
PRVIR.lots["M113"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 24960, sy = 12960, sz = 0, ex = 24963, ey = 12964, ez = 0 },
        { sx = 24960, sy = 13020, sz = 0, ex = 24963, ey = 13024, ez = 0 },
        { sx = 24960, sy = 13080, sz = 0, ex = 24963, ey = 13084, ez = 0 },
        { sx = 24960, sy = 13140, sz = 0, ex = 24963, ey = 13144, ez = 0 },
        { sx = 24960, sy = 13260, sz = 0, ex = 24963, ey = 13264, ez = 0 },
        { sx = 24960, sy = 13320, sz = 0, ex = 24963, ey = 13324, ez = 0 },
        { sx = 24960, sy = 13380, sz = 0, ex = 24963, ey = 13384, ez = 0 },
        { sx = 24960, sy = 13440, sz = 0, ex = 24963, ey = 13444, ez = 0 },
    }
}

-- 97ADIBushmaster (Base.97bushmaster, Base.97bushAmbulance)
PRVIR.lots["97ADIBushmaster"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 3,
    rooms = {
        { sx = 25020, sy = 12960, sz = 0, ex = 25023, ey = 12962, ez = 0 },
        { sx = 25020, sy = 13020, sz = 0, ex = 25023, ey = 13022, ez = 0 },
        { sx = 25020, sy = 13080, sz = 0, ex = 25023, ey = 13082, ez = 0 },
        { sx = 25020, sy = 13140, sz = 0, ex = 25023, ey = 13142, ez = 0 },
        { sx = 25020, sy = 13260, sz = 0, ex = 25023, ey = 13262, ez = 0 },
        { sx = 25020, sy = 13320, sz = 0, ex = 25023, ey = 13322, ez = 0 },
        { sx = 25020, sy = 13380, sz = 0, ex = 25023, ey = 13382, ez = 0 },
        { sx = 25020, sy = 13440, sz = 0, ex = 25023, ey = 13442, ez = 0 },
    }
}

-- 86OshkoshP19A (Base.86oshkoshUSMC, Base.86oshkoshFRTR55, Base.86oshkoshKYFD)
PRVIR.lots["86OshkoshP19A"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 25080, sy = 12960, sz = 0, ex = 25082, ey = 12963, ez = 0 },
        { sx = 25080, sy = 13020, sz = 0, ex = 25082, ey = 13023, ez = 0 },
        { sx = 25080, sy = 13080, sz = 0, ex = 25082, ey = 13083, ez = 0 },
        { sx = 25080, sy = 13140, sz = 0, ex = 25082, ey = 13143, ez = 0 },
        { sx = 25080, sy = 13260, sz = 0, ex = 25082, ey = 13263, ez = 0 },
        { sx = 25080, sy = 13320, sz = 0, ex = 25082, ey = 13323, ez = 0 },
        { sx = 25080, sy = 13380, sz = 0, ex = 25082, ey = 13383, ez = 0 },
        { sx = 25080, sy = 13440, sz = 0, ex = 25082, ey = 13443, ez = 0 },
    }
}

-- 67CadillacGageCommando (Base.67commando, Base.67commandoPolice, Base.67commandoT50)
PRVIR.lots["67CadillacGageCommando"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 25140, sy = 12960, sz = 0, ex = 25142, ey = 12963, ez = 0 },
        { sx = 25140, sy = 13020, sz = 0, ex = 25142, ey = 13023, ez = 0 },
        { sx = 25140, sy = 13080, sz = 0, ex = 25142, ey = 13083, ez = 0 },
        { sx = 25140, sy = 13140, sz = 0, ex = 25142, ey = 13143, ez = 0 },
        { sx = 25140, sy = 13260, sz = 0, ex = 25142, ey = 13263, ez = 0 },
        { sx = 25140, sy = 13320, sz = 0, ex = 25142, ey = 13323, ez = 0 },
        { sx = 25140, sy = 13380, sz = 0, ex = 25142, ey = 13383, ez = 0 },
        { sx = 25140, sy = 13440, sz = 0, ex = 25142, ey = 13443, ez = 0 },
    }
}

-- 86ChevroletCUCVs (Base.86chevyM1010, Base.86chevyM1031)
PRVIR.lots["86ChevroletCUCVs"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3,
    rooms = {
        { sx = 25260, sy = 12960, sz = 0, ex = 25261, ey = 12962, ez = 0 },
        { sx = 25260, sy = 13020, sz = 0, ex = 25261, ey = 13022, ez = 0 },
        { sx = 25260, sy = 13080, sz = 0, ex = 25261, ey = 13082, ez = 0 },
        { sx = 25260, sy = 13140, sz = 0, ex = 25261, ey = 13142, ez = 0 },
        { sx = 25260, sy = 13260, sz = 0, ex = 25261, ey = 13262, ez = 0 },
        { sx = 25260, sy = 13320, sz = 0, ex = 25261, ey = 13322, ez = 0 },
        { sx = 25260, sy = 13380, sz = 0, ex = 25261, ey = 13382, ez = 0 },
        { sx = 25260, sy = 13440, sz = 0, ex = 25261, ey = 13442, ez = 0 },
    }
}

-- U.S.M41WalkerBulldog (Base.M41_Walker_Bulldog)
PRVIR.lots["U.S.M41WalkerBulldog"] = {
    teleportOffset = { x = -1, y = 1 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 25320, sy = 12960, sz = 0, ex = 25322, ey = 12963, ez = 0 },
        { sx = 25320, sy = 13020, sz = 0, ex = 25322, ey = 13023, ez = 0 },
        { sx = 25320, sy = 13080, sz = 0, ex = 25322, ey = 13083, ez = 0 },
        { sx = 25320, sy = 13140, sz = 0, ex = 25322, ey = 13143, ez = 0 },
        { sx = 25320, sy = 13260, sz = 0, ex = 25322, ey = 13263, ez = 0 },
        { sx = 25320, sy = 13320, sz = 0, ex = 25322, ey = 13323, ez = 0 },
        { sx = 25320, sy = 13380, sz = 0, ex = 25322, ey = 13383, ez = 0 },
        { sx = 25320, sy = 13440, sz = 0, ex = 25322, ey = 13443, ez = 0 },
    }
}

-- U.S.M163VADS (Base.M163)
PRVIR.lots["U.S.M163VADS"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 25380, sy = 12960, sz = 0, ex = 25383, ey = 12964, ez = 0 },
        { sx = 25380, sy = 13020, sz = 0, ex = 25383, ey = 13024, ez = 0 },
        { sx = 25380, sy = 13080, sz = 0, ex = 25383, ey = 13084, ez = 0 },
        { sx = 25380, sy = 13140, sz = 0, ex = 25383, ey = 13144, ez = 0 },
        { sx = 25380, sy = 13260, sz = 0, ex = 25383, ey = 13264, ez = 0 },
        { sx = 25380, sy = 13320, sz = 0, ex = 25383, ey = 13324, ez = 0 },
        { sx = 25380, sy = 13380, sz = 0, ex = 25383, ey = 13384, ez = 0 },
        { sx = 25380, sy = 13440, sz = 0, ex = 25383, ey = 13444, ez = 0 },
    }
}

-- [B42]Tatrapan2 (Base.Tatrapan, Base.TatrapanApocalypto, Base.TatrapanAmbulance)
PRVIR.lots["[B42]Tatrapan2"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 7,
    rooms = {
        { sx = 25440, sy = 12960, sz = 0, ex = 25442, ey = 12966, ez = 0 },
        { sx = 25440, sy = 13020, sz = 0, ex = 25442, ey = 13026, ez = 0 },
        { sx = 25440, sy = 13080, sz = 0, ex = 25442, ey = 13086, ez = 0 },
        { sx = 25440, sy = 13140, sz = 0, ex = 25442, ey = 13146, ez = 0 },
        { sx = 25440, sy = 13260, sz = 0, ex = 25442, ey = 13266, ez = 0 },
        { sx = 25440, sy = 13320, sz = 0, ex = 25442, ey = 13326, ez = 0 },
        { sx = 25440, sy = 13380, sz = 0, ex = 25442, ey = 13386, ez = 0 },
        { sx = 25440, sy = 13440, sz = 0, ex = 25442, ey = 13446, ez = 0 },
    }
}

-- GAZ3937Vodnik (Base.Vodnik)
PRVIR.lots["GAZ3937Vodnik"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 4,
    rooms = {
        { sx = 24960, sy = 12960, sz = 30, ex = 24962, ey = 12963, ez = 30 },
        { sx = 24960, sy = 13020, sz = 30, ex = 24962, ey = 13023, ez = 30 },
        { sx = 24960, sy = 13080, sz = 30, ex = 24962, ey = 13083, ez = 30 },
        { sx = 24960, sy = 13140, sz = 30, ex = 24962, ey = 13143, ez = 30 },
        { sx = 24960, sy = 13260, sz = 30, ex = 24962, ey = 13263, ez = 30 },
        { sx = 24960, sy = 13320, sz = 30, ex = 24962, ey = 13323, ez = 30 },
        { sx = 24960, sy = 13380, sz = 30, ex = 24962, ey = 13383, ez = 30 },
        { sx = 24960, sy = 13440, sz = 30, ex = 24962, ey = 13443, ez = 30 },
    }
}

-- 87Ford (Base.87fordB700military)
PRVIR.lots["87Ford"] = {
    teleportOffset = { x = 0, y = 8 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 9,
    rooms = {
        { sx = 25020, sy = 12960, sz = 30, ex = 25023, ey = 12968, ez = 30 },
        { sx = 25020, sy = 13020, sz = 30, ex = 25023, ey = 13028, ez = 30 },
        { sx = 25020, sy = 13080, sz = 30, ex = 25023, ey = 13088, ez = 30 },
        { sx = 25020, sy = 13140, sz = 30, ex = 25023, ey = 13148, ez = 30 },
        { sx = 25020, sy = 13260, sz = 30, ex = 25023, ey = 13268, ez = 30 },
        { sx = 25020, sy = 13320, sz = 30, ex = 25023, ey = 13328, ez = 30 },
        { sx = 25020, sy = 13380, sz = 30, ex = 25023, ey = 13388, ez = 30 },
        { sx = 25020, sy = 13440, sz = 30, ex = 25023, ey = 13448, ez = 30 },
    }
}

-- bmp2 (Base.BMP-2)
PRVIR.lots["bmp2"] = {
    teleportOffset = { x = 0, y = 4 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 5,
    rooms = {
        { sx = 25560, sy = 12960, sz = 0, ex = 25563, ey = 12964, ez = 0 },
        { sx = 25560, sy = 13020, sz = 0, ex = 25563, ey = 13024, ez = 0 },
        { sx = 25560, sy = 13080, sz = 0, ex = 25563, ey = 13084, ez = 0 },
        { sx = 25560, sy = 13140, sz = 0, ex = 25563, ey = 13144, ez = 0 },
        { sx = 25620, sy = 12960, sz = 0, ex = 25623, ey = 12964, ez = 0 },
        { sx = 25620, sy = 13020, sz = 0, ex = 25623, ey = 13024, ez = 0 },
        { sx = 25620, sy = 13080, sz = 0, ex = 25623, ey = 13084, ez = 0 },
        { sx = 25620, sy = 13140, sz = 0, ex = 25623, ey = 13144, ez = 0 },
    }
}

-- btr80 (Base.BTR-80, Base.BTR-80A)
PRVIR.lots["btr80"] = {
    teleportOffset = { x = 0, y = 5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 6,
    rooms = {
        { sx = 25860, sy = 12960, sz = 0, ex = 25863, ey = 12965, ez = 0 },
        { sx = 25860, sy = 13020, sz = 0, ex = 25863, ey = 13025, ez = 0 },
        { sx = 25860, sy = 13080, sz = 0, ex = 25863, ey = 13085, ez = 0 },
        { sx = 25860, sy = 13140, sz = 0, ex = 25863, ey = 13145, ez = 0 },
        { sx = 25920, sy = 12960, sz = 0, ex = 25923, ey = 12965, ez = 0 },
        { sx = 25920, sy = 13020, sz = 0, ex = 25923, ey = 13025, ez = 0 },
        { sx = 25920, sy = 13080, sz = 0, ex = 25923, ey = 13085, ez = 0 },
        { sx = 25920, sy = 13140, sz = 0, ex = 25923, ey = 13145, ez = 0 },
    }
}

-- semMilitruckbox (Base.SemiTruckBox_mil)
PRVIR.lots["semMilitruckbox"] = {
    teleportOffset = { x = 0, y = 5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8,
    rooms = {
        { sx = 25620, sy = 13260, sz = 0, ex = 25623, ey = 13267, ez = 0 },
        { sx = 25620, sy = 13320, sz = 0, ex = 25623, ey = 13327, ez = 0 },
        { sx = 25620, sy = 13380, sz = 0, ex = 25623, ey = 13387, ez = 0 },
        { sx = 25620, sy = 13440, sz = 0, ex = 25623, ey = 13447, ez = 0 },
    }
}

-- miliTrailervan (Base.SemiTrailerVan_mil)
PRVIR.lots["miliTrailervan"] = {
    teleportOffset = { x = 0, y = 5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 12,
    rooms = {
        { sx = 25560, sy = 13260, sz = 0, ex = 25563, ey = 13271, ez = 0 },
        { sx = 25560, sy = 13320, sz = 0, ex = 25563, ey = 13331, ez = 0 },
        { sx = 25560, sy = 13380, sz = 0, ex = 25563, ey = 13391, ez = 0 },
        { sx = 25560, sy = 13440, sz = 0, ex = 25563, ey = 13451, ez = 0 },
    }
}

-- ot64 (Base.ot64skot, Base.ot64skotAPC, Base.ot64skotApocalypse)
PRVIR.lots["ot64"] = {
    teleportOffset = { x = 0, y = 5 },
    requiresSeat = false, requiresTrunk = true,
    trunkParts = { TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 7,
    rooms = {
        { sx = 25680, sy = 13260, sz = 0, ex = 25683, ey = 13266, ez = 0 },
        { sx = 25680, sy = 13320, sz = 0, ex = 25683, ey = 13326, ez = 0 },
        { sx = 25680, sy = 13380, sz = 0, ex = 25683, ey = 13386, ez = 0 },
        { sx = 25680, sy = 13440, sz = 0, ex = 25683, ey = 13446, ez = 0 },
    }
}
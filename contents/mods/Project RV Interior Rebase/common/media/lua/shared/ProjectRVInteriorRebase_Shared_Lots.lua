-- We populate table with the rooms coordinates
-- Each room is created on the map at specific coordinate, spaced out from each other with specific number of tiles
-- These rooms are identitical in size, as classified by its lot class
-- Therefore we can use a function to fill up the rooms coordinates table
-- sx,sy and ex,ey aka start x/y and end x/y
-- These rooms index will be used for teleport coordinates, the location of the power generator, basis of room assignment
-- If you want to expand number of rooms by adding more maps, you have to add to the index of the room in same order
-- Or you will ruin the data integrity, use insert function to safely add onto the index
-- I would recommend you to use loadModAfter and loadModBefore to control your mod addon load order

require "ProjectRVInteriorRebase_Shared"

PRVIR.lots = PRVIR.lots or {}
PRVIR.lots.small = PRVIR.lots.small or {}
PRVIR.lots.normal = PRVIR.lots.normal or {}
PRVIR.lots.bus = PRVIR.lots.bus or {}
PRVIR.lots["3x2caravan"] = PRVIR.lots["3x2caravan"] or {}
PRVIR.lots["3x6caravan"] = PRVIR.lots["3x6caravan"] or {}
PRVIR.lots["3x7empty"] = PRVIR.lots["3x7empty"] or {}
PRVIR.lots["4x12colossal"] = PRVIR.lots["4x12colossal"] or {}

PRVIR.lots.small = {
    teleportOffset = { x = 0.5, y = 0.5 },
    requiresSeat = true,
    requiresTrunk = false,
    genX = 0,
    genY = 0,
    genFloor = 1,
    roomWidth = 2,
    roomHeight = 2
}

PRVIR.lots.small.rooms = (function()
    local t = {}
    local w = PRVIR.lots.small.roomWidth
    local h = PRVIR.lots.small.roomHeight
    for col = 0, 37 do
        local sx = col * 60 + 22560
        local sy = 12180
        local sz = 0
        table.insert(t, {
            sx = sx, sy = sy, sz = sz,
            ex = sx + w - 1, ey = sy + h - 1, ez = sz
        })
    end
    return t
end)()

PRVIR.lots.normal = {
    teleportOffset = { x = 0.5, y = 0.5 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0,
    genY = 0,
    genFloor = 1,
    roomWidth = 2,
    roomHeight = 3
}

PRVIR.lots.normal.rooms = (function()
    local t = {}
    local w = PRVIR.lots.normal.roomWidth
    local h = PRVIR.lots.normal.roomHeight
    for col = 0, 37 do
        local sx = col * 60 + 22560
        local sy = 12060
        local sz = 0
        table.insert(t, {
            sx = sx, sy = sy, sz = sz,
            ex = sx + w - 1, ey = sy + h - 1, ez = sz
        })
    end
    return t
end)()

PRVIR.lots.bus = {
    teleportOffset = { x = 1.5, y = 0.5 },
    requiresSeat = true,
    requiresTrunk = false,
    genX = 0,
    genY = 0,
    genFloor = 1,
    roomWidth = 3,
    roomHeight = 7
}

PRVIR.lots.bus.rooms = (function()
    local t = {}
    local w = PRVIR.lots.bus.roomWidth
    local h = PRVIR.lots.bus.roomHeight
    for col = 0, 37 do
        local sx = col * 60 + 22560
        local sy = 12120
        local sz = 0
        table.insert(t, {
            sx = sx, sy = sy, sz = sz,
            ex = sx + w - 1, ey = sy + h - 1, ez = sz
        })
    end
    return t
end)()

PRVIR.lots["3x2caravan"] = {
    teleportOffset = { x = 1.5, y = 1.5 },
    requiresSeat = true,
    requiresTrunk = false,
    genX = 0,
    genY = 0,
    genFloor = 1,
    roomWidth = 3,
    roomHeight = 2
}

PRVIR.lots["3x2caravan"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["3x2caravan"].roomWidth
    local h = PRVIR.lots["3x2caravan"].roomHeight
    for col = 0, 37 do
        local sx = col * 60 + 22560
        local sy = 12240
        local sz = 0
        table.insert(t, {
            sx = sx, sy = sy, sz = sz,
            ex = sx + w - 1, ey = sy + h - 1, ez = sz
        })
    end
    return t
end)()

PRVIR.lots["3x6caravan"] = {
    teleportOffset = { x = 1.5, y = 5.5 },
    requiresSeat = true,
    requiresTrunk = false,
    genX = 0,
    genY = 0,
    genFloor = 1,
    roomWidth = 3,
    roomHeight = 6
}

PRVIR.lots["3x6caravan"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["3x6caravan"].roomWidth
    local h = PRVIR.lots["3x6caravan"].roomHeight
    for col = 0, 37 do
        local sx = col * 60 + 22560
        local sy = 12300
        local sz = 0
        table.insert(t, {
            sx = sx, sy = sy, sz = sz,
            ex = sx + w - 1, ey = sy + h - 1, ez = sz
        })
    end
    return t
end)()

PRVIR.lots["3x7empty"] = {
    teleportOffset = { x = 0.5, y = 0.5 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true,
        TrunkDoor1 = true, TrailerTrunk = true, TrailerTrunk1 = true, TrailerTrunk2 = true,
        TrailerTrunk3 = true, BigTrunk = true, BigTrunk1 = true, BigTrunk2 = true,
        BigTrunk3 = true, SmallTrunk = true, SmallTrunk1 = true, SmallTrunk2 = true,
        SmallTrunk3 = true, VanSeatsTrunk2 = true, NormalTrunk = true, NormalTrunk1 = true,
        NormalTrunk2 = true, NormalTrunk3 = true, TruckBed = true, AnimalEntry = true,
        TrailerAnimalFood = true, ATSMegaTrunk = true, TrailerAnimalEggs = true
    },
    genX = 0,
    genY = 0,
    genFloor = 1,
    roomWidth = 3,
    roomHeight = 7
}

PRVIR.lots["3x7empty"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["3x7empty"].roomWidth
    local h = PRVIR.lots["3x7empty"].roomHeight
    for col = 0, 37 do
        local sx = col * 60 + 22560
        local sy = 12360
        local sz = 0
        table.insert(t, {
            sx = sx, sy = sy, sz = sz,
            ex = sx + w - 1, ey = sy + h - 1, ez = sz
        })
    end
    return t
end)()

PRVIR.lots["4x12colossal"] = {
    teleportOffset = { x = 0.5, y = 0.5 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true,
        TrunkDoor1 = true, TrailerTrunk = true, TrailerTrunk1 = true, TrailerTrunk2 = true,
        TrailerTrunk3 = true, BigTrunk = true, BigTrunk1 = true, BigTrunk2 = true,
        BigTrunk3 = true, SmallTrunk = true, SmallTrunk1 = true, SmallTrunk2 = true,
        SmallTrunk3 = true, VanSeatsTrunk2 = true, NormalTrunk = true, NormalTrunk1 = true,
        NormalTrunk2 = true, NormalTrunk3 = true, TruckBed = true, AnimalEntry = true,
        TrailerAnimalFood = true, ATSMegaTrunk = true, TrailerAnimalEggs = true
    },
    genX = 0,
    genY = 0,
    genFloor = 1,
    roomWidth = 4,
    roomHeight = 12
}

PRVIR.lots["4x12colossal"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["4x12colossal"].roomWidth
    local h = PRVIR.lots["4x12colossal"].roomHeight
    for col = 0, 37 do
        local sx = col * 60 + 22560
        local sy = 12420
        local sz = 0
        table.insert(t, {
            sx = sx, sy = sy, sz = sz,
            ex = sx + w - 1, ey = sy + h - 1, ez = sz
        })
    end
    return t
end)()
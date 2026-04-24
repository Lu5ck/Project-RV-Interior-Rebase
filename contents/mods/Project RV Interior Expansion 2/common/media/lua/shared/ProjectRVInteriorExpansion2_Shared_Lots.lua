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

PRVIR.lots["1993ambu"] = PRVIR.lots["1993ambu"] or {}
PRVIR.lots["1993ambu2"] = PRVIR.lots["1993ambu2"] or {}
PRVIR.lots["1993ambu3"] = PRVIR.lots["1993ambu3"] or {}
PRVIR.lots["1993vans"] = PRVIR.lots["1993vans"] or {}
PRVIR.lots["1993bus"] = PRVIR.lots["1993bus"] or {}
PRVIR.lots["1993firetruck"] = PRVIR.lots["1993firetruck"] or {}
PRVIR.lots["1993trucks"] = PRVIR.lots["1993trucks"] or {}
PRVIR.lots["1993swats"] = PRVIR.lots["1993swats"] or {}
PRVIR.lots["1993wzswat"] = PRVIR.lots["1993wzswat"] or {}
PRVIR.lots["1993boxtruck"] = PRVIR.lots["1993boxtruck"] or {}
PRVIR.lots["1993firedepttruck"] = PRVIR.lots["1993firedepttruck"] or {}

-- 1993ambu
PRVIR.lots["1993ambu"] = {
    teleportOffset = { x = 0, y = 0 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3
}
PRVIR.lots["1993ambu"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993ambu"].roomWidth
    local h = PRVIR.lots["1993ambu"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30060
        local sy = 29160
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993ambu2
PRVIR.lots["1993ambu2"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 3
}
PRVIR.lots["1993ambu2"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993ambu2"].roomWidth
    local h = PRVIR.lots["1993ambu2"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30180
        local sy = 29160
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993ambu3
PRVIR.lots["1993ambu3"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 5
}
PRVIR.lots["1993ambu3"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993ambu3"].roomWidth
    local h = PRVIR.lots["1993ambu3"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30060
        local sy = 29160
        local sz = 20
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993vans
PRVIR.lots["1993vans"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 3
}
PRVIR.lots["1993vans"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993vans"].roomWidth
    local h = PRVIR.lots["1993vans"].roomHeight
    for col = 0, 3 do
        local sx = col * 60 + 30360
        local sy = 29460
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993bus
PRVIR.lots["1993bus"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 9
}
PRVIR.lots["1993bus"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993bus"].roomWidth
    local h = PRVIR.lots["1993bus"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30060
        local sy = 30060
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993firetruck
PRVIR.lots["1993firetruck"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 2, roomHeight = 2
}
PRVIR.lots["1993firetruck"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993firetruck"].roomWidth
    local h = PRVIR.lots["1993firetruck"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30360
        local sy = 30060
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993trucks
PRVIR.lots["1993trucks"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 11
}
PRVIR.lots["1993trucks"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993trucks"].roomWidth
    local h = PRVIR.lots["1993trucks"].roomHeight
    for col = 0, 2 do
        local sx = col * 60 + 30360
        local sy = 29760
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993swats
PRVIR.lots["1993swats"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 6
}
PRVIR.lots["1993swats"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993swats"].roomWidth
    local h = PRVIR.lots["1993swats"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30660
        local sy = 30060
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993wzswat
PRVIR.lots["1993wzswat"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 4, roomHeight = 8
}
PRVIR.lots["1993wzswat"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993wzswat"].roomWidth
    local h = PRVIR.lots["1993wzswat"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30660
        local sy = 30060
        local sz = 30
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993boxtruck
PRVIR.lots["1993boxtruck"] = {
    teleportOffset = { x = 0, y = 1 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 8
}
PRVIR.lots["1993boxtruck"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993boxtruck"].roomWidth
    local h = PRVIR.lots["1993boxtruck"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30660
        local sy = 29760
        local sz = 0
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()

-- 1993firedepttruck
PRVIR.lots["1993firedepttruck"] = {
    teleportOffset = { x = 0, y = 2 },
    requiresSeat = false,
    requiresTrunk = true,
    trunkParts = {
        TrunkDoor = true, DoorRear = true, DoorRearLeft = true, DoorRearRight = true
    },
    genX = 0, genY = 0, genFloor = 1,
    roomWidth = 3, roomHeight = 7
}
PRVIR.lots["1993firedepttruck"].rooms = (function()
    local t = {}
    local w = PRVIR.lots["1993firedepttruck"].roomWidth
    local h = PRVIR.lots["1993firedepttruck"].roomHeight
    for col = 0, 1 do
        local sx = col * 60 + 30360
        local sy = 30060
        local sz = 30
        table.insert(t, { sx = sx, sy = sy, sz = sz, ex = sx + w - 1, ey = sy + h - 1, ez = sz })
    end
    return t
end)()
-- Slightly modified from vanilla to work with Dashboard
require "TimedActions/ISBaseTimedAction"
ISPRVIRConnectGenerator = ISBaseTimedAction:derive("ISPRVIRConnectGenerator")

function ISPRVIRConnectGenerator:isValid()
    if self.generator then
        return self.generator:getObjectIndex() ~= -1
    else
        return false
    end
end

function ISPRVIRConnectGenerator:waitToStart()
    self.character:faceThisObject(self.faceObject)
    return self.character:shouldBeTurning()
end

function ISPRVIRConnectGenerator:update()
end

function ISPRVIRConnectGenerator:start()
end

function ISPRVIRConnectGenerator:stop()
end

function ISPRVIRConnectGenerator:perform()
    ISBaseTimedAction.perform(self)
end

function ISPRVIRConnectGenerator:complete()
    self.generator:setConnected(true)
    return true
end

function ISPRVIRConnectGenerator:getDuration()
    if self.character:isTimedActionInstant() then
        return 1
    end
    return 30
end

function ISPRVIRConnectGenerator:new(character, faceObject, generator)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.character = character
    o.faceObject = faceObject
    o.generator = generator
    o.maxTime = o:getDuration()

    return o
end
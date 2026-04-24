-- Slightly modified from vanilla to work with Dashboard
require "TimedActions/ISBaseTimedAction"
ISPRVIRToggleGenerator = ISBaseTimedAction:derive("ISPRVIRToggleGenerator")

function ISPRVIRToggleGenerator:isValid()
    if self.generator then
        if self.activate == self.generator:isActivated() then return false end
        if not self.generator:isConnected() then return false end
        if self.generator:getCondition() <= 0 then return false end
        if self.activate and self.generator:getFuel() <= 0 then return false end
        return self.generator:getObjectIndex() ~= -1
    else
        return false
    end
end

function ISPRVIRToggleGenerator:waitToStart()
    self.character:faceThisObject(self.faceObject)
    return self.character:shouldBeTurning()
end

function ISPRVIRToggleGenerator:update()
end

function ISPRVIRToggleGenerator:start()
end

function ISPRVIRToggleGenerator:stop()
end

function ISPRVIRToggleGenerator:perform()
    ISBaseTimedAction.perform(self)
end

function ISPRVIRToggleGenerator:complete()
	if not self.generator then return end
    self.generator:setActivated(self.activate)
	self.generator:sync()

    return true
end

function ISPRVIRToggleGenerator:getDuration()
    if self.character:isTimedActionInstant() then
        return 1
    end
    return 30
end

function ISPRVIRToggleGenerator:new(character, faceObject, generator, activate)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.character = character
    o.faceObject = faceObject
    o.generator = generator
    o.activate = activate
    o.maxTime = o:getDuration()

    return o
end
-- Slightly modified from vanilla to work with Dashboard

require "TimedActions/ISBaseTimedAction"

ISPRVIRAddFuel = ISBaseTimedAction:derive("ISPRVIRAddFuel");

function ISPRVIRAddFuel:isValid()
	if self.generator:getFuelPercentage() >= 100 then return false end
	return self.generator:getObjectIndex() ~= -1 and
	self.character:isPrimaryHandItem(self.petrol) or self.character:isSecondaryHandItem(self.petrol)
end

function ISPRVIRAddFuel:waitToStart()
    self.character:faceThisObject(self.faceObject)
    return self.character:shouldBeTurning()
end

function ISPRVIRAddFuel:update()
	self.petrol:setJobDelta(self:getJobDelta())
    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISPRVIRAddFuel:start()
	self:setActionAnim("refuelgascan")
	-- Don't call setOverrideHandModels() with self.petrol, the right-hand mask
	-- will bork the animation.
	self.petrol:setJobType(getText("ContextMenu_GeneratorAddFuel"))
	self.petrol:setJobDelta(0.0)
	self:setOverrideHandModels(self.petrol:getStaticModel(), nil)
	self.sound = self.character:playSound("GeneratorAddFuel")
end

function ISPRVIRAddFuel:stop()
	self.character:stopOrTriggerSound(self.sound)
	self.petrol:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function ISPRVIRAddFuel:perform()
	self.character:stopOrTriggerSound(self.sound)
    self.petrol:setJobDelta(0.0)
		
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISPRVIRAddFuel:complete()
	--local endFuel = 0;
	--while self.fluidCont and self.fluidCont:getAmount() >= 0.098 and self.generator:getFuel() + endFuel < 100 do
	--	local amount = self.fluidCont:getAmount() - 0.1;
	--	self.fluidCont:adjustAmount(amount);
	--	endFuel = endFuel + 1;
	--end
	local endFuel = math.min(self.fluidCont:getAmount(), self.generator:getMaxFuel() - self.generator:getFuel())
	self.fluidCont:adjustAmount(self.fluidCont:getAmount() - endFuel)
	self.petrol:syncItemFields()
	self.generator:setFuel(self.generator:getFuel() + endFuel)
	self.generator:sync()

	return true;
end

function ISPRVIRAddFuel:getDuration()
	if self.character:isTimedActionInstant() then
		return 1;
	end
	return 70 + (self.fluidCont:getAmount() * 50)
end

function ISPRVIRAddFuel:new(character, faceObject, generator, petrol, maxTime)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
	o.character = character
	o.faceObject = faceObject;
    o.petrol = petrol;
	o.fluidCont = o.petrol:getFluidContainer();
	o.generator = generator;
	o.maxTime = o:getDuration();
	return o;
end

require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISInventoryTransferUtil"

ISPRVIRFixGenerator = ISBaseTimedAction:derive("ISPRVIRFixGenerator");

function ISPRVIRFixGenerator:isValid()
	return self.generator:getObjectIndex() ~= -1 and
		not self.generator:isActivated() and
		self.generator:getCondition() < 100 and
		self.character:getInventory():containsTypeRecurse("ElectronicsScrap")
end

function ISPRVIRFixGenerator:waitToStart()
	self.character:faceThisObject(self.faceObject)
	return self.character:shouldBeTurning()
end

function ISPRVIRFixGenerator:update()
	self.character:faceThisObject(self.faceObject)

    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function ISPRVIRFixGenerator:start()
	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
	self.character:reportEvent("EventLootItem")
	self.sound = self.character:playSound("GeneratorRepair")
end

function ISPRVIRFixGenerator:stop()
	self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self);
end

function ISPRVIRFixGenerator:continueFixing()
	if self.generator:getCondition() < 100 then
		local scrapItem = self.character:getInventory():getFirstTypeRecurse("ElectronicsScrap")
		if scrapItem then
			local previousAction = self
			if scrapItem:getContainer() ~= self.character:getInventory() then
				local action = ISInventoryTransferUtil.newInventoryTransferAction(self.character, scrapItem, scrapItem:getContainer(), self.character:getInventory(), nil)
				ISTimedActionQueue.addAfter(self, action)
				previousAction = action
			end
			ISTimedActionQueue.addAfter(previousAction, ISPRVIRFixGenerator:new(self.character, self.faceObject, self.generator));
		end
	end
end

function ISPRVIRFixGenerator:perform()
	self.character:stopOrTriggerSound(self.sound)

	if isClient() then
		self:continueFixing()
	end

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISPRVIRFixGenerator:complete()
	local scrapItem = self.character:getInventory():getFirstTypeRecurse("ElectronicsScrap");

	if not scrapItem then return false; end;
	self.character:removeFromHands(scrapItem);
	self.character:getInventory():Remove(scrapItem);
	sendRemoveItemFromContainer(self.character:getInventory(), scrapItem);

	self.generator:setCondition(self.generator:getCondition() + 4 + (1*(self.character:getPerkLevel(Perks.Electricity))/2))
	addXp(self.character, Perks.Electricity, 5)

	if not isClient() and not isServer() then
		self:continueFixing()
	end

	return true
end

function ISPRVIRFixGenerator:getDuration()
	if self.character:isTimedActionInstant() then
		return 1
	end
	return 150 - (self.character:getPerkLevel(Perks.Electricity) * 3)
end

function ISPRVIRFixGenerator:new(character, faceObject, generator)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.character = character
	o.generator = generator;
    o.faceObject = faceObject
	o.maxTime = o:getDuration()
    o.caloriesModifier = 4;
	return o;
end

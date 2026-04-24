require "TimedActions/ISBaseTimedAction"

ISPRVIRAddWater = ISBaseTimedAction:derive("ISPRVIRAddWater")

function ISPRVIRAddWater:isValid()
    if isClient() and self.itemFrom then
        return true
    else
        return self.objectTo:canTransferFluidFrom(self.itemFrom:getFluidContainer()) and 
			--self.itemFrom:isWaterSource() and -- replaced this with the test above to enable all manner of fluids to be transferred - spurcival
			self.character:getInventory():contains(self.itemFrom) and
            self.objectTo:getObjectIndex() ~= -1 and
            self.objectTo:getFluidAmount() < self.objectTo:getFluidCapacity()
    end
end

function ISPRVIRAddWater:waitToStart()
	self.character:faceThisObject(self.faceObject)
	return self.character:shouldBeTurning()
end

function ISPRVIRAddWater:update()
	self.character:faceThisObject(self.faceObject)
	self.itemFrom:setJobDelta(self:getJobDelta())
	self.character:setMetabolicTarget(Metabolics.LightDomestic);

	if not isClient() then
        self:updateAdd(self:getJobDelta());
	end
end

function ISPRVIRAddWater:serverStart()
    emulateAnimEvent(self.netAction, 100, "addFluid", nil);
end

function ISPRVIRAddWater:animEvent(event, parameter)
    if isServer() then
        if event == "addFluid" then
		    self:updateAdd(self.netAction:getProgress());
        end
    end
end

function ISPRVIRAddWater:updateAdd(delta)
    -- transfer per update
    local progressAmount = self.addUnits * delta;
    local sourceAmountTarget = self.itemFromStartAmount - progressAmount;
    local amountToTransfer = math.max(0, self.itemFrom:getFluidContainer():getAmount() - sourceAmountTarget);
    self.objectTo:transferFluidFrom(self.itemFrom:getFluidContainer(), amountToTransfer);
    self.itemFrom:syncItemFields();
end

function ISPRVIRAddWater:start()
	self.itemFrom:setJobType(getText("IGUI_JobType_PourOut"))
	self.itemFrom:setJobDelta(0.0)

	self:setAnimVariable("PourType", self.itemFrom:getPourType());
	self:setActionAnim("fill_container_tap");
	self:setOverrideHandModels(self.itemFrom:getStaticModel(), nil)

	if instanceof(self.objectTo, "IsoFeedingTrough") then
		self.sound = self.character:playSound("AnimalFeederAddWater")
	else
		self.sound = self.character:playSound("PourWaterIntoObject")
	end

	self.character:reportEvent("EventTakeWater");
end

function ISPRVIRAddWater:stop()
	self:stopSound()
	self.itemFrom:setJobDelta(0.0)

	ISBaseTimedAction.stop(self)
end

function ISPRVIRAddWater:perform()
	self:stopSound()
	self.itemFrom:getContainer():setDrawDirty(true)
	self.itemFrom:setJobDelta(0.0)

	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISPRVIRAddWater:complete()
	if self.addUnits and self.addUnits > 0 then
		local sourceAmountTarget = self.itemFromStartAmount - self.addUnits;
		local amountToTransfer = math.max(0, self.itemFrom:getFluidContainer():getAmount() - sourceAmountTarget);
		self.objectTo:transferFluidFrom(self.itemFrom:getFluidContainer(), amountToTransfer);
		self.itemFrom:syncItemFields();
	end

	return true;
end

function ISPRVIRAddWater:getDuration()
	if self.character:isTimedActionInstant() then
		return 1;
	end
	return math.max(6, self.addUnits) * 7;
end

function ISPRVIRAddWater:stopSound()
	if self.sound and self.character:getEmitter():isPlaying(self.sound) then
		self.character:stopOrTriggerSound(self.sound);
	end
end

function ISPRVIRAddWater:new(character, faceObject, itemFrom, objectTo)
	local o = ISBaseTimedAction.new(self, character)
	o.faceObject = faceObject
	o.itemFrom = itemFrom
	o.objectTo = objectTo

	o.itemFromStartAmount = o.itemFrom:getFluidContainer():getAmount()
	local destCapacity = math.max(0, o.objectTo:getFluidCapacity() - o.objectTo:getFluidAmount());
	o.addUnits = math.min(destCapacity, o.itemFromStartAmount)
	o.itemFromEndingAmount = o.itemFromStartAmount - o.addUnits

	o.maxTime = o:getDuration()
	return o
end
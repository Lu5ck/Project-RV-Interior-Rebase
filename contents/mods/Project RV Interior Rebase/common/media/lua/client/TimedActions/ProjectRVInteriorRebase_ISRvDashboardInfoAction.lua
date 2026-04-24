require "TimedActions/ISBaseTimedAction"
require "ISUI/ISLayoutManager"

ISPRVIRDashboardInfoAction = ISBaseTimedAction:derive("ISPRVIRDashboardInfoAction")

function ISPRVIRDashboardInfoAction:isValid()
	return self.faceObject:getObjectIndex() ~= -1
end

function ISPRVIRDashboardInfoAction:perform()
    if PRVIR.ISRVInteriorDashboard.instance then
        PRVIR.ISRVInteriorDashboard.instance:onClose()
        return
    end
    local sw = getCore():getScreenWidth()
    local sh = getCore():getScreenHeight()
    local panel = PRVIR.ISRVInteriorDashboard:new(sw / 2, sh / 2, self.character, self.faceObject)
    panel:initialise()
    panel:instantiate()
    panel:addToUIManager()
    panel:setVisible(true)
    PRVIR.ISRVInteriorDashboard.instance = panel

	local joypadData = JoypadState.players[self.playerNum+1]
	if joypadData then
		joypadData.focus = PRVIR.ISRVInteriorDashboard.instance
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISPRVIRDashboardInfoAction:new(character, faceObject)
	local o = ISBaseTimedAction.new(self, character)
	o.maxTime = 0
	o.character = character
	o.playerNum = character:getPlayerNum()
	o.faceObject = faceObject
	return o
end

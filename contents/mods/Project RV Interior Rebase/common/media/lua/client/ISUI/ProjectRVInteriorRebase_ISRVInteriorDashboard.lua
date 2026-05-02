-- Credit
-- https://steamcommunity.com/sharedfiles/filedetails/?id=3683545014

require "ISUI/ISPanel"
require "ISUI/ISButton"

PRVIR.ISRVInteriorDashboard = ISPanel:derive("PRVIR.ISRVInteriorDashboard")
PRVIR.ISRVInteriorDashboard.instance = nil

function PRVIR.ISRVInteriorDashboard:initialise()
    local lotID = PRVIR.getPlayerAtWhichLot(self.character)
    local lotClass, lotIndex = PRVIR.getLotClassID(lotID)

    if not lotClass or not lotIndex then
        self:onClose()
        self.character:setHaloNote(getText("IGUI_PRVIR_No_Lot_Found"), 250, 250, 250, 300)
        return false
    end
    local lot = PRVIR.lots[lotClass]
    local room = lot.rooms[lotIndex]
    local z = room.sz + lot.genFloor

    for x = room.sx, room.ex do
        for y = room.sy, room.ey do
            local square = getSquare(x, y, z)
            if square then
                if square:getGenerator() then
                    self.generatorObj = square:getGenerator()
                end

                local objects = square:getObjects()
                for i = 0, objects:size() - 1 do
                    local object = objects:get(i)
                    if object and object:getFluidContainer() then
                        table.insert(self.waterObj, object)
                    end
                end
            end
        end
    end
    self.curSquare = self.character:getSquare()
    ISPanel.initialise(self)
end

function PRVIR.ISRVInteriorDashboard:createChildren()
    local padTemp
    local padGeneral = math.floor(5 * PRVIR.getUIFontScale())
    local barHeight = 15 * PRVIR.getUIFontScale()
    local barX = padGeneral * 4 + padGeneral * 11
    local qtyX = self.width - padGeneral * 2 - padGeneral * 8
    local barWidth = self.width - barX - padGeneral - (self.width - qtyX)
    local x, y
    local btnHeight, btnWidth

    self.lblDashboard = ISLabel:new(padGeneral * 3, padGeneral * 2, getTextManager():getFontHeight(UIFont.NewLarge), getText("IGUI_PRVIR_ISRVInteriorDashboard_Dashboard"), 0.85, 0.92, 1, 1, UIFont.NewLarge, true)
    self.lblDashboard:initialise()
    self.lblDashboard:instantiate()
    self:addChild(self.lblDashboard)

    local btnCloseSize = 22 * PRVIR.getUIFontScale()
    self.closeBtn = ISButton:new(self.width - btnCloseSize - padGeneral * 2, padGeneral * 2, btnCloseSize, btnCloseSize, "X", self, PRVIR.ISRVInteriorDashboard.onClose)
    self.closeBtn:initialise()
    self.closeBtn:instantiate()
    self.closeBtn.borderColor = {r = 0.6, g = 0.3, b = 0.3, a = 0.8}
    self.closeBtn.backgroundColor = {r = 0.35, g = 0.12, b = 0.12, a = 0.9}
    self.closeBtn.textColor = {r = 1, g = 0.8, b = 0.8, a = 1}
    self:addChild(self.closeBtn)

    y = self.closeBtn.y + self.closeBtn.height + padGeneral * 4

    self.lblGenerator = ISLabel:new(padGeneral * 3, y, getTextManager():getFontHeight(UIFont.NewMedium), getText("IGUI_PRVIR_ISRVInteriorDashboard_Generator"), 0.85, 0.92, 1, 1, UIFont.NewMedium, true)
    self.lblGenerator:initialise()
    self.lblGenerator:instantiate()
    self:addChild(self.lblGenerator)

    y = self.lblGenerator.y + self.lblGenerator.height + padGeneral

    self.lblGeneratorStatus = ISLabel:new(padGeneral * 4, y, getTextManager():getFontHeight(UIFont.NewSmall), getText("IGUI_PRVIR_ISRVInteriorDashboard_GeneratorStatus"), 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblGeneratorStatus:initialise()
    self.lblGeneratorStatus:instantiate()
    self:addChild(self.lblGeneratorStatus)

    self.lblGeneratorStatusToggle = ISLabel:new(barX, y, getTextManager():getFontHeight(UIFont.NewSmall), "NIL", 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblGeneratorStatusToggle:initialise()
    self.lblGeneratorStatusToggle:instantiate()
    self:addChild(self.lblGeneratorStatusToggle)

    y = self.lblGeneratorStatusToggle.y + self.lblGeneratorStatusToggle.height + padGeneral

    self.lblGeneratorFuel = ISLabel:new(padGeneral * 4, y, getTextManager():getFontHeight(UIFont.NewSmall), getText("IGUI_PRVIR_ISRVInteriorDashboard_GeneratorFuel"), 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblGeneratorFuel:initialise()
    self.lblGeneratorFuel:instantiate()
    self:addChild(self.lblGeneratorFuel)

    self.barFuel = ISProgressBar:new(barX, y, barWidth, self.lblGeneratorFuel.height, nil, nil)
    self.barFuel:initialise()
    self.barFuel:instantiate()
    self:addChild(self.barFuel)
    self.barFuel:setProgress(0.5)
    self.barFuel.progressColor = {r=0.22, g=0.45, b=0.9, a=0.9}
    self.barFuel.borderColor = {r=0.22, g=0.45, b=0.9, a=0.9}
    self.barFuel.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.9}

    self.lblGeneratorFuelAmount = ISLabel:new(barX + self.barFuel.width + padGeneral, y, getTextManager():getFontHeight(UIFont.NewSmall), "NIL", 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblGeneratorFuelAmount:initialise()
    self.lblGeneratorFuelAmount:instantiate()
    self:addChild(self.lblGeneratorFuelAmount)

    y = self.lblGeneratorFuel.y + self.lblGeneratorFuel.height + padGeneral

    self.lblGeneratorCondition = ISLabel:new(padGeneral * 4, y, getTextManager():getFontHeight(UIFont.NewSmall), getText("IGUI_PRVIR_ISRVInteriorDashboard_GeneratorCondition"), 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblGeneratorCondition:initialise()
    self.lblGeneratorCondition:instantiate()
    self:addChild(self.lblGeneratorCondition)

    self.barCondition = ISProgressBar:new(barX, y, barWidth, self.lblGeneratorFuel.height, nil, nil)
    self.barCondition:initialise()
    self.barCondition:instantiate()
    self:addChild(self.barCondition)
    self.barCondition:setProgress(0.5)
    self.barCondition.progressColor = {r=0.22, g=0.45, b=0.9, a=0.9}
    self.barCondition.borderColor = {r=0.22, g=0.45, b=0.9, a=0.9}
    self.barCondition.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.9}

    self.lblGeneratorConditionAmount = ISLabel:new(barX + self.barCondition.width + padGeneral, y, getTextManager():getFontHeight(UIFont.NewSmall), "NIL", 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblGeneratorConditionAmount:initialise()
    self.lblGeneratorConditionAmount:instantiate()
    self:addChild(self.lblGeneratorConditionAmount)

    y = self.lblGeneratorCondition.y + self.lblGeneratorCondition.height + padGeneral * 2

    btnHeight = getTextManager():getFontHeight(UIFont.NewMedium) + padGeneral
    btnWidth = getTextManager():MeasureStringX(UIFont.NewMedium, getText("IGUI_PRVIR_ISRVInteriorDashboard_btnConnect"))
    self.connectBtn = ISButton:new(padGeneral * 3, y, btnWidth + padGeneral * 6, btnHeight, getText("IGUI_PRVIR_ISRVInteriorDashboard_btnConnect"), self, self.onConnect)
    self.connectBtn:initialise()
    self.connectBtn:instantiate()
    self.connectBtn.backgroundColor = {r = 0.35, g = 0.28, b = 0.08, a = 0.9}
    self.connectBtn.borderColor = {r = 0.6, g = 0.5, b = 0.2, a = 0.8}
    self.connectBtn:setVisible(false)
    self:addChild(self.connectBtn)

    local json = {
        "IGUI_PRVIR_ISRVInteriorDashboard_btnToggleOn",
        "IGUI_PRVIR_ISRVInteriorDashboard_btnToggleOff",
        "IGUI_PRVIR_ISRVInteriorDashboard_btnRefuel",
        "IGUI_PRVIR_ISRVInteriorDashboard_btnRefuelCancel",
        "IGUI_PRVIR_ISRVInteriorDashboard_btnFix",
        "IGUI_PRVIR_ISRVInteriorDashboard_btnFixCancel",
    }

    btnWidth = 0
    for _, key in ipairs(json) do
        local tempX = getTextManager():MeasureStringX(UIFont.NewMedium, getText(key))
        if tempX > btnWidth then
            btnWidth = tempX
        end
    end

    btnWidth = btnWidth + padGeneral * 2
    self.btnGeneratorToggle = ISButton:new(padGeneral * 3, y, btnWidth, btnHeight, "Toggle", self, self.onToggle)
    self.btnGeneratorToggle:initialise()
    self.btnGeneratorToggle:instantiate()
    self.btnGeneratorToggle:setVisible(false)
    self:addChild(self.btnGeneratorToggle)

    x = self.btnGeneratorToggle.x + self.btnGeneratorToggle.width + padGeneral * 2
    self.btnRefuel = ISButton:new(x, y, btnWidth, btnHeight, getText("IGUI_PRVIR_ISRVInteriorDashboard_btnRefuel"), self, self.onRefuel)
    self.btnRefuel:initialise()
    self.btnRefuel:instantiate()
    self.btnRefuel:setVisible(false)
    self:addChild(self.btnRefuel)

    x = self.btnRefuel.x + self.btnRefuel.width + padGeneral * 2
    self.btnFix = ISButton:new(x, y, btnWidth, btnHeight, getText("IGUI_PRVIR_ISRVInteriorDashboard_btnFix"), self, self.onFix)
    self.btnFix:initialise()
    self.btnFix:instantiate()
    self.btnFix.backgroundColor = {r = 0.35, g = 0.28, b = 0.08, a = 0.9}
    self.btnFix.borderColor = {r = 0.6, g = 0.5, b = 0.2, a = 0.8}
    self.btnFix:setVisible(false)
    self:addChild(self.btnFix)

    y = self.btnRefuel.y + self.btnRefuel.height + padGeneral * 4

    self.lblWaterStorage = ISLabel:new(padGeneral * 3, y, getTextManager():getFontHeight(UIFont.NewMedium), getText("IGUI_PRVIR_ISRVInteriorDashboard_WaterStorage"), 0.85, 0.92, 1, 1, UIFont.NewMedium, true)
    self.lblWaterStorage:initialise()
    self.lblWaterStorage:instantiate()
    self:addChild(self.lblWaterStorage)

    y = self.lblWaterStorage.y + self.lblWaterStorage.height + padGeneral

    x = getTextManager():MeasureStringX(UIFont.NewSmall, "0L")
    self.lblWaterZero = ISLabel:new(barX - x - padGeneral, y, getTextManager():getFontHeight(UIFont.NewSmall), "0L", 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblWaterZero:initialise()
    self.lblWaterZero:instantiate()
    self:addChild(self.lblWaterZero)

    self.barWaterStorage = ISProgressBar:new(barX, y, barWidth, self.lblGeneratorFuel.height, nil, nil)
    self.barWaterStorage:initialise()
    self.barWaterStorage:instantiate()
    self:addChild(self.barWaterStorage)
    self.barWaterStorage:setProgress(0.5)
    self.barWaterStorage.progressColor = {r=0.22, g=0.45, b=0.9, a=0.9}
    self.barWaterStorage.borderColor = {r=0.22, g=0.45, b=0.9, a=0.9}
    self.barWaterStorage.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.9}

    self.lblWaterMax = ISLabel:new(barX + self.barWaterStorage.width + padGeneral, y, getTextManager():getFontHeight(UIFont.NewSmall), "NIL", 0.6, 0.6, 0.65, 1, UIFont.NewSmall, true)
    self.lblWaterMax:initialise()
    self.lblWaterMax:instantiate()
    self:addChild(self.lblWaterMax)

    y = self.lblWaterZero.y + self.lblWaterZero.height + padGeneral

    btnWidth = getTextManager():MeasureStringX(UIFont.NewMedium, getText("IGUI_PRVIR_ISRVInteriorDashboard_btnAddWater"))
    btnWidth = btnWidth + padGeneral * 2
    self.btnAddWater = ISButton:new(padGeneral * 3, y, btnWidth, btnHeight, getText("IGUI_PRVIR_ISRVInteriorDashboard_btnAddWater"), self, self.onAddWater)
    self.btnAddWater:initialise()
    self.btnAddWater:instantiate()
    self.btnAddWater.backgroundColor = {r = 0.35, g = 0.28, b = 0.08, a = 0.9}
    self.btnAddWater.borderColor = {r = 0.6, g = 0.5, b = 0.2, a = 0.8}
    self.btnAddWater:setVisible(false)
    self:addChild(self.btnAddWater)

    self:setHeight(self.btnAddWater.y + self.btnAddWater.height + padGeneral * 2)
    self:refreshData()
end

function PRVIR.ISRVInteriorDashboard:refreshData()
    self.lblGeneratorStatusToggle:setName("NIL")
    self.barFuel:setProgress(0)
    self.lblGeneratorFuelAmount:setName("NIL")
    self.barCondition:setProgress(0)
    self.lblGeneratorConditionAmount:setName("NIL")
    self.connectBtn:setVisible(false)
    self.btnGeneratorToggle:setVisible(false)
    self.btnRefuel:setVisible(false)
    self.btnFix:setVisible(false)
    self.barWaterStorage:setProgress(0)
    self.lblWaterMax:setName("NIL")
    self.btnAddWater:setVisible(false)

    if self.generatorObj and self.generatorObj:getObjectIndex() ~= -1 then
        local fuelPercentage = self.generatorObj:getFuelPercentage()
        local generatorCondition = self.generatorObj:getCondition()
        self.barFuel:setProgress(fuelPercentage / 100)
        self.lblGeneratorFuelAmount:setName(tostring(math.floor(fuelPercentage)) .. "%")
        self.barCondition:setProgress(generatorCondition / 100)
        self.lblGeneratorConditionAmount:setName(tostring(math.floor(generatorCondition)) .. "%")

        if self.generatorObj:isActivated() then
            self.lblGeneratorStatusToggle:setName(getText("IGUI_PRVIR_ISRVInteriorDashboard_GeneratorStatusOn"))
            self.lblGeneratorStatusToggle:setColor(0.3, 0.92, 0.3)
            self.btnGeneratorToggle.backgroundColor = {r = 0.35, g = 0.12, b = 0.12, a = 0.9}
            self.btnGeneratorToggle.borderColor = {r = 0.6, g = 0.3, b = 0.3, a = 0.8}
            self.btnGeneratorToggle:setTitle(getText("IGUI_PRVIR_ISRVInteriorDashboard_btnToggleOff"))
        else
            self.lblGeneratorStatusToggle:setName(getText("IGUI_PRVIR_ISRVInteriorDashboard_GeneratorStatusOff"))
            self.lblGeneratorStatusToggle:setColor(0.75, 0.3, 0.3)
            self.btnGeneratorToggle:setTitle(getText("IGUI_PRVIR_ISRVInteriorDashboard_btnToggleOn"))
            self.btnGeneratorToggle.backgroundColor = {r = 0.12, g = 0.25, b = 0.12, a = 0.9}
            self.btnGeneratorToggle.borderColor = {r = 0.3, g = 0.5, b = 0.3, a = 0.8}
        end

        if not self.generatorObj:isConnected() then
            self.connectBtn:setVisible(true)
        else
            self.btnGeneratorToggle:setVisible(true)
            self.btnRefuel:setVisible(true)
            self.btnFix:setVisible(true)
            self.btnAddWater:setVisible(true)
            if fuelPercentage < 100 then
                self.btnRefuel.backgroundColor = {r = 0.3, g = 0.22, b = 0.08, a = 0.9}
                self.btnRefuel.textColor = {r = 1, g = 0.9, b = 0.6, a = 1}
                self.btnRefuel:setEnable(true)
            else
                self.btnRefuel.backgroundColor = {r = 0.15, g = 0.15, b = 0.15, a = 0.9}
                self.btnRefuel.textColor = {r = 0.5, g = 0.5, b = 0.5, a = 1}
                self.btnRefuel:setEnable(false)
            end
            if generatorCondition < 100 then
                self.btnFix.backgroundColor = {r = 0.3, g = 0.3, b = 0.1, a = 0.9}
                self.btnFix.textColor = {r = 1, g = 0.9, b = 0.6, a = 1}
                self.btnFix:setEnable(true)
            else
                self.btnFix.backgroundColor = {r = 0.2, g = 0.2, b = 0.2, a = 0.9}
                self.btnFix.textColor = {r = 0.7, g = 0.7, b = 0.7, a = 1}
                self.btnFix:setEnable(false)
            end
        end
    end

    if self.waterObj and #self.waterObj > 0  then
        local amount, total = 0, 0
        for i, object in ipairs(self.waterObj) do
            if object:getObjectIndex() ~= -1 then
                total = total + object:getFluidCapacity()
                amount = amount + object:getFluidAmount()
            end
        end
        self.barWaterStorage:setProgress(amount / total)
        self.barWaterStorage:setText(tostring(math.floor(amount)) .. "L")
        self.lblWaterMax:setName(tostring(total) .. "L")

        self.btnAddWater:setVisible(true)
        if amount < total then
            self.btnAddWater.backgroundColor = {r = 0.1, g = 0.2, b = 0.4, a = 0.9}
            self.btnAddWater.textColor = {r = 0.6, g = 0.85, b = 1, a = 1}
            self.btnAddWater:setEnable(true)
        else
            self.btnAddWater.backgroundColor = {r = 0.15, g = 0.15, b = 0.2, a = 0.9}
            self.btnAddWater.textColor = {r = 0.5, g = 0.5, b = 0.6, a = 1}
            self.btnAddWater:setEnable(false)
        end
    end
end

function PRVIR.ISRVInteriorDashboard:onClose()
    self:setVisible(false)
    self:removeFromUIManager()
    PRVIR.ISRVInteriorDashboard.instance = nil
end

function PRVIR.ISRVInteriorDashboard:onFix()
    if not self.generatorObj then return end
    if self.character:getInventory():containsTypeRecurse("ElectronicsScrap") then
        ISTimedActionQueue.add(ISPRVIRFixGenerator:new(self.character, self.faceObject, self.generatorObj))
    else
        self.character:Say(getText("IGUI_PRVIR_NoElectronicsScrap"))
    end
end

function PRVIR.ISRVInteriorDashboard:onConnect()
    if not self.generatorObj then return end
    ISTimedActionQueue.add(ISPRVIRConnectGenerator:new(self.character, self.faceObject, self.generatorObj))
end

function PRVIR.ISRVInteriorDashboard:onToggle()
    if not self.generatorObj then return end
    if not self.generatorObj:isActivated() and self.generatorObj:getFuelPercentage() <= 0 then
        self.character:Say(getText("IGUI_PRVIR_NoFuel"))
        return
    end
    ISTimedActionQueue.add(ISPRVIRToggleGenerator:new(self.character, self.faceObject, self.generatorObj, not self.generatorObj:isActivated()))
end

function PRVIR.ISRVInteriorDashboard:onRefuel()
    if self.generatorObj and self.generatorObj:getFuel() >= self.generatorObj:getMaxFuel() then return end

    local invItems = self.character:getInventory():getItems()
    local invGas = nil
    for i = 0, invItems:size() - 1 do
        local invItem = invItems:get(i)
        if invItem then
            if invItem:getFluidContainer() and invItem:getFluidContainer():contains(Fluid.Petrol) then
                invGas = invItem
                break
            end
        end
    end

    if not invGas then
        self.character:Say(getText("IGUI_PRVIR_NoGasCan"))
    else
        ISWorldObjectContextMenu.equip(self.character, self.character:getPrimaryHandItem(), invGas, true)
        ISTimedActionQueue.add(ISPRVIRAddFuel:new(self.character, self.faceObject, self.generatorObj, invGas, 70 + (invGas:getFluidContainer():getAmount() * 40)));
    end
end

function PRVIR.ISRVInteriorDashboard:onAddWater()
    if self.waterObj and #self.waterObj > 0 and self.barWaterStorage.progress < 100 then
        local invItems = self.character:getInventory():getItems()
        local invWater = nil

        for i = 0, invItems:size() - 1 do
            local invItem = invItems:get(i)
            if invItem then
                if invItem:getFluidContainer() and invItem:getFluidContainer():contains(Fluid.Water) then
                    invWater = invItem
                    break
                end
            end
        end

        if not invWater then
            self.character:Say(getText("IGUI_PRVIR_NoWater"))
        else
            ISWorldObjectContextMenu.equip(self.character, self.character:getPrimaryHandItem(), invWater, true)
            local waterContainer
            for i, object in ipairs(self.waterObj) do
                if object:getObjectIndex() ~= -1 then
                    if object:getFluidAmount() < object:getFluidCapacity() then
                        waterContainer = object
                        break
                    end
                end
            end
            ISTimedActionQueue.add(ISPRVIRAddWater:new(self.character, self.faceObject, invWater, waterContainer))
        end
    end
end

function PRVIR.ISRVInteriorDashboard:onKeyPress(key)
    if key == Keyboard.KEY_ESCAPE then
        self:onClose()
        return true
    end
    return false
end

function PRVIR.ISRVInteriorDashboard:update()
    if self.curSquare ~= self.character:getSquare() then
        self:onClose()
    end
    if self.updateIntervalCount > 10 then
        self:refreshData()
        self.updateIntervalCount = 0
    end
    self.updateIntervalCount = self.updateIntervalCount + 1
    ISPanel.update(self)
end

function PRVIR.ISRVInteriorDashboard:prerender()
    ISPanel.prerender(self)
    local padGeneral = math.floor(5 * PRVIR.getUIFontScale())
    local y = self.closeBtn.y + self.closeBtn.height + padGeneral * 2
    self:drawRect(padGeneral * 3, y, self.width - padGeneral * 6, 1, 0.4, 0.2, 0.3, 0.5)
    y = self.btnRefuel.y + self.btnRefuel.height + padGeneral * 2
    self:drawRect(padGeneral * 3, y, self.width - padGeneral * 6, 1, 0.4, 0.2, 0.3, 0.5)
end

function PRVIR.ISRVInteriorDashboard:new(x, y, character, faceObject)
    local width = 320 * PRVIR.getUIFontScale()
    local height = 300 * PRVIR.getUIFontScale()
    local o = ISPanel:new(x - width / 2, y - height / 2, width, height)
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.backgroundColor = {r = 0.06, g = 0.06, b = 0.1, a = 0.94}
    o.borderColor = {r = 0.25, g = 0.35, b = 0.5, a = 0.9}
    o.moveWithMouse = true
    o.faceObject = faceObject
    o.generatorObj = nil
    o.waterObj = {}
    o.curSquare = nil
    o.updateIntervalCount = 0
    return o
end
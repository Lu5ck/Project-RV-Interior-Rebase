require "ISUI/ISCollapsableWindow"
require "ISUI/ISLabel"
require "ISUI/ISComboBox"
require "ISUI/ISTickBox"
require "ISUI/ISButton"


PRVIR.ISRVInteriorCustomLink = ISCollapsableWindow:derive("PRVIR.ISRVInteriorCustomLink")

function PRVIR.ISRVInteriorCustomLink:initialise()
	ISCollapsableWindow.initialise(self)
end

function PRVIR.ISRVInteriorCustomLink:data_onChange(lotID, isTaken)
    local selectedClass = self.cbLotClass.options[self.cbLotClass.selected].data
    local lotClass, lotIndex = PRVIR.getLotClassID(lotID)
    if selectedClass == lotClass then
            for i, k in ipairs(self.cbLotIndex.options) do
                if k.data == lotIndex then
                    if isTaken then
                        self.cbLotIndex.options[i].text = tostring(lotIndex) .. " [Taken]"
                    else
                        self.cbLotIndex.options[i].text = tostring(lotIndex)
                    end
                end
            end

            if isTaken and not self.tbShow.selected[2] then
                self.cbLotIndex:addOptionWithData(tostring(lotIndex), lotIndex)
            end
    end
end

function PRVIR.ISRVInteriorCustomLink:btnLink_onConfirm(btn)
    if btn.internal == "YES" then
        local selectedClass = self.cbLotClass.options[self.cbLotClass.selected].data
        local selectedIndex = self.cbLotIndex.options[self.cbLotIndex.selected].data
        local lotID = selectedClass .. "_" .. selectedIndex
        if isClient() and not isServer() then
            sendClientCommand(player, "PRVIR", "linkVehicleLot", { pzVehicleID = self.vehicle:getId(), lotID = lotID })
        else
            PRVIR.linkVehicleLot(getPlayer(), { vehicle = self.vehicle, lotID = lotID })
        end
    end
end

function PRVIR.ISRVInteriorCustomLink:btnLink_onClick(btn)
    local width = 250 * PRVIR.getUIFontScale()
    local height = 100 * PRVIR.getUIFontScale()
    local selectedClass = self.cbLotClass.options[self.cbLotClass.selected].data
    local selectedIndex = self.cbLotIndex.options[self.cbLotIndex.selected].data
    local lotID = selectedClass .. "_" .. selectedIndex
    local message
    if PRVIR.dbByLotID[lotID] then
        message = "Class [" .. selectedClass .. "] Index [" .. selectedIndex .. "] already taken, are you sure?"
    else
        message = "Linking to Class [" .. selectedClass .. "] Index [" .. selectedIndex .. "], are you sure?"
    end
    local modal = ISModalDialog:new((getCore():getScreenWidth() / 2) - (width / 2), (getCore():getScreenHeight() / 2) - (height / 2), width, height, message, true, self, self.btnLink_onConfirm, nil)
    modal:initialise()
    modal:addToUIManager()
end

function PRVIR.ISRVInteriorCustomLink:cbLotClass_onChange(cb)
    self:populateLotIndex()
end

function PRVIR.ISRVInteriorCustomLink:cbLotIndex_onChange(cb)
end

function PRVIR.ISRVInteriorCustomLink:tbShow_onChange(index, selected)
    self:populateLotClass()
    self:populateLotIndex()
end

function PRVIR.ISRVInteriorCustomLink:createChildren()
    ISCollapsableWindow.createChildren(self)

    local padTemp
    local padGeneral = math.floor(5 * PRVIR.getUIFontScale())
    local padTop = getTextManager():getFontHeight(UIFont.NewSmall) + 1
    local cbWidth = 175 * PRVIR.getUIFontScale()

    self.lblLotClass = ISLabel:new(0, padTop + padGeneral, getTextManager():getFontHeight(UIFont.NewMedium), getText("IGUI_PRVIR_ISRVInteriorCustomLink_LotClass"), 1, 1, 1, 1, UIFont.NewMedium, true)
    self.lblLotClass:initialise()
    self.lblLotClass:instantiate()
    self:addChild(self.lblLotClass)

    self.cbLotClass = ISComboBox:new(0, padTop + padGeneral, cbWidth, getTextManager():getFontHeight(UIFont.NewMedium), self, self.cbLotClass_onChange)
    self.cbLotClass:initialise()
    self.cbLotClass:instantiate()
    self:addChild(self.cbLotClass)

    padTemp = (self.width - (self.lblLotClass.width + padGeneral + padGeneral + self.cbLotClass.width)) / 2
    self.lblLotClass:setX(padTemp)
    self.cbLotClass:setX(padTemp + self.lblLotClass.width + padGeneral + padGeneral)

    self.lblLotIndex = ISLabel:new(0, 0, getTextManager():getFontHeight(UIFont.NewMedium), getText("IGUI_PRVIR_ISRVInteriorCustomLink_LotIndex"), 1, 1, 1, 1, UIFont.NewMedium, true)
    self.lblLotIndex:initialise()
    self.lblLotIndex:instantiate()
    self:addChild(self.lblLotIndex)

    self.cbLotIndex = ISComboBox:new(0, 0, cbWidth, getTextManager():getFontHeight(UIFont.NewMedium), self, self.cbLotIndex_onChange)
    self.cbLotIndex:initialise()
    self.cbLotIndex:instantiate()
    self:addChild(self.cbLotIndex)

    self.lblLotIndex:setX(self.cbLotClass.x - padGeneral - padGeneral - self.lblLotIndex.width)
    self.cbLotIndex:setX(self.cbLotClass.x)
    self.lblLotIndex:setY(self.lblLotClass.y + self.lblLotClass.height + padGeneral)
    self.cbLotIndex:setY(self.lblLotIndex.y)

    self.tbShow = ISTickBox:new(0, 0, getTextManager():getFontHeight(UIFont.NewSmall), getTextManager():getFontHeight(UIFont.NewSmall), "tbShow", self, self.tbShow_onChange)
    self.tbShow:initialise()
    self.tbShow:instantiate()
    self:addChild(self.tbShow)
    self.tbShow.autoWidth = true
    self.tbShow:addOption(getText("IGUI_PRVIR_ISRVInteriorCustomLink_ShowAllLots"))
    self.tbShow:addOption(getText("IGUI_PRVIR_ISRVInteriorCustomLink_ShowOccupied"))

    padTemp = (self.width - (padGeneral + padGeneral + self.tbShow.width)) / 2
    self.tbShow:setX(padTemp)
    self.tbShow:setY(self.lblLotIndex.y + self.lblLotIndex.height + padGeneral)

    local btnWidth = getTextManager():MeasureStringX(UIFont.NewMedium, getText("IGUI_PRVIR_ISRVInteriorCustomLink_ForceLink"))
    local btnHeight = getTextManager():MeasureStringY(UIFont.NewMedium, getText("IGUI_PRVIR_ISRVInteriorCustomLink_ForceLink"))
    self.btnLink = ISButton:new(0, 0, btnWidth + padGeneral * 6, btnHeight + padGeneral * 2, getText("IGUI_PRVIR_ISRVInteriorCustomLink_ForceLink"), self, self.btnLink_onClick)
    self.btnLink.internal = "btnLink"
    self.btnLink.borderColor = {r=0.5, g=0.5, b=0.5, a=1}
    self.btnLink.backgroundColor = {r=0, g=0, b=0, a=1}
    self.btnLink:initialise()
    self.btnLink:instantiate()
    self:addChild(self.btnLink)
    self.btnLink:setFont(UIFont.NewMedium)

    padTemp = (self.width - (self.btnLink.width + padGeneral + padGeneral)) / 2
    self.btnLink:setX(padTemp)
    self.btnLink:setY(self.tbShow.y + self.tbShow.height + padGeneral)

    self:setHeight(self.btnLink.y + self.btnLink.height + padGeneral + padGeneral)

    self:populateLotClass()
    self:populateLotIndex()
end

function PRVIR.ISRVInteriorCustomLink:populateLotClass()
    self.cbLotClass:clear()

    local vehicleID = PRVIR.getVehicleID(self.vehicle)
    local lotClass, lotIndex
    if vehicleID then
        if PRVIR.dbByVehicleID[vehicleID] then
            local lotID = PRVIR.dbByVehicleID[vehicleID].LotID
            if lotID then
                lotClass, lotIndex = PRVIR.getLotClassID(lotID)
            end
        end
    end

    local vehicleName = tostring(self.vehicle:getScript():getFullName())
    local default = PRVIR.vehiclesData[vehicleName]
    if self.tbShow.selected[1] then
        for k, v in pairs(PRVIR.lots) do
            local text = k
            if text == default then
                text = text .. " [Default]"
            end
            if text == lotClass then
                text = text .. " [Current]"
            end
            self.cbLotClass:addOptionWithData(text, k)
        end
    else
        self.cbLotClass:addOptionWithData(default .. " [Default]", default)
    end

    if lotClass then
        self.cbLotClass:selectData(lotClass)
    else
        self.cbLotClass:selectData(PRVIR.vehiclesData[vehicleName])
    end
end

function PRVIR.ISRVInteriorCustomLink:populateLotIndex()
    self.cbLotIndex:clear()

    local vehicleID = PRVIR.getVehicleID(self.vehicle)
    local curLotClass, curLotIndex
    if vehicleID then
        if PRVIR.dbByVehicleID[vehicleID] then
            local lotID = PRVIR.dbByVehicleID[vehicleID].LotID
            if lotID then
                curLotClass, curLotIndex = PRVIR.getLotClassID(lotID)
            end
        end
    end

    local selectedClass = self.cbLotClass.options[self.cbLotClass.selected].data
    local showAll = self.tbShow.selected[2]

    local occupiedIndexes = {}
    for lotID, _ in pairs(PRVIR.dbByLotID) do
        local lotClass, lotIndex = PRVIR.getLotClassID(lotID)
        if lotClass == selectedClass then
            occupiedIndexes[lotIndex] = true
        end
    end
    for i = 1, #PRVIR.lots[selectedClass].rooms do
        local isTaken = occupiedIndexes[i]
        if selectedClass == curLotClass and i == curLotIndex then
            self.cbLotIndex:addOptionWithData(tostring(i) .. " [Current]", i)
        elseif isTaken and showAll then
            self.cbLotIndex:addOptionWithData(tostring(i) .. " [Taken]", i)
        elseif not isTaken then
            self.cbLotIndex:addOptionWithData(tostring(i), i)
        end
    end

    if curLotIndex then
        self.cbLotIndex:selectData(curLotIndex)
    end
end

function PRVIR.ISRVInteriorCustomLink:close()
    ISCollapsableWindow.close(self)
    if PRVIR.customLink_instance ~= nil then
        PRVIR.customLink_instance:removeFromUIManager()
        PRVIR.customLink_instance = nil
    end
end

function PRVIR.ISRVInteriorCustomLink:prerender()
	ISCollapsableWindow.prerender(self)
end

function PRVIR.ISRVInteriorCustomLink:render()
	ISCollapsableWindow.render(self)
end

function PRVIR.ISRVInteriorCustomLink:new(x, y, width, height, vehicle)
    local o = ISCollapsableWindow:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.vehicle = vehicle
    o.showBackground = false
    o.backgroundColor = {r=0.15, g=0.15, b=0.15, a=1.0}
	o.showBorder = true
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1}
    o.title = getText("IGUI_PRVIR_ISRVInteriorCustomLink_Title")
    o.width = width
    o.height = height
	o.visibleTarget	= o
    o.moveWithMouse = true
    o.pin = true
    o:setResizable(false)
	o:setDrawFrame(true)
    return o
end
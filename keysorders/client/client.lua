_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("~u~Informations", "Informations")
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)

-- Keys
local keys = _menuPool:AddSubMenu(mainMenu, "Touches", '', true)

local walkietalkie = NativeUI.CreateItem("Talkie-Walkie", '')
local vehicleoptions = NativeUI.CreateItem("Options du Véhicule", '')
local trades = NativeUI.CreateItem("Métiers", '')
local servicetaking = NativeUI.CreateItem("Prise de Service", '')
local changevoice = NativeUI.CreateItem("Tonalité de Voix", '')
local chat = NativeUI.CreateItem("Ouvrir le Chat", '')

keys:AddItem(walkietalkie)
keys:AddItem(vehicleoptions)
keys:AddItem(trades)
keys:AddItem(servicetaking)
keys:AddItem(changevoice)
keys:AddItem(chat)

walkietalkie:RightLabel("~r~F2")
vehicleoptions:RightLabel("~r~F5")
trades:RightLabel("~r~F6")
servicetaking:RightLabel("~r~F11")
changevoice:RightLabel("~r~H")
chat:RightLabel("~r~T")

-- Orders
local orders = _menuPool:AddSubMenu(mainMenu, "Commandes", '', true)

local walkietalkie = NativeUI.CreateItem("Talkie-Walkie", '')
local vehicleoptions = NativeUI.CreateItem("Options du véhicule", '')

orders:AddItem(walkietalkie)
orders:AddItem(vehicleoptions)

walkietalkie:RightLabel("F2")
vehicleoptions:RightLabel("F5")

keys(mainMenu)
orders(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        _menuPool:MouseControlsEnabled(false)
        _menuPool:ControlDisablingEnabled(false)

        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 288) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)



local display = false

local sended = true
local isPlayerDead = false


function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while true do
        if IsPlayerDead(PlayerId()) then
            if isPlayerDead == false then 
                isPlayerDead = true
                SetDisplay(true)
				DisableControlAction(1, 244, true)
            end
        else 
            if isPlayerDead == true then
                isPlayerDead = false
                SetDisplay(false)
				DisableControlAction(1, 244, true)
            end
        end
        Citizen.Wait(100)
    end
end)

RegisterNUICallback('die', function ()
    
    SetDisplay(false)
	SetEntityCoordsNoOffset(PlayerPedId(), Config.ReviveCord, false, false, false, true)
    NetworkResurrectLocalPlayer(Config.ReviveCord, Config.ReviveHeading, true, false)
	SetPlayerInvincible(PlayerPedId(), false)
	ClearPedBloodDamage(PlayerPedId())

end)

RegisterNUICallback('sendDispatch', function()
    
    local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

    if sended then 
	Notification(Config.Locale.SendDispatch)
    sended = false
    print("sended")

    Citizen.Wait(1 * 60000)

    sended = true

    else

        Notification(Config.Locale.WaitTime)
    end

end)


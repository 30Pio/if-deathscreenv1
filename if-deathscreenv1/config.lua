-- For Support : https://discord.gg/if-developments
-- Please Add your suggests from Discord

Config = {}

Config.ReviveCord = vector3(-842.46, -1206.5, 6.41381) 
Config.ReviveHeading = 30.61 

Config.Locale = {
    SendDispatch = "A Dispatch send to your Location",
    WaitTime = "You Already sended a Dispatch please wait 1 Minute",
}


function Notification(message)

    TriggerEvent('notifications', 'red', 'AMBULANCE', message)
    
end

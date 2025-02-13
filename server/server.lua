local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('checkPlayerItem', function(source, cb, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player and Player.Functions.GetItemByName(item) then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('giveShinyCoin')
AddEventHandler('giveShinyCoin', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem("shiny_coin", amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["shiny_coin"], "add")
    end
end)

RegisterServerEvent('policeAlert')
AddEventHandler('policeAlert', function(coords)
    local alertMessage = "Suspicious activity detected near a phone box!"
    
    local players = QBCore.Functions.GetPlayers()
    for _, playerId in pairs(players) do
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player and Player.PlayerData.job.name == "police" then
            TriggerClientEvent("police:client:SendAlert", playerId, {
                title = "Phone Box Hacking",
                coords = coords,
                description = alertMessage
            })
        end
    end
end)
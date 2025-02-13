local QBCore = exports['qb-core']:GetCoreObject()
local cooldowns = {}

local phoneBoxProps = {
    "prop_phonebox_01a", "prop_phonebox_01b", "prop_phonebox_01c",
    "prop_phonebox_04", "p_phonebox_01b_s", "p_phonebox_02_s",
    "prop_phonebox_03", "prop_phonebox_02", "sf_prop_sf_phonebox_01b_s"
}

for _, prop in pairs(phoneBoxProps) do
    exports['qb-target']:AddTargetModel(prop, {
        options = {
            {
                icon = "fas fa-phone",
                label = "Insert Maintenance Card",
                action = function(entity)
                    StartPhoneBoxHack(entity)
                end
            }
        },
        distance = 1.5
    })
end

function StartPhoneBoxHack(entity)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(entity)
    local entityKey = string.format("%.2f,%.2f,%.2f", playerCoords.x, playerCoords.y, playerCoords.z)

    if cooldowns[entityKey] and cooldowns[entityKey] > GetGameTimer() then
        QBCore.Functions.Notify("This phonebox has recently been tampered with.", "error")
        return
    end

    QBCore.Functions.TriggerCallback('checkPlayerItem', function(hasCard)
        if hasCard then
            RequestAnimDict("anim@mp_player_intmenu@key_fob@")
            while not HasAnimDictLoaded("anim@mp_player_intmenu@key_fob@") do
                Wait(10)
            end
            TaskPlayAnim(playerPed, "anim@mp_player_intmenu@key_fob@", "fob_click", 3.0, -1, 2000, 49, 0, 0, 0, 0)

            QBCore.Functions.Progressbar("insert_card", "Inserting Maintenance Card...", 2500, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() 

                Wait(500)

                exports["glow_minigames"]:StartMinigame(function(success)
                    if success then
                        QBCore.Functions.Progressbar("bypass_accepted", "Maintenance Bypass Accepted...", 8000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() 
                            local rewardAmount = math.random(2, 6)
                            TriggerServerEvent('giveShinyCoin', rewardAmount)
                            QBCore.Functions.Notify("You found " .. rewardAmount .. " shiny coins!", "success")
                        end)

                        if math.random(1, 100) <= 50 then
                            TriggerServerEvent('policeAlert', playerCoords)
                        end
                    else
                        local health = GetEntityHealth(playerPed)
                        SetEntityHealth(playerPed, health - 15)
                        SetPedToRagdoll(playerPed, 3000, 3000, 0, false, false, false)
                        QBCore.Functions.Notify("You were electrocuted!", "error")
                        StartScreenEffect("DeathFailOut", 1.0, 0)
                        Wait(3000)
                        StopScreenEffect("DeathFailOut")
                    end
                end, "path")

                cooldowns[entityKey] = GetGameTimer() + (300 * 1000)

            end)
        else
            QBCore.Functions.Notify("You appear to be missing an item.", "error")
        end
    end, "maintenance_card")
end

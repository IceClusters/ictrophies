local currentTrophies = {}

Citizen.CreateThread(function()
    TriggerServerEvent("ice_trophies:server:getCurrentTrophies")
end)

RegisterNetEvent("ice_trophies:client:getCurrentTrophies")
AddEventHandler("ice_trophies:client:getCurrentTrophies", function(data)
    currentTrophies = data
end)

function NewTrophy(id)
    local alreadyExist = false
    if currentTrophies ~= nil then 
        for k, v in pairs(currentTrophies) do 
            if k == id then 
                alreadyExist = true
            end
        end
    end

    if alreadyExist then 
        return
    end

    if currentTrophies ~= nil then 
        TriggerServerEvent("ice_trophies:server:newTrophy", id, currentTrophies)
    else
        TriggerServerEvent("ice_trophies:server:newTrophy", id, {})
    end
    -- print("hola")
    -- SendNUIMessage({
    --     action = "NewTrophy",
    --     title = "Paquitoo",
    --     description = "Has ganado a paquito",
    --     difficult = "easy",
    --     confetti = true,
    --     sound = true
    -- })
end

exports('NewTrophy', NewTrophy)

Citizen.CreateThread(function()
    Wait(1000)
    exports['ice_trophies']:NewTrophy("fcar")
end)
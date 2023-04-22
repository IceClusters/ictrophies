local currentTrophies = {}
local trophiesRecived = false

Citizen.CreateThread(function()
    TriggerServerEvent("ice_trophies:server:getCurrentTrophies")
end)

RegisterNetEvent("ice_trophies:client:getCurrentTrophies")
AddEventHandler("ice_trophies:client:getCurrentTrophies", function(data)
    trophiesRecived = true
    currentTrophies = data
    print(json.encode(data))
end)

function NewTrophy(id)
    if not trophiesRecived then
        return
    end
    local alreadyExist = false
    if currentTrophies ~= nil then 
        for k, v in pairs(currentTrophies) do 
            if k == id then 
                alreadyExist = true
            end
        end
    end

    -- if alreadyExist then 
    --     return
    -- end
    if currentTrophies ~= nil then 

        TriggerServerEvent("ice_trophies:server:newTrophy", id, currentTrophies)
    else
        TriggerServerEvent("ice_trophies:server:newTrophy", id, {})
    end
    SendNUIMessage({
        action = "NewTrophy",
        title = Config.Trophies[id].title,
        description = Config.Trophies[id].description,
        type = Config.Trophies[id]["other"]["type"],
        confetti = Config.Trophies[id]["other"]["confetti"],
        sound = Config.Trophies[id]["other"]["sound"]
    })
end

RegisterCommand("trophy", function()
    NewTrophy("car")
end, false)

RegisterCommand("trophy2", function()
    NewTrophy("house")
end, false)

exports('NewTrophy', NewTrophy)
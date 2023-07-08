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


Citizen.CreateThread(function()
    TriggerServerCallback {
        eventName = 'ice-test:test',
        timeout = 5000,
        callback = function(result, data, value)
            print('pepe', result, data, value)
        end
    }
end)
RegisterKeyMapping("trophyList", "Open Trophies", "keyboard", "l")
RegisterCommand("trophyList", function()
    if(IsNuiFocused()) then 
        return
    end
    SendNUIMessage({
        action = "OpenMenu"
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("trophy", function()
    NewTrophy("car")
end, false)

RegisterCommand("trophy2", function()
    NewTrophy("house")
end, false)

RegisterNUICallback("ice_trophies:menuClose", function()
    SetNuiFocus(false, false)
end)

exports('NewTrophy', NewTrophy)
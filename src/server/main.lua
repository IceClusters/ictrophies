function GetLicense(id) 
    for k,v in pairs(GetPlayerIdentifiers(id)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
end

RegisterServerEvent("ice_trophies:server:getCurrentTrophies")
AddEventHandler("ice_trophies:server:getCurrentTrophies", function()
    local src = source
    local license = GetLicense(src)
    if Config.Mysql == "oxmysql" then
        local trophiesData = exports.oxmysql:query_async("SELECT trophies FROM players_trophies WHERE license = @license", {["@license"] = license})
        trophiesData = json.decode(trophiesData[1]["trophies"])
        TriggerClientEvent("ice_trophies:client:getCurrentTrophies", src, trophiesData)
    elseif Config.Mysql == "mysql-async" then

    else 
        print("Can't find mysql system")
    end
end)

RegisterServerEvent("ice_trophies:server:newTrophy")
AddEventHandler("ice_trophies:server:newTrophy", function(id, currentTrophies)
    currentTrophies[id] = os.date("%d/%m/%Y %H:%M")
    local src = source
    local license = GetLicense(src)
    if Config.Mysql == "oxmysql" then
        if #currentTrophies == 1 then 
            exports.oxmysql:query_async("INSERT INTO players_trophies ('license', 'trophies') VALUES (@license, @trophies)", {["@license"] = license,["@trophies"] = currentTrophies})
        else
            exports.oxmysql:query_async("UPDATE players_trophies SET trophies = @trophies WHERE license = @license", {["@license"] = license,["@trophies"] = json.encode(currentTrophies)})
        end
        TriggerClientEvent("ice_trophies:client:getCurrentTrophies", src, trophiesData)
    elseif Config.Mysql == "mysql-async" then

    else 
        print("Can't find mysql system")
    end
end)
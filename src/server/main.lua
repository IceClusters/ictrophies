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
    local steamName = GetPlayerName(src)
    if Config.Mysql == "oxmysql" then
        local trophiesData = exports.oxmysql:query_async("SELECT trophies FROM players_trophies WHERE license = @license", {["@license"] = license})
        if #trophiesData ~= 0 then 
            trophiesData = json.decode(trophiesData[1]["trophies"])
        else
            trophiesData = {}
        end
        TriggerClientEvent("ice_trophies:client:getCurrentTrophies", src, trophiesData, steamName)
    elseif Config.Mysql == "icemysql" then
        local trophiesData = exports["ice_mysql"]:MakeQuery(1, "SELECT trophies FROM players_trophies WHERE license = ?", {license})
        if #trophiesData ~= 0 then 
            trophiesData = json.decode(trophiesData[1]["trophies"])
        else
            trophiesData = {}
        end
        TriggerClientEvent("ice_trophies:client:getCurrentTrophies", src, trophiesData, steamName)
    else
        print("Can't find mysql system")
    end
end)

RegisterServerEvent("ice_trophies:server:newTrophy")
AddEventHandler("ice_trophies:server:newTrophy", function(id, currentTrophies)
    currentTrophies[id] = os.date("%d/%m/%Y %H:%M")
    local src = source
    local license = GetLicense(src)
    local count = 0
    for k,v in pairs(currentTrophies) do 
        count = count + 1
    end
    if Config.Mysql == "oxmysql" then
        if count == 1 then 
            exports.oxmysql:insert("INSERT INTO players_trophies (license, trophies) VALUES (@license, @trophies)", {["@license"] = license,["@trophies"] = json.encode(currentTrophies)})
        else
            exports.oxmysql:update("UPDATE players_trophies SET trophies = @trophies WHERE license = @license", {["@license"] = license,["@trophies"] = json.encode(currentTrophies)})
        end
        TriggerClientEvent("ice_trophies:client:getCurrentTrophies", src, currentTrophies)
    elseif Config.Mysql == "icemysql" then
        if count == 1 then 
            exports["ice_mysql"]:MakeQuery(1, "INSERT INTO players_trophies (license, trophies) VALUES (?, ?)", {license,json.encode(currentTrophies)})
        else
            local result = exports["ice_mysql"]:MakeQuery(1, "UPDATE players_trophies SET trophies = ? WHERE license = ?", {json.encode(currentTrophies), license})
        end
        TriggerClientEvent("ice_trophies:client:getCurrentTrophies", src, currentTrophies)
    else 
        print("Can't find mysql system")
    end
end)
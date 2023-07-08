-- Confetties types: 
-- 0 = easy
-- 1 = medium
-- 2 = hard

Config = {}
Config.Mysql = "oxmysql" -- mysql-async, oxmysql
Config.Trophies = {
    ["job"] = {
        ["title"] = "First Job",
        ["description"] = "Get your fist job in the server",
        ["other"] = {
            ["type"] = 0,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["house"] = {
        ["title"] = "First House",
        ["description"] = "Get your fist house in the server",
        ["other"] = {
            ["type"] = 1,
            ["confetti"] = false,
            ["sound"] = true
        },
    },
    ["car"] = {
        ["title"] = "First Car",
        ["description"] = "Get your fist car in the server",
        ["other"] = {
            ["type"] = 2,
            ["confetti"] = true,
            ["sound"] = false
        },
    },
}
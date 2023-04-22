Config = {}
Config.Mysql = "oxmysql" -- mysql-async, oxmysql
Config.Trophies = {
    ["job"] = {
        ["title"] = "First Job",
        ["description"] = "Get your fist job in the server",
        ["other"] = {
            ["type"] = "easy",
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["house"] = {
        ["title"] = "First House",
        ["description"] = "Get your fist house in the server",
        ["other"] = {
            ["type"] = "medium",
            ["confetti"] = false,
            ["sound"] = true
        },
    },
    ["car"] = {
        ["title"] = "First Car",
        ["description"] = "Get your fist car in the server",
        ["other"] = {
            ["type"] = "professional",
            ["confetti"] = true,
            ["sound"] = false
        },
    },
}
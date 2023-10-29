-- Confetties types: 
-- 0 = easy
-- 1 = medium
-- 2 = hard
-- 3 = master

Config = {}
Config.Mysql = "oxmysql" -- oxmysql, icemysql
Config.OpenMenu = "l" -- Key to open menu
Config.AchivementVolume = 0.4 -- Volume of notification sound (0.1 - 1.0)
Config.Trophies = {
    ["job"] = {
        ["title"] = "First Job",
        ["description"] = "Get your first job in the server ",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 0,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["house"] = {
        ["title"] = "First House",
        ["description"] = "Get your first house in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 1,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["car"] = {
        ["title"] = "First Car",
        ["description"] = "Get your first car in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 2,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["animation"] = {
        ["title"] = "First Shared Animation",
        ["description"] = "Get your first shared animation in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 1,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["weapon"] = {
        ["title"] = "First Weapon",
        ["description"] = "Get your first weapon in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 2,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["salary"] = {
        ["title"] = "First Salary",
        ["description"] = "Get your first salary in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 0,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["clothes"] = {
        ["title"] = "First Clothes",
        ["description"] = "Get your first clothes in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 3,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["item"] = {
        ["title"] = "First Item",
        ["description"] = "Get your first item in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 0,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
    ["phone"] = {
        ["title"] = "First Phone",
        ["description"] = "Get your first phone in the server",
        ["reward"] = {
            ["enable"] = true, -- active [true] or disable [false]
            ["type"] = "money", -- money, item
            ["amount"] = 1000, -- amount of money or item
            ["item"] = "bread", -- item name [if type is item only]           
        },
        ["other"] = {
            ["type"] = 3,
            ["confetti"] = true,
            ["sound"] = true
        },
    },
}
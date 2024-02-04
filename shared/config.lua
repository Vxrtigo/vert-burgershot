Config = {}

Config.Debug = false

Config.Job = "burgershot" -- Required Job

Config.Blips = { -- Supports multiple locations
    [1] = {
        coords = vector3(-1185.55, -892.56, 13.80),
        sprite = 106,
        color = 1,
        scale = 0.7,
        text = "Burgershot",
        enable = true,
    },
--[[     [2] = {
        coords = vector3(0, 0, 0),
        sprite = 106,
        color = 1,
        scale = 0.7,
        text = "Burgershot",
        enable = true,
    }, ]]
}

Config.FoodWarmers = { -- Food Warmer Polyzone Locations
    [1] = {
        coords = vector3(-1187.67, -896.92, 13.8),
        minZ = 11.2,
        maxZ = 15.2,
        name = "Foodwarmer 1", -- Stash Name
        heading = 35,
        slots = 15, -- Amount of slots for the stash
        weight = 40000, -- Weight for the stash
    },
    [2] = {
        coords = vector3(-1191.17, -903.83, 13.8),
        minZ = 11.2,
        maxZ = 15.2,
        name = "Foodwarmer 2",
        heading = 304,
        slots = 15,
        weight = 40000,
    },
}

Config.Counters = { -- Counter Polyzone Locations
    [1] = {
        coords = vector3(-1191.14, -896.06, 13.8), 
        radius = 0.4,
        name = "Counter 1", -- Stash Name
        slots = 10, -- Amount of slots for the stash
        weight = 40000, -- Weight for the stash
    },
    [2] = {
        coords = vector3(-1189.57, -894.96, 13.76),
        radius = 0.4,
        name = "Counter 2",
        slots = 10, 
        weight = 40000, 
    },
    [3] = {
        coords = vector3(-1188.51, -894.28, 13.8),
        radius = 0.4,
        name = "Counter 3",
        slots = 10, 
        weight = 40000, 
    },
    [4] = {
        coords = vector3(-1193.97, -905.38, 13.8),
        radius = 0.4,
        name = "Counter 4",
        slots = 10, 
        weight = 40000,
    },
}

Config.Grill = { -- Grill Polyzone Location
    [1] = {
        coords = vector3(-1186.89, -900.59, 13.8),
        minZ = 10.4,
        maxZ = 14.4,
        heading = 34,
    }
}

Config.Fryer = { -- Fryer Polyzone Location
    [1] = {
        coords = vector3(-1187.46, -899.59, 13.8),
        minZ = 10.4,
        maxZ = 14.4,
        heading = 34,
    }
}

Config.ChoppingStation = { -- Chopping Polyzone Location
    [1] = {
        coords = vector3(-1185.24, -902.03, 13.8),
        radius = 0.4,
    }
}

Config.PrepStation = { -- Prepping Station Polyzone Location
    [1] = {
        coords = vector3(-1186.08, -899.47, 13.8),
        minZ = 10.4,
        maxZ = 14.4,
        heading = 34,
    }
}

Config.IngredientsStore = { -- Store Polyzone Location
    [1] = {
        coords = vector3(-1192.1, -898.08, 13.8),
        minZ = 11.0,
        maxZ = 15.0,
        heading = 304,
    }
}

Config.DrinkStations = { -- Drink Polyzone Location
    [1] = {
        coords = vector3(-1191.58, -897.74, 13.8),
        minZ = 10.6,
        maxZ = 14.6,
        heading = 304,
    },
    [2] = {
        coords = vector3(-1191.02, -905.6, 13.8),
        minZ = 11.4,
        maxZ = 15.4,
        heading = 35,
    }
}

Config.GrillItems = { -- Items for the grill
    ['groundbeef'] = { -- Name of the required item
        required = 'groundbeef', -- Required Item
        reward = 'burgerpatty', -- Given Item
        amount = 1, -- Item amount to give
        progressbar = 'Cooking Beef', -- Progress bar label
        choptime = 6, -- Time in seconds required to chop
    },
    ['rawbacon'] = { -- Bacon
        required = 'rawbacon',
        reward = 'cookedbacon',
        amount = 1,
        progressbar = 'Cooking Bacon',
        choptime = 6,
    },
}

Config.FryerItems = { -- Items for the fryer
    ['burger_shotnuggets'] = { -- Name of the reward item. This functions different than the single items since it requires multiple ingredients
        required = { -- required items to craft
        ['groundchicken'] = { amount = 1}, --put require item name in brackets folled by = the amount needed to craft
        ['salt'] = { amount = 1},
        ['breadcrumbs'] = { amount = 1},
        },
        reward = 'burger_shotnuggets', -- Given Item
        amount = 1, -- Item amount to give
        progressbar = 'Frying Chicken', -- Progress bar label
        choptime = 6, -- Time in seconds required to chop
    },
    ['burger_fries'] = { 
        required = { 
        ['slicedpotato'] = { amount = 1}, 
        ['salt'] = { amount = 1},
        },
        reward = 'burger_fries', 
        amount = 1, 
        progressbar = 'Frying Fries',
        choptime = 6,
    },
    ['burger_shotrings'] = {
        required = { 
        ['slicedonion'] = { amount = 1}, 
        ['salt'] = { amount = 1},
        },
        reward = 'burger_shotrings',
        amount = 1,
        progressbar = 'Frying Onion Rings',
        choptime = 6,
    },
}

Config.ChoppingItems = { -- Items to chop
    ['rawbeef'] = { -- Name of the required item
        required = 'rawbeef', -- Required Item
        reward = 'groundbeef', -- Given Item
        amount = 1, -- Item amount to give
        progressbar = 'Grinding Beef', -- Progress bar label
        choptime = 6, -- Time in seconds required to chop
    },
    ['rawchicken'] = {
        required = 'rawchicken',
        reward = 'groundchicken',
        amount = 1,
        progressbar = 'Grinding Chicken',
        choptime = 6,
    },
    ['rawpotato'] = {
        required = 'rawpotato',
        reward = 'slicedpotato',
        amount = 1,
        progressbar = 'Slicing Potato',
        choptime = 6,
    },
    ['rawonion'] = {
        required = 'rawonion',
        reward = 'slicedonion',
        amount = 1,
        progressbar = 'Dicing Onion',
        choptime = 6,
    },
}

Config.PreppingItems = { -- Items to prepare
    ['bacon_cheeseburger'] = { -- Name of the reward item. This functions different than the single items since it requires multiple ingredients
    required = { -- required items to craft
        ['burgerpatty'] = { amount = 1}, --put require item name in brackets followed by = the amount needed to craft
        ['cookedbacon'] = { amount = 1},
        ['cheese'] = { amount = 1},
        ['burgerbun'] = { amount = 1},
    },
    reward = 'bacon_cheeseburger', -- Given Item
    amount = 1, -- Item amount to give
    progressbar = 'Making Burger', -- Progress bar label
    choptime = 6, -- Time in seconds required to chop
    },
    ['burger_moneyshot'] = {
    required = { 
        ['burgerpatty'] = { amount = 2}, 
        ['cookedbacon'] = { amount = 1},
        ['cheese'] = { amount = 2},
        ['burgerbun'] = { amount = 1},
    },
    reward = 'burger_moneyshot', 
    amount = 1, 
    progressbar = 'Making Bacon Burger', 
    choptime = 6, 
    },
    ['burger_bleeder'] = {
    required = {
        ['burgerpatty'] = { amount = 1},
        ['cheese'] = { amount = 1},
        ['burgerbun'] = { amount = 1},
        ['slicedonion'] = { amount = 1},
    },
    reward = 'burger_bleeder',
    amount = 1, 
    progressbar = 'Making Bleeder Burger',
    choptime = 6,
    },
    ['burger_heartstopper'] = {
    required = {
        ['burgerpatty'] = { amount = 4}, 
        ['cookedbacon'] = { amount = 2},
        ['cheese'] = { amount = 4},
        ['burgerbun'] = { amount = 1},
    },
    reward = 'burger_heartstopper',
    amount = 1, 
    progressbar = 'Making Heartstopper Burger',
    choptime = 6,
    },
    ['burger_torpedo'] = {
    required = {
        ['burgerpatty'] = { amount = 1}, 
        ['cookedbacon'] = { amount = 1},
        ['cheese'] = { amount = 1},
        ['burgerbun'] = { amount = 1},
        ['slicedonion'] = { amount = 1},
    },
    reward = 'burger_torpedo',
    amount = 1, 
    progressbar = 'Making Torpedo Burger',
    choptime = 6,
    },
}

Config.DrinkItems = { -- Items for the drink machine
    ['burger_softdrink'] = { -- Name of the reward item. This functions different than the single items since it requires multiple ingredients
        required = { -- required items to craft
            ['cola'] = { amount = 1}, --put require item name in brackets folled by = the amount needed to craft
            ['emptycup'] = { amount = 1},
        },
        reward = 'burger_softdrink', -- Given Item
        amount = 1, -- Item amount to give
        progressbar = 'Pouring Soft Drink', -- Progress bar label
        choptime = 6, -- Time in seconds required to chop
    },
    ['burger_coffee'] = {
        required = { 
            ['coffeebeans'] = { amount = 1}, 
            ['creamer'] = { amount = 1},
        },
        reward = 'burger_coffee', 
        amount = 1, 
        progressbar = 'Pouring Coffee',
        choptime = 6, 
    },
}
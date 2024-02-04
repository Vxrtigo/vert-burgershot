local QBCore = exports['qb-core']:GetCoreObject()
local blips = {}

for k, v in pairs(Config.FoodWarmers) do
    exports.ox_target:addBoxZone({
        coords = v.coords,
        size = vec3(1.4, 1.0, 2.3),
        rotation = v.heading,
        debug = Config.Debug,
        options = {
            {
                name = 'foodwarmers',
                icon = 'fas fa-fire',
                label = 'Open Food Warmer',
                distance = 1.5,
                groups = Config.Job,
                onSelect = function()
                    exports.ox_inventory:openInventory('stash', v.name)
                end
            }
        }
    })
end

for k, v in pairs(Config.Counters) do
    exports.ox_target:addSphereZone({
        coords = v.coords,
        radius = v.radius,
        debug = Config.Debug,
        options = {
            {
                name = 'foodtray',
                icon = 'fas fa-box',
                label = 'Open Food Tray',
                distance = 1.5,
                onSelect = function()
                    exports.ox_inventory:openInventory('stash', v.name)
                end
            }
        }
    })
end

for k, v in pairs(Config.Grill) do
    exports.ox_target:addBoxZone({
        coords = v.coords,
        size = vec3(1.4, 1.0, 1.0),
        rotation = v.heading,
        debug = Config.Debug,
        options = {
            {
                name = 'grill',
                icon = 'fas fa-utensils',
                label = 'Cook Food',
                distance = 1.5,
                groups = Config.Job,
                onSelect = function()
                    TriggerEvent('vert-burgershot:client:OpenCookMenu')
                end
            }
        }
    })
end

for k, v in pairs(Config.Fryer) do
    exports.ox_target:addBoxZone({
        coords = v.coords,
        size = vec3(1.4, 1.0, 1.0),
        rotation = v.heading,
        debug = Config.Debug,
        options = {
            {
                name = 'fryer',
                icon = 'fas fa-utensils',
                label = 'Fry Food',
                distance = 1.5,
                groups = Config.Job,
                onSelect = function()
                    TriggerEvent('vert-burgershot:client:OpenFryerMenu')
                end
            }
        }
    })
end

for k, v in pairs(Config.ChoppingStation) do
    exports.ox_target:addSphereZone({
        coords = v.coords,
        radius = v.radius,
        debug = Config.Debug,
        options = {
            {
                name = 'choppingstation',
                icon = 'fas fa-scissors',
                label = 'Slice Food',
                distance = 1.5,
                groups = Config.Job,
                onSelect = function()
                    TriggerEvent('vert-burgershot:client:OpenChopMenu')
                end
            }
        }
    })
end

for k, v in pairs(Config.PrepStation) do
    exports.ox_target:addBoxZone({
        coords = v.coords,
        size = vec3(0.8, 2.0, 1.0),
        rotation = v.heading,
        debug = Config.Debug,
        options = {
            {
                name = 'prepstation',
                icon = 'fas fa-burger',
                label = 'Prepare Food',
                distance = 1.5,
                groups = Config.Job,
                onSelect = function()
                    TriggerEvent('vert-burgershot:client:OpenPrepMenu')
                end
            }
        }
    })
end

for k, v in pairs(Config.IngredientsStore) do
    exports.ox_target:addBoxZone({
        coords = v.coords,
        size = vec3(2.2, 0.6, 3.0),
        rotation = v.heading,
        debug = Config.Debug,
        options = {
            {
                name = 'ingredients',
                icon = 'fas fa-cart-shopping',
                label = 'Buy Ingredients',
                distance = 1.5,
                groups = Config.Job,
                onSelect = function()
                    exports.ox_inventory:openInventory('shop', { type = 'burgershot'})
                end
            }
        }
    })
end

for k, v in pairs(Config.DrinkStations) do
    exports.ox_target:addBoxZone({
        coords = v.coords,
        size = vec3(1.4, 0.4, 1.4),
        rotation = v.heading,
        debug = Config.Debug,
        options = {
            {
                name = 'drinks',
                icon = 'fas fa-mug-hot',
                label = 'Make Drinks',
                distance = 1.5,
                groups = Config.Job,
                onSelect = function()
                    TriggerEvent('vert-burgershot:client:OpenDrinkMenu')
                end
            }
        }
    })
end

RegisterNetEvent('vert-burgershot:client:OpenCookMenu', function()
    lib.registerContext({
        id = 'Cook_Station',
        title = 'Burgershot Cooking Station',
        options = {
          {
            title = 'Cook Beef',
            icon = 'fas fa-burger',
            event = 'vert-burgershot:client:StartGrill',
            args = {
                Item = "groundbeef",
            }
          },
          {
            title = 'Cook Bacon',
            icon = 'fas fa-bacon',
            event = 'vert-burgershot:client:StartGrill',
            args = {
                Item = "rawbacon",
            }
          },
        }
      })   
      lib.showContext('Cook_Station')
end)

RegisterNetEvent('vert-burgershot:client:OpenFryerMenu', function()
    lib.registerContext({
        id = 'Frying_Station',
        title = 'Burgershot Frying Station',
        options = {
        {
            title = 'Fry Chicken',
            description = 'Requires: 1x Ground Chicken, 1x Breadcrumbs, and 1x Salt',
            icon = 'fas fa-egg',
            event = 'vert-burgershot:client:StartFryer',
            args = {
                Item = "burger_shotnuggets",
            }
        },
        {
            title = 'Fry Potatoes',
            description = 'Requires: 1x Sliced Potato and 1x Salt',
            icon = 'fas fa-utensils',
            event = 'vert-burgershot:client:StartFryer',
            args = {
                Item = 'burger_fries',
            }
        },
        {
            title = 'Fry Onions',
            description = 'Requires: 1x Sliced Onion and 1x Salt',
            icon = 'fas fa-utensils',
            event = 'vert-burgershot:client:StartFryer',
            args = {
                Item = "burger_shotrings",
            }
        },
        }
    })   
    lib.showContext('Frying_Station')
end)

RegisterNetEvent('vert-burgershot:client:OpenChopMenu', function()
    lib.registerContext({
        id = 'Chop_Station',
        title = 'Burgershot Chopping Station',
        options = {
          {
            title = 'Grind Beef',
            icon = 'fas fa-burger',
            event = 'vert-burgershot:client:StartPrep',
            args = {
                Item = "rawbeef",
            }
          },
          {
            title = 'Grind Chicken',
            icon = 'fas fa-egg',
            event = 'vert-burgershot:client:StartPrep',
            args = {
                Item = "rawchicken",
            }
          },
          {
            title = 'Slice Potatoes',
            icon = 'fas fa-scissors',
            event = 'vert-burgershot:client:StartPrep',
            args = {
                Item = "rawpotato",
            }
          },
          {
            title = 'Dice Onions',
            icon = 'fas fa-scissors',
            event = 'vert-burgershot:client:StartPrep',
            args = {
                Item = "rawonion",
            }
          },
        }
      })   
      lib.showContext('Chop_Station')
end)

RegisterNetEvent('vert-burgershot:client:OpenPrepMenu', function()
    lib.registerContext({
        id = 'Prep_Station',
        title = 'Burgershot Preparing Station',
        options = {
          {
            title = 'Cook Bacon Cheeseburger',
            description = 'Requires: 1x Beef Patty, 1x Bacon, 1x Cheese, 1x Burger Buns',
            icon = 'fas fa-burger',
            event = 'vert-burgershot:client:BuildBurger',
            args = {
                Item = "bacon_cheeseburger",
            }
          },
          {
            title = 'Cook Moneyshot Burger',
            description = 'Requires: 2x Beef Patty, 1x Bacon, 2x Cheese, 1x Burger Buns',
            icon = 'fas fa-burger',
            event = 'vert-burgershot:client:BuildBurger',
            args = {
                Item = "burger_moneyshot",
            }
          },
          {
            title = 'Cook Bleeder Burger',
            description = 'Requires: 1x Beef Patty, 1x Cheese, 1x Burger Buns, 1x Sliced Onion',
            icon = 'fas fa-burger',
            event = 'vert-burgershot:client:BuildBurger',
            args = {
                Item = "burger_bleeder",
            }
          },
          {
            title = 'Cook Heartstopper Burger',
            description = 'Requires: 4x Beef Patty, 4x Cheese, 1x Burger Buns, 2x Bacon',
            icon = 'fas fa-burger',
            event = 'vert-burgershot:client:BuildBurger',
            args = {
                Item = "burger_heartstopper",
            }
          },
          {
            title = 'Cook Torpedo Burger',
            description = 'Requires: 1x Beef Patty, 1x Cheese, 1x Burger Buns, 1x Bacon, 1x Sliced Onion',
            icon = 'fas fa-burger',
            event = 'vert-burgershot:client:BuildBurger',
            args = {
                Item = "burger_torpedo",
            }
          },
        }
      })   
      lib.showContext('Prep_Station')
end)

RegisterNetEvent('vert-burgershot:client:OpenDrinkMenu', function()
    lib.registerContext({
        id = 'Drink_Station',
        title = 'Burgershot Drink Station',
        options = {
        {
            title = 'Soft Drink',
            description = 'Requires: 1x cola and 1x cup',
            icon = 'fas fa-mug-hot',
            event = 'vert-burgershot:client:PourDrink',
            args = {
                Item = "burger_softdrink",
            }
        },
        {
            title = 'Coffee',
            description = 'Requires: 1x Coffee Beans and 1x Creamer',
            icon = 'fas fa-mug-hot',
            event = 'vert-burgershot:client:PourDrink',
            args = {
                Item = 'burger_coffee',
            }
        },
        }
    })   
    lib.showContext('Drink_Station')
end)

RegisterNetEvent('vert-burgershot:client:StartGrill', function(data) -- Cooking Food
    local Input = lib.inputDialog('How many items would you like to cook?', {
        {type = 'number', label = 'How many items would you like to cook?',},
    })
    local Time = (Config.GrillItems[data.Item].choptime * 1000) * Input[1]
    QBCore.Functions.TriggerCallback('vert-burgershot:server:StartCook', function(cb)
        if cb then
            QBCore.Functions.Progressbar('grill food', Config.GrillItems[data.Item].progressbar, Time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "amb@prop_human_bbq@male@base",
            anim = "base",
            flags = 1,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('vert-burgershot:server:BeginCook', data.Item, Input[1])
            end, function()
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled...', 'error', 7500)
            end)
        end
    end, data.Item, Input[1])
end)

RegisterNetEvent('vert-burgershot:client:StartFryer', function(data) -- Frying Food
    local Input = lib.inputDialog('How many items would you like to fry?', {
        {type = 'number', label = 'How many items would you like to fry?',},
    })
    local Time = (Config.FryerItems[data.Item].choptime * 1000) * Input[1]
    QBCore.Functions.TriggerCallback('vert-burgershot:server:StartFrying', function(cb)
        if cb then
            QBCore.Functions.Progressbar('fry food', Config.FryerItems[data.Item].progressbar, Time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "amb@prop_human_bbq@male@base",
            anim = "base",
            flags = 1,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('vert-burgershot:server:BeginFrying', data.Item, Input[1])
            end, function()
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled...', 'error', 7500)
            end)
        end
    end, data.Item, Input[1])
end)

RegisterNetEvent('vert-burgershot:client:StartPrep', function(data) -- Prepping
    local Input = lib.inputDialog('How many items would you like to slice?', {
        {type = 'number', label = 'How many items would you like to slice?',},
    })
    local Time = (Config.ChoppingItems[data.Item].choptime * 1000) * Input[1]
    QBCore.Functions.TriggerCallback('vert-burgershot:server:StartPrep', function(cb)
        if cb then
            QBCore.Functions.Progressbar('prep food', Config.ChoppingItems[data.Item].progressbar, Time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_coccutter",
            flags = 1,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('vert-burgershot:server:BeginPrep', data.Item, Input[1])
            end, function()
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled...', 'error', 7500)
            end)
        end
    end, data.Item, Input[1])
end)

RegisterNetEvent('vert-burgershot:client:BuildBurger', function(data) -- Making Burgers
    local Input = lib.inputDialog('How many items would you like to prepare?', {
        {type = 'number', label = 'How many items would you like to prepare?',},
    })
    local Time = (Config.PreppingItems[data.Item].choptime * 1000) * Input[1]
    QBCore.Functions.TriggerCallback('vert-burgershot:server:BuildBurger', function(cb)
        if cb then
            QBCore.Functions.Progressbar('prepare food', Config.PreppingItems[data.Item].progressbar, Time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@amb@business@coc@coc_unpack_cut_left@",
            anim = "coke_cut_coccutter",
            flags = 1,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('vert-burgershot:server:BeginBuilding', data.Item, Input[1])
            end, function()
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled...', 'error', 7500)
            end)
        end
    end, data.Item, Input[1])
end)

RegisterNetEvent('vert-burgershot:client:PourDrink', function(data) -- Making Burgers
    local Input = lib.inputDialog('How many drinks would you like to pour?', {
        {type = 'number', label = 'How many drinks would you like to pour?',},
    })
    local Time = (Config.DrinkItems[data.Item].choptime * 1000) * Input[1]
    QBCore.Functions.TriggerCallback('vert-burgershot:server:PourDrink', function(cb)
        if cb then
            QBCore.Functions.Progressbar('prepare food', Config.DrinkItems[data.Item].progressbar, Time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@amb@casino@mini@drinking@bar@drink@heels@two",
            anim = "two_bartender",
            flags = 1,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('vert-burgershot:server:BeginPouring', data.Item, Input[1])
            end, function()
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled...', 'error', 7500)
            end)
        end
    end, data.Item, Input[1])
end)

CreateThread(function()
    for k,v in pairs(Config.Blips) do
        if v.enable then
            blips[k] = AddBlipForCoord(v.coords)
            SetBlipSprite(blips[k], v.sprite)
            SetBlipDisplay(blips[k], 4)
            SetBlipScale(blips[k], v.scale)
            SetBlipAsShortRange(blips[k], true)
            SetBlipColour(blips[k], v.color)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.text)
            EndTextCommandSetBlipName(blips[k]) 
        end   
    end
end)
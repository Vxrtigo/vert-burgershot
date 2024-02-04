local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for k, v in pairs(Config.FoodWarmers) do
        exports.ox_inventory:RegisterStash(v.name, v.name, Config.FoodWarmers[k].slots, Config.FoodWarmers[k].weight)
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Counters) do
        exports.ox_inventory:RegisterStash(v.name, v.name, Config.Counters[k].slots, Config.Counters[k].weight)
    end
end)

QBCore.Functions.CreateCallback('vert-burgershot:server:StartCook', function(source, cb, Item, Amount)
    local src = source
        if exports.ox_inventory:GetItemCount(src, Item, nil, true) < 1 * Amount then
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough items!', 'error')
            return cb(false)
        end
    return cb(true)
end)

RegisterServerEvent('vert-burgershot:server:BeginCook', function(Item, Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        if not Player.Functions.RemoveItem(Item, Config.GrillItems[Item].amount * Amount) then
            return false
        end
    Player.Functions.AddItem(Config.GrillItems[Item].reward, Config.GrillItems[Item].amount * Amount)
end)

QBCore.Functions.CreateCallback('vert-burgershot:server:StartFrying', function(source, cb, Item, Amount)
    local src = source
        for k, v in pairs(Config.FryerItems[Item].required) do
            if exports.ox_inventory:GetItemCount(src, k, nil, true) < 1 * v.amount then
                TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough items!', 'error')
                return cb(false)
            end
        end
    return cb(true)
end)

RegisterServerEvent('vert-burgershot:server:BeginFrying', function(Item, Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.FryerItems[Item].required) do
        if not Player.Functions.RemoveItem(k, Config.FryerItems[Item].amount * v.amount) then
            return false
        end
    end    
    Player.Functions.AddItem(Config.FryerItems[Item].reward, Config.FryerItems[Item].amount * Amount)
end)

QBCore.Functions.CreateCallback('vert-burgershot:server:StartPrep', function(source, cb, Item, Amount)
    local src = source
        if exports.ox_inventory:GetItemCount(src, Item, nil, true) < 1 * Amount then
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough items!', 'error')
            return cb(false)
        end
    return cb(true)
end)

RegisterServerEvent('vert-burgershot:server:BeginPrep', function(Item, Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        if not Player.Functions.RemoveItem(Item, Config.ChoppingItems[Item].amount * Amount) then
            return false
        end
    Player.Functions.AddItem(Config.ChoppingItems[Item].reward, Config.ChoppingItems[Item].amount * Amount)
end)

QBCore.Functions.CreateCallback('vert-burgershot:server:BuildBurger', function(source, cb, Item, Amount)
    local src = source
        for k, v in pairs(Config.PreppingItems[Item].required) do
            if exports.ox_inventory:GetItemCount(src, k, nil, true) < v.amount then
                TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough items!', 'error')
                return cb(false)
            end
        end
    return cb(true)
end)

RegisterServerEvent('vert-burgershot:server:BeginBuilding', function(Item, Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.PreppingItems[Item].required) do
        if not Player.Functions.RemoveItem(k, Config.PreppingItems[Item].amount * v.amount) then
            return false
        end
    end    
    Player.Functions.AddItem(Config.PreppingItems[Item].reward, Config.PreppingItems[Item].amount * Amount)
end)

QBCore.Functions.CreateCallback('vert-burgershot:server:PourDrink', function(source, cb, Item, Amount)
    local src = source
        for k, v in pairs(Config.DrinkItems[Item].required) do
            if exports.ox_inventory:GetItemCount(src, k, nil, true) < v.amount then
                TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough items!', 'error')
                return cb(false)
            end
        end
    return cb(true)
end)

RegisterServerEvent('vert-burgershot:server:BeginPouring', function(Item, Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.DrinkItems[Item].required) do
        if not Player.Functions.RemoveItem(k, Config.DrinkItems[Item].amount * v.amount) then
            return false
        end
    end    
    Player.Functions.AddItem(Config.DrinkItems[Item].reward, Config.DrinkItems[Item].amount * Amount)
end)

--[[ AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
        exports.ox_inventory:RegisterStash('foodwarmer', "Burgershot Food Warmer", 15, 120000, nil)
end) ]]
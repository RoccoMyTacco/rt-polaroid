local QBCore = exports['qb-core']:GetCoreObject()

sv_configable = {}

sv_configable.Webhook = "" --Discord webhook

sv_configable.AttachCID = false ---attach player Citizenid to the polaroidfilm item

QBCore.Functions.CreateUseableItem("polaroid", function(source, item)
    local src = source
    TriggerClientEvent("rt-polaroid:client:use-camera", src)
end)

QBCore.Functions.CreateUseableItem("polaroidfilm", function(source, item)
    local src = source
    if item.info.border and item.info.photourl then
        TriggerClientEvent("rt-polaroid:client:use-photo", src, item.info.photourl, item.info.border)
    end
end)

QBCore.Functions.CreateUseableItem("yellowfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 1)
    end
end)

QBCore.Functions.CreateUseableItem("orangefilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 2)
    end
end)

QBCore.Functions.CreateUseableItem("greyfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 3)
    end
end)

QBCore.Functions.CreateUseableItem("blackfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 4)
    end
end)

QBCore.Functions.CreateUseableItem("pureblackfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 5)
    end
end)

QBCore.Functions.CreateUseableItem("lightbluefilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 6)
    end
end)

QBCore.Functions.CreateUseableItem("greenfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 7)
    end
end)

QBCore.Functions.CreateUseableItem("pinkfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 8)
    end
end)

QBCore.Functions.CreateUseableItem("redfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 9)
    end
end)

QBCore.Functions.CreateUseableItem("bluefilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 10)
    end
end)

QBCore.Functions.CreateUseableItem("purpfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 11)
    end
end)

QBCore.Functions.CreateUseableItem("byefilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 12)
    end
end)

QBCore.Functions.CreateUseableItem("floralfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 13)
    end
end)

QBCore.Functions.CreateUseableItem("randfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, 0)
    end
end)
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
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "yellow")
    end
end)

QBCore.Functions.CreateUseableItem("orangefilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "orange")
    end
end)

QBCore.Functions.CreateUseableItem("greyfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "grey")
    end
end)

QBCore.Functions.CreateUseableItem("blackfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "black")
    end
end)

QBCore.Functions.CreateUseableItem("lightbluefilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "lightblue")
    end
end)

QBCore.Functions.CreateUseableItem("greenfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "green")
    end
end)

QBCore.Functions.CreateUseableItem("pinkfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "pink")
    end
end)

QBCore.Functions.CreateUseableItem("redfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "red")
    end
end)

QBCore.Functions.CreateUseableItem("bluefilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "blue")
    end
end)

QBCore.Functions.CreateUseableItem("purpfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "purple")
    end
end)

QBCore.Functions.CreateUseableItem("floralfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "floralpink")
    end
end)

QBCore.Functions.CreateUseableItem("randfilm", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('polaroid') ~= nil then
        TriggerClientEvent("rt-polaroid:client:use-film", src, item, "rand")
    end
end)
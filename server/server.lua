local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("rt-polaroid:server:add-photo-item", function(url, film)
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)
    if ply then
        local info = {
            photourl = url,
            border = film
        }
        if sv_configable.AttachCID then
            info.id = ply.PlayerData.citizenid
        end
        ply.Functions.AddItem("polaroidfilm", 1, nil, info)
    end
end)

RegisterNetEvent("rt-polaroid:server:add-photo-film", function(border, info)
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)
    if ply then
        ply.Functions.AddItem(border, 1, nil, info)
    end
end)

QBCore.Functions.CreateCallback("rt-polaroid:server:webhook",function(source,cb)
	if sv_configable.Webhook ~= "" then
		cb(sv_configable.Webhook)
	else
		print("Invalid Webhook")
        cb(nil)
	end
end)

RegisterNetEvent("rt-polaroid:server:items", function(state, item, amount, info)
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)
    if ply and state and item then
        if info then
            if state == "add" then
                ply.Functions.AddItem(item, amount, nil, info)
            elseif state == "remove" then
                ply.Functions.RemoveItem(item, amount)
            end
        else
            if state == "add" then
                ply.Functions.AddItem(item, amount, nil)
            elseif state == "remove" then
                ply.Functions.RemoveItem(item, amount)
            end
        end 
    end
end)

RegisterNetEvent('rt-polaroid:server:UpdateInfo', function(item, state, amount, border)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local items = Player.Functions.GetItemByName(item)
    if state == 0 then
        Player.PlayerData.items[items.slot].info.film = amount
        if border then
            Player.PlayerData.items[items.slot].info.border = border
        end
        Player.Functions.SetInventory(Player.PlayerData.items)
    elseif state == 1  then
        Player.PlayerData.items[items.slot].info.film = Player.PlayerData.items[items.slot].info.film + amount
        Player.Functions.SetInventory(Player.PlayerData.items)
    elseif state == 2 then 
        Player.PlayerData.items[items.slot].info.film = Player.PlayerData.items[items.slot].info.film - amount
        Player.Functions.SetInventory(Player.PlayerData.items)
    elseif state == 3 then 
        Player.PlayerData.items[items.slot].info.film = 0
        Player.PlayerData.items[items.slot].info.border = nil
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)
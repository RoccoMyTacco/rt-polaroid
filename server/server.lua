local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("rt-polaroid:server:add-photo-item", function(url, film)
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)
    if ply then
        local info = {
            photourl = url,
            border = film
        }
        if Config.AttachCID then
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
		cb(nil)
	end
end)
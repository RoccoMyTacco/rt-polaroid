local QBCore = exports['qbx-core']:GetCoreObject()
local active = false
local photoactive = false
local cameraprop = nil
local photoprop = nil
local fov_max = cl_configable.MaxZoom
local fov_min = cl_configable.MinZoom
local zoomspeed = cl_configable.ZoomSpeed
local speed_lr = 8.0
local speed_ud = 8.0
local fov = (fov_max+fov_min)*0.5
local presstake = false
math.randomseed(GetGameTimer())

local function SharedRequestAnimDict(animDict, cb)
	if not HasAnimDictLoaded(animDict) then
		RequestAnimDict(animDict)

		while not HasAnimDictLoaded(animDict) do
			Wait(1)
		end
	end
	if cb ~= nil then
		cb()
	end
end

local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
      RequestModel(GetHashKey(model))
      Wait(10)
    end
end

local function FullClose()
    active = false
    presstake = false
    if cameraprop then DeleteEntity(cameraprop) end
    ClearPedTasks(PlayerPedId())
end

--FUNCTIONS--

function HideHUDThisFrame()
    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()
    HideHudComponentThisFrame(1) -- Wanted Stars
    HideHudComponentThisFrame(2) -- Weapon icon
    HideHudComponentThisFrame(3) -- Cash
    HideHudComponentThisFrame(4) -- MP CASH
    HideHudComponentThisFrame(6)
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(8)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(13) -- Cash Change
    HideHudComponentThisFrame(11) -- Floating Help Text
    HideHudComponentThisFrame(12) -- more floating help text
    HideHudComponentThisFrame(15) -- Subtitle Text
    HideHudComponentThisFrame(18) -- Game Stream
    HideHudComponentThisFrame(19) -- weapon wheel
end

function CheckInputRotation(cam, zoomvalue)
    local rightAxisX = GetDisabledControlNormal(0, 220)
    local rightAxisY = GetDisabledControlNormal(0, 221)
    local rotation = GetCamRot(cam, 2)
    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
        new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5)
        SetCamRot(cam, new_x, 0.0, new_z, 2)
        SetEntityHeading(PlayerPedId(),new_z)
    end
end

function HandleZoom(cam)
    local lPed = PlayerPedId()
    if not ( IsPedSittingInAnyVehicle( lPed ) ) then

        if IsControlJustPressed(0,241) then
            fov = math.max(fov - zoomspeed, fov_min)
        end
        if IsControlJustPressed(0,242) then
            fov = math.min(fov + zoomspeed, fov_max)
        end
        local current_fov = GetCamFov(cam)
        if math.abs(fov-current_fov) < 0.1 then
            fov = current_fov
        end
        SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
    else
        if IsControlJustPressed(0,17) then
            fov = math.max(fov - zoomspeed, fov_min)
        end
        if IsControlJustPressed(0,16) then
            fov = math.min(fov + zoomspeed, fov_max)
        end
        local current_fov = GetCamFov(cam)
        if math.abs(fov-current_fov) < 0.1 then
            fov = current_fov
        end
        SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
    end
end

RegisterNetEvent("rt-polaroid:client:use-camera", function(item)
    local test = PlayerPedId()
    local vehicle = IsPedSittingInAnyVehicle(test)
    if not active and not vehicle then
        active = true
        local ped = PlayerPedId()
        SharedRequestAnimDict(cl_configable.CameraAnimationDic, function()
            TaskPlayAnim(ped, cl_configable.CameraAnimationDic, cl_configable.CameraAnimationName, 2.0, 2.0, -1, 1, 0, false, false, false)
        end)
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if not HasModelLoaded(cl_configable.CameraProp) then
            LoadPropDict(cl_configable.CameraProp)
        end
        cameraprop = CreateObject(GetHashKey(cl_configable.CameraProp), x, y, z+0.2,  true,  true, true)
        AttachEntityToEntity(cameraprop, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        SetModelAsNoLongerNeeded(cl_configable.CameraProp)

        CreateThread(function()
            while active do

                Wait(200)
                local lPed = PlayerPedId()
                if active then
                    active = true
                    Wait(500)

                    if cl_configable.CameraEffect ~= "" then
                        SetTimecycleModifier(cl_configable.CameraEffect)
                        if cl_configable.CameraEffectStrength ~= "" then
                             SetTimecycleModifierStrength(cl_configable.CameraEffectStrength)
                        end
                    end

                    local cam = CreateCam(cl_configable.CameraName, true)
                    AttachCamToEntity(cam, lPed, cl_configable.CameraX, cl_configable.CameraY, cl_configable.CameraZ, true)
                    SetCamRot(cam, 0.0,0.0,GetEntityHeading(lPed))
                    SetCamFov(cam, fov)
                    RenderScriptCams(true, false, 0, true, false)

                    DisableControlAction(1, 106, true)
                    DisableControlAction(1, 140, true)
                    DisableControlAction(1, 141, true)
                    DisableControlAction(1, 142, true)
                    DisableControlAction(1, 37, true)
                    DisableControlAction(0, 176, true)
                    DisablePlayerFiring(lPed, true)

                    if not cl_configable.TextUI then
                        if item.info.film == nil or item.info.film <= 0 then
                            QBCore.Functions.Notify("You have no film in the camera", "error", 2000)
                        else
                            QBCore.Functions.Notify("You have ".. item.info.film .. " film in the camera", "error", 2000)
                        end
                    else
                        lib.showTextUI("You have ".. item.info.film .. " film in the camera")
                    end
                    if item.info.film and item.info.film > 0 then
                        QBCore.Functions.Notify("Press F To unload film from polaroid", "error", 2000)
                    end
                    while active and not IsEntityDead(lPed) do
                        if IsControlJustPressed(0, 177) or IsControlJustPressed(0, 202) then
                            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            FullClose()
                        elseif IsDisabledControlJustPressed(0, 176) then
                            if item.info.film then
                                if item.info.film > 0 then
                                    if not presstake then
                                        presstake = true
                                        QBCore.Functions.TriggerCallback("rt-polaroid:server:webhook", function(hook)
                                            if hook then
                                                exports['screenshot-basic']:requestScreenshotUpload(tostring(hook), "files[]", function(data)
                                                    local image = json.decode(data)
                                                    FullClose()
                                                    local newStr = string.gsub(item.info.border, "film", "")
                                                    if newStr == "rand" then
                                                        if cl_configable.RandomFilms then
                                                            local rand = math.random(1, #cl_configable.RandomFilms)
                                                            local info = {
                                                                photourl = json.encode(image.attachments[1].proxy_url),
                                                                border = cl_configable.RandomFilms[rand]
                                                            }
                                                            TriggerServerEvent("rt-polaroid:server:items", "add", "polaroidfilm", 1, info)
                                                        end
                                                    else
                                                        local info = {
                                                            photourl = json.encode(image.attachments[1].proxy_url),
                                                            border = newStr
                                                        }
                                                        TriggerServerEvent("rt-polaroid:server:items", "add", "polaroidfilm", 1, info)
                                                    end
                                                    TriggerServerEvent("rt-polaroid:server:UpdateInfo", "polaroid", 2, 1)
                                                end)
                                            end
                                        end)
                                    end
                                end
                            end
                        elseif IsControlPressed(0, 23) and item.info.film > 0 then
                            local info = {
                                film = item.info.film
                            }
                            TriggerServerEvent("rt-polaroid:server:items", "add", item.info.border .. "film", 1, info)
                            QBCore.Functions.Notify("You have unloaded the film from the camera", "error", 2200)
                            TriggerServerEvent("rt-polaroid:server:UpdateInfo", "polaroid", 3)
                            FullClose()

                        end

                        local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
                        CheckInputRotation(cam, zoomvalue)
                        HandleZoom(cam)
                        HideHUDThisFrame()
                        Wait(1)
                    end
                    FullClose()
                    ClearTimecycleModifier()
                    fov = (fov_max+fov_min)*0.5
                    RenderScriptCams(false, false, 0, true, false)
                    DestroyCam(cam, false)
                    SetNightvision(false)
                    SetSeethrough(false)
                end
            end
        end)
    else
        FullClose()
        if cl_configable.TextUI then
            lib.hideTextUI()
        end
    end
end)

RegisterNetEvent("rt-polaroid:client:use-photo", function(url, border)
    if not photoactive then
        photoactive = true
        SetNuiFocus(true, true)
        SendNUIMessage({action = "Show", photo = url, film = border})

        local ped = PlayerPedId()
        SharedRequestAnimDict("amb@world_human_tourist_map@male@base", function()
            TaskPlayAnim(ped, "amb@world_human_tourist_map@male@base", "base", 2.0, 2.0, -1, 1, 0, false, false, false)
        end)
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if not HasModelLoaded("prop_cs_polaroid") then
            LoadPropDict("prop_cs_polaroid")
        end
        photoprop = CreateObject(GetHashKey("prop_cs_polaroid"), x, y, z+0.2,  true,  true, true)
        AttachEntityToEntity(photoprop, ped, GetPedBoneIndex(ped, 6286), 0.04, 0.0, -0.07, -50.0, 280.0, 2.0, true, true, false, true, 1, true)
        SetModelAsNoLongerNeeded("prop_cs_polaroid")
    end
end)

RegisterNUICallback("Close", function()
    SetNuiFocus(false, false)
    photoactive = false
    if photoprop then DeleteEntity(photoprop) end
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent("rt-polaroid:client:use-film", function(item, camera, bordercolor)
    if bordercolor and item then
        if camera.info.film == nil or camera.info.film == 0 then
            TriggerServerEvent("rt-polaroid:server:items", "remove", item.name, 1)
            if item.info.film then
                TriggerServerEvent("rt-polaroid:server:UpdateInfo", "polaroid", 0, item.info.film, bordercolor)
            else
                TriggerServerEvent("rt-polaroid:server:UpdateInfo", "polaroid", 0, cl_configable.DefaultPictureAmount, bordercolor)
            end
        else
            local info = {
                film = camera.info.film
            }
            local test = camera.info.border .. "film"
            TriggerServerEvent("rt-polaroid:server:items", "add", test, 1, info)
            TriggerServerEvent("rt-polaroid:server:items", "remove", item.name, 1)
            if item.info.film then
                TriggerServerEvent("rt-polaroid:server:UpdateInfo", "polaroid", 0, item.info.film, bordercolor)
            else
                TriggerServerEvent("rt-polaroid:server:UpdateInfo", "polaroid", 0, 5, bordercolor)
            end

        end
    end
end)
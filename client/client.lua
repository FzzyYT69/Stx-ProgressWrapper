local QBCore = exports['qb-core']:GetCoreObject()


if Config.Core = 'qb-core' then
    RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
        TriggerServerEvent('stx-prog:server:checkifprogmade')
    end)
elseif Config.Core = 'rsg-core' then
    RegisterNetEvent("RSGCore:Client:OnPlayerLoaded", function()
        TriggerServerEvent('stx-prog:server:checkifprogmade')
    end)
end


function StxProgress(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
        QBCore.Functions.TriggerCallback("stx-prog:server:callback:getprog", function(result)
            if result == nil then print('No Prog Found Yet') end
            local Player = QBCore.Functions.GetPlayerData()
            local cidd = Player.citizenid
            for _, v in pairs (result) do
                for k=1, #Config.ProgressBarsSett do
                    print('No Prog Found Yet')
                    if v.progress == Config.ProgressBarsSett[k].id then
                        Config.ProgressBarsSett[k].exportfunction(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
                    end
                end
            end
        end)
end

RegisterCommand('progsett', function()
    TriggerServerEvent('stx-prog:server:checkifprogmade')
    TriggerEvent('stx-prog:client:changeprogress')
end)

RegisterNetEvent('stx-prog:client:changeprogress', function()
    local menus = {}
    for k=1, #Config.ProgressBarsSett do
        menus[#menus + 1] = {
            title = Config.ProgressBarsSett[k].name,
            onSelect = function()
                TriggerServerEvent('stx-prog:server:changetprogto'..Config.ProgressBarsSett[k].name)
            end
        }
    end
    lib.registerContext({
        id = 'stx_prog_menu',
        title = "Customize Your ProgressBar",
        menu = 'progressbarmenu_stx',
        options = menus
    })
    lib.showContext('stx_prog_menu')
end)

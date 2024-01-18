local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('stx-prog:server:checkifprogmade', function()
    local src = source
    local pPlayer = QBCore.Functions.GetPlayer(src)
    local cid = pPlayer.PlayerData.citizenid
    local resulta = MySQL.scalar.await('SELECT progress FROM progressbar WHERE citizenid = ?', {cid})
    if not resulta then
        TriggerClientEvent('QBCore:Notify', src, "No Data Found In Database On Your Citizen ID (ProgressBars)", 'error')
        Wait(1000)
        TriggerClientEvent('QBCore:Notify', src, "Progress Bar Is Setting Up (ProgressBars)", 'error')
        Wait(500)
        MySQL.insert('INSERT INTO progressbar (citizenid, progress) VALUES (?, ?)', {cid, 'old'})
        TriggerClientEvent('QBCore:Notify', src, "Set Up Completed (ProgressBars)", 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, "Initializing Progressbar", 'error')
    end
end)


for k=1, #Config.ProgressBarsSett do
    RegisterServerEvent('stx-prog:server:changetprogto'..Config.ProgressBarsSett[k].name, function()
        local src = source
        local pPlayer = QBCore.Functions.GetPlayer(src)
        local cid = pPlayer.PlayerData.citizenid
        MySQL.update("UPDATE progressbar SET progress = ? WHERE citizenid = ?", {Config.ProgressBarsSett[k].id, cid})
    end)
end

if Config.lib ~= 'ox' then
    QBCore.Functions.CreateCallback("stx-prog:server:callback:getprog", function(source, cb)
        local src = source
        local pData = QBCore.Functions.GetPlayer(src)
        local cid = pData.PlayerData.citizenid
        MySQL.query('SELECT * FROM progressbar WHERE citizenid = ?', {cid}, function(result)
            if result then
                cb(result)
            else
                cb(nil)
            end
        end)
    end)
end

lib.callback.register('stx-prog:server:callback:getprog', function(source)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    MySQL.query('SELECT * FROM progressbar WHERE citizenid = ?', {cid}, function(result)
        if result then
            return result
        else
            return nil
        end
    end)
end)

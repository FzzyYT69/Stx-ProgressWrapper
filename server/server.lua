local QBCore = exports['qb-core']:GetCoreObject()

local data1 = {
    title = 'Progress Bar',
    description = 'No Data Found In Database On Your Citizen ID (ProgressBars)',
    type = 'warning'
}

local data2 = {
    title = 'Progress Bar',
    description = 'Progress Bar Is Setting Up',
    type = 'warning'
}

local data3 = {
    title = 'Progress Bar',
    description = 'Set Up Completed',
    type = 'success'
}

local data4 = {
    title = 'Progress Bar',
    description = 'Initializing Progressbar',
    type = 'success'
}

RegisterServerEvent('stx-prog:server:checkifprogmade', function()
    local src = source
    local pPlayer = QBCore.Functions.GetPlayer(src)
    local cid = pPlayer.PlayerData.citizenid
    local resulta = MySQL.scalar.await('SELECT progress FROM progressbar WHERE citizenid = ?', {cid})
    if not resulta then
        TriggerClientEvent('ox_lib:notify', src, data1)
        Wait(1000)
        TriggerClientEvent('ox_lib:notify', src, data2)
        Wait(500)
        MySQL.insert('INSERT INTO progressbar (citizenid, progress) VALUES (?, ?)', {cid, Config.DefaultProg})
        TriggerClientEvent('ox_lib:notify', src, data3)
    else
        TriggerClientEvent('ox_lib:notify', src, data4)
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

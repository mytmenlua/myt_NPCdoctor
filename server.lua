
local esx_ambulance = exports.esx_ambulancejob


RegisterNetEvent('myt_ems', function ()
    local playerId = source
    TriggerClientEvent('esx_ambulancejob:revive', playerId)
end)

local ox_inventory = exports.ox_inventory

RegisterNetEvent("myt_ems:Paidse", function(item,price)
    local playerid = source
    ox_inventory:RemoveItem(playerid, item, price)
end)


RegisterNetEvent("myt_ems:buyMedical", function(item,count)
    local playerid = source
    ox_inventory:AddItem(playerid, item, count)
end)

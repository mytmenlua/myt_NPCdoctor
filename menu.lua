
exports.ox_target:addSphereZone({
  coords =  vec3(311.8480, -592.7266, 43.2841) ,
  size = vec3(2, 2, 2),
  rotation = 10,
  debug = drawZones,
  drawSprite = true,
  options = {
  {
  name = "Doktor",
  event = "Openmenu",
  icon = "fa-solid fa-money-bill",
  label = Config.Label3,
  }
  }
  })

  local lib = exports.ox_lib
  local ox_inventory = exports.ox_inventory
  
    lib:registerContext({
    id = 'menu',
    title = 'Doctor Store',
    options = {
        {
            title = myt.Bandagename,
            icon = "fa-solid fa-bandage",
            arrow = false,
            event = "BuyBandage",
            metadata = {myt.Bandagetitle}
        },
        {
            title = myt.Medkitname,
            icon = "fa-solid fa-suitcase-medical",
            arrow = false,
            event = "BuyMedkit",
            metadata = {myt.Medkititle}
        }
    }
})

RegisterNetEvent("Openmenu", function()
    lib:showContext("menu")
end)

RegisterNetEvent("BuyBandage", function(item,count)
    local playerid = source
    if ox_inventory:GetItemCount(Config.Item, metadata, strict) <= myt.BandageCost then 
        TriggerEvent("Notifyerror")
    elseif ox_inventory:GetItemCount(Config.Item, metadata, strict) >= myt.BandageCost then
    TriggerServerEvent("myt_ems:buyMedical", "bandage", 4)
    Citizen.Wait(1)
    TriggerServerEvent("myt_ems:Paidse", Config.Item, myt.BandageCost)
    end
end)

RegisterNetEvent("BuyMedkit", function(item,count)
    local playerid = source
    if ox_inventory:GetItemCount(Config.Item, metadata, strict) <= myt.MedkitCost then 
        TriggerEvent("Notifyerror")
    elseif ox_inventory:GetItemCount(Config.Item, metadata, strict) >= myt.MedkitCost then
    TriggerServerEvent("myt_ems:buyMedical", myt.Medkititem, 1)
    TriggerServerEvent("myt_ems:Paidse", Config.Item, myt.MedkitCost)
    end
end)
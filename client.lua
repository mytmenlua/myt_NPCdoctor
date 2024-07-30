

local peds = { {  type = 4, model = Config.ped, CoordsPos = vector4(311.8480, -592.7266, 43.2841 -0.99, 356.7642)}
  } ----------------------------------------------------------------cant change-----------------------------

---------------Do not change if you dont know what are you doing-------------------------------------------------------------------------------------------------------------------------------------------------------

local ox_inventory = exports.ox_inventory

lib.callback("ox_inventory:getItemCount", false, function(count) return count
end,
Config.Item)


Citizen.CreateThread(function()
  for k,v in pairs(peds) do
    local hash = GetHashKey(v.model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
      Citizen.Wait(1)
    end

    ped = CreatePed(v.type, hash, v.CoordsPos.x, v.CoordsPos.y, v.CoordsPos.z, v.CoordsPos.w, false, true)
    FreezeEntityPosition( ped, true)
    SetPedCanRagdollFromPlayerImpact( ped, false)
    SetPedDiesWhenInjured( ped , false)
    SetEntityInvincible( ped, true)
    SetPedCanPlayAmbientAnims(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped,'WORLD_HUMAN_GUARD_STAND',0,true)
  end
end)

  local lib = exports.ox_lib
  local playerid = source
  local playerped = GetPlayerPed(playerid)

RegisterNetEvent("Progressbar", function()
  if ox_inventory:GetItemCount(Config.Item, metadata, strict) <= Config.Cost then 
    TriggerEvent("Notifyerror")
elseif ox_inventory:GetItemCount(Config.Item, metadata, strict) >= Config.Cost then
  if lib:progressBar({
  duration = Config.Duration,
  label = Config.Label2,
  useWhileDead = true,
  canCancel = true,
  disable = {
      car = true,
      move = true,
  },
  anim = {
    dict = 'misscarsteal4@actor',
    clip = 'actor_berating_loop'
  },
  prop = {
  },
}) then
  TriggerServerEvent("myt_ems")
  Citizen.Wait(1000) 
  lib:notify({
  title = Config.Notify1,
  description = Config.Notify2,
  position = 'top',
  type = 'success'
})
Citizen.Wait(1000)
TriggerServerEvent("myt_ems:Paidse", Config.Item, Config.Cost) 
lib:notify({
  title = Config.Notify3,
  description = Config.Notify4,
  position = 'top',
  type = 'success'
}) end
end
end)


exports.ox_target:addBoxZone({
  coords =  vec3(311.8480, -592.7266, 43.2841) ,
  size = vec3(2, 2, 2),
  rotation = 10,
  debug = drawZones,
  drawSprite = true,
  options = {
  {
  name = "Doktor",
  event = "Progressbar",
  icon = "fa-solid fa-heart",
  label = Config.Label,
  }
  }
  })

RegisterNetEvent("Notifyerror")
AddEventHandler("Notifyerror", function()
  lib:notify({
    title = Config.Notify5,
    description = Config.Notify6,
    position = 'top',
    type = 'error'
  })
end)

------------------------------------------------------------------------------------------------------


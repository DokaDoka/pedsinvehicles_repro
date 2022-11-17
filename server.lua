RegisterCommand('test', function(source, args, rawCommand)
    local ped = GetPlayerPed(source)
    local entity = GetVehiclePedIsIn(ped)

    if entity then
        DeleteEntity(entity)
    end

    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    local vehicle = CreateVehicleServerSetter(`buffalo`, 'automobile', coords.x, coords.y, coords.z, heading)

    if DoesEntityExist(vehicle) then
        for i = 1, 50 do
            Wait(0)
            SetPedIntoVehicle(ped, vehicle, -1)

            if GetVehiclePedIsIn(ped, false) == vehicle then
                break
            end
        end
    end
end)

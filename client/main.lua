Citizen.CreateThreadNow(function()
  Locales:Init();
end);

Command:RegisterInput('+clothingmenu', function()
  local ped = PlayerPed.handle;

  if IsEntityInAir(ped) or IsPedInAnyVehicle(ped, false) or IsEntityDead(ped) then
    return;
  end

  Menu:StartDrawing();
end, Locales:Get('command.open'), Config.DefaultMapper);

Command:Register('-clothingmenu', function()
  Menu:StopDrawing();
end);

RegisterNUICallback('NuiFocus', function(req, resp)
  resp('OK');

  SetNuiFocusKeepInput(req.display);
  SetNuiFocus(req.display, req.display);
end);



RegisterNUICallback('ToggleClothing', function(req, resp)
  local clothe = PlayerPed.bones[req.name];

  resp('OK');

  if clothe.component then
    return Clothes:ToggleComponent(req.name, clothe);
  end

  Clothes:ToggleProp(req.name, clothe);
end);

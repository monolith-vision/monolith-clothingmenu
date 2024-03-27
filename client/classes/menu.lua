Menu = {
  drawing = false
};

function Menu:StartDrawing()
  self.drawing = true;

  local _, screenX, screenY = false, 0, 0;
  local camCoord = vec3(0, 0, 0);
  local dist = 1.0;
  local boneCoords = vec3(0, 0, 0);
  local bones = {
    hat = { x = 0, y = 0 },
    glasses = { x = 0, y = 0 },
    mask = { x = 0, y = 0 },
    vest = { x = 0, y = 0 },
    shirt = { x = 0, y = 0 },
    torso = { x = 0, y = 0 },
    pants = { x = 0, y = 0 },
    shoes = { x = 0, y = 0 },
    watch_l = { x = 0, y = 0 },
    watch_r = { x = 0, y = 0 },
    chain = { x = 0, y = 0 }
  };

  SetCursorLocation(0.5, 0.5);

  NUI:TriggerEvent('ToggleDisplay', true);

  -- max 6.21 min 2.01

  while self.drawing do
    camCoord = GetFinalRenderedCamCoord();

    for name, bone in next, PlayerPed.bones do
      boneCoords = GetPedBoneCoords(PlayerPed.handle, bone.id, bone.offset.x, bone.offset.y, bone.offset.z);

      dist = #(camCoord - boneCoords);

      _, screenX, screenY = GetScreenCoordFromWorldCoord(boneCoords.x, boneCoords.y, boneCoords.z);

      bones[name].x = screenX;
      bones[name].y = screenY;
      bones[name].on = bone.on;
      bones[name].scale = 0.5 + (1 - 0.5) * ((dist - 6.22) / (2.004 - 6.22));
    end

    DisableControlAction(0, 140, true);
    DisableControlAction(0, 141, true);
    DisableControlAction(0, 142, true);

    NUI:TriggerEvent('SetBones', bones);

    Citizen.Wait(0);
  end

  NUI:TriggerEvent('ToggleDisplay', false);
end

function Menu:StopDrawing()
  self.drawing = false;
end

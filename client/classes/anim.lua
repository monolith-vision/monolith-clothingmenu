Anim = {};

---@param dict string
function Anim:Load(dict)
  if HasAnimDictLoaded(dict) then
    return;
  end

  RequestAnimDict(dict);

  while not HasAnimDictLoaded(dict) do
    Citizen.Wait(0);
  end
end

---@param name string
---@param dict string
---@param flag number
---@param duration number
function Anim:Play(name, dict, flag, duration)
  self:Load(dict);

  TaskPlayAnim(PlayerPed.handle, dict, name, 3.0, 3.0, duration, flag or 0, 0, false, false, false);

  repeat
    Citizen.Wait(0);
  until IsEntityPlayingAnim(PlayerPed.handle, dict, name, 3)

  Citizen.Wait(duration);

  ClearPedTasks(PlayerPed.handle);
end

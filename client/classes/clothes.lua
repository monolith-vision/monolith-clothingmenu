Clothes = {};

---@param name string
---@param clothe { component: number; on: boolean }
function Clothes:ToggleComponent(name, clothe)
  local bool = not clothe.on;

  if clothe.component == 11 and PlayerPed.bones.shirt.on == false then
    self:ToggleComponent('shirt', {
      component = 8,
      on = not bool
    });
  end

  local cfg = Config.Clothes[name];
  local anim = cfg.anim;

  if not bool then
    local current = PlayerPed.currentClothes['comp_' .. clothe.component];

    Anim:Play(anim.on.name, anim.on.dict, anim.on.flag, anim.on.duration);

    SetPedComponentVariation(PlayerPed.handle, clothe.component, current.drawable, current.texture, 0);

    if clothe.component == 8 then
      local arms = PlayerPed.currentClothes['comp_3'];

      if arms then
        SetPedComponentVariation(PlayerPed.handle, 3, arms.drawable, arms.texture, 0);
      end
    end

    PlayerPed.bones[name].on = bool;
    return;
  end

  local drawable = GetPedDrawableVariation(PlayerPed.handle, clothe.component)
  local gender = IsPedMale(PlayerPed.handle) and 'male' or 'female';

  PlayerPed.currentClothes['comp_' .. clothe.component] = {
    drawable = drawable,
    texture = GetPedTextureVariation(PlayerPed.handle, clothe.component)
  };

  if drawable == -1 or drawable == cfg.default[gender] then
    return;
  end

  Anim:Play(anim.off.name, anim.off.dict, anim.off.flag, anim.off.duration);

  SetPedComponentVariation(PlayerPed.handle, clothe.component, cfg.default[gender], 0, 0);

  if clothe.component == 8 then
    PlayerPed.currentClothes['comp_' .. 3] = {
      drawable = GetPedDrawableVariation(PlayerPed.handle, 3),
      texture = GetPedTextureVariation(PlayerPed.handle, 3)
    };

    SetPedComponentVariation(PlayerPed.handle, 3, 15, 0, 0);
  end

  PlayerPed.bones[name].on = bool;
end

---@param name string
---@param clothe { id: number; propIndex: number; offset: vector3; on: boolean }
function Clothes:ToggleProp(name, clothe)
  local bool = not clothe.on;
  local anim = Config.Clothes[name].anim;

  if not bool then
    local current = PlayerPed.currentClothes['prop_' .. clothe.propIndex];

    Anim:Play(anim.on.name, anim.on.dict, anim.on.flag, anim.on.duration);

    ClearPedProp(PlayerPed.handle, clothe.propIndex);
    SetPedPropIndex(PlayerPed.handle, clothe.propIndex, current.drawable, current.texture, true);

    PlayerPed.bones[name].on = bool;
    return;
  end

  local drawable = GetPedPropIndex(PlayerPed.handle, clothe.propIndex);

  PlayerPed.currentClothes['prop_' .. clothe.propIndex] = {
    drawable = drawable,
    texture = GetPedPropTextureIndex(PlayerPed.handle, clothe.propIndex)
  };

  if drawable == -1 then
    return;
  end

  Anim:Play(anim.off.name, anim.off.dict, anim.off.flag, anim.off.duration);

  ClearPedProp(PlayerPed.handle, clothe.propIndex);

  PlayerPed.bones[name].on = bool;
end

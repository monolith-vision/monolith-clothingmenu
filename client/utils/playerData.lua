PlayerPed = {
  handle = -1,
  currentClothes = {},
  bones = {
    hat = {
      id = 0x796E,
      propIndex = 0,
      offset = vec3(0.3, 0.1, 0.0),
      on = false
    },
    glasses = {
      id = 0x4ED2,
      propIndex = 1,
      offset = vec3(0.1, 0, 0.1),
      on = false
    },
    mask = {
      id = 0x4ED2,
      component = 1,
      offset = vec3(0.03, 0, 0.04),
      on = false
    },
    vest = {
      id = 0x5C01,
      component = 9,
      offset = vec3(0.13, 0.05, 0),
      on = false
    },
    shirt = {
      id = 0x60F0,
      component = 8,
      offset = vec3(0.18, 0.05, 0),
      on = false
    },
    torso = {
      id = 0x60F1,
      component = 11,
      offset = vec3(0.22, 0.05, 0),
      on = false
    },
    pants = {
      id = 0x2E28,
      component = 4,
      offset = vec3(0.3, 0, 0),
      on = false
    },
    shoes = {
      id = 0x3779,
      component = 6,
      offset = vec3(0, 0, 0),
      on = false
    },
    watch_l = {
      id = 0x49D9,
      propIndex = 6,
      offset = vec3(0, 0, 0),
      on = false
    },
    watch_r = {
      id = 0xDEAD,
      propIndex = 7,
      offset = vec3(0, 0, 0),
      on = false
    },
    chain = {
      id = 0x9995,
      component = 7,
      offset = vec3(0.04, 0.03, 0),
      on = false
    }
  }
};

Citizen.CreateThreadNow(function()
  while true do
    PlayerPed.handle = PlayerPedId();

    Citizen.Wait(200);
  end
end);

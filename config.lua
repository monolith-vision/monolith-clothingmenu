RESOURCE_NAME = GetCurrentResourceName();

Config = {
  Debug = true,
  Locale = 'en',
  -- determines if the Cam should move while the ui is opened
  LooseCam = true,
  DefaultMapper = 'K', -- the default configured Key
};

Config.Clothes = {
  hat = {
    anim = {
      on = {
        dict = 'mp_masks@standard_car@ds@',
        name = 'put_on_mask',
        flag = 51,
        duration = 600
      },
      off = {
        dict = 'missheist_agency2ahelmet',
        name = 'take_off_helmet_stand',
        flag = 51,
        duration = 1200
      }
    }
  },
  glasses = {
    anim = {
      on = {
        dict = 'clothingspecs',
        name = 'take_off',
        flag = 51,
        duration = 1400
      },
      off = {
        dict = 'clothingspecs',
        name = 'take_off',
        flag = 51,
        duration = 1400
      }
    }
  },
  mask = {
    default = {
      male = 0,
      female = 0
    },
    anim = {
      on = {
        dict = 'mp_masks@standard_car@ds@',
        name = 'put_on_mask',
        flag = 51,
        duration = 800
      },
      off = {
        dict = 'mp_masks@standard_car@ds@',
        name = 'put_on_mask',
        flag = 51,
        duration = 800
      }
    }
  },
  vest = {
    default = {
      male = 0,
      female = 0
    },
    anim = {
      on = {
        dict = 'clothingtie',
        name = 'try_tie_positive_a',
        flag = 51,
        duration = 2100
      },
      off = {
        dict = 'clothingtie',
        name = 'try_tie_positive_a',
        flag = 51,
        duration = 2100
      }
    }
  },
  shirt = {
    default = {
      male = 15,
      female = 14
    },
    anim = {
      on = {
        dict = 'clothingtie',
        name = 'try_tie_positive_a',
        flag = 51,
        duration = 2100
      },
      off = {
        dict = 'clothingtie',
        name = 'try_tie_positive_a',
        flag = 51,
        duration = 2100
      }
    }
  },
  torso = {
    default = {
      male = 252,
      female = 74
    },
    anim = {
      on = {
        dict = 'missmic4',
        name = 'michael_tux_fidget',
        flag = 51,
        duration = 1500
      },
      off = {
        dict = 'missmic4',
        name = 'michael_tux_fidget',
        flag = 51,
        duration = 1500
      }
    }
  },
  pants = {
    default = {
      male = 61,
      female = 14
    },
    anim = {
      on = {
        dict = 're@construction',
        name = 'out_of_breath',
        flag = 51,
        duration = 1300
      },
      off = {
        dict = 're@construction',
        name = 'out_of_breath',
        flag = 51,
        duration = 1300
      }
    }
  },
  shoes = {
    default = {
      male = 34,
      female = 35
    },
    anim = {
      on = {
        dict = 'random@domestic',
        name = 'pickup_low',
        flag = 0,
        duration = 1200
      },
      off = {
        dict = 'random@domestic',
        name = 'pickup_low',
        flag = 0,
        duration = 1200
      }
    }
  },
  watch_l = {
    anim = {
      on = {
        dict = 'nmt_3_rcm-10',
        name = 'cs_nigel_dual-10',
        flag = 51,
        duration = 1200
      },
      off = {
        dict = 'nmt_3_rcm-10',
        name = 'cs_nigel_dual-10',
        flag = 51,
        duration = 1200
      }
    }
  },
  watch_r = {
    anim = {
      on = {
        dict = 'nmt_3_rcm-10',
        name = 'cs_nigel_dual-10',
        flag = 51,
        duration = 1200
      },
      off = {
        dict = 'nmt_3_rcm-10',
        name = 'cs_nigel_dual-10',
        flag = 51,
        duration = 1200
      }
    }
  },
  chain = {
    default = {
      male = 0,
      female = 0
    },
    anim = {
      on = {
        dict = 'clothingtie',
        name = 'try_tie_positive_a',
        flag = 51,
        duration = 2100
      },
      off = {
        dict = 'clothingtie',
        name = 'try_tie_positive_a',
        flag = 51,
        duration = 2100
      }
    }
  }
};

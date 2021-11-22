-- Menu configuration, array of menus to display
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

menuConfigs = {
    ['functions'] = {                                  -- Example menu for emotes when player is on foot
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedOnFoot(player)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "g",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:sit.png", "imgsrc:handshake.png", "imgsrc:hug.png", "imgsrc:dance.png", "imgsrc:leanwall.png", "imgsrc:key.png"},
                    commands = {"e sitchair", "nearby handshake", "nearby hug", "e danceslow", "e lean", "r_vehiclelock"}
                },
                {
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"Animációk", "imgsrc:telepata.png", "imgsrc:admin.png", "Tároló", "imgsrc:shirt.png", "imgsrc:pants.png", "imgsrc:bag.png", "imgsrc:shoes.png", "imgsrc:mask.png", "imgsrc:hat.png", "imgsrc:glasses.png", "imgsrc:walks.png", "imgsrc:trunk.png"},
                    commands = {"r_emotes", "call", "report", "inventory", "clothes torso", "clothes pants", "clothes bag", "clothes shoes", "accessiories mask", "accessiories helmet", "accessiories glasses", "r_walks", "cars"}
                }
            }
        }
    },
    ['vehicles'] = {                                -- Example menu for vehicle controls when player is in a vehicle
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedInAnyVehicle(player, false)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "g",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 400,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 90,                 -- Oritentation of wheel
                    minRadiusPercent = 0.4,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    --labels = {"imgsrc:engine.png", "imgsrc:key.png", "imgsrc:doors.png", "imgsrc:trunk.png", "imgsrc:hood.png", "imgsrc:seatbelt.png"},
                    --commands = {"r_engine", "r_vehiclelock", "rdoors", "trunk", "hood", "seatbelt"}
                    labels = {"imgsrc:engine.png", "imgsrc:doors.png", "imgsrc:seatbelt.png", "imgsrc:key.png"},
                    commands = {"r_engine", "rdoors", "seatbelt", "r_vehiclelock"}
                    --labels = {"Tároló"},
                    --commands = {"inventory"}
                }
            }
        }
    }
}
-- Submenu configuration
subMenuConfigs = {
   ['emotes'] = {                                  -- Example menu for emotes when player is on foot
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedOnFoot(player)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "g",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 500,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {      
                {
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:s_baseball.png", "imgsrc:s_headbutt.png", "imgsrc:s_slap.png"},
                    commands = {"nearby baseball", "nearby headbutt", "nearby slap"}
                },                        -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:salute.png", "imgsrc:finger.png", "imgsrc:medic.png", "imgsrc:clap.png", "imgsrc:folded.png", "imgsrc:kneel.png", "imgsrc:surrender.png"},
                    commands = {"e salute", "e finger", "e medic", "e slowclap", "e foldarms", "e kneel","e surrender"}
                }
               
            }
        }
    },
    ['walks'] = {                                  -- Example menu for emotes when player is on foot
    enableMenu = function()                     -- Function to enable/disable menu handling
        local player = GetPlayerPed(-1)
        return IsPedOnFoot(player)
    end,
    data = {                                    -- Data that is passed to Javascript
        keybind = "g",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
        style = {                               -- Wheel style settings
            sizePx = 600,                       -- Wheel size in pixels
            slices = {                          -- Slice style settings
                default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
            },
            titles = {                          -- Text style settings
                default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
            },
            icons = {
                width = 64,
                height = 64
            }
        },
        wheels = {                              -- Array of wheels to display
            {
                navAngle = 270,                 -- Oritentation of wheel
                minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                labels = {"RESET", "imgsrc:injured.png", "imgsrc:cop.png", "imgsrc:drunk.png", "imgsrc:muscle.png", "imgsrc:casual3.png"},
                commands = {"walk reset", "walk injured", "walk cop2", "walk drunk", "walk muscle", "walk casual3"}
            },
        }
    }
},
    ['s_police'] = {
        data = {
            keybind = "g",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 230,
                    minRadiusPercent = 0.3,
                    maxRadiusPercent = 0.5,
                    labels = {"Személyi", "Motozás", "Bilincs", "Vezetés", "Jármübe ültetés"},
                    commands = {"submenu1", "submenu2", "submenu3", "submenu4", "submenu5"}
                },
                {
                    navAngle = 285,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.8,
                    labels = {"submenu2_a", "submenu2_b", "submenu2_c", "submenu2_d", "submenu2_e", "submenu2_f", "submenu2_g", "submenu2_h", "submenu2_i", "submenu2_j"},
                    commands = {"submenu2_a", "submenu2_b", "submenu2_c", "submenu2_d", "submenu2_e", "submenu2_f", "submenu2_g", "submenu2_h", "submenu2_i", "submenu2_j"}
                }
            }
        }
    },
    ['submenu3'] = {
        data = {
            keybind = "F6",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"submenu1", "submenu2", "submenu3", "submenu4", "submenu5"},
                    commands = {"submenu1", "submenu2", "submenu3", "submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"submenu3_a", "submenu3_b", "submenu3_c", "submenu3_d", "submenu3_e", "submenu3_f", "submenu3_g", "submenu3_h", "submenu3_i", "submenu3_j"},
                    commands = {"submenu3_a", "submenu3_b", "submenu3_c", "submenu3_d", "submenu3_e", "submenu3_f", "submenu3_g", "submenu3_h", "submenu3_i", "submenu3_j"}
                }
            }
        }
    },
    ['submenu4'] = {
        data = {
            keybind = "F6",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"submenu1", "submenu2", "submenu3", "submenu4", "submenu5"},
                    commands = {"submenu1", "submenu2", "submenu3", "submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"submenu4_a", "submenu4_b", "submenu4_c", "submenu4_d", "submenu4_e", "submenu4_f", "submenu4_g", "submenu4_h", "submenu4_i", "submenu4_j"},
                    commands = {"submenu4_a", "submenu4_b", "submenu4_c", "submenu4_d", "submenu4_e", "submenu4_f", "submenu4_g", "submenu4_h", "submenu4_i", "submenu4_j"}
                }
            }
        }
    },
    ['submenu5'] = {
        data = {
            keybind = "F6",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"submenu1", "submenu2", "submenu3", "submenu4", "submenu5"},
                    commands = {"submenu1", "submenu2", "submenu3", "submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"submenu5_a", "submenu5_b", "submenu5_c", "submenu5_d", "submenu5_e", "submenu5_f", "submenu5_g", "submenu5_h", "submenu5_i", "submenu5_j"},
                    commands = {"submenu5_a", "submenu5_b", "submenu5_c", "submenu5_d", "submenu5_e", "submenu5_f", "submenu5_g", "submenu5_h", "submenu5_i", "submenu5_j"}
                }
            }
        }
    },
}
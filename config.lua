Config = {}

-- Zone definitions
Config.Zones = {
    {
        name = "Downtown",
        description = "The heart of the city",
        coords = vector3(-1037.0, -2738.0, 20.0),
        radius = 100.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Beach",
        description = "Sandy shores and ocean views",
        coords = vector3(-1186.0, -1511.0, 4.0),
        radius = 75.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Mountains",
        description = "Scenic mountain trails",
        coords = vector3(501.0, 5604.0, 797.0),
        radius = 150.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Vinewood",
        description = "Famous Vinewood hills and sign",
        coords = vector3(600.0, 1200.0, 350.0),
        radius = 120.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Airport",
        description = "Los Santos International Airport",
        coords = vector3(-1044.0, -2749.0, 21.0),
        radius = 130.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Grove Street",
        description = "Historic Grove Street neighborhood",
        coords = vector3(100.0, -1940.0, 20.0),
        radius = 60.0,
        type = "gang",
        warning = "You are entering Ballas territory! Be careful.",
        color = "#f43f5e",
        sound = true,
        soundType = "gang"
    },
    {
        name = "Ballas Territory",
        description = "Ballas Gang Area - High Risk!",
        coords = vector3(110.0, -1960.0, 20.0),
        radius = 60.0,
        type = "gang",
        warning = "You are entering Ballas territory! Be careful.",
        sound = true,
        soundType = "gang"
    },
    {
        name = "Vagos Territory",
        description = "Vagos Gang Area - High Risk!",
        coords = vector3(340.0, -2040.0, 20.0),
        radius = 60.0,
        type = "gang",
        warning = "You are entering Vagos territory! Be careful.",
        sound = true,
        soundType = "gang"
    },
    {
        name = "Families Territory",
        description = "Families Gang Area - High Risk!",
        coords = vector3(-150.0, -1600.0, 35.0),
        radius = 60.0,
        type = "gang",
        warning = "You are entering Families territory! Be careful.",
        sound = true,
        soundType = "gang"
    },
    {
        name = "Police Station",
        description = "Mission Row Police Department",
        coords = vector3(425.1, -979.5, 30.7),
        radius = 50.0,
        type = "police",
        sound = true,
        soundType = "police"
    },
    {
        name = "Hospital",
        description = "Pillbox Hill Medical Center",
        coords = vector3(298.0, -584.0, 43.0),
        radius = 60.0,
        type = "ems",
        color = "#3b82f6",
        sound = true,
        soundType = "ems"
    },
    {
        name = "Sandy Shores",
        description = "Desert town with a wild side",
        coords = vector3(1950.0, 3750.0, 32.0),
        radius = 100.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Mirror Park",
        description = "Trendy neighborhood with a lake",
        coords = vector3(1075.0, -700.0, 57.0),
        radius = 170.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Richman",
        description = "Luxury homes and golf course",
        coords = vector3(-1800.0, 800.0, 138.0),
        radius = 90.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Chumash",
        description = "Coastal village and pier",
        coords = vector3(-3200.0, 950.0, 13.0),
        radius = 80.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Fort Zancudo",
        description = "Military base, restricted access!",
        coords = vector3(-2050.0, 3150.0, 32.0),
        radius = 120.0,
        type = "military",
        warning = "Restricted Area! Trespassers will be prosecuted.",
        sound = true,
        soundType = "military"
    },
    {
        name = "Del Perro Pier",
        description = "Iconic pier with rides and shops",
        coords = vector3(-1800.0, -1220.0, 13.0),
        radius = 60.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Harmony",
        description = "Small desert community",
        coords = vector3(540.0, 2660.0, 42.0),
        radius = 60.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "La Mesa",
        description = "Industrial area, lots of action",
        coords = vector3(850.0, -2100.0, 30.0),
        radius = 80.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Elysian Island",
        description = "Docks and shipping yards",
        coords = vector3(340.0, -2850.0, 6.0),
        radius = 100.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Paleto Bay",
        description = "Chill northern town by the sea",
        coords = vector3(-440.0, 6040.0, 31.0),
        radius = 110.0,
        sound = true,
        type = "safe",
        soundType = "safe"
    },
    {
        name = "Sandy Medical",
        description = "Sandy Shores Medical Center",
        coords = vector3(1839.0, 3672.0, 34.0),
        radius = 50.0,
        type = "ems",
        sound = true,
        soundType = "ems"
    },
    {
        name = "Paleto Police",
        description = "Paleto Bay Sheriff Station",
        coords = vector3(-447.0, 6012.0, 31.7),
        radius = 50.0,
        type = "police",
        sound = true,
        soundType = "police"
    },
    {
        name = "Paleto Medical",
        description = "Paleto Bay Medical Center",
        coords = vector3(-247.0, 6331.0, 32.4),
        radius = 50.0,
        type = "ems",
        sound = true,
        soundType = "ems"
    },
    {
        name = "LS Customs",
        description = "Los Santos Customs - Car Mod Shop",
        coords = vector3(-362.0, -132.0, 38.7),
        radius = 40.0,
        type = "shop",
        sound = true,
        soundType = "shop"
    },
    {
        name = "Casino",
        description = "Diamond Casino & Resort",
        coords = vector3(925.0, 45.0, 81.0),
        radius = 80.0,
        type = "entertainment",
        sound = true,
        soundType = "entertainment"
    },
    {
        name = "Maze Bank Arena",
        description = "Events and concerts venue",
        coords = vector3(-255.0, -2025.0, 30.0),
        radius = 90.0,
        type = "entertainment",
        sound = true,
        soundType = "entertainment"
    },
    {
        name = "Davis Mega Mall",
        description = "Large shopping mall in Davis",
        coords = vector3(47.0, -1749.0, 29.6),
        radius = 70.0,
        type = "shop",
        sound = false,
        soundType = "shop"
    },
    {
        name = "Legion Square",
        description = "Central City",
        coords = vector3(195.97, -930.48, 30.23),
        radius = 60.0,
        type = "safe",
        color = "#22c55e",
        sound = true,
        soundType = "safe"
    }
}

-- General settings
Config.CheckInterval = 500 -- How often to check player position (in ms)
Config.ZoneCooldown = 30000 -- Cooldown between zone notifications (in ms)
Config.ToastDuration = 5000 -- How long the toast message stays visible (in ms) 
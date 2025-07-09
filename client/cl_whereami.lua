local currentZone = nil
local lastZoneTime = {}

-- Weather hash to string mapping (only created once)
local weatherTypes = {
    [GetHashKey("CLEAR")] = "Clear",
    [GetHashKey("EXTRASUNNY")] = "Extra Sunny",
    [GetHashKey("CLOUDS")] = "Clouds",
    [GetHashKey("OVERCAST")] = "Overcast",
    [GetHashKey("RAIN")] = "Rain",
    [GetHashKey("CLEARING")] = "Clearing",
    [GetHashKey("THUNDER")] = "Thunder",
    [GetHashKey("SMOG")] = "Smog",
    [GetHashKey("FOGGY")] = "Foggy",
    [GetHashKey("XMAS")] = "Heavy Snow (XMAS)",
    [GetHashKey("SNOWLIGHT")] = "Light Snow",
    [GetHashKey("BLIZZARD")] = "Blizzard",
    [GetHashKey("HALLOWEEN")] = "Halloween",
    [GetHashKey("NEUTRAL")] = "Neutral",
    [GetHashKey("SNOW")] = "Snow"
}

local function GetWeatherString()
    local weatherHash = GetNextWeatherTypeHashName()
    local weatherStr = GetLabelText(weatherHash)
    if not weatherStr or weatherStr == "NULL" or weatherStr == "" then
        weatherStr = weatherTypes[weatherHash] or "Unknown"
    end
    return weatherStr
end

-- Function to check if player is in a zone
local function IsPlayerInZone(playerCoords, zoneCoords, radius)
    if not zoneCoords then return false end
    return GetDistanceBetweenCoords(
        playerCoords.x, playerCoords.y, playerCoords.z,
        zoneCoords.x, zoneCoords.y, zoneCoords.z, true
    ) <= radius
end

-- Function to send zone data to NUI
local function SendZoneToNUI(currentZoneName)
    -- Get time
    local hour = GetClockHours()
    local minute = GetClockMinutes()
    local timeStr = string.format("%02d:%02d", hour, minute)

    -- Get weather
    local weatherStr = GetWeatherString()

    -- Prepare all zones
    local zones = {}
    for _, zone in ipairs(Config.Zones) do
        table.insert(zones, {
            name = zone.name,
            description = zone.description,
            type = zone.type,
            warning = zone.warning,
            color = zone.color,
            icon = zone.icon
        })
    end

    SendNUIMessage({
        action = "showZoneCard",
        data = {
            time = timeStr,
            weather = weatherStr,
            zones = zones,
            currentZone = currentZoneName
        }
    })
end

-- Main thread for zone checking
Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local foundZone = false

        for _, zone in ipairs(Config.Zones) do
            if IsPlayerInZone(playerCoords, zone.coords, zone.radius) then
                foundZone = true
                
                -- Check if this is a new zone or if cooldown has expired
                if currentZone ~= zone.name and 
                   (not lastZoneTime[zone.name] or 
                    GetGameTimer() - lastZoneTime[zone.name] > Config.ZoneCooldown) then
                    
                    currentZone = zone.name
                    lastZoneTime[zone.name] = GetGameTimer()

                    -- Play sound if enabled in config
                    if zone.sound then
                        local sound = "Enter_1st"
                        local soundset = "GTAO_FM_Events_Soundset"
                        local soundType = zone.soundType or zone.type
                        if soundType == "gang" then
                            sound = "ATM_WINDOW"
                            soundset = "HUD_FRONTEND_DEFAULT_SOUNDSET"
                        elseif soundType == "police" then
                            sound = "Enter_1st"
                            soundset = "GTAO_FM_Events_Soundset"
                        elseif soundType == "ems" then
                            sound = "SELECT"
                            soundset = "HUD_LIQUOR_STORE_SOUNDSET"
                        else
                            sound = "Enter_1st"
                            soundset = "GTAO_FM_Events_Soundset"
                        end
                        PlaySoundFrontend(-1, sound, soundset, true)
                    end

                    SendZoneToNUI(zone.name)
                end
                break
            end
        end

        if not foundZone then
            currentZone = nil
        end

        Citizen.Wait(Config.CheckInterval)
    end
end) 
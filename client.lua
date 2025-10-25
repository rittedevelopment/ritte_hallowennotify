local nextNotifyTime = 0

Citizen.CreateThread(function()
    while true do
        local currentTime = GetGameTimer()
        
        if currentTime >= nextNotifyTime then
            -- Tar text ut configen
            local randomMessage = Config.Messages[math.random(#Config.Messages)]
            
            -- Skicka meddelande till UI
            SendNUIMessage({
                action = "showNotify",
                message = randomMessage,
                duration = Config.DisplayTime * 1000
            })
            
            -- Beräkna nästa tid
            local nextInterval = math.random(Config.MinInterval, Config.MaxInterval) * 60 * 1000
            nextNotifyTime = currentTime + nextInterval
            
            print("[Halloween Notify] Visar: " .. randomMessage)
            print("[Halloween Notify] Nästa meddelande om: " .. math.floor(nextInterval / 60000) .. " minuter")
        end
        
        Citizen.Wait(1000) -- Kolla varje sekund
    end
end)

-- Testkommando (ta typ bort detta är inte ens värt attt ha kvar mvh mvh :)
RegisterCommand('testhalloween', function()
    local randomMessage = Config.Messages[math.random(#Config.Messages)]
    SendNUIMessage({
        action = "showNotify",
        message = randomMessage,
        duration = Config.DisplayTime * 1000
    })
end, false)
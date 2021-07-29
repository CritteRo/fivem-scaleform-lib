showMQ = false
showRP = false
showMI = false
showST = false
showPW = false
showMDone = false

RegisterNetEvent("cS.HeistFinale")

AddEventHandler("cS.banner", function(_title, _subtitle, _waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = ShowBanner(_title, _subtitle)
    Citizen.CreateThread(function()
        Citizen.Wait((tonumber(_waitTime) * 1000) - 400)
        BeginScaleformMovieMethod(scale, "SHARD_ANIM_OUT")
        PushScaleformMovieMethodParameterInt(2)
        PushScaleformMovieMethodParameterFloat(0.4)
        PushScaleformMovieMethodParameterInt(0)
        EndScaleformMovieMethod()
        Citizen.Wait(400)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end)

AddEventHandler("cS.missionQuit", function(_title, _subtitle, _waitTime, _playSound)
    showMQ = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showMissionQuit(_title, _subtitle, _waitTime)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showMQ = false
    end)
end)

AddEventHandler("cS.resultsPanel", function(_title, _subtitle, _slots, _waitTime, _playSound)
    showRP = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    ShowResultsPanel(_title, _subtitle, _slots)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showRP = false
    end)
end)

AddEventHandler("cS.missionInfo", function(_data, _x, _y, _width, _waitTime, _playSound)
    showMI = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    ShowMissionInfoPanel(_data, _x, _y, _width)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showMI = false
    end)
end)

AddEventHandler("cS.SplashText", function(_title, _waitTime, _playSound)
    showST = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    ShowSplashText(_title, _waitTime * 1000)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showST = false
    end)
end)

AddEventHandler("cS.PopupWarning", function(_title, _subtitle, _errorCode, _waitTime, _playSound)
    showPW = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showPopupWarning(_title, _subtitle, _errorCode)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showPW = false
    end)
end)

AddEventHandler("cS.Countdown", function(_r, _g, _b, _waitTime, _playSound)
    local showCD = true
    local time = _waitTime
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showCountdown(time, _r, _g, _b)
    Citizen.CreateThread(function()
        while showCD do
            Citizen.Wait(1000)
            if time > 1 then
                time = time - 1
                scale = showCountdown(time, _r, _g, _b)
            elseif time == 1 then
                time = time - 1
                scale = showCountdown("GO", _r, _g, _b)
            else
                showCD = false
            end
        end
    end)
    Citizen.CreateThread(function()
        while showCD do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end)

AddEventHandler("cS.MidsizeBanner", function(_title, subtitle, _waitTime, _playSound)
    showMidBanner = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showMidsizeBanner(_title, subtitle)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showMidBanner = false
    end)
end)

AddEventHandler("cS.Credits", function(_role, _nameString, _x, _y, _waitTime, _playSound)
    showCreditsBanner = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showCredits(_role, _nameString, _x, _y)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showCreditsBanner = false
    end)
end)

AddEventHandler("cS.HeistFinale", function(_initialText, _table, _money, _xp, _waitTime, _playSound)
    showHeistBanner = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showHeist(_initialText, _table, _money, _xp)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showHeistBanner = false
    end)
end)

AddEventHandler("cS.ChangePauseMenuTitle", function(_title)
    changePauseMenuTitle(_title)
end)

AddEventHandler("cS.Saving", function(_subtitle, _type, _waitTime, _playSound)
    
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    if _type == 1 then
        toggleSave = true
        showSaving(_subtitle)
    else
        showBusySpinnerNoScaleform(_subtitle)
    end
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        if _type == 1 then
            toggleSave = false
        else
            BusyspinnerOff()
        end
    end)
end)
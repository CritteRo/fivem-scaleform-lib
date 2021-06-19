showBanner = false
showMQ = false
showRP = false
showST = false
showPW = false
showCD = false
showMDone = false

RegisterNetEvent("cS.HeistFinale")

AddEventHandler("cS.banner", function(_title, _subtitle, _waitTime, _playSound)
    showBanner = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    ShowBanner(_title, _subtitle)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showBanner = false
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
    showCD = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showCountdown(_waitTime, _r, _g, _b)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showCD = false
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

AddEventHandler("cS.Saving", function(subtitle, _waitTime, _playSound)
    toggleSave = true
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    showSaving(subtitle)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        toggleSave = false
    end)
end)
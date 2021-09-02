showMQ = false
showRP = false
showMI = false
showST = false
showPW = false
showMDone = false

RegisterNetEvent("cS.HeistFinale")
RegisterNetEvent("cS.MidsizeBanner")
RegisterNetEvent("cS.Countdown")
RegisterNetEvent("cS.GameFeed")

AddEventHandler("cS.banner", function(_title, _subtitle, _waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = ShowBanner(_title, _subtitle)
    Citizen.CreateThread(function()
        Citizen.Wait((tonumber(_waitTime) * 1000) - 400)
        Scaleform.CallFunction(scale, false, "SHARD_ANIM_OUT", 2, 0.4, 0)
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
    local showRP = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = ShowResultsPanel(_title, _subtitle, _slots)
    Citizen.CreateThread(function()
        Citizen.Wait(tonumber(_waitTime) * 1000)
        showRP = false
    end)
    Citizen.CreateThread(function()
        while showRP do
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
            Citizen.Wait(1)
        end
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

AddEventHandler("cS.MidsizeBanner", function(_title, subtitle, _bannerColor, _waitTime, _playSound)
    local showMidBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showMidsizeBanner(_title, subtitle, _bannerColor)
    Citizen.CreateThread(function()
        Citizen.Wait((_waitTime * 1000) - 1000)
        Scaleform.CallFunction(scale, false, "SHARD_ANIM_OUT", 2, 0.3, true)
        Citizen.Wait(1000)
        showMidBanner = false
    end)
    Citizen.CreateThread(function()
        while showMidBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
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

AddEventHandler("cS.Shutter", function(_waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showShutter()
    Citizen.CreateThread(function()
        Citizen.Wait((tonumber(_waitTime) * 1000) - 1000)
        Scaleform.CallFunction(scale, false, "CLOSE_THEN_OPEN_SHUTTER")
        Wait(1000)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end)

AddEventHandler("cS.Warehouse", function(_waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showWarehouse()
    Citizen.CreateThread(function()
        Citizen.Wait(2000)
        --Scaleform.CallFunction(scale, false, "SET_INPUT_EVENT", 2)
        
        Citizen.Wait(2000)
        local ret = Scaleform.CallFunction(scale, true, "GET_CURRENT_SELECTION") --we get the scaleform return
        while true do
            if IsScaleformMovieMethodReturnValueReady(ret) then --scaleform takes it's sweet time, so we need to wait for the value to be registered, or calculated or something, idk
                selectID = GetScaleformMovieMethodReturnValueInt(ret) --output value. Can be Int, String or Bool. In my case is Int, and it's the "slotID" value that you set with Scaleform.CallFunction(scaleform, false, "DISPLAY_VIEW", viewID, slotID)
                print(selectID)
                break
            end
            Citizen.Wait(0)
        end
        Citizen.Wait((tonumber(_waitTime) * 1000) - 4000)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end)

AddEventHandler("cS.GameFeed", function(_title, _subtitle, _textblock, _textureDict, _textureName, _rightAlign, _waitTime, _playSound)
    local showBanner = true
    local scale = 0
    if _playSound ~= nil and _playSound == true then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
    end
    scale = showGameFeed(_title, _subtitle, _textblock, _textureDict, _textureName, _rightAlign)
    Citizen.CreateThread(function()
        Citizen.Wait(_waitTime * 1000)
        showBanner = false
    end)
    Citizen.CreateThread(function()
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end)
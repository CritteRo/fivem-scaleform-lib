function ShowBanner(_text1, _text2)
    Citizen.CreateThread(function()
        function drawscaleform2(text1, text2)
            local scaleform = RequestScaleformMovie("mp_big_message_freemode")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(1)
            end
            BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieMethodParameterString(text1)
            PushScaleformMovieMethodParameterString(text2)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    
        while showBanner do
            Citizen.Wait(1)
            drawscaleform2(_text1, _text2)
        end
    end)
end

function ShowSplashText(_text1)
    Citizen.CreateThread(function()
        function drackSplashText(text1)
            local scaleform = RequestScaleformMovie("SPLASH_TEXT")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            BeginScaleformMovieMethod(scaleform, "SET_SPLASH_TEXT")
            PushScaleformMovieMethodParameterString(text1)
            PushScaleformMovieMethodParameterInt(1000)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "SPLASH_TEXT_LABEL")
            PushScaleformMovieMethodParameterString(text1)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "SPLASH_TEXT_COLOR")
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            PushScaleformMovieMethodParameterInt(255)
            EndScaleformMovieMethod()

            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    
        while showST do
            Citizen.Wait(1)
            drackSplashText(_text1)
        end
    end)
end

function ShowResultsPanel(_title, _subtitle, _slots)
    Citizen.CreateThread(function()
        function drawPanel(title, subtitle, slot)
            local scaleform = RequestScaleformMovie("MP_RESULTS_PANEL")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            BeginScaleformMovieMethod(scaleform, "SET_TITLE")
            PushScaleformMovieMethodParameterString(title)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "SET_SUBTITLE")
            PushScaleformMovieMethodParameterString(subtitle)
            EndScaleformMovieMethod()

            for i, k in ipairs(slot) do
                BeginScaleformMovieMethod(scaleform, "SET_SLOT")
                PushScaleformMovieMethodParameterInt(i)
                PushScaleformMovieMethodParameterInt(slot[i].state)
                PushScaleformMovieMethodParameterString(slot[i].name)
                EndScaleformMovieMethod()
            end
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    
        while showRP do
            Citizen.Wait(1)
            drawPanel(_title, _subtitle, _slots)
        end
    end)
end

function showMissionQuit(_title, _subtitle)
    Citizen.CreateThread(function()
        function drawScale(string1, string2)
            local scaleform = RequestScaleformMovie("mission_quit")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            BeginScaleformMovieMethod(scaleform, "SET_TEXT")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterString(string2)
            EndScaleformMovieMethod()
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    
        while showMQ do
            Citizen.Wait(1)
            drawScale(_title, _subtitle)
        end
    end)
end

function showPopupWarning(_title, _subtitle, _errorCode)
    Citizen.CreateThread(function()
        function drawPopup(title, subtitle, alertType)
            local scaleform = RequestScaleformMovie("POPUP_WARNING")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            PushScaleformMovieFunction(scaleform, "SHOW_POPUP_WARNING")
            PushScaleformMovieFunctionParameterFloat(500.0)
            PushScaleformMovieFunctionParameterString(title)
            PushScaleformMovieFunctionParameterString(subtitle)
            PushScaleformMovieFunctionParameterString("")
            PushScaleformMovieFunctionParameterBool(true)
            PushScaleformMovieFunctionParameterInt(alertType)
            PushScaleformMovieFunctionParameterString(_errorCode)
            PopScaleformMovieFunctionVoid()

            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        end
        while showPW do
            Citizen.Wait(1)
            drawPopup(_title, _subtitle, _alertType)
        end
    end) 
end

function showCountdown(maxNumber)
    local nr = maxNumber
    Citizen.CreateThread(function()
        while showCD do
            Citizen.Wait(1000)
            if nr >= 1 then
                nr = nr - 1
            end
        end
    end)
    Citizen.CreateThread(function()
        function drawCountdown(string1)
            local scaleform = RequestScaleformMovie("COUNTDOWN")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            BeginScaleformMovieMethod(scaleform, "SET_MESSAGE")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterInt(string1)
            PushScaleformMovieMethodParameterInt(150)
            PushScaleformMovieMethodParameterInt(200)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "FADE_MP")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterInt(string1)
            PushScaleformMovieMethodParameterInt(150)
            PushScaleformMovieMethodParameterInt(200)
            EndScaleformMovieMethod()

            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    
        while showCD do
            Citizen.Wait(1)
            drawCountdown(nr)
        end
    end)
end

function showMidsizeBanner(_title, _subtitle)
    Citizen.CreateThread(function()
        function drawScale(string1, string2)
            local scaleform = RequestScaleformMovie("MIDSIZED_MESSAGE")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "SHOW_COND_SHARD_MESSAGE")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterString(string2)
            PushScaleformMovieMethodParameterInt(2)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    
        while showMidBanner do
            Citizen.Wait(1)
            drawScale(_title, _subtitle)
        end
    end)
end
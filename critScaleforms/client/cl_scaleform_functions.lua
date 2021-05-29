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
            return scaleform
        end
        local scale = drawscaleform2(_text1, _text2)
        while showBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

function ShowSplashText(_text1, _fadeout)
    Citizen.CreateThread(function()
        function drackSplashText(text1, fade)
            local scaleform = RequestScaleformMovie("SPLASH_TEXT")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "SET_SPLASH_TEXT")
            PushScaleformMovieMethodParameterString(text1)
            PushScaleformMovieMethodParameterInt(5000)
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

            BeginScaleformMovieMethod(scaleform, "SPLASH_TEXT_TRANSITION_OUT")
            PushScaleformMovieMethodParameterInt(fade)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()

            return scaleform
        end
        local scale = drackSplashText(_text1, _fadeout)
        while showST do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
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
            return scaleform
        end
        local scale = drawPanel(_title, _subtitle, _slots)
        while showRP do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

function showMissionQuit(_title, _subtitle, _duration)
    Citizen.CreateThread(function()
        function drawScale(string1, string2, duration)
            local scaleform = RequestScaleformMovie("mission_quit")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "SET_TEXT")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterString(string2)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "TRANSITION_OUT")
            if duration > 4000 then
                PushScaleformMovieMethodParameterInt(duration - 1000)
            else
                PushScaleformMovieMethodParameterInt(3000)
            end
            EndScaleformMovieMethod()
            return scaleform
        end
        
        local scale = drawScale(_title, _subtitle, _duration)
        while showMQ do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
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

            return scaleform
        end
        local scale = drawPopup(_title, _subtitle, _alertType)
        while showPW do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255, 0)
        end
    end) 
end

function showCountdown(maxNumber, _r, _g, _b)
    local nr = maxNumber
    local scale = 0
    Citizen.CreateThread(function()
        function drawCountdown(string1, r, g, b)
            local scaleform = RequestScaleformMovie("COUNTDOWN")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            BeginScaleformMovieMethod(scaleform, "SET_MESSAGE")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterInt(r)
            PushScaleformMovieMethodParameterInt(g)
            PushScaleformMovieMethodParameterInt(b)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "FADE_MP")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterInt(r)
            PushScaleformMovieMethodParameterInt(g)
            PushScaleformMovieMethodParameterInt(b)
            EndScaleformMovieMethod()

            return scaleform
        end
        scale = drawCountdown(nr, _r, _g, _b)
        while showCD do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
    Citizen.CreateThread(function()
        while showCD do
            Citizen.Wait(1000)
            if nr >= 1 then
                nr = nr - 1
                scale = drawCountdown(nr, _r, _g, _b)
            end
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
            return scaleform
        end
        local scale = drawScale(_title, _subtitle)
        while showMidBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end

--[[  --I'm having a hard time making this work. will retest later
function showCredits(_data)
    Citizen.CreateThread(function()
        function drawCredits(string1, string2)
            local scaleform = RequestScaleformMovie("OPENING_CREDITS")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "TEST_CREDIT_BLOCK")
            PushScaleformMovieMethodParameterString("Developer")
            PushScaleformMovieMethodParameterString("CritteR")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterFloat(0.06)
            PushScaleformMovieMethodParameterFloat(0.56)
            PushScaleformMovieMethodParameterInt(2000)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()

            return scaleform
        end
        local scale = drawCredits(0, 0)
        while showCreditsBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
    end)
end
]]
function showHeist(ZinitialText, Ztable, Zmoney, Zxp)
    Citizen.CreateThread(function()
        function drawHeist(_initialText, _table, _money, _xp)
            local scaleform = RequestScaleformMovie("HEIST_CELEBRATION")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "CREATE_STAT_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "ADD_BACKGROUND_TO_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(100)
            PushScaleformMovieMethodParameterBool(false)
            EndScaleformMovieMethod()

            --[[BeginScaleformMovieMethod(scaleform, "ADD_COMPLETE_MESSAGE_TO_WALL") --this should be used as it's own scaleform event.
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString(_initialText.missionTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.passFailTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.messageLabel)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()]]

            BeginScaleformMovieMethod(scaleform, "ADD_MISSION_RESULT_TO_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString(_initialText.missionTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.passFailTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.messageLabel)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()

            if _table[1] ~= nil then
                BeginScaleformMovieMethod(scaleform, "CREATE_STAT_TABLE")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(10)
                EndScaleformMovieMethod()

                for i, k in pairs(_table) do
                    BeginScaleformMovieMethod(scaleform, "ADD_STAT_TO_TABLE")
                    PushScaleformMovieMethodParameterInt(1)
                    PushScaleformMovieMethodParameterInt(10)
                    PushScaleformMovieMethodParameterString(_table[i].stat)
                    PushScaleformMovieMethodParameterString(_table[i].value)
                    PushScaleformMovieMethodParameterBool(true)
                    PushScaleformMovieMethodParameterBool(true)
                    PushScaleformMovieMethodParameterBool(false)
                    PushScaleformMovieMethodParameterBool(false)
                    PushScaleformMovieMethodParameterInt(0)
                    EndScaleformMovieMethod()
                end

                BeginScaleformMovieMethod(scaleform, "ADD_STAT_TABLE_TO_WALL")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(10)
                EndScaleformMovieMethod()
            end

            if _money.startMoney ~= _money.finishMoney then
                BeginScaleformMovieMethod(scaleform, "CREATE_INCREMENTAL_CASH_ANIMATION")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(20)
                EndScaleformMovieMethod()

                BeginScaleformMovieMethod(scaleform, "ADD_INCREMENTAL_CASH_WON_STEP")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(20)
                PushScaleformMovieMethodParameterInt(_money.startMoney)
                PushScaleformMovieMethodParameterInt(_money.finishMoney)
                PushScaleformMovieMethodParameterString(_money.topText)
                PushScaleformMovieMethodParameterString(_money.bottomText)
                PushScaleformMovieMethodParameterString(_money.rightHandStat)
                PushScaleformMovieMethodParameterInt(_money.rightHandStatIcon)
                PushScaleformMovieMethodParameterInt(0)
                EndScaleformMovieMethod()

                BeginScaleformMovieMethod(scaleform, "ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(20)
                EndScaleformMovieMethod()
            end

            if _xp.xpGained ~= 0 then
                BeginScaleformMovieMethod(scaleform, "ADD_REP_POINTS_AND_RANK_BAR_TO_WALL")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(_xp.xpGained)
                PushScaleformMovieMethodParameterInt(_xp.xpBeforeGain)
                PushScaleformMovieMethodParameterInt(_xp.minLevelXP)
                PushScaleformMovieMethodParameterInt(_xp.maxLevelXP)
                PushScaleformMovieMethodParameterInt(_xp.currentRank)
                PushScaleformMovieMethodParameterInt(_xp.nextRank)
                PushScaleformMovieMethodParameterString(_xp.rankTextSmall)
                PushScaleformMovieMethodParameterString(_xp.rankTextBig)
                EndScaleformMovieMethod()
            end

            BeginScaleformMovieMethod(scaleform, "SHOW_STAT_WALL")
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "createSequence")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            return scaleform
        end
        local scale = drawHeist(ZinitialText, Ztable, Zmoney, Zxp)
        StartScreenEffect("HeistCelebEnd")
        while showHeistBanner do
            Citizen.Wait(1)
            DrawRect(0.0, 0.0, 2.0, 2.0, 0, 92, 21, 160)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
        StopScreenEffect("HeistCelebEnd")
        StartScreenEffect("HeistCelebToast")
    end)
end

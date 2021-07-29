scalformTimer = {
    ['ShowBanner'] = {isShown = false, timer = 0},
    ['ShowSplashText'] = {isShown = false, timer = 0},
    ['ShowResultsPanel'] = {isShown = false, timer = 0},
    ['showMissionQuit'] = {isShown = false, timer = 0},
    ['showPopupWarning'] = {isShown = false, timer = 0},
    ['showCountdown'] = {isShown = false, timer = 0},
    ['showMidsizeBanner'] = {isShown = false, timer = 0},
    ['showSaving'] = {isShown = false, timer = 0},
}


function ShowBanner(_text1, _text2)
    local scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end

    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_CENTERED_MP_MESSAGE")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SHARD_SET_TEXT")
    PushScaleformMovieMethodParameterString(_text1)
    PushScaleformMovieMethodParameterString(_text2)
    PushScaleformMovieMethodParameterInt(0)
    EndScaleformMovieMethod()
    return scaleform
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
    local scaleform = RequestScaleformMovie("MP_RESULTS_PANEL")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    BeginScaleformMovieMethod(scaleform, "SET_TITLE")
    PushScaleformMovieMethodParameterString(_title)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_SUBTITLE")
    PushScaleformMovieMethodParameterString(_subtitle)
    EndScaleformMovieMethod()

    for i, k in ipairs(_slots) do
        BeginScaleformMovieMethod(scaleform, "SET_SLOT")
        PushScaleformMovieMethodParameterInt(i)
        PushScaleformMovieMethodParameterInt(_slots[i].state)
        PushScaleformMovieMethodParameterString(_slots[i].name)
        EndScaleformMovieMethod()
    end
    return scaleform
end

function ShowMissionInfoPanel(_data, _x, _y, _width)
    Citizen.CreateThread(function()
        function drawMissionInfo(data)
            local scaleform = RequestScaleformMovie("MP_MISSION_NAME_FREEMODE")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            BeginScaleformMovieMethod(scaleform, "SET_MISSION_INFO")
            PushScaleformMovieMethodParameterString(data.name)
            PushScaleformMovieMethodParameterString(data.type)
            PushScaleformMovieMethodParameterString("")
            PushScaleformMovieMethodParameterString(data.percentage)
            PushScaleformMovieMethodParameterString("")
            PushScaleformMovieMethodParameterBool(data.rockstarVerified)
            PushScaleformMovieMethodParameterString(data.playersRequired)
            PushScaleformMovieMethodParameterInt(data.rp)
            PushScaleformMovieMethodParameterInt(data.cash)
            PushScaleformMovieMethodParameterString(data.time)
            EndScaleformMovieMethod()

            return scaleform
        end
        local scale = drawMissionInfo(_data)
        while showMI do
            Citizen.Wait(1)
            local x = 0.5
            local y = 0.5
            local width = 0.5
            local height = width / 0.65
            DrawScaleformMovie(scale, x, y, width, height, 255, 255, 255, 255, 0)
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

            --[[BeginScaleformMovieMethod(scaleform, "TRANSITION_IN")
            PushScaleformMovieMethodParameterInt(1000)
            EndScaleformMovieMethod()
            --== "TRANSITION_OUT" CAUSES THE SCALEFORM TO NOT RUN A SECOND TIME. ==--
            BeginScaleformMovieMethod(scaleform, "TRANSITION_OUT")
            if duration > 4000 then
                PushScaleformMovieMethodParameterInt(duration - 1000)
            else
                PushScaleformMovieMethodParameterInt(3000)
            end
            EndScaleformMovieMethod()]]
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

function showCountdown(_number, _r, _g, _b)
    local scaleform = RequestScaleformMovie("COUNTDOWN")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    BeginScaleformMovieMethod(scaleform, "SET_MESSAGE")
    PushScaleformMovieMethodParameterString(_number)
    PushScaleformMovieMethodParameterInt(_r)
    PushScaleformMovieMethodParameterInt(_g)
    PushScaleformMovieMethodParameterInt(_b)
    PushScaleformMovieMethodParameterBool(true)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "FADE_MP")
    PushScaleformMovieMethodParameterString(_number)
    PushScaleformMovieMethodParameterInt(_r)
    PushScaleformMovieMethodParameterInt(_g)
    PushScaleformMovieMethodParameterInt(_b)
    EndScaleformMovieMethod()

    return scaleform
end

function showMidsizeBanner(_title, _subtitle, _bannerColor)
    local scaleform = RequestScaleformMovie("MIDSIZED_MESSAGE")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    BeginScaleformMovieMethod(scaleform, "SHOW_COND_SHARD_MESSAGE")
    PushScaleformMovieMethodParameterString(_title)
    PushScaleformMovieMethodParameterString(_subtitle)
    PushScaleformMovieMethodParameterInt(_bannerColor)
    PushScaleformMovieMethodParameterBool(true)
    EndScaleformMovieMethod()
    return scaleform
end

function showCredits(_role, _name, _x, _y)
    Citizen.CreateThread(function()
        function drawCredits(role, name)
            local scaleform = RequestScaleformMovie("OPENING_CREDITS")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "TEST_CREDIT_BLOCK")
            ScaleformMovieMethodAddParamTextureNameString_2(role)
            ScaleformMovieMethodAddParamTextureNameString_2(name)
            PushScaleformMovieMethodParameterString('left')
            PushScaleformMovieMethodParameterFloat(0.0)
            PushScaleformMovieMethodParameterFloat(50.0)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(5)
            PushScaleformMovieMethodParameterInt(10)
            PushScaleformMovieMethodParameterInt(10)
            EndScaleformMovieMethod()
            
            --=================================--
                --SETUP_CREDIT_BLOCK might give more customization, but further testing needs to be done.
                --"HIDE" function completly breaks SETUP_CREDIT_BLOCK, which means to we need to rely on stopping the scaleform draw.
            --=================================--
            --[[BeginScaleformMovieMethod(scaleform, "SETUP_CREDIT_BLOCK")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterFloat(0.0)
            PushScaleformMovieMethodParameterFloat(0.0)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(2)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "ADD_ROLE_TO_CREDIT_BLOCK")
            PushScaleformMovieMethodParameterInt(1)
            ScaleformMovieMethodAddParamTextureNameString_2(role)
            PushScaleformMovieMethodParameterFloat(0.0)
            PushScaleformMovieMethodParameterInt(4)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "ADD_NAMES_TO_CREDIT_BLOCK")
            PushScaleformMovieMethodParameterInt(1)
            ScaleformMovieMethodAddParamTextureNameString_2(name)
            PushScaleformMovieMethodParameterFloat(100.1)
            PushScaleformMovieMethodParameterString("    ")
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "SHOW_CREDIT_BLOCK")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(2)
            PushScaleformMovieMethodParameterInt(4)
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()]]

            --=================================================--
                --This is a single line text (duh). Text below combines "name" font and "role" color from credit block.
            --=================================================--
            --[[BeginScaleformMovieMethod(scaleform, "SETUP_SINGLE_LINE")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterFloat(0.0)
            PushScaleformMovieMethodParameterFloat(0.0)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "ADD_TEXT_TO_SINGLE_LINE")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString("Single line text that can show everything you want")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterFloat(0.0)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "SHOW_SINGLE_LINE")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "HIDE")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(2)
            PushScaleformMovieMethodParameterInt(0)
            PushScaleformMovieMethodParameterInt(0)
            EndScaleformMovieMethod()]]
            return scaleform
        end
        local scale = drawCredits(_role, _name)
        while showCreditsBanner do
            Citizen.Wait(1)
            DrawScaleformMovie(scale, _x, _y, 0.71, 0.68, 255, 255, 255, 255)
        end
    end)
end

function showHeist(ZinitialText, Ztable, Zmoney, Zxp)
    Citizen.CreateThread(function()
        function drawHeist(_initialText, _table, _money, _xp)
            local scaleform = RequestScaleformMovie("HEIST_CELEBRATION")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            local scaleform_bg = RequestScaleformMovie("HEIST_CELEBRATION_BG")
            while not HasScaleformMovieLoaded(scaleform_bg) do
                Citizen.Wait(0)
            end

            local scaleform_fg = RequestScaleformMovie("HEIST_CELEBRATION_FG")
            while not HasScaleformMovieLoaded(scaleform_fg) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "CREATE_STAT_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString("HUD_COLOUR_FREEMODE_DARK")
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "ADD_BACKGROUND_TO_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(100)
            PushScaleformMovieMethodParameterInt(1)
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

            --BG

            BeginScaleformMovieMethod(scaleform_bg, "CREATE_STAT_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString("HUD_COLOUR_FREEMODE_DARK")
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform_bg, "ADD_BACKGROUND_TO_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(100)
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform_bg, "ADD_MISSION_RESULT_TO_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString(_initialText.missionTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.passFailTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.messageLabel)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()

            if _table[1] ~= nil then
                BeginScaleformMovieMethod(scaleform_bg, "CREATE_STAT_TABLE")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(10)
                EndScaleformMovieMethod()

                for i, k in pairs(_table) do
                    BeginScaleformMovieMethod(scaleform_bg, "ADD_STAT_TO_TABLE")
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

                BeginScaleformMovieMethod(scaleform_bg, "ADD_STAT_TABLE_TO_WALL")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(10)
                EndScaleformMovieMethod()
            end

            if _money.startMoney ~= _money.finishMoney then
                BeginScaleformMovieMethod(scaleform_bg, "CREATE_INCREMENTAL_CASH_ANIMATION")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(20)
                EndScaleformMovieMethod()

                BeginScaleformMovieMethod(scaleform_bg, "ADD_INCREMENTAL_CASH_WON_STEP")
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

                BeginScaleformMovieMethod(scaleform_bg, "ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(20)
                EndScaleformMovieMethod()
            end

            if _xp.xpGained ~= 0 then
                BeginScaleformMovieMethod(scaleform_bg, "ADD_REP_POINTS_AND_RANK_BAR_TO_WALL")
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

            BeginScaleformMovieMethod(scaleform_bg, "SHOW_STAT_WALL")
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform_bg, "createSequence")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            --FG

            BeginScaleformMovieMethod(scaleform_fg, "CREATE_STAT_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString("HUD_COLOUR_FREEMODE_DARK")
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform_fg, "ADD_BACKGROUND_TO_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(100)
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform_fg, "ADD_MISSION_RESULT_TO_WALL")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterString(_initialText.missionTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.passFailTextLabel)
            PushScaleformMovieMethodParameterString(_initialText.messageLabel)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()

            if _table[1] ~= nil then
                BeginScaleformMovieMethod(scaleform_fg, "CREATE_STAT_TABLE")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(10)
                EndScaleformMovieMethod()

                for i, k in pairs(_table) do
                    BeginScaleformMovieMethod(scaleform_fg, "ADD_STAT_TO_TABLE")
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

                BeginScaleformMovieMethod(scaleform_fg, "ADD_STAT_TABLE_TO_WALL")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(10)
                EndScaleformMovieMethod()
            end

            if _money.startMoney ~= _money.finishMoney then
                BeginScaleformMovieMethod(scaleform_fg, "CREATE_INCREMENTAL_CASH_ANIMATION")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(20)
                EndScaleformMovieMethod()

                BeginScaleformMovieMethod(scaleform_fg, "ADD_INCREMENTAL_CASH_WON_STEP")
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

                BeginScaleformMovieMethod(scaleform_fg, "ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL")
                PushScaleformMovieMethodParameterInt(1)
                PushScaleformMovieMethodParameterInt(20)
                EndScaleformMovieMethod()
            end

            if _xp.xpGained ~= 0 then
                BeginScaleformMovieMethod(scaleform_fg, "ADD_REP_POINTS_AND_RANK_BAR_TO_WALL")
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

            BeginScaleformMovieMethod(scaleform_fg, "SHOW_STAT_WALL")
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform_fg, "createSequence")
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            PushScaleformMovieMethodParameterInt(1)
            EndScaleformMovieMethod()

            return scaleform, scaleform_bg, scaleform_fg
        end
        local scale, scale_bg, scale_fg = drawHeist(ZinitialText, Ztable, Zmoney, Zxp)
        --StartScreenEffect("HeistCelebEnd")
        while showHeistBanner do
            Citizen.Wait(1)
            --DrawRect(0.0, 0.0, 2.0, 2.0, 0, 44, 1, 160)
            DrawScaleformMovieFullscreenMasked(scale_bg, scale_fg, 255, 255, 255, 50)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
        --StopScreenEffect("HeistCelebEnd")
        StartScreenEffect("HeistCelebToast")
    end)
end

function changePauseMenuTitle(title)
    AddTextEntry('FE_THDR_GTAO', title)
end

function showSaving(_subtitle)
    Citizen.CreateThread(function()
        function drawScale(string1)
            local scaleform = RequestScaleformMovie("HUD_SAVING")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "SET_SAVING_TEXT_STANDALONE")
            PushScaleformMovieMethodParameterInt(1) --the icon.. 1 is a full disk.. with a fade animation. Can't find the normal spinning disk.
            PushScaleformMovieMethodParameterString(string1)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "SHOW")
            EndScaleformMovieMethod()

            return scaleform
        end
        local scale = drawScale(_subtitle)
        while toggleSave do
            Citizen.Wait(1)
            DrawScaleformMovie(scale, 0.82, 0.95, 0.35, 0.05, 255, 255, 255, 255)
        end
    end)
end

function showBusySpinnerNoScaleform(_text)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(_text)
    EndTextCommandBusyspinnerOn(1)
end
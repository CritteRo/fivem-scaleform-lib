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
    local scaleform = Scaleform.Request('MP_BIG_MESSAGE_FREEMODE')

    Scaleform.CallFunction(scaleform, false, "SHOW_SHARD_CENTERED_MP_MESSAGE")
    Scaleform.CallFunction(scaleform, false, "SHARD_SET_TEXT", _text1, _text2, 0)

    return scaleform
end

function ShowSplashText(_text1, _fadeout)
    Citizen.CreateThread(function()
        function drackSplashText(text1, fade)
            local scaleform = Scaleform.Request('SPLASH_TEXT')

            Scaleform.CallFunction(scaleform, false, "SET_SPLASH_TEXT", text1, 5000, 255, 255, 255, 255)
            Scaleform.CallFunction(scaleform, false, "SPLASH_TEXT_LABEL", text1, 255, 255, 255, 255)
            Scaleform.CallFunction(scaleform, false, "SPLASH_TEXT_COLOR", 255, 255, 255, 255)
            Scaleform.CallFunction(scaleform, false, "SPLASH_TEXT_TRANSITION_OUT", fade, 0)

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
    local scaleform = Scaleform.Request('MP_RESULTS_PANEL')

    Scaleform.CallFunction(scaleform, false, "SET_TITLE", _title)
    Scaleform.CallFunction(scaleform, false, "SET_SUBTITLE", _subtitle)

    for i, k in ipairs(_slots) do
        Scaleform.CallFunction(scaleform, false, "SET_SLOT", i, _slots[i].state, _slots[i].name)
    end
    return scaleform
end

function ShowMissionInfoPanel(_data, _x, _y, _width)
    Citizen.CreateThread(function()
        function drawMissionInfo(data)
            local scaleform = Scaleform.Request('MP_MISSION_NAME_FREEMODE')

            Scaleform.CallFunction(scaleform, false, "SET_MISSION_INFO", data.name, data.type, "", data.percentage, "", data.rockstarVerified, data.playersRequired, data.rp, data.cash, data.time)

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
        function drawScale(title, subtitle, duration)
            local scaleform = Scaleform.Request('MISSION_QUIT')

            Scaleform.CallFunction(scaleform, false, "SET_TEXT", title, subtitle)
            Scaleform.CallFunction(scaleform, false, "TRANSITION_IN", 0)
            Scaleform.CallFunction(scaleform, false, "TRANSITION_OUT", 3000)

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
        function drawPopup(title, subtitle, errorCode)
            local scaleform = Scaleform.Request('POPUP_WARNING')

            Scaleform.CallFunction(scaleform, false, "SHOW_POPUP_WARNING", 500.0, title, subtitle, "", true, 0, _errorCode)

            return scaleform
        end
        local scale = drawPopup(_title, _subtitle, _errorCode)
        while showPW do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255, 0)
        end
    end) 
end

function showCountdown(_number, _r, _g, _b)
    local scaleform = Scaleform.Request('COUNTDOWN')

    Scaleform.CallFunction(scaleform, false, "SET_MESSAGE", _number, _r, _g, _b, true)
    Scaleform.CallFunction(scaleform, false, "FADE_MP", _number, _r, _g, _b)

    return scaleform
end

function showMidsizeBanner(_title, _subtitle, _bannerColor)
    local scaleform = Scaleform.Request('MIDSIZED_MESSAGE')

    Scaleform.CallFunction(scaleform, false, "SHOW_COND_SHARD_MESSAGE", _title, _subtitle, _bannerColor, true)

    return scaleform
end

function showCredits(_role, _name, _x, _y)
    Citizen.CreateThread(function()
        function drawCredits(role, name)
            local scaleform = RequestScaleformMovie("OPENING_CREDITS")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            Scaleform.CallFunction(scaleform, false, "TEST_CREDIT_BLOCK", role, name, 'left', 0.0, 50.0, 1, 5, 10, 10)
            
            --=================================--
                --SETUP_CREDIT_BLOCK might give more customization, but further testing needs to be done.
                --"HIDE" function completly breaks SETUP_CREDIT_BLOCK, which means to we need to rely on stopping the scaleform draw.
            --=================================--

            --ID | x_location | y_location | align (LEFT, CENTER, RIGHT) | fade_in_duration | fade_out_duration 
            --Scaleform.CallFunction(scaleform, false, "SETUP_CREDIT_BLOCK", 1, 0.0, 0.0, "LEFT", 10, 10)

            --ID | role | x_offset | colour | is_raw_text | language (ja / japanese, ko / korean, zh / chinese, default)
            --Scaleform.CallFunction(scaleform, false, "ADD_ROLE_TO_CREDIT_BLOCK", 1, role, 0.0, 4, true, "")

            --ID | list_of_names_divided_by_delimiter | x_offset | delimiter | is_raw_text
            --Scaleform.CallFunction(scaleform, false, "ADD_NAMES_TO_CREDIT_BLOCK", 1, name, 100.1, ";", true)

            --ID | step_duration | anim_in_style (X, Y, xrotation, yrotation, default) | anim_in_value
            --Scaleform.CallFunction(scaleform, false, "SHOW_CREDIT_BLOCK", 1, 2, "X", 1)

            --=================================================--
                --This is a single line text (duh). Text below combines "name" font and "role" color from credit block.
            --=================================================--
            
            --ID | fade_in_duration | fade_out_duration | x_location |  y_location | align (LEFT, CENTER, RIGHT)
            --Scaleform.CallFunction(scaleform, false, "SETUP_SINGLE_LINE", 1, 10, 10, 0.0, 0.0, "LEFT")

            --ID | text | font ($font2, $font5) | colour | is_raw_text | language (ja / japanese, ko / korean, zh / chinese, default) | y_offset
            --Scaleform.CallFunction(scaleform, false, "ADD_TEXT_TO_SINGLE_LINE", 1, "TEXT", "$font2", 4, true, "", 0.0)

            --ID | anim_in_style (X, Y, xrotation, yrotation, default) | anim_in_value
            --Scaleform.CallFunction(scaleform, false, "SHOW_SINGLE_LINE", 1, "X", 1)

            --ID | step_duration | anim_out_style (X, Y, xrotation, yrotation, default) | anim_out_value
            --Scaleform.CallFunction(scaleform, false, "SHOW_SINGLE_LINE", 1, 10, "X", 1)
            return scaleform
        end
        local scale = drawCredits(_role, _name)
        while showCreditsBanner do
            Citizen.Wait(1)
            DrawScaleformMovie(scale, _x, _y, 0.71, 0.68, 255, 255, 255, 255)
        end
    end)
end --NEED TO BE REWORKED

function showHeist(ZinitialText, Ztable, Zmoney, Zxp)
    Citizen.CreateThread(function()
        function drawHeist(_initialText, _table, _money, _xp)
            local scaleform = Scaleform.Request('HEIST_CELEBRATION')
            local scaleform_bg = Scaleform.Request('HEIST_CELEBRATION_BG')
            local scaleform_fg = Scaleform.Request('HEIST_CELEBRATION_FG')

            local scaleform_list = {
                scaleform,
                scaleform_bg,
                scaleform_fg
            }

            for key, scaleform_handle in pairs(scaleform_list) do
                Scaleform.CallFunction(scaleform_handle, false, "CREATE_STAT_WALL", 1, "HUD_COLOUR_FREEMODE_DARK", 1)
                Scaleform.CallFunction(scaleform_handle, false, "ADD_BACKGROUND_TO_WALL", 1, 80, 1)
    
                --this should be used as it's own scaleform event.
                --Scaleform.CallFunction(scaleform_handle, false, "ADD_COMPLETE_MESSAGE_TO_WALL", 1, _initialText.missionTextLabel, _initialText.passFailTextLabel, _initialText.messageLabel, true, true, true)
    
                Scaleform.CallFunction(scaleform_handle, false, "ADD_MISSION_RESULT_TO_WALL", 1, _initialText.missionTextLabel, _initialText.passFailTextLabel, _initialText.messageLabel, true, true, true)
    
                if _table[1] ~= nil then
                    Scaleform.CallFunction(scaleform_handle, false, "CREATE_STAT_TABLE", 1, 10)
    
                    for i, k in pairs(_table) do
                        Scaleform.CallFunction(scaleform_handle, false, "ADD_STAT_TO_TABLE", 1, 10, _table[i].stat, _table[i].value, true, true, false, false, 0)
                    end
    
                    Scaleform.CallFunction(scaleform_handle, false, "ADD_STAT_TABLE_TO_WALL", 1, 10)
                end
    
                if _money.startMoney ~= _money.finishMoney then
                    Scaleform.CallFunction(scaleform_handle, false, "CREATE_INCREMENTAL_CASH_ANIMATION", 1, 20)
                    Scaleform.CallFunction(scaleform_handle, false, "ADD_INCREMENTAL_CASH_WON_STEP", 1, 20, _money.startMoney, _money.finishMoney, _money.topText, _money.bottomText, _money.rightHandStat, _money.rightHandStatIcon, 0)
                    Scaleform.CallFunction(scaleform_handle, false, "ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL", 1, 20)
                end
    
                if _xp.xpGained ~= 0 then
                    Scaleform.CallFunction(scaleform_handle, false, "ADD_REP_POINTS_AND_RANK_BAR_TO_WALL", 1, _xp.xpGained, _xp.xpBeforeGain, _xp.minLevelXP, _xp.maxLevelXP, _xp.currentRank, _xp.nextRank, _xp.rankTextSmall, _xp.rankTextBig)
                end
    
                Scaleform.CallFunction(scaleform_handle, false, "SHOW_STAT_WALL", 1)
                Scaleform.CallFunction(scaleform_handle, false, "createSequence", 1, 1, 1)
            end

            return scaleform, scaleform_bg, scaleform_fg
        end
        local scale, scale_bg, scale_fg = drawHeist(ZinitialText, Ztable, Zmoney, Zxp)
        while showHeistBanner do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreenMasked(scale_bg, scale_fg, 255, 255, 255, 50)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255)
        end
        StartScreenEffect("HeistCelebToast")
    end)
end

function changePauseMenuTitle(title)
    AddTextEntry('FE_THDR_GTAO', title)
end

function showSaving(_subtitle)
    Citizen.CreateThread(function()
        function drawScale(string1)
            local scaleform = Scaleform.Request('HUD_SAVING')

            Scaleform.CallFunction(scaleform, false, "SET_SAVING_TEXT_STANDALONE", 1, string1)
            Scaleform.CallFunction(scaleform, false, "SHOW")

            return scaleform
        end
        local scale = drawScale(_subtitle)
        while toggleSave do
            Citizen.Wait(1)
            DrawScaleformMovie(scale, 0.82, 0.95, 0.35, 0.05, 255, 255, 255, 255)
        end
    end)
end

function showWarehouse()
    local scaleform = Scaleform.Request('WAREHOUSE')

    Scaleform.CallFunction(scaleform, false, "SET_WAREHOUSE_DATA", 'nameLabel', 'locationLabel', 'txd', 'large', 16, 16, 50000, 1, 0)
    Scaleform.CallFunction(scaleform, false, "SET_PLAYER_DATA", 'gamerTag', 'organizationName', 'sellerRating', 'numSales', 'totalEarnings')
    Scaleform.CallFunction(scaleform, false, "SET_BUYER_DATA", 'buyerOrganization0', 'amount0', 'offerPrice0', 'buyerOrganization1', 'amount1', 'offerPrice1', 'buyerOrganization2', 'amount2', 'offerPrice2', 'buyerOrganization3', 'amount3', 'offerPrice3')

    Scaleform.CallFunction(scaleform, false, "SHOW_OVERLAY", 'titleLabel', 'messageLabel', 'acceptButtonLabel', 'cancelButtonLabel', 'success')
    Scaleform.CallFunction(scaleform, false, "SET_MOUSE_INPUT", 0.6, 0.6)
    return scaleform
end

function showMusicStudioMonitor(state)
    local scaleform = Scaleform.Request('MUSIC_STUDIO_MONITOR')

    Scaleform.CallFunction(scaleform, false, "SET_STATE", state)
    return scaleform
end

function showBusySpinnerNoScaleform(_text)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(_text)
    EndTextCommandBusyspinnerOn(1)
end

function showShutter()
    local scaleform = Scaleform.Request('CAMERA_GALLERY')
    Scaleform.CallFunction(scaleform, false, "CLOSE_THEN_OPEN_SHUTTER")
    Scaleform.CallFunction(scaleform, false, "SHOW_PHOTO_FRAME", 1)
    Scaleform.CallFunction(scaleform, false, "SHOW_REMAINING_PHOTOS", 1)
    Scaleform.CallFunction(scaleform, false, "FLASH_PHOTO_FRAME")
    return scaleform
end

function showGameFeed(title, subtitle, textblock, textureDirectory, textureName, rightAlign)
    local scaleform = Scaleform.Request('GTAV_ONLINE')

    Scaleform.CallFunction(scaleform, false, "SETUP_BIGFEED", rightAlign)
    Scaleform.CallFunction(scaleform, false, "HIDE_ONLINE_LOGO")
    Scaleform.CallFunction(scaleform, false, "SET_BIGFEED_INFO", "footer", textblock, 0, "", "", subtitle, "URL", title, 0)

    RequestStreamedTextureDict(textureDirectory)
    while not HasStreamedTextureDictLoaded(textureDirectory) do
        Citizen.Wait(0)
    end
    Scaleform.CallFunction(scaleform, false, "SET_BIGFEED_IMAGE", textureDirectory, textureName)
    Scaleform.CallFunction(scaleform, false, "SET_NEWS_CONTEXT", 0)
    Scaleform.CallFunction(scaleform, false, "FADE_IN_BIGFEED")
    return scaleform
end

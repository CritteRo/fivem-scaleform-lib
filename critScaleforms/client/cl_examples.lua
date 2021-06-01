RegisterCommand('ba', function() --shows big banner
    --TriggerEvent('cS.banner', _title, _subtitle, _waitTimeSeconds, _playShound)
    TriggerEvent('cS.banner', "~y~Test Banner~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 5, true)
end)

RegisterCommand('mq', function() --"Mission Quit" scaleform. Low opacity black background with title and subtitle.
    --TriggerEvent("cS.missionQuit", _title, _subtitle, _waitTimeSeconds, _playShound)
    TriggerEvent("cS.missionQuit", "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 5, true)
end)

RegisterCommand('st', function() --"Splash Text" scaleform. This is a simple text in the middle of the scree, with cursive font.
    --TriggerEvent("cS.SplashText", _text, _waitTimeSeconds, _playShound)
    TriggerEvent("cS.SplashText", "~y~Test Scaleform~s~.", 5, true)
end)

RegisterCommand('pw', function() --Popup Warning. Opaque black background, with Title, subtitle and an "error text" on the bottom left.
    --TriggerEvent("cS.PopupWarning", _title, _subtitle, _errorText, _waitTimeSeconds, _playShound)
    TriggerEvent("cS.PopupWarning", "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", "ERROR 420: Scaleforms too hot.", 5, true)
end)

RegisterCommand('cd', function() --Race countdown. waitTime is also the starting number. Plays sound only at the start.
    --TriggerEvent("cS.Countdown", _r, _g, _b, _waitTimeSeconds, _playSound)
    TriggerEvent("cS.Countdown", 0, 150, 200, 10, true)
end)

RegisterCommand('me', function() --midsize banner. Same as big banner, but midsized.
    --TriggerEvent("cS.MidsizeBanner", _title, _subtitle, _waitTimeSeconds, _playShound)
    TriggerEvent("cS.MidsizeBanner", "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 5, true)
end)

RegisterCommand('rp', function() --Results pannel. _slots argument needs to be a table. slots[i].state can be 0 or 2 for "not selected" and 1 or 3 for "selected".
    local slots = {
        {name = "test1", state = 0},
        {name = "test2", state = 1},
        {name = "test3", state = 2},
        {name = "test4", state = 3},
    }
    --TriggerEvent("cS.resultsPanel", _title, _subtitle, _slotsTable, _waitTimeSeconds, _playSound)
    TriggerEvent("cS.resultsPanel", "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", slots, 5, true)
end)

RegisterCommand('heist', function()
    --All 4 tables are required in order to proprer syncronize the scaleform.
    local _initialText = { --first slide. Consists of 3 text lines.
        missionTextLabel = "~y~BANK HEIST~s~", 
        passFailTextLabel = "PASSED.",
        messageLabel = "I don't even know why we have a third message.",
    }
    local _table = { --second slide. You can add as many "stats" as you want. They will appear from botton to top, so keep that in mind.
        {stat = "Total Payout", value = "~g~$~s~50000"},
        --{stat = "value3", value = "~g~$~s~50000"},
        --{stat = "value2", value = "~b~1999~s~"},
        --{stat = "value1", value = "TEST"},
    }
    local _money = { --third slide. Incremental money. It will start from startMoney and increment to finishMoney. top and bottom text appear above/below the money string.
        startMoney = 3000,
        finishMoney = 53000,
        topText = "",
        bottomText = "",
        rightHandStat = "woah",
        rightHandStatIcon = 0, --0 or 1 = checked, 2 = X, 3 = no icon
    }
    local _xp = { --fourth and final slide. XP Bar slide. Will start with currentRank and a xp bar filled with (xpBeforeGain - minLevelXP) and will add xpGained. If you rank up, it goes to "Level Up" slide.
        xpGained = 500,
        xpBeforeGain = 1400,
        minLevelXP = 600,
        maxLevelXP = 2360,
        currentRank = 68,
        nextRank = 69,
        rankTextSmall = "LEVEL UP.",
        rankTextBig = "~b~Nice.~s~",
    }
    TriggerEvent("cS.HeistFinale", _initialText, _table, _money, _xp, 10, true)
end)

RegisterCommand('credits', function() --Credit Block. You can add a role, and how many people you want. 8 _waitTimeSeconds should be the standard.
    --TriggerEvent("cS.Credits", roleString, namesString, xScreenCoord, yScreenCoord, _waitTimeSeconds, _playSound)
    --If you want more names in the namesString field, separate them with \n like in the example
    Citizen.CreateThread(function()
        TriggerEvent("cS.Credits", "Resource Developer", "CritteR\n   or CritteRo", 0.4, 0.5, 8, true)
        Citizen.Wait(10*1000)
        TriggerEvent("cS.Credits", "Scaleforms provided by", "Vespura\n\nThanks! <3", 0.7, 0.2, 8, false)
        Citizen.Wait(10*1000)
        TriggerEvent("cS.Credits", "Third Credit Block", "Just for looks", 1.0, 0.15, 8, false)
    end)
end)

RegisterCommand('title', function(source, args)
    if args[1] ~= nil then
        local str = ""
        for k, v in pairs(args) do
            if k ~= nil then
                str = string.format("%s %s", str, tostring(args[k]))
            else
                break
            end
        end
        TriggerEvent("cS.ChangePauseMenuTitle", str)
    else
        TriggerEvent("cS.ChangePauseMenuTitle", "Please type a name after ~y~/title~s~.")
    end
end)

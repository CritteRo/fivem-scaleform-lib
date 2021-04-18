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
    --TriggerEvent("cS.Countdown", _waitTimeSeconds, _playSound)
    TriggerEvent("cS.Countdown", 10, true)
end)

RegisterCommand('me', function() --midsize banner. Same as big banner, but midsized.
    --TriggerEvent("cS.MidsizeBanner", _title, _subtitle, _waitTimeSeconds, _playShound)
    TriggerEvent("cS.MidsizeBanner", "~y~Test Scaleform~s~.", "", 5, true)
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
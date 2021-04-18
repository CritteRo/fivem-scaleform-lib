# fivem-scaleform-lib
## A library of GTA 5 scaleforms for FiveM. All scaleforms can be activated using events.
 All events are client-side only. If you want to use them from server-side too, you will need to register them in `cl_main.lua`.
 
 As I find more usable scaleforms, I will keep this resource updated. If you know some cool scaleforms, feel free to make a PR.

## Current list of scaleforms included:

- `TriggerEvent('cS.banner', _title, _subtitle, _waitTimeSeconds, _playShound)`
- `TriggerEvent("cS.missionQuit", _title, _subtitle, _waitTimeSeconds, _playShound)`
- `TriggerEvent("cS.SplashText", _text, _waitTimeSeconds, _playShound)`
- `TriggerEvent("cS.PopupWarning", _title, _subtitle, _errorText, _waitTimeSeconds, _playShound)`
- `TriggerEvent("cS.Countdown", _waitTimeSeconds, _playSound)`
- `TriggerEvent("cS.MidsizeBanner", _title, _subtitle, _waitTimeSeconds, _playShound)`
- `TriggerEvent("cS.resultsPanel", _title, _subtitle, _slotsTable, _waitTimeSeconds, _playSound)`

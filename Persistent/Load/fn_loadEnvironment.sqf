/*
    Author: Skhpersist(Original), PrinceF90(Revisited)

    Description:
        This function loads environment information from a specified slot and sets the environment parameters accordingly.

    Parameter(s):
        0: NUMBER - Slot number from which to load environment information

    Returns:
        None

    Examples:
        // Load environment info from slot 2
        [2] call F90_fnc_loadEnvironment;
*/

params ["_slot"];

[PersistentDebug, "loadEnvironment", format ["Loading environment information from slot %1", _slot], false] call F90_fnc_debug;

private _environment = ["environment", _slot] call F90_fnc_loadData;

private _date = [_environment, "date"] call F90_fnc_getByKey;
private _rain = [_environment, "rain"] call F90_fnc_getByKey;
private _fog = [_environment, "fog"] call F90_fnc_getByKey;
private _overcast = [_environment, "overcast"] call F90_fnc_getByKey;

setDate _date;
0 setRain _rain;
0 setFog _fog;
0 setOvercast _overcast;
forceWeatherChange;
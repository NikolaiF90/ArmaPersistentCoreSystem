/*
	Author: Skhpersist(Original), PrinceF90(Revisited)

    Description:
        This function saves environment information to a specified slot.

    Parameter(s):
        0: NUMBER - Slot number to save the environment info

    Returns:
        None

    Examples:
        // Save environment info to slot 1
        [1] call F90_fnc_saveEnvironment;
*/

params ["_slot"];

[PersistentDebug, "saveEnvironment", format ["Saving environment info to slot %1.", _slot], false] call F90_fnc_debug;

private _environment = [];

_environment pushBack ["date", date];
_environment pushBack ["rain", rain];
_environment pushBack ["fog", fog];
_environment pushBack ["overcast", overcast];

["environment", _environment, _slot] call F90_fnc_saveData;
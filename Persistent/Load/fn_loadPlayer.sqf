/*
    Author: Skhpersist(Original), PrinceF90(Revisited)

    Description:
        This script loads player data from a specified slot and then loads the unit data for the player.

    Parameter(s):
        0: NUMBER - The slot number from which player data will be loaded.

    Returns:
        None

    Examples:
        [1] call F90_fnc_loadPlayer;
*/
params ["_slot"];

[PersistentDebug, "loadPlayer", format ["Loading player data from slot %1.", _slot], false]call F90_fnc_debug;

private _unitData = ["player", _slot] call F90_fnc_loadData;
[player, _unitData, objNull] call F90_fnc_loadUnitData;
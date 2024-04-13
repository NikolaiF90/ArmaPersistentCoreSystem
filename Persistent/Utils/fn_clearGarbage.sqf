/*
    Author: PrinceF90

    Description:
        A function to clear garbage such as dead bodies, wrecked vehicle etc.

    Parameter(s):
        None

    Returns:
        None

    Examples:
        [] call F90_fnc_clearGarbage;
*/
[PersistentDebug, "clearGarbage", "Clearing garbage...", false] call F90_fnc_debug;
{
	deleteVehicle _x;
} forEach allDead;

[PersistentDebug, "clearGarbage", "Garbage cleared.", false] call F90_fnc_debug;
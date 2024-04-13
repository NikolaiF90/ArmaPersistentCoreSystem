/*
    Author: PrinceF90

    Description:
    	Removes all persisted data for given save _slot.

    Parameter(s):
        0: _slot(optional) - if not specified, all data persisted by this system will be removed
*/
params ["_slot"];

[PersistentDebug, "clearSave", "Clearing save...", false] call F90_fnc_debug;
// private ["_variables"];

if (isNil "_slot") then
{
	[PersistentDebug, "clearSave", "Clearing all saves.", false] call F90_fnc_debug;
	//_variables = [] call F90_fnc_listExistingVariables;
} else
{
	[PersistentDebug, "clearSave", format ["Clearing progress from slot %1", _slot], false] call F90_fnc_debug;
	//_variables = [_slot] call F90_fnc_listExistingVariables;
};

/*
{
	profileNamespace setVariable [_x, nil];
} forEach _variables;

saveProfileNamespace;
*/

[PersistentDebug, "clearSave", "Save cleared.", false] call F90_fnc_debug;
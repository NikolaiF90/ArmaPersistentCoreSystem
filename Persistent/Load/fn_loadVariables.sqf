/*
    Author: Sukhoi191(Original), PrinceF90(Revisited)

    Description:
        This script loads variables from a specified slot, saves them to their respective namespaces, and updates the list of variables to be saved persistently.

    Parameter(s):
        0: NUMBER - Slot number from which variables will be loaded

    Returns:
        None

    Examples:
        // [1] call F90_fnc_loadVariables;
*/

params ["_slot"];

[PersistentDebug, "loadVariables", format ["Loading all variables from slot %1...", _slot], false] call F90_fnc_debug;

private _allVariables = ["variables", _slot] call F90_fnc_loadData;

[Persistent_VariablesToSave] call F90_fnc_clearArray;

{
	private _namespace = _x # 0;
    private _key = _x # 1;
	private _value = _x # 2;

	[_namespace, _key, _value] call F90_fnc_saveToNamespace;

	Persistent_VariablesToSave pushBack [_namespace, _key];
} forEach _allVariables;

[PersistentDebug, "loadVariables", "All variables has been successfully loaded.", false] call F90_fnc_debug;
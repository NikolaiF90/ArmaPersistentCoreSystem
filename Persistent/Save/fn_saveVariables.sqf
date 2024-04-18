/*
    Author: Sukhoi191(Original), PrinceF90(Revisited)

    Description:
        This script saves variables from specified namespaces to a slot for later retrieval.

    Parameter(s):
        0: NUMBER - Slot number where the variables will be saved

    Returns:
        None

    Examples:
        // [_slot] call F90_fnc_saveVariables;
*/

params ["_slot"];

[PersistentDebug, "saveVariables", format ["Saving all variables to slot %1...", _slot], false] call F90_fnc_debug;

private _allVariables = [];

{
	private _namespace = _x # 0;
	private _name = _x # 1;
	private _value = [_namespace, _name] call F90_fnc_loadFromNamespace;

    _allVariables pushBack [_namespace, _name, _value];
} forEach Persistent_VariablesToSave;

["variables", _allVariables, _slot] call F90_fnc_saveData;

[PersistentDebug, "saveVariables", "All variables saved.", false] call F90_fnc_debug;
/*
    Author: Sukhoi191(Original), PrinceF90(Revisited)

Description:
    This function sets a variable with a specified key and value in the specified namespace.

Parameter(s):
    0: STRING - Namespace identifier (e.g., "local", "mission", "parsing", "profile", "ui")
    1: STRING - Variable key to set in the specified namespace
    2: ANY - Value to assign to the variable in the specified namespace

Returns:
    None

Examples:
    // ["local", "alliedScore", 10] call F90_fnc_saveToNamespace;
    // ["profile", "playerName", "John Doe"] call F90_fnc_saveToNamespace;
*/

params ["_namespace", "_key", "_value"];

switch (_namespace) do
{
	case "local":
	{
		localNamespace setVariable [_key, _value];
	};
	case "mission":
	{
		missionNamespace setVariable [_key, _value];
	};
	case "parsing":
	{
		parsingNamespace setVariable [_key, _value];
	};
	case "profile":
	{
		profileNamespace setVariable [_key, _value];
	};
	case "ui":
	{
		uiNamespace setVariable [_key, _value];
	};
};
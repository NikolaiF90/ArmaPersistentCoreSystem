/*
    Author: Sukhoi191(Original), PrinceF90(Revisited)

    Description:
        This function retrieves a variable based on the specified namespace from different namespaces.

    Parameter(s):
        0: STRING - Namespace identifier (e.g., "local", "mission", "parsing", "profile", "ui")
        1: STRING - Variable key to retrieve from the specified namespace

    Returns:
        STRING - The value of the variable retrieved from the specified namespace

    Examples:
        // _result = ["profile", "playerName"] call F90_fnc_loadFromNamespace;
*/

params ["_namespace", "_key"];

private ["_value"];

switch (_namespace) do
{
	case "local":
	{
		_value = localNamespace getVariable _key;
	};
	case "mission":
	{
		_value = missionNamespace getVariable _key;
	};
	case "parsing":
	{
		_value = parsingNamespace getVariable _key;
	};
	case "profile":
	{
		_value = profileNamespace getVariable _key;
	};
	case "ui":
	{
		_value = uiNamespace getVariable _key;
	};
};

_value;
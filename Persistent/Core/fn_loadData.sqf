/*
	Funtion to retrieves a value for given _key from profileNamespace for save on given _slot.
	This script is modified so that old save can still be loaded even after the mission gets updated without corrupting old saves

	SYNTAX:
		[key, slot] call F90_fnc_loadData;
	PARAMETERS:
		key : Can be one of the following:
			- STRING
			- ARRAY [key,default] where default is the default value to use if key doesn't exist
		slot: save slot to find the key from
	RETURN:
		value of given _key on given save _slots
*/

params ["_key", "_slot"];
[PersistentDebug, "loadData", format ["Loading data for key %1 on save slot %2.", _key, _slot], false] call F90_fnc_debug;

private ["_returnData", "_loadKey", "_default", "_keyToFind"];
if (typeName _key == "STRING") then 
{
	_loadKey = _key;
	_keyToFind = format ["%1.%2.%3", Persistent_SavePrefix, _slot, _loadKey];
	_returnData = missionProfileNamespace getVariable _keyToFind;
};
if (typeName _key == "ARRAY") then 
{
	_loadKey = _key # 0;
	_default = _key # 1;
	_keyToFind = format ["%1.%2.%3", Persistent_SavePrefix, _slot, _loadKey];
	_returnData = missionProfileNamespace getVariable [_keyToFind, _default];
};

[PersistentDebug, "loadData", format ["Key %1 loaded.", _key, _slot], false] call F90_fnc_debug;

_returnData;

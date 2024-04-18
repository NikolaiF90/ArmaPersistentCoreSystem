/*
	Author: PrinceF90 
 
	Description: 
	Function to save data into the profileNamespace using a specified key, value, and slot. It sets a variable in the profileNamespace with a formatted key name and assigns it the provided value. 
	
	Parameter(s): 
	0: STRING - _key: The key used to identify the data being saved. 
	1: Any - _value: The value to be saved. 
	2: SCALAR - _slot: The slot number where the data will be saved. 
	
	Returns: 
	None 
	
	Examples: 
	// Example 1: Saving data with key "player_name" and value "John" into slot 1 
	["player_name", "John", 1] call F90_fnc_saveData; 
	
	// Example 2: Saving data with key "score" and value 100 into slot 2 
	["score", 100, 2] call F90_fnc_saveData;
*/

params ["_key", "_value", "_slot"];

missionProfileNamespace setVariable [format ["%1.%2.%3", Persistent_SavePrefix, _slot, _key], _value];

[PersistentDebug, "saveData", format["Data saved to %1.%2.%3", Persistent_SavePrefix, _slot, _key],false] call F90_fnc_debug;
/*
	Author: PrinceF90 
 
	Description: 
	Function to populates provided list box by retrieving saves from profileNamespace. 
	
	Parameter(s): 
	0: SCALAR - _listID: The idc of the list box to populate with save slots. 
	
	Returns: 
	None 
	
	Examples: 
	// Example 1: 
	["exampleListBox"] call F90_fnc_updatePersistentList; 
	
	// Example 2: 
	["anotherListBox"] call F90_fnc_updatePersistentList;
*/
params ["_listID"];

[PersistentDebug, "updatePersistentList", "Updating persistent slot list...", true] call F90_fnc_debug;

[PersistentDebug, "updatePersistentList", "Clearing list box...", false] call F90_fnc_debug;
lbClear _listID;
[PersistentDebug, "updatePersistentList", "Cleared list box.", false] call F90_fnc_debug;

[PersistentDebug, "updatePersistentList", "Loading slots from profileNamespace...", false] call F90_fnc_debug;
private _slotArray = profileNameSpace getVariable Persistent_PersistentListKey;
if (isNil "_slotArray") then 
{
	[PersistentDebug, "updatePersistentList", "No saves found, using default slot instead.", false] call F90_fnc_debug;
	Persistent_Slots = Persistent_DefaultSlots;
} else 
{
	[PersistentDebug, "updatePersistentList", "Saves list found. Now populating list box with saves.", false] call F90_fnc_debug;
	Persistent_Slots = _slotArray;
};

{
	lbAdd [_listID, _x];
} forEach Persistent_Slots;

[PersistentDebug, "updatePersistentList", "Persistent tab updated.", true] call F90_fnc_debug;
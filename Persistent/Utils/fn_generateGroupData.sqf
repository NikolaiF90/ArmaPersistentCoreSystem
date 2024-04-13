/*
	Author: PrinceF90 
 
    Description: 
        This function generates and returns an array of unit data for all units in the group of the specified leader, excluding the leader itself. 
    
    Parameter(s): 
        0: OBJECT - _leader: The leader unit for which group data will be generated. 
    
    Returns: 
        ARRAY - An array containing unit data for all units in the group of the specified leader, excluding the leader. 
    
    Examples: 
        // [leaderUnit] call F90_fnc_generateGroupData;
*/
params ["_leader"];

private _groupArray = units group _leader;
private _unitsData = [];

[PersistentDebug, "generateGroupData", format ["Generating group data for leader %1...", _leader], false] call F90_fnc_debug;

{
    if (_x != _leader && alive _x) then
    {
        _unitsData pushBack ([_x, false] call F90_fnc_generateUnitData);
    };
} forEach _groupArray;

[PersistentDebug, "generateGroupData", format ["Group data for leader %1 has been successfully generated.", _leader], false] call F90_fnc_debug;
_unitsData;
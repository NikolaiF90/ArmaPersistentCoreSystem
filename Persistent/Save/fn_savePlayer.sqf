/*
	Author: PrinceF90 
 
    Description: 
        Function to save player data to a specified slot. 
    
    Parameter(s): 
        0: NUMBER - _slot: The slot where the player data will be saved. 
    
    Returns: 
        None 
    
    Examples: 
        [4] call F90_fnc_savePlayer;
*/
params ["_slot"];

[PersistentDebug, "savePlayer", format["Saving player data to slot %1",_slot], true] call F90_fnc_debug;

private _playerData = [player, true] call F90_fnc_generateUnitData;
["player", _playerData, _slot] call F90_fnc_saveData;
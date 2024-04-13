/*
    Author: PrinceF90 
 
    Description: 
        This script checks the type of object the player is looking at (vehicle or container) and saves the object to a persistent array for future reference. 
    
    Parameter(s): 
        0: OBJECT - The cursor target object to be checked and saved. 
        1: ARRAY - The array where the persistent objects are stored. 
    
    Returns: 
        None 
    
    Examples: 
        [] call F90_fnc_saveTarget;
*/

private _cursorTarget = cursorTarget;
private _objectToSave = objNull;

if (_cursorTarget isKindOf "LandVehicle" || _cursorTarget isKindOf "Air" || _cursorTarget isKindOf "Ship") then 
{
   _objectToSave = _cursorTarget; 
   [_objectToSave] call F90_fnc_generateVehicleID;
   [PersistentDebug, "saveTarget", format ["%1 added to save queue.", _cursorTarget], true] call F90_fnc_debug;
} else
{
    [PersistentDebug, "saveTarget", format ["%1 is not a vehicle.", _cursorTarget], true] call F90_fnc_debug;
};
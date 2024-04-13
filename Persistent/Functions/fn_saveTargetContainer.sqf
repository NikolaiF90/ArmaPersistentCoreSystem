/*
    Author: PrinceF90 
 
    Description: 
        Same as saveTarget, this script checks the type of object the player is looking at and saves the object to a persistent array. Use with caution as the script supposed to save only container.
    
    Parameter(s): 
        0: OBJECT - The cursor target object to be checked and saved. 
        1: ARRAY - The array where the persistent objects are stored. 
    
    Returns: 
        None 
    
    Examples: 
        [] call F90_fnc_saveTarget;
*/

private _cursorTarget = cursorTarget;

[_cursorTarget, Persistent_ContainersToSave] call F90_fnc_makePersistent;
[PersistentDebug, "saveTargetContainer", format ["%1 is now persistent.", _cursorTarget], true] call F90_fnc_debug;
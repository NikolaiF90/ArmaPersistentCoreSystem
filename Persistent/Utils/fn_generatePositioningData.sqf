/*
	Author: PrinceF90 
 
    Description: 
        This function generates and returns an array containing the position and rotation data for a given entity. 
    
    Parameter(s): 
        0: OBJECT - _entity: The entity for which position and rotation data will be generated. 
    
    Returns: 
        ARRAY - An array containing the position and rotation data for the specified entity. 
    
    Examples: 
        // [player] call F90_fnc_generatePositioningData;
*/
params ["_entity"];

private ["_returnData", "_entityPos", "_entityRotation"];
[PersistentDebug, "generatePositioningData", format ["Generating position and rotation array for entity %1...", _entity], false] call F90_fnc_debug;

_entityPos = getPosATL _entity;
_entityRotation = getDir _entity;
_returnData = [_entityPos, _entityRotation];

[PersistentDebug, "generatePositioningData", format ["Position and rotation array for entity %1 has been successfully generated.", _entity], false] call F90_fnc_debug;

_returnData;
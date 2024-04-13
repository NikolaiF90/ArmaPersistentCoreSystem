/*
    Author: PrinceF90

    Description:
        This function saves data of custom containers, including their class, cargo content, and positioning data, to a specified slot.

    Parameter(s):
        0: SCALAR - The slot number to which the container data will be saved.

    Returns:
        None

    Examples:
        [] call F90_fnc_saveContainers;
*/

params ["_slot"];

[PersistentDebug, "saveCustomContainers", format ["Saving containers to slot %1.", _slot], false] call F90_fnc_debug;

private _containers = [];

{
    private _container = _x;
    private _containerData = [];
    
    _containerData pushBack ["class", typeOf _container];
    _containerData pushBack ["cargo", [_container] call F90_fnc_generateCargoData];
    _containerData pushBack ["posRotation", [_container] call F90_fnc_generatePositioningData];
        
    _containers pushBack _containerData;

} forEach Persistent_ContainersToSave;

["containers", _containers, _slot] call F90_fnc_saveData;

[PersistentDebug, "saveContainers", "Containers saved.", false] call F90_fnc_debug;
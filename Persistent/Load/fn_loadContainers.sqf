/*
    Author: Skhpersis(Original), PrinceF90(Revisited)

    Description:
        This function loads container data from a specified slot, creates container objects based on the loaded data, and applies cargo and positioning data to each container.

    Parameter(s):
        0: NUMBER - The slot number from which container data will be loaded.

    Returns:
        None

    Examples:
        [1] call F90_fnc_loadContainers;
*/

params ["_slot"];

[PersistentDebug, "loadContainers", format ["Loading containers from slot %1...", _slot], false] call F90_fnc_debug;

private _containers = ["containers", _slot] call F90_fnc_loadData;

{
    deleteVehicle _x;
} forEach Persistent_ContainersToSave;

[Persistent_ContainersToSave] call F90_fnc_clearArray;

{
    private _class = [_x, "class"] call F90_fnc_getByKey;
    private _cargo = [_x, "cargo"] call F90_fnc_getByKey;
    private _posRotation = [_x, "posRotation"] call F90_fnc_getByKey;
    
    private _container = _class createVehicle [0, 0, 0];
    [_container, _posRotation] call F90_fnc_applyPositioningData;
    [_container, _cargo] call F90_fnc_applyCargoData;
    [_container, Persistent_ContainersToSave] call F90_fnc_makePersistent;
} forEach _containers;

[PersistentDebug, "loadContainers", "All containers has been successfully loaded.", false] call F90_fnc_debug;
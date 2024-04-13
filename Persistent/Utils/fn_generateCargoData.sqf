/*
	Author: PrinceF90 
 
    Description: 
        Function to generate cargo data for a given container. It retrieves information about the items, magazines, weapons, containers, and backpacks inside the container. 
    
    Parameter(s): 
        0: OBJECT - The container object for which cargo data is generated. 
    
    Returns: 
        ARRAY - An array containing cargo data for the specified container. 
    
    Examples: 
        // Example 1: 
        private _containerData = [_myContainer] call F90_fnc_generateCargoData; 
        // _myContainer is the container object for which cargo data is required. 
    
        // Example 2: 
        private _containerData = [_anotherContainer] call F90_fnc_generateCargoData; 
        // _anotherContainer is the container object for which cargo data is required.
*/

params ["_container"];

private _GetContainersArray =
{
    params ["_container"];

    private _containersArray = [];

    {
        private _class = _x # 0;
        private _instance = _x # 1;
        private _cargo = [_instance] call F90_fnc_generateCargoData;

        private _currentContainerArray = [];

        _currentContainerArray pushBack ["class", _class];
        _currentContainerArray pushBack ["cargo", _cargo];

        _containersArray pushBack _currentContainerArray;
    } forEach (everyContainer _container);
    
    _containersArray;
};

private _GetBackpacksArray =
{
    params ["_container"];

    private _backpacksArray = [];

    {
        private _class = typeOf _x;
        private _cargo = [_x] call F90_fnc_generateCargoData;

        private _currentBackpackArray = [];

        _currentBackpackArray pushBack ["class", _class];
        _currentBackpackArray pushBack ["cargo", _cargo];

        _backpacksArray pushBack _currentBackpackArray;
    } forEach (everyBackpack _container);
    
    _backpacksArray;
};

[PersistentDebug, "generateCargoData", format ["Generating cargo data for container %1.", _container], false] call F90_fnc_debug;

private _itemsArray = ["items", getItemCargo _container];
private _magazinesArray = ["magazines", magazinesAmmoCargo _container];
private _weaponsArray = ["weapons", weaponsItemsCargo _container];
private _containersArray = ["containers", [_container] call _GetContainersArray];
private _backpacksArray = ["backpacks", [_container] call _GetBackpacksArray];

private _cargo =
[
    _itemsArray,
    _magazinesArray,
    _weaponsArray,
    _containersArray,
    _backpacksArray
];

[PersistentDebug, "generateCargoData", format ["Cargo data for container %1 successfully generated.", _container], false] call F90_fnc_debug;

_cargo;
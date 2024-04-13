/*
    Author: Skhpersist(Original), PrinceF90(Revisited)

    Description:
        This function populates a container with items, magazines, weapons, containers, and backpacks based on the provided cargo array.

    Parameter(s):
        0: OBJECT - The container to populate.
        1: ARRAY - An array containing different types of cargo items to add to the container.

    Returns:
        None

    Examples:
        // [_container, _containerCargo] call F90_fnc_applyCargoDataData;
*/

params ["_container", "_cargoArray"];

clearItemCargo _container;
clearMagazineCargo _container;
clearWeaponCargo _container;
clearBackpackCargo _container;

private _IsContainerEmpty =
{
    params ["_container"];

    if (!(magazineCargo _container isEqualTo [])) exitWith { false };
    if (!(weaponCargo _container isEqualTo [])) exitWith { false };
    if (!(itemCargo _container isEqualTo [])) exitWith { false };
    if (!(backpackCargo _container isEqualTo [])) exitWith { false };

    true;
};

private _AddAllToCargo =
{
    params ["_container", "_cargoArray", "_AddToCargo"];
    
    {
        private _name = _x;
        private _count = (_cargoArray # 1) # _forEachIndex;
        [_container, _name, _count] call _AddToCargo;
    } forEach (_cargoArray # 0);
};

private _AddAllMagazinesToCargo =
{
    params ["_container", "_cargoArray"];

    {
        private _name = _x # 0;
        private _ammo = _x # 1;

        _container addMagazineAmmoCargo [_name, 1, _ammo];
    } forEach _cargoArray;
};

private _AddAllWeaponsToCargo =
{
    params ["_container", "_cargoArray"];

    {
        _container addWeaponWithAttachmentsCargo [_x, 1];
    } forEach _cargoArray;
};

private _AddAllContainersToCargo =
{
    params ["_container", "_cargoArray"];

    {
        private _class = [_x, "class"] call F90_fnc_getByKey;
        private _cargo = [_x, "cargo"] call F90_fnc_getByKey;
        
        {
            private _currentClass = _x # 0;
            private _currentInstance = _x # 1;

            if (_currentClass == _class && [_currentInstance] call _IsContainerEmpty) exitWith
            {
                [_currentInstance, _cargo] call F90_fnc_applyCargoData;
            };
        } forEach (everyContainer _container);

    } forEach _cargoArray;
};

private _AddAllBackpacksToCargo =
{
params ["_container", "_cargoArray"];

    {
        private _class = [_x, "class"] call F90_fnc_getByKey;
        private _cargo = [_x, "cargo"] call F90_fnc_getByKey;

        _container addBackpackCargo [_class, 1];

        {
            if (typeOf _x == _class && [_x] call _IsContainerEmpty) exitWith
            {
                [_x, _cargo] call F90_fnc_applyCargoData;
            };
        } forEach (everyBackpack _container);

    } forEach _cargoArray;
};

private _itemsArray = [_cargoArray, "items"] call F90_fnc_getByKey;
private _magazinesArray = [_cargoArray, "magazines"] call F90_fnc_getByKey;
private _weaponsArray = [_cargoArray, "weapons"] call F90_fnc_getByKey;
private _containersArray = [_cargoArray, "containers"] call F90_fnc_getByKey;
private _backpacksArray = [_cargoArray, "backpacks"] call F90_fnc_getByKey;

[_container, _itemsArray, { params ["_c", "_n", "_cnt"]; _c addItemCargo [_n, _cnt]; }] call _AddAllToCargo;
[_container, _magazinesArray] call _AddAllMagazinesToCargo;
[_container, _weaponsArray] call _AddAllWeaponsToCargo;
[_container, _containersArray] call _AddAllContainersToCargo;
[_container, _backpacksArray] call _AddAllBackpacksToCargo;

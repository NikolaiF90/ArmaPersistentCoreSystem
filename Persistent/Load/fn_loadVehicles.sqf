/*
    Author: PrinceF90

    Description:
        This function loads persistent vehicle data from a specified slot and recreates the vehicles in the game world.

    Parameter(s):
        0: NUMBER - The slot number from which to load the persistent vehicle data.

    Returns:
        None

    Examples:
        // [1] call F90_fnc_loadVehicles;
*/
params ["_slot"];

[PersistentDebug, "loadVehicles", format["Loading persistent vehicles from slot %1", _slot], false] call F90_fnc_debug;

private ["_vehicles"];

_vehicles = ["vehicles", _slot] call F90_fnc_loadData;
if (isNil "_vehicles") exitWith {[PersistentDebug, "loadVehicles", format["No vehicles to load from slot %1", _slot], false] call F90_fnc_debug;};

//  Delete old existing vehicles
if (count Persistent_VehiclesToSave > 0) then
{
    {
        deleteVehicle _x;
    } forEach Persistent_VehiclesToSave;

    [Persistent_VehiclesToSave] call F90_fnc_clearArray;
    Persistent_VehiclesToSave = [];
};

//  Creating vehicles from persistent data
{
    private _class = [_x, "class"] call F90_fnc_getByKey;
    private _fuel = [_x, "fuel"] call F90_fnc_getByKey;
    private _generalDamage = [_x, "generalDamage"] call F90_fnc_getByKey;
    private _damages = [_x, "damages"] call F90_fnc_getByKey;
    private _cargo = [_x, "cargo"] call F90_fnc_getByKey;
    private _posRotation = [_x, "posRotation"] call F90_fnc_getByKey;
    private _turretData = [_x, "turrets"] call F90_fnc_getByKey;
    private _materialData = [_x, "materials"] call F90_fnc_getByKey;
    private _textureData = [_x, "textures"] call F90_fnc_getByKey;
    private _id = [_x, "id"] call F90_fnc_getByKey;

    private _vehicle = _class createVehicle [0, 0, 0];
    [_vehicle, _posRotation] call F90_fnc_applyPositioningData;
    _vehicle setFuel _fuel;
    _vehicle setDamage _generalDamage;
    [_vehicle, _damages] call F90_fnc_applyDamage;
    [_vehicle, _cargo] call F90_fnc_applyCargoData;

    // Clear turret magazine 
    {
        private _turretPath = _x;

        {
            _vehicle removeMagazinesTurret [_x, _turretPath];
        } forEach (_vehicle magazinesTurret  _turretPath)
    } forEach (allTurrets _vehicle);

    // Apply turret data
    {
        private _class = _x # 0;
        private _turretPath = _x # 1;
        private _ammo = _x # 2;

        _vehicle addMagazineTurret [_class, _turretPath, _ammo];
    } forEach _turretData;

    // Apply materials
    {
        _vehicle setObjectMaterial [_forEachIndex, _x];
    } forEach _materialData;

    //  Apply textures
    {
        _vehicle setObjectTexture [_forEachIndex, _x];
    } forEach _textureData;

    _vehicle setVariable [Persistent_VehicleIDKey, _id];
//    _vehicle setVariable ["PSave_UnitAssignmentID", _id];
    
    Persistent_VehiclesToSave set [_id, _vehicle];
} forEach _vehicles;
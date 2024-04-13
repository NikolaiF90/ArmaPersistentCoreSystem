/*
    Author: PrinceF90

    Description:
        This function saves data of custom vehicles, including their characteristics like class, fuel, damage, cargo, etc., to a specified slot for persistence.

    Parameter(s):
        0: SCALAR - The slot number to which the custom vehicle data will be saved.

    Returns:
        None

    Examples:
        // [1] call F90_fnc_saveVehicles;
*/
params ["_slot"];

private _GenerateTurretArray =
{
    params ["_vehicle"];

    private _turretsArray = [];

    {
        _turretsArray pushBack _x;
    } forEach (magazinesAllTurrets _vehicle);

    _turretsArray;
};  


private _vehicles = [];

{
    private _vehicle = _x;
    private _vehicleArray = [];
    
    _vehicleArray pushBack ["class", typeOf _vehicle];
    _vehicleArray pushBack ["fuel", fuel _vehicle];
    _vehicleArray pushBack ["generalDamage", damage _vehicle];
    _vehicleArray pushBack ["damages", getAllHitPointsDamage _vehicle];
    _vehicleArray pushBack ["cargo", [_vehicle] call F90_fnc_generateCargoData];
    _vehicleArray pushBack ["posRotation", [_vehicle] call F90_fnc_generatePositioningData];
    _vehicleArray pushBack ["turrets", [_vehicle] call _GenerateTurretArray];
    _vehicleArray pushBack ["materials", getObjectMaterials _vehicle];
    _vehicleArray pushBack ["textures", getObjectTextures _vehicle];
    _vehicleArray pushBack ["id", _vehicle getVariable Persistent_VehicleIDKey];

    _vehicles pushBack _vehicleArray;

} forEach Persistent_VehiclesToSave;

["vehicles", _vehicles, _slot] call F90_fnc_saveData;
[PersistentDebug, "saveCustomVehicles", format ["Vehicles saved to slot %1.",_slot], false] call F90_fnc_debug;
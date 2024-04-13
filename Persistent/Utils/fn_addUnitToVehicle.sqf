/*
	Author: Skhpersist(Original), PrinceF90(Revisited)
 
    Description: 
        This script assigns a unit to a specific role in a vehicle based on the provided vehicle data. 
    
    Parameter(s): 
        0: OBJECT - The unit to be assigned to a role in the vehicle. 
        1: ARRAY - The data containing information about the vehicle and the role to be assigned. 
    
    Returns: 
        None 
    
    Examples: 
        [_player, _vehicleData] call F90_fnc_addUnitToVehicle;
*/

params ["_unit", "_vehicleData"];
[PersistentDebug, "addUnitToVehicle", format ["Adding %1 to a vehicle..."], false] call F90_fnc_debug;

if (isNil {_vehicleData}) exitWith { [PersistentDebug, "addUnitToVehicle", format ["%1 has no vehicle", _unit], false]call F90_fnc_debug; };
if !(_vehicleData isEqualType []) exitWith {[PersistentDebug, "addUnitToVehicle", format ["%1 has no vehicle", _unit], false] call F90_fnc_debug;};
private _FindAssignedVehicleInArray =
{
	params ["_id"];
	private _instance = objNull;

	{
		if (_x getVariable Persistent_VehicleIDKey == _id) exitWith { _instance = _x };
	} forEach Persistent_VehiclesToSave;

	_instance;
};

private _vehicleAssignmentId = [_vehicleData, "id"] call F90_fnc_getByKey;
private _roleArray = [_vehicleData, "role"] call F90_fnc_getByKey;

private _vehicleInstance = [_vehicleAssignmentId] call _FindAssignedVehicleInArray;
		
if (!(isNil {_vehicleInstance}) && !(isNil {_roleArray})) then
{
	private _role = _roleArray # 0;

	switch (_role) do
	{
		case "driver":
		{
			_unit moveInDriver _vehicleInstance;
		};
		case "gunner":
		{
			_unit moveInGunner _vehicleInstance;
		};
		case "cargo":
		{
			private _cargoIndex = _roleArray # 1;
			_unit moveInCargo [_vehicleInstance, _cargoIndex];
		};
		case "commander":
		{
			_unit moveInCommander _vehicleInstance;
		};
		case "turret":
		{
			private _turretPath = _roleArray # 2;
			_unit moveInTurret [_vehicleInstance, _turretPath];
		};
	};
};
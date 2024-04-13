/*
    Author: PrinceF90 
    
    Description: 
        This function generates a unique ID for a vehicle and stores it in a persistent array if the vehicle is new. If the vehicle already has an existing ID, it retrieves and returns that ID. 
    
    Parameter(s): 
        0: OBJECT - _vehicle: The vehicle for which the ID will be generated or retrieved. 
    
    Returns: 
        NUMBER - The generated or existing ID for the specified vehicle. 
    
    Examples: 
        // [car1] call F90_fnc_generateVehicleID;
*/

params ["_vehicle"];

private ["_vehicleID"];

[PersistentDebug, "generateVehicleID", format ["Generating ID for vehicle %1...", _vehicle], false] call F90_fnc_debug;

private _vehicleIndex = Persistent_VehiclesToSave find _vehicle;

if (_vehicleIndex == -1) then 
{
    _vehicleID = count Persistent_VehiclesToSave;
    _vehicle setVariable [Persistent_VehicleIDKey, _vehicleID];
    Persistent_VehiclesToSave pushback _vehicle;

    [PersistentDebug, "generateVehicleID", format ["ID for vehicle %1 has been successfully generated.", _vehicle], false] call F90_fnc_debug;
}
else
{
    [PersistentDebug, "generateVehicleID", format ["Vehicle %1 already had an existing ID.", _vehicle], false] call F90_fnc_debug;
	_vehicleID = (Persistent_VehiclesToSave # _vehicleIndex) getVariable Persistent_VehicleIDKey;
};

_vehicleID;
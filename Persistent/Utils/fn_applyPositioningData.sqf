/*
	Author: PrinceF90

    Description:
        This function sets the position above sea level (ATL) and direction of an entity based on the values provided in an array.

    Parameter(s):
        0: OBJECT - The entity for which the position and direction will be set.
        1: ARRAY - An array containing the position ATL at index 0 and direction at index 1.

    Returns:
        None

    Examples:
        // [_car1, [_position, _rotation]] call F90_fnc_applyPositioningData;
*/

params ["_entity", "_array"];

private _posATL = _array # 0;
private _dir = _array # 1;

_entity setPosATL _posATL;
_entity setDir _dir;
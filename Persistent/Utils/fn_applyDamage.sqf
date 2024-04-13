/*
    Author: PrinceF90

    Description:
        This function sets specific hitpoint damages on an entity based on the provided hitpoints array.

    Parameter(s):
        0: OBJECT - The entity on which hitpoint damages will be set.
        1: ARRAY - An array containing hitpoint keys at index 0 and corresponding damage values at index 2.

    Returns:
        None

    Examples:
        // [_car, _hitpointsArray] call F90_fnc_applyDamage;
*/

params ["_entity", "_hitpointsArray"];

{
    private _key = _x;
    private _value = (_hitpointsArray # 2) # _forEachIndex;
    _entity setHitPointDamage [_key, _value];
} forEach (_hitpointsArray # 0);
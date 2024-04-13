/*
	Author: PrinceF90

Description:
    This function deletes all elements in the given array. This function is safer than _array = [];

Parameter(s):
    0: ARRAY - The array from which elements will be deleted.

Returns:
    None

Examples:
    // [_myArray] call F90_fnc_clearArray;
*/
params ["_array"];

private _size = count _array;

for "_i" from (_size -1) to 0 do 
{
	_array deleteAt _i;
};
/*
	Author: PrinceF90

    Description:
        This function searches for a specific key in an array and returns its corresponding value.

    Parameter(s):
        0: ARRAY - The array to search for the key-value pair.
        1: STRING - The key to search for in the array.

    Returns:
        STRING - The value corresponding to the provided key in the array, or an empty string if the key is not found.

    Examples:
        // params ["_myArray", "myKey"];
        // _result = [_myArray, "myKey"] call functionName;
*/

params ["_array", "_key"];

_value = "";

if !(_array isEqualType []) then 
{
    if (_array == " " || _array == "") then 
    {
        _array = [];
    };
};


{
    if (_key == (_x # 0) && !(isNil {_x # 1})) exitWith
    {
        _value = _x # 1;
    };
} forEach _array;

_value;
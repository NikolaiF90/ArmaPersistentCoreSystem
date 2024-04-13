/*
    Author: PrinceF90

    Description:
        A function that manages the persistence of an object by adding it to a persistent array if it is not already present.

    Parameter(s):
        0: OBJECT - The object to be made persistent.
        1: ARRAY - The array containing persistent objects.

    Returns:
        None

    Examples:
        [_container, Persistent_ContainersToSave] call F90_fnc_makePersistent;
*/
params ["_object", "_persistentArray"];

[PersistentDebug, "makePersistent", format ["Trying to make %1 persistent...", _object], true] call F90_fnc_debug;

private _objectID = _persistentArray find _object;

if (_objectID == -1) then 
{
    _persistentArray pushback _object;
    [PersistentDebug, "makePersistent", format ["%1 is now persistent.", _object], true] call F90_fnc_debug;
} else 
{
    [PersistentDebug, "makePersistent", format ["%1 is already persistent.", _object], true] call F90_fnc_debug;
};
/*
    Author: Skhpersist(Original), PrinceF90(Revisited)

    Description:
        This function loads map markers from a specified slot and recreates them on the map.

    Parameter(s):
        0: NUMBER - Slot number from which to load map markers

    Returns:
        None

    Examples:
        // Load map markers from slot 3
        [3] call F90_fnc_loadMapMarkers;
*/

params ["_slot"];

[PersistentDebug, "loadMapMarkers", format ["Loading map markers from slot %1...", _slot], false] call F90_fnc_debug;

private _allMarkers = allMapMarkers;

{
    deleteMarker _x;
} forEach _allMarkers;

private _markers = ["markers", _slot] call F90_fnc_LoadData;

{
    private _name = [_x, "name"] call F90_fnc_getByKey;

    private _alpha = [_x, "alpha"] call F90_fnc_getByKey;
    private _brush = [_x, "brush"] call F90_fnc_getByKey;
    private _color = [_x, "color"] call F90_fnc_getByKey;
    private _dir = [_x, "dir"] call F90_fnc_getByKey;
    private _position = [_x, "position"] call F90_fnc_getByKey;
    private _shape = [_x, "shape"] call F90_fnc_getByKey;
    private _size = [_x, "size"] call F90_fnc_getByKey;
    private _text = [_x, "text"] call F90_fnc_getByKey;
    private _type = [_x, "type"] call F90_fnc_getByKey;
    
    private _marker = createMarker [_name, _position];
    
    _marker setMarkerAlpha _alpha;
    _marker setMarkerBrush _brush;
    _marker setMarkerColor _color;
    _marker setMarkerDir _dir;
    _marker setMarkerShape _shape;
    _marker setMarkerSize _size;
    _marker setMarkerText _text;
    _marker setMarkerType _type;
} forEach _markers;

[PersistentDebug, "loadMapMarkers", "Map markers loaded.", false] call F90_fnc_debug;
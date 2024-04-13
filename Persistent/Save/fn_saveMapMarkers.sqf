/*
	Author: Skhpersist(Original), PrinceF90(Revisited)
 
    Description: 
        This script saves map markers to a specified slot. It retrieves information about existing map markers, and stores them in an array. The array is then passed to a function that saves the data. 
    
    Parameter(s): 
        0: NUMBER - _slot: The slot number where the map markers will be saved. 
    
    Returns: 
        None 
    
    Examples: 
        // Example 1: Saving map markers to slot 1 
        [1] call F90_fnc_saveMapMarkers; 
    
        // Example 2: Saving map markers to slot 2 
        [2] call F90_fnc_saveMapMarkers;
*/

params ["_slot"];

[PersistentDebug, "saveMapMarkers", format["Saving map markers to slot %1.", _slot], false] call F90_fnc_debug;

private _markersArray = [];
private _userMarkersCounter = 1;
private _allMarkers = allMapMarkers;
//  private _allMarkers = allMapMarkers - markersToExclude;

{
    private _marker = [];
    
    private _name = _x;

    if ((_name splitString ' ') # 0 == "_USER_DEFINED") then
    {
        _name = format ["_USER_DEFINED %1_STORED", _userMarkersCounter];
        _userMarkersCounter = _userMarkersCounter + 1;
    };

    _marker pushBack ["name", _name];
    
    _marker pushBack ["alpha", markerAlpha _x];
    _marker pushBack ["brush", markerBrush _x];
    _marker pushBack ["color", markerColor _x];
    _marker pushBack ["dir", markerDir _x];
    _marker pushBack ["position", markerPos _x];
    _marker pushBack ["shape", markerShape _x];
    _marker pushBack ["size", markerSize _x];
    _marker pushBack ["text", markerText _x];
    _marker pushBack ["type", markerType _x];
    
    _markersArray pushBack _marker;
} forEach _allMarkers;

["markers", _markersArray, _slot] call F90_fnc_saveData;
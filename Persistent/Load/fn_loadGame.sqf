/*
	Author: PrinceF90 
 
	Description: 
	    Function to load saved game data and initializing various aspects of the game. It loads data from a specified slot, calls functions to load vehicles, units, player information, map markers, garrison, CDARS data, and other custom data. It also handles the cleanup of dead units, shows a loading screen, and initializes certain game features. 
	
	Parameter(s): 
		0: NUMBER - _slot: The slot number from which to load the game data. 
	
	Returns: 
		None 
	
	Examples: 
		// Example 1: Load game data from slot 1 
		private _slot = 1; 
		[_slot] call F90_fnc_loadGame; 
	
		// Example 2: Load game data from slot 2 
		private _slot = 2; 
		[_slot] call F90_fnc_loadGame;
*/
params ["_slot"];
[PersistentDebug, "loadGame", format ["Loading progress from slot %1...", _slot], false] call F90_fnc_debug;

[_slot] call F90_fnc_clearGarbage;

[_slot] call F90_fnc_loadVehicles;
[_slot] call F90_fnc_loadPlayer;
[_slot] call F90_fnc_loadContainers;
[_slot] call F90_fnc_loadEnvironment;
[_slot] call F90_fnc_loadMapMarkers;
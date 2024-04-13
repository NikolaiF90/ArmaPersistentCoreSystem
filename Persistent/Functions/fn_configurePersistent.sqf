/*
	Author: PrinceF90 
 
	Description: 
		Configuration for ARMAPERSCORE
	
	Parameters: 
		Does not accept any parameters
	
	Returns: 
		0

	Example: 
		[] call F90_fnc_configurePersistent;
*/
PersistentDebug = true; // true to turn on debug
[PersistentDebug, "configurePersistent",format ["Configuring %1...", Scenario_Name], true] call F90_fnc_debug;

Persistent_Host = player; // can be your player name or just player

Persistent_SavePrefix = "F90_ARMAPERSCORE"; // The script will find saves from file by using this prefix
Persistent_SaveIntervals = 600; // This does nothing for now

configurePersistentDone = true; // do not change this
[PersistentDebug, "configurePersistent", format ["Done configuring %1.", Scenario_Name], true] call F90_fnc_debug;
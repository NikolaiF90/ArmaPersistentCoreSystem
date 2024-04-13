params ["_slot"];

[PersistentDebug, "saveGame", format ["Saving progress to slot %1...", _slot], true] call F90_fnc_debug;

[_slot] call F90_fnc_clearSave;

[_slot] call F90_fnc_savePlayer;
[_slot] call F90_fnc_saveVehicles;
[_slot] call F90_fnc_saveContainers;
[_slot] call F90_fnc_saveEnvironment;
[_slot] call F90_fnc_saveMapMarkers;

saveProfileNamespace;
[PersistentDebug, "saveGame", format ["Done saving progress into slot %1", _slot], true] call F90_fnc_debug;
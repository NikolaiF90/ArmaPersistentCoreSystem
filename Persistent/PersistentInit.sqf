[true, "PersistentInit",format ["Starting %1...", Scenario_Name], false] call F90_fnc_debug;
configurePersistentDone = false;
[] call F90_fnc_configurePersistent;
waitUntil {configurePersistentDone};

// Add anything to save here
Persistent_VehiclesToSave = [];
Persistent_ContainersToSave = [];

Persistent_DefaultSlots = ["Empty Slot"];
//Keys
Persistent_PersistentListKey = Scenario_Name + "_PersistentList";
Persistent_VehicleIDKey = "Save_QueueID";

Persistent_Host addAction ["<t color='#0089f2'>Persistent</t>", { [] call F90_fnc_openPersistentTab;}];
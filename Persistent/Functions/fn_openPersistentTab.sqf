[PersistentDebug, "openPersistentTab", format ["%1 opened Persistent Tab.", Persistent_Host], false] call F90_fnc_debug;

createDialog "persistentMenu";

//  Tab ID
PersistentMenu_ListBox = 1102;
PersistentMenu_SaveButton = 1103;
PersistentMenu_LoadButton = 1104;
PersistentMenu_DeleteButton = 1105;
PersistentMenu_ScenarioNameText = 1106;
PersistentMenu_SaveVehicleButton = 1107;

//  Update Scenario Name 
ctrlSetText [PersistentMenu_ScenarioNameText, Scenario_Name];

//  Update List Box
[PersistentMenu_ListBox] call F90_fnc_updatePersistentList;

//  Tab Variables
PersistentMenu_SelectedList = [PersistentMenu_ListBox] call F90_fnc_getSelectedList;
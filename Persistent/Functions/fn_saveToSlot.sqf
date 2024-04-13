/*
    Description:
    This function is responsible for saving data to a specific slot in a persistent list. It generates a save date, creates a save name, and either creates a new save slot or updates an existing one based on user selection. 

    Parameters:
    None

    Returns:
    0

    Example Usage:
    [] call F90_fnc_saveToSlot;
*/

PersistentMenu_SelectedList = [PersistentMenu_ListBox] call F90_fnc_getSelectedList;

[PersistentDebug, "saveToSlot", "Generating save...", false] call F90_fnc_debug;
private _saveDate = [] call F90_fnc_generateSaveDate;
private _saveName = format["%1 saved on, %2", Scenario_Name, _saveDate];
private _saveSlot = 0;

if (PersistentMenu_SelectedList == 0) then 
{
    [PersistentDebug, "saveToSlot", "Creating a new save slot...", false] call F90_fnc_debug;
    Persistent_Slots pushBack _saveName;
    _saveSlot = (count Persistent_Slots) -1;
} else
{
    [PersistentDebug, "saveToSlot", format ["Saving to slot %1", PersistentMenu_SelectedList], false] call F90_fnc_debug;
    Persistent_Slots set [PersistentMenu_SelectedList, _saveName];
    _saveSlot = PersistentMenu_SelectedList;
};

[PersistentDebug, "saveToSlot", "Now saving...", false] call F90_fnc_debug;
[_saveSlot] call F90_fnc_saveGame;
profileNamespace setVariable [Persistent_PersistentListKey, Persistent_Slots];

[PersistentDebug, "saveToSlot", "Progress saved.", false] call F90_fnc_debug;
[PersistentMenu_ListBox] call F90_fnc_updatePersistentList;
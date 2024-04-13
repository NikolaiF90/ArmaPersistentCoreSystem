class F90
{
    class Core 
    {
        file = "Persistent\Core";
        class clearSave {};
        class loadData {};
        class saveData {};
    };

    class Functions
    {
        file = "Persistent\Functions";
        class configurePersistent {};
        class deleteSlot {};
        class generateSaveDate {};
        class getSelectedList {};
        class loadFromSlot {};
        class makePersistent {};
        class openPersistentTab {};
        class saveTarget {};
        class saveTargetContainer {};
        class saveToSlot {};
        class updatePersistentList {};
    };

    class Load
    {
        file = "Persistent\Load";
        class loadContainers {};
        class loadEnvironment {};
        class loadGame {};
        class loadMapMarkers {};
        class loadPlayer {};
        class loadUnitData {};
        class loadUnitsInGroup {};
        class loadVehicles {};
    };

    class Save 
    {
        file = "Persistent\Save";
        class saveContainers {};
        class saveEnvironment {};
        class saveGame {};
        class saveMapMarkers {};
        class savePlayer {};
        class saveVehicles {};
    };

    class Utils
    {
        file = "Persistent\Utils";
        class addUnitToVehicle {};
        class applyCargoData {};
        class applyDamage {};
        class applyPositioningData {};
        class clearArray {};
        class clearGarbage {};
        class debug {};
        class generateCargoData {};
        class generateGroupData {};
        class generatePositioningData {};
        class generateUnitData {};
        class generateVehicleID {};
        class getByKey {};
    };
};
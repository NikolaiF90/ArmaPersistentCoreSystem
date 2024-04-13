/*
    Author: Skhpersist(Original), PrinceF90(Revisited)

    Description:
        This script loads and applies various data to a unit based on the provided unit data, including setting up the unit, assigning roles, setting variables, skills, damage, loadout, and more.

    Parameter(s):
        0: OBJECT - The unit to be configured.
        1: ARRAY - The data containing information about the unit to be configured.
        2: OBJECT (Optional) - The leader unit to join the configured unit to.

    Returns:
        OBJECT - The configured unit after applying all the data.

    Examples:
        [_unit, _unitData, _leader] call F90_fnc_loadUnitData;
    
*/
params ["_unit", "_unitData", "_leader"];

private _CreateUnitIfDoesntExist =
{
    params ["_unit", "_class", "_side"];
    
    if (isNil { _unit }) then
    {
        _unit = (createGroup _side) createUnit [_class, [0, 0, 0], [], 0, "FORM"];
    };
    
    _unit;
};

private _RemoveOtherUnitsFromGroup =
{
    params ["_unit"];
    
    {
        if (_unit != _x) then
        {
            deleteVehicle _x;
        };
    } forEach (units _unit);
};

private _JoinUnitToLeaderIfSpecified =
{
    params ["_unit", "_leader"];
    
    if (!isNil "_leader") then
    {
        [_unit] joinSilent _leader;
    };
};

private _LoadUnitsInGroup =
{
    params ["_leader", "_group"];
    
    {
       [_x, _leader] call F90_fnc_loadUnitsInGroup;
    } forEach _group;
};

private _LoadOrders =
{
    params ["_unit", "_ordersArray"];

    private _behaviour = [_ordersArray, "behaviour"] call F90_fnc_getByKey;
    private _unitPos = [_ordersArray, "unitPos"] call F90_fnc_getByKey;

    _unit setBehaviour _behaviour;
    _unit setUnitPos _unitPos;
};

private _LoadGroupOrders =
{
    params ["_unit", "_groupOrdersArray"];

    private _group = group _unit;

    if (leader _group == _unit) then 
    {
        private _combatMode = [_groupOrdersArray, "combatMode"] call F90_fnc_getByKey;
        private _formation = [_groupOrdersArray, "formation"] call F90_fnc_getByKey;
        private _speedMode = [_groupOrdersArray, "speedMode"] call F90_fnc_getByKey;

        _group setCombatMode _combatMode;
        _group setFormation _formation;
        _group setSpeedMode _speedMode;
    };
};

private _LoadVariables =
{
    params ["_unit", "_variablesArray"];

    {
        _unit setVariable [_x, nil];
    } forEach (allVariables _unit);

    {
        private _key = _x # 0;
        private _value = _x # 1;

        if(isNil "_value") then 
        {
            _unit setVariable [_key, nil];
        }else
        {
            _unit setVariable [_key, _value];
        };
    } forEach _variablesArray;
};

private _LoadSkills =
{
    params ["_unit", "_skillsArray"];

    {
        _unit setSkill [_x # 0, _x # 1];
    } forEach _skillsArray;
};

[PersistentDebug, "loadUnitData", format ["Loading unit data for unit %1.", _unit], false] call F90_fnc_debug;

private _class = [_unitData, "class"] call F90_fnc_getByKey;
private _side = [_unitData, "side"] call F90_fnc_getByKey;
private _group = [_unitData, "group"] call F90_fnc_getByKey;
private _orders = [_unitData, "orders"] call F90_fnc_getByKey;
private _groupOrders = [_unitData, "groupOrders"] call F90_fnc_getByKey;
private _generalDamage = [_unitData, "generalDamage"] call F90_fnc_getByKey;
private _damages = [_unitData, "damages"] call F90_fnc_getByKey;
private _posRotation = [_unitData, "posRotation"] call F90_fnc_getByKey;
private _skills = [_unitData, "skills"] call F90_fnc_getByKey;
private _name = [_unitData, "name"] call F90_fnc_getByKey;
private _face = [_unitData, "face"] call F90_fnc_getByKey;
private _speaker = [_unitData, "speaker"] call F90_fnc_getByKey;
private _pitch = [_unitData, "pitch"] call F90_fnc_getByKey;
private _rating = [_unitData, "rating"] call F90_fnc_getByKey;
private _stamina = [_unitData, "stamina"] call F90_fnc_getByKey;
private _fatigue = [_unitData, "fatigue"] call F90_fnc_getByKey;
private _formationDir = [_unitData, "formationDir"] call F90_fnc_getByKey;
private _variables = [_unitData, "variables"] call F90_fnc_getByKey;
private _vehicle = [_unitData, "vehicle"] call F90_fnc_getByKey;
private _assignedTeam = [_unitData, "assignedTeam"] call F90_fnc_getByKey;
        
_unit = [_unit, _class, _side] call _CreateUnitIfDoesntExist;
_unit setVariable ["BIS_enableRandomization", false];

[_unit] call _RemoveOtherUnitsFromGroup;
[_unit, _leader] call _JoinUnitToLeaderIfSpecified;
[_unit, _group] call _LoadUnitsInGroup;
[_unit, _orders] call _LoadOrders;
[_unit, _groupOrders] call _LoadGroupOrders;
[_unit, _variables] call _LoadVariables;
[_unit, _skills] call _LoadSkills;

_unit setDamage _generalDamage;
[_unit, _damages] call F90_fnc_applyDamage;
[_unit, _posRotation] call F90_fnc_applyPositioningData;

_unit setFatigue _fatigue;
_unit setFormDir _formationDir;
_unit setStamina _stamina;
_unit assignTeam _assignedTeam;

if (rating _unit > _rating) then
{
    _unit addRating -(rating _unit - _rating);
}
else
{
    _unit addRating (_rating - rating _unit);
};

[_unit, _vehicle] spawn F90_fnc_addUnitToVehicle;

[_unit, _unitData] spawn {
    params ["_unit", "_unitData"];

    private _RestoreUnitsName =
    {
        params ["_unit", "_nameArray"];
        
        private _firstName = "";
        private _surname = "";
        private _joinedNames = "";
        
        if (count _nameArray == 1) then
        {
            _surname = _nameArray # 0;
            _joinedNames = _surname;
        }
        else
        {
            _firstName = _nameArray # 0;
            _surname = _nameArray # 1;
            _joinedNames = format ["%1 %2", _firstName, _surname];
        };
        
        _unit setName [_joinedNames, _firstName, _surname];
    };
    
    private _name = [_unitData, "name"] call F90_fnc_getByKey;
    private _face = [_unitData, "face"] call F90_fnc_getByKey;
    private _speaker = [_unitData, "speaker"] call F90_fnc_getByKey;
    private _pitch = [_unitData, "pitch"] call F90_fnc_getByKey;
    private _loadout = [_unitData, "loadout"] call F90_fnc_getByKey;
    
    [_unit, _name] call _RestoreUnitsName;
    
    _unit setFace _face;
    _unit setSpeaker _speaker;
    _unit setPitch _pitch;
    _unit setUnitLoadout _loadout; // goggles weren't restored correctly when outside spawn
};

_unit;
/*
	Generate a string Date and Time using format [hh:mm dd/mm/yy]
	returns string Date and Time 
*/

[PersistentDebug, "generateSaveDate", "Generating date and time string...", false] call F90_fnc_debug;

private _returnData = "";
private _time = systemTime;
private _hour = _time # 3;
private _minute = _time # 4;
private _day = _time # 2;
private _month = _time # 1;
private _year = _time # 0;

private _string = format ["%1:%2 %3/%4/%5",_hour,_minute,_day,_month,_year];

AWSP_Savetime = _string;
_returnData = _string;

[PersistentDebug, "generateSaveDate", "Date and time string generated.", false] call F90_fnc_debug;

_returnData;

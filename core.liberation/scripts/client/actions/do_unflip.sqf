params ["_vehicle"];
if (isNil "_vehicle") exitWith {};

if (true) then {
	if (isPlayer _vehicle) exitWith {hint "Not Empty!";};
	_vehicle allowDamage false;
	sleep 0.2;
	_vehicle setpos [(getposATL _vehicle) select 0,(getposATL _vehicle) select 1, 0.5];
	_vehicle setVectorUp surfaceNormal position _vehicle;
	sleep 4;
	_vehicle allowDamage true;
};

if ( isDedicated ) exitWith {};

params [ "_notiftype", [ "_obj_position", getpos player ] ];

if ( _notiftype == 0 ) then {
	[ "lib_intel_prisoner" ] call BIS_fnc_showNotification;
};

if ( _notiftype == 1 ) then {
	[ "lib_intel_document" ] call BIS_fnc_showNotification;
};

if ( _notiftype == 2 ) then {
	waitUntil {sleep 1; !isNil "secondary_objective_position_marker" };
	waitUntil {sleep 1; count secondary_objective_position_marker > 0 };
	waitUntil {sleep 1; secondary_objective_position_marker distance zeropos > 1000 };
	[ "lib_intel_fob", [ markertext ( [ 10000, secondary_objective_position_marker ] call F_getNearestSector ) ] ] call BIS_fnc_showNotification;
	_secondary_marker = createMarker ["secondarymarker", secondary_objective_position_marker];
	_secondary_marker setMarkerColor GRLIB_color_enemy_bright;
	_secondary_marker setMarkerType "hd_unknown";

	_secondary_marker_zone = createMarker ["secondarymarkerzone", secondary_objective_position_marker];
	_secondary_marker_zone setMarkerColor GRLIB_color_enemy_bright;
	_secondary_marker_zone setMarkerShape "ELLIPSE";
	_secondary_marker_zone setMarkerBrush "FDiagonal";
	_secondary_marker_zone setMarkerSize [1500,1500];
};

if ( _notiftype == 3 ) then {
	[ "lib_secondary_fob_destroyed" ] call BIS_fnc_showNotification;
	deleteMarker "secondarymarker";
	deleteMarker "secondarymarkerzone";
	secondary_objective_position_marker = [];
};

if ( _notiftype == 4 ) then {
	[ "lib_intel_convoy", [ markertext ( [ 10000, _obj_position ] call F_getNearestSector ) ] ] call BIS_fnc_showNotification;
};

if ( _notiftype == 5 ) then {
	[ "lib_secondary_convoy_destroyed" ] call BIS_fnc_showNotification;
};

if ( _notiftype == 6 ) then {
	waitUntil {sleep 1; !isNil "secondary_objective_position_marker" };
	waitUntil {sleep 1; count secondary_objective_position_marker > 0 };
	waitUntil {sleep 1; secondary_objective_position_marker distance zeropos > 1000 };
	[ "lib_intel_sar", [ markertext ( [ 10000, secondary_objective_position_marker ] call F_getNearestSector ) ] ] call BIS_fnc_showNotification;
	_secondary_marker = createMarker ["secondarymarker", secondary_objective_position_marker];
	_secondary_marker setMarkerColor GRLIB_color_enemy_bright;
	_secondary_marker setMarkerType "hd_unknown";

	_secondary_marker_zone = createMarker ["secondarymarkerzone", secondary_objective_position_marker];
	_secondary_marker_zone setMarkerColor GRLIB_color_enemy_bright;
	_secondary_marker_zone setMarkerShape "ELLIPSE";
	_secondary_marker_zone setMarkerBrush "FDiagonal";
	_secondary_marker_zone setMarkerSize [1500,1500];
};

if (_notiftype == 7 || _notiftype == 8) then {
	if ( _notiftype == 7 ) then {
		[ "lib_intel_sar_failed" ] call BIS_fnc_showNotification;
	};
	if ( _notiftype == 8 ) then {
		[ "lib_intel_sar_succeeded" ] call BIS_fnc_showNotification;
	};
	deleteMarker "secondarymarker";
	deleteMarker "secondarymarkerzone";
	secondary_objective_position_marker = [];
};